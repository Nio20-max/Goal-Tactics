using System.Text.Json;

namespace GoalTactics.Api.Middleware;

/// <summary>
/// Legacy Xamarin app sends the JWT in the request body's "Token" field instead
/// of the Authorization header. This middleware reads it and sets the header so
/// the standard JwtBearer authentication handler can process it.
/// </summary>
public sealed class BodyTokenAuthMiddleware(RequestDelegate next)
{
    private static readonly JsonDocumentOptions JsonOptions = new() { AllowTrailingCommas = true };

    public async Task Invoke(HttpContext context)
    {
        if (context.Request is { Method: "POST", ContentType: not null }
            && context.Request.ContentType.Contains("application/json", StringComparison.OrdinalIgnoreCase)
            && !context.Request.Headers.ContainsKey("Authorization"))
        {
            context.Request.EnableBuffering();

            try
            {
                using var doc = await JsonDocument.ParseAsync(context.Request.Body, JsonOptions);
                if (doc.RootElement.TryGetProperty("Token", out var tokenProp)
                    && tokenProp.ValueKind == JsonValueKind.String)
                {
                    var token = tokenProp.GetString();
                    if (!string.IsNullOrWhiteSpace(token))
                    {
                        context.Request.Headers.Authorization = $"Bearer {token}";
                    }
                }
            }
            catch (JsonException)
            {
                // Not valid JSON — let the request proceed normally.
            }

            context.Request.Body.Position = 0;
        }

        await next(context);
    }
}
