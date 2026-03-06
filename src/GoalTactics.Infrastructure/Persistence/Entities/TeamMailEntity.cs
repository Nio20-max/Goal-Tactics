namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class TeamMailEntity
{
    public required string Id { get; set; }

    public required string UserId { get; set; }

    public required string DateText { get; set; }

    public required string Subject { get; set; }

    public required string Sender { get; set; }

    public required string Message { get; set; }

    public string Extra { get; set; } = string.Empty;

    public bool IsNew { get; set; }

    public int SenderType { get; set; }
}
