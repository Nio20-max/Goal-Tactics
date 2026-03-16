using GoalTactics.Application.League;

namespace GoalTactics.Application.Mechanics;

public sealed class MatchSimulationEngine
{
    // Tactic ordering for the rock-paper-scissors bonus system
    private static readonly string[] TacticOrder =
    [
        "Normal", "Pressing", "CounterAttack", "ThroughTheMiddle",
        "OverTheFlank", "OneTouch", "KickAndRush"
    ];

    /// <summary>
    /// Simple simulation preserving backward compatibility.
    /// </summary>
    public (int HomeScore, int AwayScore, string Report) Simulate(int homeStrength, int awayStrength)
    {
        return Simulate(homeStrength, awayStrength, seed: null);
    }

    /// <summary>
    /// Event-driven match simulation with minute-by-minute resolution.
    /// </summary>
    public MatchResult SimulateDetailed(
        int homeStrength, int awayStrength,
        string? homeTactic, string? awayTactic,
        double homeTacticTraining, double awayTacticTraining,
        IReadOnlyList<SimulationPlayer>? homePlayers,
        IReadOnlyList<SimulationPlayer>? awayPlayers,
        int? seed = null)
    {
        var effectiveHome = ApplyTacticBonus(homeStrength, homeTactic, homeTacticTraining, awayTactic);
        var effectiveAway = ApplyTacticBonus(awayStrength, awayTactic, awayTacticTraining, homeTactic);

        var rng = seed.HasValue ? new Random(seed.Value) : new Random();
        var events = new List<MatchEvent>();
        var homeScore = 0;
        var awayScore = 0;

        // Total strength determines base scoring probability
        var totalStrength = Math.Max(1, effectiveHome + effectiveAway);
        var homeAttackRatio = (double)effectiveHome / totalStrength;

        // Base probability that a goal-scoring chance occurs each minute
        const double chancePerMinute = 0.032; // ~3 goals per 90 minutes on average

        for (var minute = 1; minute <= 90; minute++)
        {
            // Goal scoring chance
            if (rng.NextDouble() < chancePerMinute)
            {
                var isHomeGoal = rng.NextDouble() < homeAttackRatio;
                if (isHomeGoal)
                {
                    homeScore++;
                    var scorer = PickScorer(homePlayers, rng);
                    events.Add(new MatchEvent(minute, MatchEventType.Goal, true, scorer?.PlayerId, scorer?.PlayerName ?? "Unknown"));
                }
                else
                {
                    awayScore++;
                    var scorer = PickScorer(awayPlayers, rng);
                    events.Add(new MatchEvent(minute, MatchEventType.Goal, false, scorer?.PlayerId, scorer?.PlayerName ?? "Unknown"));
                }
            }

            // Yellow card ~0.6% per minute per team (roughly 4 cards per match total)
            if (rng.NextDouble() < 0.022)
            {
                var isHome = rng.NextDouble() < 0.5;
                var player = PickRandomPlayer(isHome ? homePlayers : awayPlayers, rng);
                events.Add(new MatchEvent(minute, MatchEventType.YellowCard, isHome, player?.PlayerId, player?.PlayerName ?? "Unknown"));
            }

            // Red card ~0.3% per minute (rare)
            if (rng.NextDouble() < 0.003)
            {
                var isHome = rng.NextDouble() < 0.5;
                var player = PickRandomPlayer(isHome ? homePlayers : awayPlayers, rng);
                events.Add(new MatchEvent(minute, MatchEventType.RedCard, isHome, player?.PlayerId, player?.PlayerName ?? "Unknown"));
            }

            // Injury ~0.5% per minute per team
            if (rng.NextDouble() < 0.005)
            {
                var isHome = rng.NextDouble() < 0.5;
                var player = PickRandomPlayer(isHome ? homePlayers : awayPlayers, rng);
                events.Add(new MatchEvent(minute, MatchEventType.Injury, isHome, player?.PlayerId, player?.PlayerName ?? "Unknown"));
            }
        }

        // Extract scorers as MatchScorerEvent for persistence
        var scorers = events
            .Where(e => e.Type == MatchEventType.Goal && e.PlayerId is not null)
            .Select(e => new MatchScorerEvent(
                TeamId: "", // Will be filled by caller
                PlayerId: e.PlayerId!,
                Minute: e.Minute))
            .ToList();

        // Generate rich narrative report from events
        var report = MatchReportGenerator.GenerateFullReport(
            homePlayers?.FirstOrDefault()?.TeamId ?? "Home",
            awayPlayers?.FirstOrDefault()?.TeamId ?? "Away",
            homeScore, awayScore, events);

        return new MatchResult(
            homeScore, awayScore, effectiveHome, effectiveAway, events, scorers, report);
    }

    /// <summary>Backward-compatible simulate with optional seed.</summary>
    public (int HomeScore, int AwayScore, string Report) Simulate(int homeStrength, int awayStrength, int? seed)
    {
        var rng = seed.HasValue ? new Random(seed.Value) : new Random(HashCode.Combine(homeStrength, awayStrength, Guid.NewGuid()));

        var diff = homeStrength - awayStrength;
        var homeBase = rng.Next(0, 3) + diff / 25;
        var awayBase = rng.Next(0, 3) - diff / 30;

        var homeScore = Math.Max(0, homeBase);
        var awayScore = Math.Max(0, awayBase);

        return (homeScore, awayScore, $"Simulated result {homeScore}:{awayScore}");
    }

    /// <summary>
    /// Calculate tactic bonus based on the tactic ordering.
    /// Bonus: 10% for 1 step below, 5% for 2 steps, 2.5% for 3 steps.
    /// The bonus is scaled by the team's tactic training percentage (0.0 - 1.0).
    /// </summary>
    public static int ApplyTacticBonus(int baseStrength, string? myTactic, double trainingPercent, string? opponentTactic)
    {
        if (string.IsNullOrEmpty(myTactic) || string.IsNullOrEmpty(opponentTactic))
            return baseStrength;

        if (string.Equals(myTactic, opponentTactic, StringComparison.OrdinalIgnoreCase))
            return baseStrength;

        var myIndex = Array.FindIndex(TacticOrder, t => t.Equals(myTactic, StringComparison.OrdinalIgnoreCase));
        var oppIndex = Array.FindIndex(TacticOrder, t => t.Equals(opponentTactic, StringComparison.OrdinalIgnoreCase));

        if (myIndex < 0 || oppIndex < 0)
            return baseStrength;

        // Calculate circular distance (how many steps "below" opponent is)
        var n = TacticOrder.Length;
        var stepsBelow = ((oppIndex - myIndex) % n + n) % n;

        var bonusPercent = stepsBelow switch
        {
            1 => 0.10,
            2 => 0.05,
            3 => 0.025,
            _ => 0.0  // 4+ steps means the opponent is actually "above"
        };

        if (bonusPercent <= 0)
            return baseStrength;

        var bonus = (int)(baseStrength * bonusPercent * Math.Clamp(trainingPercent, 0, 1));
        return baseStrength + bonus;
    }

    private static SimulationPlayer? PickScorer(IReadOnlyList<SimulationPlayer>? players, Random rng)
    {
        if (players is null || players.Count == 0) return null;

        // Weight by position: forwards score most goals
        var weighted = players.Select(p =>
        {
            var weight = p.Position switch
            {
                "FWD" => 5.0,
                "MID" => 2.5,
                "DEF" => 0.5,
                "GK" => 0.05,
                _ => 1.0
            };
            // Stronger players score more
            weight *= (double)(1 + p.Strength / 100m);
            return (player: p, weight);
        }).ToList();

        var totalWeight = weighted.Sum(w => w.weight);
        var roll = rng.NextDouble() * totalWeight;
        var cumulative = 0.0;
        foreach (var (player, weight) in weighted)
        {
            cumulative += weight;
            if (roll <= cumulative) return player;
        }

        return weighted[^1].player;
    }

    private static SimulationPlayer? PickRandomPlayer(IReadOnlyList<SimulationPlayer>? players, Random rng)
    {
        if (players is null || players.Count == 0) return null;
        return players[rng.Next(players.Count)];
    }
}

public sealed record SimulationPlayer(string PlayerId, string PlayerName, string Position, decimal Strength, string TeamId);

public sealed record MatchEvent(int Minute, MatchEventType Type, bool IsHome, string? PlayerId, string? PlayerName);

public enum MatchEventType
{
    Goal,
    YellowCard,
    RedCard,
    Injury,
    Substitution
}

public sealed record MatchResult(
    int HomeScore,
    int AwayScore,
    int EffectiveHomeStrength,
    int EffectiveAwayStrength,
    IReadOnlyList<MatchEvent> Events,
    IReadOnlyList<MatchScorerEvent> Scorers,
    string Report);
