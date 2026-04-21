using System.Globalization;
using System.IdentityModel.Tokens.Jwt;
using System.IO;
using System.Security.Claims;
using System.Text;
using System.Text.Json;
using System.Threading.RateLimiting;
using GoalTactics.Api.Extensions;
using GoalTactics.Api.Middleware;
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
using GoalTactics.Worker;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using Microsoft.IdentityModel.Tokens;

var builder = WebApplication.CreateBuilder(args);

ConfigureLogging(builder);
ConfigureControllers(builder.Services);
ConfigureLocalization(builder.Services);
ConfigureInfrastructure(builder);

var enableWorkerJobs = builder.Configuration.GetValue<bool?>("Worker:EnableJobs") ?? true;
if (enableWorkerJobs)
{
    builder.Services.AddGoalTacticsWorkerJobs();
}

var jwtOptions = builder.Configuration.GetSection(JwtOptions.SectionName).Get<JwtOptions>() ?? new JwtOptions();
ConfigureAuthentication(builder.Services, jwtOptions);
builder.Services.AddAuthorization();

builder.Services.AddHealthChecks()
    .AddCheck<DatabaseHealthCheck>("database");

builder.Services.Configure<ForwardedHeadersOptions>(options =>
{
    options.ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto;
    options.KnownIPNetworks.Clear();
    options.KnownProxies.Clear();
});

var enableRateLimiter = builder.Configuration.GetValue<bool?>("RateLimiting:Enabled") ?? true;
if (enableRateLimiter)
{
    ConfigureRateLimiting(builder.Services);
}

RegisterApplicationServices(builder.Services);
builder.Services.AddOpenApi();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

ApplyDatabaseMigrations(app);

app.UseMiddleware<ErrorEnvelopeMiddleware>();
app.UseForwardedHeaders();
app.UseRequestLocalization();
app.UseMiddleware<BodyTokenAuthMiddleware>();

if (enableRateLimiter)
{
    app.UseRateLimiter();
}

app.UseAuthentication();
app.UseAuthorization();

ConfigureLegacyChatRoute(app);
MapHealthEndpoint(app);

app.MapControllers();
app.MapGoalTacticsRealtime();
app.Run();

void ConfigureLogging(WebApplicationBuilder webApplicationBuilder)
{
    if (webApplicationBuilder.Environment.IsDevelopment())
    {
        return;
    }

    webApplicationBuilder.Logging.AddJsonConsole(options =>
    {
        options.IncludeScopes = true;
        options.TimestampFormat = "yyyy-MM-dd HH:mm:ss.fff ";
    });
}

void ConfigureControllers(IServiceCollection services)
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
}

void ConfigureLocalization(IServiceCollection services)
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
}

void ConfigureInfrastructure(WebApplicationBuilder webApplicationBuilder)
{
    webApplicationBuilder.Services.Configure<JwtOptions>(
        webApplicationBuilder.Configuration.GetSection(JwtOptions.SectionName));

    webApplicationBuilder.Services.AddDataProtection()
        .PersistKeysToFileSystem(new DirectoryInfo("/mnt/website/goal_tactics/data-protection"))
        .SetApplicationName("GoalTactics");

    webApplicationBuilder.Services.AddGoalTacticsInfrastructure(webApplicationBuilder.Configuration);
    webApplicationBuilder.Services.AddGoalTacticsRealtime();
    webApplicationBuilder.Services.AddGoalTacticsRealtimeFilters();
}

void ConfigureAuthentication(IServiceCollection services, JwtOptions jwtOptions)
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
}

void ConfigureRateLimiting(IServiceCollection services)
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

    static string BuildLimiterKey(HttpContext httpContext)
    {
        var userId = httpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        if (!string.IsNullOrWhiteSpace(userId))
        {
            return $"uid:{userId}";
        }

        var ip = httpContext.Connection.RemoteIpAddress?.ToString() ?? "unknown";
        return $"ip:{ip}";
    }
}

void RegisterApplicationServices(IServiceCollection services)
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
}

void ApplyDatabaseMigrations(WebApplication app)
{
    using var scope = app.Services.CreateScope();
    var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();
    var logger = scope.ServiceProvider.GetRequiredService<ILoggerFactory>().CreateLogger("Startup");

    var resetDatabaseOnStartup = app.Configuration.GetValue<bool>("Maintenance:ResetDatabaseOnStartup");
    var resetDatabaseConfirmation = app.Configuration["Maintenance:ResetDatabaseConfirmation"];

    if (resetDatabaseOnStartup)
    {
        if (!string.Equals(resetDatabaseConfirmation, "RESET_GOALTACTICS_DB", StringComparison.Ordinal))
        {
            throw new InvalidOperationException(
                "Maintenance:ResetDatabaseOnStartup requires Maintenance:ResetDatabaseConfirmation=RESET_GOALTACTICS_DB.");
        }

        logger.LogWarning("Maintenance reset requested. Deleting GoalTactics database before applying migrations.");
        dbContext.Database.EnsureDeleted();
    }

    dbContext.Database.Migrate();
}

void ConfigureLegacyChatRoute(WebApplication app)
{
    app.Use(async (context, next) =>
    {
        if (context.Request.Path.Equals("/chat", StringComparison.OrdinalIgnoreCase)
            && context.Request.Method == HttpMethods.Get
            && !context.WebSockets.IsWebSocketRequest
            && !context.Request.Headers.TryGetValue("Upgrade", out _))
        {
            context.Response.ContentType = "text/html; charset=utf-8";
            await context.Response.WriteAsync("<html><head><title>GoalTactics Chat</title></head><body>");
            await context.Response.WriteAsync("<h1>Chat endpoint</h1>");
            await context.Response.WriteAsync("<p>Use chat via the REST API and SignalR negotiation endpoints.</p>");
            await context.Response.WriteAsync("<p>Login via <code>/api/Login</code>, then use <code>/api/PostChatMessage</code> and <code>/api/GetChatHistory</code>.</p>");
            await context.Response.WriteAsync("<p>If you are a browser user, please navigate to the dedicated and improved /admin/chat interface or client UI.</p>");
            await context.Response.WriteAsync("</body></html>");
            return;
        }

        await next();
    });
}

void MapHealthEndpoint(WebApplication app)
{
    app.MapHealthChecks("/health", new HealthCheckOptions
    {
        ResponseWriter = async (context, report) =>
        {
            context.Response.ContentType = "application/json; charset=utf-8";
            var payload = new
            {
                success = report.Status == HealthStatus.Healthy,
                message = report.Status == HealthStatus.Healthy
                    ? "pong"
                    : report.Status.ToString().ToLowerInvariant()
            };

            await context.Response.WriteAsync(JsonSerializer.Serialize(payload));
        }
    });
}

object CreateAuthChallengePayload() => new
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

public partial class Program;
