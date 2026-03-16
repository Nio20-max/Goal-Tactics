using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Database;
using GoalTactics.Bots.Client.Neural;

namespace GoalTactics.Bots.Client.Behaviors;

/// <summary>
/// Uses available skill cards on the weakest players to boost their stats.
/// Higher youth-focus bots prioritise young players for skill card usage.
/// </summary>
public sealed class SkillCardBehavior
{
    private sealed class PlayerSnapshot
    {
        public string Id { get; init; } = "";
        public decimal Strength { get; init; }
        public int Talent { get; init; }
        public bool HasRedCard { get; init; }
        public int Injured { get; init; }
    }

    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan = null)
    {
        var cardsResponse = await api.ExecuteForBotAsync("GetSkillCards");
        if (!cardsResponse.Success)
            return;

        int availableCards = BotApiTranslationReader.GetObjectList(cardsResponse, "cards")
            .Sum(c => BotApiTranslationReader.GetInt(c, "count"));
        if (availableCards == 0) return;

        var squad = await api.ExecuteForBotAsync("GetSquad");
        if (!squad.Success) return;

        var players = BotApiTranslationReader.GetObjectList(squad, "players")
            .Select(ToPlayer)
            .Where(p => !string.IsNullOrEmpty(p.Id))
            .ToList();
        if (players.Count == 0) return;

        // Pick target players: weakest overall, optionally favouring youth
        var candidates = players
            .Where(p => !p.HasRedCard && p.Injured == 0)
            .OrderBy(p => p.Strength)
            .ThenByDescending(p => bot.YouthFocus >= 50 ? p.Talent : 0)
            .ToList();

        // Use up to 3 cards per session to avoid API spam
        int plannedCap = nightPlan is null ? 3 : Math.Clamp(nightPlan.IndividualTrainingSlots + 1, 1, 3);
        int maxUses = Math.Min(plannedCap, availableCards);
        int used = 0;

        foreach (var player in candidates)
        {
            if (used >= maxUses) break;

            try
            {
                await api.ExecuteForBotAsync("UseSkillCard", new IdRequest { Id = player.Id });
                used++;
            }
            catch (HttpRequestException)
            {
                // Server rejected the card use (e.g. no cards left, player ineligible)
                break;
            }
        }
    }

    private static PlayerSnapshot ToPlayer(Dictionary<string, object?> data)
        => new()
        {
            Id = BotApiTranslationReader.GetString(data, "id"),
            Strength = BotApiTranslationReader.GetDecimal(data, "strength"),
            Talent = BotApiTranslationReader.GetInt(data, "talent"),
            HasRedCard = BotApiTranslationReader.GetBool(data, "hasRedCard"),
            Injured = BotApiTranslationReader.GetInt(data, "injured")
        };
}
