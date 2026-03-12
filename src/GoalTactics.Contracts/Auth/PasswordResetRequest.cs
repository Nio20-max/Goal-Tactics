using System.ComponentModel.DataAnnotations;

namespace GoalTactics.Contracts.Auth;

public sealed class PasswordResetRequest
{
    [Required]
    [EmailAddress]
    public required string Email { get; init; }
}
