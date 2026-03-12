using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Database;

namespace GoalTactics.Bots.Client.Behaviors;

/// <summary>
/// Daily routine: watch ads, claim rewards, accept sponsors, review finances.
/// Stars bonus = Random(0,500) × Activity, simulated via WatchAd calls.
/// </summary>
public sealed class DailyRoutineBehavior
{
    private readonly Random _rng = new();

    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot)
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
        await api.ClaimDailyRewardAsync();
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
        int maxAttempts = 50;
        for (int i = 0; i < maxAttempts && accumulated < targetStars; i++)
        {
            var result = await api.WatchAdAsync();
            if (result is null || !result.Success) break;
            accumulated += result.Value;
        }
    }

    /// <summary>
    /// Accept the best available sponsor offer (highest stars per day).
    /// </summary>
    private static async Task AcceptBestSponsorAsync(GoalTacticsApiClient api)
    {
        var offers = await api.GetSponsorOffersAsync();
        if (offers?.Sponsors is null || offers.Sponsors.Count == 0) return;

        var best = offers.Sponsors.OrderByDescending(s => s.StarsPerDay).First();
        await api.AcceptSponsorAsync(best.Id);
    }
}
