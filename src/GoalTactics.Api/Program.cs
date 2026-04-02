using System.Text;
using GoalTactics.Application.Common;
using GoalTactics.Application.Auth;
using GoalTactics.Application.Abstractions;
using GoalTactics.Application.Tutorial;
using GoalTactics.Application.User;
using GoalTactics.Application.Team;
using GoalTactics.Application.League;
using GoalTactics.Application.Friends;
using GoalTactics.Application.Ladder;
using GoalTactics.Application.Chat;
using GoalTactics.Application.Lineup;
using GoalTactics.Application.Live;
using GoalTactics.Application.Scouting;
using GoalTactics.Application.Shop;
using GoalTactics.Application.Sponsors;
using GoalTactics.Application.Squad;
using GoalTactics.Application.Stadium;
using GoalTactics.Application.Training;
using GoalTactics.Application.TransferMarket;
using GoalTactics.Api.Extensions;
using GoalTactics.Api.Middleware;
using GoalTactics.Api.Security;
using GoalTactics.Api.Validation;
using GoalTactics.Infrastructure;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Realtime;
using GoalTactics.Worker;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using Microsoft.IdentityModel.Tokens;
using System.IO;
using System.Security.Claims;
using System.IdentityModel.Tokens.Jwt;
using System.Text.Json;
using System.Globalization;
using System.Threading.RateLimiting;

var builder = WebApplication.CreateBuilder(args);

// Structured JSON logging for production; keep default console in development.
if (!builder.Environment.IsDevelopment())
{
    builder.Logging.AddJsonConsole(options =>
    {
        options.IncludeScopes = true;
        options.TimestampFormat = "yyyy-MM-dd HH:mm:ss.fff ";
    });
}

// Add services to the container.

builder.Services
    .AddControllers()
    .AddJsonOptions(options =>
    {
        // Legacy clients use PascalCase JSON property names and expect case-insensitive deserialization.
        options.JsonSerializerOptions.PropertyNamingPolicy = null;
        options.JsonSerializerOptions.PropertyNameCaseInsensitive = true;
    })
    .ConfigureApiBehaviorOptions(options =>
    {
        options.InvalidModelStateResponseFactory = ValidationErrorFactory.Create;
    });
builder.Services.AddSingleton<ICountryCatalog, InMemoryCountryCatalog>();
builder.Services.AddLocalization();
builder.Services.Configure<RequestLocalizationOptions>(options =>
{
    var supportedCultures = new[] { new CultureInfo("de"), new CultureInfo("en") };
    options.DefaultRequestCulture = new Microsoft.AspNetCore.Localization.RequestCulture("de");
    options.SupportedCultures = supportedCultures;
    options.SupportedUICultures = supportedCultures;
});
builder.Services.Configure<JwtOptions>(builder.Configuration.GetSection(JwtOptions.SectionName));
var jwtOptions = builder.Configuration.GetSection(JwtOptions.SectionName).Get<JwtOptions>() ?? new JwtOptions();
builder.Services.AddDataProtection()
    .PersistKeysToFileSystem(new DirectoryInfo("/mnt/website/goal_tactics/data-protection"))
    .SetApplicationName("GoalTactics");
builder.Services.AddGoalTacticsInfrastructure(builder.Configuration);
builder.Services.AddGoalTacticsRealtime();
builder.Services.AddGoalTacticsRealtimeFilters();
var enableWorkerJobs = builder.Configuration.GetValue<bool?>("Worker:EnableJobs") ?? true;
if (enableWorkerJobs)
{
    builder.Services.AddGoalTacticsWorkerJobs();
}
builder.Services
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
                // SignalR sends token as query string parameter for WebSocket connections
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
                var isActive = await dbContext.UserSessions.AnyAsync(x => x.TokenId == tokenId && x.RevokedAtUtc == null && x.ExpiresAtUtc > now);

                if (!isActive)
                {
                    context.Fail("Session is revoked or expired.");
                }
            },
            OnChallenge = async context =>
            {
                // Legacy client often expects a JSON payload even on auth errors.
                // Return a predictable TrainingCampData-like response to avoid crashes.
                context.HandleResponse();

                context.Response.StatusCode = StatusCodes.Status200OK;
                context.Response.ContentType = "application/json; charset=utf-8";

                var payload = new
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

                await context.Response.WriteAsync(JsonSerializer.Serialize(payload));
            }
        };
    });
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
    builder.Services.AddRateLimiter(options =>
    {
        options.RejectionStatusCode = StatusCodes.Status429TooManyRequests;

        options.OnRejected = async (context, cancellationToken) =>
        {
            var logger = context.HttpContext.RequestServices.GetRequiredService<ILoggerFactory>().CreateLogger("RateLimiting");
            var ip = context.HttpContext.Connection.RemoteIpAddress?.ToString() ?? "unknown";
            var path = context.HttpContext.Request.Path;
            logger.LogWarning("Rate limit exceeded for IP {IpAddress} on {Path} (policy: {Policy})", ip, path, context.Lease.TryGetMetadata(MetadataName.RetryAfter, out var retryAfter) ? $"retry-after {retryAfter}" : "none");

            context.HttpContext.Response.ContentType = "application/json; charset=utf-8";
            await context.HttpContext.Response.WriteAsync(
                """{"success":false,"message":"Too many requests. Please try again later."}""",
                cancellationToken);
        };

        // Global fallback: IP-based limit for all endpoints (generous ceiling)
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
}
builder.Services.AddSingleton<IPasswordHasher, Pbkdf2PasswordHasher>();
builder.Services.AddSingleton<ITokenService, JwtTokenService>();
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<ITutorialService, TutorialService>();
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddScoped<ITeamService, TeamService>();
builder.Services.AddScoped<ILeagueService, LeagueService>();
builder.Services.AddScoped<IFriendsService, FriendsService>();
builder.Services.AddScoped<ILadderService, LadderService>();
builder.Services.AddScoped<IChatService, ChatService>();
builder.Services.AddScoped<ILineupService, LineupService>();
builder.Services.AddScoped<ILiveService, LiveService>();
builder.Services.AddScoped<IScoutingService, ScoutingService>();
builder.Services.AddScoped<IShopService, ShopService>();
builder.Services.AddScoped<ISponsorService, SponsorService>();
builder.Services.AddScoped<ISquadService, SquadService>();
builder.Services.AddScoped<IStadiumService, StadiumService>();
builder.Services.AddScoped<ITrainingService, TrainingService>();
builder.Services.AddScoped<ITransferMarketService, TransferMarketService>();
// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddOpenApi();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

using (var scope = app.Services.CreateScope())
{
    var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();
    var logger = scope.ServiceProvider.GetRequiredService<ILoggerFactory>().CreateLogger("Startup");
    var resetDatabaseOnStartup = app.Configuration.GetValue<bool>("Maintenance:ResetDatabaseOnStartup");
    var resetDatabaseConfirmation = app.Configuration["Maintenance:ResetDatabaseConfirmation"];

    // Guard destructive resets behind an explicit confirmation string so the wipe is always intentional.
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

app.UseMiddleware<ErrorEnvelopeMiddleware>();

app.UseForwardedHeaders();
app.UseRequestLocalization();

// Extract JWT from request body "Token" field for the legacy Xamarin app.
app.UseMiddleware<BodyTokenAuthMiddleware>();

if (enableRateLimiter)
{
    app.UseRateLimiter();
}
app.UseAuthentication();
app.UseAuthorization();

// Legacy chat URL handling:
// - Web browser GET /chat should show user-friendly guidance instead of SignalR "Connection ID required".
// - WebSocket upgrade requests are forwarded to SignalR hub.
app.Use(async (context, next) =>
{
    if (context.Request.Path.Equals("/chat", StringComparison.OrdinalIgnoreCase)
        && context.Request.Method == HttpMethods.Get
        && !context.WebSockets.IsWebSocketRequest
        && !context.Request.Headers.TryGetValue("Upgrade", out var upgradeValue))
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

app.MapHealthChecks("/health", new HealthCheckOptions
{
    ResponseWriter = async (context, report) =>
    {
        context.Response.ContentType = "application/json; charset=utf-8";
        var payload = new
        {
            success = report.Status == HealthStatus.Healthy,
            message = report.Status == HealthStatus.Healthy ? "pong" : report.Status.ToString().ToLowerInvariant()
        };

        await context.Response.WriteAsync(JsonSerializer.Serialize(payload));
    }
});
app.MapControllers();
app.MapGoalTacticsRealtime();

app.Run();

public partial class Program;
