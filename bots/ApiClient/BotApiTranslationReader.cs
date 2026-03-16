namespace GoalTactics.Bots.Client.ApiClient;

public static class BotApiTranslationReader
{
    public static List<Dictionary<string, object?>> GetObjectList(BotApiTranslation translation, string key)
    {
        if (!translation.Output.TryGetValue(key, out var value) || value is null)
        {
            return [];
        }

        return ToObjectList(value);
    }

    public static List<Dictionary<string, object?>> GetObjectList(Dictionary<string, object?> data, string key)
    {
        if (!data.TryGetValue(key, out var value) || value is null)
        {
            return [];
        }

        return ToObjectList(value);
    }

    public static Dictionary<string, object?>? GetObject(BotApiTranslation translation, string key)
    {
        if (!translation.Output.TryGetValue(key, out var value) || value is null)
        {
            return null;
        }

        return value as Dictionary<string, object?>;
    }

    public static string GetString(Dictionary<string, object?> data, string key, string fallback = "")
        => data.TryGetValue(key, out var value) && value is not null
            ? value.ToString() ?? fallback
            : fallback;

    public static bool GetBool(Dictionary<string, object?> data, string key, bool fallback = false)
    {
        if (!data.TryGetValue(key, out var value) || value is null)
        {
            return fallback;
        }

        return value switch
        {
            bool b => b,
            string s when bool.TryParse(s, out var parsed) => parsed,
            _ => fallback
        };
    }

    public static int GetInt(Dictionary<string, object?> data, string key, int fallback = 0)
    {
        if (!data.TryGetValue(key, out var value) || value is null)
        {
            return fallback;
        }

        return value switch
        {
            int i => i,
            long l => (int)l,
            decimal d => (int)d,
            double d => (int)d,
            float f => (int)f,
            string s when int.TryParse(s, out var parsed) => parsed,
            _ => fallback
        };
    }

    public static long GetLong(Dictionary<string, object?> data, string key, long fallback = 0)
    {
        if (!data.TryGetValue(key, out var value) || value is null)
        {
            return fallback;
        }

        return value switch
        {
            long l => l,
            int i => i,
            decimal d => (long)d,
            double d => (long)d,
            float f => (long)f,
            string s when long.TryParse(s, out var parsed) => parsed,
            _ => fallback
        };
    }

    public static decimal GetDecimal(Dictionary<string, object?> data, string key, decimal fallback = 0)
    {
        if (!data.TryGetValue(key, out var value) || value is null)
        {
            return fallback;
        }

        return value switch
        {
            decimal d => d,
            int i => i,
            long l => l,
            double d => (decimal)d,
            float f => (decimal)f,
            string s when decimal.TryParse(s, out var parsed) => parsed,
            _ => fallback
        };
    }

    public static decimal[] GetDecimalArray(Dictionary<string, object?> data, string key)
    {
        if (!data.TryGetValue(key, out var value) || value is null)
        {
            return [];
        }

        if (value is decimal[] decimals)
        {
            return decimals;
        }

        if (value is IEnumerable<object?> objects)
        {
            return objects.Select(o => o switch
            {
                decimal d => d,
                int i => i,
                long l => l,
                double d => (decimal)d,
                float f => (decimal)f,
                string s when decimal.TryParse(s, out var parsed) => parsed,
                _ => 0m
            }).ToArray();
        }

        return [];
    }

    private static List<Dictionary<string, object?>> ToObjectList(object value)
    {
        if (value is List<Dictionary<string, object?>> typedList)
        {
            return typedList;
        }

        if (value is IEnumerable<Dictionary<string, object?>> typedEnumerable)
        {
            return typedEnumerable.ToList();
        }

        if (value is IEnumerable<object?> objects)
        {
            return objects.OfType<Dictionary<string, object?>>().ToList();
        }

        return [];
    }
}