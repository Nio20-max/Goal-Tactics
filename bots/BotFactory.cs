using System.Security.Cryptography;
using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Database;

namespace GoalTactics.Bots.Client;

/// <summary>
/// Creates bots: generates unique names from gamertags files,
/// cryptographically secure passwords, personality, and registers via API.
/// </summary>
public sealed class BotFactory
{
    private readonly BotConfig _config;
    private readonly BotDatabase _db;
    private readonly GoalTacticsApiClient _api;
    private readonly Random _rng = new();

    private readonly List<string> _teamNames;
    private readonly List<string> _managerNames;
    private readonly List<string> _premiumManagerNames;
    private readonly HashSet<string> _usedTeamNames = new(StringComparer.OrdinalIgnoreCase);
    private readonly HashSet<string> _usedManagerNames = new(StringComparer.OrdinalIgnoreCase);

    private const string PasswordChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private const int PasswordLength = 32;

    public BotFactory(BotConfig config, BotDatabase db, GoalTacticsApiClient api)
    {
        _config = config;
        _db = db;
        _api = api;

        string botsDir = AppContext.BaseDirectory;

        // Try loading from source directory first (for development), then from output directory
        string gamertags = FindFile("gamertags.txt", botsDir);
        string premiumGamertags = FindFile("premium_gamertags.txt", botsDir);

        _teamNames = LoadNames(gamertags);
        _managerNames = LoadNames(gamertags);
        _premiumManagerNames = LoadNames(premiumGamertags);

        // Mark existing names as used
        foreach (var bot in _db.GetAllBots())
        {
            _usedTeamNames.Add(bot.TeamName);
            _usedManagerNames.Add(bot.ManagerName);
        }
    }

    /// <summary>
    /// Create and register a single bot, returning its database record.
    /// </summary>
    public async Task<BotRecord?> CreateBotAsync(int? countryId = null)
    {
        var personality = BotPersonality.GenerateRandom(_rng);

        string teamName = PickUniqueName(_teamNames, _usedTeamNames);
        string managerName = GenerateManagerName(personality);
        string password = GenerateSecurePassword();

        // Fetch countries if no countryId provided
        if (countryId is null)
        {
            var countries = await _api.GetCountriesAsync();
            if (countries?.Countries is not null && countries.Countries.Count > 0)
                countryId = countries.Countries[_rng.Next(countries.Countries.Count)].Id;
            else
                countryId = 1;
        }

        string email = SanitizeEmail(teamName);

        var registerResult = await _api.RegisterAsync(new RegisterRequest
        {
            IsGuest = false,
            Email = email,
            Login = email,
            Password = password,
            ManagerName = managerName,
            TeamName = teamName,
            CountryId = countryId.Value
        });

        if (registerResult is null || !registerResult.Success)
        {
            Console.Error.WriteLine($"[BotFactory] Registration failed for {teamName}");
            return null;
        }

        // Login to get JWT
        var loginResult = await _api.LoginAsync(new LoginRequest
        {
            Email = email,
            Password = password
        });

        string token = loginResult?.Token ?? "";

        var record = new BotRecord
        {
            BotId = registerResult.UserId,
            Password = password,
            ValidationToken = token,
            TeamName = teamName,
            ManagerName = managerName,
            Timezone = personality.Timezone,
            ActiveHours = personality.ActiveHoursJson,
            SleepHours = personality.SleepHoursJson,
            Activity = personality.Activity,
            Risk = personality.Risk,
            YouthFocus = personality.YouthFocus,
            SocialScore = personality.SocialScore,
            StarsDaily = personality.StarsDaily
        };

        _db.InsertBot(record);
        Console.WriteLine($"[BotFactory] Created bot: {teamName} (ID {record.BotId}, Activity={record.Activity}, Risk={record.Risk})");

        return record;
    }

    /// <summary>
    /// Cryptographically secure 32-character alphanumeric password.
    /// </summary>
    private static string GenerateSecurePassword()
    {
        Span<char> password = stackalloc char[PasswordLength];

        for (int i = 0; i < PasswordLength; i++)
        {
            password[i] = PasswordChars[RandomNumberGenerator.GetInt32(PasswordChars.Length)];
        }

        return new string(password);
    }

    private string PickUniqueName(List<string> pool, HashSet<string> used)
    {
        // Try to find an unused name from the pool
        var available = pool.Where(n => !used.Contains(n)).ToList();
        if (available.Count > 0)
        {
            string name = available[_rng.Next(available.Count)];
            used.Add(name);
            return name;
        }

        // Fallback: append a number
        for (int i = 1; i < 10000; i++)
        {
            string candidate = $"{pool[_rng.Next(pool.Count)]}{i}";
            if (used.Add(candidate))
                return candidate;
        }

        string fallback = $"Bot_{Guid.NewGuid():N}"[..20];
        used.Add(fallback);
        return fallback;
    }

    /// <summary>
    /// Generate manager name from gamertag lists.
    /// Premium gamertags are used for bots with high activity, high social score, and many daily stars.
    /// Regular gamertags are used for all other bots.
    /// </summary>
    private string GenerateManagerName(BotPersonality personality)
    {
        // Elite bots (high activity >= 70, high social >= 70, high daily stars >= 20000) get premium names
        bool isElite = personality.Activity >= 70 && personality.SocialScore >= 70 && personality.StarsDaily >= 20000;
        var namePool = isElite && _premiumManagerNames.Count >= 2 ? _premiumManagerNames : _managerNames;

        if (namePool.Count >= 2)
        {
            for (int attempt = 0; attempt < 100; attempt++)
            {
                string first = namePool[_rng.Next(namePool.Count)];
                string last = namePool[_rng.Next(namePool.Count)];
                string fullName = $"{first} {last}";
                if (_usedManagerNames.Add(fullName))
                    return fullName;
            }
        }

        // Fallback
        string fallback = $"Manager {Guid.NewGuid():N}"[..20];
        _usedManagerNames.Add(fallback);
        return fallback;
    }

    /// <summary>
    /// Consistent email derivation from a team name. Used by both BotFactory and BotRunner.
    /// Strips all characters except letters, digits, and underscores.
    /// </summary>
    public static string SanitizeEmail(string teamName)
    {
        var sanitized = new string(teamName
            .Replace(" ", "_")
            .ToLowerInvariant()
            .Where(c => char.IsLetterOrDigit(c) || c == '_')
            .ToArray());
        return $"bot_{sanitized}@goaltactics.bot";
    }

    private static List<string> LoadNames(string path)
    {
        if (!File.Exists(path))
            return [];

        return File.ReadAllLines(path)
            .Select(l => l.Trim())
            .Where(l => l.Length > 0)
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToList();
    }

    private static string FindFile(string filename, string baseDir)
    {
        // Check known locations: source bots/ directory, then output directory
        string[] candidates =
        [
            Path.Combine(baseDir, filename),
            Path.Combine(baseDir, "..", filename),
            Path.Combine(AppContext.BaseDirectory, "..", "..", "..", filename),
            Path.Combine(Directory.GetCurrentDirectory(), filename),
            Path.Combine(Directory.GetCurrentDirectory(), "bots", filename)
        ];

        foreach (string candidate in candidates)
        {
            string full = Path.GetFullPath(candidate);
            if (File.Exists(full))
                return full;
        }

        return Path.Combine(baseDir, filename);
    }
}
