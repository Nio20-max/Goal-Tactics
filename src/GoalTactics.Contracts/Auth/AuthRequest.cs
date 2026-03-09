using System.ComponentModel.DataAnnotations;

namespace GoalTactics.Contracts.Auth;

public sealed class AuthRequest : IValidatableObject
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

    /// <summary>Effective email/login identifier resolved from either field.</summary>
    public string? ResolvedLogin => Email ?? Login;

    public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    {
        if (string.IsNullOrWhiteSpace(Email) && string.IsNullOrWhiteSpace(Login))
        {
            yield return new ValidationResult(
                "Email or Login is required.",
                new[] { nameof(Email), nameof(Login) });
        }
    }
}
