using GoalTactics.Application.Common;
using GoalTactics.Application.League;
using GoalTactics.Application.Team;
using GoalTactics.Contracts.Lineup;
using GoalTactics.Contracts.Squad;

namespace GoalTactics.Application.Lineup;

public interface ILineupService
{
    Task<LineupsResponse> GetLineupsAsync(string userId, CancellationToken cancellationToken = default);

    Task<MatchLineupResponse> GetMatchLineupAsync(string userId, Guid matchId, CancellationToken cancellationToken = default);

    Task SaveLineupAsync(string userId, SaveLineupRequest request, CancellationToken cancellationToken = default);
}

public sealed class LineupService(ILeagueStore leagueStore, ITeamStore teamStore) : ILineupService
{
    // Standard position GUIDs referenced by MatchSystemFieldData.PositionId
    private static readonly Guid PosGK = Guid.Parse("10000001-0000-0000-0000-000000000000");
    private static readonly Guid PosDEF = Guid.Parse("10000002-0000-0000-0000-000000000000");
    private static readonly Guid PosMID = Guid.Parse("10000003-0000-0000-0000-000000000000");
    private static readonly Guid PosFWD = Guid.Parse("10000004-0000-0000-0000-000000000000");

    private static List<MatchSystemFieldData> BuildFields(Guid systemId, int gk, int def, int mid, int fwd)
    {
        var list = new List<MatchSystemFieldData>();
        int slot = 0;
        void Add(Guid posId, int count)
        {
            for (int i = 0; i < count; i++)
            {
                list.Add(new MatchSystemFieldData
                {
                    Id = new Guid(slot, 0, 0, systemId.ToByteArray()[8..]),
                    PositionId = posId
                });
                slot++;
            }
        }
        Add(PosGK, gk);
        Add(PosDEF, def);
        Add(PosMID, mid);
        Add(PosFWD, fwd);
        return list;
    }

    private static readonly MatchSystemData[] DefaultSystems =
    [
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000001"), Name = "4-4-2",
                Fields = BuildFields(Guid.Parse("00000001-0000-0000-0000-000000000001"), 1, 4, 4, 2) },
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000002"), Name = "4-3-3",
                Fields = BuildFields(Guid.Parse("00000001-0000-0000-0000-000000000002"), 1, 4, 3, 3) },
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000003"), Name = "3-5-2",
                Fields = BuildFields(Guid.Parse("00000001-0000-0000-0000-000000000003"), 1, 3, 5, 2) },
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000004"), Name = "4-5-1",
                Fields = BuildFields(Guid.Parse("00000001-0000-0000-0000-000000000004"), 1, 4, 5, 1) },
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000005"), Name = "5-3-2",
                Fields = BuildFields(Guid.Parse("00000001-0000-0000-0000-000000000005"), 1, 5, 3, 2) },
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000006"), Name = "3-4-3",
                Fields = BuildFields(Guid.Parse("00000001-0000-0000-0000-000000000006"), 1, 3, 4, 3) },
    ];

    private static readonly TacticData[] DefaultTactics =
    [
        new() { ID = Guid.Parse("00000002-0000-0000-0000-000000000001"), Name = "Balanced", Value = 0 },
        new() { ID = Guid.Parse("00000002-0000-0000-0000-000000000002"), Name = "Offensive", Value = 1 },
        new() { ID = Guid.Parse("00000002-0000-0000-0000-000000000003"), Name = "Defensive", Value = 2 },
        new() { ID = Guid.Parse("00000002-0000-0000-0000-000000000004"), Name = "Counter", Value = 3 },
    ];

    private static int PositionToInt(string pos) => pos switch
    {
        "GK" => 0,
        "DEF" => 1,
        "MID" => 2,
        "FWD" => 3,
        _ => 2
    };

    public async Task<LineupsResponse> GetLineupsAsync(string userId, CancellationToken cancellationToken = default)
    {
        var teamInfo = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);

        var upcoming = await leagueStore.GetUpcomingMatchesForTeamAsync(teamInfo.TeamId, cancellationToken);

        var lineups = upcoming.Select(m =>
        {
            var isHome = m.HomeTeamId == teamInfo.TeamId;
            var opponent = isHome ? m.AwayName : m.HomeName;
            return new LineupSummaryData
            {
                MatchId = m.Id,
                Opponent = opponent,
                IsLocked = false,
                // BaseMatchData fields for Xamarin client
                Id = m.Id,
                Date = m.ScheduledDateUtc.ToString("O"),
                HomeLogo = m.HomeLogo,
                AwayLogo = m.AwayLogo,
                HomeName = m.HomeName,
                AwayName = m.AwayName,
                MyTeam = isHome ? 1 : 2,
                HomeCountry = m.HomeCountry,
                AwayCountry = m.AwayCountry,
                HomeScore = -1,
                AwayScore = -1,
                OpponentTeamId = Guid.TryParse(isHome ? m.AwayTeamId : m.HomeTeamId, out var oppId) ? oppId : Guid.Empty,
                HomeStrength = -1,
                AwayStrength = -1,
                HasLineup = false,
                IsFriendly = false,
                HomeTrikot = null,
                AwayTrikot = null
            };
        }).ToArray();

        return new LineupsResponse { Success = true, Lineups = lineups };
    }

    public async Task<MatchLineupResponse> GetMatchLineupAsync(string userId, Guid matchId, CancellationToken cancellationToken = default)
    {
        var teamInfo = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);

        var squad = await teamStore.GetSquadPlayersAsync(userId, cancellationToken);
        var players = squad.Select((p, i) => MapLineupPlayer(p)).ToList();

        return new MatchLineupResponse
        {
            Success = true,
            IsLocked = false,
            Systems = DefaultSystems,
            Tactics = DefaultTactics,
            Players = players,
            FormationData = new MatchFormationData
            {
                MatchSystemID = DefaultSystems[0].Id,
                MatchTacticID = DefaultTactics[0].ID,
                Players = squad.Take(11).Select((p, i) => new FormationPlayer
                {
                    PlayerID = p.Id,
                    MatchSystemFieldID = i < DefaultSystems[0].Fields!.Count ? DefaultSystems[0].Fields[i].Id : Guid.Empty,
                    MatchPositionDirectionID = Guid.Empty
                }).ToList()
            },
            HomeShirt = "trikot0",
            CaptainBonus = 1.5m,
            PenaltyBonus = 1.0m,
            CornerBonus = 1.0m,
            FreekickBonus = 1.0m
        };
    }

    public Task SaveLineupAsync(string userId, SaveLineupRequest request, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }

    private static MatchLineupPlayerData MapLineupPlayer(SquadPlayerRecord x)
    {
        var posInt = PositionToInt(x.Position);
        return new MatchLineupPlayerData
        {
            Id = x.Id,
            Name = x.Name,
            Country = LegacyAppCompatibility.NormalizeCountryCode(x.Origin),
            Head = LegacyAppCompatibility.BuildHeadId(x.Id),
            Strength = x.Strength,
            Talent = x.Talent,
            Age = x.Age,
            Position = LegacyAppCompatibility.MapPositionCode(x.Position),
            EndDate = x.ContractEndUtc?.ToString("O"),
            Experience = LegacyAppCompatibility.BuildExperience(x.Strength, x.Age, x.Matches),
            Fitness = (int)x.Fitness,
            Body = LegacyAppCompatibility.BuildBodyId(x.Id),
            Gloves = LegacyAppCompatibility.BuildGlovesId(x.Id, x.Position == "GK"),
            Shoes = LegacyAppCompatibility.BuildShoesId(x.Id),
            Salary = Math.Max(1_000m, x.Strength * x.Strength / 4m),
            MarketValue = Math.Max(25_000m, x.Strength * x.Strength * 10m),
            Origin = x.Origin,
            Skills = LegacyAppCompatibility.BuildSkills(x.Strength, x.Position, x.Talent, x.Age),
            MainSkill = LegacyAppCompatibility.MainSkillIndex(x.Position),
            BonusSkills = LegacyAppCompatibility.BuildBonusSkills(x.Position),
            YellowCards = x.YellowCards,
            HasRedCard = x.RedCards > 0,
            Injured = 0,
            IsForSale = false,
            SellPrice = Math.Max(10_000m, x.Strength * x.Strength),
            TransfermarketFee = Math.Max(1_000m, x.Strength * 14m),
            TransfermarketMaxOffer = Math.Max(10_000m, x.Strength * x.Strength * 11m / 10m),
            TransfermarketMinOffer = Math.Max(1_000m, x.Strength * 14m),
            TransfermarketMaxHours = 48,
            IsUpgraded = false,
            MaxUpgradeStrength = (int)(x.Strength + 25m),
            Shirt = x.ShirtNumber <= 0 ? -1 : x.ShirtNumber,
            CanExtendContract = true,
            HasIndividualTraining = !string.IsNullOrWhiteSpace(x.IndividualTrainingSkill),
            PositionStrengths = Enumerable.Range(0, 4).Select(p => new PositionStrength
            {
                Position = p,
                Strength = p == posInt ? x.Strength : Math.Max(10m, x.Strength * 0.6m)
            }).ToList()
        };
    }
}
