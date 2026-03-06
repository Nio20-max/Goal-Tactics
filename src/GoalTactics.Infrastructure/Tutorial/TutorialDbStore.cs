using GoalTactics.Application.Tutorial;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.Infrastructure.Tutorial;

public sealed class TutorialDbStore(GoalTacticsDbContext dbContext) : ITutorialStore
{
    public async Task<string?> GetCurrentTopicIdAsync(string userId, CancellationToken cancellationToken = default)
    {
        var state = await dbContext.TutorialStates.AsNoTracking().FirstOrDefaultAsync(x => x.UserId == userId, cancellationToken);
        return state?.CurrentTopicId;
    }

    public async Task SetCurrentTopicIdAsync(string userId, string topicId, CancellationToken cancellationToken = default)
    {
        var state = await dbContext.TutorialStates.FirstOrDefaultAsync(x => x.UserId == userId, cancellationToken);
        if (state is null)
        {
            state = new TutorialStateEntity
            {
                UserId = userId,
                CurrentTopicId = topicId,
                UpdatedAtUtc = DateTime.UtcNow
            };
            dbContext.TutorialStates.Add(state);
        }
        else
        {
            state.CurrentTopicId = topicId;
            state.UpdatedAtUtc = DateTime.UtcNow;
        }

        await dbContext.SaveChangesAsync(cancellationToken);
    }
}
