using GoalTactics.Application.Mechanics;

namespace GoalTactics.UnitTests.Mechanics;

public sealed class MatchReportGeneratorTests
{
    [Fact]
    public void DescribeEvent_Goal_IncludesTeamAndPlayer()
    {
        var evt = new MatchEvent(34, MatchEventType.Goal, true, "p1", "John Doe");
        var desc = MatchReportGenerator.DescribeEvent(evt, "FC Home", "FC Away");

        Assert.Contains("34'", desc);
        Assert.Contains("GOAL", desc);
        Assert.Contains("John Doe", desc);
        Assert.Contains("FC Home", desc);
    }

    [Fact]
    public void DescribeEvent_YellowCard_IncludesPlayerAndTeam()
    {
        var evt = new MatchEvent(58, MatchEventType.YellowCard, false, "p2", "Max Müller");
        var desc = MatchReportGenerator.DescribeEvent(evt, "FC Home", "FC Away");

        Assert.Contains("58'", desc);
        Assert.Contains("Max Müller", desc);
        Assert.Contains("FC Away", desc);
        Assert.Contains("🟨", desc);
    }

    [Fact]
    public void DescribeEvent_RedCard_IncludesRedEmoji()
    {
        var evt = new MatchEvent(72, MatchEventType.RedCard, true, "p3", "Red Player");
        var desc = MatchReportGenerator.DescribeEvent(evt, "Team A", "Team B");

        Assert.Contains("🟥", desc);
        Assert.Contains("Red Player", desc);
        Assert.Contains("Team A", desc);
    }

    [Fact]
    public void DescribeEvent_Injury_IncludesInjuryEmoji()
    {
        var evt = new MatchEvent(80, MatchEventType.Injury, false, "p4", "Injured Player");
        var desc = MatchReportGenerator.DescribeEvent(evt, "Team A", "Team B");

        Assert.Contains("🏥", desc);
        Assert.Contains("Injured Player", desc);
    }

    [Fact]
    public void GenerateFullReport_IncludesKickoffAndFullTime()
    {
        var events = new List<MatchEvent>
        {
            new(12, MatchEventType.Goal, true, "p1", "Scorer"),
            new(35, MatchEventType.YellowCard, false, "p2", "Fouler"),
            new(67, MatchEventType.Goal, false, "p3", "Equalizer"),
            new(88, MatchEventType.RedCard, true, "p4", "Hothead")
        };

        var report = MatchReportGenerator.GenerateFullReport("Home FC", "Away FC", 1, 1, events);

        Assert.Contains("Home FC 1 - 1 Away FC", report);
        Assert.Contains("whistle", report);
        Assert.Contains("Half-time", report);
        Assert.Contains("draw", report);
    }

    [Fact]
    public void GenerateFullReport_HomeWin_IncludesWinMessage()
    {
        var events = new List<MatchEvent>
        {
            new(55, MatchEventType.Goal, true, "p1", "Winner")
        };

        var report = MatchReportGenerator.GenerateFullReport("Winners", "Losers", 1, 0, events);

        Assert.Contains("Winners wins", report);
    }

    [Fact]
    public void GenerateFullReport_AwayWin_IncludesWinMessage()
    {
        var events = new List<MatchEvent>
        {
            new(20, MatchEventType.Goal, false, "p1", "Away Scorer")
        };

        var report = MatchReportGenerator.GenerateFullReport("Home", "Away", 0, 1, events);

        Assert.Contains("Away wins", report);
    }

    [Fact]
    public void GenerateFullReport_WithCards_IncludesStatistics()
    {
        var events = new List<MatchEvent>
        {
            new(15, MatchEventType.YellowCard, true, "p1", "Player A"),
            new(30, MatchEventType.YellowCard, false, "p2", "Player B"),
            new(60, MatchEventType.RedCard, false, "p3", "Player C")
        };

        var report = MatchReportGenerator.GenerateFullReport("Home", "Away", 0, 0, events);

        Assert.Contains("Match Statistics", report);
        Assert.Contains("Yellow Cards", report);
        Assert.Contains("Red Cards", report);
    }
}
