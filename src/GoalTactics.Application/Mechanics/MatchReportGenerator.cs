namespace GoalTactics.Application.Mechanics;

/// <summary>
/// Generates human-readable narrative text for match events and full match reports.
/// </summary>
public static class MatchReportGenerator
{
    private static readonly string[] GoalCelebrations =
    [
        "fires a shot into the net",
        "scores with a brilliant finish",
        "heads the ball into the goal",
        "slots it past the keeper",
        "smashes a volley into the top corner",
        "taps in from close range",
        "curls a free kick into the net",
        "finishes with a powerful strike"
    ];

    private static readonly string[] YellowCardPhrases =
    [
        "is shown a yellow card for a reckless challenge",
        "picks up a booking after a late tackle",
        "receives a caution for unsporting behaviour",
        "gets a yellow card for a cynical foul"
    ];

    private static readonly string[] RedCardPhrases =
    [
        "is sent off with a straight red card",
        "receives a second yellow and is sent off",
        "gets a red card for a dangerous tackle",
        "is shown a red card and must leave the pitch"
    ];

    private static readonly string[] InjuryPhrases =
    [
        "goes down injured and needs treatment",
        "is forced off with an injury",
        "limps off the field after a collision",
        "has to be substituted due to an injury"
    ];

    /// <summary>
    /// Generates a descriptive text for a single match event.
    /// </summary>
    public static string DescribeEvent(MatchEvent evt, string homeName, string awayName)
    {
        var teamName = evt.IsHome ? homeName : awayName;
        var playerDisplay = evt.PlayerName ?? "A player";
        var hash = Math.Abs(HashCode.Combine(evt.Minute, evt.PlayerId ?? "", (int)evt.Type));

        return evt.Type switch
        {
            MatchEventType.Goal =>
                $"⚽ {evt.Minute}' — GOAL! {playerDisplay} ({teamName}) {Pick(GoalCelebrations, hash)}!",
            MatchEventType.YellowCard =>
                $"🟨 {evt.Minute}' — {playerDisplay} ({teamName}) {Pick(YellowCardPhrases, hash)}.",
            MatchEventType.RedCard =>
                $"🟥 {evt.Minute}' — {playerDisplay} ({teamName}) {Pick(RedCardPhrases, hash)}!",
            MatchEventType.Injury =>
                $"🏥 {evt.Minute}' — {playerDisplay} ({teamName}) {Pick(InjuryPhrases, hash)}.",
            MatchEventType.Substitution =>
                $"🔄 {evt.Minute}' — Substitution for {teamName}: {playerDisplay} comes off.",
            _ =>
                $"{evt.Minute}' — {playerDisplay} ({teamName})"
        };
    }

    /// <summary>
    /// Generates a full narrative match report from a list of events.
    /// </summary>
    public static string GenerateFullReport(
        string homeName, string awayName,
        int homeScore, int awayScore,
        IReadOnlyList<MatchEvent> events)
    {
        var lines = new List<string>
        {
            $"<b>{homeName} {homeScore} - {awayScore} {awayName}</b>",
            ""
        };

        // Kick-off
        lines.Add($"📣 The referee blows the whistle and the match between {homeName} and {awayName} is underway!");
        lines.Add("");

        var sortedEvents = events.OrderBy(e => e.Minute).ToList();
        var halfTimeAdded = false;

        foreach (var evt in sortedEvents)
        {
            if (!halfTimeAdded && evt.Minute > 45)
            {
                // Insert half-time summary
                var htHome = sortedEvents.Count(e => e.Type == MatchEventType.Goal && e.IsHome && e.Minute <= 45);
                var htAway = sortedEvents.Count(e => e.Type == MatchEventType.Goal && !e.IsHome && e.Minute <= 45);
                lines.Add($"⏸️ Half-time: {homeName} {htHome} - {htAway} {awayName}");
                lines.Add("");
                halfTimeAdded = true;
            }

            lines.Add(DescribeEvent(evt, homeName, awayName));
        }

        lines.Add("");

        // Full-time summary
        if (homeScore > awayScore)
            lines.Add($"🏆 Full-time! {homeName} wins {homeScore}-{awayScore} against {awayName}!");
        else if (awayScore > homeScore)
            lines.Add($"🏆 Full-time! {awayName} wins {awayScore}-{homeScore} against {homeName}!");
        else
            lines.Add($"🤝 Full-time! The match ends in a {homeScore}-{awayScore} draw.");

        // Stats summary
        var homeGoals = sortedEvents.Count(e => e.Type == MatchEventType.Goal && e.IsHome);
        var awayGoals = sortedEvents.Count(e => e.Type == MatchEventType.Goal && !e.IsHome);
        var homeYellows = sortedEvents.Count(e => e.Type == MatchEventType.YellowCard && e.IsHome);
        var awayYellows = sortedEvents.Count(e => e.Type == MatchEventType.YellowCard && !e.IsHome);
        var homeReds = sortedEvents.Count(e => e.Type == MatchEventType.RedCard && e.IsHome);
        var awayReds = sortedEvents.Count(e => e.Type == MatchEventType.RedCard && !e.IsHome);

        if (homeYellows + awayYellows + homeReds + awayReds > 0)
        {
            lines.Add("");
            lines.Add("📊 Match Statistics:");
            if (homeYellows + awayYellows > 0)
                lines.Add($"  🟨 Yellow Cards: {homeName} {homeYellows} - {awayYellows} {awayName}");
            if (homeReds + awayReds > 0)
                lines.Add($"  🟥 Red Cards: {homeName} {homeReds} - {awayReds} {awayName}");
        }

        return string.Join("\n", lines);
    }

    private static string Pick(string[] phrases, int hash)
    {
        return phrases[Math.Abs(hash) % phrases.Length];
    }
}
