using System.Text.Json;
using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotMetricsCollector
{
    private readonly List<BotSeasonReport> reports = [];
    private readonly List<TransferCompletionRecord> completedTransfers = [];
    private readonly Dictionary<string, Dictionary<string, decimal>> moneySpendByPersona = new(StringComparer.Ordinal);
    private readonly Dictionary<string, Dictionary<string, decimal>> starsSpendByPersona = new(StringComparer.Ordinal);

    public BotSeasonReport StartSeason(int season)
    {
        var report = new BotSeasonReport { SeasonNumber = season };
        reports.Add(report);
        return report;
    }

    public IReadOnlyList<BotSeasonReport> GetReports() => reports;

    public IReadOnlyList<TransferCompletionRecord> GetCompletedTransfers() => completedTransfers;

    public void RecordSpend(string persona, string resource, string category, decimal amount)
    {
        if (amount <= 0)
        {
            return;
        }

        var target = string.Equals(resource, "money", StringComparison.Ordinal)
            ? moneySpendByPersona
            : starsSpendByPersona;

        if (!target.TryGetValue(persona, out var categories))
        {
            categories = new Dictionary<string, decimal>(StringComparer.Ordinal);
            target[persona] = categories;
        }

        categories.TryGetValue(category, out var existing);
        categories[category] = existing + amount;
    }

    public void RecordCompletedTransfer(TransferCompletionRecord transfer)
    {
        completedTransfers.Add(transfer);
    }

    public async Task WriteAsync(string rootPath)
    {
        Directory.CreateDirectory(rootPath);
        var json = JsonSerializer.Serialize(reports, new JsonSerializerOptions { WriteIndented = true });
        await File.WriteAllTextAsync(Path.Combine(rootPath, "metrics.json"), json);

        var lines = new List<string>
        {
            "season,matches,goals,home_wins,away_wins,draws,auction_bids,ads_watched,chat_messages,friendly_requests,friendly_accepted,sponsors_accepted,season_sponsors_signed,short_sponsors_renewed,transfers_completed,transfer_fees_money,ladder_challenges,stars_spent,stars_earned"
        };

        lines.AddRange(reports.Select(r => string.Join(',',
            r.SeasonNumber,
            r.MatchesPlayed,
            r.TotalGoals,
            r.HomeWins,
            r.AwayWins,
            r.Draws,
            r.AuctionBids,
            r.AdsWatched,
            r.ChatMessages,
            r.FriendlyRequests,
            r.FriendlyAccepted,
            r.SponsorsAccepted,
            r.SeasonSponsorsSigned,
            r.ShortSponsorsRenewed,
            r.TransfersCompleted,
            r.TransferFeesPaidMoney,
            r.LadderChallenges,
            r.StarsSpent,
            r.StarsEarned)));

        await File.WriteAllLinesAsync(Path.Combine(rootPath, "metrics.csv"), lines);

        await WriteTransferCompletionsAsync(rootPath);
        await WritePersonaSpendAsync(rootPath, "money", moneySpendByPersona);
        await WritePersonaSpendAsync(rootPath, "stars", starsSpendByPersona);
    }

    private async Task WriteTransferCompletionsAsync(string rootPath)
    {
        var lines = new List<string>
        {
            "season,timestamp_utc,buyer_bot_id,buyer_persona,buyer_team,player_name,player_age,player_strength,player_potential,fee_money"
        };

        lines.AddRange(completedTransfers.Select(t => string.Join(',',
            t.Season,
            t.TimestampUtc.ToString("O"),
            t.BuyerBotId,
            t.BuyerPersona,
            EscapeCsv(t.BuyerTeam),
            EscapeCsv(t.PlayerName),
            t.PlayerAge,
            t.PlayerStrength,
            t.PlayerPotential,
            t.FeeMoney)));

        await File.WriteAllLinesAsync(Path.Combine(rootPath, "transfer-completions.csv"), lines);
    }

    private static async Task WritePersonaSpendAsync(string rootPath, string resource, Dictionary<string, Dictionary<string, decimal>> spend)
    {
        var categories = spend.Values
            .SelectMany(x => x.Keys)
            .Distinct(StringComparer.Ordinal)
            .OrderBy(x => x, StringComparer.Ordinal)
            .ToArray();

        var header = string.Join(',', new[] { "persona", "resource" }.Concat(categories).Concat(["total"]));
        var lines = new List<string> { header };

        foreach (var persona in spend.Keys.OrderBy(x => x, StringComparer.Ordinal))
        {
            var row = new List<string> { persona, resource };
            decimal total = 0;
            foreach (var category in categories)
            {
                spend[persona].TryGetValue(category, out var value);
                total += value;
                row.Add(value.ToString("0.##"));
            }

            row.Add(total.ToString("0.##"));
            lines.Add(string.Join(',', row));
        }

        await File.WriteAllLinesAsync(Path.Combine(rootPath, $"bot-spend-by-persona-{resource}.csv"), lines);
    }

    private static string EscapeCsv(string value)
    {
        if (!value.Contains(',', StringComparison.Ordinal))
        {
            return value;
        }

        return $"\"{value.Replace("\"", "\"\"", StringComparison.Ordinal)}\"";
    }
}
