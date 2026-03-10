using System.ComponentModel.DataAnnotations;

namespace GoalTactics.Contracts.Auth;

public sealed class RegisterRequest : IValidatableObject
{
    public bool IsGuest { get; init; }

    [EmailAddress]
    [StringLength(256)]
    public string? Email { get; init; }

    /// <summary>Legacy app sends Login instead of Email.</summary>
    [StringLength(256)]
    public string? Login { get; init; }

    [StringLength(128)]
    public string? Password { get; init; }

    [StringLength(64, MinimumLength = 2)]
    public string? ManagerName { get; init; }

    /// <summary>Legacy app sends TeamName instead of ManagerName.</summary>
    [StringLength(64, MinimumLength = 2)]
    public string? TeamName { get; init; }

    public string? CountryId { get; init; }

    /// <summary>Effective email resolved from either Email or Login field.</summary>
    public string? ResolvedEmail => Email ?? Login;

    /// <summary>Effective manager name from either ManagerName or TeamName.</summary>
    public string? ResolvedManagerName => ManagerName ?? TeamName;

    public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    {
        if (!IsGuest)
        {
            if (string.IsNullOrWhiteSpace(Email) && string.IsNullOrWhiteSpace(Login))
            {
                yield return new ValidationResult(
                    "Email or Login is required.",
                    new[] { nameof(Email), nameof(Login) });
            }

            if (string.IsNullOrWhiteSpace(Password))
            {
                yield return new ValidationResult(
                    "Password is required.",
                    new[] { nameof(Password) });
            }
        }

        if (string.IsNullOrWhiteSpace(ManagerName) && string.IsNullOrWhiteSpace(TeamName))
        {
            yield return new ValidationResult(
                "ManagerName or TeamName is required.",
                new[] { nameof(ManagerName), nameof(TeamName) });
        }
    }
}
