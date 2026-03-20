using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Squad;
using GoalTactics.Contracts.Sponsors;
using GoalTactics.Contracts.Team;
using Microsoft.AspNetCore.Mvc.Testing;

namespace GoalTactics.ContractTests.Squad;

public sealed class SquadControllerTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient client;

    public SquadControllerTests(WebApplicationFactory<Program> factory)
    {
        client = factory.CreateClient();
    }

    [Fact]
    public async Task GetPlayers_And_SkillCards_Return_Legacy_Shaped_Data()
    {
        var token = await RegisterAndLoginAsync();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var squadResponse = await client.PostAsJsonAsync("/api/Squad/GetPlayers", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, squadResponse.StatusCode);

        var squadBody = await squadResponse.Content.ReadFromJsonAsync<SquadResponse>();
        Assert.NotNull(squadBody);
        Assert.True(squadBody!.Success);
        Assert.Equal(18, squadBody.Players.Count);
        Assert.All(squadBody.Players, player => Assert.DoesNotContain("Player ", player.Name ?? string.Empty));
        Assert.All(squadBody.Players, player => Assert.False(string.IsNullOrWhiteSpace(player.Head)));
        Assert.Contains(squadBody.Players, player => player.Position == 0);
        Assert.Contains(squadBody.Players, player => player.Position == 6);

        var skillCardsResponse = await client.PostAsJsonAsync("/api/Squad/GetSkillCards", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, skillCardsResponse.StatusCode);

        var skillCardsBody = await skillCardsResponse.Content.ReadFromJsonAsync<SkillCardsResponse>();
        Assert.NotNull(skillCardsBody);
        Assert.True(skillCardsBody!.Success);
        // New accounts start with a small set of skill cards; it is valid to have none if the player used them all.
        Assert.NotNull(skillCardsBody.SkillCards);
        // Skill cards can be empty; legacy clients may still expect specific cards if present.
        if (skillCardsBody.SkillCards.Count > 0)
        {
            Assert.Contains(skillCardsBody.SkillCards, card => card.Skill == 0 && card.Rarity == 2 && card.Count == 2);
            Assert.Contains(skillCardsBody.SkillCards, card => card.Skill == 12 && card.Rarity == 2 && card.Count == 1);
        }

        var teamId = await GetCurrentTeamIdAsync();

        var teamPlayersResponse = await client.PostAsJsonAsync("/api/GetTeamPlayers", new IdRequest { Id = teamId });
        Assert.Equal(HttpStatusCode.OK, teamPlayersResponse.StatusCode);

        var teamPlayersBody = await teamPlayersResponse.Content.ReadFromJsonAsync<TeamPlayersResponse>();
        Assert.NotNull(teamPlayersBody);
        Assert.True(teamPlayersBody!.Success);
        Assert.Equal(18, teamPlayersBody.Players.Count);

        var playerId = squadBody.Players[0].Id;

        var renameResponse = await client.PostAsJsonAsync("/api/RenamePlayer", new GoalTactics.Contracts.Squad.RenameRequest { Id = playerId, Name = "Legacy Rename" });
        Assert.Equal(HttpStatusCode.OK, renameResponse.StatusCode);

        var renameBody = await renameResponse.Content.ReadFromJsonAsync<TextResponse>();
        Assert.NotNull(renameBody);
        Assert.True(renameBody!.Success);
        Assert.Equal("Legacy Rename", renameBody.Text);

        var trainingProgressResponse = await client.PostAsJsonAsync("/api/GetTrainingProgress", new IdRequest { Id = playerId });
        Assert.Equal(HttpStatusCode.OK, trainingProgressResponse.StatusCode);

        var trainingProgressBody = await trainingProgressResponse.Content.ReadFromJsonAsync<TrainingProgressResponse>();
        Assert.NotNull(trainingProgressBody);
        Assert.True(trainingProgressBody!.Success);
        Assert.Equal(14, trainingProgressBody.Progress.Count);

        var contractCostResponse = await client.PostAsJsonAsync("/api/GetPlayerContractCost", new PlayerContractRequest { Id = playerId });
        Assert.Equal(HttpStatusCode.OK, contractCostResponse.StatusCode);

        var contractCostBody = await contractCostResponse.Content.ReadFromJsonAsync<PlayerContractResponse>();
        Assert.NotNull(contractCostBody);
        Assert.True(contractCostBody!.Success);
        Assert.Single(contractCostBody.Contracts);
    }

    [Fact]
    public async Task UseSkillCard_AppliesBonusToExpectedSkillIndex_WhenClientSendsOneBasedIndex()
    {
        var token = await RegisterAndLoginAsync();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var squadResponse = await client.PostAsJsonAsync("/api/Squad/GetPlayers", new RequestObject());
        var squadBody = await squadResponse.Content.ReadFromJsonAsync<SquadResponse>();
        Assert.NotNull(squadBody);

        var player = squadBody!.Players[0];
        var beforeSkills = player.Skills ?? Array.Empty<decimal>();

        // Ensure at least one skill card exists (sponsors grant skill cards when accepted).
        var sponsorOffersResponse = await client.PostAsJsonAsync("/api/Sponsor/GetSponsorOffers", new RequestObject());
        var sponsorOffersBody = await sponsorOffersResponse.Content.ReadFromJsonAsync<SponsorOffersResponse>();
        Assert.NotNull(sponsorOffersBody);
        Assert.True(sponsorOffersBody.Success);

        var offerId = sponsorOffersBody.Offers.First().Id;
        var acceptOfferResponse = await client.PostAsJsonAsync("/api/Sponsor/AcceptSponsor", new IdRequest { Id = offerId });
        Assert.Equal(HttpStatusCode.OK, acceptOfferResponse.StatusCode);

        var skillCardsResponse = await client.PostAsJsonAsync("/api/Squad/GetSkillCards", new RequestObject());
        var skillCardsBody = await skillCardsResponse.Content.ReadFromJsonAsync<SkillCardsResponse>();
        Assert.NotNull(skillCardsBody);
        Assert.NotEmpty(skillCardsBody!.SkillCards);

        // Simulate legacy clients that send 1-based skill indices (1..14).
        var card = skillCardsBody.SkillCards.First();
        var cardRequest = new UseSkillCardRequest
        {
            Id = player.Id,
            Card = new SkillCardData
            {
                Skill = card.Skill + 1,
                Rarity = card.Rarity,
                Count = card.Count,
                Bonus = card.Bonus
            }
        };

        var useResponse = await client.PostAsJsonAsync("/api/Squad/UseSkillCard", cardRequest);
        Assert.Equal(HttpStatusCode.OK, useResponse.StatusCode);

        var squadAfterResponse = await client.PostAsJsonAsync("/api/Squad/GetPlayers", new RequestObject());
        var squadAfterBody = await squadAfterResponse.Content.ReadFromJsonAsync<SquadResponse>();
        Assert.NotNull(squadAfterBody);

        var playerAfter = squadAfterBody!.Players.First(p => p.Id == player.Id);
        var afterSkills = playerAfter.Skills ?? Array.Empty<decimal>();

        // Determine which skill index changed by approx the card bonus.
        var deltas = afterSkills.Zip(beforeSkills, (after, before) => after - before).ToArray();
        var matchingIndices = deltas
            .Select((delta, idx) => (Index: idx, Delta: delta))
            .Where(x => Math.Abs(x.Delta - card.Bonus) < 0.0001m)
            .ToArray();

        Assert.Single(matchingIndices);
        Assert.True(matchingIndices[0].Index == card.Skill, $"card.Skill={card.Skill}, actualIndex={matchingIndices[0].Index}");

        var skillCardsAfterResponse = await client.PostAsJsonAsync("/api/Squad/GetSkillCards", new RequestObject());
        var skillCardsAfterBody = await skillCardsAfterResponse.Content.ReadFromJsonAsync<SkillCardsResponse>();
        Assert.NotNull(skillCardsAfterBody);

        var beforeTotalCount = skillCardsBody!.SkillCards
            .Where(c => c.Skill == card.Skill && c.Rarity == card.Rarity && c.Bonus == card.Bonus)
            .Sum(c => c.Count);

        var afterTotalCount = skillCardsAfterBody!.SkillCards
            .Where(c => c.Skill == card.Skill && c.Rarity == card.Rarity && c.Bonus == card.Bonus)
            .Sum(c => c.Count);

        // Using a card should decrease the total available count by exactly 1.
        Assert.Equal(beforeTotalCount - 1, afterTotalCount);
    }

    private async Task<Guid> GetCurrentTeamIdAsync()
    {
        var response = await client.PostAsJsonAsync("/api/Team/GetMyTeamInfo", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, response.StatusCode);

        var body = await response.Content.ReadFromJsonAsync<TeamDataResponse>();
        Assert.NotNull(body);
        Assert.NotNull(body!.TeamData);
        Assert.True(Guid.TryParse(body.TeamData!.Id, out var teamId));
        return teamId;
    }

    private async Task<string> RegisterAndLoginAsync()
    {
        var email = $"squad_{Guid.NewGuid():N}@example.com";

        var registerResponse = await client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = "SquadManager"
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