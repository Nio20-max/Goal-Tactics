using System.Text.Json;
using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotMessageGenerator
{
    private readonly string[] templates;

    public BotMessageGenerator(string templateFilePath)
    {
        if (File.Exists(templateFilePath))
        {
            var json = File.ReadAllText(templateFilePath);
            templates = JsonSerializer.Deserialize<string[]>(json) ?? ["Good match today!"];
        }
        else
        {
            templates =
            [
                "Great matchday for us.",
                "Auction race was intense.",
                "Good luck in ladder everyone.",
                "Sponsor deal helped our squad today."
            ];
        }
    }

    public string Build(BotClubProfile bot, string context, Random random)
    {
        var raw = templates[random.Next(templates.Length)];
        return raw
            .Replace("{TEAM}", bot.TeamName, StringComparison.Ordinal)
            .Replace("{CONTEXT}", context, StringComparison.Ordinal);
    }
}
