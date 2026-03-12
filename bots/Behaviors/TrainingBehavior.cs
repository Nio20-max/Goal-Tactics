using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Database;

namespace GoalTactics.Bots.Client.Behaviors;

/// <summary>
/// Training and scouting behavior driven by youth focus.
/// Higher youth focus → more star spending on individual training and scouting.
/// </summary>
public sealed class TrainingBehavior
{
    private readonly Random _rng = new();

    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot)
    {
        await HandleTeamTrainingAsync(api, bot);
        await HandleIndividualTrainingAsync(api, bot);
        await HandleScoutingAsync(api, bot);
    }

    private async Task HandleTeamTrainingAsync(GoalTacticsApiClient api, BotRecord bot)
    {
        // All bots save team training; details depend on server-side options
        var training = await api.GetTeamTrainingAsync();
        if (training is null) return;

        await api.SaveTeamTrainingAsync(new SaveTrainingRequest { Training = training.Training });
    }

    /// <summary>
    /// High youth focus bots invest in individual training for young players.
    /// </summary>
    private async Task HandleIndividualTrainingAsync(GoalTacticsApiClient api, BotRecord bot)
    {
        if (bot.YouthFocus < 30) return; // Low focus: skip individual training

        var squad = await api.GetSquadAsync();
        if (squad?.Players is null || squad.Players.Count == 0) return;

        // Pick youngest players for individual training
        var youngPlayers = squad.Players
            .Where(p => p.Age <= 22)
            .OrderBy(p => p.Age)
            .ThenByDescending(p => p.Talent)
            .ToList();

        // Number of players to train scales with youth focus
        int count = bot.YouthFocus switch
        {
            >= 80 => Math.Min(3, youngPlayers.Count),
            >= 50 => Math.Min(2, youngPlayers.Count),
            _ => Math.Min(1, youngPlayers.Count)
        };

        for (int i = 0; i < count; i++)
        {
            await api.SaveIndividualTrainingAsync(youngPlayers[i].Id);
        }
    }

    /// <summary>
    /// High youth focus bots scout more actively and recruit promising youth.
    /// </summary>
    private async Task HandleScoutingAsync(GoalTacticsApiClient api, BotRecord bot)
    {
        // Probability of scouting scales with youth focus
        double scoutChance = bot.YouthFocus / 99.0;
        if (_rng.NextDouble() > scoutChance) return;

        // Instruct scout
        await api.InstructScoutAsync(new InstructScoutRequest());

        // Check scouted players and recruit the best one
        var scouted = await api.GetScoutedPlayersAsync();
        if (scouted?.Players is null || scouted.Players.Count == 0) return;

        var best = scouted.Players
            .OrderByDescending(p => p.Talent)
            .ThenByDescending(p => p.Strength)
            .First();

        // High youth focus bots are more likely to recruit
        if (best.Talent >= 60 || (bot.YouthFocus >= 70 && best.Talent >= 40))
        {
            await api.RecruitScoutedPlayerAsync(best.Id);
        }
    }
}
