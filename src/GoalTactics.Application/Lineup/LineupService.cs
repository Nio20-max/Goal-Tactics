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
    // Standard position GUIDs used by the client (must match Field.PositionId values used by the app).
    private static readonly Guid PosGK = Guid.Parse("83399C36-8C20-47AB-98B6-B0E1E7BBAE0D");
    private static readonly Guid PosDEF = Guid.Parse("8F16D33A-9A58-4543-B04E-8F97A13A1A9A");
    private static readonly Guid PosMID = Guid.Parse("6A1E9ABF-F86E-4D7F-BDE4-8F17F60E861C");
    private static readonly Guid PosFWD = Guid.Parse("16768A3B-38C8-444A-B2EB-24BACA5C40EA");

    // Field IDs are used by the client to compute each field's absolute position on screen.
    // These GUIDs must match the ones in the app's DropInfo mapping (see MatchSystemFieldData.DropInfo).
    private static readonly Guid[] FieldIds_4_3_3 = new[]
    {
        Guid.Parse("8de71034-69a4-4f1f-a5f5-4274dbfd120d"),
        Guid.Parse("98c41169-d349-4bc1-bb2f-8e595a7c63d6"),
        Guid.Parse("c56e6984-e395-42c1-bb8c-519ba57c2321"),
        Guid.Parse("d60459d4-923e-4fc6-b5c8-edd25c6b914e"),
        Guid.Parse("d4e65be2-6e62-45a4-9444-077ded913231"),
        Guid.Parse("99dbab26-5265-4407-9cc8-aeeab1ddaad7"),
        Guid.Parse("1fdc663f-4922-4514-b564-2d80d6025c1d"),
        Guid.Parse("4e9d680f-a45d-4728-aa23-664299f6e645"),
        Guid.Parse("57b45d92-34b1-45d6-80cd-02ed9756cf2f"),
        Guid.Parse("30cdc69a-ae5f-435c-9d5f-62a62b0a1d94"),
        Guid.Parse("c41a599d-7ec9-408e-91dc-26f193d7d801"),
        // bench slots:
        Guid.Parse("d16c6850-8539-49d4-802f-15db884dc3da"),
        Guid.Parse("a3851e3a-e5a9-4f44-8fd1-58b06911eac3"),
        Guid.Parse("030dd8b8-c6ac-4c08-b54a-e3b2edb00078"),
        Guid.Parse("ab87c376-08ae-4db1-9935-08ace2c6cdb7"),
        Guid.Parse("fb9d6b8a-20e6-4cca-badd-f55d8a321f5a"),
        Guid.Parse("40676fbd-dd08-4fff-baa9-978fe54a37e3"),
    };

    private static readonly Guid[] FieldIds_4_4_2 = new[]
    {
        Guid.Parse("f3bb683a-2098-4627-92a7-8bfeae14629e"),
        Guid.Parse("22be4668-cc33-415c-8204-8296c5ba7e20"),
        Guid.Parse("a5cb9918-28ef-4ae7-a4fc-8b5faddbaaf3"),
        Guid.Parse("804e6fdb-238a-45fb-917a-8d57307aed8b"),
        Guid.Parse("3172b541-a320-4913-8530-beaacd7f6288"),
        Guid.Parse("d9dfe7b8-4a23-41aa-b71a-0ba378e5c75a"),
        Guid.Parse("efd61d32-7de4-48a5-bac2-1c54b733a8d9"),
        Guid.Parse("3b5a3e88-fc2b-4a72-a4bb-ed30e553d767"),
        Guid.Parse("6ff453c9-b859-407f-8089-1a5ddb08020e"),
        Guid.Parse("75e94fb7-40bf-4e96-9dda-2611894997a6"),
        Guid.Parse("8f886238-4f3a-438f-b447-77aac37122dd"),
        // bench slots:
        Guid.Parse("1f4064ce-cf53-40a8-bf1d-730b6940e200"),
        Guid.Parse("f56dc7ee-8d5f-471c-b36e-ea8bcac33f46"),
        Guid.Parse("31f630be-f233-4b6d-a86e-92b3c85013d4"),
        Guid.Parse("ea3b222b-3b40-4f1c-8b81-bdb6b4ce6610"),
        Guid.Parse("fb83bf5f-c328-4126-b7c3-d6f76576ff5a"),
        Guid.Parse("2ac4d94f-c729-482e-95f2-98891acd6801"),
    };

    private static readonly Guid[] FieldIds_4_5_1 = new[]
    {
        Guid.Parse("4ed2bc44-5a04-4b1f-bead-69c3772e01ba"),
        Guid.Parse("00379f06-264b-4280-a499-bbfd0e7b782b"),
        Guid.Parse("c010adb2-dfdf-413b-ac55-33a67a3ca78f"),
        Guid.Parse("e322a971-4d65-4aa6-ab62-f8a2730af148"),
        Guid.Parse("61e3c1d8-597d-4e16-88cc-cca6bf66b6c2"),
        Guid.Parse("babe1294-6b4a-49fd-bc58-c3d6152095e6"),
        Guid.Parse("a1a5eb5b-c579-4ba9-8f91-36065f3fc21c"),
        Guid.Parse("0dbf97a9-2994-4804-af19-d79146763450"),
        Guid.Parse("e6b7a868-eac2-4e32-a153-ed3a4fefb90c"),
        Guid.Parse("fc69c9fc-8ea4-4232-94b5-8965dcc1143c"),
        Guid.Parse("10822890-8ba1-47cf-8c27-f3f4edeeebfb"),
        // bench slots:
        Guid.Parse("0413955f-aba4-4c23-a72e-7997790c0dcd"),
        Guid.Parse("3e474d5a-b5e8-422b-83e8-206fdf561f05"),
        Guid.Parse("f05fe67f-71e0-4a09-9a40-4a34ed4c6134"),
        Guid.Parse("26fecf98-44d8-49dd-85fe-3b2c5f48ed88"),
        Guid.Parse("820737f5-8008-495b-b137-4e833cfb69ce"),
        Guid.Parse("b51ea971-ba1d-4356-b0ae-f0a1e5d60b1f"),
    };

    private static readonly Guid[] FieldIds_3_5_2 = new[]
    {
        Guid.Parse("7bb07f2c-0929-4adf-830a-69484b6396df"),
        Guid.Parse("648f35ab-ea1a-497d-88a6-814c738eafd5"),
        Guid.Parse("9b6e83d9-d1c4-4732-a9b3-a327187a4e2e"),
        Guid.Parse("c6830aba-6d67-4513-8eae-a92adcd6a5d7"),
        Guid.Parse("3e24d922-229e-4c1b-a66d-21ccd328f566"),
        Guid.Parse("0b7db683-e142-425e-8d7a-68c5452a5e50"),
        Guid.Parse("166c7909-733e-4b83-af5a-704f2950e822"),
        Guid.Parse("b78d0b6b-0b5a-468a-b1de-e70d58612bf0"),
        Guid.Parse("30bae146-8d76-4543-b43f-3d6dd1a3b492"),
        Guid.Parse("9bd1535f-7236-4f09-bbd0-7c2395dd998d"),
        Guid.Parse("daf51a98-2aa7-4dde-9665-bc874e1fdd14"),
        // bench slots:
        Guid.Parse("01805f79-253f-4c43-adb0-814f75bafa05"),
        Guid.Parse("e2753e2b-7939-458c-b8b6-38b183006050"),
        Guid.Parse("af917eed-ffdf-410d-8a71-68e5b2cf71bb"),
        Guid.Parse("b2646659-2425-4fa8-973d-45f3e1f89b0a"),
        Guid.Parse("81d16430-089d-4238-a573-9ff8dedab032"),
        Guid.Parse("ba6aec93-5e61-4911-9c2b-f68ff6a424a6"),
    };

    private static readonly Guid[] FieldIds_5_3_2 = new[]
    {
        Guid.Parse("ba6aec93-5e61-4911-9c2b-f68ff6a424a6"),
        Guid.Parse("d9022f1d-245e-48ca-b4d0-2b38238678bd"),
        Guid.Parse("1859d7ab-f953-406c-a679-4ddbe20dfa28"),
        Guid.Parse("5ea2add2-69e2-47a6-97bd-a6b0493ab325"),
        Guid.Parse("b5a54b1d-3930-484b-b61f-b1be61a2f8d2"),
        Guid.Parse("8a0b5f2c-e648-40cf-9cc1-168ffe41e286"),
        Guid.Parse("3caef5fc-1777-426d-a1ef-ab6e50b53c37"),
        Guid.Parse("d9f82a6c-e8bf-4414-b23f-7ee7976cfb85"),
        Guid.Parse("6098add9-b168-48f2-97bb-94655b8db931"),
        Guid.Parse("fc3d07d2-97d3-43d6-b943-1c879205e892"),
        Guid.Parse("5b003a02-039f-4dc6-a2d3-cb80c3bd6078"),
    };

    private static List<MatchSystemFieldData> BuildFieldsFromIds(Guid systemId, Guid[] ids, int gk, int def, int mid, int fwd)
    {
        var list = new List<MatchSystemFieldData>();
        int slot = 0;
        void Add(Guid posId, int count)
        {
            for (int i = 0; i < count; i++)
            {
                list.Add(new MatchSystemFieldData
                {
                    Id = ids[slot],
                    PositionId = posId
                });
                slot++;
            }
        }
        Add(PosGK, gk);
        Add(PosDEF, def);
        Add(PosMID, mid);
        Add(PosFWD, fwd);

        // The client expects bench/substitute slots to be part of the formation fields.
        // If additional GUIDs are included in the array (bench slot IDs), append them as extra fields.
        // We want reserve slots to be labeled with sensible positions (GK/DEF/MID/FWD) so the client
        // uses the correct strength value instead of always showing midfield strength.
        int benchSlots = ids.Length - slot;
        if (benchSlots > 0)
        {
            // Ensure a goalkeeper reserve exists (common expectation for substitution pools).
            // Distribute remaining slots proportionally based on on-field counts.
            int reserveGk = 1;
            int remaining = Math.Max(0, benchSlots - reserveGk);

            int defOnField = def;
            int midOnField = mid;
            int fwdOnField = fwd;
            int totalOnFieldOutfield = defOnField + midOnField + fwdOnField;

            int reserveDef = 0;
            int reserveMid = 0;
            int reserveFwd = 0;

            if (totalOnFieldOutfield > 0 && remaining > 0)
            {
                // Allocate remaining reserves proportional to on-field counts.
                double defShare = defOnField / (double)totalOnFieldOutfield * remaining;
                double midShare = midOnField / (double)totalOnFieldOutfield * remaining;
                double fwdShare = fwdOnField / (double)totalOnFieldOutfield * remaining;

                reserveDef = (int)Math.Floor(defShare);
                reserveMid = (int)Math.Floor(midShare);
                reserveFwd = (int)Math.Floor(fwdShare);

                int allocated = reserveDef + reserveMid + reserveFwd;
                int toAllocate = remaining - allocated;

                // Distribute any leftover slots based on largest fractional remainder.
                var remainders = new[]
                {
                    (pos: PosDEF, remainder: defShare - reserveDef),
                    (pos: PosMID, remainder: midShare - reserveMid),
                    (pos: PosFWD, remainder: fwdShare - reserveFwd)
                }
                .OrderByDescending(x => x.remainder)
                .ToArray();

                int idx = 0;
                while (toAllocate > 0)
                {
                    switch (remainders[idx % remainders.Length].pos)
                    {
                        case var p when p == PosDEF:
                            reserveDef++;
                            break;
                        case var p when p == PosMID:
                            reserveMid++;
                            break;
                        case var p when p == PosFWD:
                            reserveFwd++;
                            break;
                    }
                    idx++;
                    toAllocate--;
                }
            }

            var benchPositions = new List<Guid>();
            benchPositions.AddRange(Enumerable.Repeat(PosGK, reserveGk));
            benchPositions.AddRange(Enumerable.Repeat(PosDEF, reserveDef));
            benchPositions.AddRange(Enumerable.Repeat(PosMID, reserveMid));
            benchPositions.AddRange(Enumerable.Repeat(PosFWD, reserveFwd));

            // If something odd happens, fill remaining with midfielders (safe default).
            while (benchPositions.Count < benchSlots)
            {
                benchPositions.Add(PosMID);
            }

            // Assign bench slots in order using the computed position distribution.
            int benchIndex = 0;
            while (slot < ids.Length)
            {
                list.Add(new MatchSystemFieldData
                {
                    Id = ids[slot],
                    PositionId = benchPositions[benchIndex++]
                });
                slot++;
            }
        }

        return list;
    }

    private static readonly MatchSystemData[] DefaultSystems =
    [
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000001"), Name = "4-4-2",
                Fields = BuildFieldsFromIds(Guid.Parse("00000001-0000-0000-0000-000000000001"), FieldIds_4_4_2, 1, 4, 4, 2) },
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000002"), Name = "4-3-3",
                Fields = BuildFieldsFromIds(Guid.Parse("00000001-0000-0000-0000-000000000002"), FieldIds_4_3_3, 1, 4, 3, 3) },
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000003"), Name = "3-5-2",
                Fields = BuildFieldsFromIds(Guid.Parse("00000001-0000-0000-0000-000000000003"), FieldIds_3_5_2, 1, 3, 5, 2) },
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000004"), Name = "4-5-1",
                Fields = BuildFieldsFromIds(Guid.Parse("00000001-0000-0000-0000-000000000004"), FieldIds_4_5_1, 1, 4, 5, 1) },
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000005"), Name = "5-3-2",
                Fields = BuildFieldsFromIds(Guid.Parse("00000001-0000-0000-0000-000000000005"), FieldIds_5_3_2, 1, 5, 3, 2) },
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000006"), Name = "3-4-3",
                Fields = BuildFieldsFromIds(Guid.Parse("00000001-0000-0000-0000-000000000006"), FieldIds_4_3_3, 1, 3, 4, 3) },
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
        "DEF" => 2,
        "MID" => 4,
        "FWD" => 6,
        _ => 4
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
                MyTeam = isHome ? 0 : 1,
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
                Players = DefaultSystems[0].Fields.Select((field, i) => new FormationPlayer
                {
                    PlayerID = i < squad.Count ? squad[i].Id : Guid.Empty,
                    MatchSystemFieldID = field.Id,
                    MatchStandardPositionID = new List<Guid>(),
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

    public async Task SaveLineupAsync(string userId, SaveLineupRequest request, CancellationToken cancellationToken = default)
    {
        var teamInfo = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        // Validate the players belong to this team
        var squad = await teamStore.GetSquadPlayersAsync(userId, cancellationToken);
        var squadIds = squad.Select(p => p.Id).ToHashSet();

        // The Xamarin client sends the lineup in FormationData.Players. Older clients may send just PlayerIds.
        var selectedIds = request.FormationData?.Players?.Select(p => p.PlayerID).Where(id => id != Guid.Empty).ToList()
            ?? request.PlayerIds.Where(id => id != Guid.Empty).ToList();

        foreach (var pid in selectedIds)
        {
            if (!squadIds.Contains(pid))
            {
                throw new InvalidOperationException($"Player {pid} not found in squad.");
            }
        }

        // Persist the lineup by reordering shirt numbers.
        // The ScheduledMatchResolutionJob and GetSquadPlayersAsync both use
        // shirt-number ordering, so starters (positions 1-11) come first.
        // Non-selected players retain their original shirt numbers shifted to 12+.
        var nonSelected = squad
            .Where(p => !selectedIds.Contains(p.Id))
            .Select(p => p.Id)
            .ToList();

        for (int i = 0; i < selectedIds.Count; i++)
        {
            await teamStore.UpdatePlayerShirtAsync(userId, selectedIds[i], i + 1, cancellationToken);
        }

        for (int i = 0; i < nonSelected.Count; i++)
        {
            await teamStore.UpdatePlayerShirtAsync(userId, nonSelected[i], selectedIds.Count + i + 1, cancellationToken);
        }
    }

    private static MatchLineupPlayerData MapLineupPlayer(SquadPlayerRecord x)
    {
        var posInt = PositionToInt(x.Position);
        return new MatchLineupPlayerData
        {
            Id = x.Id,
            Name = x.Name,
            Country = LegacyAppCompatibility.NormalizeCountryCode(x.Origin),
            Head = x.Head,
            Strength = x.Strength,
            Talent = x.Talent,
            Age = x.Age,
            Position = LegacyAppCompatibility.MapPositionCode(x.Position),
            EndDate = x.ContractEndUtc?.ToString("O"),
            Experience = LegacyAppCompatibility.BuildExperience(x.Strength, x.Age, x.Matches),
            Fitness = (int)x.Fitness,
            Body = x.Body,
            Gloves = x.Gloves,
            Shoes = x.Shoes,
            Salary = Math.Max(1_000m, x.Strength * x.Strength / 4m),
            MarketValue = x.MarketValue,
            Origin = x.Origin,
            Skills = x.Skills,
            MainSkill = LegacyAppCompatibility.MainSkillIndex(x.Position),
            BonusSkills = LegacyAppCompatibility.BuildBonusSkills(x.Position),
            YellowCards = x.YellowCards,
            HasRedCard = x.RedCards > 0,
            Injured = 0,
            IsForSale = false,
            SellPrice = x.MarketValue,
            TransfermarketFee = Math.Max(1_000m, x.Strength * 14m),
            TransfermarketMaxOffer = Math.Max(10_000m, x.MarketValue * 1.1m),
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
            }).ToList(),
            Positions = new List<PositionStrengthById>
            {
                new() { PositionId = PosGK, Strength = posInt == 0 ? x.Strength : Math.Max(10m, x.Strength * 0.6m) },
                new() { PositionId = PosDEF, Strength = posInt == 2 ? x.Strength : Math.Max(10m, x.Strength * 0.6m) },
                new() { PositionId = PosMID, Strength = posInt == 4 ? x.Strength : Math.Max(10m, x.Strength * 0.6m) },
                new() { PositionId = PosFWD, Strength = posInt == 6 ? x.Strength : Math.Max(10m, x.Strength * 0.6m) }
            }
        };
    }
}
