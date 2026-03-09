using System.ComponentModel.DataAnnotations;

namespace GoalTactics.Contracts.Auth;

public sealed class RegisterRequest : IValidatableObject
{
    [EmailAddress]
    [StringLength(256)]
    public string? Email { get; init; }

    /// <summary>Legacy app sends Login instead of Email.</summary>
    [StringLength(256)]
    public string? Login { get; init; }

    [Required]
    [MinLength(8)]
    [StringLength(128)]
    public required string Password { get; init; }

    [StringLength(64, MinimumLength = 2)]
    public string? ManagerName { get; init; }

    /// <summary>Legacy app sends TeamName instead of ManagerName.</summary>
    [StringLength(64, MinimumLength = 2)]
    public string? TeamName { get; init; }

    /// <summary>Effective email resolved from either Email or Login field.</summary>
    public string? ResolvedEmail => Email ?? Login;

    /// <summary>Effective manager name from either ManagerName or TeamName.</summary>
    public string? ResolvedManagerName => ManagerName ?? TeamName;

    public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    {
        if (string.IsNullOrWhiteSpace(Email) && string.IsNullOrWhiteSpace(Login))
        {
            yield return new ValidationResult(
                "Email or Login is required.",
                new[] { nameof(Email), nameof(Login) });
        }

        if (string.IsNullOrWhiteSpace(ManagerName) && string.IsNullOrWhiteSpace(TeamName))
        {
            yield return new ValidationResult(
                "ManagerName or TeamName is required.",
                new[] { nameof(ManagerName), nameof(TeamName) });
        }
    }
}
