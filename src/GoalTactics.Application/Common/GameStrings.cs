namespace GoalTactics.Application.Common;

/// <summary>
/// Centralised German UI strings used throughout the backend.
/// This class serves as the single extraction point for future localization.
/// When adding l10n support, replace these constants with resource-backed lookups
/// using IStringLocalizer or a similar mechanism.
/// </summary>
public static class GameStrings
{
    // ──── Building names ────
    public const string Office = "Geschäftsstelle";
    public const string TrainingCenter = "Trainingsgelände";
    public const string MedicalCenter = "Fitnessstudio";
    public const string YouthAcademy = "Jugendzentrum";
    public const string FanShop = "Fanshop";
    public const string Parking = "Parkplätze";
    public const string StadiumVips = "VIP-Logen";
    public const string StadiumSeats = "Sitzplätze";
    public const string StadiumStands = "Stehplätze";

    // ──── Finance ledger categories ────
    public const string MainSponsor = "Hauptsponsor";
    public const string SecondarySponsor = "Nebensponsor";
    public const string Spectators = "Zuschauer";
    public const string PlayerSalaries = "Spielergehälter";
    public const string Stadium = "Stadion";

    // ──── Finance ledger descriptions ────
    public const string BaseAmount = "Grundbetrag";
    public const string WinBonus = "Siegprämie";
    public const string GoalBonus = "Torprämie";
    public const string GateReceipts = "Eintrittsgelder";

    // ──── Positions ────
    public const string Goalkeeper = "Torwart";
    public const string Defence = "Verteidigung";
    public const string Midfield = "Mittelfeld";
    public const string Attack = "Angriff";

    // ──── Months ────
    public static readonly string[] Months =
        ["Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"];

    // ──── Construction news ────
    public const string BuildingUpgradeTitle = "Gebäude ausbauen";
    public const string BuildingCompleteTitle = "Ausbau fertiggestellt";

    // ──── Accomplishment keys ────
    public const string FounderPrefix = "Gründer";
    public const string ChampionshipPrefix = "Meisterschaft";
    public const string TopScorerPrefix = "Torschützenkönig";
}
