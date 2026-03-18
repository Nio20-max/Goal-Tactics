using GoalTactics.Application.Common;
using GoalTactics.Application.Mechanics;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class TrainingProgressJob(
    ILogger<TrainingProgressJob> logger,
    IServiceScopeFactory scopeFactory)
    : ScheduledBackgroundJob(logger, TimeSpan.FromMinutes(10))
{
    protected override string JobName => nameof(TrainingProgressJob);

    protected override async Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        using var scope = scopeFactory.CreateScope();
        var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();

        var now = DateTime.UtcNow;
        var cutoff = now.AddHours(-23);

        var teamResources = await dbContext.TeamResources
            .Where(r => r.LastTrainingTickUtc == null || r.LastTrainingTickUtc < cutoff)
            .ToListAsync(cancellationToken);

        if (teamResources.Count == 0)
        {
            return;
        }

        var teamIds = teamResources.Select(r => r.TeamId).ToList();

        var trainingStates = await dbContext.TeamTrainingStates
            .Where(t => teamIds.Contains(t.TeamId))
            .ToDictionaryAsync(t => t.TeamId, cancellationToken);

        var playersByTeam = (await dbContext.TeamPlayers
            .Where(p => teamIds.Contains(p.TeamId) && !p.IsScouted)
            .ToListAsync(cancellationToken))
            .GroupBy(p => p.TeamId)
            .ToDictionary(g => g.Key, g => g.ToList());

        var trainingProgress = new TrainingProgressService();
        var processedCount = 0;

        foreach (var resources in teamResources)
        {
            if (!playersByTeam.TryGetValue(resources.TeamId, out var players))
            {
                resources.LastTrainingTickUtc = now;
                resources.ProgressDayCounter++;
                processedCount++;
                continue;
            }

            trainingStates.TryGetValue(resources.TeamId, out var training);
            var hasCamp = training?.CampActiveUntilUtc.HasValue == true && training.CampActiveUntilUtc.Value.Date >= now.Date;

            foreach (var player in players)
            {
                // Calculate daily total gain, but *exclude camp* (handled separately)
                var hasIndividualTraining = player.IndividualTrainingSkill != null
                    && player.IndividualTrainingUntilUtc > now;

                var gain = trainingProgress.CalculateDailyTotalGain(
                    player.Age,
                    player.Talent,
                    player.Fitness,
                    resources.TrainingCenterLevel,
                    hasIndividualTraining,
                    hasCamp: false);

                var mainSkillIndex = NormalizeSkillIndex(training?.MainSkillIndex ?? 0, player.Position);
                var subSkillIndex = NormalizeSkillIndex(training?.SubSkillIndex ?? 0, player.Position);

                // Apply team training gains to main/sub skills
                AddSkillGain(player, mainSkillIndex, gain * 0.65m);
                if (subSkillIndex != mainSkillIndex)
                {
                    AddSkillGain(player, subSkillIndex, gain * 0.35m);
                }

                // Apply individual training to the chosen skill
                if (hasIndividualTraining && TryResolveSkillIndex(player.IndividualTrainingSkill, out var indSkillIndex))
                {
                    var indGain = trainingProgress.CalculateIndividualGainPublic(player.Age, player.Talent, player.Fitness);
                    AddSkillGain(player, indSkillIndex, indGain);
                }

                // Apply camp bonus to a specific stat (skill or experience)
                if (hasCamp && TryGetCampBonusTarget(training?.CampType, out var campSkillIndex, out var campIsExperience))
                {
                    if (campIsExperience)
                    {
                        player.Experience += 1.5m;
                    }
                    else
                    {
                        AddSkillGain(player, campSkillIndex, 1.5m);
                    }
                }

                // Recompute strength/market from skills after applying training
                var skills = GetSkills(player);
                var playerId = Guid.TryParse(player.Id, out var parsedId) ? parsedId : Guid.Empty;
                var bonusSkills = LegacyAppCompatibility.BuildRandomBonusSkills(playerId);
                player.Strength = PlayerValueCalculator.CalculateStrength(skills, player.Position, player.Fitness, player.Age, player.Talent, bonusSkills);
                player.MarketValue = PlayerValueCalculator.CalculateMarketValue(skills, player.Position, player.Fitness, player.Age, player.Talent, bonusSkills);

                // Fitness recovery remains unchanged
                var fitnessRecovery = Math.Max(1, resources.TrainingCenterLevel / 5);
                player.Fitness = Math.Min(100, player.Fitness + fitnessRecovery);
            }

            resources.LastTrainingTickUtc = now;
            resources.ProgressDayCounter++;
            processedCount++;
        }

        if (processedCount > 0)
        {
            await dbContext.SaveChangesAsync(cancellationToken);
            logger.LogInformation("Training progress: processed {Count} teams", processedCount);
        }
    }

    private static decimal[] GetSkills(TeamPlayerEntity player)
    {
        return
        [
            player.Skill0 ?? 0m,
            player.Skill1 ?? 0m,
            player.Skill2 ?? 0m,
            player.Skill3 ?? 0m,
            player.Skill4 ?? 0m,
            player.Skill5 ?? 0m,
            player.Skill6 ?? 0m,
            player.Skill7 ?? 0m,
            player.Skill8 ?? 0m,
            player.Skill9 ?? 0m,
            player.Skill10 ?? 0m,
            player.Skill11 ?? 0m,
            player.Skill12 ?? 0m,
            player.Skill13 ?? 0m
        ];
    }

    private static void SetSkills(TeamPlayerEntity player, decimal[] skills)
    {
        if (skills.Length < 14)
        {
            throw new ArgumentException("Expected 14 skills.", nameof(skills));
        }

        player.Skill0 = PlayerValueCalculator.ClampSkill(skills[0]);
        player.Skill1 = PlayerValueCalculator.ClampSkill(skills[1]);
        player.Skill2 = PlayerValueCalculator.ClampSkill(skills[2]);
        player.Skill3 = PlayerValueCalculator.ClampSkill(skills[3]);
        player.Skill4 = PlayerValueCalculator.ClampSkill(skills[4]);
        player.Skill5 = PlayerValueCalculator.ClampSkill(skills[5]);
        player.Skill6 = PlayerValueCalculator.ClampSkill(skills[6]);
        player.Skill7 = PlayerValueCalculator.ClampSkill(skills[7]);
        player.Skill8 = PlayerValueCalculator.ClampSkill(skills[8]);
        player.Skill9 = PlayerValueCalculator.ClampSkill(skills[9]);
        player.Skill10 = PlayerValueCalculator.ClampSkill(skills[10]);
        player.Skill11 = PlayerValueCalculator.ClampSkill(skills[11]);
        player.Skill12 = PlayerValueCalculator.ClampSkill(skills[12]);
        player.Skill13 = PlayerValueCalculator.ClampSkill(skills[13]);
    }

    private static void AddSkillGain(TeamPlayerEntity player, int skillIndex, decimal gain)
    {
        if (skillIndex < 0 || skillIndex > 13 || gain <= 0m)
        {
            return;
        }

        var skills = GetSkills(player);
        skills[skillIndex] = PlayerValueCalculator.ClampSkill(skills[skillIndex] + gain);
        SetSkills(player, skills);
    }

    private static int NormalizeSkillIndex(int requestedIndex, string position)
    {
        if (requestedIndex >= 0 && requestedIndex < 14)
        {
            return requestedIndex;
        }

        return LegacyAppCompatibility.MainSkillIndex(position);
    }

    private static bool TryResolveSkillIndex(string? skillName, out int index)
    {
        index = -1;
        if (string.IsNullOrWhiteSpace(skillName))
        {
            return false;
        }

        var key = skillName.Trim().ToLowerInvariant();
        if (key.Contains("parade") || key.Contains("goalkeeping") || key.Contains("keeper")) { index = 0; return true; }
        if (key.Contains("manndeckung") || key.Contains("deck") || key.Contains("defend")) { index = 1; return true; }
        if (key.Contains("zweikampf") || key.Contains("duell") || key.Contains("tackle")) { index = 2; return true; }
        if (key.Contains("abschluss") || key.Contains("finish") || key.Contains("shot")) { index = 3; return true; }
        if (key.Contains("dribbel")) { index = 4; return true; }
        if (key.Contains("pass")) { index = 5; return true; }
        if (key.Contains("flanke") || key.Contains("cross")) { index = 6; return true; }
        if (key.Contains("lauf") || key.Contains("tempo") || key.Contains("speed")) { index = 7; return true; }
        if (key.Contains("ausdauer") || key.Contains("stamina")) { index = 8; return true; }
        if (key.Contains("technik") || key.Contains("tech")) { index = 9; return true; }
        if (key.Contains("einsatz") || key.Contains("aggress")) { index = 10; return true; }
        if (key.Contains("kopf") || key.Contains("header")) { index = 11; return true; }
        if (key.Contains("freisto") || key.Contains("freekick")) { index = 12; return true; }
        if (key.Contains("elfmeter") || key.Contains("penalty") || key.Contains("eckb") || key.Contains("corner")) { index = 13; return true; }

        return false;
    }

    private static bool TryGetCampBonusTarget(string? campType, out int skillIndex, out bool isExperience)
    {
        skillIndex = -1;
        isExperience = false;
        if (string.IsNullOrWhiteSpace(campType))
        {
            return false;
        }

        var parts = campType.Split('_');
        if (parts.Length < 3 || !string.Equals(parts[0], "camp", StringComparison.OrdinalIgnoreCase))
        {
            return false;
        }

        if (!int.TryParse(parts[1], out var effect) || !int.TryParse(parts[2], out var variant))
        {
            return false;
        }

        switch (effect)
        {
            case 0:
                skillIndex = variant switch
                {
                    0 => 0,
                    1 => 1,
                    2 => 2,
                    3 => 3,
                    _ => -1
                };
                break;
            case 1:
                skillIndex = variant switch
                {
                    0 => 4,
                    1 => 5,
                    2 => 6,
                    3 => 7,
                    4 => 8,
                    5 => 9,
                    6 => 10,
                    7 => 11,
                    8 => 12,
                    9 => 13,
                    _ => -1
                };
                break;
            case 2:
                isExperience = true;
                return true;
            default:
                return false;
        }

        return skillIndex >= 0;
    }
}
