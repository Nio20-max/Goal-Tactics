using System.Text.Json;

namespace GoalTactics.Bots.Client.Scheduling;

/// <summary>
/// Determines when bots wake up based on timezone, activity, and inactivity recovery.
/// </summary>
public sealed class BotScheduler
{
    private readonly Database.BotDatabase _db;
    private readonly Random _rng = new();

    public BotScheduler(Database.BotDatabase db)
    {
        _db = db;
    }

    /// <summary>
    /// Returns bot IDs that are due to come online now.
    /// </summary>
    public List<long> GetDueBots(int batchSize = 10)
        => _db.GetDueBots(batchSize);

    /// <summary>
    /// Calculate and persist the next wake-up time for a bot going offline.
    /// </summary>
    public void ScheduleNextOnline(Database.BotRecord bot)
    {
        DateTime nextOnline = CalculateNextOnline(bot);
        _db.UpsertSchedule(bot.BotId, nextOnline);
        _db.UpdateBotSchedule(bot.BotId, nextOnline.ToString("o"), DateTime.UtcNow.ToString("o"));
    }

    /// <summary>
    /// Schedule a bot for an immediate or near-immediate wake-up (e.g., for auction sniping).
    /// </summary>
    public void ScheduleUrgent(long botId, DateTime wakeAt)
    {
        _db.UpsertSchedule(botId, wakeAt);
    }

    /// <summary>
    /// Core scheduling formula incorporating activity, timezone, and inactivity recovery.
    /// </summary>
    private DateTime CalculateNextOnline(Database.BotRecord bot)
    {
        DateTime now = DateTime.UtcNow;

        // Base interval: higher activity → shorter gap (5 min to 4 hours)
        const double maxMinutes = 240.0;
        const double minMinutes = 5.0;
        const double jitterRange = 0.6;  // ±30 % (range of 60 %, centered)
        const double jitterOffset = 0.3; // half the range, used to center around zero

        double activityFactor = bot.Activity / 99.0;
        double baseInterval = maxMinutes - (activityFactor * (maxMinutes - minMinutes));

        double jitter = baseInterval * (_rng.NextDouble() * jitterRange - jitterOffset);
        double intervalMinutes = baseInterval + jitter;

        // Inactivity recovery: if bot has been offline a long time, pull it online sooner
        if (bot.LastOffline is not null && DateTime.TryParse(bot.LastOffline, out var lastOff))
        {
            double offlineHours = (now - lastOff).TotalHours;
            if (offlineHours > 6)
            {
                // Reduce interval by up to 50 % for long-absent bots
                double recovery = Math.Min(offlineHours / 24.0, 0.5);
                intervalMinutes *= (1.0 - recovery);
            }
        }

        DateTime candidate = now.AddMinutes(Math.Max(intervalMinutes, 1));

        // Apply timezone-based time factor
        double timeFactor = GetTimeFactor(bot, candidate);
        if (timeFactor < 0.1)
        {
            // During sleep hours, push to the end of the sleep window
            candidate = PushPastSleepWindow(bot, candidate);
        }
        else if (timeFactor < 0.5)
        {
            // During quiet hours, stretch the interval
            double stretch = 1.0 + (1.0 - timeFactor);
            candidate = now.AddMinutes(intervalMinutes * stretch);
        }

        return candidate;
    }

    /// <summary>
    /// Returns a 0.0–1.0 factor for how likely the bot is to be active at the given UTC time.
    /// </summary>
    private double GetTimeFactor(Database.BotRecord bot, DateTime utcTime)
    {
        TimeOnly localTime = ToLocalTime(utcTime, bot.Timezone);

        // Check sleep hours first
        if (IsInTimeWindows(localTime, bot.SleepHours, "sleep"))
            return 0.0;

        // Check peak hours
        if (IsInTimeWindows(localTime, bot.ActiveHours, "peak"))
            return 1.0;

        // Check quiet hours
        if (IsInTimeWindows(localTime, bot.ActiveHours, "quiet"))
            return 0.3;

        // Default: moderate activity
        return 0.6;
    }

    private DateTime PushPastSleepWindow(Database.BotRecord bot, DateTime utcCandidate)
    {
        // Try advancing in 30-minute increments until out of sleep window (max 12 hours)
        DateTime result = utcCandidate;
        for (int i = 0; i < 24; i++)
        {
            result = result.AddMinutes(30);
            TimeOnly local = ToLocalTime(result, bot.Timezone);
            if (!IsInTimeWindows(local, bot.SleepHours, "sleep"))
                return result;
        }
        return result;
    }

    private static bool IsInTimeWindows(TimeOnly time, string json, string key)
    {
        try
        {
            using var doc = JsonDocument.Parse(json);
            if (!doc.RootElement.TryGetProperty(key, out var arr))
                return false;

            foreach (var window in arr.EnumerateArray())
            {
                string? range = window.GetString();
                if (range is null) continue;

                var parts = range.Split('-');
                if (parts.Length != 2) continue;

                if (TimeOnly.TryParse(parts[0], out var start) &&
                    TimeOnly.TryParse(parts[1], out var end))
                {
                    if (start <= end)
                    {
                        if (time >= start && time <= end) return true;
                    }
                    else
                    {
                        // Wraps midnight, e.g., 22:00-06:00
                        if (time >= start || time <= end) return true;
                    }
                }
            }
        }
        catch (JsonException)
        {
            // Malformed JSON — treat as not in window
        }

        return false;
    }

    private static TimeOnly ToLocalTime(DateTime utcTime, string timezone)
    {
        try
        {
            var tz = TimeZoneInfo.FindSystemTimeZoneById(timezone);
            var local = TimeZoneInfo.ConvertTimeFromUtc(utcTime, tz);
            return TimeOnly.FromDateTime(local);
        }
        catch (TimeZoneNotFoundException)
        {
            return TimeOnly.FromDateTime(utcTime);
        }
    }
}
