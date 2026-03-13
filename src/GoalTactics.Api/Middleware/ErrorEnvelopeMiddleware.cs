using System.Net;
using System.Text.Json;

namespace GoalTactics.Api.Middleware;

public sealed class ErrorEnvelopeMiddleware(RequestDelegate next, ILogger<ErrorEnvelopeMiddleware> logger)
{
    public async Task Invoke(HttpContext context)
    {
        try
        {
            await next(context);
        }
        catch (InvalidOperationException ex)
        {
            // Business logic errors (validation failures, insufficient resources, etc.)
            logger.LogWarning(ex, "Business logic error while processing request {Path}", context.Request.Path);

            if (context.Response.HasStarted) throw;

            context.Response.Clear();
            context.Response.StatusCode = (int)HttpStatusCode.UnprocessableEntity;
            context.Response.ContentType = "application/json";

            var payload = new
            {
                success = false,
                message = ex.Message
            };

            await context.Response.WriteAsync(JsonSerializer.Serialize(payload));
        }
        catch (Exception ex)
        {
            logger.LogError(ex, "Unhandled exception while processing request {Path}", context.Request.Path);

            if (context.Response.HasStarted)
            {
                throw;
            }

            context.Response.Clear();
            context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
            context.Response.ContentType = "application/json";

            var payload = new
            {
                success = false,
                error = new
                {
                    code = "internal_error",
                    message = "An unexpected server error occurred."
                }
            };

            await context.Response.WriteAsync(JsonSerializer.Serialize(payload));
        }
    }
}
