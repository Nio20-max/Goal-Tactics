using GoalTactics.Api.Middleware;
using GoalTactics.Api.Security;
using GoalTactics.Api.Startup;
using GoalTactics.Api.Extensions;
using GoalTactics.Realtime;
using GoalTactics.Worker;
using Microsoft.AspNetCore.HttpOverrides;

var builder = WebApplication.CreateBuilder(args);

if (!builder.Environment.IsDevelopment())
{
    builder.Logging.AddJsonConsole(options =>
    {
        options.IncludeScopes = true;
        options.TimestampFormat = "yyyy-MM-dd HH:mm:ss.fff ";
    });
}

builder.Services
    .AddGoalTacticsApiControllers()
    .AddGoalTacticsApiLocalization()
    .AddGoalTacticsApiInfrastructure(builder.Configuration);

var enableWorkerJobs = builder.Configuration.GetValue<bool?>("Worker:EnableJobs") ?? true;
if (enableWorkerJobs)
{
    builder.Services.AddGoalTacticsWorkerJobs();
}

var jwtOptions = builder.Configuration.GetSection(JwtOptions.SectionName).Get<JwtOptions>() ?? new JwtOptions();
builder.Services.AddGoalTacticsApiAuthentication(jwtOptions);
builder.Services.AddAuthorization();

builder.Services.AddHealthChecks().AddCheck<DatabaseHealthCheck>("database");
builder.Services.Configure<ForwardedHeadersOptions>(options =>
{
    options.ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto;
    options.KnownIPNetworks.Clear();
    options.KnownProxies.Clear();
});

var enableRateLimiter = builder.Configuration.GetValue<bool?>("RateLimiting:Enabled") ?? true;
if (enableRateLimiter)
{
    builder.Services.AddGoalTacticsApiRateLimiting();
}

builder.Services
    .AddGoalTacticsApiApplicationServices()
    .AddOpenApi();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

app.ApplyGoalTacticsDatabaseMigrations();

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
app.UseLegacyChatRouteHandler();
app.MapGoalTacticsHealthEndpoint();
app.MapControllers();
app.MapGoalTacticsRealtime();
app.Run();

public partial class Program;
