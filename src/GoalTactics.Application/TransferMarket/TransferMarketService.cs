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
            .Where(player => request.OnlyKeeper is not true || player.Position == 0)
            .Where(player => request.Talent?.Min is null || player.Talent >= request.Talent.Min)
            .Where(player => request.Talent?.Max is null || player.Talent <= request.Talent.Max)
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
        var player = search.Players.FirstOrDefault(candidate => candidate.AuctionId == id || candidate.ID == id)
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
                AuctionId = Guid.Parse("81700e20-7f5b-417e-b3a9-10c4aef8d2c1"),
                Bid = 103332,
                ID = Guid.Parse("9c912da7-372e-41de-a7f2-830196e4ead3"),
                Name = "Calvin Johnston",
                Country = "ie",
                Head = "01_head-A12",
                Strength = 92.5735375175m,
                Talent = 6,
                Age = 24,
                Position = 6,
                EndDate = DateTime.UtcNow.AddMinutes(35).ToString("O")
            },
            new TransferPlayerData
            {
                AuctionId = Guid.Parse("a82ca2ae-6e92-426e-8b3b-76fa4467b691"),
                Bid = 155804,
                ID = Guid.Parse("de49cc43-12f0-4e01-9c83-0af5f78eb6c3"),
                Name = "Vyshezor Raizgys",
                Country = "lt",
                Head = "01_head-A08",
                Strength = 117.2972567072m,
                Talent = 6,
                Age = 29,
                Position = 2,
                EndDate = DateTime.UtcNow.AddMinutes(38).ToString("O")
            },
            new TransferPlayerData
            {
                AuctionId = Guid.Parse("f9e4b338-1d91-40d8-b7ed-ccea5eeb8dd2"),
                Bid = 104904,
                ID = Guid.Parse("157e6fea-d701-4993-8d31-230641af018b"),
                Name = "Falkmar Pfalz-sulzbach",
                Country = "de",
                Head = "01_head-C03",
                Strength = 93.802286m,
                Talent = 8,
                Age = 20,
                Position = 4,
                EndDate = DateTime.UtcNow.AddHours(1).ToString("O")
            },
            new TransferPlayerData
            {
                AuctionId = Guid.Parse("e1b36faa-feaf-4e78-af99-e5aebbcde1c6"),
                Bid = 74552,
                ID = Guid.Parse("4ed4ee16-5c47-4384-bd0b-572cd4aec0e2"),
                Name = "Jade Morante",
                Country = "ec",
                Head = "01_head-A02",
                Strength = 66.9428375657m,
                Talent = 8,
                Age = 29,
                Position = 5,
                EndDate = DateTime.UtcNow.AddHours(2).ToString("O")
            },
            new TransferPlayerData
            {
                AuctionId = Guid.Parse("127d3ebb-1bea-4382-904c-ad6cf138ff03"),
                Bid = 86390,
                ID = Guid.Parse("093178ec-0864-4913-924f-e71f51544ad9"),
                Name = "Hendrik Haintzl",
                Country = "at",
                Head = LegacyAppCompatibility.BuildHeadId(Guid.Parse("093178ec-0864-4913-924f-e71f51544ad9")),
                Strength = 80.377409m,
                Talent = 6,
                Age = 19,
                Position = 0,
                EndDate = DateTime.UtcNow.AddHours(3).ToString("O")
            }
        ];
    }
}
