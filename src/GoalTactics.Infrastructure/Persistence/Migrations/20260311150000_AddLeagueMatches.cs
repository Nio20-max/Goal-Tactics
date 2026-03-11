using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260311150000_AddLeagueMatches")]
public partial class AddLeagueMatches : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "league_matches",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                league_id = table.Column<string>(type: "TEXT", nullable: false),
                matchday = table.Column<int>(type: "INTEGER", nullable: false),
                home_league_team_id = table.Column<string>(type: "TEXT", nullable: false),
                away_league_team_id = table.Column<string>(type: "TEXT", nullable: false),
                home_team_name = table.Column<string>(type: "TEXT", maxLength: 128, nullable: true),
                away_team_name = table.Column<string>(type: "TEXT", maxLength: 128, nullable: true),
                home_logo = table.Column<string>(type: "TEXT", maxLength: 64, nullable: true),
                away_logo = table.Column<string>(type: "TEXT", maxLength: 64, nullable: true),
                home_country = table.Column<string>(type: "TEXT", maxLength: 8, nullable: true),
                away_country = table.Column<string>(type: "TEXT", maxLength: 8, nullable: true),
                home_strength = table.Column<int>(type: "INTEGER", nullable: false),
                away_strength = table.Column<int>(type: "INTEGER", nullable: false),
                home_score = table.Column<int>(type: "INTEGER", nullable: true),
                away_score = table.Column<int>(type: "INTEGER", nullable: true),
                is_played = table.Column<bool>(type: "INTEGER", nullable: false, defaultValue: false),
                scheduled_date_utc = table.Column<DateTime>(type: "TEXT", nullable: false),
                played_at_utc = table.Column<DateTime>(type: "TEXT", nullable: true)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_league_matches", x => x.id);
                table.ForeignKey(
                    name: "FK_league_matches_leagues_league_id",
                    column: x => x.league_id,
                    principalTable: "leagues",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateIndex(
            name: "IX_league_matches_league_id",
            table: "league_matches",
            column: "league_id");

        migrationBuilder.CreateIndex(
            name: "IX_league_matches_league_id_matchday",
            table: "league_matches",
            columns: new[] { "league_id", "matchday" });
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "league_matches");
    }
}
