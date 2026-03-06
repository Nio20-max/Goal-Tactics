using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260306221500_AddLeagueSlice")]
public partial class AddLeagueSlice : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "leagues",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                tier = table.Column<int>(type: "INTEGER", nullable: false),
                group_number = table.Column<int>(type: "INTEGER", nullable: false),
                name = table.Column<string>(type: "TEXT", maxLength: 64, nullable: false),
                mount = table.Column<int>(type: "INTEGER", nullable: false),
                dismount = table.Column<int>(type: "INTEGER", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_leagues", x => x.id);
            });

        migrationBuilder.CreateTable(
            name: "league_teams",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                league_id = table.Column<string>(type: "TEXT", nullable: false),
                team_id = table.Column<string>(type: "TEXT", nullable: true),
                team_name = table.Column<string>(type: "TEXT", maxLength: 128, nullable: false),
                is_bot = table.Column<bool>(type: "INTEGER", nullable: false),
                strength = table.Column<decimal>(type: "TEXT", nullable: false),
                country = table.Column<string>(type: "TEXT", maxLength: 8, nullable: false),
                logo = table.Column<string>(type: "TEXT", maxLength: 64, nullable: false),
                is_online = table.Column<bool>(type: "INTEGER", nullable: false),
                matches_home = table.Column<int>(type: "INTEGER", nullable: false),
                matches_away = table.Column<int>(type: "INTEGER", nullable: false),
                wins_home = table.Column<int>(type: "INTEGER", nullable: false),
                wins_away = table.Column<int>(type: "INTEGER", nullable: false),
                losses_home = table.Column<int>(type: "INTEGER", nullable: false),
                losses_away = table.Column<int>(type: "INTEGER", nullable: false),
                draws_home = table.Column<int>(type: "INTEGER", nullable: false),
                draws_away = table.Column<int>(type: "INTEGER", nullable: false),
                goals_scored_home = table.Column<int>(type: "INTEGER", nullable: false),
                goals_scored_away = table.Column<int>(type: "INTEGER", nullable: false),
                goals_received_home = table.Column<int>(type: "INTEGER", nullable: false),
                goals_received_away = table.Column<int>(type: "INTEGER", nullable: false),
                points_home = table.Column<int>(type: "INTEGER", nullable: false),
                points_away = table.Column<int>(type: "INTEGER", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_league_teams", x => x.id);
                table.ForeignKey(
                    name: "FK_league_teams_leagues_league_id",
                    column: x => x.league_id,
                    principalTable: "leagues",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateIndex(name: "IX_leagues_tier_group_number", table: "leagues", columns: new[] { "tier", "group_number" }, unique: true);
        migrationBuilder.CreateIndex(name: "IX_league_teams_league_id", table: "league_teams", column: "league_id");
        migrationBuilder.CreateIndex(name: "IX_league_teams_team_id", table: "league_teams", column: "team_id");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "league_teams");
        migrationBuilder.DropTable(name: "leagues");
    }
}
