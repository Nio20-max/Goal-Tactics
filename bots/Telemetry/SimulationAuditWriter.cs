using System.Text.Json;

namespace GoalTactics.Bots.Client.Telemetry;

public sealed class SimulationAuditWriter : IDisposable
{
    private readonly object _sync = new();
    private readonly StreamWriter _apiCalls;
    private readonly StreamWriter _sessionResults;
    private readonly StreamWriter _teamSnapshots;
    private readonly StreamWriter _squadSnapshots;
    private readonly StreamWriter _errors;

    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        WriteIndented = false
    };

    public SimulationAuditWriter(string runDir)
    {
        Directory.CreateDirectory(runDir);
        _apiCalls = CreateWriter(Path.Combine(runDir, "api-calls.ndjson"));
        _sessionResults = CreateWriter(Path.Combine(runDir, "session-results.ndjson"));
        _teamSnapshots = CreateWriter(Path.Combine(runDir, "team-snapshots.ndjson"));
        _squadSnapshots = CreateWriter(Path.Combine(runDir, "squad-snapshots.ndjson"));
        _errors = CreateWriter(Path.Combine(runDir, "errors.ndjson"));
    }

    public void Dispose()
    {
        lock (_sync)
        {
            _apiCalls.Dispose();
            _sessionResults.Dispose();
            _teamSnapshots.Dispose();
            _squadSnapshots.Dispose();
            _errors.Dispose();
        }
    }

    public void LogApiCall(string? botId, int? season, int? matchday, string phase, string endpoint, bool success, int? statusCode, long durationMs, string requestJson, string outputJson, string? error)
    {
        var payload = new
        {
            tsUtc = DateTime.UtcNow,
            botId,
            season,
            matchday,
            phase,
            endpoint,
            success,
            statusCode,
            durationMs,
            requestJson,
            outputJson,
            error
        };

        WriteLine(_apiCalls, payload);
    }

    public void LogSessionResult(string botId, string teamName, int season, int matchday, bool success, bool authFailed, bool nightSession, string decisionReason, IReadOnlyList<string> actions)
    {
        var payload = new
        {
            tsUtc = DateTime.UtcNow,
            botId,
            teamName,
            season,
            matchday,
            success,
            authFailed,
            nightSession,
            decisionReason,
            actions
        };

        WriteLine(_sessionResults, payload);
    }

    public void LogTeamSnapshot(
        string botId,
        string teamName,
        int season,
        int matchday,
        Dictionary<string, object?> team,
        Dictionary<string, object?> resources,
        Dictionary<string, object?> stadium,
        Dictionary<string, object?> training,
        Dictionary<string, object?> transfermarket)
    {
        var payload = new
        {
            tsUtc = DateTime.UtcNow,
            botId,
            teamName,
            season,
            matchday,
            team,
            resources,
            stadium,
            training,
            transfermarket
        };

        WriteLine(_teamSnapshots, payload);
    }

    public void LogSquadSnapshot(string botId, string teamName, int season, int matchday, List<Dictionary<string, object?>> players, List<Dictionary<string, object?>> playersOnTransfermarket)
    {
        var payload = new
        {
            tsUtc = DateTime.UtcNow,
            botId,
            teamName,
            season,
            matchday,
            players,
            playersOnTransfermarket
        };

        WriteLine(_squadSnapshots, payload);
    }

    public void LogError(string? botId, int? season, int? matchday, string phase, string message)
    {
        var payload = new
        {
            tsUtc = DateTime.UtcNow,
            botId,
            season,
            matchday,
            phase,
            message
        };

        WriteLine(_errors, payload);
    }

    private static StreamWriter CreateWriter(string path)
    {
        var stream = new FileStream(path, FileMode.Append, FileAccess.Write, FileShare.Read);
        return new StreamWriter(stream) { AutoFlush = true };
    }

    private void WriteLine(StreamWriter writer, object payload)
    {
        var json = JsonSerializer.Serialize(payload, JsonOptions);
        lock (_sync)
        {
            writer.WriteLine(json);
        }
    }
}