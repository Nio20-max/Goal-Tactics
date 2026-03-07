using GoalTactics.Contracts.Stadium;
using GoalTactics.Application.Team;

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

public sealed class StadiumService(ITeamStore teamStore) : IStadiumService
{
    public async Task<StadiumResponse> GetStadiumAsync(string userId, CancellationToken cancellationToken = default)
    {
        var stadium = await teamStore.GetStadiumStateAsync(userId, cancellationToken);
        return new StadiumResponse
        {
            Success = true,
            Stadium = new StadiumData
            {
                Name = stadium.Name,
                GrassQuality = stadium.GrassQuality,
                Capacity = stadium.Capacity,
                EarningsAverage = stadium.EarningsAverage
            }
        };
    }

    public async Task<BuildPlacesResponse> GetBuildPlacesAsync(string userId, CancellationToken cancellationToken = default)
    {
        var places = await teamStore.GetBuildPlacesAsync(userId, cancellationToken);
        return new BuildPlacesResponse
        {
            Success = true,
            Places = places.Select(x => new BuildPlaceData
            {
                Id = x.Id,
                BuildingType = x.BuildingType,
                Level = x.Level,
                CanBuild = x.CanBuild
            }).ToArray()
        };
    }

    public async Task BuildAsync(string userId, Guid placeId, CancellationToken cancellationToken = default)
    {
        var success = await teamStore.BuildPlaceAsync(userId, placeId, cancellationToken);
        if (!success)
        {
            throw new InvalidOperationException("Upgrade unavailable or insufficient resources.");
        }
    }

    public Task SpeedupAsync(string userId, Guid buildId, CancellationToken cancellationToken = default)
    {
        // Build timers are not modeled yet, so speedup currently triggers immediate build semantics.
        return BuildAsync(userId, buildId, cancellationToken);
    }

    public Task RenewGrassAsync(string userId, CancellationToken cancellationToken = default)
    {
        return teamStore.RenewGrassAsync(userId, cancellationToken);
    }

    public Task RenameAsync(string userId, string? name, CancellationToken cancellationToken = default)
    {
        return teamStore.RenameStadiumAsync(userId, string.IsNullOrWhiteSpace(name) ? "My Stadium" : name.Trim(), cancellationToken);
    }
}
