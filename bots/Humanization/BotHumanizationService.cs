using System.Text.Json;
using System.Globalization;
using GoalTactics.Bots.Client.Database;
using GoalTactics.Bots.Client.Neural;

namespace GoalTactics.Bots.Client.Humanization;

public sealed class BotHumanizationService
{
    private readonly BotConfig _config;
    private readonly BotDatabase _db;
    private readonly Random _rng = new();

    public BotHumanizationService(BotConfig config, BotDatabase db)
    {
        _config = config;
        _db = db;
    }

    public HumanSessionPlan BuildSessionPlan(BotRecord bot)
    {
        DateTime localNow = GetLocalNow(bot);
        bool isWeekend = localNow.DayOfWeek is DayOfWeek.Saturday or DayOfWeek.Sunday;
        bool longSession = _rng.NextDouble() < (isWeekend ? 0.55 : 0.25);

        int durationMinutes = longSession
            ? _rng.Next(15, 31)
            : _rng.Next(2, 9);

        bool interrupted = _rng.NextDouble() < 0.18;
        double intensity = isWeekend ? 1.1 : 0.95;
        if (interrupted)
        {
            intensity *= 0.7;
        }

        return new HumanSessionPlan
        {
            DurationMinutes = durationMinutes,
            Interrupted = interrupted,
            IntensityMultiplier = intensity
        };
    }

    public EmotionalState GetEmotionalState(BotRecord bot)
    {
        var raw = _db.GetBotState(bot.BotId, "emotion-state");
        EmotionalState state;
        try
        {
            state = string.IsNullOrWhiteSpace(raw)
                ? EmotionalState.CreateDefault()
                : JsonSerializer.Deserialize<EmotionalState>(raw) ?? EmotionalState.CreateDefault();
        }
        catch
        {
            state = EmotionalState.CreateDefault();
        }

        // Decay to neutral over time.
        state.Confidence = Math.Clamp((int)Math.Round(state.Confidence * 0.92), 15, 95);
        state.Frustration = Math.Clamp((int)Math.Round(state.Frustration * 0.90), 0, 100);

        _db.UpsertBotState(bot.BotId, "emotion-state", JsonSerializer.Serialize(state));
        return state;
    }

    public string GetNarrativeForTeam(BotRecord bot, string teamName)
    {
        string key = $"narrative:{teamName.ToLowerInvariant()}";
        var existing = _db.GetBotState(bot.BotId, key);
        if (!string.IsNullOrWhiteSpace(existing))
        {
            return existing;
        }

        string[] labels = ["always overbids", "fair trader", "friendly challenger", "silent sniper", "chaotic bidder"];
        string narrative = labels[Math.Abs(HashCode.Combine(bot.BotId, teamName)) % labels.Length];
        _db.UpsertBotState(bot.BotId, key, narrative);
        return narrative;
    }

    public WritingStyle GetOrCreateWritingStyle(BotRecord bot)
    {
        var raw = _db.GetBotState(bot.BotId, "writing-style");
        if (!string.IsNullOrWhiteSpace(raw))
        {
            try
            {
                var cached = JsonSerializer.Deserialize<WritingStyle>(raw);
                if (cached is not null)
                {
                    return cached;
                }
            }
            catch
            {
                // regenerate below
            }
        }

        string[] tones = ["formal", "casual"];
        string[] lengths = ["short", "medium"];
        string[] moods = ["calm", "hyped"];

        var style = new WritingStyle
        {
            Tone = tones[Math.Abs(HashCode.Combine(bot.BotId, "tone")) % tones.Length],
            Length = lengths[Math.Abs(HashCode.Combine(bot.BotId, "length")) % lengths.Length],
            Mood = moods[Math.Abs(HashCode.Combine(bot.BotId, "mood")) % moods.Length],
            Language = GuessLanguage(bot.Timezone)
        };

        _db.UpsertBotState(bot.BotId, "writing-style", JsonSerializer.Serialize(style));
        return style;
    }

    public bool ShouldExecuteByConfidence(BotRecord bot, string action, double confidence)
    {
        var streakKey = $"confidence-skip-streak:{action}";
        int.TryParse(_db.GetBotState(bot.BotId, streakKey), out var skipStreak);

        // Use a softer adaptive threshold so sessions do not collapse late-season.
        var riskBoost = Math.Clamp(bot.Risk / 2000.0, 0.0, 0.08);
        var confidenceSkill = ReadDoubleState(bot.BotId, "learn.confidenceSkill", 0.5);
        var learningBoost = (confidenceSkill - 0.5) * 0.18;
        var adaptiveThreshold = Math.Clamp(_config.DecisionConfidenceThreshold - riskBoost - learningBoost, 0.08, 0.8);

        if (confidence >= adaptiveThreshold)
        {
            if (skipStreak > 0)
            {
                _db.UpsertBotState(bot.BotId, streakKey, "0");
            }
            return true;
        }

        skipStreak++;

        // Guardrail: force execution after repeated low-confidence skips to keep bots active.
        if (skipStreak >= 3)
        {
            _db.UpsertBotState(bot.BotId, streakKey, "0");
            _db.AddActionLog(bot.BotId, action,
                $"Forced execution after low-confidence streak ({confidence:F2} < {adaptiveThreshold:F2})",
                true,
                bot.Risk);
            return true;
        }

        _db.UpsertBotState(bot.BotId, streakKey, skipStreak.ToString());

        _db.AddActionLog(bot.BotId, action,
            $"Skipped by low confidence ({confidence:F2} < {adaptiveThreshold:F2}, streak={skipStreak})",
            false,
            bot.Risk);
        return false;
    }

    public bool ShouldBlockAfterMistakes(BotRecord bot, string action)
    {
        int failures = _db.CountRecentFailedActions(bot.BotId, action, 30);
        return failures >= 3;
    }

    public bool CanTakeRiskyAction(BotRecord bot)
    {
        string localDate = GetLocalNow(bot).ToString("yyyy-MM-dd");
        string dateKey = "risky-actions-date";
        string countKey = "risky-actions-count";

        var trackedDate = _db.GetBotState(bot.BotId, dateKey);
        if (!string.Equals(trackedDate, localDate, StringComparison.Ordinal))
        {
            _db.UpsertBotState(bot.BotId, dateKey, localDate);
            _db.UpsertBotState(bot.BotId, countKey, "0");
            return true;
        }

        int.TryParse(_db.GetBotState(bot.BotId, countKey), out var count);
        return count < _config.MaxRiskyActionsPerDay;
    }

    public void CountRiskyAction(BotRecord bot)
    {
        string countKey = "risky-actions-count";
        int.TryParse(_db.GetBotState(bot.BotId, countKey), out var count);
        _db.UpsertBotState(bot.BotId, countKey, (count + 1).ToString());
    }

    public TransferBudgetEnvelope BuildTransferEnvelope(BotRecord bot, decimal money, decimal stars)
    {
        int day = DateTime.UtcNow.DayOfYear;
        string phase = (day % 3) switch
        {
            0 => "early-scouting",
            1 => "mid-season-patching",
            _ => "late-push"
        };

        decimal percent = phase switch
        {
            "early-scouting" => 0.22m,
            "mid-season-patching" => 0.30m,
            _ => 0.38m
        };

        var transferSkill = ReadDoubleState(bot.BotId, "learn.transferSkill", 0.5);
        var learnFactor = 1m + (decimal)((transferSkill - 0.5) * 0.40);
        percent *= Math.Clamp(learnFactor, 0.8m, 1.2m);

        decimal safePercent = Math.Min(percent, (decimal)Math.Clamp(_config.MaxBidPercentOfMoney, 0.05, 0.95));

        return new TransferBudgetEnvelope
        {
            Phase = phase,
            MoneyBudget = money * safePercent,
            StarsBudget = Math.Max(0, stars - _config.MinStarsReserve)
        };
    }

    public bool ShouldFakeoutBid(BotRecord bot)
    {
        return _rng.NextDouble() < 0.15 + (bot.Risk / 600.0);
    }

    public void RefreshTransferShortlist(BotRecord bot, IReadOnlyList<Dictionary<string, object?>> players, string profile)
    {
        int rank = 0;
        foreach (var p in players.Take(9))
        {
            string auctionId = ApiClient.BotApiTranslationReader.GetString(p, "auctionId");
            string name = ApiClient.BotApiTranslationReader.GetString(p, "name");
            if (string.IsNullOrWhiteSpace(auctionId) || string.IsNullOrWhiteSpace(name))
            {
                continue;
            }

            string priority = rank < 2 ? "A" : rank < 5 ? "B" : "C";
            var ttlHours = priority == "A" ? 18 : priority == "B" ? 30 : 48;
            _db.AddTransferShortlistItem(bot.BotId, auctionId, name, priority, DateTime.UtcNow.AddHours(ttlHours), profile);
            rank++;
        }
    }

    public bool ShouldPauseAuctionAfterRegret(BotRecord bot, string auctionId)
    {
        int losses = _db.CountRecentAuctionEvents(bot.BotId, auctionId, "lost", 60);
        return losses >= 2;
    }

    public void MarkAuctionLost(BotRecord bot, string auctionId)
    {
        _db.AddAuctionEvent(bot.BotId, auctionId, "lost");
    }

    public void MarkAuctionBid(BotRecord bot, string auctionId)
    {
        _db.AddAuctionEvent(bot.BotId, auctionId, "bid");
    }

    public bool ShouldInitiateGroupMessage(BotRecord bot)
    {
        if (!bot.GroupId.HasValue)
        {
            return false;
        }

        var groupBots = _db.GetBotsInGroup(bot.GroupId.Value);
        if (groupBots.Count == 0)
        {
            return false;
        }

        string topic = "chat-rotation-index";
        int.TryParse(_db.GetGroupCoordinationValue(bot.GroupId.Value, topic), out int idx);
        idx = Math.Abs(idx) % groupBots.Count;

        if (!string.Equals(groupBots[idx].BotId, bot.BotId, StringComparison.Ordinal))
        {
            return false;
        }

        int next = (idx + 1) % groupBots.Count;
        _db.UpsertGroupCoordinationValue(bot.GroupId.Value, topic, next.ToString());

        var socialSkill = ReadDoubleState(bot.BotId, "learn.socialSkill", 0.5);
        var talkProbability = Math.Clamp(0.45 + ((bot.SocialScore - 50) / 200.0) + ((socialSkill - 0.5) * 0.35), 0.15, 0.90);
        if (_rng.NextDouble() > talkProbability)
        {
            return false;
        }

        string delayTopic = $"chat-delay-until:{bot.BotId}";
        var untilRaw = _db.GetGroupCoordinationValue(bot.GroupId.Value, delayTopic);
        if (DateTime.TryParse(untilRaw, out var untilUtc) && DateTime.UtcNow < untilUtc)
        {
            return false;
        }

        int delay = _rng.Next(_config.GroupChatMinDelaySeconds, _config.GroupChatMaxDelaySeconds + 1);
        _db.UpsertGroupCoordinationValue(bot.GroupId.Value, delayTopic, DateTime.UtcNow.AddSeconds(delay).ToString("o"));
        return true;
    }

    public bool IsGroupCircleTurn(BotRecord bot, string auctionId, string currentBidTeamName)
    {
        if (!bot.GroupId.HasValue)
        {
            return true;
        }

        var bots = _db.GetBotsInGroup(bot.GroupId.Value);
        if (bots.Count <= 1)
        {
            return true;
        }

        bool emergency = bots.All(b => !string.Equals(b.TeamName, currentBidTeamName, StringComparison.OrdinalIgnoreCase));
        if (emergency)
        {
            return true;
        }

        string topic = $"bid-circle:{auctionId}";
        int.TryParse(_db.GetGroupCoordinationValue(bot.GroupId.Value, topic), out int idx);
        idx = Math.Abs(idx) % bots.Count;

        if (string.Equals(bots[idx].BotId, bot.BotId, StringComparison.Ordinal))
        {
            int next = (idx + 1) % bots.Count;
            _db.UpsertGroupCoordinationValue(bot.GroupId.Value, topic, next.ToString());
            return true;
        }

        return false;
    }

    public string BuildStyledMessage(BotRecord bot, string baseMessage, string contextTag)
    {
        if (string.IsNullOrWhiteSpace(baseMessage))
        {
            return string.Empty;
        }

        var style = GetOrCreateWritingStyle(bot);
        string msg = baseMessage;

        if (style.Tone == "formal")
        {
            msg = $"Status update: {baseMessage}";
        }

        if (_config.EnableMultilingualChat)
        {
            msg = style.Language switch
            {
                "de" => $"{msg} Viel Erfolg!",
                "es" => $"{msg} Buena suerte.",
                "fr" => $"{msg} Bonne chance.",
                _ => msg
            };
        }

        if (style.Length == "short" && msg.Length > 150)
        {
            msg = msg[..150];
        }

        if (contextTag == "promotion")
        {
            msg = $"{msg} Congrats on the promotion run.";
        }

        return msg;
    }

    public void UpdateKpisAndScenario(BotRecord bot, decimal money, decimal stars, int squadSize)
    {
        string localDate = GetLocalNow(bot).ToString("yyyy-MM-dd");
        var kpi = new Dictionary<string, object?>
        {
            ["starsEfficiency"] = Math.Round(stars / Math.Max(1, squadSize), 2),
            ["squadDepth"] = squadSize,
            ["liquidity"] = money,
            ["risk"] = bot.Risk
        };

        string scenario = bot.Risk switch
        {
            >= 70 => "title-push",
            <= 30 => "rebuild",
            _ => "balanced"
        };

        _db.UpsertKpiSnapshot(bot.BotId, localDate, JsonSerializer.Serialize(kpi), scenario);
        _db.UpsertBotState(bot.BotId, "scenario", scenario);

        // Long-term planning: keep age-curve replacement and academy pipeline goals.
        _db.UpsertBotState(bot.BotId, "age-curve-plan", "replace-aging-starters-in-1-2-seasons");
        var academyTargets = new Dictionary<string, int>
        {
            ["GK"] = 1,
            ["DEF"] = 2,
            ["MID"] = 2,
            ["FWD"] = 1,
            ["minTalent"] = bot.YouthFocus >= 60 ? 68 : 58
        };
        _db.UpsertBotState(bot.BotId, "academy-pipeline-targets", JsonSerializer.Serialize(academyTargets));
    }

    public void UpdateLearningAfterSession(BotRecord bot, bool success, bool nightSession, bool interrupted, int executedActions, bool authFailed)
    {
        var confidenceTarget = success ? 1.0 : 0.35;
        if (authFailed)
        {
            confidenceTarget = 0.15;
        }
        if (interrupted)
        {
            confidenceTarget = Math.Max(0.20, confidenceTarget - 0.10);
        }

        UpdateEma(bot.BotId, "learn.confidenceSkill", confidenceTarget, 0.06);

        var acceptedTransferActions = _db.CountRecentActions(bot.BotId, "transfer", 180, success: true);
        var failedTransferActions = _db.CountRecentActions(bot.BotId, "transfer", 180, success: false);
        var transferTarget = acceptedTransferActions + failedTransferActions == 0
            ? 0.50
            : Math.Clamp((double)acceptedTransferActions / (acceptedTransferActions + failedTransferActions), 0.1, 0.9);
        UpdateEma(bot.BotId, "learn.transferSkill", transferTarget, 0.05);

        var socialTarget = nightSession ? 0.65 : (executedActions >= 6 ? 0.58 : 0.45);
        if (success && !authFailed)
        {
            socialTarget += 0.05;
        }
        UpdateEma(bot.BotId, "learn.socialSkill", Math.Clamp(socialTarget, 0.1, 0.95), 0.04);
    }

    public bool ShouldRunSelfAudit(BotRecord bot)
    {
        if (!_config.EnableSelfAudit)
        {
            return false;
        }

        var raw = _db.GetBotState(bot.BotId, "last-self-audit");
        if (DateTime.TryParse(raw, out var last) && (DateTime.UtcNow - last).TotalHours < 6)
        {
            return false;
        }

        _db.UpsertBotState(bot.BotId, "last-self-audit", DateTime.UtcNow.ToString("o"));
        return true;
    }

    public bool ShouldRollbackToSafeMode(BotRecord bot)
    {
        if (!_config.EnableFallbackRollbackStrategy)
        {
            return false;
        }

        int failures = _db.CountRecentFailedActions(bot.BotId, "neural", 120);
        if (failures >= 3)
        {
            _db.UpsertBotState(bot.BotId, "rollback-mode", "safe");
            return true;
        }

        return string.Equals(_db.GetBotState(bot.BotId, "rollback-mode"), "safe", StringComparison.Ordinal);
    }

    private static string GuessLanguage(string timezone)
    {
        if (timezone.Contains("Berlin", StringComparison.OrdinalIgnoreCase) ||
            timezone.Contains("Vienna", StringComparison.OrdinalIgnoreCase) ||
            timezone.Contains("Zurich", StringComparison.OrdinalIgnoreCase))
            return "de";

        if (timezone.Contains("Madrid", StringComparison.OrdinalIgnoreCase) ||
            timezone.Contains("Sao_Paulo", StringComparison.OrdinalIgnoreCase))
            return "es";

        if (timezone.Contains("Paris", StringComparison.OrdinalIgnoreCase) ||
            timezone.Contains("Brussels", StringComparison.OrdinalIgnoreCase))
            return "fr";

        return "en";
    }

    private static DateTime GetLocalNow(BotRecord bot)
    {
        try
        {
            var tz = TimeZoneInfo.FindSystemTimeZoneById(bot.Timezone);
            return TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, tz);
        }
        catch
        {
            return DateTime.UtcNow;
        }
    }

    private double ReadDoubleState(string botId, string key, double fallback)
    {
        var raw = _db.GetBotState(botId, key);
        return double.TryParse(raw, NumberStyles.Float, CultureInfo.InvariantCulture, out var value)
            ? value
            : fallback;
    }

    private void UpdateEma(string botId, string key, double target, double alpha)
    {
        var current = ReadDoubleState(botId, key, 0.5);
        var updated = (1.0 - alpha) * current + alpha * target;
        _db.UpsertBotState(botId, key, updated.ToString("0.0000", CultureInfo.InvariantCulture));
    }
}

public sealed class HumanSessionPlan
{
    public int DurationMinutes { get; set; }
    public bool Interrupted { get; set; }
    public double IntensityMultiplier { get; set; }
}

public sealed class EmotionalState
{
    public string Mood { get; set; } = "neutral";
    public int Confidence { get; set; } = 50;
    public int Frustration { get; set; } = 10;

    public static EmotionalState CreateDefault() => new();
}

public sealed class WritingStyle
{
    public string Tone { get; set; } = "casual";
    public string Length { get; set; } = "medium";
    public string Mood { get; set; } = "calm";
    public string Language { get; set; } = "en";
}

public sealed class TransferBudgetEnvelope
{
    public string Phase { get; set; } = "balanced";
    public decimal MoneyBudget { get; set; }
    public decimal StarsBudget { get; set; }
}
