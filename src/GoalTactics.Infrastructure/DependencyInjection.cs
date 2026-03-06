using GoalTactics.Application.Auth;
using GoalTactics.Infrastructure.Authentication;
using GoalTactics.Infrastructure.Persistence;
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

        return services;
    }
}
