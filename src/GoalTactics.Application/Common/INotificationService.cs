namespace GoalTactics.Application.Common;

public interface INotificationService
{
    Task SendUserNotificationAsync(string userId, string subject, string message, CancellationToken cancellationToken = default);
}
