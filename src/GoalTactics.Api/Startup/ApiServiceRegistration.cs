using System.Globalization;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Text.Json;
using System.Threading.RateLimiting;
using GoalTactics.Api.Extensions;
using GoalTactics.Api.Security;
using GoalTactics.Api.Validation;
using GoalTactics.Application.Abstractions;
using GoalTactics.Application.Auth;
using GoalTactics.Application.Chat;
using GoalTactics.Application.Common;
using GoalTactics.Application.Friends;
using GoalTactics.Application.Ladder;
using GoalTactics.Application.League;
using GoalTactics.Application.Lineup;
using GoalTactics.Application.Live;
using GoalTactics.Application.Scouting;
using GoalTactics.Application.Shop;
using GoalTactics.Application.Sponsors;
using GoalTactics.Application.Squad;
using GoalTactics.Application.Stadium;
using GoalTactics.Application.Team;
using GoalTactics.Application.Training;
using GoalTactics.Application.TransferMarket;
using GoalTactics.Application.Tutorial;
using GoalTactics.Application.User;
using GoalTactics.Infrastructure;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Realtime;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;

namespace GoalTactics.Api.Startup;

internal static class ApiServiceRegistration
{
    internal static IServiceCollection AddGoalTacticsApiControllers(this IServiceCollection services)
    {
        services
            .AddControllers()
            .AddJsonOptions(options =>
            {
                options.JsonSerializerOptions.PropertyNamingPolicy = null;
                options.JsonSerializerOptions.PropertyNameCaseInsensitive = true;
            })
            .ConfigureApiBehaviorOptions(options =>
            {
                options.InvalidModelStateResponseFactory = ValidationErrorFactory.Create;
            });

        return services;
    }

    internal static IServiceCollection AddGoalTacticsApiLocalization(this IServiceCollection services)
    {
        services.AddSingleton<ICountryCatalog, InMemoryCountryCatalog>();
        services.AddLocalization();
        services.Configure<RequestLocalizationOptions>(options =>
        {
            var supportedCultures = new[] { new CultureInfo("de"), new CultureInfo("en") };
            options.DefaultRequestCulture = new RequestCulture("de");
            options.SupportedCultures = supportedCultures;
            options.SupportedUICultures = supportedCultures;
        });

        return services;
    }

    internal static IServiceCollection AddGoalTacticsApiInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        services.Configure<JwtOptions>(configuration.GetSection(JwtOptions.SectionName));
        services.AddDataProtection()
            .PersistKeysToFileSystem(new DirectoryInfo("/mnt/website/goal_tactics/data-protection"))
            .SetApplicationName("GoalTactics");

        services.AddGoalTacticsInfrastructure(configuration);
        services.AddGoalTacticsRealtime();
        services.AddGoalTacticsRealtimeFilters();

        return services;
    }

    internal static IServiceCollection AddGoalTacticsApiAuthentication(this IServiceCollection services, JwtOptions jwtOptions)
    {
        services
            .AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidIssuer = jwtOptions.Issuer,
                    ValidateAudience = true,
                    ValidAudience = jwtOptions.Audience,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtOptions.SigningKey)),
                    ClockSkew = TimeSpan.FromMinutes(1)
                };

                options.Events = new JwtBearerEvents
                {
                    OnMessageReceived = context =>
                    {
                        var accessToken = context.Request.Query["access_token"];
                        var path = context.HttpContext.Request.Path;
                        if (!string.IsNullOrEmpty(accessToken)
                            && (path.StartsWithSegments("/chat") || path.StartsWithSegments("/auc")))
                        {
                            context.Token = accessToken;
                        }

                        return Task.CompletedTask;
                    },
                    OnTokenValidated = async context =>
                    {
                        var tokenId = context.Principal?.FindFirst(JwtRegisteredClaimNames.Jti)?.Value;
                        if (string.IsNullOrWhiteSpace(tokenId))
                        {
                            context.Fail("Token is missing jti claim.");
                            return;
                        }

                        var dbContext = context.HttpContext.RequestServices.GetRequiredService<GoalTacticsDbContext>();
                        var now = DateTime.UtcNow;
                        var isActive = await dbContext.UserSessions.AnyAsync(x =>
                            x.TokenId == tokenId && x.RevokedAtUtc == null && x.ExpiresAtUtc > now);

                        if (!isActive)
                        {
                            context.Fail("Session is revoked or expired.");
                        }
                    },
                    OnChallenge = async context =>
                    {
                        context.HandleResponse();
                        context.Response.StatusCode = StatusCodes.Status200OK;
                        context.Response.ContentType = "application/json; charset=utf-8";
                        await context.Response.WriteAsync(JsonSerializer.Serialize(CreateAuthChallengePayload()));
                    }
                };
            });

        return services;
    }

    internal static IServiceCollection AddGoalTacticsApiRateLimiting(this IServiceCollection services)
    {
        services.AddRateLimiter(options =>
        {
            options.RejectionStatusCode = StatusCodes.Status429TooManyRequests;

            options.OnRejected = async (context, cancellationToken) =>
            {
                var logger = context.HttpContext.RequestServices.GetRequiredService<ILoggerFactory>()
                    .CreateLogger("RateLimiting");
                var ip = context.HttpContext.Connection.RemoteIpAddress?.ToString() ?? "unknown";
                var path = context.HttpContext.Request.Path;
                logger.LogWarning(
                    "Rate limit exceeded for IP {IpAddress} on {Path} (policy: {Policy})",
                    ip,
                    path,
                    context.Lease.TryGetMetadata(MetadataName.RetryAfter, out var retryAfter)
                        ? $"retry-after {retryAfter}"
                        : "none");

                context.HttpContext.Response.ContentType = "application/json; charset=utf-8";
                await context.HttpContext.Response.WriteAsync(
                    """{"success":false,"message":"Too many requests. Please try again later."}""",
                    cancellationToken);
            };

            options.GlobalLimiter = PartitionedRateLimiter.Create<HttpContext, string>(httpContext =>
            {
                var ip = httpContext.Connection.RemoteIpAddress?.ToString() ?? "unknown";
                return RateLimitPartition.GetFixedWindowLimiter(
                    partitionKey: ip,
                    factory: _ => new FixedWindowRateLimiterOptions
                    {
                        PermitLimit = 600,
                        Window = TimeSpan.FromMinutes(1),
                        QueueLimit = 0,
                        AutoReplenishment = true
                    });
            });

            options.AddPolicy("auth-sensitive", httpContext =>
            {
                var key = httpContext.Connection.RemoteIpAddress?.ToString() ?? "unknown";
                return RateLimitPartition.GetFixedWindowLimiter(
                    partitionKey: key,
                    factory: _ => new FixedWindowRateLimiterOptions
                    {
                        PermitLimit = 200,
                        Window = TimeSpan.FromMinutes(1),
                        QueueLimit = 0,
                        AutoReplenishment = true
                    });
            });

            options.AddPolicy("chat-write", httpContext =>
            {
                var key = BuildLimiterKey(httpContext);
                return RateLimitPartition.GetFixedWindowLimiter(
                    partitionKey: key,
                    factory: _ => new FixedWindowRateLimiterOptions
                    {
                        PermitLimit = 12,
                        Window = TimeSpan.FromSeconds(10),
                        QueueLimit = 0,
                        AutoReplenishment = true
                    });
            });

            options.AddPolicy("mutation-write", httpContext =>
            {
                var key = BuildLimiterKey(httpContext);
                return RateLimitPartition.GetFixedWindowLimiter(
                    partitionKey: key,
                    factory: _ => new FixedWindowRateLimiterOptions
                    {
                        PermitLimit = 30,
                        Window = TimeSpan.FromMinutes(1),
                        QueueLimit = 0,
                        AutoReplenishment = true
                    });
            });
        });

        return services;
    }

    internal static IServiceCollection AddGoalTacticsApiApplicationServices(this IServiceCollection services)
    {
        services.AddSingleton<IPasswordHasher, Pbkdf2PasswordHasher>();
        services.AddSingleton<ITokenService, JwtTokenService>();
        services.AddScoped<IAuthService, AuthService>();
        services.AddScoped<ITutorialService, TutorialService>();
        services.AddScoped<IUserService, UserService>();
        services.AddScoped<ITeamService, TeamService>();
        services.AddScoped<ILeagueService, LeagueService>();
        services.AddScoped<IFriendsService, FriendsService>();
        services.AddScoped<ILadderService, LadderService>();
        services.AddScoped<IChatService, ChatService>();
        services.AddScoped<ILineupService, LineupService>();
        services.AddScoped<ILiveService, LiveService>();
        services.AddScoped<IScoutingService, ScoutingService>();
        services.AddScoped<IShopService, ShopService>();
        services.AddScoped<ISponsorService, SponsorService>();
        services.AddScoped<ISquadService, SquadService>();
        services.AddScoped<IStadiumService, StadiumService>();
        services.AddScoped<ITrainingService, TrainingService>();
        services.AddScoped<ITransferMarketService, TransferMarketService>();

        return services;
    }

    private static string BuildLimiterKey(HttpContext httpContext)
    {
        var userId = httpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        if (!string.IsNullOrWhiteSpace(userId))
        {
            return $"uid:{userId}";
        }

        var ip = httpContext.Connection.RemoteIpAddress?.ToString() ?? "unknown";
        return $"ip:{ip}";
    }

    private static object CreateAuthChallengePayload() => new
    {
        success = false,
        message = "Authentication required",
        status = 0,
        errorMessage = "Invalid or expired token",
        trainingCamp = new
        {
            campItems = Array.Empty<object>(),
            updateCampsCost = 0,
            isUpdateEnabled = false,
            success = false,
            message = "Authentication required",
            status = 0,
            errorMessage = "Invalid or expired token",
            punishment = 0,
            totalCount = 0,
            currentPage = 0,
            totalPages = 0
        }
    };
}
