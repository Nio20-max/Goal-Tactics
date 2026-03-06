using System.ComponentModel.DataAnnotations;

namespace GoalTactics.Contracts.Common;

public sealed class TextRequest
{
    [Required]
    [MinLength(8)]
    [StringLength(4096)]
    public required string Text { get; init; }
}
