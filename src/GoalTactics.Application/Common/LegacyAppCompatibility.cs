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
            "austria" or "\u00f6sterreich" or "osterreich" => "at",
            "switzerland" or "schweiz" => "ch",
            "slovenia" or "slowenien" or "slovenien" => "si",
            "ireland" or "irland" => "ie",
            "lithuania" or "litauen" => "lt",
            "ecuador" => "ec",
            "france" or "frankreich" => "fr",
            "sweden" or "schweden" => "se",
            "portugal" => "pt",
            "turkey" or "t\u00fcrkei" or "turkei" => "tr",
            "belgium" or "belgien" => "be",
            "uruguay" => "uy",
            "saudi arabia" or "saudi arabien" => "sa",
            "mexico" or "mexiko" => "mx",
            "argentina" or "argentinien" => "ar",
            "spain" or "spanien" => "es",
            "hungary" or "ungarn" => "hu",
            "brazil" or "brasilien" => "br",
            "latvia" or "lettland" => "lv",
            "finland" or "finnland" => "fi",
            "czech republic" or "tschechische republik" or "tschechien" => "cz",
            "luxembourg" or "luxemburg" => "lu",
            "cyprus" or "zypern" => "cy",
            "denmark" or "d\u00e4nemark" or "danemark" => "dk",
            "colombia" or "columbia" or "kolumbien" => "co",
            "estonia" or "estland" => "ee",
            "bulgaria" or "bulgarien" => "bg",
            "honduras" => "hn",
            "costa rica" => "cr",
            "slovakia" or "slowakei" => "sk",
            "malta" => "mt",
            "poland" or "polen" => "pl",
            "netherlands" or "niederlande" => "nl",
            "greece" or "griechenland" => "el",
            "italy" or "italien" => "it",
            "romania" or "rum\u00e4nien" or "rumanien" => "ro",
            "chile" => "cl",
            _ => trimmed[..Math.Min(2, trimmed.Length)].ToLowerInvariant()
        };
    }

    // Use shared catalog as single source of truth
    private static readonly string[] ValidLogos = EquipmentCatalog.Emblems;

    public static string BuildLogoId(string stableKey)
    {
        var index = Math.Abs(HashCode.Combine(stableKey, "logo")) % ValidLogos.Length;
        return ValidLogos[index];
    }

    public static string BuildShirtId(string stableKey, string variant)
    {
        var index = Math.Abs(HashCode.Combine(stableKey, variant)) % EquipmentCatalog.Shirts.Length;
        return EquipmentCatalog.Shirts[index];
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
        // Legacy iOS/Android UI expects position codes in the range 0..3.
        // The app interprets these codes as:
        //   0 = Goalkeeper
        //   1 = Defender
        //   2 = Midfielder
        //   3 = Forward
        return position switch
        {
            "GK" => 0,
            "DEF" => 1,
            "MID" => 2,
            "FWD" => 3,
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
        // Used for internal strength calculations (legacy behavior).
        // Keep this deterministic and position-based to match existing formulas.
        return position switch
        {
            "GK" => [1, 13, 13, 12],
            "DEF" => [0, 13, 12, 11],
            "MID" => [11, 10, 9, 8],
            "FWD" => [6, 5, 4, 3],
            _ => [0, 1]
        };
    }

    public static int[] BuildRandomBonusSkills(Guid playerId)
    {
        // Random but stable per player. Exclude the core "main" skill indices (0..3).
        // Returns exactly 3 unique skill indices from 4..13.
        var rng = new Random(HashCode.Combine(playerId, "bonus-skills"));
        var choices = Enumerable.Range(4, 10).ToList();
        var result = new List<int>(3);
        for (int i = 0; i < 3; i++)
        {
            var index = rng.Next(choices.Count);
            result.Add(choices[index]);
            choices.RemoveAt(index);
        }
        return result.ToArray();
    }

    public static decimal[] BuildSkills(decimal strength, string position, int talent, int age, int[]? bonusSkillIndices = null)
    {
        var primarySkill = MainSkillIndex(position);
        var bonusSkills = bonusSkillIndices ?? BuildBonusSkills(position);
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