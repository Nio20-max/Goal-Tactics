using System.ComponentModel.DataAnnotations;

namespace GoalTactics.Contracts.Common;

public sealed class TextRequest
{
    [Required]
    [StringLength(4096)]
    public required string Text { get; init; }
}
