using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Lineup;
using Microsoft.AspNetCore.Mvc.Testing;

namespace GoalTactics.ContractTests.Lineup;

public sealed class LineupControllerTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient client;

    public LineupControllerTests(WebApplicationFactory<Program> factory)
    {
        client = factory.CreateClient();
    }

    [Fact]
    public async Task GetMatchLineup_Returns_Legacy_Field_And_Position_Mapping()
    {
        var token = await RegisterAndLoginAsync();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var lineupsResponse = await client.PostAsJsonAsync("/api/GetLineups", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, lineupsResponse.StatusCode);

        var lineupsBody = await lineupsResponse.Content.ReadFromJsonAsync<LineupsResponse>();
        Assert.NotNull(lineupsBody);
        Assert.True(lineupsBody!.Success);
        Assert.NotEmpty(lineupsBody.Lineups);

        var matchId = lineupsBody.Lineups[0].MatchId != Guid.Empty
            ? lineupsBody.Lineups[0].MatchId
            : lineupsBody.Lineups[0].Id;

        var matchLineupResponse = await client.PostAsJsonAsync("/api/GetMatchLineup", new LineupRequest { MatchId = matchId });
        Assert.Equal(HttpStatusCode.OK, matchLineupResponse.StatusCode);

        var matchLineupBody = await matchLineupResponse.Content.ReadFromJsonAsync<MatchLineupResponse>();
        Assert.NotNull(matchLineupBody);
        Assert.True(matchLineupBody!.Success);
        Assert.NotEmpty(matchLineupBody.Systems);
        Assert.NotEmpty(matchLineupBody.Players);

        // Lineup payload uses the transfer-style position codes: 0=GK, 2=DEF, 4=MID, 6=FWD.
        var allowedPositionCodes = new HashSet<int> { 0, 2, 4, 6 };
        Assert.All(matchLineupBody.Players, p => Assert.Contains(p.Position, allowedPositionCodes));

        // Starting lineup should show a 4-3-3 composition (1 GK, 4 DEF, 3 MID, 3 FWD) in the first 11 players.
        var starters = matchLineupBody.Players.Take(11).ToList();
        Assert.Equal(1, starters.Count(p => p.Position == 0));
        Assert.Equal(4, starters.Count(p => p.Position == 2));
        Assert.Equal(3, starters.Count(p => p.Position == 4));
        Assert.Equal(3, starters.Count(p => p.Position == 6));

        // All returned players should have a non-zero strength.
        Assert.All(matchLineupBody.Players, p => Assert.True(p.Strength > 0));

        // Legacy clients expect per-position strength mappings keyed by position GUID.
        var firstPlayer = matchLineupBody.Players[0];
        Assert.NotNull(firstPlayer.Positions);
        Assert.Equal(4, firstPlayer.Positions!.Count);
        var validPositionIds = new HashSet<Guid>
        {
            Guid.Parse("83399C36-8C20-47AB-98B6-B0E1E7BBAE0D"), // Keeper
            Guid.Parse("8F16D33A-9A58-4543-B04E-8F97A13A1A9A"), // Defender
            Guid.Parse("6A1E9ABF-F86E-4D7F-BDE4-8F17F60E861C"), // Midfielder
            Guid.Parse("16768A3B-38C8-444A-B2EB-24BACA5C40EA")  // Striker
        };
        Assert.All(firstPlayer.Positions!, p => Assert.True(validPositionIds.Contains(p.PositionId)));
        Assert.All(firstPlayer.PositionStrengths!, p => Assert.Contains(p.Position, new[] { 0, 2, 4, 6 }));
        Assert.Equal(firstPlayer.Strength,
            firstPlayer.PositionStrengths!.Single(p => p.Position == firstPlayer.Position).Strength);

        // The formation should include a MatchStandardPositionID collection (may be empty if no special roles are assigned).
        Assert.All(matchLineupBody.FormationData!.Players, p => Assert.NotNull(p.MatchStandardPositionID));

        var system433 = matchLineupBody.Systems.Single(s => s.Name == "4-3-3");
        Assert.Equal(Guid.Parse("00000001-0000-0000-0000-000000000002"), system433.Id);
        Assert.NotNull(system433.Fields);
        Assert.Equal(17, system433.Fields!.Count);

        var expectedFieldIds433 = new[]
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
            Guid.Parse("1f4064ce-cf53-40a8-bf1d-730b6940e200"),
            Guid.Parse("f56dc7ee-8d5f-471c-b36e-ea8bcac33f46"),
            Guid.Parse("31f630be-f233-4f6d-a86e-92b3c85013d4"),
            Guid.Parse("ea3b222b-3b40-4f1c-8b81-bdb6b4ce6610"),
            Guid.Parse("fb83bf5f-c328-4126-b7c3-d6f76576ff5a"),
            Guid.Parse("2ac4d94f-c729-482e-95f2-98891acd6801"),
        };

        Assert.Equal(expectedFieldIds433, system433.Fields.Select(f => f.Id));

        var positions433 = system433.Fields!.Select(f => f.PositionId).ToArray();
        Assert.Equal(Guid.Parse("83399C36-8C20-47AB-98B6-B0E1E7BBAE0D"), positions433[0]);
        Assert.All(positions433.Skip(1).Take(4), p => Assert.Equal(Guid.Parse("8F16D33A-9A58-4543-B04E-8F97A13A1A9A"), p));
        Assert.All(positions433.Skip(5).Take(3), p => Assert.Equal(Guid.Parse("6A1E9ABF-F86E-4D7F-BDE4-8F17F60E861C"), p));
        Assert.All(positions433.Skip(8).Take(3), p => Assert.Equal(Guid.Parse("16768A3B-38C8-444A-B2EB-24BACA5C40EA"), p));

        // Bench slots follow the legacy mapping: 1 GK bench, 2 DEF bench, 1 MID bench, 2 FWD bench.
        Assert.Equal(Guid.Parse("129E887F-34E7-463B-927D-E9D5F700268A"), positions433[11]);
        Assert.Equal(Guid.Parse("0E597E34-4306-4781-8D6B-CA1A86C43297"), positions433[12]);
        Assert.Equal(Guid.Parse("0E597E34-4306-4781-8D6B-CA1A86C43297"), positions433[13]);
        Assert.Equal(Guid.Parse("A4A57989-80AC-419B-833B-B5931A786914"), positions433[14]);
        Assert.Equal(Guid.Parse("0A6A764B-F092-4DCA-A67A-805576DBBDC2"), positions433[15]);
        Assert.Equal(Guid.Parse("0A6A764B-F092-4DCA-A67A-805576DBBDC2"), positions433[16]);
    }

    [Fact]
    public async Task SaveLineup_Updates_StartingEleven_When_FormationIsSaved()
    {
        var token = await RegisterAndLoginAsync();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var lineupsResponse = await client.PostAsJsonAsync("/api/GetLineups", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, lineupsResponse.StatusCode);

        var lineupsBody = await lineupsResponse.Content.ReadFromJsonAsync<LineupsResponse>();
        Assert.NotNull(lineupsBody);
        Assert.True(lineupsBody!.Success);
        Assert.NotEmpty(lineupsBody.Lineups);

        var matchId = lineupsBody.Lineups[0].MatchId != Guid.Empty
            ? lineupsBody.Lineups[0].MatchId
            : lineupsBody.Lineups[0].Id;

        var matchLineupResponse = await client.PostAsJsonAsync("/api/GetMatchLineup", new LineupRequest { MatchId = matchId });
        Assert.Equal(HttpStatusCode.OK, matchLineupResponse.StatusCode);

        var matchLineupBody = await matchLineupResponse.Content.ReadFromJsonAsync<MatchLineupResponse>();
        Assert.NotNull(matchLineupBody);
        Assert.True(matchLineupBody!.Success);
        Assert.NotNull(matchLineupBody.FormationData);
        Assert.NotNull(matchLineupBody.FormationData.Players);
        Assert.Equal(17, matchLineupBody.FormationData.Players.Count);

        // Swap the first two players in the formation and save.
        var originalFormation = matchLineupBody.FormationData.Players;
        var swappedFormation = originalFormation
            .Select(p => new FormationPlayer
            {
                PlayerID = p.PlayerID,
                MatchSystemFieldID = p.MatchSystemFieldID,
                MatchStandardPositionID = p.MatchStandardPositionID,
                MatchPositionDirectionID = p.MatchPositionDirectionID
            })
            .ToList();

        // Swap the first two player IDs.
        var first = swappedFormation[0];
        var second = swappedFormation[1];
        swappedFormation[0] = new FormationPlayer
        {
            PlayerID = second.PlayerID,
            MatchSystemFieldID = first.MatchSystemFieldID,
            MatchStandardPositionID = first.MatchStandardPositionID,
            MatchPositionDirectionID = first.MatchPositionDirectionID
        };
        swappedFormation[1] = new FormationPlayer
        {
            PlayerID = first.PlayerID,
            MatchSystemFieldID = second.MatchSystemFieldID,
            MatchStandardPositionID = second.MatchStandardPositionID,
            MatchPositionDirectionID = second.MatchPositionDirectionID
        };

        var saveResponse = await client.PostAsJsonAsync("/api/SaveLineup", new SaveLineupRequest
        {
            MatchId = matchId,
            FormationData = new MatchFormationData
            {
                MatchSystemID = matchLineupBody.FormationData.MatchSystemID,
                MatchTacticID = matchLineupBody.FormationData.MatchTacticID,
                Players = swappedFormation.ToList()
            }
        });
        Assert.Equal(HttpStatusCode.OK, saveResponse.StatusCode);

        var saveBody = await saveResponse.Content.ReadFromJsonAsync<ResponseObject>();
        Assert.NotNull(saveBody);
        Assert.True(saveBody!.Success);

        // Ensure the lineup reflects the updated order.
        var updatedMatchLineupResponse = await client.PostAsJsonAsync("/api/GetMatchLineup", new LineupRequest { MatchId = matchId });
        Assert.Equal(HttpStatusCode.OK, updatedMatchLineupResponse.StatusCode);

        var updatedMatchLineupBody = await updatedMatchLineupResponse.Content.ReadFromJsonAsync<MatchLineupResponse>();
        Assert.NotNull(updatedMatchLineupBody);
        Assert.True(updatedMatchLineupBody!.Success);
        Assert.NotNull(updatedMatchLineupBody.FormationData);
        Assert.Equal(swappedFormation[0].PlayerID, updatedMatchLineupBody.FormationData.Players[0].PlayerID);
        Assert.Equal(swappedFormation[1].PlayerID, updatedMatchLineupBody.FormationData.Players[1].PlayerID);
    }

    private static Guid BuildLegacyFieldId(int slotIndex, int systemIndex)
    {
        return Guid.Parse($"{slotIndex:x8}-0000-0000-0000-{systemIndex:x12}");
    }

    private async Task<string> RegisterAndLoginAsync()
    {
        var email = $"lineup_{Guid.NewGuid():N}@example.com";

        var registerResponse = await client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = "LineupManager"
        });
        Assert.Equal(HttpStatusCode.OK, registerResponse.StatusCode);

        var loginResponse = await client.PostAsJsonAsync("/api/Login", new AuthRequest
        {
            Email = email,
            Password = "pass12345"
        });
        Assert.Equal(HttpStatusCode.OK, loginResponse.StatusCode);

        var loginBody = await loginResponse.Content.ReadFromJsonAsync<AuthResponse>();
        Assert.NotNull(loginBody);
        return loginBody!.Token!;
    }
}
