using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Database;

namespace GoalTactics.Bots.Client.Behaviors;

/// <summary>
/// Lineup management: set lineup before matches based on player strength.
/// Choose formation based on squad composition (keepers, defenders, etc.).
/// </summary>
public sealed class LineupBehavior
{
    // Common formations: name → (defenders, midfielders, forwards)
    private static readonly (string Name, int Def, int Mid, int Fwd)[] Formations =
    [
        ("4-4-2", 4, 4, 2),
        ("4-3-3", 4, 3, 3),
        ("3-5-2", 3, 5, 2),
        ("4-5-1", 4, 5, 1),
        ("5-3-2", 5, 3, 2),
        ("3-4-3", 3, 4, 3)
    ];

    // Position indices: 0=GK, 1=DEF, 2=MID, 3=FWD
    private const int PositionGK = 0;
    private const int PositionDEF = 1;
    private const int PositionMID = 2;
    private const int PositionFWD = 3;

    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot)
    {
        var squad = await api.GetSquadAsync();
        if (squad?.Players is null || squad.Players.Count < 11) return;

        var lineups = await api.GetLineupsAsync();
        if (lineups?.Lineups is null) return;

        foreach (var lineup in lineups.Lineups)
        {
            if (lineup.IsLocked) continue;

            var (formation, selectedIds) = ChooseFormation(squad.Players);

            await api.SaveLineupAsync(new SaveLineupRequest
            {
                MatchId = lineup.MatchId,
                PlayerIds = selectedIds,
                System = formation,
                Tactic = ChooseTactic(bot)
            });
        }
    }

    /// <summary>
    /// Pick the best formation based on available player positions and select the 11 strongest.
    /// </summary>
    private static (string Formation, List<string> PlayerIds) ChooseFormation(List<PlayerDto> players)
    {
        // Categorize players by position index
        var keepers = players.Where(p => p.Position == PositionGK).OrderByDescending(p => p.Strength).ToList();
        var defenders = players.Where(p => p.Position == PositionDEF).OrderByDescending(p => p.Strength).ToList();
        var midfielders = players.Where(p => p.Position == PositionMID).OrderByDescending(p => p.Strength).ToList();
        var forwards = players.Where(p => p.Position == PositionFWD).OrderByDescending(p => p.Strength).ToList();

        // If position data is missing, fall back to strength-based selection
        if (keepers.Count == 0 && defenders.Count == 0 && midfielders.Count == 0 && forwards.Count == 0)
        {
            var top11 = players.OrderByDescending(p => p.Strength).Take(11).Select(p => p.Id).ToList();
            return ("4-4-2", top11);
        }

        // Find the formation we can best fill
        string bestFormation = "4-4-2";
        int bestScore = -1;

        foreach (var (name, dCount, mCount, fCount) in Formations)
        {
            int score = Math.Min(keepers.Count, 1)
                      + Math.Min(defenders.Count, dCount)
                      + Math.Min(midfielders.Count, mCount)
                      + Math.Min(forwards.Count, fCount);

            if (score > bestScore)
            {
                bestScore = score;
                bestFormation = name;
            }
        }

        // Parse chosen formation
        var parts = bestFormation.Split('-');
        int defNeeded = int.Parse(parts[0]);
        int midNeeded = int.Parse(parts[1]);
        int fwdNeeded = int.Parse(parts[2]);

        // Select players for the lineup
        var selected = new List<string>();
        var used = new HashSet<string>(StringComparer.Ordinal);

        // 1 keeper
        AddBest(selected, used, keepers, 1);

        // Fill formation slots
        AddBest(selected, used, defenders, defNeeded);
        AddBest(selected, used, midfielders, midNeeded);
        AddBest(selected, used, forwards, fwdNeeded);

        // If we still don't have 11, fill with remaining strongest players
        if (selected.Count < 11)
        {
            var remaining = players
                .Where(p => !used.Contains(p.Id))
                .OrderByDescending(p => p.Strength);

            foreach (var p in remaining)
            {
                if (selected.Count >= 11) break;
                selected.Add(p.Id);
                used.Add(p.Id);
            }
        }

        return (bestFormation, selected.Take(11).ToList());
    }

    private static void AddBest(List<string> selected, HashSet<string> used, List<PlayerDto> pool, int count)
    {
        int added = 0;
        foreach (var p in pool)
        {
            if (added >= count) break;
            if (used.Add(p.Id))
            {
                selected.Add(p.Id);
                added++;
            }
        }
    }

    /// <summary>
    /// Choose a tactic string based on the bot's personality.
    /// </summary>
    // Tactic values as expected by the API (integer codes sent as strings)
    private const string TacticAttacking = "2";
    private const string TacticDefensive = "1";
    private const string TacticBalanced = "0";

    private static string ChooseTactic(BotRecord bot)
    {
        if (bot.Risk > 70) return TacticAttacking;
        if (bot.Risk < 30) return TacticDefensive;
        return TacticBalanced;
    }
}
