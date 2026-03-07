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

        var expectedBotCount = options.TeamsPerLeague * (1 + 2 + 3);
        var botCount = options.BotCount == expectedBotCount ? options.BotCount : expectedBotCount;
        var bots = registry.CreatePopulation(botCount);

        await logWriter.WriteAsync("simulation-events.log", $"{clock.CurrentUtc:O}|bootstrap|bots={bots.Count}|tiers=1/2/3 groups");

        for (var season = 1; season <= options.Seasons; season++)
        {
            var report = metricsCollector.StartSeason(season);
            playerCareerTracker.StartSeason(season);
            ResetSeasonFlowCounters(bots);
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

    private void ApplySeasonInfrastructureInvestments(IReadOnlyList<BotClubProfile> bots)
    {
        foreach (var bot in bots)
        {
            var random = new Random(HashCode.Combine(bot.Seed, clock.CurrentSeason, bot.StadiumLevel, bot.TrainingCenterLevel));

            if (bot.StadiumLevel < 12 && bot.Money > 250_000m && random.NextDouble() < 0.65)
            {
                var cost = 90_000m + (20_000m * bot.StadiumLevel);
                if (bot.Money >= cost)
                {
                    bot.Money -= cost;
                    bot.MoneyOutSeason += cost;
                    metricsCollector.RecordSpend(bot.Persona, "money", "infrastructure.stadium", cost);
                    bot.StadiumLevel++;
                }
            }

            if (bot.TrainingCenterLevel < 12 && bot.Stars > 2_500m && random.NextDouble() < 0.70)
            {
                var starsCost = 1_200m + (180m * bot.TrainingCenterLevel);
                if (bot.Stars >= starsCost)
                {
                    bot.Stars -= starsCost;
                    bot.StarsOutSeason += starsCost;
                    metricsCollector.RecordSpend(bot.Persona, "stars", "infrastructure.training_center", starsCost);
                    bot.TrainingCenterLevel++;
                }
            }
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

            var homeScore = Math.Max(0, random.Next(0, 3) + (home.Strength - away.Strength) / 25);
            var awayScore = Math.Max(0, random.Next(0, 3) + (away.Strength - home.Strength) / 30);

            report.MatchesPlayed++;
            report.TotalGoals += homeScore + awayScore;

            if (homeScore > awayScore)
            {
                report.HomeWins++;
            }
            else if (awayScore > homeScore)
            {
                report.AwayWins++;
            }
            else
            {
                report.Draws++;
            }

            await logWriter.WriteAsync("simulation-events.log", $"{clock.CurrentUtc:O}|league.match|home={home.TeamName}|away={away.TeamName}|score={homeScore}:{awayScore}|tier={home.Tier}");
        }
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
}
