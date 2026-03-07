using GoalTactics.Bots.Config;
using GoalTactics.Bots.Models;
using GoalTactics.Bots.Profiles;

namespace GoalTactics.Bots.Runtime;

public sealed class BotRegistry
{
    private readonly List<IBotProfile> profiles;
    private readonly BotOptions options;

    public BotRegistry(BotOptions options)
    {
        this.options = options;
        profiles =
        [
            new NewManagerBotProfile(),
            new ConservativeBotProfile(),
            new AggressiveTraderBotProfile(),
            new YouthFocusedBotProfile(),
            new LadderGrinderBotProfile(),
            new SocialBotProfile()
        ];
    }

    public IReadOnlyList<BotClubProfile> CreatePopulation(int botCount)
    {
        var result = new List<BotClubProfile>(botCount);
        var countries = new[] { "DE", "FR", "IT", "ES", "NL", "PL", "AT", "CH", "BE", "PT" };
        var timeZones = new[] { "Europe/Berlin", "Europe/Paris", "Europe/Rome", "Europe/Madrid", "Europe/Amsterdam", "Europe/Warsaw" };

        for (var i = 0; i < botCount; i++)
        {
            var profile = profiles[i % profiles.Count];
            var seed = HashCode.Combine(i, profile.Name.GetHashCode(StringComparison.Ordinal));
            var random = new Random(seed);
            var tier = ResolveTier(i, options.TeamsPerLeague);
            var group = ResolveGroup(i, options.TeamsPerLeague, tier);

            result.Add(new BotClubProfile
            {
                BotId = Guid.NewGuid(),
                ManagerName = $"{profile.Name}_{i + 1}",
                TeamName = $"{countries[i % countries.Length]} Club {i + 1}",
                CountryIso = countries[i % countries.Length],
                TimeZoneId = timeZones[i % timeZones.Length],
                Persona = profile.Name,
                Seed = seed,
                ActiveFromLocal = new TimeOnly(17, random.Next(0, 40)),
                ActiveToLocal = new TimeOnly(22, random.Next(0, 50)),
                Money = 120_000m + random.Next(0, 60_000),
                Stars = 4_000m + random.Next(0, 2_000),
                Strength = 45 + random.Next(0, 45),
                Tier = tier,
                LeagueGroup = group,
                Position = 1 + (i % options.TeamsPerLeague),
                OfficeLevel = 4 + random.Next(0, 5),
                StadiumLevel = 1 + random.Next(0, 4),
                TrainingCenterLevel = 2 + random.Next(0, 5),
                FanShopLevel = 1 + random.Next(0, 4),
                ParkingLevel = 1 + random.Next(0, 4),
                TeamMainTrainingPosition = random.Next(0, 4),
                TeamSubTrainingSkill = random.Next(0, 10)
            });
        }

        return result;
    }

    private static int ResolveTier(int index, int teamsPerLeague)
    {
        var tier1 = teamsPerLeague;
        var tier2 = teamsPerLeague * 2;
        if (index < tier1)
        {
            return 1;
        }

        if (index < tier1 + tier2)
        {
            return 2;
        }

        return 3;
    }

    private static int ResolveGroup(int index, int teamsPerLeague, int tier)
    {
        if (tier == 1)
        {
            return 1;
        }

        if (tier == 2)
        {
            var relative = index - teamsPerLeague;
            return 1 + (relative / teamsPerLeague);
        }

        var relativeTier3 = index - (teamsPerLeague * 3);
        return 1 + (relativeTier3 / teamsPerLeague);
    }
}
