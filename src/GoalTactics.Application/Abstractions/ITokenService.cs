namespace GoalTactics.Application.Abstractions;

public interface ITokenService
{
    string CreateToken(string userId, string managerName, string tokenId);

    DateTime GetExpiryUtc(DateTime utcNow);

    TokenValidationResult ValidateToken(string token);
}

public sealed record TokenValidationResult(bool IsValid, string? UserId, string? ManagerName, string? TokenId);
