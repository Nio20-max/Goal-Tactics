using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Database;
using GoalTactics.Bots.Client.Neural;

namespace GoalTactics.Bots.Client.Behaviors;

/// <summary>
/// Daily routine: watch ads, claim rewards, accept sponsors, review finances.
/// Stars bonus = Random(0,500) × Activity, simulated via WatchAd calls.
/// </summary>
public sealed class DailyRoutineBehavior
{
    private readonly Random _rng = new();

    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan = null)
    {
        await ClaimDailyRewardAsync(api);
        await WatchAdsAsync(api, bot);
        await AcceptBestSponsorAsync(api);
    }

    /// <summary>
    /// Claim daily login reward.
    /// </summary>
    private static async Task ClaimDailyRewardAsync(GoalTacticsApiClient api)
    {
        await api.ExecuteForBotAsync("ClaimDailyReward");
    }

    /// <summary>
    /// Simulate ad watching to generate the daily stars bonus.
    /// Stars bonus = Random(0,500) × Activity. Each ad gives a fixed amount,
    /// so we call WatchAd enough times (or as many as the server allows).
    /// </summary>
    private async Task WatchAdsAsync(GoalTacticsApiClient api, BotRecord bot)
    {
        int targetStars = _rng.Next(0, BotPersonality.MaxStarsMultiplier + 1) * bot.Activity;

        // Cap to avoid excessive API calls; server limits ad watches anyway
        targetStars = Math.Min(targetStars, 5000);

        int accumulated = 0;
        int maxAttempts = 8;
        for (int i = 0; i < maxAttempts && accumulated < targetStars; i++)
        {
            var result = await api.ExecuteForBotAsync("WatchAd");
            if (!result.Success) break;

            accumulated += BotApiTranslationReader.GetInt(result.Output, "rewardValue");
        }
    }

    /// <summary>
    /// Accept the best available sponsor offer (highest stars per day).
    /// </summary>
    private static async Task AcceptBestSponsorAsync(GoalTacticsApiClient api)
    {
        var response = await api.ExecuteForBotAsync("GetSponsorOffers");
        if (!response.Success) return;

        var offers = BotApiTranslationReader.GetObjectList(response, "offers");
        if (offers.Count == 0) return;

        var candidates = offers
            .Where(s => BotApiTranslationReader.GetBool(s, "isActive", true))
            .Where(s => Guid.TryParse(BotApiTranslationReader.GetString(s, "id"), out _))
            .ToList();
        if (candidates.Count == 0) return;

        var best = candidates.OrderByDescending(s => BotApiTranslationReader.GetInt(s, "stars")).First();
        var sponsorId = BotApiTranslationReader.GetString(best, "id");
        if (string.IsNullOrEmpty(sponsorId)) return;

        await api.ExecuteForBotAsync("AcceptSponsor", new IdRequest { Id = sponsorId });
    }
}
