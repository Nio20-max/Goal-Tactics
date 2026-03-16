using GoalTactics.Bots.Models;
using GoalTactics.Bots.Services;

namespace GoalTactics.Bots.Runtime;

public sealed class BotActionScheduler(
    BotLineupPlanner lineupPlanner,
    BotTrainingPlanner trainingPlanner,
    BotScoutingPlanner scoutingPlanner,
    BotTransferPlanner transferPlanner,
    BotFinancePlanner financePlanner,
    BotSponsorPlanner sponsorPlanner,
    BotLadderPlanner ladderPlanner,
    BotFriendlyPlanner friendlyPlanner,
    BotChatPlanner chatPlanner,
    BotSkillCardPlanner skillCardPlanner)
{
    public IReadOnlyList<BotIntent> BuildIntents(BotClubProfile bot, BotPerceptionSnapshot perception, DateTime nowUtc)
    {
        var intents = new List<BotIntent>(16);
        intents.AddRange(lineupPlanner.Plan(bot, perception, nowUtc));
        intents.AddRange(trainingPlanner.Plan(bot, perception, nowUtc));
        intents.AddRange(scoutingPlanner.Plan(bot, perception, nowUtc));
        intents.AddRange(transferPlanner.Plan(bot, perception, nowUtc));
        intents.AddRange(financePlanner.Plan(bot, perception, nowUtc));
        intents.AddRange(sponsorPlanner.Plan(bot, perception, nowUtc));
        intents.AddRange(ladderPlanner.Plan(bot, perception, nowUtc));
        intents.AddRange(friendlyPlanner.Plan(bot, perception, nowUtc));
        intents.AddRange(chatPlanner.Plan(bot, perception, nowUtc));
        intents.AddRange(skillCardPlanner.Plan(bot, perception, nowUtc));

        return intents
            .OrderByDescending(x => x.Score)
            .ThenBy(x => x.IntentType, StringComparer.Ordinal)
            .ToArray();
    }
}
