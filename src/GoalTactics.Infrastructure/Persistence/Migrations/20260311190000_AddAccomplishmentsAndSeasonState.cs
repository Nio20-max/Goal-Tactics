using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Infrastructure;
using GoalTactics.Infrastructure.Persistence;

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260311190000_AddAccomplishmentsAndSeasonState")]
public partial class AddAccomplishmentsAndSeasonState : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "team_accomplishments",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                team_id = table.Column<string>(type: "TEXT", nullable: false),
                name = table.Column<string>(type: "TEXT", maxLength: 256, nullable: false),
                image = table.Column<string>(type: "TEXT", maxLength: 128, nullable: false),
                created_at = table.Column<DateTime>(type: "TEXT", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_team_accomplishments", x => x.id);
            });

        migrationBuilder.CreateIndex(
            name: "IX_team_accomplishments_team_id",
            table: "team_accomplishments",
            column: "team_id");

        migrationBuilder.CreateTable(
            name: "season_state",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", maxLength: 32, nullable: false),
                last_season_processed = table.Column<int>(type: "INTEGER", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_season_state", x => x.id);
            });
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "team_accomplishments");
        migrationBuilder.DropTable(name: "season_state");
    }
}
