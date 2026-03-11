using GoalTactics.Contracts.TransferMarket;
using GoalTactics.Application.Team;
using GoalTactics.Application.Common;

namespace GoalTactics.Application.TransferMarket;

public interface ITransferMarketService
{
    Task<TransferSearchResponse> SearchAsync(string userId, TransferSearchRequest request, CancellationToken cancellationToken = default);

    Task<TransferDetailsResponse> GetDetailsAsync(string userId, Guid id, CancellationToken cancellationToken = default);

    Task BidAsync(string userId, BidRequest request, CancellationToken cancellationToken = default);

    Task UpdateFavoriteAsync(string userId, Guid id, CancellationToken cancellationToken = default);

    Task<TransferSearchResponse> GetFavoritesAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed class TransferMarketService(ITeamStore teamStore) : ITransferMarketService
{
    private static string PositionToString(int pos) => pos switch
    {
        0 => "Keeper",
        1 => "Defender",
        2 => "Midfielder",
        3 => "Striker",
        _ => "Midfielder"
    };

    public async Task<TransferSearchResponse> SearchAsync(string userId, TransferSearchRequest request, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var players = BuildTransferPlayers()
            .Where(player => request.MinimumBid is null || player.MinimumBid >= request.MinimumBid)
            .Where(player => request.Strength is null || player.Strength >= request.Strength)
            .Where(player => request.OnlyKeeper is not true || player.Position == "Keeper")
            .ToArray();

        return new TransferSearchResponse
        {
            Success = true,
            Players = players,
            Favorites = players.Take(1).ToArray(),
            Sellings = [],
            MyTeamId = Guid.TryParse(team.TeamId, out var myTeamId) ? myTeamId : Guid.Empty
        };
    }

    public async Task<TransferDetailsResponse> GetDetailsAsync(string userId, Guid id, CancellationToken cancellationToken = default)
    {
        var search = await SearchAsync(userId, new TransferSearchRequest(), cancellationToken);
        var player = search.Players.FirstOrDefault(candidate => candidate.Id == id)
            ?? search.Players.FirstOrDefault();

        return new TransferDetailsResponse
        {
            Success = true,
            BidCost = 200,
            MyTeamId = search.MyTeamId,
            Player = player,
            AuctionPlayer = player
        };
    }

    public async Task BidAsync(string userId, BidRequest request, CancellationToken cancellationToken = default)
    {
        if (request.Bid <= 0)
        {
            throw new InvalidOperationException("Bid must be positive.");
        }

        var spent = await teamStore.TrySpendStarsAsync(userId, 200m, cancellationToken);
        if (!spent)
        {
            throw new InvalidOperationException("Bidding on a player costs 200 GT Stars.");
        }
    }

    public Task UpdateFavoriteAsync(string userId, Guid id, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task<TransferSearchResponse> GetFavoritesAsync(string userId, CancellationToken cancellationToken = default)
    {
        return SearchAsync(userId, new TransferSearchRequest(), cancellationToken);
    }

    private static TransferPlayerData[] BuildTransferPlayers()
    {
        return
        [
            new TransferPlayerData
            {
                Id = Guid.Parse("9c912da7-372e-41de-a7f2-830196e4ead3"),
                Name = "Calvin Johnston",
                Position = "Midfielder",
                Strength = 93,
                MinimumBid = 103332,
                EndDate = DateTime.UtcNow.AddMinutes(35).ToString("O")
            },
            new TransferPlayerData
            {
                Id = Guid.Parse("de49cc43-12f0-4e01-9c83-0af5f78eb6c3"),
                Name = "Vyshezor Raizgys",
                Position = "Midfielder",
                Strength = 117,
                MinimumBid = 155804,
                EndDate = DateTime.UtcNow.AddMinutes(38).ToString("O")
            },
            new TransferPlayerData
            {
                Id = Guid.Parse("157e6fea-d701-4993-8d31-230641af018b"),
                Name = "Falkmar Pfalz-sulzbach",
                Position = "Striker",
                Strength = 94,
                MinimumBid = 104904,
                EndDate = DateTime.UtcNow.AddHours(1).ToString("O")
            },
            new TransferPlayerData
            {
                Id = Guid.Parse("4ed4ee16-5c47-4384-bd0b-572cd4aec0e2"),
                Name = "Jade Morante",
                Position = "Striker",
                Strength = 67,
                MinimumBid = 74552,
                EndDate = DateTime.UtcNow.AddHours(2).ToString("O")
            },
            new TransferPlayerData
            {
                Id = Guid.Parse("093178ec-0864-4913-924f-e71f51544ad9"),
                Name = "Hendrik Haintzl",
                Position = "Keeper",
                Strength = 80,
                MinimumBid = 86390,
                EndDate = DateTime.UtcNow.AddHours(3).ToString("O")
            }
        ];
    }
}
