using System.Text.Json;

namespace GoalTactics.Bots.Client.Neural;

public sealed class BotNightPlan
{
    public bool ShouldBid { get; set; }
    public int BidAggression { get; set; }
    public bool ConsiderSelling { get; set; }
    public bool ScoutEnabled { get; set; }
    public int ScoutIntensity { get; set; }
    public int IndividualTrainingSlots { get; set; }
    public string ChatTone { get; set; } = "neutral";
    public int CoordinationLevel { get; set; }
    public string TransferTargetProfile { get; set; } = "balanced";

    public static BotNightPlan CreateFallback(Database.BotRecord bot)
    {
        return new BotNightPlan
        {
            ShouldBid = bot.Risk >= 30,
            BidAggression = Math.Clamp(bot.Risk, 10, 95),
            ConsiderSelling = bot.Risk >= 60,
            ScoutEnabled = bot.YouthFocus >= 25,
            ScoutIntensity = Math.Clamp(bot.YouthFocus, 10, 95),
            IndividualTrainingSlots = bot.YouthFocus switch
            {
                >= 80 => 3,
                >= 50 => 2,
                >= 25 => 1,
                _ => 0
            },
            ChatTone = bot.SocialScore >= 65 ? "supportive" : "neutral",
            CoordinationLevel = Math.Clamp((bot.SocialScore + bot.Activity) / 2, 10, 95),
            TransferTargetProfile = bot.YouthFocus >= 60 ? "young-high-talent" : "value-upgrade"
        };
    }

    public string ToJson()
        => JsonSerializer.Serialize(this);

    public static BotNightPlan? FromJson(string? json)
    {
        if (string.IsNullOrWhiteSpace(json))
        {
            return null;
        }

        try
        {
            return JsonSerializer.Deserialize<BotNightPlan>(json);
        }
        catch (JsonException)
        {
            return null;
        }
    }
}
