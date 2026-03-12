using System.Text.Json;

namespace GoalTactics.Bots.Client;

/// <summary>
/// Bot personality scores that drive all behavior decisions.
/// </summary>
public sealed class BotPersonality
{
    /// <summary>Maximum random multiplier for daily stars bonus calculation.</summary>
    public const int MaxStarsMultiplier = 500;

    /// <summary>1–99. Controls online frequency and general engagement.</summary>
    public int Activity { get; set; }

    /// <summary>1–99. Controls auction aggressiveness and late-bidding tendency.</summary>
    public int Risk { get; set; }

    /// <summary>1–99. Controls training/scouting spending and transfer preferences.</summary>
    public int YouthFocus { get; set; }

    /// <summary>1–100. Derived from Activity with randomness; drives social actions.</summary>
    public int SocialScore { get; set; }

    /// <summary>Daily stars bonus (0–50 000). Calculated as Random(0,500) × Activity.</summary>
    public int StarsDaily { get; set; }

    /// <summary>IANA timezone string, e.g. "Europe/Berlin".</summary>
    public string Timezone { get; set; } = "Europe/Berlin";

    /// <summary>Peak/quiet windows serialized as JSON.</summary>
    public string ActiveHoursJson { get; set; } = "{}";

    /// <summary>Sleep windows serialized as JSON.</summary>
    public string SleepHoursJson { get; set; } = "{}";

    private static readonly string[] EuropeanTimezones =
    [
        "Europe/London", "Europe/Berlin", "Europe/Paris", "Europe/Madrid",
        "Europe/Rome", "Europe/Amsterdam", "Europe/Brussels", "Europe/Vienna",
        "Europe/Zurich", "Europe/Warsaw", "Europe/Prague", "Europe/Stockholm",
        "Europe/Oslo", "Europe/Helsinki", "Europe/Lisbon", "Europe/Athens",
        "Europe/Bucharest", "Europe/Budapest", "Europe/Dublin", "Europe/Copenhagen"
    ];

    private static readonly string[] OtherTimezones =
    [
        "America/New_York", "America/Chicago", "America/Los_Angeles",
        "America/Sao_Paulo", "Asia/Tokyo", "Australia/Sydney"
    ];

    /// <summary>
    /// Generate a fully random personality with European timezone bias.
    /// </summary>
    public static BotPersonality GenerateRandom(Random rng)
    {
        int activity = rng.Next(1, 100);
        int risk = rng.Next(1, 100);
        int youthFocus = rng.Next(1, 100);
        int socialScore = DeriveSocialScore(activity, rng);
        int starsDaily = rng.Next(0, MaxStarsMultiplier + 1) * activity;

        // 85 % European timezone, 15 % other
        string timezone = rng.Next(100) < 85
            ? EuropeanTimezones[rng.Next(EuropeanTimezones.Length)]
            : OtherTimezones[rng.Next(OtherTimezones.Length)];

        var personality = new BotPersonality
        {
            Activity = activity,
            Risk = risk,
            YouthFocus = youthFocus,
            SocialScore = socialScore,
            StarsDaily = starsDaily,
            Timezone = timezone,
            ActiveHoursJson = GenerateActiveHours(rng),
            SleepHoursJson = GenerateSleepHours(rng)
        };

        return personality;
    }

    /// <summary>
    /// Social score depends on activity but retains randomness.
    /// Higher activity makes higher social more likely, but extremes are still possible.
    /// </summary>
    public static int DeriveSocialScore(int activity, Random rng)
    {
        // Weighted: 60 % from activity, 40 % random
        double base_ = activity / 99.0 * 100.0;
        double noise = rng.Next(1, 101);
        int score = (int)Math.Round(base_ * 0.6 + noise * 0.4);
        return Math.Clamp(score, 1, 100);
    }

    private static string GenerateActiveHours(Random rng)
    {
        // Randomize peak and quiet windows per bot
        int morningStart = 5 + rng.Next(3);   // 5-7
        int morningEnd = morningStart + 1 + rng.Next(2); // +1 to +2 hours
        int eveningStart = 17 + rng.Next(3);   // 17-19
        int eveningEnd = eveningStart + 2 + rng.Next(3); // +2 to +4 hours
        if (eveningEnd > 23) eveningEnd = 23;

        int quietStart1 = 0;
        int quietEnd1 = morningStart;
        int quietStart2 = morningEnd + 1;
        int quietEnd2 = eveningStart - 1;

        var hours = new
        {
            peak = new[] { $"{morningStart:D2}:00-{morningEnd:D2}:00", $"{eveningStart:D2}:00-{eveningEnd:D2}:00" },
            quiet = new[] { $"{quietStart1:D2}:00-{quietEnd1:D2}:00", $"{quietStart2:D2}:00-{quietEnd2:D2}:00" }
        };

        return JsonSerializer.Serialize(hours);
    }

    private static string GenerateSleepHours(Random rng)
    {
        int sleepStart = 22 + rng.Next(3); // 22-24 (wraps to 0-1)
        if (sleepStart >= 24) sleepStart -= 24;
        int sleepEnd = 5 + rng.Next(3); // 5-7

        var hours = new
        {
            sleep = new[] { $"{sleepStart:D2}:00-{sleepEnd:D2}:00" }
        };

        return JsonSerializer.Serialize(hours);
    }
}
