using System.ComponentModel.DataAnnotations;

namespace GoalTactics.Contracts.Auth;

public sealed class RefreshTokenRequest
{
    [Required]
    public required string RefreshToken { get; init; }
}
