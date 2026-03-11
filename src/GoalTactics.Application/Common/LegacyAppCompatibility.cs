namespace GoalTactics.Application.Common;

public static class LegacyAppCompatibility
{
    public static string NormalizeCountryCode(string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
        {
            return "de";
        }

        var trimmed = value.Trim();
        if (trimmed.Length == 2)
        {
            return trimmed.ToLowerInvariant();
        }

        return trimmed.ToLowerInvariant() switch
        {
            "germany" or "deutschland" => "de",
            "england" or "great britain" or "gro\u00dfbritannien" => "gb",
            "austria" or "\u00f6sterreich" => "at",
            "switzerland" or "schweiz" => "ch",
            "slovenia" or "slowenien" or "slovenien" => "si",
            "ireland" or "irland" => "ie",
            "lithuania" or "litauen" => "lt",
            "ecuador" => "ec",
            _ => trimmed[..Math.Min(2, trimmed.Length)].ToLowerInvariant()
        };
    }

    public static string BuildLogoId(string stableKey)
    {
        var value = Math.Abs(HashCode.Combine(stableKey, "logo")) % 120;
        return $"wappen{value:00}";
    }

    public static string BuildShirtId(string stableKey, string variant)
    {
        var modulo = variant == "away" ? 48 : 12;
        var value = Math.Abs(HashCode.Combine(stableKey, variant)) % modulo;
        return $"trikot{value}";
    }

    public static string BuildHeadId(Guid playerId)
    {
        var set = (Math.Abs(HashCode.Combine(playerId, "head-set")) % 3) switch
        {
            0 => 'A',
            1 => 'B',
            _ => 'C'
        };
        var index = Math.Abs(HashCode.Combine(playerId, "head-index")) % 15;
        return $"01_head-{set}{index:00}";
    }

    public static string BuildBodyId(Guid playerId)
    {
        var set = (Math.Abs(HashCode.Combine(playerId, "body-set")) % 3) switch
        {
            0 => 'A',
            1 => 'B',
            _ => 'C'
        };
        return $"01_body-{set}00";
    }

    public static string BuildGlovesId(Guid playerId, bool goalkeeper)
    {
        var index = goalkeeper ? (Math.Abs(HashCode.Combine(playerId, "gloves")) % 4) + 1 : 1;
        return $"01_Gloves{index:00}";
    }

    public static string BuildShoesId(Guid playerId)
    {
        var index = (Math.Abs(HashCode.Combine(playerId, "shoes")) % 6) + 1;
        return $"01_Shoes{index:00}";
    }

    public static int EstimateUserScore(int strength, int wins, int fans, int members)
    {
        return Math.Max(500, (strength * 2) + (wins * 35) + (fans * 3) + members);
    }

    public static string EstimateRank(int score)
    {
        return score switch
        {
            >= 40000 => "Master!",
            >= 15000 => "Profi",
            >= 8000 => "Erfahren",
            >= 2500 => "Rookie",
            _ => "Lehrling"
        };
    }

    public static string NormalizeMatchTrend(string? trend)
    {
        if (!string.IsNullOrWhiteSpace(trend)
            && trend.Length == 5
            && trend.All(character => char.IsAsciiDigit(character)))
        {
            return trend;
        }

        return "00000";
    }

    public static int MapPositionCode(string position)
    {
        return position switch
        {
            "GK" => 0,
            "DEF" => 2,
            "MID" => 4,
            "FWD" => 6,
            _ => 0
        };
    }

    public static int MainSkillIndex(string position)
    {
        return position switch
        {
            "GK" => 1,
            "DEF" => 0,
            "MID" => 11,
            "FWD" => 6,
            _ => 0
        };
    }

    public static int[] BuildBonusSkills(string position)
    {
        return position switch
        {
            "GK" => [1, 13, 13, 12],
            "DEF" => [0, 13, 12, 11],
            "MID" => [11, 10, 9, 8],
            "FWD" => [6, 5, 4, 3],
            _ => [0, 1]
        };
    }

    public static decimal[] BuildSkills(decimal strength, string position, int talent, int age)
    {
        var primarySkill = MainSkillIndex(position);
        var bonusSkills = BuildBonusSkills(position);
        var ageFactor = Math.Max(0.85m, 1.18m - (Math.Max(16, age) - 16m) / 60m);
        var talentFactor = 0.92m + (talent / 50m);
        var baseSkill = Math.Max(18m, strength * 0.48m * ageFactor * talentFactor);

        return Enumerable.Range(0, 14)
            .Select(index =>
            {
                var weight = index == primarySkill
                    ? 1.95m
                    : bonusSkills.Contains(index) ? 1.28m : 0.62m;
                return Math.Max(20m, Math.Round(baseSkill * weight, 10));
            })
            .ToArray();
    }

    public static decimal BuildExperience(decimal strength, int age, int matches)
    {
        var experience = (strength * 1.4m) + (Math.Max(0, age - 16) * 11m) + (matches * 1.25m);
        return Math.Round(Math.Max(10m, experience), 10);
    }
}