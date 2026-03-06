using GoalTactics.Worker.Jobs;
using Microsoft.Extensions.DependencyInjection;

namespace GoalTactics.Worker;

public static class DependencyInjection
{
    public static IServiceCollection AddGoalTacticsWorkerJobs(this IServiceCollection services)
    {
        services.AddHostedService<SeasonTickJob>();
        services.AddHostedService<LeagueFixtureGenerationJob>();
        services.AddHostedService<ScheduledMatchResolutionJob>();
        services.AddHostedService<LadderMatchCleanupJob>();
        services.AddHostedService<AuctionSettlementJob>();
        services.AddHostedService<ScoutingCompletionJob>();
        services.AddHostedService<TrainingProgressJob>();
        services.AddHostedService<ContractExpiryJob>();
        services.AddHostedService<InjuryRecoveryJob>();
        services.AddHostedService<SponsorRefreshJob>();
        services.AddHostedService<DailyRewardResetJob>();
        services.AddHostedService<PushNotificationDispatchJob>();
        services.AddHostedService<ChatRetentionJob>();
        return services;
    }
}
