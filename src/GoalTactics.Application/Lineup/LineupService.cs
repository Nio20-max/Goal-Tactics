using GoalTactics.Application.Common;
using GoalTactics.Application.Friends;
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

public sealed class LineupService(ILeagueStore leagueStore, ITeamStore teamStore, IFriendsStore friendsStore) : ILineupService
{
    // Legacy client expects the field IDs to match the IDs used by its DropInfo mapping.
    // Those IDs are hard-coded in the legacy app (MatchSystemFieldData.DropInfo).
    // We also use the same position GUIDs the legacy client uses for Keeper/Defender/Midfielder/Striker.
    private static readonly Guid PosGK = Guid.Parse("83399C36-8C20-47AB-98B6-B0E1E7BBAE0D");
    private static readonly Guid PosDEF = Guid.Parse("8F16D33A-9A58-4543-B04E-8F97A13A1A9A");
    private static readonly Guid PosMID = Guid.Parse("6A1E9ABF-F86E-4D7F-BDE4-8F17F60E861C");
    private static readonly Guid PosFWD = Guid.Parse("16768A3B-38C8-444A-B2EB-24BACA5C40EA");

    private static readonly Guid PosGKBench = Guid.Parse("129E887F-34E7-463B-927D-E9D5F700268A");
    private static readonly Guid PosDEFBench = Guid.Parse("0E597E34-4306-4781-8D6B-CA1A86C43297");
    private static readonly Guid PosMIDBench = Guid.Parse("A4A57989-80AC-419B-833B-B5931A786914");
    private static readonly Guid PosFWDBench = Guid.Parse("0A6A764B-F092-4DCA-A67A-805576DBBDC2");

    // These are the exact field IDs used by the legacy client for each formation layout.
    private static readonly Guid[] FieldIds_4_4_2 = new Guid[] {
        Guid.Parse("8de71034-69a4-4f1f-a5f5-4274dbfd120d"), // idx 0
        Guid.Parse("98c41169-d349-4bc1-bb2f-8e595a7c63d6"), // idx 1
        Guid.Parse("c56e6984-e395-42c1-bb8c-519ba57c2321"), // idx 2
        Guid.Parse("d60459d4-923e-4fc6-b5c8-edd25c6b914e"), // idx 3
        Guid.Parse("d4e65be2-6e62-45a4-9444-077ded913231"), // idx 4
        Guid.Parse("99dbab26-5265-4407-9cc8-aeeab1ddaad7"), // idx 5
        Guid.Parse("1fdc663f-4922-4514-b564-2d80d6025c1d"), // idx 6
        Guid.Parse("4e9d680f-a45d-4728-aa23-664299f6e645"), // idx 7
        Guid.Parse("57b45d92-34b1-45d6-80cd-02ed9756cf2f"), // idx 8
        Guid.Parse("30cdc69a-ae5f-435c-9d5f-62a62b0a1d94"), // idx 9
        Guid.Parse("c41a599d-7ec9-408e-91dc-26f193d7d801"), // idx 10
        Guid.Parse("d16c6850-8539-49d4-802f-15db884dc3da"), // idx 11 (bench)
        Guid.Parse("a3851e3a-e5a9-4f44-8fd1-58b06911eac3"), // idx 12 (bench)
        Guid.Parse("030dd8b8-c6ac-4c08-b54a-e3b2edb00078"), // idx 13 (bench)
        Guid.Parse("ab87c376-08ae-4db1-9935-08ace2c6cdb7"), // idx 14 (bench)
        Guid.Parse("fb9d6b8a-20e6-4cca-badd-f55d8a321f5a"), // idx 15 (bench)
        Guid.Parse("40676fbd-dd08-4fff-baa9-978fe54a37e3")  // idx 16 (bench)
    };

    private static readonly Guid[] FieldIds_4_3_3 = new Guid[] {
        Guid.Parse("f3bb683a-2098-4627-92a7-8bfeae14629e"), // idx 0
        Guid.Parse("22be4668-cc33-415c-8204-8296c5ba7e20"), // idx 1
        Guid.Parse("a5cb9918-28ef-4ae7-a4fc-8b5faddbaaf3"), // idx 2
        Guid.Parse("804e6fdb-238a-45fb-917a-8d57307aed8b"), // idx 3
        Guid.Parse("3172b541-a320-4913-8530-beaacd7f6288"), // idx 4
        Guid.Parse("d9dfe7b8-4a23-41aa-b71a-0ba378e5c75a"), // idx 5
        Guid.Parse("efd61d32-7de4-48a5-bac2-1c54b733a8d9"), // idx 6
        Guid.Parse("3b5a3e88-fc2b-4a72-a4bb-ed30e553d767"), // idx 7
        Guid.Parse("6ff453c9-b859-407f-8089-1a5ddb08020e"), // idx 8
        Guid.Parse("75e94fb7-40bf-4e96-9dda-2611894997a6"), // idx 9
        Guid.Parse("8f886238-4f3a-438f-b447-77aac37122dd"), // idx 10
        Guid.Parse("1f4064ce-cf53-40a8-bf1d-730b6940e200"), // idx 11 (bench)
        Guid.Parse("f56dc7ee-8d5f-471c-b36e-ea8bcac33f46"), // idx 12 (bench)
        Guid.Parse("31f630be-f233-4f6d-a86e-92b3c85013d4"), // idx 13 (bench)
        Guid.Parse("ea3b222b-3b40-4f1c-8b81-bdb6b4ce6610"), // idx 14 (bench)
        Guid.Parse("fb83bf5f-c328-4126-b7c3-d6f76576ff5a"), // idx 15 (bench)
        Guid.Parse("2ac4d94f-c729-482e-95f2-98891acd6801")  // idx 16 (bench)
    };

    private static readonly Guid[] FieldIds_3_5_2 = new Guid[] {
        Guid.Parse("4ed2bc44-5a04-4b1f-bead-69c3772e01ba"), // idx 0
        Guid.Parse("00379f06-264b-4280-a499-bbfd0e7b782b"), // idx 1
        Guid.Parse("c010adb2-dfdf-413b-ac55-33a67a3ca78f"), // idx 2
        Guid.Parse("e322a971-4d65-4aa6-ab62-f8a2730af148"), // idx 3
        Guid.Parse("61e3c1d8-597d-4e16-88cc-cca6bf66b6c2"), // idx 4
        Guid.Parse("babe1294-6b4a-49fd-bc58-c3d6152095e6"), // idx 5
        Guid.Parse("a1a5eb5b-c579-4ba9-8f91-36065f3fc21c"), // idx 6
        Guid.Parse("0dbf97a9-2994-4804-af19-d79146763450"), // idx 7
        Guid.Parse("e6b7a868-eac2-4e32-a153-ed3a4fefb90c"), // idx 8
        Guid.Parse("fc69c9fc-8ea4-4232-94b5-8965dcc1143c"), // idx 9
        Guid.Parse("10822890-8ba1-47cf-8c27-f3f4edeeebfb"), // idx 10
        Guid.Parse("4dec2146-a7de-4d18-bc94-ca0353548121"), // idx 11 (bench)
        Guid.Parse("333da35b-d8a0-4eac-a477-63664bfdc47d"), // idx 12 (bench)
        Guid.Parse("7cf6be21-5c82-44b8-9473-b69d53365235"), // idx 13 (bench)
        Guid.Parse("7a5cb113-012d-429c-86fe-1086b0499e04"), // idx 14 (bench)
        Guid.Parse("50c1e326-b8a4-4a82-8211-7bed071de767"), // idx 15 (bench)
        Guid.Parse("b27584c8-d4ec-4be3-ac20-9c3947547e6c")  // idx 16 (bench)
    };

    private static readonly Guid[] FieldIds_4_5_1 = new Guid[] {
        Guid.Parse("7bb07f2c-0929-4adf-830a-69484b6396df"), // idx 0
        Guid.Parse("648f35ab-ea1a-497d-88a6-814c738eafd5"), // idx 1
        Guid.Parse("9b6e83d9-d1c4-4732-a9b3-a327187a4e2e"), // idx 2
        Guid.Parse("c6830aba-6d67-4513-8eae-a92adcd6a5d7"), // idx 3
        Guid.Parse("3e24d922-229e-4c1b-a66d-21ccd328f566"), // idx 4
        Guid.Parse("0b7db683-e142-425e-8d7a-68c5452a5e50"), // idx 5
        Guid.Parse("166c7909-733e-4b83-af5a-704f2950e822"), // idx 6
        Guid.Parse("b78d0b6b-0b5a-468a-b1de-e70d58612bf0"), // idx 7
        Guid.Parse("30bae146-8d76-4543-b43f-3d6dd1a3b492"), // idx 8
        Guid.Parse("9bd1535f-7236-4f09-bbd0-7c2395dd998d"), // idx 9
        Guid.Parse("daf51a98-2aa7-4dde-9665-bc874e1fdd14"), // idx 10
        Guid.Parse("aa74f80a-fd79-4e37-9fb7-bf8f86b2d204"), // idx 11 (bench)
        Guid.Parse("01805f79-253f-4c43-adb0-814f75bafa05"), // idx 12 (bench)
        Guid.Parse("e2753e2b-7939-458c-b8b6-38b183006050"), // idx 13 (bench)
        Guid.Parse("af917eed-ffdf-410d-8a71-68e5b2cf71bb"), // idx 14 (bench)
        Guid.Parse("b2646659-2425-4fa8-973d-45f3e1f89b0a"), // idx 15 (bench)
        Guid.Parse("81d16430-089d-4238-a573-9ff8dedab032")  // idx 16 (bench)
    };

    private static readonly Guid[] FieldIds_5_3_2 = new Guid[] {
        Guid.Parse("ba6aec93-5e61-4911-9c2b-f68ff6a424a6"), // idx 0
        Guid.Parse("d9022f1d-245e-48ca-b4d0-2b38238678bd"), // idx 1
        Guid.Parse("1859d7ab-f953-406c-a679-4ddbe20dfa28"), // idx 2
        Guid.Parse("5ea2add2-69e2-47a6-97bd-a6b0493ab325"), // idx 3
        Guid.Parse("b5a54b1d-3930-484b-b61f-b1be61a2f8d2"), // idx 4
        Guid.Parse("8a0b5f2c-e648-40cf-9cc1-168ffe41e286"), // idx 5
        Guid.Parse("3caef5fc-1777-426d-a1ef-ab6e50b53c37"), // idx 6
        Guid.Parse("d9f82a6c-e8bf-4414-b23f-7ee7976cfb85"), // idx 7
        Guid.Parse("6098add9-b168-48f2-97bb-94655b8db931"), // idx 8
        Guid.Parse("fc3d07d2-97d3-43d6-b943-1c879205e892"), // idx 9
        Guid.Parse("5b003a02-039f-4dc6-a2d3-cb80c3bd6078"), // idx 10
        Guid.Parse("0413955f-aba4-4c23-a72e-7997790c0dcd"), // idx 11 (bench)
        Guid.Parse("3e474d5a-b5e8-422b-83e8-206fdf561f05"), // idx 12 (bench)
        Guid.Parse("f05fe67f-71e0-4a09-9a40-4a34ed4c6134"), // idx 13 (bench)
        Guid.Parse("26fecf98-44d8-49dd-85fe-3b2c5f48ed88"), // idx 14 (bench)
        Guid.Parse("820737f5-8008-495b-b137-4e833cfb69ce"), // idx 15 (bench)
        Guid.Parse("b51ea971-ba1d-4356-b0ae-f0a1e5d60b1f")  // idx 16 (bench)
    };

    // We don’t have a distinct field ID set for 3-4-3, so reuse the 4-3-3 layout.
    private static readonly Guid[] FieldIds_3_4_3 = FieldIds_4_3_3;

    private static List<MatchSystemFieldData> BuildFieldsFromIds(
        Guid[] ids,
        int gk,
        int def,
        int mid,
        int fwd)
    {
        var list = new List<MatchSystemFieldData>();
        int slot = 0;

        for (int i = 0; i < gk && slot < ids.Length; i++, slot++)
        {
            list.Add(new MatchSystemFieldData { Id = ids[slot], PositionId = PosGK });
        }

        for (int i = 0; i < def && slot < ids.Length; i++, slot++)
        {
            list.Add(new MatchSystemFieldData { Id = ids[slot], PositionId = PosDEF });
        }

        for (int i = 0; i < mid && slot < ids.Length; i++, slot++)
        {
            list.Add(new MatchSystemFieldData { Id = ids[slot], PositionId = PosMID });
        }

        for (int i = 0; i < fwd && slot < ids.Length; i++, slot++)
        {
            list.Add(new MatchSystemFieldData { Id = ids[slot], PositionId = PosFWD });
        }

        // Remaining slots are bench positions; assign them in a predictable way.
        while (slot < ids.Length)
        {
            var positionId = slot switch
            {
                11 => PosGKBench,
                12 => PosDEFBench,
                13 => PosDEFBench,
                14 => PosMIDBench,
                15 => PosFWDBench,
                16 => PosFWDBench,
                _ => PosDEFBench
            };
            list.Add(new MatchSystemFieldData { Id = ids[slot], PositionId = positionId });
            slot++;
        }

        return list;
    }

    private static readonly MatchSystemData[] DefaultSystems =
    [
        // NOTE: The formation names must match the client's expected dropdown labels,
        //       but the field ID sets (positions) must match the actual layouts the client draws.
        //       The mappings below are chosen so each formation name uses the GUID set
        //       that corresponds to the matching DropInfo layout.
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000001"), Name = "4-4-2",
            Fields = BuildFieldsFromIds(FieldIds_4_4_2, 1, 4, 4, 2) },
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000002"), Name = "4-3-3",
            Fields = BuildFieldsFromIds(FieldIds_4_3_3, 1, 4, 3, 3) },
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000003"), Name = "3-5-2",
            Fields = BuildFieldsFromIds(FieldIds_3_5_2, 1, 3, 5, 2) },
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000004"), Name = "4-5-1",
            Fields = BuildFieldsFromIds(FieldIds_4_5_1, 1, 4, 5, 1) },
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000005"), Name = "5-3-2",
            Fields = BuildFieldsFromIds(FieldIds_5_3_2, 1, 5, 3, 2) },
        new() { Id = Guid.Parse("00000001-0000-0000-0000-000000000006"), Name = "3-4-3",
            Fields = BuildFieldsFromIds(FieldIds_3_4_3, 1, 3, 4, 3) },
    ];

    private static readonly TacticData[] DefaultTactics =
    [
        new() { ID = Guid.Parse("00000002-0000-0000-0000-000000000001"), Name = "Balanced", Value = 0 },
        new() { ID = Guid.Parse("00000002-0000-0000-0000-000000000002"), Name = "Offensive", Value = 1 },
        new() { ID = Guid.Parse("00000002-0000-0000-0000-000000000003"), Name = "Defensive", Value = 2 },
        new() { ID = Guid.Parse("00000002-0000-0000-0000-000000000004"), Name = "Counter", Value = 3 },
    ];

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
                IsLeagueMatch = true,
                HomeTrikot = null,
                AwayTrikot = null
            };
        }).ToList();

        // Add friendly matches so they also appear in the lineup list.
        var challenges = await friendsStore.GetChallengesAsync(userId, cancellationToken);
        foreach (var challenge in challenges.Challenges)
        {
            // Client uses MyTeam==1 for home, 2 for away in the friend list API.
            // The lineup UI expects 0 for home and 1 for away.
            var isHome = challenge.MyTeam == 1;
            var homeName = isHome ? teamInfo.Name : challenge.OpponentName;
            var awayName = isHome ? challenge.OpponentName : teamInfo.Name;

            // Map opponent team id (used by partner code paths to reference the other team).
            var opponentTeamId = Guid.TryParse(challenge.OpponentTeamId, out var parsedOpponentTeamId)
                ? parsedOpponentTeamId
                : Guid.Empty;

            TeamRecord? opponentTeamInfo = null;
            if (opponentTeamId != Guid.Empty)
            {
                opponentTeamInfo = await teamStore.GetTeamByIdAsync(opponentTeamId.ToString(), cancellationToken);
            }

            Guid matchId = Guid.TryParse(challenge.Id, out var parsedMatchId) ? parsedMatchId : Guid.Empty;

            lineups.Add(new LineupSummaryData
            {
                MatchId = matchId,
                Opponent = challenge.OpponentName,
                IsLocked = false,
                Id = matchId,
                Date = challenge.MatchDateUtc.ToString("O"),
                HomeLogo = "wappen01",
                AwayLogo = "wappen01",
                HomeName = homeName,
                AwayName = awayName,
                MyTeam = isHome ? 0 : 1,
                HomeCountry = isHome ? teamInfo.Country.ToLowerInvariant() : opponentTeamInfo?.Country?.ToLowerInvariant() ?? "de",
                AwayCountry = isHome ? opponentTeamInfo?.Country?.ToLowerInvariant() ?? "de" : teamInfo.Country.ToLowerInvariant(),
                HomeScore = -1,
                AwayScore = -1,
                OpponentTeamId = opponentTeamId,
                HomeStrength = isHome ? teamInfo.Strength : opponentTeamInfo?.Strength ?? 0,
                AwayStrength = isHome ? opponentTeamInfo?.Strength ?? 0 : teamInfo.Strength,
                HasLineup = false,
                IsFriendly = true,
                IsLeagueMatch = false,
                HomeTrikot = null,
                AwayTrikot = null
            });
        }

        // Order by date so friendly matches appear in chronological order with league matches.
        var ordered = lineups.OrderBy(x => DateTime.TryParse(x.Date, out var d) ? d : DateTime.MaxValue).ToArray();
        return new LineupsResponse { Success = true, Lineups = ordered };
    }

    public async Task<MatchLineupResponse> GetMatchLineupAsync(string userId, Guid matchId, CancellationToken cancellationToken = default)
    {
        var teamInfo = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);

        var squad = await teamStore.GetSquadPlayersAsync(userId, cancellationToken);

        // Legacy lineup UI expects the first 11 players to represent the starting 4-3-3 lineup.
        // If the current shirt-number ordering does not already represent a valid 4-3-3 lineup,
        // build a default lineup based on position and strength to prevent rotated/misplaced players.
        var orderedSquad = EnsureStartingLineupOrdering(squad, gk: 1, def: 4, mid: 3, fwd: 3);
        var players = orderedSquad.Select(MapLineupPlayer).ToList();

        var defaultSystem = DefaultSystems.FirstOrDefault(s => s.Name == "4-3-3") ?? DefaultSystems[0];

        return new MatchLineupResponse
        {
            Success = true,
            IsLocked = false,
            // Legacy clients expect all available formation systems.
            Systems = DefaultSystems,
            Tactics = DefaultTactics,
            Players = players,
            FormationData = new MatchFormationData
            {
                MatchSystemID = defaultSystem.Id,
                MatchTacticID = DefaultTactics[0].ID,
                Players = defaultSystem.Fields.Select((field, i) => new FormationPlayer
                {
                    PlayerID = i < orderedSquad.Count ? orderedSquad[i].Id : Guid.Empty,
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
        // If FormationData is present but contains no valid player IDs, fall back to the legacy PlayerIds field.
            // The client sends players in the order of formation slots, so we must honor the MatchSystemFieldID mapping
            // (rather than trusting the order in the array) to correctly assign shirt numbers for 4-3-3.
            var selectedIdsFromFormation = request.FormationData?.Players?.Where(p => p.PlayerID != Guid.Empty).ToList();
            List<Guid> selectedIds;
            if (selectedIdsFromFormation != null && selectedIdsFromFormation.Any())
            {
                var systemId = request.FormationData?.MatchSystemID ?? DefaultSystems.First(s => s.Name == "4-3-3").Id;
                var system = DefaultSystems.FirstOrDefault(s => s.Id == systemId) ?? DefaultSystems.First();
                var fieldIndexById = system.Fields
                    .Select((field, index) => (field.Id, index))
                    .ToDictionary(x => x.Id, x => x.index);

                selectedIds = selectedIdsFromFormation
                    .Select(p => (p.PlayerID, FieldIndex: fieldIndexById.TryGetValue(p.MatchSystemFieldID, out var idx) ? idx : int.MaxValue))
                    .OrderBy(x => x.FieldIndex)
                    .ThenBy(x => x.PlayerID)
                    .Select(x => x.PlayerID)
                    .ToList();

                // If the client sent player IDs but no mapping info, fall back to positional order.
                if (!selectedIds.Any())
                {
                    selectedIds = selectedIdsFromFormation.Select(p => p.PlayerID).ToList();
                }
            }
            else
            {
                selectedIds = request.PlayerIds.Where(id => id != Guid.Empty).ToList();
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

    private static IReadOnlyList<SquadPlayerRecord> EnsureStartingLineupOrdering(
        IReadOnlyList<SquadPlayerRecord> squad,
        int gk,
        int def,
        int mid,
        int fwd)
    {
        if (squad is null || squad.Count == 0)
        {
            return squad;
        }

        // Teams store shirt numbers in the database. Legacy clients expect the first 11 players
        // in the API response to correspond to the starting lineup in the current formation.
        // If the current ordering does not already represent a valid 4-3-3 starting lineup,
        // build a best-effort lineup based on position and strength.
        var orderedByShirt = squad.OrderBy(p => p.ShirtNumber).ToList();
        if (IsValidStartingLineup(orderedByShirt, gk, def, mid, fwd))
        {
            return orderedByShirt;
        }

        return BuildDefaultStartingLineup(orderedByShirt, gk, def, mid, fwd);
    }

    private static bool IsValidStartingLineup(IReadOnlyList<SquadPlayerRecord> ordered, int gk, int def, int mid, int fwd)
    {
        var required = gk + def + mid + fwd;
        if (ordered.Count < required)
        {
            return false;
        }

        var first11 = ordered.Take(required).ToList();
        var counts = first11
            .GroupBy(p => p.Position ?? string.Empty)
            .ToDictionary(g => g.Key, g => g.Count());

        return counts.GetValueOrDefault("GK") == gk
            && counts.GetValueOrDefault("DEF") == def
            && counts.GetValueOrDefault("MID") == mid
            && counts.GetValueOrDefault("FWD") == fwd;
    }

    private static IReadOnlyList<SquadPlayerRecord> BuildDefaultStartingLineup(
        IReadOnlyList<SquadPlayerRecord> squad,
        int gk,
        int def,
        int mid,
        int fwd)
    {
        static IEnumerable<SquadPlayerRecord> Best(IEnumerable<SquadPlayerRecord> players)
            => players.OrderByDescending(p => p.Strength).ThenBy(p => p.ShirtNumber);

        var selected = new List<SquadPlayerRecord>();
        selected.AddRange(Best(squad.Where(p => p.Position == "GK")).Take(gk));
        selected.AddRange(Best(squad.Where(p => p.Position == "DEF")).Take(def));
        selected.AddRange(Best(squad.Where(p => p.Position == "MID")).Take(mid));
        selected.AddRange(Best(squad.Where(p => p.Position == "FWD")).Take(fwd));

        var remaining = Best(squad.Except(selected)).ToList();
        var targetCount = gk + def + mid + fwd;
        while (selected.Count < targetCount && remaining.Any())
        {
            selected.Add(remaining[0]);
            remaining.RemoveAt(0);
        }

        selected.AddRange(remaining);
        return selected;
    }

    private static MatchLineupPlayerData MapLineupPlayer(SquadPlayerRecord x)
    {
        // Lineup position codes need to match the same legacy transfer-style mapping used across
        // the API: 0=GK, 2=DEF, 4=MID, 6=FWD.
        var posCode = LegacyAppCompatibility.MapLineupPositionCode(x.Position);

        var baseStrength = x.Strength;
        var fallbackStrength = Math.Max(10m, baseStrength * 0.6m);
        var positions = new List<PositionStrengthById>
        {
            new() { PositionId = PosGK, Strength = posCode == 0 ? baseStrength : fallbackStrength },
            new() { PositionId = PosDEF, Strength = posCode == 2 ? baseStrength : fallbackStrength },
            new() { PositionId = PosMID, Strength = posCode == 4 ? baseStrength : fallbackStrength },
            new() { PositionId = PosFWD, Strength = posCode == 6 ? baseStrength : fallbackStrength }
        };

        var positionStrengths = new List<PositionStrength>
        {
            new() { Position = 0, Strength = posCode == 0 ? baseStrength : fallbackStrength },
            new() { Position = 2, Strength = posCode == 2 ? baseStrength : fallbackStrength },
            new() { Position = 4, Strength = posCode == 4 ? baseStrength : fallbackStrength },
            new() { Position = 6, Strength = posCode == 6 ? baseStrength : fallbackStrength }
        };

        return new MatchLineupPlayerData
        {
            Id = x.Id,
            Name = x.Name,
            Country = LegacyAppCompatibility.NormalizeCountryCode(x.Origin),
            Head = x.Head,
            Strength = x.Strength,
            Talent = x.Talent,
            Age = x.Age,
            Position = posCode,
            EndDate = x.ContractEndUtc?.ToString("O"),
            Experience = x.Experience,
            Fitness = (int)x.Fitness,
            Body = x.Body,
            Gloves = x.Gloves,
            Shoes = x.Shoes,
            Salary = Math.Max(1_000m, x.Strength * x.Strength / 4m),
            MarketValue = x.MarketValue,
            Origin = x.Origin,
            Skills = x.Skills,
            MainSkill = LegacyAppCompatibility.MainSkillIndex(x.Position),
            BonusSkills = LegacyAppCompatibility.BuildRandomBonusSkills(x.Id),
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
            PositionStrengths = positionStrengths,
            Positions = positions
        };
    }
}
