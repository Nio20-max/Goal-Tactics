using GoalTactics.Application.Auth;
using GoalTactics.Application.Chat;
using GoalTactics.Application.Friends;
using GoalTactics.Application.League;
using GoalTactics.Application.Ladder;
using GoalTactics.Application.Mechanics;
using GoalTactics.Application.Sponsors;
using GoalTactics.Application.Team;
using GoalTactics.Application.TransferMarket;
using GoalTactics.Application.Tutorial;
using GoalTactics.Application.User;
using GoalTactics.Infrastructure.Authentication;
using GoalTactics.Infrastructure.Chat;
using GoalTactics.Infrastructure.Friends;
using GoalTactics.Infrastructure.League;
using GoalTactics.Infrastructure.Ladder;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Sponsors;
using GoalTactics.Infrastructure.Team;
using GoalTactics.Infrastructure.TransferMarket;
using GoalTactics.Infrastructure.Tutorial;
using GoalTactics.Infrastructure.User;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace GoalTactics.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddGoalTacticsInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        var connectionString = configuration.GetConnectionString("Default") ?? "Data Source=goaltactics.db";

        services.AddDbContext<GoalTacticsDbContext>(options =>
        {
            options.UseSqlite(connectionString);
        });

        services.AddScoped<IAuthStore, AuthDbStore>();
        services.AddScoped<IChatStore, ChatDbStore>();
        services.AddScoped<IFriendsStore, FriendsDbStore>();
        services.AddScoped<ILeagueStore, LeagueDbStore>();
        services.AddScoped<ILadderStore, LadderDbStore>();
        services.AddSingleton<StadiumEconomyService>();
        services.AddSingleton<TrainingProgressService>();
        services.AddSingleton<TeamStrengthCalculator>();
        services.AddSingleton<ContractCostService>();
        services.AddScoped<ITeamStore, TeamDbStore>();
        services.AddScoped<IAuctionStore, AuctionDbStore>();
        services.AddScoped<ISponsorStore, SponsorDbStore>();
        services.AddScoped<ITutorialStore, TutorialDbStore>();
        services.AddScoped<IUserStore, UserDbStore>();

        return services;
    }
}
