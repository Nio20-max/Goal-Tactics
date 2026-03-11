namespace GoalTactics.Application.Mechanics;

public sealed class TrainingProgressService
{
    public decimal CalculateDailyMainGain(int age, int talent, int trainingCenterLevel)
    {
        var level = Math.Clamp(trainingCenterLevel, 1, 20);
        var baseGain = 0.10m + (0.02m * talent) + (0.03m * level);

        var ageBonus = age switch
        {
            <= 16 => 0.18m,
            17 => 0.17m,
            18 => 0.16m,
            19 => 0.14m,
            20 => 0.12m,
            21 => 0.10m,
            22 => 0.08m,
            23 => 0.06m,
            24 => 0.04m,
            25 => 0.02m,
            26 => 0.0m,
            27 => -0.03m,
            28 => -0.06m,
            29 => -0.10m,
            30 => -0.14m,
            31 => -0.18m,
            32 => -0.22m,
            33 => -0.26m,
            _ => -0.32m
        };

        return Math.Max(0.02m, Math.Round(baseGain + ageBonus, 3));
    }

    public decimal CalculateDailyTotalGain(int age, int talent, int fitness, int trainingCenterLevel, bool hasIndividualTraining, bool hasCamp)
    {
        var main = CalculateDailyMainGain(age, talent, trainingCenterLevel);
        var sub = Math.Round(main * 0.18m, 3);
        var individual = hasIndividualTraining ? CalculateIndividualGain(age, talent, fitness) : 0m;
        var camp = hasCamp ? 1.5m : 0m;

        return Math.Round(main + sub + individual + camp, 3);
    }

    public int CalculateEfficiencyValue(int trainingCenterLevel)
    {
        return Math.Clamp(45 + (trainingCenterLevel * 2), 40, 100);
    }

    private static decimal CalculateIndividualGain(int age, int talent, int fitness)
    {
        var ageFactor = age switch
        {
            <= 18 => 1.25m,
            <= 22 => 1.10m,
            <= 27 => 0.95m,
            <= 30 => 0.75m,
            <= 33 => 0.55m,
            _ => 0.35m
        };

        var fitnessFactor = 0.70m + (Math.Clamp(fitness, 0, 100) / 250m);
        var baseGain = 0.20m + (0.03m * talent);
        return Math.Round(baseGain * ageFactor * fitnessFactor, 3);
    }

    public decimal CalculateIndividualGainPublic(int age, int talent, int fitness)
        => CalculateIndividualGain(age, talent, fitness);
}
