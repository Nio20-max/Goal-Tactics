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
            InitializeSeasonSponsors(bots, report, clock.CurrentUtc);
            await RunSeasonAsync(bots, report, cancellationToken);

            var seasonTransfers = metricsCollector
                .GetCompletedTransfers()
                .Where(x => x.Season == season)
                .ToArray();
            playerCareerTracker.TrySellPlayers(season, seasonTransfers);
            playerCareerTracker.AdvanceSeason(season);

            var snapshotLine = $"{clock.CurrentUtc:O}|season-end|season={season}|matches={report.MatchesPlayed}|goals={report.TotalGoals}|bids={report.AuctionBids}|ads={report.AdsWatched}|chat={report.ChatMessages}";
            await logWriter.WriteAsync("season-summary.log", snapshotLine);
        }

        await metricsCollector.WriteAsync(options.LogRootPath);
        await playerCareerTracker.WriteAsync(options.LogRootPath);
    }

    private async Task RunSeasonAsync(IReadOnlyList<BotClubProfile> bots, BotSeasonReport report, CancellationToken cancellationToken)
    {
        for (var matchday = 1; matchday <= simulationOptions.MatchdaysPerSeason; matchday++)
        {
            await logWriter.WriteAsync("simulation-events.log", $"{clock.CurrentUtc:O}|matchday-start|season={clock.CurrentSeason}|matchday={matchday}");
            ApplyDailySponsorPayouts(bots, report, clock.CurrentUtc.Date);

            // Training at fixed UTC 08:00.
            clock.AdvanceToDailyTime(options.TrainingTickUtc);
            await ExecuteBotLoopAsync(bots, report, hasTrainingTick: true, hasLeagueMatch: false, hasFriendlyMatch: false, cancellationToken);

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
                bot.SeasonSponsorLastPayoutDate = payoutDay;
            }

            if (bot.ShortSponsorActiveUntilUtc.HasValue && bot.ShortSponsorActiveUntilUtc.Value.Date >= day && bot.ShortSponsorLastPayoutDate != payoutDay)
            {
                bot.Stars += options.ShortSponsorStarsPerDay;
                report.StarsEarned += options.ShortSponsorStarsPerDay;
                bot.ShortSponsorLastPayoutDate = payoutDay;
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
