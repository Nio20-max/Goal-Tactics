using Microsoft.Data.Sqlite;

namespace GoalTactics.Bots.Client.Database;

/// <summary>
/// Manages the standalone bot SQLite database with tables:
/// Bots, BotRelationships, BotSchedule, BotGroups.
/// </summary>
public sealed class BotDatabase : IDisposable
{
    private readonly SqliteConnection _connection;

    public BotDatabase(string databasePath)
    {
        _connection = new SqliteConnection($"Data Source={databasePath}");
        _connection.Open();
        EnsureSchema();
    }

    public void Dispose() => _connection.Dispose();

    // ── Schema ──────────────────────────────────────────────────

    private void EnsureSchema()
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            CREATE TABLE IF NOT EXISTS BotGroups (
                GroupId     INTEGER PRIMARY KEY,
                Name        TEXT    NOT NULL DEFAULT '',
                CreatedAt   TEXT    NOT NULL DEFAULT (datetime('now'))
            );

            CREATE TABLE IF NOT EXISTS Bots (
                BotId           TEXT    PRIMARY KEY,
                Password        TEXT    NOT NULL,
                ValidationToken TEXT    NOT NULL DEFAULT '',
                TeamName        TEXT    NOT NULL,
                ManagerName     TEXT    NOT NULL,
                Timezone        TEXT    NOT NULL DEFAULT 'Europe/Berlin',
                ActiveHours     TEXT    NOT NULL DEFAULT '{}',
                SleepHours      TEXT    NOT NULL DEFAULT '{}',
                Activity        INTEGER NOT NULL DEFAULT 50,
                Risk            INTEGER NOT NULL DEFAULT 50,
                YouthFocus      INTEGER NOT NULL DEFAULT 50,
                SocialScore     INTEGER NOT NULL DEFAULT 50,
                StarsDaily      INTEGER NOT NULL DEFAULT 0,
                NextOnline      TEXT    NULL,
                LastOffline     TEXT    NULL,
                GroupId         INTEGER NULL REFERENCES BotGroups(GroupId),
                CreatedAt       TEXT    NOT NULL DEFAULT (datetime('now')),
                UpdatedAt       TEXT    NOT NULL DEFAULT (datetime('now'))
            );

            CREATE TABLE IF NOT EXISTS BotRelationships (
                BotId1  TEXT    NOT NULL REFERENCES Bots(BotId),
                BotId2  TEXT    NOT NULL,
                Level   INTEGER NOT NULL DEFAULT 0,
                PRIMARY KEY (BotId1, BotId2)
            );

            CREATE TABLE IF NOT EXISTS BotSchedule (
                BotId       TEXT PRIMARY KEY REFERENCES Bots(BotId),
                NextOnline  TEXT NOT NULL
            );

            CREATE INDEX IF NOT EXISTS IX_BotSchedule_NextOnline
                ON BotSchedule(NextOnline);
            """;
        cmd.ExecuteNonQuery();
    }

    // ── Bots CRUD ───────────────────────────────────────────────

    public void InsertBot(BotRecord bot)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            INSERT INTO Bots (BotId, Password, ValidationToken, TeamName, ManagerName,
                              Timezone, ActiveHours, SleepHours,
                              Activity, Risk, YouthFocus, SocialScore, StarsDaily,
                              NextOnline, LastOffline, GroupId, CreatedAt, UpdatedAt)
            VALUES (@id, @pw, @token, @team, @manager,
                    @tz, @active, @sleep,
                    @activity, @risk, @youth, @social, @stars,
                    @next, @last, @group, datetime('now'), datetime('now'))
            """;
        cmd.Parameters.AddWithValue("@id", bot.BotId);
        cmd.Parameters.AddWithValue("@pw", bot.Password);
        cmd.Parameters.AddWithValue("@token", bot.ValidationToken);
        cmd.Parameters.AddWithValue("@team", bot.TeamName);
        cmd.Parameters.AddWithValue("@manager", bot.ManagerName);
        cmd.Parameters.AddWithValue("@tz", bot.Timezone);
        cmd.Parameters.AddWithValue("@active", bot.ActiveHours);
        cmd.Parameters.AddWithValue("@sleep", bot.SleepHours);
        cmd.Parameters.AddWithValue("@activity", bot.Activity);
        cmd.Parameters.AddWithValue("@risk", bot.Risk);
        cmd.Parameters.AddWithValue("@youth", bot.YouthFocus);
        cmd.Parameters.AddWithValue("@social", bot.SocialScore);
        cmd.Parameters.AddWithValue("@stars", bot.StarsDaily);
        cmd.Parameters.AddWithValue("@next", (object?)bot.NextOnline ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@last", (object?)bot.LastOffline ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@group", (object?)bot.GroupId ?? DBNull.Value);
        cmd.ExecuteNonQuery();
    }

    public BotRecord? GetBot(string botId)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = "SELECT * FROM Bots WHERE BotId = @id";
        cmd.Parameters.AddWithValue("@id", botId);
        using var reader = cmd.ExecuteReader();
        return reader.Read() ? ReadBotRecord(reader) : null;
    }

    public List<BotRecord> GetAllBots()
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = "SELECT * FROM Bots ORDER BY BotId";
        using var reader = cmd.ExecuteReader();
        var bots = new List<BotRecord>();
        while (reader.Read())
            bots.Add(ReadBotRecord(reader));
        return bots;
    }

    public void UpdateBotToken(string botId, string token)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            UPDATE Bots SET ValidationToken = @token, UpdatedAt = datetime('now')
            WHERE BotId = @id
            """;
        cmd.Parameters.AddWithValue("@token", token);
        cmd.Parameters.AddWithValue("@id", botId);
        cmd.ExecuteNonQuery();
    }

    public void UpdateBotSchedule(string botId, string? nextOnline, string? lastOffline)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            UPDATE Bots SET NextOnline = @next, LastOffline = @last, UpdatedAt = datetime('now')
            WHERE BotId = @id
            """;
        cmd.Parameters.AddWithValue("@next", (object?)nextOnline ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@last", (object?)lastOffline ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@id", botId);
        cmd.ExecuteNonQuery();
    }

    public void UpdateBotGroup(string botId, int? groupId)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            UPDATE Bots SET GroupId = @group, UpdatedAt = datetime('now')
            WHERE BotId = @id
            """;
        cmd.Parameters.AddWithValue("@group", (object?)groupId ?? DBNull.Value);
        cmd.Parameters.AddWithValue("@id", botId);
        cmd.ExecuteNonQuery();
    }

    public int GetBotCount()
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = "SELECT COUNT(*) FROM Bots";
        return Convert.ToInt32(cmd.ExecuteScalar());
    }

    // ── BotSchedule CRUD ────────────────────────────────────────

    public void UpsertSchedule(string botId, DateTime nextOnline)
    {
        string ts = nextOnline.ToString("o");
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            INSERT INTO BotSchedule (BotId, NextOnline) VALUES (@id, @next)
            ON CONFLICT(BotId) DO UPDATE SET NextOnline = @next
            """;
        cmd.Parameters.AddWithValue("@id", botId);
        cmd.Parameters.AddWithValue("@next", ts);
        cmd.ExecuteNonQuery();

        // Keep Bots table in sync
        UpdateBotSchedule(botId, ts, null);
    }

    /// <summary>
    /// Retrieves up to <paramref name="limit"/> bots whose NextOnline is at or before now.
    /// </summary>
    public List<string> GetDueBots(int limit = 10)
    {
        string now = DateTime.UtcNow.ToString("o");
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            SELECT BotId FROM BotSchedule
            WHERE NextOnline <= @now
            ORDER BY NextOnline
            LIMIT @limit
            """;
        cmd.Parameters.AddWithValue("@now", now);
        cmd.Parameters.AddWithValue("@limit", limit);
        using var reader = cmd.ExecuteReader();
        var ids = new List<string>();
        while (reader.Read())
            ids.Add(reader.GetString(0));
        return ids;
    }

    // ── BotRelationships CRUD ───────────────────────────────────

    public void UpsertRelationship(string botId1, string botId2, int level)
    {
        level = Math.Clamp(level, -100, 100);
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            INSERT INTO BotRelationships (BotId1, BotId2, Level) VALUES (@b1, @b2, @level)
            ON CONFLICT(BotId1, BotId2) DO UPDATE SET Level = @level
            """;
        cmd.Parameters.AddWithValue("@b1", botId1);
        cmd.Parameters.AddWithValue("@b2", botId2);
        cmd.Parameters.AddWithValue("@level", level);
        cmd.ExecuteNonQuery();
    }

    public int GetRelationshipLevel(string botId1, string botId2)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = "SELECT Level FROM BotRelationships WHERE BotId1 = @b1 AND BotId2 = @b2";
        cmd.Parameters.AddWithValue("@b1", botId1);
        cmd.Parameters.AddWithValue("@b2", botId2);
        var result = cmd.ExecuteScalar();
        return result is null ? 0 : Convert.ToInt32(result);
    }

    public List<(string OtherId, int Level)> GetRelationships(string botId)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            SELECT BotId2, Level FROM BotRelationships WHERE BotId1 = @id
            UNION
            SELECT BotId1, Level FROM BotRelationships WHERE BotId2 = @id
            """;
        cmd.Parameters.AddWithValue("@id", botId);
        using var reader = cmd.ExecuteReader();
        var results = new List<(string, int)>();
        while (reader.Read())
            results.Add((reader.GetString(0), reader.GetInt32(1)));
        return results;
    }

    // ── BotGroups CRUD ──────────────────────────────────────────

    public void InsertGroup(int groupId, string name)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            INSERT OR IGNORE INTO BotGroups (GroupId, Name) VALUES (@id, @name)
            """;
        cmd.Parameters.AddWithValue("@id", groupId);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.ExecuteNonQuery();
    }

    public List<BotGroupRecord> GetAllGroups()
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = "SELECT GroupId, Name, CreatedAt FROM BotGroups ORDER BY GroupId";
        using var reader = cmd.ExecuteReader();
        var groups = new List<BotGroupRecord>();
        while (reader.Read())
            groups.Add(new BotGroupRecord
            {
                GroupId = reader.GetInt32(0),
                Name = reader.GetString(1),
                CreatedAt = reader.GetString(2)
            });
        return groups;
    }

    public int GetGroupCount()
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = "SELECT COUNT(*) FROM BotGroups";
        return Convert.ToInt32(cmd.ExecuteScalar());
    }

    // ── Helpers ─────────────────────────────────────────────────

    private static BotRecord ReadBotRecord(SqliteDataReader reader) => new()
    {
        BotId = reader.GetString(reader.GetOrdinal("BotId")),
        Password = reader.GetString(reader.GetOrdinal("Password")),
        ValidationToken = reader.GetString(reader.GetOrdinal("ValidationToken")),
        TeamName = reader.GetString(reader.GetOrdinal("TeamName")),
        ManagerName = reader.GetString(reader.GetOrdinal("ManagerName")),
        Timezone = reader.GetString(reader.GetOrdinal("Timezone")),
        ActiveHours = reader.GetString(reader.GetOrdinal("ActiveHours")),
        SleepHours = reader.GetString(reader.GetOrdinal("SleepHours")),
        Activity = reader.GetInt32(reader.GetOrdinal("Activity")),
        Risk = reader.GetInt32(reader.GetOrdinal("Risk")),
        YouthFocus = reader.GetInt32(reader.GetOrdinal("YouthFocus")),
        SocialScore = reader.GetInt32(reader.GetOrdinal("SocialScore")),
        StarsDaily = reader.GetInt32(reader.GetOrdinal("StarsDaily")),
        NextOnline = reader.IsDBNull(reader.GetOrdinal("NextOnline")) ? null : reader.GetString(reader.GetOrdinal("NextOnline")),
        LastOffline = reader.IsDBNull(reader.GetOrdinal("LastOffline")) ? null : reader.GetString(reader.GetOrdinal("LastOffline")),
        GroupId = reader.IsDBNull(reader.GetOrdinal("GroupId")) ? null : reader.GetInt32(reader.GetOrdinal("GroupId")),
        CreatedAt = reader.GetString(reader.GetOrdinal("CreatedAt")),
        UpdatedAt = reader.GetString(reader.GetOrdinal("UpdatedAt"))
    };
}

// ── Record types ────────────────────────────────────────────────

public sealed class BotRecord
{
    public string BotId { get; set; } = "";
    public string Password { get; set; } = "";
    public string ValidationToken { get; set; } = "";
    public string TeamName { get; set; } = "";
    public string ManagerName { get; set; } = "";
    public string Timezone { get; set; } = "Europe/Berlin";
    public string ActiveHours { get; set; } = "{}";
    public string SleepHours { get; set; } = "{}";
    public int Activity { get; set; }
    public int Risk { get; set; }
    public int YouthFocus { get; set; }
    public int SocialScore { get; set; }
    public int StarsDaily { get; set; }
    public string? NextOnline { get; set; }
    public string? LastOffline { get; set; }
    public int? GroupId { get; set; }
    public string CreatedAt { get; set; } = "";
    public string UpdatedAt { get; set; } = "";
}

public sealed class BotGroupRecord
{
    public int GroupId { get; set; }
    public string Name { get; set; } = "";
    public string CreatedAt { get; set; } = "";
}
