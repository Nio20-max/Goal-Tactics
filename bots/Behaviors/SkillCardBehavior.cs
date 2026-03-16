using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Database;

namespace GoalTactics.Bots.Client.Behaviors;

/// <summary>
/// Uses available skill cards on the weakest players to boost their stats.
/// Higher youth-focus bots prioritise young players for skill card usage.
/// </summary>
public sealed class SkillCardBehavior
{
    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot)
    {
        var cardsResponse = await api.GetSkillCardsAsync();
        if (cardsResponse?.SkillCards is null || cardsResponse.SkillCards.Count == 0)
            return;

        int availableCards = cardsResponse.SkillCards.Sum(c => c.Count);
        if (availableCards == 0) return;

        var squad = await api.GetSquadAsync();
        if (squad?.Players is null || squad.Players.Count == 0) return;

        // Pick target players: weakest overall, optionally favouring youth
        var candidates = squad.Players
            .Where(p => !p.HasRedCard && p.Injured == 0)
            .OrderBy(p => p.Strength)
            .ThenByDescending(p => bot.YouthFocus >= 50 ? p.Talent : 0)
            .ToList();

        // Use up to 3 cards per session to avoid API spam
        int maxUses = Math.Min(3, availableCards);
        int used = 0;

        foreach (var player in candidates)
        {
            if (used >= maxUses) break;

            try
            {
                await api.UseSkillCardAsync(player.Id);
                used++;
            }
            catch (HttpRequestException)
            {
                // Server rejected the card use (e.g. no cards left, player ineligible)
                break;
            }
        }
    }
}
