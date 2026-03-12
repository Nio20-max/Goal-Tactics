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
    public async Task<TransferSearchResponse> SearchAsync(string userId, TransferSearchRequest request, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var players = BuildTransferPlayers()
            .Where(player => request.MinimumBid is null || player.Bid >= request.MinimumBid)
            .Where(player => request.Strength is null || player.Strength >= request.Strength)
            .Where(player => request.Talent is null ||
                ((request.Talent.Min is null || player.Talent >= request.Talent.Min) &&
                 (request.Talent.Max is null || player.Talent <= request.Talent.Max)))
            .Where(player => request.OnlyKeeper is not true || player.Position == 0)
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
                AuctionId = Guid.Parse("81700e20-7f5b-417e-b3a9-10c4aef8d2c1"),
                Name = "Calvin Johnston",
                Country = "ie",
                Head = "01_head-A12",
                Position = 6,
                Strength = 92.5735375175m,
                Talent = 6,
                Age = 24,
                Bid = 103332,
                EndDate = DateTime.UtcNow.AddMinutes(35).ToString("O")
            },
            new TransferPlayerData
            {
                Id = Guid.Parse("de49cc43-12f0-4e01-9c83-0af5f78eb6c3"),
                AuctionId = Guid.Parse("a82ca2ae-6e92-426e-8b3b-76fa4467b691"),
                Name = "Vyshezor Raizgys",
                Country = "lt",
                Head = "01_head-A08",
                Position = 2,
                Strength = 117.2972567072m,
                Talent = 6,
                Age = 29,
                Bid = 155804,
                EndDate = DateTime.UtcNow.AddMinutes(38).ToString("O")
            },
            new TransferPlayerData
            {
                Id = Guid.Parse("157e6fea-d701-4993-8d31-230641af018b"),
                AuctionId = Guid.Parse("f9e4b338-1d91-40d8-b7ed-ccea5eeb8dd2"),
                Name = "Falkmar Pfalz-sulzbach",
                Country = "de",
                Head = "01_head-C03",
                Position = 4,
                Strength = 93.8022860000m,
                Talent = 8,
                Age = 20,
                Bid = 104904,
                EndDate = DateTime.UtcNow.AddHours(1).ToString("O")
            },
            new TransferPlayerData
            {
                Id = Guid.Parse("4ed4ee16-5c47-4384-bd0b-572cd4aec0e2"),
                AuctionId = Guid.Parse("e1b36faa-feaf-4e78-af99-e5aebbcde1c6"),
                Name = "Jade Morante",
                Country = "es",
                Head = "01_head-A05",
                Position = 6,
                Strength = 66.9142060000m,
                Talent = 7,
                Age = 22,
                Bid = 74552,
                EndDate = DateTime.UtcNow.AddHours(2).ToString("O")
            },
            new TransferPlayerData
            {
                Id = Guid.Parse("093178ec-0864-4913-924f-e71f51544ad9"),
                AuctionId = Guid.Parse("b4e20c31-9e1a-4b7f-8a32-d5f7a6c89012"),
                Name = "Hendrik Haintzl",
                Country = "de",
                Head = "01_head-A14",
                Position = 0,
                Strength = 79.5120000000m,
                Talent = 7,
                Age = 25,
                Bid = 86390,
                EndDate = DateTime.UtcNow.AddHours(3).ToString("O")
            }
        ];
    }
}
