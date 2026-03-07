using GoalTactics.Bots.Config;
using GoalTactics.Bots.Models;
using GoalTactics.Bots.Runtime;

namespace GoalTactics.Bots.Services;

public sealed class BotActionExecutor(BotOptions options, BotCooldownTracker cooldowns, BotMessageGenerator messageGenerator, BotMetricsCollector metricsCollector)
{
    public async Task ExecuteAsync(
        BotClubProfile bot,
        BotIntent intent,
        DateTime nowUtc,
        BotSeasonReport report,
        BotLogWriter logWriter,
        CancellationToken cancellationToken)
    {
        if (!cooldowns.IsReady(bot.BotId, intent.IntentType, nowUtc))
        {
            return;
        }

        switch (intent.IntentType)
        {
            case "lineup.save":
                await logWriter.WriteAsync("bot-actions.log", $"{nowUtc:O}|{bot.BotId}|lineup|saved|tier={bot.Tier}|group={bot.LeagueGroup}");
                cooldowns.SetCooldown(bot.BotId, intent.IntentType, nowUtc, TimeSpan.FromMinutes(90));
                break;

            case "training.update":
                bot.Strength += 1;
                await logWriter.WriteAsync("simulation-events.log", $"{nowUtc:O}|training|bot={bot.BotId}|strength={bot.Strength}");
                cooldowns.SetCooldown(bot.BotId, intent.IntentType, nowUtc, TimeSpan.FromHours(12));
                break;

            case "scouting.standard":
                bot.Money -= 10_000m;
                metricsCollector.RecordSpend(bot.Persona, "money", "scouting.standard", 10_000m);
                await logWriter.WriteAsync("economy.log", $"{nowUtc:O}|scouting.standard|bot={bot.BotId}|money=-10000|balance={bot.Money}");
                cooldowns.SetCooldown(bot.BotId, intent.IntentType, nowUtc, TimeSpan.FromHours(12));
                break;

            case "scouting.premium":
                bot.Stars -= 2_000m;
                report.StarsSpent += 2_000;
                metricsCollector.RecordSpend(bot.Persona, "stars", "scouting.premium", 2_000m);
                await logWriter.WriteAsync("economy.log", $"{nowUtc:O}|scouting.premium|bot={bot.BotId}|stars=-2000|balance={bot.Stars}");
                cooldowns.SetCooldown(bot.BotId, intent.IntentType, nowUtc, TimeSpan.FromHours(3));
                break;

            case "transfer.search":
                await logWriter.WriteAsync("transfers.log", $"{nowUtc:O}|search|bot={bot.BotId}|persona={bot.Persona}");
                await TryCompleteTransferAsync(bot, report, nowUtc, 0.10m, logWriter);
                cooldowns.SetCooldown(bot.BotId, intent.IntentType, nowUtc, TimeSpan.FromMinutes(60));
                break;

            case "transfer.bid":
                bot.Stars -= options.BidStarCost;
                report.AuctionBids++;
                report.StarsSpent += options.BidStarCost;
                metricsCollector.RecordSpend(bot.Persona, "stars", "transfer.bid", options.BidStarCost);
                await logWriter.WriteAsync("transfers.log", $"{nowUtc:O}|bid|bot={bot.BotId}|stars=-{options.BidStarCost}|reason={intent.Reason}");

                await TryCompleteTransferAsync(bot, report, nowUtc, 0.34m, logWriter);
                cooldowns.SetCooldown(bot.BotId, intent.IntentType, nowUtc, TimeSpan.FromMinutes(45));
                break;

            case "finance.review":
                await logWriter.WriteAsync("economy.log", $"{nowUtc:O}|finance.review|bot={bot.BotId}|money={bot.Money}|stars={bot.Stars}");
                cooldowns.SetCooldown(bot.BotId, intent.IntentType, nowUtc, TimeSpan.FromMinutes(120));
                break;

            case "shop.watch-ad":
                if (bot.AdsWatchedToday < 12)
                {
                    bot.Stars += options.StarsPerAd;
                    bot.AdsWatchedToday++;
                    report.AdsWatched++;
                    report.StarsEarned += options.StarsPerAd;
                    await logWriter.WriteAsync("economy.log", $"{nowUtc:O}|rewarded-ad|bot={bot.BotId}|stars=+{options.StarsPerAd}|ads_today={bot.AdsWatchedToday}");
                }
                cooldowns.SetCooldown(bot.BotId, intent.IntentType, nowUtc, TimeSpan.FromMinutes(20));
                break;

            case "sponsor.accept":
                report.SponsorsAccepted++;
                await ApplySponsorContractsAsync(bot, report, nowUtc, logWriter);
                await logWriter.WriteAsync("economy.log", $"{nowUtc:O}|sponsor.accept|bot={bot.BotId}|season={report.SeasonNumber}");
                cooldowns.SetCooldown(bot.BotId, intent.IntentType, nowUtc, TimeSpan.FromHours(24));
                break;

            case "sponsor.review":
                await ApplySponsorContractsAsync(bot, report, nowUtc, logWriter);
                await logWriter.WriteAsync("simulation-events.log", $"{nowUtc:O}|sponsor.review|bot={bot.BotId}");
                cooldowns.SetCooldown(bot.BotId, intent.IntentType, nowUtc, TimeSpan.FromHours(6));
                break;

            case "ladder.challenge":
                bot.LadderStamina = Math.Max(0, bot.LadderStamina - 25);
                report.LadderChallenges++;
                await logWriter.WriteAsync("ladder.log", $"{nowUtc:O}|challenge|bot={bot.BotId}|stamina={bot.LadderStamina}");
                cooldowns.SetCooldown(bot.BotId, intent.IntentType, nowUtc, TimeSpan.FromMinutes(40));
                break;

            case "ladder.restore":
                bot.Stars -= 500m;
                bot.LadderStamina = 100;
                report.StarsSpent += 500;
                metricsCollector.RecordSpend(bot.Persona, "stars", "ladder.restore", 500m);
                await logWriter.WriteAsync("ladder.log", $"{nowUtc:O}|restore|bot={bot.BotId}|stars=-500|stamina=100");
                cooldowns.SetCooldown(bot.BotId, intent.IntentType, nowUtc, TimeSpan.FromHours(4));
                break;

            case "friendly.invite":
                report.FriendlyRequests++;
                if ((bot.Seed + nowUtc.Minute) % 3 != 0)
                {
                    report.FriendlyAccepted++;
                }
                await logWriter.WriteAsync("social-chat.log", $"{nowUtc:O}|friendly.invite|bot={bot.BotId}");
                cooldowns.SetCooldown(bot.BotId, intent.IntentType, nowUtc, TimeSpan.FromHours(8));
                break;

            case "chat.post":
                var random = new Random(HashCode.Combine(bot.Seed, nowUtc.Minute, nowUtc.Hour));
                var context = intent.Metadata.TryGetValue("matchType", out var val) ? val : "general";
                var message = messageGenerator.Build(bot, context, random);
                report.ChatMessages++;
                await logWriter.WriteAsync("social-chat.log", $"{nowUtc:O}|chat|bot={bot.BotId}|team={bot.TeamName}|text={message}");
                cooldowns.SetCooldown(bot.BotId, intent.IntentType, nowUtc, TimeSpan.FromMinutes(30));
                break;

            default:
                await logWriter.WriteAsync("simulation-events.log", $"{nowUtc:O}|noop|bot={bot.BotId}|intent={intent.IntentType}");
                break;
        }

        bot.SessionActionsToday++;
    }

    private async Task ApplySponsorContractsAsync(BotClubProfile bot, BotSeasonReport report, DateTime nowUtc, BotLogWriter logWriter)
    {
        if (bot.SeasonSponsorSignedForSeason != report.SeasonNumber)
        {
            bot.SeasonSponsorSignedForSeason = report.SeasonNumber;
            report.SeasonSponsorsSigned++;
            await logWriter.WriteAsync("economy.log", $"{nowUtc:O}|sponsor.season.sign|bot={bot.BotId}|season={report.SeasonNumber}");
        }

        if (!bot.ShortSponsorActiveUntilUtc.HasValue || nowUtc >= bot.ShortSponsorActiveUntilUtc.Value)
        {
            bot.ShortSponsorActiveUntilUtc = nowUtc.AddDays(3);
            report.ShortSponsorsRenewed++;
            await logWriter.WriteAsync("economy.log", $"{nowUtc:O}|sponsor.short.renew|bot={bot.BotId}|active_until={bot.ShortSponsorActiveUntilUtc:O}");
        }
    }

    private async Task TryCompleteTransferAsync(BotClubProfile bot, BotSeasonReport report, DateTime nowUtc, decimal probability, BotLogWriter logWriter)
    {
        var random = new Random(HashCode.Combine(bot.Seed, nowUtc.DayOfYear, nowUtc.Hour, report.AuctionBids));
        if (random.NextDouble() > (double)probability)
        {
            return;
        }

        var age = random.Next(17, 33);
        var strength = Math.Clamp(bot.Strength + random.Next(-8, 9), 35, 95);
        var potential = Math.Clamp(strength + random.Next(-3, 12), 40, 99);
        var fee = Math.Round((decimal)(strength * 1200 + potential * 650 + random.Next(5_000, 40_000)), 0);

        bot.Money -= fee;
        report.TransfersCompleted++;
        report.TransferFeesPaidMoney += fee;
        metricsCollector.RecordSpend(bot.Persona, "money", "transfer.fee", fee);

        var transfer = new TransferCompletionRecord
        {
            Season = report.SeasonNumber,
            TimestampUtc = nowUtc,
            BuyerBotId = bot.BotId,
            BuyerPersona = bot.Persona,
            BuyerTeam = bot.TeamName,
            PlayerName = $"P{Math.Abs(HashCode.Combine(bot.Seed, nowUtc.Ticks, report.TransfersCompleted)) % 9999:0000}",
            PlayerAge = age,
            PlayerStrength = strength,
            PlayerPotential = potential,
            FeeMoney = fee
        };

        metricsCollector.RecordCompletedTransfer(transfer);
        await logWriter.WriteAsync(
            "transfer-completions.log",
            $"{nowUtc:O}|completed|buyer={bot.BotId}|persona={bot.Persona}|team={bot.TeamName}|player={transfer.PlayerName}|age={age}|str={strength}|pot={potential}|fee={fee}");
    }
}
