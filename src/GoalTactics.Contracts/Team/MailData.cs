namespace GoalTactics.Contracts.Team;

public sealed class MailData
{
    public Guid Id { get; init; }

    public string? Date { get; init; }

    public string? Subject { get; init; }

    public string? Sender { get; init; }

    public string? Message { get; init; }

    public string? Extra { get; init; }

    public bool IsNew { get; init; }

    public int SenderType { get; init; }
}
