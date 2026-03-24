using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Behaviors;
using GoalTactics.Bots.Client.Database;
using GoalTactics.Bots.Client.Humanization;
using GoalTactics.Bots.Client.Neural;
using GoalTactics.Bots.Client.Scheduling;
using GoalTactics.Bots.Client.Telemetry;
using GoalTactics.Application.League;
using GoalTactics.Application.Sponsors;
using GoalTactics.Application.Team;
using GoalTactics.Application.TransferMarket;
using GoalTactics.Application.Mechanics;
using GoalTactics.Application.Common;
using GoalTactics.Infrastructure;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System.Text;
using System.Text.Json;

namespace GoalTactics.Bots.Client;

/// <summary>
/// Main bot execution loop: initializes the database, registers bots,
/// and runs the scheduler → wake → behave → reschedule cycle.
/// </summary>
public sealed class BotRunner : IDisposable
{
    private readonly BotConfig _config;
    private readonly BotDatabase _db;
    private readonly GoalTacticsApiClient _api;
    private readonly BotScheduler _scheduler;
    private readonly BotFactory _factory;
    private readonly BotNeuralDecisionEngine _neural;
    private readonly BotHumanizationService _human;
    private readonly BotActionNeuralPolicy _actionPolicy;
    private SimulationAuditWriter? _simulationAudit;
    private readonly ServiceProvider _bootstrapProvider;

    // Behaviors
    private readonly TransferMarketBehavior _transferMarket;
    private readonly StadiumBehavior _stadium;
    private readonly TrainingBehavior _training;
    private readonly SocialBehavior _social;
    private readonly DailyRoutineBehavior _dailyRoutine;
    private readonly LineupBehavior _lineup;
    private readonly SkillCardBehavior _skillCard;

    // Rate-limit tracking ((botId:action) → last execution UTC)
    private readonly Dictionary<string, DateTime> _rateLimits = new(StringComparer.Ordinal);
    private DateTime _lastSeasonalGrowthCheckUtc = DateTime.MinValue;
    private int _centralBrainBotCursor;

    public BotRunner(BotConfig config)
    {
        _config = config;
        _db = new BotDatabase(config.DatabasePath);
        _api = new GoalTacticsApiClient(config.ApiBaseUrl);
        _scheduler = new BotScheduler(_db);
        _factory = new BotFactory(config, _db, _api);
        _neural = new BotNeuralDecisionEngine(config, _db);
        _human = new BotHumanizationService(config, _db);
        _actionPolicy = new BotActionNeuralPolicy(_db);

        _social = new SocialBehavior(_db, config, _human, _neural);
        _transferMarket = new TransferMarketBehavior(_db, _social, _neural, _human, _actionPolicy, _config);
        _stadium = new StadiumBehavior();
        _training = new TrainingBehavior(_db, _actionPolicy);
        _dailyRoutine = new DailyRoutineBehavior();
        _lineup = new LineupBehavior();
        _skillCard = new SkillCardBehavior();

        _bootstrapProvider = BuildBootstrapServiceProvider(config);
    }

    public void Dispose()
    {
        _simulationAudit?.Dispose();
        _bootstrapProvider.Dispose();
        _api.Dispose();
        _db.Dispose();
    }

    private static ServiceProvider BuildBootstrapServiceProvider(BotConfig config)
    {
        var connectionString = $"Data Source={config.GameDatabasePath}";
        var values = new Dictionary<string, string?>
        {
            ["ConnectionStrings:Default"] = connectionString,
            ["Simulation:ForceDailyTrainingTicks"] = "true"
        };

        var configuration = new ConfigurationBuilder()
            .AddInMemoryCollection(values)
            .Build();

        var services = new ServiceCollection();
        services.AddSingleton<IConfiguration>(configuration);
        services.AddGoalTacticsInfrastructure(configuration);
        return services.BuildServiceProvider();
    }

    /// <summary>
    /// Entry point: ensure bots are registered, then loop forever.
    /// </summary>
    public async Task RunAsync(CancellationToken ct)
    {
        Console.WriteLine($"[BotRunner] Starting with {_config.BotCount} target bots...");

        // Verify API is reachable
        var ping = await _api.ExecuteForBotAsync("Ping");
        if (!ping.Success)
        {
            Console.Error.WriteLine("[BotRunner] API ping failed. Aborting.");
            return;
        }
        Console.WriteLine("[BotRunner] API is reachable.");

        // Ensure we have enough bots registered
        await EnsureBotsRegisteredAsync(ct);

        if (_config.EnableHistoricalBootstrap)
        {
            await RunHistoricalBootstrapAsync(ct);
        }

        if (_config.SimulateSeasons > 0)
        {
            await RunSeasonSimulationAsync(ct);
            return;
        }

        Console.WriteLine("[BotRunner] Entering main loop...");
        await MainLoopAsync(ct);
    }

    private async Task RunSeasonSimulationAsync(CancellationToken ct)
    {
        string runDir = Path.Combine(_config.SimulationOutputRoot, $"bots_client_sim_{DateTime.UtcNow:yyyyMMdd_HHmmss}");
        Directory.CreateDirectory(runDir);
        var simulationModelKey = Path.GetFileName(runDir);

        foreach (var bot in _db.GetAllBots())
        {
            _actionPolicy.EnsureBotModels(bot, simulationModelKey, forceReset: true);
        }

        _simulationAudit?.Dispose();
        _simulationAudit = _config.EnableSimulationAudit ? new SimulationAuditWriter(runDir) : null;
        _api.ConfigureAuditWriter(_simulationAudit);
        _api.SetAuditContext(null, null, null, "simulation-bootstrap");

        var seasonLines = new List<string>
        {
            "season,matchday,sessions,successes,auth_failures,night_sessions"
        };

        var reasonSamples = new List<string>();
        var actionCounts = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);
        int totalSessions = 0;
        int totalSuccess = 0;
        int totalAuthFailures = 0;
        int totalNightSessions = 0;

        Console.WriteLine($"[BotRunner] Starting virtual simulation: seasons={_config.SimulateSeasons}, matchdays={_config.SimulateMatchdaysPerSeason}");
        Console.WriteLine($"[BotRunner] Simulation output: {runDir}");

        for (int season = 1; season <= _config.SimulateSeasons && !ct.IsCancellationRequested; season++)
        {
            for (int matchday = 1; matchday <= _config.SimulateMatchdaysPerSeason && !ct.IsCancellationRequested; matchday++)
            {
                var bots = _db.GetAllBots();
                int daySessions = 0;
                int daySuccess = 0;
                int dayAuthFailures = 0;
                int dayNightSessions = 0;

                foreach (var bot in bots)
                {
                    if (ct.IsCancellationRequested)
                    {
                        break;
                    }

                    _api.SetAuditContext(bot.BotId, season, matchday, "session");
                    BotSessionResult result;
                    try
                    {
                        result = await ExecuteBotSessionAsync(bot);
                    }
                    catch (Exception ex)
                    {
                        Console.Error.WriteLine($"[Sim] Bot session crashed for {bot.BotId}: {ex.Message}");
                        result = new BotSessionResult
                        {
                            Success = false,
                            DecisionReason = $"session-crash:{ex.GetType().Name}"
                        };
                        _simulationAudit?.LogError(bot.BotId, season, matchday, "session", ex.Message);
                    }
                    daySessions++;

                    if (result.Success)
                    {
                        daySuccess++;
                    }
                    else if (result.AuthFailed)
                    {
                        dayAuthFailures++;
                    }

                    if (result.NightSession)
                    {
                        dayNightSessions++;
                    }

                    foreach (var action in result.ActionsExecuted)
                    {
                        actionCounts.TryGetValue(action, out int count);
                        actionCounts[action] = count + 1;
                    }

                    _simulationAudit?.LogSessionResult(
                        bot.BotId,
                        bot.TeamName,
                        season,
                        matchday,
                        result.Success,
                        result.AuthFailed,
                        result.NightSession,
                        result.DecisionReason,
                        result.ActionsExecuted);

                    if (_config.CaptureSimulationSnapshots && matchday % _config.SimulationSnapshotStride == 0)
                    {
                        await CaptureSimulationSnapshotAsync(bot, season, matchday);
                    }

                    if (reasonSamples.Count < 200)
                    {
                        reasonSamples.Add($"season={season},matchday={matchday},bot={bot.BotId},team={bot.TeamName},reason={result.DecisionReason}");
                    }

                    // Light pacing to avoid bursting the API under higher bot counts.
                    await Task.Delay(75, ct);
                }

                totalSessions += daySessions;
                totalSuccess += daySuccess;
                totalAuthFailures += dayAuthFailures;
                totalNightSessions += dayNightSessions;

                seasonLines.Add($"{season},{matchday},{daySessions},{daySuccess},{dayAuthFailures},{dayNightSessions}");
                Console.WriteLine($"[Sim] season={season} matchday={matchday} sessions={daySessions} success={daySuccess} auth_fail={dayAuthFailures} night={dayNightSessions}");
            }
        }

        await File.WriteAllLinesAsync(Path.Combine(runDir, "season-simulation.csv"), seasonLines, ct);

        var actionsCsv = new List<string> { "action,count" };
        actionsCsv.AddRange(actionCounts.OrderByDescending(x => x.Value).Select(x => $"{x.Key},{x.Value}"));
        await File.WriteAllLinesAsync(Path.Combine(runDir, "action-counts.csv"), actionsCsv, ct);

        var groups = _db.GetAllGroups();
        var report = new StringBuilder();
        report.AppendLine("# Bots Client Virtual Season Simulation Report");
        report.AppendLine();
        report.AppendLine($"- Simulated seasons: {_config.SimulateSeasons}");
        report.AppendLine($"- Matchdays per season: {_config.SimulateMatchdaysPerSeason}");
        report.AppendLine($"- Total sessions: {totalSessions}");
        report.AppendLine($"- Successful sessions: {totalSuccess}");
        report.AppendLine($"- Auth failures: {totalAuthFailures}");
        report.AppendLine($"- Night sessions: {totalNightSessions}");
        report.AppendLine($"- Groups observed: {groups.Count}");
        report.AppendLine($"- Action NN pretraining: {_actionPolicy.TrainingReport}");
        report.AppendLine();

        report.AppendLine("## Top Executed Actions");
        foreach (var row in actionCounts.OrderByDescending(x => x.Value).Take(20))
        {
            report.AppendLine($"- {row.Key}: {row.Value}");
        }
        report.AppendLine();

        report.AppendLine("## Decision Reason Samples");
        foreach (var sample in reasonSamples.Take(80))
        {
            report.AppendLine($"- {sample}");
        }
        report.AppendLine();

        report.AppendLine("## Group Behavior Snapshot");
        foreach (var group in groups.OrderBy(g => g.GroupId))
        {
            var bots = _db.GetBotsInGroup(group.GroupId);
            var recentMessages = _db.GetRecentGroupChatMessages(group.GroupId, 50);
            report.AppendLine($"- Group {group.GroupId} ({group.Name}): bots={bots.Count}, recent_messages={recentMessages.Count}");
        }
        report.AppendLine();

        report.AppendLine("## Deep Error/Mistake Findings");
        report.AppendLine("1. Virtual-season simulation currently maps one bot online session to one simulated matchday step. This is fast but still a proxy for real season pacing.");
        report.AppendLine("2. Session behavior can be skipped by confidence/rollback guardrails, which can make low-confidence bots look less active than expected during simulation windows.");
        report.AppendLine("3. Group behavior visibility depends on recent chat writes and group formation timing; groups with low social coordination can appear underactive in short windows.");
        report.AppendLine("4. API-dependent outcomes (auction timing, ladder challenges, sponsor responses) still rely on live backend state, so deterministic replay is limited.");

        await File.WriteAllTextAsync(Path.Combine(runDir, "simulation-report.md"), report.ToString(), ct);
        Console.WriteLine($"[BotRunner] Virtual simulation finished. Report written to {runDir}");
    }

    private async Task CaptureSimulationSnapshotAsync(BotRecord bot, int season, int matchday)
    {
        if (_simulationAudit is null)
        {
            return;
        }

        _api.SetAuditContext(bot.BotId, season, matchday, "snapshot");

        try
        {
            if (!await EnsureAuthenticatedAsync(bot))
            {
                _simulationAudit.LogError(bot.BotId, season, matchday, "snapshot", "authentication-failed");
                return;
            }

            _api.SetToken(bot.ValidationToken);
            var teamInfo = await _api.ExecuteForBotAsync("GetMyTeamExtendedInfo");
            var resources = await _api.ExecuteForBotAsync("GetMyResources");
            var squad = await _api.ExecuteForBotAsync("GetSquad");
            var stadium = await _api.ExecuteForBotAsync("GetStadium");
            var training = await _api.ExecuteForBotAsync("GetTeamTraining");
            var transferMarket = await _api.ExecuteForBotAsync("SearchTransfermarket", new SearchTransfermarketRequest());

            _simulationAudit.LogTeamSnapshot(
                bot.BotId,
                bot.TeamName,
                season,
                matchday,
                teamInfo.Output,
                resources.Output,
                stadium.Output,
                training.Output,
                transferMarket.Output);
            _simulationAudit.LogSquadSnapshot(
                bot.BotId,
                bot.TeamName,
                season,
                matchday,
                BotApiTranslationReader.GetObjectList(squad, "players"),
                BotApiTranslationReader.GetObjectList(squad, "playersOnTransfermarket"));
        }
        catch (Exception ex)
        {
            _simulationAudit.LogError(bot.BotId, season, matchday, "snapshot", ex.Message);
        }
        finally
        {
            _api.ClearToken();
        }
    }

    private async Task RunHistoricalBootstrapAsync(CancellationToken ct)
    {
        var status = await LoadBootstrapStatusAsync(ct);
        if (status.Completed)
        {
            Console.WriteLine("[BotRunner] Historical bootstrap already completed. Continuing live runtime.");
            return;
        }

        var anchorDate = ParseAnchorDate(_config.HistoricalBootstrapAnchorDayOneUtc);
        var fastSeasons = Math.Max(1, _config.HistoricalBootstrapFastSeasons);
        var totalHistoricalSeasons = fastSeasons + Math.Max(0, _config.HistoricalBootstrapRealSimulationSeasons);
        var runDir = Path.Combine(_config.SimulationOutputRoot, $"bots_bootstrap_{DateTime.UtcNow:yyyyMMdd_HHmmss}");
        Directory.CreateDirectory(runDir);

        _simulationAudit?.Dispose();
        _simulationAudit = _config.EnableSimulationAudit ? new SimulationAuditWriter(runDir) : null;
        _api.ConfigureAuditWriter(_simulationAudit);
        _api.SetAuditContext(null, null, null, "historical-bootstrap");

        Console.WriteLine($"[BotRunner] Starting historical bootstrap: fast={fastSeasons}, real={_config.HistoricalBootstrapRealSimulationSeasons}, bots/season={_config.HistoricalBootstrapBotsPerSeason}");
        Console.WriteLine($"[BotRunner] Anchor target: season {_config.HistoricalBootstrapAnchorSeason} day 1 => {anchorDate:yyyy-MM-dd}");

        status.Phase = "bootstrap-running";
        status.StartedAtUtc ??= DateTime.UtcNow.ToString("o");
        status.UpdatedAtUtc = DateTime.UtcNow.ToString("o");
        status.RunDirectory = runDir;
        status.AnchorSeason = _config.HistoricalBootstrapAnchorSeason;
        status.AnchorDayOneUtc = anchorDate.ToString("yyyy-MM-dd");
        status.TargetSeasons = totalHistoricalSeasons;
        status.MatchdaysPerSeason = _config.SimulateMatchdaysPerSeason;
        await SaveBootstrapStatusAsync(status, ct);

        for (var season = Math.Max(1, status.CurrentSeason); season <= fastSeasons && !ct.IsCancellationRequested; season++)
        {
            var startMatchday = season == status.CurrentSeason ? Math.Max(1, status.CurrentMatchday) : 1;
            if (startMatchday == 1 && _config.HistoricalBootstrapBotsPerSeason > 0)
            {
                await AddNewBotsAsync(_config.HistoricalBootstrapBotsPerSeason, $"bootstrap-season-{season}", ct);
            }

            // New fast path: simulate an entire season in-process without calling HTTP endpoints.
            var seasonSummary = await RunInProcessFastSeasonAsync(season, ct);
            status.TotalSessions += seasonSummary.Sessions;
            status.TotalSuccess += seasonSummary.Success;
            status.TotalAuthFailures += seasonSummary.AuthFailures;

            status.CompletedSeasons = season;
            status.CurrentSeason = season + 1;
            status.CurrentMatchday = 1;
            status.UpdatedAtUtc = DateTime.UtcNow.ToString("o");
            status.VirtualDateUtc = GetHistoricalDate(anchorDate, season, _config.SimulateMatchdaysPerSeason).ToString("yyyy-MM-dd");
            status.TotalBots = _db.GetBotCount();
            status.LiveSeasonalGrowthLastApplied = _config.HistoricalBootstrapAnchorSeason - 1;
            await SaveBootstrapStatusAsync(status, ct);

            Console.WriteLine($"[BootstrapFastSeason] season={season} sessions={seasonSummary.Sessions} success={seasonSummary.Success} auth_fail={seasonSummary.AuthFailures} relegated={seasonSummary.RelegatedTeams} promoted={seasonSummary.PromotedTeams} totalBots={status.TotalBots} virtualDate={status.VirtualDateUtc}");
        }

        for (var season = fastSeasons + 1; season <= totalHistoricalSeasons && !ct.IsCancellationRequested; season++)
        {
            if (_config.HistoricalBootstrapBotsPerSeason > 0)
            {
                await AddNewBotsAsync(_config.HistoricalBootstrapBotsPerSeason, $"bootstrap-season-{season}", ct);
            }

            var summary = await RunFullySimulatedSeasonAsync(season, ct);
            status.TotalSessions += summary.Sessions;
            status.TotalSuccess += summary.Success;
            status.TotalAuthFailures += summary.AuthFailures;
            status.CompletedSeasons = season;
            status.CurrentSeason = season + 1;
            status.CurrentMatchday = 1;
            status.TotalBots = _db.GetBotCount();
            status.LiveSeasonalGrowthLastApplied = _config.HistoricalBootstrapAnchorSeason - 1;
            status.VirtualDateUtc = GetHistoricalDate(anchorDate, season, _config.SimulateMatchdaysPerSeason).ToString("yyyy-MM-dd");
            status.UpdatedAtUtc = DateTime.UtcNow.ToString("o");
            await SaveBootstrapStatusAsync(status, ct);
            Console.WriteLine($"[BootstrapReal] season={season} sessions={summary.Sessions} success={summary.Success} auth_fail={summary.AuthFailures}");
        }

        await AlignSeasonStateToAnchorAsync(anchorDate, ct);

        status.Completed = true;
        status.Phase = "bootstrap-complete";
        status.CurrentSeason = _config.HistoricalBootstrapAnchorSeason;
        status.CurrentMatchday = 1;
        status.CompletedAtUtc = DateTime.UtcNow.ToString("o");
        status.LiveSeasonalGrowthLastApplied = _config.HistoricalBootstrapAnchorSeason - 1;
        status.TotalBots = _db.GetBotCount();
        status.VirtualDateUtc = anchorDate.ToString("yyyy-MM-dd");
        status.UpdatedAtUtc = DateTime.UtcNow.ToString("o");
        await SaveBootstrapStatusAsync(status, ct);

        var report = new StringBuilder();
        report.AppendLine("# Historical Bootstrap Report");
        report.AppendLine();
        report.AppendLine($"- Completed at: {status.CompletedAtUtc}");
        report.AppendLine($"- Seasons processed: {totalHistoricalSeasons} (fast={fastSeasons}, real={_config.HistoricalBootstrapRealSimulationSeasons})");
        report.AppendLine($"- Matchdays per season: {_config.SimulateMatchdaysPerSeason}");
        report.AppendLine($"- Total sessions: {status.TotalSessions}");
        report.AppendLine($"- Successful sessions: {status.TotalSuccess}");
        report.AppendLine($"- Auth failures: {status.TotalAuthFailures}");
        report.AppendLine($"- Total bots after bootstrap: {status.TotalBots}");
        report.AppendLine($"- Anchor target reached: season {_config.HistoricalBootstrapAnchorSeason} day 1 on {anchorDate:yyyy-MM-dd}");
        report.AppendLine($"- Action NN pretraining: {_actionPolicy.TrainingReport}");
        await File.WriteAllTextAsync(Path.Combine(runDir, "bootstrap-report.md"), report.ToString(), ct);

        Console.WriteLine("[BotRunner] Historical bootstrap complete. Entering live runtime mode.");
    }

    private async Task<(int Sessions, int Success, int AuthFailures)> RunFullySimulatedSeasonAsync(int season, CancellationToken ct)
    {
        var sessions = 0;
        var success = 0;
        var authFail = 0;

        for (var matchday = 1; matchday <= _config.SimulateMatchdaysPerSeason && !ct.IsCancellationRequested; matchday++)
        {
            var bots = _db.GetAllBots();
            foreach (var bot in bots)
            {
                if (ct.IsCancellationRequested)
                {
                    break;
                }

                _api.SetAuditContext(bot.BotId, season, matchday, "bootstrap-real-session");
                BotSessionResult result;
                try
                {
                    result = await ExecuteBotSessionWithTimeoutAsync(bot, ct);
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine($"[BootstrapReal] Bot session crashed for {bot.BotId}: {ex.Message}");
                    result = new BotSessionResult
                    {
                        Success = false,
                        DecisionReason = $"bootstrap-real-crash:{ex.GetType().Name}"
                    };
                    _simulationAudit?.LogError(bot.BotId, season, matchday, "bootstrap-real-session", ex.Message);
                }

                sessions++;
                if (result.Success) success++;
                if (result.AuthFailed) authFail++;

                _simulationAudit?.LogSessionResult(
                    bot.BotId,
                    bot.TeamName,
                    season,
                    matchday,
                    result.Success,
                    result.AuthFailed,
                    result.NightSession,
                    result.DecisionReason,
                    result.ActionsExecuted);

                await Task.Delay(50, ct);
            }
        }

        return (sessions, success, authFail);
    }

    private async Task<(int Sessions, int Success, int AuthFailures, int RelegatedTeams, int PromotedTeams)> RunInProcessFastSeasonAsync(int season, CancellationToken ct)
    {
        using var scope = _bootstrapProvider.CreateScope();
        var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();
        var stadiumEconomy = scope.ServiceProvider.GetRequiredService<StadiumEconomyService>();

        var bots = _db.GetAllBots();
        if (bots.Count == 0)
        {
            return (0, 0, 0, 0, 0);
        }

        var botTeams = await (
            from team in dbContext.Teams
            join user in dbContext.Users on team.UserId equals user.Id
            where user.Email != null && user.Email.EndsWith("@goaltactics.bot")
            select team)
            .ToListAsync(ct);

        if (botTeams.Count == 0)
        {
            return (0, 0, 0, 0, 0);
        }

        var botByTeamName = bots
            .GroupBy(x => x.TeamName, StringComparer.Ordinal)
            .ToDictionary(g => g.Key, g => g.First(), StringComparer.Ordinal);

        var botTeamIds = botTeams.Select(t => t.Id).ToHashSet(StringComparer.Ordinal);
        var resourcesByTeam = await dbContext.TeamResources
            .Where(x => botTeamIds.Contains(x.TeamId))
            .ToDictionaryAsync(x => x.TeamId, x => x, StringComparer.Ordinal, ct);
        var trainingByTeam = await dbContext.TeamTrainingStates
            .Where(x => botTeamIds.Contains(x.TeamId))
            .ToDictionaryAsync(x => x.TeamId, x => x, StringComparer.Ordinal, ct);
        var players = await dbContext.TeamPlayers
            .Where(x => botTeamIds.Contains(x.TeamId))
            .ToListAsync(ct);
        var playersByTeam = players
            .GroupBy(x => x.TeamId, StringComparer.Ordinal)
            .ToDictionary(g => g.Key, g => g.ToList(), StringComparer.Ordinal);

        var sessions = 0;
        var success = 0;
        var authFailures = 0;

        foreach (var team in botTeams)
        {
            if (ct.IsCancellationRequested)
            {
                break;
            }

            sessions++;
            var bot = botByTeamName.TryGetValue(team.Name, out var mappedBot)
                ? mappedBot
                : new BotRecord { BotId = team.Id, TeamName = team.Name, Activity = 55, Risk = 45, YouthFocus = 55, SocialScore = 55 };

            if (!playersByTeam.TryGetValue(team.Id, out var squad))
            {
                squad = new List<TeamPlayerEntity>();
                playersByTeam[team.Id] = squad;
            }

            var rng = new Random(HashCode.Combine(season, bot.BotId));

            try
            {
                EnsurePositionCoverage(team.Id, squad, rng);

                if (trainingByTeam.TryGetValue(team.Id, out var trainingState))
                {
                    ApplyFastSeasonTrainingPlan(trainingState, squad, bot, rng);
                }

                var resources = resourcesByTeam.TryGetValue(team.Id, out var teamResources) ? teamResources : null;
                if (resources is not null)
                {
                    ApplyFastSeasonStadiumPlan(resources, bot, team.LeagueTier, rng);
                    ApplyFastSeasonScoutingAndTransfers(team, squad, resources, bot, rng);
                }

                foreach (var player in squad)
                {
                    if (dbContext.Entry(player).State == EntityState.Detached)
                    {
                        dbContext.TeamPlayers.Add(player);
                    }
                }

                ApplyFastSeasonSocialPlan(bot, rng);

                var activePlayers = squad.Where(x => !x.IsScouted).ToList();
                team.Strength = CalculateFastTeamStrength(activePlayers);
                team.MarketValue = Math.Round(activePlayers.Sum(x => x.MarketValue ?? 0m), 2, MidpointRounding.AwayFromZero);

                if (resources is not null)
                {
                    var winsBias = Math.Clamp(team.Wins - team.Losses, -10, 10);
                    var day = stadiumEconomy.CalculateMatchday(team.LeagueTier, Math.Max(0, winsBias + 10), Math.Max(0, 10 - winsBias), resources.StadiumVipSeats, resources.StadiumSitSeats, resources.StadiumStandSeats, resources.FanShopLevel, resources.ParkingLevel, resources.OfficeLevel);
                    resources.StadiumVisitorsTotal += day.Visitors * 15L;
                    resources.StadiumVisitorsLastMatch = day.Visitors;
                    resources.StadiumEarningsLastMatch = day.Earnings;
                    resources.StadiumEarningsTotal += day.Earnings * 15m;
                    resources.StadiumMatchesCount += 15;
                    resources.Money += day.Earnings * 3m;
                }

                _simulationAudit?.LogSessionResult(bot.BotId, bot.TeamName, season, _config.SimulateMatchdaysPerSeason, true, false, false, "fast-season-plan", ["training", "scouting", "transfer", "stadium", "social"]);
                success++;
            }
            catch (Exception ex)
            {
                _simulationAudit?.LogError(bot.BotId, season, _config.SimulateMatchdaysPerSeason, "fast-season", ex.Message);
                _simulationAudit?.LogSessionResult(bot.BotId, bot.TeamName, season, _config.SimulateMatchdaysPerSeason, false, false, false, $"fast-season-crash:{ex.GetType().Name}", []);
            }
        }

        var (relegated, promoted) = await ApplyFastSeasonLeagueTablesAndRelegationAsync(dbContext, season, ct);
        await dbContext.SaveChangesAsync(ct);
        return (sessions, success, authFailures, relegated, promoted);
    }

    private static void EnsurePositionCoverage(string teamId, List<TeamPlayerEntity> squad, Random rng)
    {
        var active = squad.Where(x => !x.IsScouted).ToList();
        var counts = CountPositions(active);
        var required = new Dictionary<string, int>(StringComparer.Ordinal)
        {
            ["GK"] = 2,
            ["DEF"] = 5,
            ["MID"] = 5,
            ["FWD"] = 3
        };

        foreach (var kvp in required)
        {
            var position = kvp.Key;
            var need = kvp.Value - counts.GetValueOrDefault(position);
            for (var i = 0; i < need; i++)
            {
                var prospect = BuildFastProspect(teamId, position, 7 + rng.Next(3), 19 + rng.Next(7), 78m + rng.Next(8), isScouted: false);
                squad.Add(prospect);
                active.Add(prospect);
            }
        }
    }

    private void ApplyFastSeasonTrainingPlan(TeamTrainingStateEntity state, List<TeamPlayerEntity> squad, BotRecord bot, Random rng)
    {
        var active = squad.Where(x => !x.IsScouted).ToList();
        if (active.Count == 0)
        {
            return;
        }

        var groupAverages = new Dictionary<string, decimal>(StringComparer.Ordinal)
        {
            ["GK"] = AverageStrength(active, "GK"),
            ["DEF"] = AverageStrength(active, "DEF"),
            ["MID"] = AverageStrength(active, "MID"),
            ["FWD"] = AverageStrength(active, "FWD")
        };

        var focusPosition = groupAverages.OrderBy(x => x.Value).First().Key;
        var secondaryPosition = groupAverages.OrderByDescending(x => x.Value).Last().Key;
        state.MainSkillIndex = LegacyAppCompatibility.MainSkillIndex(focusPosition);
        state.SubSkillIndex = LegacyAppCompatibility.MainSkillIndex(secondaryPosition);

        var targetIndividual = active
            .OrderByDescending(x => x.Talent)
            .ThenBy(x => x.Age)
            .ThenByDescending(x => x.Strength)
            .First();

        var individualIndex = LegacyAppCompatibility.MainSkillIndex(targetIndividual.Position);
        var focusMatchdays = 14 + (bot.Activity / 10) + rng.Next(0, 6);
        var subMatchdays = 8 + (bot.YouthFocus / 20) + rng.Next(0, 5);

        foreach (var player in active)
        {
            var skills = GetSkills(player);
            var mainIndex = LegacyAppCompatibility.MainSkillIndex(player.Position);

            var mainGain = player.Position == focusPosition ? focusMatchdays * 0.07m : focusMatchdays * 0.03m;
            var subGain = player.Position == secondaryPosition ? subMatchdays * 0.05m : subMatchdays * 0.02m;
            AddSkillGain(skills, mainIndex, mainGain);
            AddSkillGain(skills, state.SubSkillIndex, subGain);

            if (player.Id == targetIndividual.Id)
            {
                AddSkillGain(skills, individualIndex, 2.6m + (bot.YouthFocus / 35m));
            }

            SetSkills(player, skills);
            RecalculatePlayer(player);
        }
    }

    private void ApplyFastSeasonScoutingAndTransfers(TeamEntity team, List<TeamPlayerEntity> squad, TeamResourcesEntity resources, BotRecord bot, Random rng)
    {
        var active = squad.Where(x => !x.IsScouted).ToList();
        var counts = CountPositions(active);
        var required = new Dictionary<string, int>(StringComparer.Ordinal)
        {
            ["GK"] = 2,
            ["DEF"] = 6,
            ["MID"] = 6,
            ["FWD"] = 4
        };

        var scoutBudget = Math.Max(1, 1 + (bot.YouthFocus / 25));
        for (var i = 0; i < scoutBudget; i++)
        {
            var pos = required.OrderBy(x => counts.GetValueOrDefault(x.Key) - x.Value).First().Key;
            var age = 17 + rng.Next(8);
            var talent = Math.Clamp(6 + (bot.YouthFocus / 22) + rng.Next(-1, 2), 4, 10);
            var baseStrength = 72m + rng.Next(0, 12);
            var scouted = BuildFastProspect(team.Id, pos, talent, age, baseStrength, isScouted: true);
            squad.Add(scouted);
        }

        var transferActions = 1 + Math.Clamp(bot.Risk / 35, 0, 3);
        for (var i = 0; i < transferActions; i++)
        {
            var needPosition = required.OrderBy(x => counts.GetValueOrDefault(x.Key) - x.Value).First().Key;
            var bestScout = squad
                .Where(x => x.IsScouted && x.Position == needPosition)
                .OrderByDescending(x => x.Talent)
                .ThenBy(x => x.Age)
                .ThenByDescending(x => x.Strength)
                .FirstOrDefault();

            if (bestScout is null)
            {
                continue;
            }

            var weakest = active
                .Where(x => x.Position == needPosition)
                .OrderBy(x => x.Strength)
                .ThenByDescending(x => x.Age)
                .FirstOrDefault();

            var transferFee = Math.Max(120_000m, bestScout.MarketValue ?? 120_000m);
            if (resources.Money < transferFee)
            {
                continue;
            }

            if (weakest is not null && bestScout.Strength <= weakest.Strength + 3m)
            {
                continue;
            }

            resources.Money -= transferFee;
            bestScout.IsScouted = false;
            bestScout.ShirtNumber = NextShirtNumber(active);
            bestScout.ContractEndUtc = DateTime.UtcNow.AddDays(365 + rng.Next(0, 360));
            active.Add(bestScout);
            counts[needPosition] = counts.GetValueOrDefault(needPosition) + 1;

            if (weakest is not null && counts.GetValueOrDefault(needPosition) > required[needPosition])
            {
                resources.Money += Math.Max(50_000m, (weakest.MarketValue ?? 0m) * 0.70m);
                weakest.IsScouted = true;
                weakest.ScoutingReadyAtUtc = DateTime.UtcNow.AddDays(365);
                weakest.ContractEndUtc = DateTime.UtcNow.AddDays(-1);
                active.Remove(weakest);
                counts[needPosition] = Math.Max(0, counts.GetValueOrDefault(needPosition) - 1);
            }
        }

        foreach (var oldScout in squad.Where(x => x.IsScouted && x.ContractEndUtc.HasValue && x.ContractEndUtc.Value < DateTime.UtcNow.AddDays(-2)).ToList())
        {
            squad.Remove(oldScout);
        }
    }

    private void ApplyFastSeasonStadiumPlan(TeamResourcesEntity resources, BotRecord bot, int leagueTier, Random rng)
    {
        var upgrades = 1 + Math.Clamp(bot.Activity / 35, 0, 3);
        var caps = leagueTier switch
        {
            1 => (Vip: 2800, Sit: 35000, Stand: 65000),
            2 => (Vip: 2300, Sit: 28500, Stand: 52000),
            3 => (Vip: 1900, Sit: 24000, Stand: 42000),
            _ => (Vip: 1700, Sit: 20000, Stand: 32000)
        };

        for (var i = 0; i < upgrades; i++)
        {
            var choice = rng.Next(0, 4);
            switch (choice)
            {
                case 0 when resources.StadiumVipSeats + 10 <= caps.Vip && resources.Money >= 80_000m:
                    resources.StadiumVipSeats += 10;
                    resources.Money -= 80_000m;
                    break;
                case 1 when resources.StadiumSitSeats + 100 <= caps.Sit && resources.Money >= 120_000m:
                    resources.StadiumSitSeats += 100;
                    resources.Money -= 120_000m;
                    break;
                case 2 when resources.StadiumStandSeats + 250 <= caps.Stand && resources.Money >= 90_000m:
                    resources.StadiumStandSeats += 250;
                    resources.Money -= 90_000m;
                    break;
                case 3 when resources.TrainingCenterLevel < 8 && resources.Money >= 150_000m:
                    resources.TrainingCenterLevel += 1;
                    resources.Money -= 150_000m;
                    break;
            }
        }
    }

    private void ApplyFastSeasonSocialPlan(BotRecord bot, Random rng)
    {
        var socialActions = 1 + Math.Clamp(bot.SocialScore / 25, 0, 4) + rng.Next(0, 3);
        _db.AddActionLog(bot.BotId, "fast-social", $"Simulated social interactions: {socialActions}", true, bot.Risk);
    }

    private static decimal AverageStrength(IEnumerable<TeamPlayerEntity> players, string position)
    {
        var list = players.Where(x => x.Position == position).ToList();
        return list.Count == 0 ? 0m : list.Average(x => x.Strength);
    }

    private static Dictionary<string, int> CountPositions(IEnumerable<TeamPlayerEntity> players)
    {
        var map = new Dictionary<string, int>(StringComparer.Ordinal)
        {
            ["GK"] = 0,
            ["DEF"] = 0,
            ["MID"] = 0,
            ["FWD"] = 0
        };

        foreach (var player in players)
        {
            if (map.ContainsKey(player.Position))
            {
                map[player.Position]++;
            }
        }

        return map;
    }

    private static TeamPlayerEntity BuildFastProspect(string teamId, string position, int talent, int age, decimal strength, bool isScouted)
    {
        var playerId = Guid.NewGuid();
        var firstNames = new[] { "Alex", "Jonas", "David", "Luca", "Noah", "Nico", "Ben", "Kai" };
        var lastNames = new[] { "Fischer", "Wagner", "Mayer", "Schmidt", "Hoffmann", "Keller", "Koch", "Lang" };
        var rng = new Random(HashCode.Combine(playerId, teamId, position, talent, age));
        var name = $"{firstNames[rng.Next(firstNames.Length)]} {lastNames[rng.Next(lastNames.Length)]}";
        var skills = LegacyAppCompatibility.BuildSkills(strength, position, talent, age, LegacyAppCompatibility.BuildRandomBonusSkills(playerId));

        var player = new TeamPlayerEntity
        {
            Id = playerId.ToString("N"),
            TeamId = teamId,
            Name = name,
            Origin = "DE",
            Position = position,
            ShirtNumber = 0,
            Age = age,
            Talent = talent,
            Fitness = 100,
            Matches = 0,
            Goals = 0,
            YellowCards = 0,
            RedCards = 0,
            SuspensionMatchesRemaining = 0,
            IsScouted = isScouted,
            IsPremiumScouting = false,
            ScoutingReadyAtUtc = DateTime.UtcNow,
            ContractEndUtc = DateTime.UtcNow.AddDays(280 + rng.Next(0, 200)),
            Head = LegacyAppCompatibility.BuildHeadId(playerId),
            Body = LegacyAppCompatibility.BuildBodyId(playerId),
            Gloves = LegacyAppCompatibility.BuildGlovesId(playerId, position == "GK"),
            Shoes = LegacyAppCompatibility.BuildShoesId(playerId)
        };

        SetSkills(player, skills);
        RecalculatePlayer(player);
        return player;
    }

    private static int NextShirtNumber(List<TeamPlayerEntity> players)
    {
        var used = players.Select(x => x.ShirtNumber).Where(x => x > 0).ToHashSet();
        for (var i = 1; i <= 99; i++)
        {
            if (!used.Contains(i))
            {
                return i;
            }
        }

        return 99;
    }

    private static int CalculateFastTeamStrength(List<TeamPlayerEntity> players)
    {
        if (players.Count == 0)
        {
            return 1;
        }

        var top11 = players
            .OrderByDescending(x => x.Strength)
            .Take(11)
            .ToList();
        var baseStrength = top11.Sum(x => (int)Math.Round(x.Strength, MidpointRounding.AwayFromZero));
        var avgFitness = top11.Count == 0 ? 80 : (int)Math.Round(top11.Average(x => x.Fitness), MidpointRounding.AwayFromZero);
        var fitnessFactor = TeamStrengthCalculator.ComputeFitnessFactor(avgFitness);
        return Math.Max(1, (int)Math.Round(baseStrength * (decimal)fitnessFactor, MidpointRounding.AwayFromZero));
    }

    private async Task<(int RelegatedTeams, int PromotedTeams)> ApplyFastSeasonLeagueTablesAndRelegationAsync(GoalTacticsDbContext dbContext, int season, CancellationToken ct)
    {
        var leagues = await dbContext.Leagues.ToListAsync(ct);
        var leagueTeams = await dbContext.LeagueTeams.ToListAsync(ct);
        var teamsById = await dbContext.Teams.ToDictionaryAsync(x => x.Id, x => x, StringComparer.Ordinal, ct);

        var leagueById = leagues.ToDictionary(x => x.Id, x => x, StringComparer.Ordinal);
        var grouped = leagueTeams.GroupBy(x => x.LeagueId, StringComparer.Ordinal).ToDictionary(g => g.Key, g => g.ToList(), StringComparer.Ordinal);
        var tierMin = leagues.Min(x => x.Tier);
        var tierMax = leagues.Max(x => x.Tier);

        var promoteToTier = new Dictionary<int, List<LeagueTeamEntity>>();
        var relegateToTier = new Dictionary<int, List<LeagueTeamEntity>>();
        var outgoing = new HashSet<string>(StringComparer.Ordinal);

        foreach (var league in leagues)
        {
            if (!grouped.TryGetValue(league.Id, out var members) || members.Count == 0)
            {
                continue;
            }

            var rng = new Random(HashCode.Combine("league-table", season, league.Id));
            var ranked = members
                .Select(member =>
                {
                    var strength = member.TeamId is not null && teamsById.TryGetValue(member.TeamId, out var team)
                        ? team.Strength
                        : (int)Math.Round(member.Strength, MidpointRounding.AwayFromZero);
                    var perf = strength + rng.Next(-55, 56);
                    return (Member: member, Perf: perf, Strength: strength);
                })
                .OrderByDescending(x => x.Perf)
                .ToList();

            for (var rank = 0; rank < ranked.Count; rank++)
            {
                var entry = ranked[rank].Member;
                var points = Math.Max(8, 76 - (rank * 4) + rng.Next(-4, 5));
                var draws = Math.Clamp(5 + rng.Next(-2, 3), 0, 14);
                var wins = Math.Clamp((points - draws) / 3, 0, 30 - draws);
                var losses = Math.Max(0, 30 - wins - draws);
                var scored = Math.Max(14, 48 - rank + rng.Next(-10, 12));
                var received = Math.Max(10, 24 + rank + rng.Next(-8, 10));

                entry.MatchesHome = 15;
                entry.MatchesAway = 15;
                entry.WinsHome = wins / 2;
                entry.WinsAway = wins - entry.WinsHome;
                entry.DrawsHome = draws / 2;
                entry.DrawsAway = draws - entry.DrawsHome;
                entry.LossesHome = losses / 2;
                entry.LossesAway = losses - entry.LossesHome;
                entry.GoalsScoredHome = scored / 2;
                entry.GoalsScoredAway = scored - entry.GoalsScoredHome;
                entry.GoalsReceivedHome = received / 2;
                entry.GoalsReceivedAway = received - entry.GoalsReceivedHome;
                entry.PointsHome = (entry.WinsHome * 3) + entry.DrawsHome;
                entry.PointsAway = (entry.WinsAway * 3) + entry.DrawsAway;
                entry.Strength = ranked[rank].Strength;

                if (entry.TeamId is not null && teamsById.TryGetValue(entry.TeamId, out var team))
                {
                    team.Wins = wins;
                    team.Losses = losses;
                    team.MatchTrend = wins > losses ? "11110" : "00011";
                }
            }

            var mount = Math.Clamp(league.Mount, 0, Math.Max(0, ranked.Count - 1));
            var dismount = Math.Clamp(league.Dismount, 0, Math.Max(0, ranked.Count - 1));

            if (league.Tier > tierMin && mount > 0)
            {
                var movingUp = ranked.Take(mount).Select(x => x.Member).ToList();
                if (!promoteToTier.TryGetValue(league.Tier - 1, out var promoteList))
                {
                    promoteList = new List<LeagueTeamEntity>();
                    promoteToTier[league.Tier - 1] = promoteList;
                }
                promoteList.AddRange(movingUp);
                foreach (var team in movingUp)
                {
                    outgoing.Add(team.Id);
                }
            }

            if (league.Tier < tierMax && dismount > 0)
            {
                var movingDown = ranked.TakeLast(dismount).Select(x => x.Member).ToList();
                if (!relegateToTier.TryGetValue(league.Tier + 1, out var relegatedList))
                {
                    relegatedList = new List<LeagueTeamEntity>();
                    relegateToTier[league.Tier + 1] = relegatedList;
                }
                relegatedList.AddRange(movingDown);
                foreach (var team in movingDown)
                {
                    outgoing.Add(team.Id);
                }
            }
        }

        var promotedCount = promoteToTier.Values.Sum(x => x.Count);
        var relegatedCount = relegateToTier.Values.Sum(x => x.Count);

        var leaguesByTier = leagues
            .GroupBy(x => x.Tier)
            .ToDictionary(g => g.Key, g => g.OrderBy(x => x.GroupNumber).ToList());

        foreach (var tierEntry in leaguesByTier)
        {
            var tier = tierEntry.Key;
            var tierLeagues = tierEntry.Value;
            var targetSizes = tierLeagues.ToDictionary(x => x.Id, x => grouped.TryGetValue(x.Id, out var m) ? m.Count : 0, StringComparer.Ordinal);

            var keep = tierLeagues
                .SelectMany(x => grouped.TryGetValue(x.Id, out var m) ? m : Enumerable.Empty<LeagueTeamEntity>())
                .Where(x => !outgoing.Contains(x.Id))
                .ToList();

            var incoming = new List<LeagueTeamEntity>();
            if (promoteToTier.TryGetValue(tier, out var promoted))
            {
                incoming.AddRange(promoted);
            }
            if (relegateToTier.TryGetValue(tier, out var relegated))
            {
                incoming.AddRange(relegated);
            }

            var pool = keep
                .Concat(incoming)
                .DistinctBy(x => x.Id)
                .OrderByDescending(x => x.Strength)
                .ToList();

            var totalTarget = targetSizes.Values.Sum();
            if (pool.Count > totalTarget)
            {
                pool = pool.Take(totalTarget).ToList();
            }

            var cursor = 0;
            foreach (var league in tierLeagues)
            {
                var size = targetSizes[league.Id];
                for (var i = 0; i < size && cursor < pool.Count; i++)
                {
                    var member = pool[cursor++];
                    member.LeagueId = league.Id;
                    member.PointsHome = 0;
                    member.PointsAway = 0;
                    member.WinsHome = 0;
                    member.WinsAway = 0;
                    member.DrawsHome = 0;
                    member.DrawsAway = 0;
                    member.LossesHome = 0;
                    member.LossesAway = 0;
                    member.GoalsScoredHome = 0;
                    member.GoalsScoredAway = 0;
                    member.GoalsReceivedHome = 0;
                    member.GoalsReceivedAway = 0;
                    member.MatchesHome = 0;
                    member.MatchesAway = 0;

                    if (member.TeamId is not null && teamsById.TryGetValue(member.TeamId, out var linkedTeam))
                    {
                        linkedTeam.LeagueTier = league.Tier;
                        linkedTeam.LeagueName = league.Name;
                    }
                }
            }
        }

        return (relegatedCount, promotedCount);
    }

    private static decimal[] GetSkills(TeamPlayerEntity player)
    {
        return
        [
            player.Skill0 ?? 0m,
            player.Skill1 ?? 0m,
            player.Skill2 ?? 0m,
            player.Skill3 ?? 0m,
            player.Skill4 ?? 0m,
            player.Skill5 ?? 0m,
            player.Skill6 ?? 0m,
            player.Skill7 ?? 0m,
            player.Skill8 ?? 0m,
            player.Skill9 ?? 0m,
            player.Skill10 ?? 0m,
            player.Skill11 ?? 0m,
            player.Skill12 ?? 0m,
            player.Skill13 ?? 0m
        ];
    }

    private static void SetSkills(TeamPlayerEntity player, decimal[] skills)
    {
        player.Skill0 = PlayerValueCalculator.ClampSkill(skills[0]);
        player.Skill1 = PlayerValueCalculator.ClampSkill(skills[1]);
        player.Skill2 = PlayerValueCalculator.ClampSkill(skills[2]);
        player.Skill3 = PlayerValueCalculator.ClampSkill(skills[3]);
        player.Skill4 = PlayerValueCalculator.ClampSkill(skills[4]);
        player.Skill5 = PlayerValueCalculator.ClampSkill(skills[5]);
        player.Skill6 = PlayerValueCalculator.ClampSkill(skills[6]);
        player.Skill7 = PlayerValueCalculator.ClampSkill(skills[7]);
        player.Skill8 = PlayerValueCalculator.ClampSkill(skills[8]);
        player.Skill9 = PlayerValueCalculator.ClampSkill(skills[9]);
        player.Skill10 = PlayerValueCalculator.ClampSkill(skills[10]);
        player.Skill11 = PlayerValueCalculator.ClampSkill(skills[11]);
        player.Skill12 = PlayerValueCalculator.ClampSkill(skills[12]);
        player.Skill13 = PlayerValueCalculator.ClampSkill(skills[13]);
    }

    private static void AddSkillGain(decimal[] skills, int index, decimal gain)
    {
        if (index < 0 || index >= skills.Length)
        {
            return;
        }

        skills[index] = PlayerValueCalculator.ClampSkill(skills[index] + gain);
    }

    private static void RecalculatePlayer(TeamPlayerEntity player)
    {
        var skills = GetSkills(player);
        var playerId = Guid.TryParse(player.Id, out var parsedId) ? parsedId : Guid.Empty;
        var bonusSkills = LegacyAppCompatibility.BuildRandomBonusSkills(playerId);
        player.Strength = PlayerValueCalculator.CalculateStrength(skills, player.Position, player.Fitness, player.Age, player.Talent, bonusSkills);
        player.MarketValue = PlayerValueCalculator.CalculateMarketValue(skills, player.Position, player.Fitness, player.Age, player.Talent, bonusSkills);
        if (player.Experience <= 0m)
        {
            player.Experience = LegacyAppCompatibility.BuildExperience(player.Strength, player.Age, player.Matches);
        }
    }

    private async Task<(int Sessions, int Success, int AuthFailures, int ResolvedMatches)> RunFullySimulatedMatchdayAsync(int season, int matchday, CancellationToken ct)
    {
        var bots = _db.GetAllBots();
        var sessions = 0;
        var success = 0;
        var authFail = 0;

        foreach (var bot in bots)
        {
            if (ct.IsCancellationRequested)
            {
                break;
            }

            _api.SetAuditContext(bot.BotId, season, matchday, "bootstrap-session");
            BotSessionResult result;
            try
            {
                result = await ExecuteBotSessionWithTimeoutAsync(bot, ct);
            }
            catch (Exception ex)
            {
                result = new BotSessionResult
                {
                    Success = false,
                    DecisionReason = $"bootstrap-crash:{ex.GetType().Name}"
                };
                _simulationAudit?.LogError(bot.BotId, season, matchday, "bootstrap-session", ex.Message);
            }

            sessions++;
            if (result.Success) success++;
            if (result.AuthFailed) authFail++;

            _simulationAudit?.LogSessionResult(
                bot.BotId,
                bot.TeamName,
                season,
                matchday,
                result.Success,
                result.AuthFailed,
                result.NightSession,
                result.DecisionReason,
                result.ActionsExecuted);

            await Task.Delay(75, ct);
        }

        return (sessions, success, authFail, 0);
    }

    private async Task<(int Sessions, int Success, int AuthFailures, int ResolvedMatches)> RunCentralBrainFastMatchdayAsync(int season, int matchday, CancellationToken ct)
    {
        using var scope = _bootstrapProvider.CreateScope();
        var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();
        var leagueStore = scope.ServiceProvider.GetRequiredService<ILeagueStore>();
        var auctionStore = scope.ServiceProvider.GetRequiredService<IAuctionStore>();
        var sponsorStore = scope.ServiceProvider.GetRequiredService<ISponsorStore>();
        var engine = new MatchSimulationEngine();

        var botTeamIds = await (
            from team in dbContext.Teams.AsNoTracking()
            join user in dbContext.Users.AsNoTracking() on team.UserId equals user.Id
            where user.Email != null && user.Email.EndsWith("@goaltactics.bot")
            select team.Id)
            .ToListAsync(ct);

        if (botTeamIds.Count == 0)
        {
            return (0, 0, 0, 0);
        }

        var leagues = await dbContext.LeagueTeams.AsNoTracking()
            .Where(x => x.TeamId != null && botTeamIds.Contains(x.TeamId))
            .Select(x => x.LeagueId)
            .Distinct()
            .ToListAsync(ct);
        foreach (var leagueId in leagues)
        {
            if (Guid.TryParse(leagueId, out var leagueGuid))
            {
                await leagueStore.EnsureScheduleForLeagueAsync(leagueGuid, ct);
            }
        }

        var pendingMatches = await dbContext.LeagueMatches
            .Where(m => !m.IsPlayed && m.Matchday == matchday && leagues.Contains(m.LeagueId))
            .OrderBy(m => m.ScheduledDateUtc)
            .ToListAsync(ct);

        var resolvedMatches = 0;
        foreach (var match in pendingMatches)
        {
            var homeLeagueTeam = await dbContext.LeagueTeams
                .AsNoTracking()
                .FirstOrDefaultAsync(lt => lt.Id == match.HomeLeagueTeamId, ct);
            var awayLeagueTeam = await dbContext.LeagueTeams
                .AsNoTracking()
                .FirstOrDefaultAsync(lt => lt.Id == match.AwayLeagueTeamId, ct);

            var homeStrength = (int)(homeLeagueTeam?.Strength ?? match.HomeStrength);
            var awayStrength = (int)(awayLeagueTeam?.Strength ?? match.AwayStrength);

            var result = engine.SimulateDetailed(homeStrength, awayStrength, null, null, 0.5, 0.5, null, null, HashCode.Combine(season, matchday, match.Id));
            var matchId = Guid.TryParse(match.Id, out var parsedMatchId) ? parsedMatchId : Guid.Empty;
            await leagueStore.ResolveMatchAsync(matchId, result.HomeScore, result.AwayScore, [], null, ct);
            resolvedMatches++;
        }

        var brainSessions = _config.HistoricalBootstrapCentralBrain
            ? await RunCentralBrainBotDecisionsAsync(season, matchday, ct)
            : (Sessions: 0, Success: 0, AuthFailures: 0);

        if (matchday == 1 || matchday % 3 == 0 || matchday == _config.SimulateMatchdaysPerSeason)
        {
            try
            {
                await auctionStore.SettleExpiredAuctionsAsync(ct);
                await auctionStore.EnsureSystemAuctionsAsync(10, ct);
            }
            catch (DbUpdateException ex)
            {
                Console.Error.WriteLine($"[BootstrapFast] Auction settlement skipped due data inconsistency: {ex.GetType().Name}: {ex.InnerException?.Message ?? ex.Message}");
            }
        }
        await sponsorStore.DeactivateExpiredContractsAsync(ct);

        return (brainSessions.Sessions, brainSessions.Success, brainSessions.AuthFailures, resolvedMatches);
    }

    private async Task<(int Sessions, int Success, int AuthFailures)> RunCentralBrainBotDecisionsAsync(int season, int matchday, CancellationToken ct)
    {
        var bots = _db.GetAllBots();
        if (bots.Count == 0)
        {
            return (0, 0, 0);
        }

        var sessions = 0;
        var success = 0;
        var authFails = 0;
        var brainBatch = Math.Clamp(_config.CentralBrainBotsPerMatchday, 1, Math.Max(1, bots.Count));

        for (var i = 0; i < brainBatch && !ct.IsCancellationRequested; i++)
        {
            var bot = bots[(_centralBrainBotCursor + i) % bots.Count];
            _api.SetAuditContext(bot.BotId, season, matchday, "bootstrap-central-brain");
            sessions++;

            try
            {
                if (!await EnsureAuthenticatedAsync(bot))
                {
                    authFails++;
                    _simulationAudit?.LogSessionResult(bot.BotId, bot.TeamName, season, matchday, false, true, false, "brain-auth-failed", []);
                    continue;
                }

                _api.SetToken(bot.ValidationToken);
                var nightPlan = await _neural.GetOrCreateNightPlanAsync(_api, bot);

                await ExecuteWithRateLimit(bot.BotId, "brain-training", () => _training.ExecuteAsync(_api, bot, nightPlan));
                await ExecuteWithRateLimit(bot.BotId, "brain-stadium", () => _stadium.ExecuteAsync(_api, bot, nightPlan));
                await ExecuteWithRateLimit(bot.BotId, "brain-transfer", () => _transferMarket.ExecuteAsync(_api, bot, nightPlan));
                await ExecuteWithRateLimit(bot.BotId, "brain-social", () => _social.ExecuteAsync(_api, bot, nightPlan));

                success++;
                _simulationAudit?.LogSessionResult(
                    bot.BotId,
                    bot.TeamName,
                    season,
                    matchday,
                    true,
                    false,
                    false,
                    "brain-actions",
                    ["training", "stadium", "transfer", "social"]);
            }
            catch (Exception ex)
            {
                _simulationAudit?.LogError(bot.BotId, season, matchday, "bootstrap-central-brain", ex.Message);
                _simulationAudit?.LogSessionResult(bot.BotId, bot.TeamName, season, matchday, false, false, false, $"brain-crash:{ex.GetType().Name}", []);
            }
            finally
            {
                _api.ClearToken();
            }
        }

        _centralBrainBotCursor = (_centralBrainBotCursor + brainBatch) % bots.Count;
        return (sessions, success, authFails);
    }

    private async Task AlignSeasonStateToAnchorAsync(DateTime anchorDate, CancellationToken ct)
    {
        using var scope = _bootstrapProvider.CreateScope();
        var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();

        var startedAt = anchorDate.AddDays(-(_config.HistoricalBootstrapAnchorSeason - 1) * _config.SimulateMatchdaysPerSeason);
        if (startedAt.Year < 2000 || startedAt.Year > 2100)
        {
            throw new InvalidOperationException($"Calculated season anchor start date is out of range: {startedAt:yyyy-MM-dd}");
        }

        Console.WriteLine($"[Bootstrap] Aligning season state: season {_config.HistoricalBootstrapAnchorSeason} day 1 => {anchorDate:yyyy-MM-dd}, season 1 start => {startedAt:yyyy-MM-dd}");
        var state = await dbContext.SeasonStates.FirstOrDefaultAsync(ct);
        if (state is null)
        {
            state = new Infrastructure.Persistence.Entities.SeasonStateEntity
            {
                Id = "singleton",
                LastSeasonProcessed = _config.HistoricalBootstrapAnchorSeason,
                SeasonNumber = _config.HistoricalBootstrapAnchorSeason,
                CurrentMatchday = 1,
                StartedAtUtc = startedAt
            };
            dbContext.SeasonStates.Add(state);
        }
        else
        {
            state.StartedAtUtc = startedAt;
            state.SeasonNumber = _config.HistoricalBootstrapAnchorSeason;
            state.CurrentMatchday = 1;
            state.LastSeasonProcessed = Math.Max(state.LastSeasonProcessed, _config.HistoricalBootstrapAnchorSeason);
        }

        await dbContext.SaveChangesAsync(ct);
    }

    private async Task TrySeasonalBotGrowthAsync(CancellationToken ct)
    {
        if (!_config.EnableSeasonalBotGrowth)
        {
            return;
        }

        var now = DateTime.UtcNow;
        if ((now - _lastSeasonalGrowthCheckUtc).TotalMinutes < Math.Max(1, _config.SeasonalGrowthCheckMinutes))
        {
            return;
        }

        _lastSeasonalGrowthCheckUtc = now;

        var status = await LoadBootstrapStatusAsync(ct);
        var observed = await TryGetObservedSeasonAsync(ct);
        if (!observed.HasValue || observed.Value.Season <= 0)
        {
            return;
        }

        var observedSeason = observed.Value.Season;
        var observedMatchday = observed.Value.Matchday;

        if (status.LiveSeasonalGrowthLastApplied <= 0)
        {
            status.LiveSeasonalGrowthLastApplied = observedSeason;
            status.ObservedLiveSeason = observedSeason;
            status.ObservedLiveMatchday = observedMatchday;
            status.Phase = status.Completed ? "live" : status.Phase;
            status.UpdatedAtUtc = DateTime.UtcNow.ToString("o");
            await SaveBootstrapStatusAsync(status, ct);
            return;
        }

        if (observedSeason > status.LiveSeasonalGrowthLastApplied)
        {
            var seasonsDelta = observedSeason - status.LiveSeasonalGrowthLastApplied;
            var botsToAdd = seasonsDelta * Math.Max(0, _config.SeasonalBotsPerSeason);
            if (botsToAdd > 0)
            {
                await AddNewBotsAsync(botsToAdd, $"live-season-{observedSeason}", ct);
                Console.WriteLine($"[BotRunner] Seasonal growth applied: +{botsToAdd} bots for season transition {status.LiveSeasonalGrowthLastApplied} -> {observedSeason}.");
            }

            status.LiveSeasonalGrowthLastApplied = observedSeason;
        }

        status.ObservedLiveSeason = observedSeason;
        status.ObservedLiveMatchday = observedMatchday;
        status.TotalBots = _db.GetBotCount();
        status.Phase = status.Completed ? "live" : status.Phase;
        status.UpdatedAtUtc = DateTime.UtcNow.ToString("o");
        await SaveBootstrapStatusAsync(status, ct);
    }

    private async Task AddNewBotsAsync(int count, string modelKeySuffix, CancellationToken ct)
    {
        for (var i = 0; i < count && !ct.IsCancellationRequested; i++)
        {
            var bot = await _factory.CreateBotAsync();
            if (bot is null)
            {
                continue;
            }

            _actionPolicy.EnsureBotModels(bot, modelKeySuffix, forceReset: true);
            _scheduler.ScheduleNextOnline(bot);
            await Task.Delay(150, ct);
        }
    }

    private async Task<(int Season, int Matchday)?> TryGetObservedSeasonAsync(CancellationToken ct)
    {
        var bot = _db.GetAllBots().FirstOrDefault();
        if (bot is null)
        {
            return null;
        }

        if (!await EnsureAuthenticatedAsync(bot))
        {
            return null;
        }

        try
        {
            _api.SetToken(bot.ValidationToken);
            var info = await _api.ExecuteForBotAsync("GetMyTeamExtendedInfo");
            var season = BotApiTranslationReader.GetInt(info.Output, "season");
            var matchday = BotApiTranslationReader.GetInt(info.Output, "matchday");
            return season > 0 ? (season, Math.Max(1, matchday)) : null;
        }
        catch
        {
            return null;
        }
        finally
        {
            _api.ClearToken();
        }
    }

    private async Task<HistoricalBootstrapStatus> LoadBootstrapStatusAsync(CancellationToken ct)
    {
        var path = _config.HistoricalBootstrapStatusPath;
        if (string.IsNullOrWhiteSpace(path) || !File.Exists(path))
        {
            return new HistoricalBootstrapStatus
            {
                CurrentSeason = 1,
                CurrentMatchday = 1,
                MatchdaysPerSeason = _config.SimulateMatchdaysPerSeason,
                TargetSeasons = _config.HistoricalBootstrapSeasons,
                AnchorSeason = _config.HistoricalBootstrapAnchorSeason,
                AnchorDayOneUtc = ParseAnchorDate(_config.HistoricalBootstrapAnchorDayOneUtc).ToString("yyyy-MM-dd")
            };
        }

        try
        {
            await using var stream = File.OpenRead(path);
            var status = await JsonSerializer.DeserializeAsync<HistoricalBootstrapStatus>(stream, cancellationToken: ct);
            if (status is null)
            {
                return new HistoricalBootstrapStatus { CurrentSeason = 1, CurrentMatchday = 1 };
            }

            status.CurrentSeason = Math.Max(1, status.CurrentSeason);
            status.CurrentMatchday = Math.Max(1, status.CurrentMatchday);
            return status;
        }
        catch
        {
            return new HistoricalBootstrapStatus { CurrentSeason = 1, CurrentMatchday = 1 };
        }
    }

    private async Task SaveBootstrapStatusAsync(HistoricalBootstrapStatus status, CancellationToken ct)
    {
        var path = _config.HistoricalBootstrapStatusPath;
        if (string.IsNullOrWhiteSpace(path))
        {
            return;
        }

        var dir = Path.GetDirectoryName(path);
        if (!string.IsNullOrWhiteSpace(dir))
        {
            Directory.CreateDirectory(dir);
        }

        var tempPath = path + ".tmp";
        await File.WriteAllTextAsync(tempPath, JsonSerializer.Serialize(status, new JsonSerializerOptions { WriteIndented = true }), ct);
        File.Move(tempPath, path, overwrite: true);
    }

    private DateTime ParseAnchorDate(string raw)
    {
        if (DateTime.TryParse(raw, out var parsed))
        {
            return parsed.Date;
        }

        return new DateTime(2026, 3, 23, 0, 0, 0, DateTimeKind.Utc);
    }

    private DateTime GetHistoricalDate(DateTime anchorDate, int season, int matchday)
    {
        var maxBackfillSeason = _config.HistoricalBootstrapAnchorSeason - 1;
        var seasonsBack = Math.Max(0, maxBackfillSeason - season);
        var daysBeforeAnchor = (seasonsBack * _config.SimulateMatchdaysPerSeason)
            + (_config.SimulateMatchdaysPerSeason - matchday + 1);
        return anchorDate.AddDays(-daysBeforeAnchor);
    }

    private async Task EnsureBotsRegisteredAsync(CancellationToken ct)
    {
        int existing = _db.GetBotCount();
        int needed = _config.BotCount - existing;

        if (needed <= 0)
        {
            Console.WriteLine($"[BotRunner] {existing} bots already registered (target: {_config.BotCount}).");
            return;
        }

        Console.WriteLine($"[BotRunner] Registering {needed} new bots...");
        for (int i = 0; i < needed && !ct.IsCancellationRequested; i++)
        {
            var bot = await _factory.CreateBotAsync();
            if (bot is not null)
            {
                _actionPolicy.EnsureBotModels(bot);
                // Schedule the bot's first online time (shortly in the future)
                _scheduler.ScheduleNextOnline(bot);
            }

            // Brief pause to avoid hammering the API
            await Task.Delay(200, ct);
        }
    }

    /// <summary>
    /// Main loop: poll scheduler → wake bots → execute behaviors → reschedule.
    /// </summary>
    private async Task MainLoopAsync(CancellationToken ct)
    {
        while (!ct.IsCancellationRequested)
        {
            await TrySeasonalBotGrowthAsync(ct);

            var dueBotIds = _scheduler.GetDueBots(_config.SchedulerBatchSize);

            if (dueBotIds.Count == 0)
            {
                await Task.Delay(_config.SchedulerPollIntervalSeconds * 1000, ct);
                continue;
            }

            foreach (string botId in dueBotIds)
            {
                if (ct.IsCancellationRequested) break;

                var bot = _db.GetBot(botId);
                if (bot is null) continue;

                _actionPolicy.EnsureBotModels(bot);

                try
                {
                    await ExecuteBotSessionWithTimeoutAsync(bot, ct);
                }
                catch (HttpRequestException ex)
                {
                    Console.Error.WriteLine($"[BotRunner] HTTP error for bot {bot.BotId}: {ex.Message}");
                }
                catch (TimeoutException ex)
                {
                    Console.Error.WriteLine($"[BotRunner] Timeout for bot {bot.BotId}: {ex.Message}");
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine($"[BotRunner] Error for bot {bot.BotId}: {ex.Message}");
                }
                finally
                {
                    // Always reschedule
                    _scheduler.ScheduleNextOnline(bot);
                }
            }
        }
    }

    /// <summary>
    /// Execute a single bot's online session: authenticate, run all behaviors, log off.
    /// </summary>
    private async Task<BotSessionResult> ExecuteBotSessionWithTimeoutAsync(BotRecord bot, CancellationToken ct)
    {
        const int sessionTimeoutSeconds = 180;
        var sessionTask = ExecuteBotSessionAsync(bot);
        var timeoutTask = Task.Delay(TimeSpan.FromSeconds(sessionTimeoutSeconds), ct);
        var completedTask = await Task.WhenAny(sessionTask, timeoutTask);

        if (completedTask == sessionTask)
        {
            return await sessionTask;
        }

        if (ct.IsCancellationRequested)
        {
            throw new OperationCanceledException(ct);
        }

        throw new TimeoutException($"Session exceeded {sessionTimeoutSeconds}s.");
    }

    /// <summary>
    /// Execute a single bot's online session: authenticate, run all behaviors, log off.
    /// </summary>
    private async Task<BotSessionResult> ExecuteBotSessionAsync(BotRecord bot)
    {
        Console.WriteLine($"[Bot {bot.BotId}] Waking up ({bot.TeamName})...");
        var result = new BotSessionResult();
        _actionPolicy.EnsureBotModels(bot);

        var sessionPlan = _human.BuildSessionPlan(bot);
        var emotion = _human.GetEmotionalState(bot);

        // Authenticate: reuse token or re-login
        if (!await EnsureAuthenticatedAsync(bot))
        {
            Console.Error.WriteLine($"[Bot {bot.BotId}] Authentication failed, skipping session.");
            result.AuthFailed = true;
            result.DecisionReason = "authentication-failed";
            _human.UpdateLearningAfterSession(bot, success: false, nightSession: false, interrupted: false, executedActions: 0, authFailed: true);
            return result;
        }

        _api.SetToken(bot.ValidationToken);

        if (_human.ShouldRollbackToSafeMode(bot))
        {
            await ExecuteWithRateLimit(bot.BotId, "lineup", () => _lineup.ExecuteAsync(_api, bot, null));
            await ExecuteWithRateLimit(bot.BotId, "daily", () => _dailyRoutine.ExecuteAsync(_api, bot, null));
            _db.AddActionLog(bot.BotId, "rollback", "Safe mode active after repeated neural failures", true, bot.Risk);
            _api.ClearToken();
            Console.WriteLine($"[Bot {bot.BotId}] Safe-mode session complete.");
            result.Success = true;
            result.ActionsExecuted.Add("lineup");
            result.ActionsExecuted.Add("daily");
            result.DecisionReason = "rollback-safe-mode";
            _human.UpdateLearningAfterSession(bot, success: true, nightSession: false, interrupted: false, executedActions: result.ActionsExecuted.Count, authFailed: false);
            return result;
        }

        var nightPlan = await _neural.GetOrCreateNightPlanAsync(_api, bot);
        double confidence = (nightPlan.BidAggression + nightPlan.ScoutIntensity + emotion.Confidence) / 300.0;

        if (IsNightTime(bot))
        {
            await ExecuteNightCycleIfDueAsync(bot, nightPlan);
            _api.ClearToken();
            Console.WriteLine($"[Bot {bot.BotId}] Night session complete.");
            result.Success = true;
            result.NightSession = true;
            result.ActionsExecuted.AddRange(["night-lineup", "night-training", "night-skillcard", "night-transfer", "night-social"]);
            result.DecisionReason = "night-cycle";
            _human.UpdateLearningAfterSession(bot, success: true, nightSession: true, interrupted: false, executedActions: result.ActionsExecuted.Count, authFailed: false);
            return result;
        }

        if (!_human.ShouldExecuteByConfidence(bot, "session", confidence))
        {
            _api.ClearToken();
            result.DecisionReason = $"skipped-low-confidence-{confidence:F2}";
            _human.UpdateLearningAfterSession(bot, success: false, nightSession: false, interrupted: false, executedActions: 0, authFailed: false);
            return result;
        }

        if (_human.ShouldRunSelfAudit(bot))
        {
            _db.AddActionLog(bot.BotId, "self-audit", $"Session plan={sessionPlan.DurationMinutes}m interrupted={sessionPlan.Interrupted}", true, bot.Risk);
        }

        BotApiTranslation? resources = null;
        BotApiTranslation? squad = null;
        try
        {
            resources = await _api.ExecuteForBotAsync("GetMyResources");
            squad = await _api.ExecuteForBotAsync("GetSquad");
        }
        catch (HttpRequestException ex)
        {
            Console.Error.WriteLine($"[ActionError] bootstrap: {ex.Message}");
        }

        if (resources is not null && resources.Success && squad is not null)
        {
            var money = BotApiTranslationReader.GetDecimal(resources.Output, "money");
            var stars = BotApiTranslationReader.GetDecimal(resources.Output, "gtStars");
            int squadSize = BotApiTranslationReader.GetObjectList(squad, "players").Count;
            _human.UpdateKpisAndScenario(bot, money, stars, squadSize);
        }

        // Execute behaviors in priority order with rate-limit checks
        await ExecuteWithRateLimit(bot.BotId, "daily", () => _dailyRoutine.ExecuteAsync(_api, bot, nightPlan));
        result.ActionsExecuted.Add("daily");
        await ExecuteWithRateLimit(bot.BotId, "lineup", () => _lineup.ExecuteAsync(_api, bot, nightPlan));
        result.ActionsExecuted.Add("lineup");
        await ExecuteWithRateLimit(bot.BotId, "training", () => _training.ExecuteAsync(_api, bot, nightPlan));
        result.ActionsExecuted.Add("training");
        await ExecuteWithRateLimit(bot.BotId, "skillcard", () => _skillCard.ExecuteAsync(_api, bot, nightPlan));
        result.ActionsExecuted.Add("skillcard");
        await ExecuteWithRateLimit(bot.BotId, "stadium", () => _stadium.ExecuteAsync(_api, bot, nightPlan));
        result.ActionsExecuted.Add("stadium");
        await ExecuteWithRateLimit(bot.BotId, "transfer", () => _transferMarket.ExecuteAsync(_api, bot, nightPlan));
        result.ActionsExecuted.Add("transfer");
        await ExecuteWithRateLimit(bot.BotId, "social", () => _social.ExecuteAsync(_api, bot, nightPlan));
        result.ActionsExecuted.Add("social");

        if (sessionPlan.Interrupted)
        {
            _db.AddActionLog(bot.BotId, "session", "Interrupted naturally to simulate human behavior", true, bot.Risk);
        }

        _api.ClearToken();
        Console.WriteLine($"[Bot {bot.BotId}] Session complete.");
        result.Success = true;
        result.DecisionReason = $"confidence={confidence:F2};interrupted={sessionPlan.Interrupted}";
        _human.UpdateLearningAfterSession(bot, success: true, nightSession: false, interrupted: sessionPlan.Interrupted, executedActions: result.ActionsExecuted.Count, authFailed: false);
        return result;
    }

    private async Task ExecuteNightCycleIfDueAsync(BotRecord bot, BotNightPlan nightPlan)
    {
        string localDate = GetLocalDate(bot);
        if (_db.HasNightCycleRun(bot.BotId, localDate))
        {
            return;
        }

        Console.WriteLine($"[Bot {bot.BotId}] Running night cycle ({localDate})...");

        // Night cycle focuses on strategic actions decided by the nightly plan.
        await ExecuteWithRateLimit(bot.BotId, "night-lineup", () => _lineup.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit(bot.BotId, "night-training", () => _training.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit(bot.BotId, "night-skillcard", () => _skillCard.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit(bot.BotId, "night-transfer", () => _transferMarket.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit(bot.BotId, "night-social", () => _social.ExecuteAsync(_api, bot, nightPlan));

        _db.MarkNightCycleRun(bot.BotId, localDate);
    }

    private async Task<bool> EnsureAuthenticatedAsync(BotRecord bot)
    {
        // Try existing token first
        if (!string.IsNullOrEmpty(bot.ValidationToken))
        {
            _api.SetToken(bot.ValidationToken);
            try
            {
                var resources = await _api.ExecuteForBotAsync("GetMyResources");
                if (resources.Success) return true;
            }
            catch (HttpRequestException ex) when (ex.Message.Contains("429 Too Many Requests", StringComparison.OrdinalIgnoreCase))
            {
                // Under temporary throttling, keep using the known token instead of forcing re-login.
                return true;
            }
            catch
            {
                // Token expired — re-login below
            }
        }

        // Re-login
        string email = BotFactory.SanitizeEmail(bot.TeamName);
        BotApiTranslation loginResult;
        try
        {
            loginResult = await _api.ExecuteForBotAsync("Login", new LoginRequest
            {
                Email = email,
                Password = bot.Password
            });
        }
        catch (HttpRequestException ex)
        {
            Console.Error.WriteLine($"[Auth] Re-login failed for {bot.BotId}: {ex.Message}");
            return false;
        }

        if (!loginResult.Success)
            return false;

        var token = BotApiTranslationReader.GetString(loginResult.Output, "token");
        if (string.IsNullOrWhiteSpace(token))
            return false;

        _db.UpdateBotToken(bot.BotId, token);
        bot.ValidationToken = token;
        return true;
    }

    private async Task ExecuteWithRateLimit(string botId, string action, Func<Task> execute)
    {
        var rateLimitKey = $"{botId}:{action}";
        int cooldown = action switch
        {
            "transfer" => _config.Rates.BidCooldownSeconds,
            "social" => _config.Rates.ChatCooldownSeconds,
            _ => _config.Rates.DefaultCooldownSeconds
        };

        if (_rateLimits.TryGetValue(rateLimitKey, out var lastRun))
        {
            double elapsed = (DateTime.UtcNow - lastRun).TotalSeconds;
            if (elapsed < cooldown) return;
        }

        try
        {
            await execute();
        }
        catch (HttpRequestException ex) when (ex.StatusCode == System.Net.HttpStatusCode.TooManyRequests)
        {
            Console.Error.WriteLine($"[RateLimit] {action}: rate limited, backing off.");
        }
        catch (HttpRequestException ex)
        {
            Console.Error.WriteLine($"[ActionError] {action}: {ex.Message}");
        }
        catch (Exception ex)
        {
            Console.Error.WriteLine($"[ActionError] {action}: {ex.Message}");
        }

        _rateLimits[rateLimitKey] = DateTime.UtcNow;
    }

    private bool IsNightTime(BotRecord bot)
    {
        var localHour = GetLocalHour(bot);
        int start = _config.NightPlanningStartHourLocal;
        int end = _config.NightPlanningEndHourLocal;

        if (start == end)
        {
            return true;
        }

        if (start < end)
        {
            return localHour >= start && localHour < end;
        }

        return localHour >= start || localHour < end;
    }

    private static int GetLocalHour(BotRecord bot)
    {
        var utcNow = DateTime.UtcNow;
        try
        {
            var tz = TimeZoneInfo.FindSystemTimeZoneById(bot.Timezone);
            return TimeZoneInfo.ConvertTimeFromUtc(utcNow, tz).Hour;
        }
        catch
        {
            return utcNow.Hour;
        }
    }

    private static string GetLocalDate(BotRecord bot)
    {
        var utcNow = DateTime.UtcNow;
        try
        {
            var tz = TimeZoneInfo.FindSystemTimeZoneById(bot.Timezone);
            return TimeZoneInfo.ConvertTimeFromUtc(utcNow, tz).ToString("yyyy-MM-dd");
        }
        catch
        {
            return utcNow.ToString("yyyy-MM-dd");
        }
    }

    private sealed class BotSessionResult
    {
        public bool Success { get; set; }
        public bool AuthFailed { get; set; }
        public bool NightSession { get; set; }
        public string DecisionReason { get; set; } = "";
        public List<string> ActionsExecuted { get; } = [];
    }

    private sealed class HistoricalBootstrapStatus
    {
        public string Phase { get; set; } = "idle";
        public bool Completed { get; set; }
        public int TargetSeasons { get; set; }
        public int MatchdaysPerSeason { get; set; }
        public int CurrentSeason { get; set; } = 1;
        public int CurrentMatchday { get; set; } = 1;
        public int CompletedSeasons { get; set; }
        public long TotalSessions { get; set; }
        public long TotalSuccess { get; set; }
        public long TotalAuthFailures { get; set; }
        public int TotalBots { get; set; }
        public int AnchorSeason { get; set; }
        public string AnchorDayOneUtc { get; set; } = "";
        public string VirtualDateUtc { get; set; } = "";
        public int LiveSeasonalGrowthLastApplied { get; set; }
        public int ObservedLiveSeason { get; set; }
        public int ObservedLiveMatchday { get; set; }
        public string? StartedAtUtc { get; set; }
        public string? UpdatedAtUtc { get; set; }
        public string? CompletedAtUtc { get; set; }
        public string? RunDirectory { get; set; }
    }
}
