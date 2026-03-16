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

        // initialize seat counts from initial stadium level
        var seatCaps = new[] { (Vip: 2800, Sit: 35000), (Vip: 2300, Sit: 28500), (Vip: 1900, Sit: 24000) };
        foreach (var r in result)
        {
            var tierIndex = Math.Clamp(r.Tier - 1, 0, 2);
            var caps = seatCaps[tierIndex];
            r.VipSeats = Math.Min(caps.Vip, 200 + (r.StadiumLevel * 130));
            r.SitSeats = Math.Min(caps.Sit, 2_500 + (r.StadiumLevel * 1_750));
            r.StandSeats = 3_000 + (r.StadiumLevel * 2_200);
        }

        // Initialize per-player skills for starting 11
        foreach (var bot in result)
        {
            InitializePlayers(bot);
        }

        return result;
    }

    /// <summary>Creates 11 players with individual skills matching the bot's tier/strength.</summary>
    private static void InitializePlayers(BotClubProfile bot)
    {
        const int numberOfSkills = 14;
        const int minSkillVariation = -2;
        const int maxSkillVariation = 3;
        var rng = new Random(HashCode.Combine(bot.Seed, bot.Strength, bot.Tier));
        var positions = new[] { "GK", "DEF", "DEF", "DEF", "DEF", "MID", "MID", "MID", "FWD", "FWD", "FWD" };
        var firstNames = new[] { "Alex", "Max", "Leo", "Sam", "Kai", "Jan", "Tom", "Ben", "Nico", "Finn", "Luis" };
        var lastNames = new[] { "Müller", "Schmidt", "Fischer", "Weber", "Wagner", "Becker", "Schulz", "Koch", "Braun", "Meyer", "Richter" };

        bot.Players.Clear();
        for (var i = 0; i < 11; i++)
        {
            var skills = new decimal[numberOfSkills];
            for (var s = 0; s < numberOfSkills; s++)
            {
                var baseSkill = bot.Strength / (double)numberOfSkills + rng.Next(minSkillVariation, maxSkillVariation);
                skills[s] = Math.Max(1m, (decimal)Math.Round(baseSkill, 1));
            }

            var player = new BotPlayer
            {
                Name = $"{firstNames[i % firstNames.Length]} {lastNames[rng.Next(lastNames.Length)]}",
                Position = positions[i],
                Age = rng.Next(18, 34),
                Talent = rng.Next(3, 10),
                Fitness = rng.Next(70, 100),
                Skills = skills
            };

            // Compute strength as sum of skills (matching PlayerValueCalculator formula)
            player.Strength = skills.Sum();
            bot.Players.Add(player);
        }

        // Give initial skill cards
        bot.SkillCards = rng.Next(1, 5);
    }

    private static int ResolveTier(int index, int teamsPerLeague)
    {
        // New league structure: 1 top league, 5 second-tier leagues, 15 third-tier leagues
        var tier1 = teamsPerLeague * 1;   // 1 group
        var tier2 = teamsPerLeague * 5;   // 5 groups
        // var tier3 = teamsPerLeague * 15; // remaining

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

        var tier1Count = teamsPerLeague * 1;
        var tier2Count = teamsPerLeague * 5;

        if (tier == 2)
        {
            var relative = index - tier1Count;
            return 1 + (relative / teamsPerLeague);
        }

        // tier == 3
        var relativeTier3 = index - (tier1Count + tier2Count);
        return 1 + (relativeTier3 / teamsPerLeague);
    }
}
