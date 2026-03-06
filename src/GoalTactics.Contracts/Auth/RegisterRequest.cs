using System.ComponentModel.DataAnnotations;

namespace GoalTactics.Contracts.Auth;

public sealed class RegisterRequest
{
    [Required]
    [EmailAddress]
    [StringLength(256)]
    public required string Email { get; init; }

    [Required]
    [MinLength(8)]
    [StringLength(128)]
    public required string Password { get; init; }

    [Required]
    [StringLength(64, MinimumLength = 2)]
    public required string ManagerName { get; init; }
}
