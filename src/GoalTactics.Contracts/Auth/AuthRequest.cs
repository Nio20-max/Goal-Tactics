using System.ComponentModel.DataAnnotations;

namespace GoalTactics.Contracts.Auth;

public sealed class AuthRequest
{
    [Required]
    [EmailAddress]
    [StringLength(256)]
    public required string Email { get; init; }

    [Required]
    [MinLength(8)]
    [StringLength(128)]
    public required string Password { get; init; }
}
