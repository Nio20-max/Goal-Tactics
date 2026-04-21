using System.Text.Json;
using GoalTactics.Infrastructure.Persistence;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Diagnostics.HealthChecks;

namespace GoalTactics.Api.Startup;

internal static class ApiPipelineConfiguration
{
    internal static void ApplyGoalTacticsDatabaseMigrations(this WebApplication app)
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

    internal static void UseLegacyChatRouteHandler(this WebApplication app)
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

    internal static void MapGoalTacticsHealthEndpoint(this WebApplication app)
    {
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
    }
}
