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
        ConfigureSqlitePragmas();
        EnsureSchema();
    }

    public void Dispose() => _connection.Dispose();

    private void ConfigureSqlitePragmas()
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            PRAGMA journal_mode=WAL;
            PRAGMA synchronous=NORMAL;
            PRAGMA busy_timeout=5000;
            """;
        cmd.ExecuteNonQuery();
    }

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

            CREATE TABLE IF NOT EXISTS BotNightPlans (
                BotId           TEXT    NOT NULL REFERENCES Bots(BotId),
                LocalDate       TEXT    NOT NULL,
                PlanJson        TEXT    NOT NULL,
                GeneratedBy     TEXT    NOT NULL DEFAULT 'fallback',
                CreatedAt       TEXT    NOT NULL DEFAULT (datetime('now')),
                UpdatedAt       TEXT    NOT NULL DEFAULT (datetime('now')),
                PRIMARY KEY (BotId, LocalDate)
            );

            CREATE TABLE IF NOT EXISTS BotGroupChatMessages (
                Id          INTEGER PRIMARY KEY AUTOINCREMENT,
                GroupId     INTEGER NOT NULL REFERENCES BotGroups(GroupId),
                BotId       TEXT    NOT NULL REFERENCES Bots(BotId),
                Kind        TEXT    NOT NULL DEFAULT 'group-transfer-intent',
                Message     TEXT    NOT NULL,
                CreatedAt   TEXT    NOT NULL DEFAULT (datetime('now'))
            );

            CREATE TABLE IF NOT EXISTS BotNightCycles (
                BotId           TEXT    NOT NULL REFERENCES Bots(BotId),
                LocalDate       TEXT    NOT NULL,
                LastRunAtUtc    TEXT    NOT NULL,
                PRIMARY KEY (BotId, LocalDate)
            );

            CREATE TABLE IF NOT EXISTS BotState (
                BotId       TEXT    NOT NULL REFERENCES Bots(BotId),
                StateKey    TEXT    NOT NULL,
                StateValue  TEXT    NOT NULL,
                UpdatedAt   TEXT    NOT NULL DEFAULT (datetime('now')),
                PRIMARY KEY (BotId, StateKey)
            );

            CREATE TABLE IF NOT EXISTS BotActionLogs (
                Id          INTEGER PRIMARY KEY AUTOINCREMENT,
                BotId       TEXT    NOT NULL REFERENCES Bots(BotId),
                Action      TEXT    NOT NULL,
                Reason      TEXT    NOT NULL,
                Success     INTEGER NOT NULL,
                RiskScore   INTEGER NOT NULL DEFAULT 0,
                CreatedAt   TEXT    NOT NULL DEFAULT (datetime('now'))
            );

            CREATE TABLE IF NOT EXISTS BotTransferShortlist (
                Id          INTEGER PRIMARY KEY AUTOINCREMENT,
                BotId       TEXT    NOT NULL REFERENCES Bots(BotId),
                AuctionId   TEXT    NOT NULL,
                PlayerName  TEXT    NOT NULL,
                Priority    TEXT    NOT NULL,
                ExpiresAt   TEXT    NOT NULL,
                Profile     TEXT    NOT NULL DEFAULT 'balanced',
                AddedAt     TEXT    NOT NULL DEFAULT (datetime('now'))
            );

            CREATE TABLE IF NOT EXISTS BotAuctionEvents (
                Id          INTEGER PRIMARY KEY AUTOINCREMENT,
                BotId       TEXT    NOT NULL REFERENCES Bots(BotId),
                AuctionId   TEXT    NOT NULL,
                EventType   TEXT    NOT NULL,
                CreatedAt   TEXT    NOT NULL DEFAULT (datetime('now'))
            );

            CREATE TABLE IF NOT EXISTS BotGroupCoordination (
                GroupId     INTEGER NOT NULL REFERENCES BotGroups(GroupId),
                Topic       TEXT    NOT NULL,
                Value       TEXT    NOT NULL,
                UpdatedAt   TEXT    NOT NULL DEFAULT (datetime('now')),
                PRIMARY KEY (GroupId, Topic)
            );

            CREATE TABLE IF NOT EXISTS BotKpis (
                BotId       TEXT    NOT NULL REFERENCES Bots(BotId),
                LocalDate   TEXT    NOT NULL,
                KpiJson     TEXT    NOT NULL,
                Scenario    TEXT    NOT NULL,
                UpdatedAt   TEXT    NOT NULL DEFAULT (datetime('now')),
                PRIMARY KEY (BotId, LocalDate)
            );

            CREATE INDEX IF NOT EXISTS IX_BotSchedule_NextOnline
                ON BotSchedule(NextOnline);

            CREATE INDEX IF NOT EXISTS IX_BotNightPlans_Date
                ON BotNightPlans(LocalDate);

            CREATE INDEX IF NOT EXISTS IX_BotGroupChatMessages_GroupCreated
                ON BotGroupChatMessages(GroupId, CreatedAt DESC);

            CREATE INDEX IF NOT EXISTS IX_BotNightCycles_LocalDate
                ON BotNightCycles(LocalDate);

            CREATE INDEX IF NOT EXISTS IX_BotActionLogs_BotActionCreated
                ON BotActionLogs(BotId, Action, CreatedAt DESC);

            CREATE INDEX IF NOT EXISTS IX_BotTransferShortlist_BotExpires
                ON BotTransferShortlist(BotId, ExpiresAt);

            CREATE INDEX IF NOT EXISTS IX_BotAuctionEvents_BotAuctionCreated
                ON BotAuctionEvents(BotId, AuctionId, CreatedAt DESC);

            CREATE INDEX IF NOT EXISTS IX_BotKpis_BotDate
                ON BotKpis(BotId, LocalDate DESC);
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

    public List<BotRecord> GetBotsInGroup(int groupId)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = "SELECT * FROM Bots WHERE GroupId = @groupId ORDER BY BotId";
        cmd.Parameters.AddWithValue("@groupId", groupId);
        using var reader = cmd.ExecuteReader();
        var bots = new List<BotRecord>();
        while (reader.Read())
            bots.Add(ReadBotRecord(reader));
        return bots;
    }

    // ── Night plans ────────────────────────────────────────────

    public void UpsertNightPlan(string botId, string localDate, string planJson, string generatedBy)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            INSERT INTO BotNightPlans (BotId, LocalDate, PlanJson, GeneratedBy, CreatedAt, UpdatedAt)
            VALUES (@botId, @localDate, @planJson, @generatedBy, datetime('now'), datetime('now'))
            ON CONFLICT(BotId, LocalDate)
            DO UPDATE SET
                PlanJson = @planJson,
                GeneratedBy = @generatedBy,
                UpdatedAt = datetime('now')
            """;
        cmd.Parameters.AddWithValue("@botId", botId);
        cmd.Parameters.AddWithValue("@localDate", localDate);
        cmd.Parameters.AddWithValue("@planJson", planJson);
        cmd.Parameters.AddWithValue("@generatedBy", generatedBy);
        cmd.ExecuteNonQuery();
    }

    public BotNightPlanRecord? GetNightPlan(string botId, string localDate)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            SELECT BotId, LocalDate, PlanJson, GeneratedBy, CreatedAt, UpdatedAt
            FROM BotNightPlans
            WHERE BotId = @botId AND LocalDate = @localDate
            """;
        cmd.Parameters.AddWithValue("@botId", botId);
        cmd.Parameters.AddWithValue("@localDate", localDate);
        using var reader = cmd.ExecuteReader();
        if (!reader.Read())
        {
            return null;
        }

        return new BotNightPlanRecord
        {
            BotId = reader.GetString(0),
            LocalDate = reader.GetString(1),
            PlanJson = reader.GetString(2),
            GeneratedBy = reader.GetString(3),
            CreatedAt = reader.GetString(4),
            UpdatedAt = reader.GetString(5)
        };
    }

    // ── Group chat ─────────────────────────────────────────────

    public void AddGroupChatMessage(int groupId, string botId, string message, string kind = "group-transfer-intent")
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            INSERT INTO BotGroupChatMessages (GroupId, BotId, Kind, Message, CreatedAt)
            VALUES (@groupId, @botId, @kind, @message, datetime('now'))
            """;
        cmd.Parameters.AddWithValue("@groupId", groupId);
        cmd.Parameters.AddWithValue("@botId", botId);
        cmd.Parameters.AddWithValue("@kind", kind);
        cmd.Parameters.AddWithValue("@message", message);
        cmd.ExecuteNonQuery();
    }

    public List<BotGroupChatMessageRecord> GetRecentGroupChatMessages(int groupId, int limit = 20)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            SELECT Id, GroupId, BotId, Kind, Message, CreatedAt
            FROM BotGroupChatMessages
            WHERE GroupId = @groupId
            ORDER BY Id DESC
            LIMIT @limit
            """;
        cmd.Parameters.AddWithValue("@groupId", groupId);
        cmd.Parameters.AddWithValue("@limit", Math.Max(1, limit));
        using var reader = cmd.ExecuteReader();
        var messages = new List<BotGroupChatMessageRecord>();
        while (reader.Read())
        {
            messages.Add(new BotGroupChatMessageRecord
            {
                Id = reader.GetInt64(0),
                GroupId = reader.GetInt32(1),
                BotId = reader.GetString(2),
                Kind = reader.GetString(3),
                Message = reader.GetString(4),
                CreatedAt = reader.GetString(5)
            });
        }

        messages.Reverse();
        return messages;
    }

    // ── Night cycle state ─────────────────────────────────────

    public bool HasNightCycleRun(string botId, string localDate)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            SELECT 1
            FROM BotNightCycles
            WHERE BotId = @botId AND LocalDate = @localDate
            LIMIT 1
            """;
        cmd.Parameters.AddWithValue("@botId", botId);
        cmd.Parameters.AddWithValue("@localDate", localDate);
        var result = cmd.ExecuteScalar();
        return result is not null;
    }

    public void MarkNightCycleRun(string botId, string localDate)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            INSERT INTO BotNightCycles (BotId, LocalDate, LastRunAtUtc)
            VALUES (@botId, @localDate, @runAt)
            ON CONFLICT(BotId, LocalDate)
            DO UPDATE SET LastRunAtUtc = @runAt
            """;
        cmd.Parameters.AddWithValue("@botId", botId);
        cmd.Parameters.AddWithValue("@localDate", localDate);
        cmd.Parameters.AddWithValue("@runAt", DateTime.UtcNow.ToString("o"));
        cmd.ExecuteNonQuery();
    }

    // ── Bot state / memory ────────────────────────────────────

    public void UpsertBotState(string botId, string stateKey, string stateValue)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            INSERT INTO BotState (BotId, StateKey, StateValue, UpdatedAt)
            VALUES (@botId, @stateKey, @stateValue, datetime('now'))
            ON CONFLICT(BotId, StateKey)
            DO UPDATE SET StateValue = @stateValue, UpdatedAt = datetime('now')
            """;
        cmd.Parameters.AddWithValue("@botId", botId);
        cmd.Parameters.AddWithValue("@stateKey", stateKey);
        cmd.Parameters.AddWithValue("@stateValue", stateValue);
        cmd.ExecuteNonQuery();
    }

    public string? GetBotState(string botId, string stateKey)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            SELECT StateValue FROM BotState
            WHERE BotId = @botId AND StateKey = @stateKey
            """;
        cmd.Parameters.AddWithValue("@botId", botId);
        cmd.Parameters.AddWithValue("@stateKey", stateKey);
        return cmd.ExecuteScalar() as string;
    }

    // ── Explainable action logs ───────────────────────────────

    public void AddActionLog(string botId, string action, string reason, bool success, int riskScore = 0)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            INSERT INTO BotActionLogs (BotId, Action, Reason, Success, RiskScore, CreatedAt)
            VALUES (@botId, @action, @reason, @success, @risk, datetime('now'))
            """;
        cmd.Parameters.AddWithValue("@botId", botId);
        cmd.Parameters.AddWithValue("@action", action);
        cmd.Parameters.AddWithValue("@reason", reason);
        cmd.Parameters.AddWithValue("@success", success ? 1 : 0);
        cmd.Parameters.AddWithValue("@risk", Math.Clamp(riskScore, 0, 100));
        cmd.ExecuteNonQuery();
    }

    public int CountRecentFailedActions(string botId, string action, int minutes)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            SELECT COUNT(*) FROM BotActionLogs
            WHERE BotId = @botId
              AND Action = @action
              AND Success = 0
              AND CreatedAt >= @since
            """;
        cmd.Parameters.AddWithValue("@botId", botId);
        cmd.Parameters.AddWithValue("@action", action);
        cmd.Parameters.AddWithValue("@since", DateTime.UtcNow.AddMinutes(-Math.Max(1, minutes)).ToString("o"));
        return Convert.ToInt32(cmd.ExecuteScalar());
    }

    public int CountRecentActions(string botId, string action, int minutes, bool? success = null)
    {
        using var cmd = _connection.CreateCommand();
        var successClause = success.HasValue ? " AND Success = @success" : string.Empty;
        cmd.CommandText = $"""
            SELECT COUNT(*) FROM BotActionLogs
            WHERE BotId = @botId
              AND Action = @action
              AND CreatedAt >= @since
            {successClause}
            """;
        cmd.Parameters.AddWithValue("@botId", botId);
        cmd.Parameters.AddWithValue("@action", action);
        cmd.Parameters.AddWithValue("@since", DateTime.UtcNow.AddMinutes(-Math.Max(1, minutes)).ToString("o"));
        if (success.HasValue)
        {
            cmd.Parameters.AddWithValue("@success", success.Value ? 1 : 0);
        }

        return Convert.ToInt32(cmd.ExecuteScalar());
    }

    // ── Transfer shortlist / auction memory ───────────────────

    public void AddTransferShortlistItem(string botId, string auctionId, string playerName, string priority, DateTime expiresAtUtc, string profile)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            INSERT INTO BotTransferShortlist (BotId, AuctionId, PlayerName, Priority, ExpiresAt, Profile, AddedAt)
            VALUES (@botId, @auctionId, @playerName, @priority, @expiresAt, @profile, datetime('now'))
            """;
        cmd.Parameters.AddWithValue("@botId", botId);
        cmd.Parameters.AddWithValue("@auctionId", auctionId);
        cmd.Parameters.AddWithValue("@playerName", playerName);
        cmd.Parameters.AddWithValue("@priority", priority);
        cmd.Parameters.AddWithValue("@expiresAt", expiresAtUtc.ToString("o"));
        cmd.Parameters.AddWithValue("@profile", profile);
        cmd.ExecuteNonQuery();
    }

    public List<BotShortlistItemRecord> GetActiveTransferShortlist(string botId)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            SELECT Id, BotId, AuctionId, PlayerName, Priority, ExpiresAt, Profile, AddedAt
            FROM BotTransferShortlist
            WHERE BotId = @botId AND ExpiresAt >= @now
            ORDER BY AddedAt DESC
            """;
        cmd.Parameters.AddWithValue("@botId", botId);
        cmd.Parameters.AddWithValue("@now", DateTime.UtcNow.ToString("o"));
        using var reader = cmd.ExecuteReader();
        var items = new List<BotShortlistItemRecord>();
        while (reader.Read())
        {
            items.Add(new BotShortlistItemRecord
            {
                Id = reader.GetInt64(0),
                BotId = reader.GetString(1),
                AuctionId = reader.GetString(2),
                PlayerName = reader.GetString(3),
                Priority = reader.GetString(4),
                ExpiresAt = reader.GetString(5),
                Profile = reader.GetString(6),
                AddedAt = reader.GetString(7)
            });
        }
        return items;
    }

    public void AddAuctionEvent(string botId, string auctionId, string eventType)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            INSERT INTO BotAuctionEvents (BotId, AuctionId, EventType, CreatedAt)
            VALUES (@botId, @auctionId, @eventType, datetime('now'))
            """;
        cmd.Parameters.AddWithValue("@botId", botId);
        cmd.Parameters.AddWithValue("@auctionId", auctionId);
        cmd.Parameters.AddWithValue("@eventType", eventType);
        cmd.ExecuteNonQuery();
    }

    public int CountRecentAuctionEvents(string botId, string auctionId, string eventType, int minutes)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            SELECT COUNT(*) FROM BotAuctionEvents
            WHERE BotId = @botId
              AND AuctionId = @auctionId
              AND EventType = @eventType
              AND CreatedAt >= @since
            """;
        cmd.Parameters.AddWithValue("@botId", botId);
        cmd.Parameters.AddWithValue("@auctionId", auctionId);
        cmd.Parameters.AddWithValue("@eventType", eventType);
        cmd.Parameters.AddWithValue("@since", DateTime.UtcNow.AddMinutes(-Math.Max(1, minutes)).ToString("o"));
        return Convert.ToInt32(cmd.ExecuteScalar());
    }

    // ── Group coordination ────────────────────────────────────

    public string? GetGroupCoordinationValue(int groupId, string topic)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            SELECT Value FROM BotGroupCoordination
            WHERE GroupId = @groupId AND Topic = @topic
            """;
        cmd.Parameters.AddWithValue("@groupId", groupId);
        cmd.Parameters.AddWithValue("@topic", topic);
        return cmd.ExecuteScalar() as string;
    }

    public void UpsertGroupCoordinationValue(int groupId, string topic, string value)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            INSERT INTO BotGroupCoordination (GroupId, Topic, Value, UpdatedAt)
            VALUES (@groupId, @topic, @value, datetime('now'))
            ON CONFLICT(GroupId, Topic)
            DO UPDATE SET Value = @value, UpdatedAt = datetime('now')
            """;
        cmd.Parameters.AddWithValue("@groupId", groupId);
        cmd.Parameters.AddWithValue("@topic", topic);
        cmd.Parameters.AddWithValue("@value", value);
        cmd.ExecuteNonQuery();
    }

    // ── KPI tracking ──────────────────────────────────────────

    public void UpsertKpiSnapshot(string botId, string localDate, string kpiJson, string scenario)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            INSERT INTO BotKpis (BotId, LocalDate, KpiJson, Scenario, UpdatedAt)
            VALUES (@botId, @localDate, @kpiJson, @scenario, datetime('now'))
            ON CONFLICT(BotId, LocalDate)
            DO UPDATE SET KpiJson = @kpiJson, Scenario = @scenario, UpdatedAt = datetime('now')
            """;
        cmd.Parameters.AddWithValue("@botId", botId);
        cmd.Parameters.AddWithValue("@localDate", localDate);
        cmd.Parameters.AddWithValue("@kpiJson", kpiJson);
        cmd.Parameters.AddWithValue("@scenario", scenario);
        cmd.ExecuteNonQuery();
    }

    public BotKpiRecord? GetLatestKpiSnapshot(string botId)
    {
        using var cmd = _connection.CreateCommand();
        cmd.CommandText = """
            SELECT BotId, LocalDate, KpiJson, Scenario, UpdatedAt
            FROM BotKpis
            WHERE BotId = @botId
            ORDER BY LocalDate DESC
            LIMIT 1
            """;
        cmd.Parameters.AddWithValue("@botId", botId);
        using var reader = cmd.ExecuteReader();
        if (!reader.Read())
        {
            return null;
        }

        return new BotKpiRecord
        {
            BotId = reader.GetString(0),
            LocalDate = reader.GetString(1),
            KpiJson = reader.GetString(2),
            Scenario = reader.GetString(3),
            UpdatedAt = reader.GetString(4)
        };
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

public sealed class BotNightPlanRecord
{
    public string BotId { get; set; } = "";
    public string LocalDate { get; set; } = "";
    public string PlanJson { get; set; } = "";
    public string GeneratedBy { get; set; } = "";
    public string CreatedAt { get; set; } = "";
    public string UpdatedAt { get; set; } = "";
}

public sealed class BotGroupChatMessageRecord
{
    public long Id { get; set; }
    public int GroupId { get; set; }
    public string BotId { get; set; } = "";
    public string Kind { get; set; } = "";
    public string Message { get; set; } = "";
    public string CreatedAt { get; set; } = "";
}

public sealed class BotShortlistItemRecord
{
    public long Id { get; set; }
    public string BotId { get; set; } = "";
    public string AuctionId { get; set; } = "";
    public string PlayerName { get; set; } = "";
    public string Priority { get; set; } = "";
    public string ExpiresAt { get; set; } = "";
    public string Profile { get; set; } = "";
    public string AddedAt { get; set; } = "";
}

public sealed class BotKpiRecord
{
    public string BotId { get; set; } = "";
    public string LocalDate { get; set; } = "";
    public string KpiJson { get; set; } = "";
    public string Scenario { get; set; } = "";
    public string UpdatedAt { get; set; } = "";
}
