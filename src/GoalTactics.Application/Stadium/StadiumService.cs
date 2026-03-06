using GoalTactics.Contracts.Stadium;

namespace GoalTactics.Application.Stadium;

public interface IStadiumService
{
    Task<StadiumResponse> GetStadiumAsync(string userId, CancellationToken cancellationToken = default);

    Task<BuildPlacesResponse> GetBuildPlacesAsync(string userId, CancellationToken cancellationToken = default);

    Task BuildAsync(string userId, Guid placeId, CancellationToken cancellationToken = default);

    Task SpeedupAsync(string userId, Guid buildId, CancellationToken cancellationToken = default);

    Task RenewGrassAsync(string userId, CancellationToken cancellationToken = default);

    Task RenameAsync(string userId, string? name, CancellationToken cancellationToken = default);
}

public sealed class StadiumService : IStadiumService
{
    public Task<StadiumResponse> GetStadiumAsync(string userId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(new StadiumResponse
        {
            Success = true,
            Stadium = new StadiumData
            {
                Name = "My Stadium",
                GrassQuality = 80,
                Capacity = 5000,
                EarningsAverage = 25000
            }
        });
    }

    public Task<BuildPlacesResponse> GetBuildPlacesAsync(string userId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(new BuildPlacesResponse
        {
            Success = true,
            Places =
            [
                new BuildPlaceData
                {
                    Id = Guid.NewGuid(),
                    BuildingType = "Tribune",
                    Level = 1,
                    CanBuild = true
                }
            ]
        });
    }

    public Task BuildAsync(string userId, Guid placeId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task SpeedupAsync(string userId, Guid buildId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task RenewGrassAsync(string userId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task RenameAsync(string userId, string? name, CancellationToken cancellationToken = default) => Task.CompletedTask;
}
