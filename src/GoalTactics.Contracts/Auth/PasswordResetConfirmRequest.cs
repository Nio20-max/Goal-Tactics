using System.ComponentModel.DataAnnotations;

namespace GoalTactics.Contracts.Auth;

public sealed class PasswordResetConfirmRequest
{
    [Required]
    [EmailAddress]
    public required string Email { get; init; }

    [Required]
    public required string Token { get; init; }

    [Required]
    [MinLength(8)]
    public required string NewPassword { get; init; }
}
