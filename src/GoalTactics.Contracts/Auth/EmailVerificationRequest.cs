using System.ComponentModel.DataAnnotations;

namespace GoalTactics.Contracts.Auth;

public sealed class EmailVerificationRequest
{
    [Required]
    public required string UserId { get; init; }

    [Required]
    public required string Token { get; init; }
}
