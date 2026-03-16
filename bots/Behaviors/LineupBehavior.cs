using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Database;
using GoalTactics.Bots.Client.Neural;

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

    private sealed class PlayerSnapshot
    {
        public string Id { get; init; } = "";
        public int Position { get; init; }
        public decimal Strength { get; init; }
        public bool HasRedCard { get; init; }
        public int Injured { get; init; }
    }

    private sealed class LineupSnapshot
    {
        public string MatchId { get; init; } = "";
        public bool IsLocked { get; init; }
        public string OpponentName { get; init; } = "";
    }

    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan = null)
    {
        var squad = await api.ExecuteForBotAsync("GetSquad");
        if (!squad.Success) return;

        var players = BotApiTranslationReader.GetObjectList(squad, "players")
            .Select(ToPlayer)
            .Where(p => !string.IsNullOrEmpty(p.Id))
            .ToList();
        if (players.Count < 11) return;

        // Filter out unavailable players (injured or red-carded)
        var available = players
            .Where(p => !p.HasRedCard && p.Injured == 0)
            .ToList();
        if (available.Count < 11) return; // Not enough fit players

        var lineupsResponse = await api.ExecuteForBotAsync("GetLineups");
        if (!lineupsResponse.Success) return;

        var ladderResponse = await api.ExecuteForBotAsync("GetLadder");
        var ladderTeams = BotApiTranslationReader.GetObjectList(ladderResponse, "teams");

        var lineups = BotApiTranslationReader.GetObjectList(lineupsResponse, "lineups")
            .Select(ToLineup)
            .Where(l => !string.IsNullOrEmpty(l.MatchId))
            .ToList();

        foreach (var lineup in lineups)
        {
            if (lineup.IsLocked) continue;

            var (formation, selectedIds) = ChooseFormation(available);

            await api.ExecuteForBotAsync("SaveLineup", new SaveLineupRequest
            {
                MatchId = lineup.MatchId,
                PlayerIds = selectedIds,
                System = formation,
                Tactic = ChooseTactic(bot, lineup.OpponentName, ladderTeams)
            });
        }
    }

    /// <summary>
    /// Pick the best formation based on available player positions and select the 11 strongest.
    /// </summary>
    private static (string Formation, List<string> PlayerIds) ChooseFormation(List<PlayerSnapshot> players)
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
        var used = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

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

    private static void AddBest(List<string> selected, HashSet<string> used, List<PlayerSnapshot> pool, int count)
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

    private static string ChooseTactic(BotRecord bot, string opponentName, IReadOnlyList<Dictionary<string, object?>> ladderTeams)
    {
        if (!string.IsNullOrWhiteSpace(opponentName))
        {
            var opponent = ladderTeams.FirstOrDefault(t =>
                string.Equals(BotApiTranslationReader.GetString(t, "teamName"), opponentName, StringComparison.OrdinalIgnoreCase));

            if (opponent is null)
            {
                goto FallbackByRisk;
            }

            int oppStrength = BotApiTranslationReader.GetInt(opponent, "teamStrength");
            if (oppStrength <= 0)
            {
                oppStrength = BotApiTranslationReader.GetInt(opponent, "strength");
            }

            if (oppStrength >= 930) return TacticDefensive;
            if (oppStrength > 0 && oppStrength <= 760) return TacticAttacking;
        }

    FallbackByRisk:
        if (bot.Risk > 70) return TacticAttacking;
        if (bot.Risk < 30) return TacticDefensive;
        return TacticBalanced;
    }

    private static PlayerSnapshot ToPlayer(Dictionary<string, object?> data)
        => new()
        {
            Id = BotApiTranslationReader.GetString(data, "id"),
            Position = BotApiTranslationReader.GetInt(data, "position"),
            Strength = BotApiTranslationReader.GetDecimal(data, "strength"),
            HasRedCard = BotApiTranslationReader.GetBool(data, "hasRedCard"),
            Injured = BotApiTranslationReader.GetInt(data, "injured")
        };

    private static LineupSnapshot ToLineup(Dictionary<string, object?> data)
        => new()
        {
            MatchId = BotApiTranslationReader.GetString(data, "matchId"),
            IsLocked = BotApiTranslationReader.GetBool(data, "isLocked"),
            OpponentName = BotApiTranslationReader.GetString(data, "opponent")
        };
}
