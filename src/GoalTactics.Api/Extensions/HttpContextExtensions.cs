using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace GoalTactics.Api.Extensions;

public static class HttpContextExtensions
{
    public static string? GetCurrentUserId(this HttpContext context)
    {
        return context.User.FindFirst(JwtRegisteredClaimNames.Sub)?.Value
            ?? context.User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
    }

    public static string? GetCurrentManagerName(this HttpContext context)
    {
        return context.User.FindFirst(JwtRegisteredClaimNames.UniqueName)?.Value
            ?? context.User.FindFirst(ClaimTypes.Name)?.Value;
    }

    public static string? GetCurrentTokenId(this HttpContext context)
    {
        return context.User.FindFirst(JwtRegisteredClaimNames.Jti)?.Value;
    }
}
