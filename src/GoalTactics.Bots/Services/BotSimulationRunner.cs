using GoalTactics.Application.Mechanics;
using GoalTactics.Bots.Config;
using GoalTactics.Bots.Models;
using GoalTactics.Bots.Runtime;

namespace GoalTactics.Bots.Services;

public sealed class BotSimulationRunner(
    BotOptions options,
    SimulationOptions simulationOptions,
    BotRegistry registry,
    BotWorldClock clock,
    BotActionScheduler scheduler,
    BotActionExecutor executor,
    BotMetricsCollector metricsCollector,
    BotPlayerCareerTracker playerCareerTracker,
    BotTeamSeasonTracker teamSeasonTracker,
    BotLogWriter logWriter)
{
    public async Task RunAsync(CancellationToken cancellationToken)
    {
        ValidateScheduleOrThrow();

        // expected population: TeamsPerLeague * (1 + 5 + 15) per requested league structure
        var expectedBotCount = options.TeamsPerLeague * (1 + 5 + 15);
        var botCount = options.BotCount == expectedBotCount ? options.BotCount : expectedBotCount;
        var bots = registry.CreatePopulation(botCount);

        await logWriter.WriteAsync("simulation-events.log", $"{clock.CurrentUtc:O}|bootstrap|bots={bots.Count}|tiers=1/2/3 groups");

        for (var season = 1; season <= options.Seasons; season++)
        {
            var report = metricsCollector.StartSeason(season);
            playerCareerTracker.StartSeason(season);
            ResetSeasonFlowCounters(bots);
            ResetSeasonSportCounters(bots);
            InitializeSeasonSponsors(bots, report, clock.CurrentUtc);
            await RunSeasonAsync(bots, report, cancellationToken);

            ApplySeasonInfrastructureInvestments(bots);

            var seasonTransfers = metricsCollector
                .GetCompletedTransfers()
                .Where(x => x.Season == season)
                .ToArray();
            playerCareerTracker.TrySellPlayers(season, seasonTransfers);
            playerCareerTracker.AdvanceSeason(season);
            teamSeasonTracker.CaptureSeason(season, bots);

            // apply promotion/relegation after season capture (adjusts Tier/LeagueGroup/Position)
            ApplyPromotionRelegation(bots);

            var snapshotLine = $"{clock.CurrentUtc:O}|season-end|season={season}|matches={report.MatchesPlayed}|goals={report.TotalGoals}|bids={report.AuctionBids}|ads={report.AdsWatched}|chat={report.ChatMessages}";
            await logWriter.WriteAsync("season-summary.log", snapshotLine);
        }

        await metricsCollector.WriteAsync(options.LogRootPath);
        await playerCareerTracker.WriteAsync(options.LogRootPath);
        await teamSeasonTracker.WriteAsync(options.LogRootPath);
    }

    private async Task RunSeasonAsync(IReadOnlyList<BotClubProfile> bots, BotSeasonReport report, CancellationToken cancellationToken)
    {
        for (var matchday = 1; matchday <= simulationOptions.MatchdaysPerSeason; matchday++)
        {
            await logWriter.WriteAsync("simulation-events.log", $"{clock.CurrentUtc:O}|matchday-start|season={clock.CurrentSeason}|matchday={matchday}");
            ApplyDailySponsorPayouts(bots, report, clock.CurrentUtc.Date);
            ApplyDailyCampBookings(bots, report, clock.CurrentUtc);

            if ((matchday - 1) % 7 == 0)
            {
                ApplyWeeklyIndividualTrainingCosts(bots);
            }

            // Training at fixed UTC 08:00.
            clock.AdvanceToDailyTime(options.TrainingTickUtc);
            await ExecuteBotLoopAsync(bots, report, hasTrainingTick: true, hasLeagueMatch: false, hasFriendlyMatch: false, cancellationToken);
            playerCareerTracker.ApplyDailyTraining(clock.CurrentUtc, bots);

            // Friendlies at fixed UTC 13:00.
            clock.AdvanceToDailyTime(options.FriendlyKickoffUtc);
            await ExecuteBotLoopAsync(bots, report, hasTrainingTick: false, hasLeagueMatch: false, hasFriendlyMatch: true, cancellationToken);

            // League at fixed UTC 18:00.
            clock.AdvanceToDailyTime(options.LeagueKickoffUtc);
            await ExecuteBotLoopAsync(bots, report, hasTrainingTick: false, hasLeagueMatch: true, hasFriendlyMatch: false, cancellationToken);

            await ResolveLeagueMatchesAsync(bots, report);
            ApplyDailyStadiumIncome(bots, DateOnly.FromDateTime(clock.CurrentUtc));
            ApplyDailyConstructionProgress(bots);
            clock.AdvanceDay();
            clock.AdvanceMatchday();

            foreach (var bot in bots)
            {
                bot.AdsWatchedToday = 0;
            }
        }
    }

    private void InitializeSeasonSponsors(IReadOnlyList<BotClubProfile> bots, BotSeasonReport report, DateTime nowUtc)
    {
        foreach (var bot in bots)
        {
            if (bot.SeasonSponsorSignedForSeason != report.SeasonNumber)
            {
                bot.SeasonSponsorSignedForSeason = report.SeasonNumber;
                report.SeasonSponsorsSigned++;
            }

            if (!bot.ShortSponsorActiveUntilUtc.HasValue || bot.ShortSponsorActiveUntilUtc.Value <= nowUtc)
            {
                bot.ShortSponsorActiveUntilUtc = nowUtc.AddDays(options.ShortSponsorRenewDays);
                report.ShortSponsorsRenewed++;
            }
        }
    }

    private void ApplyDailySponsorPayouts(IReadOnlyList<BotClubProfile> bots, BotSeasonReport report, DateTime day)
    {
        var payoutDay = DateOnly.FromDateTime(day);
        foreach (var bot in bots)
        {
            if (bot.SeasonSponsorSignedForSeason == report.SeasonNumber && bot.SeasonSponsorLastPayoutDate != payoutDay)
            {
                bot.Stars += options.SeasonSponsorStarsPerDay;
                report.StarsEarned += options.SeasonSponsorStarsPerDay;
                bot.StarsInSeason += options.SeasonSponsorStarsPerDay;
                bot.SeasonSponsorLastPayoutDate = payoutDay;
            }

            if (bot.ShortSponsorActiveUntilUtc.HasValue && bot.ShortSponsorActiveUntilUtc.Value.Date >= day && bot.ShortSponsorLastPayoutDate != payoutDay)
            {
                bot.Stars += options.ShortSponsorStarsPerDay;
                report.StarsEarned += options.ShortSponsorStarsPerDay;
                bot.StarsInSeason += options.ShortSponsorStarsPerDay;
                bot.ShortSponsorLastPayoutDate = payoutDay;
            }
        }
    }

    private void ApplyDailyConstructionProgress(IReadOnlyList<BotClubProfile> bots)
    {
        // reduce remaining minutes by one simulated day (24h)
        var minutesPerDay = 24 * 60;
        foreach (var bot in bots)
        {
            if (bot.BuildQueue.Count == 0) continue;

            for (var i = bot.BuildQueue.Count - 1; i >= 0; i--)
            {
                var task = bot.BuildQueue[i];
                task.RemainingMinutes -= minutesPerDay;
                if (task.RemainingMinutes <= 0)
                {
                    // apply completed task
                    switch (task.Type)
                    {
                        case BuildTaskType.VipSeatsBulk:
                            bot.VipSeats += task.Count;
                            break;
                        case BuildTaskType.SitSeatsBulk:
                            bot.SitSeats += task.Count;
                            break;
                        case BuildTaskType.StandSeatsBulk:
                            bot.StandSeats += task.Count;
                            break;
                        case BuildTaskType.OfficeUpgrade:
                            bot.OfficeLevel = Math.Min(20, task.TargetLevel);
                            break;
                        case BuildTaskType.TrainingCenterUpgrade:
                            bot.TrainingCenterLevel = Math.Min(20, task.TargetLevel);
                            break;
                        case BuildTaskType.FanShopUpgrade:
                            bot.FanShopLevel = Math.Min(20, task.TargetLevel);
                            break;
                        case BuildTaskType.ParkingUpgrade:
                            bot.ParkingLevel = Math.Min(20, task.TargetLevel);
                            break;
                    }

                    bot.BuildQueue.RemoveAt(i);
                }
            }
        }
    }

    private void ApplyWeeklyIndividualTrainingCosts(IReadOnlyList<BotClubProfile> bots)
    {
        var counts = playerCareerTracker.GetWeeklyIndividualTrainingPlayerCounts();
        if (counts.Count == 0)
        {
            return;
        }

        var byPersona = bots
            .GroupBy(x => x.Persona)
            .ToDictionary(g => g.Key, g => g.OrderByDescending(x => x.Stars).First(), StringComparer.Ordinal);

        foreach (var kvp in counts)
        {
            if (!byPersona.TryGetValue(kvp.Key, out var bot))
            {
                continue;
            }

            var total = options.IndividualTrainingStarsPerWeek * kvp.Value;
            if (bot.Stars < total)
            {
                continue;
            }

            bot.Stars -= total;
            bot.StarsOutSeason += total;
            metricsCollector.RecordSpend(bot.Persona, "stars", "training.individual.weekly", total);
        }
    }

    private void ApplyDailyCampBookings(IReadOnlyList<BotClubProfile> bots, BotSeasonReport report, DateTime nowUtc)
    {
        foreach (var bot in bots)
        {
            if (bot.CampActiveUntilUtc.HasValue && bot.CampActiveUntilUtc.Value >= nowUtc)
            {
                continue;
            }

            var random = new Random(HashCode.Combine(bot.Seed, nowUtc.DayOfYear, nowUtc.Year));
            if (random.NextDouble() > 0.06)
            {
                continue;
            }

            if (bot.Money >= options.CampMoneyCost && random.NextDouble() < 0.55)
            {
                bot.Money -= options.CampMoneyCost;
                bot.MoneyOutSeason += options.CampMoneyCost;
                metricsCollector.RecordSpend(bot.Persona, "money", "training.camp.booking", options.CampMoneyCost);
            }
            else if (bot.Stars >= options.CampStarsCost)
            {
                bot.Stars -= options.CampStarsCost;
                bot.StarsOutSeason += options.CampStarsCost;
                report.StarsSpent += options.CampStarsCost;
                metricsCollector.RecordSpend(bot.Persona, "stars", "training.camp.booking", options.CampStarsCost);
            }
            else
            {
                continue;
            }

            bot.CampPower = options.CampSpecBoostPerDay;
            bot.CampActiveUntilUtc = nowUtc.AddDays(options.CampDurationDays);
        }
    }

    private static void ResetSeasonFlowCounters(IReadOnlyList<BotClubProfile> bots)
    {
        foreach (var bot in bots)
        {
            bot.MoneyInSeason = 0m;
            bot.MoneyOutSeason = 0m;
            bot.StarsInSeason = 0m;
            bot.StarsOutSeason = 0m;
        }
    }

    private static void ResetSeasonSportCounters(IReadOnlyList<BotClubProfile> bots)
    {
        foreach (var bot in bots)
        {
            bot.SeasonWins = 0;
            bot.SeasonLosses = 0;
            bot.SeasonDraws = 0;
        }
    }

    private void ApplySeasonInfrastructureInvestments(IReadOnlyList<BotClubProfile> bots)
    {
        foreach (var bot in bots)
        {
            var random = new Random(HashCode.Combine(bot.Seed, clock.CurrentSeason, bot.StadiumLevel, bot.TrainingCenterLevel, bot.OfficeLevel));

            if (bot.OfficeLevel < 20 && bot.Money > 300_000m && random.NextDouble() < 0.55)
            {
                var officeCost = 70_000m + (25_000m * bot.OfficeLevel);
                if (bot.Money >= officeCost)
                {
                    bot.Money -= officeCost;
                    bot.MoneyOutSeason += officeCost;
                    metricsCollector.RecordSpend(bot.Persona, "money", "infrastructure.office", officeCost);
                    bot.OfficeLevel++;
                }
            }

            // Stadium: build seat bulks instead of a stadium level.
            if (bot.Money > 50_000m && random.NextDouble() < 0.60)
            {
                // choose bulk: priority standing, sitting, vip
                var pick = random.NextDouble();
                if (pick < 0.55)
                {
                    // 100 standing seats
                    var cost = 15_000m;
                    if (bot.Money >= cost)
                    {
                        bot.Money -= cost;
                        bot.MoneyOutSeason += cost;
                        metricsCollector.RecordSpend(bot.Persona, "money", "infrastructure.stand_seats", cost);
                        bot.BuildQueue.Add(new BuildTask { Type = BuildTaskType.StandSeatsBulk, Count = 100, RemainingMinutes = 100 });
                    }
                }
                else if (pick < 0.90)
                {
                    // 100 sitting seats
                    var cost = 30_000m;
                    if (bot.Money >= cost)
                    {
                        bot.Money -= cost;
                        bot.MoneyOutSeason += cost;
                        metricsCollector.RecordSpend(bot.Persona, "money", "infrastructure.sit_seats", cost);
                        bot.BuildQueue.Add(new BuildTask { Type = BuildTaskType.SitSeatsBulk, Count = 100, RemainingMinutes = 140 });
                    }
                }
                else
                {
                    // 10 vip seats
                    var cost = 40_000m;
                    if (bot.Money >= cost)
                    {
                        bot.Money -= cost;
                        bot.MoneyOutSeason += cost;
                        metricsCollector.RecordSpend(bot.Persona, "money", "infrastructure.vip_seats", cost);
                        bot.BuildQueue.Add(new BuildTask { Type = BuildTaskType.VipSeatsBulk, Count = 10, RemainingMinutes = 50 });
                    }
                }
            }

            if (bot.TrainingCenterLevel < 20 && bot.OfficeLevel >= (bot.TrainingCenterLevel + 1) && bot.Stars > 2_500m && random.NextDouble() < 0.70)
            {
                var nextLevel = bot.TrainingCenterLevel + 1;
                var starsCost = 1_200m + (180m * bot.TrainingCenterLevel);
                if (bot.Stars >= starsCost)
                {
                    bot.Stars -= starsCost;
                    bot.StarsOutSeason += starsCost;
                    metricsCollector.RecordSpend(bot.Persona, "stars", "infrastructure.training_center.queued", starsCost);
                    // compute linear time (minutes) for L->L+1: L=0->1 =>30min, L=19->20 =>3000min
                    var minMinutes = 30.0;
                    var maxMinutes = 3000.0; // 50 hours
                    var minutes = (int)Math.Round(minMinutes + (bot.TrainingCenterLevel) * ((maxMinutes - minMinutes) / 19.0));
                    bot.BuildQueue.Add(new BuildTask { Type = BuildTaskType.TrainingCenterUpgrade, TargetLevel = nextLevel, RemainingMinutes = minutes });
                }
            }

            if (bot.FanShopLevel < 20 && bot.OfficeLevel >= (bot.FanShopLevel + 1) && bot.Money > 200_000m && random.NextDouble() < 0.45)
            {
                var nextLevel = bot.FanShopLevel + 1;
                var fanShopCost = 55_000m + (18_000m * bot.FanShopLevel);
                if (bot.Money >= fanShopCost)
                {
                    bot.Money -= fanShopCost;
                    bot.MoneyOutSeason += fanShopCost;
                    metricsCollector.RecordSpend(bot.Persona, "money", "infrastructure.fan_shop.queued", fanShopCost);
                    var minMinutes = 30.0;
                    var maxMinutes = 3000.0;
                    var minutes = (int)Math.Round(minMinutes + (bot.FanShopLevel) * ((maxMinutes - minMinutes) / 19.0));
                    bot.BuildQueue.Add(new BuildTask { Type = BuildTaskType.FanShopUpgrade, TargetLevel = nextLevel, RemainingMinutes = minutes });
                }
            }

            if (bot.ParkingLevel < 20 && bot.OfficeLevel >= (bot.ParkingLevel + 1) && bot.Money > 180_000m && random.NextDouble() < 0.40)
            {
                var nextLevel = bot.ParkingLevel + 1;
                var parkingCost = 45_000m + (14_000m * bot.ParkingLevel);
                if (bot.Money >= parkingCost)
                {
                    bot.Money -= parkingCost;
                    bot.MoneyOutSeason += parkingCost;
                    metricsCollector.RecordSpend(bot.Persona, "money", "infrastructure.parking.queued", parkingCost);
                    var minMinutes = 30.0;
                    var maxMinutes = 3000.0;
                    var minutes = (int)Math.Round(minMinutes + (bot.ParkingLevel) * ((maxMinutes - minMinutes) / 19.0));
                    bot.BuildQueue.Add(new BuildTask { Type = BuildTaskType.ParkingUpgrade, TargetLevel = nextLevel, RemainingMinutes = minutes });
                }
            }
        }
    }

    private void ApplyDailyStadiumIncome(IReadOnlyList<BotClubProfile> bots, DateOnly day)
    {
        foreach (var bot in bots)
        {
            var ticket = GetTicketPricesByTier(bot.Tier);
            var seatCaps = GetSeatCapsByTier(bot.Tier);

            var vipSeats = Math.Min(seatCaps.MaxVipSeats, bot.VipSeats);
            var sitSeats = Math.Min(seatCaps.MaxSitSeats, bot.SitSeats);

            // Standing seats are theoretically uncapped, but attendance is demand-limited.
            var standBuilt = bot.StandSeats;
            var standingDemandCap = GetStandingDemandCap(bot.Tier, bot.SeasonWins, bot.SeasonLosses);
            var standSold = Math.Min(standBuilt, standingDemandCap);

            var gross =
                (vipSeats * ticket.Vip) +
                (sitSeats * ticket.Sit) +
                (standSold * ticket.Stand);

            // Facility bonuses and running costs make other buildings economically relevant.
            var facilityBonus = (bot.FanShopLevel * 450m) + (bot.ParkingLevel * 300m);
            var facilityCost = (bot.OfficeLevel * 250m) + (bot.FanShopLevel * 180m) + (bot.ParkingLevel * 150m);
            var net = Math.Max(0m, gross + facilityBonus - facilityCost);

            bot.Money += net;
            bot.MoneyInSeason += net;
        }
    }

    private async Task ExecuteBotLoopAsync(
        IReadOnlyList<BotClubProfile> bots,
        BotSeasonReport report,
        bool hasTrainingTick,
        bool hasLeagueMatch,
        bool hasFriendlyMatch,
        CancellationToken cancellationToken)
    {
        foreach (var bot in bots)
        {
            bot.SessionActionsToday = 0;
            var random = new Random(HashCode.Combine(bot.Seed, clock.CurrentUtc.DayOfYear, clock.CurrentUtc.Hour));
            var auctionSoon = random.NextDouble() < 0.12 || (bot.Persona == "AggressiveTraderBot" && random.NextDouble() < 0.25);

            var perception = new BotPerceptionSnapshot
            {
                BotId = bot.BotId,
                TimestampUtc = clock.CurrentUtc,
                HasTrainingTickDue = hasTrainingTick,
                HasUpcomingLeagueMatch = hasLeagueMatch,
                HasUpcomingFriendly = options.EnableFriendlies && hasFriendlyMatch,
                HasAuctionExpiringSoon = auctionSoon,
                Money = bot.Money,
                Stars = bot.Stars,
                SquadHealthRisk = random.Next(0, 40),
                ContractRisk = random.Next(0, 30)
            };

            var intents = scheduler.BuildIntents(bot, perception, clock.CurrentUtc);
            foreach (var intent in intents.Take(options.MaxActionsPerSession))
            {
                await executor.ExecuteAsync(bot, intent, clock.CurrentUtc, report, logWriter, cancellationToken);
            }
        }
    }

    private async Task ResolveLeagueMatchesAsync(IReadOnlyList<BotClubProfile> bots, BotSeasonReport report)
    {
        var ordered = bots.OrderBy(x => x.Tier).ThenBy(x => x.LeagueGroup).ThenBy(x => x.Position).ToArray();
        for (var i = 0; i + 1 < ordered.Length; i += 2)
        {
            var home = ordered[i];
            var away = ordered[i + 1];
            var random = new Random(HashCode.Combine(home.Seed, away.Seed, clock.CurrentUtc.DayOfYear));

            // Compute strength from per-player stats when available
            var homeStrength = home.Players.Count > 0
                ? (int)Math.Round(home.Players.Average(p => (double)p.Strength) * AverageFitnessFactor(home.Players))
                : home.Strength;
            var awayStrength = away.Players.Count > 0
                ? (int)Math.Round(away.Players.Average(p => (double)p.Strength) * AverageFitnessFactor(away.Players))
                : away.Strength;

            var homeScore = Math.Max(0, random.Next(0, 3) + (homeStrength - awayStrength) / 25);
            var awayScore = Math.Max(0, random.Next(0, 3) + (awayStrength - homeStrength) / 25);

            report.MatchesPlayed++;
            report.TotalGoals += homeScore + awayScore;

            if (homeScore > awayScore)
            {
                report.HomeWins++;
                home.SeasonWins++;
                away.SeasonLosses++;
            }
            else if (awayScore > homeScore)
            {
                report.AwayWins++;
                away.SeasonWins++;
                home.SeasonLosses++;
            }
            else
            {
                report.Draws++;
                home.SeasonDraws++;
                away.SeasonDraws++;
            }

            await logWriter.WriteAsync("simulation-events.log", $"{clock.CurrentUtc:O}|league.match|home={home.TeamName}|away={away.TeamName}|score={homeScore}:{awayScore}|tier={home.Tier}|h_str={homeStrength}|a_str={awayStrength}");
        }
    }

    private static double AverageFitnessFactor(List<BotPlayer> players)
    {
        if (players.Count == 0) return 1.0;
        var avg = (int)Math.Round(players.Average(p => (double)p.Fitness));
        return TeamStrengthCalculator.ComputeFitnessFactor(avg);
    }

    private static (int Vip, int Sit, int Stand) GetTicketPricesByTier(int tier)
    {
        return tier switch
        {
            1 => (436, 34, 17),
            2 => (343, 27, 13),
            3 => (269, 21, 10),
            _ => (212, 16, 8)
        };
    }

    private static (int MaxVipSeats, int MaxSitSeats) GetSeatCapsByTier(int tier)
    {
        return tier switch
        {
            1 => (2800, 35000),
            2 => (2300, 28500),
            3 => (1900, 24000),
            _ => (1700, 20000)
        };
    }

    private static int GetStandingDemandCap(int tier, int wins, int losses)
    {
        var baseline = tier switch
        {
            1 => 60_000,
            2 => 48_000,
            3 => 38_000,
            _ => 30_000
        };

        var formModifier = Math.Clamp((wins - losses) * 750, -12_000, 18_000);
        return Math.Max(5_000, baseline + formModifier);
    }

    private void ValidateScheduleOrThrow()
    {
        if (options.LeagueKickoffUtc != new TimeOnly(18, 0))
        {
            throw new InvalidOperationException("League kickoff must be 18:00 UTC for this simulation run.");
        }

        if (options.FriendlyKickoffUtc != new TimeOnly(13, 0))
        {
            throw new InvalidOperationException("Friendly kickoff must be 13:00 UTC for this simulation run.");
        }

        if (options.TrainingTickUtc != new TimeOnly(8, 0))
        {
            throw new InvalidOperationException("Training tick must be 08:00 UTC for this simulation run.");
        }
    }

    private void ApplyPromotionRelegation(IReadOnlyList<BotClubProfile> bots)
    {
        var teamsPerLeague = options.TeamsPerLeague;

        static int Points(BotClubProfile b) => (b.SeasonWins * 3) + b.SeasonDraws;
        // Snapshot standings before any mutations to avoid interference between steps
        var tier1Standings = bots
            .Where(b => b.Tier == 1 && b.LeagueGroup == 1)
            .OrderByDescending(b => Points(b))
            .ThenByDescending(b => b.SeasonWins)
            .ThenByDescending(b => b.Strength)
            .ThenBy(b => b.TeamName, StringComparer.Ordinal)
            .ToList();

        var tier2Standings = new Dictionary<int, List<BotClubProfile>>();
        for (var g = 1; g <= 5; g++)
        {
            tier2Standings[g] = bots
                .Where(b => b.Tier == 2 && b.LeagueGroup == g)
                .OrderByDescending(b => Points(b))
                .ThenByDescending(b => b.SeasonWins)
                .ThenByDescending(b => b.Strength)
                .ThenBy(b => b.TeamName, StringComparer.Ordinal)
                .ToList();
        }

        var tier3Standings = new Dictionary<int, List<BotClubProfile>>();
        for (var g = 1; g <= 15; g++)
        {
            tier3Standings[g] = bots
                .Where(b => b.Tier == 3 && b.LeagueGroup == g)
                .OrderByDescending(b => Points(b))
                .ThenByDescending(b => b.SeasonWins)
                .ThenByDescending(b => b.Strength)
                .ThenBy(b => b.TeamName, StringComparer.Ordinal)
                .ToList();
        }

        // Determine moves from snapshots
        var relegatedFromTier1 = new List<BotClubProfile>();
        if (tier1Standings.Count == teamsPerLeague)
        {
            relegatedFromTier1.AddRange(tier1Standings.Skip(teamsPerLeague - 5).Take(5));
        }

        var promotedFromTier2 = new List<BotClubProfile>();
        var relegatedFromTier2 = new List<BotClubProfile>();
        for (var g = 1; g <= 5; g++)
        {
            var s = tier2Standings[g];
            if (s.Count != teamsPerLeague) continue;
            promotedFromTier2.Add(s[0]);
            relegatedFromTier2.AddRange(s.Skip(teamsPerLeague - 6).Take(6));
        }

        var promotedFromTier3 = new List<BotClubProfile>();
        for (var g = 1; g <= 15; g++)
        {
            var s = tier3Standings[g];
            if (s.Count != teamsPerLeague) continue;
            promotedFromTier3.AddRange(s.Take(2));
        }

        // Apply promotions first (tier2 -> tier1, tier3 -> tier2)
        foreach (var p in promotedFromTier2)
        {
            p.Tier = 1;
            p.LeagueGroup = 1;
        }

        for (var i = 0; i < promotedFromTier3.Count; i++)
        {
            var t = promotedFromTier3[i];
            var group = 1 + (i / 6);
            t.Tier = 2;
            t.LeagueGroup = group;
        }

        // Then apply relegations (tier1 -> tier2, tier2 -> tier3)
        for (var i = 0; i < relegatedFromTier1.Count; i++)
        {
            var t = relegatedFromTier1[i];
            t.Tier = 2;
            t.LeagueGroup = 1 + i; // distribute across tier2 groups 1..5
        }

        for (var i = 0; i < relegatedFromTier2.Count; i++)
        {
            var t = relegatedFromTier2[i];
            t.Tier = 3;
            t.LeagueGroup = 1 + (i % 15);
        }

        // Recompute positions within each group after mutations
        for (var tier = 1; tier <= 3; tier++)
        {
            var maxGroups = tier == 1 ? 1 : tier == 2 ? 5 : 15;
            for (var g = 1; g <= maxGroups; g++)
            {
                var members = bots
                    .Where(b => b.Tier == tier && b.LeagueGroup == g)
                    .OrderByDescending(b => Points(b))
                    .ThenByDescending(b => b.SeasonWins)
                    .ThenByDescending(b => b.Strength)
                    .ThenBy(b => b.TeamName, StringComparer.Ordinal)
                    .ToArray();

                for (var pos = 0; pos < members.Length; pos++)
                {
                    members[pos].Position = pos + 1;
                }
            }
        }
    }
}
