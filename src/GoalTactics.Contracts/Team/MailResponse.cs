using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Team;

public sealed class MailResponse : ResponseObject
{
    public IReadOnlyList<MailData> Mails { get; init; } = [];
}
