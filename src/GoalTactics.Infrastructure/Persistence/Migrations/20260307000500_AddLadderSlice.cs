using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260307000500_AddLadderSlice")]
public partial class AddLadderSlice : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "ladder_seasons",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                end_date = table.Column<DateTime>(type: "TEXT", nullable: false),
                created_at = table.Column<DateTime>(type: "TEXT", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_ladder_seasons", x => x.id);
            });

        migrationBuilder.CreateTable(
            name: "ladder_entries",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                ladder_id = table.Column<string>(type: "TEXT", nullable: false),
                team_id = table.Column<string>(type: "TEXT", nullable: true),
                team_name = table.Column<string>(type: "TEXT", maxLength: 128, nullable: false),
                team_logo = table.Column<string>(type: "TEXT", maxLength: 64, nullable: false),
                points = table.Column<int>(type: "INTEGER", nullable: false),
                rank = table.Column<int>(type: "INTEGER", nullable: false),
                stamina = table.Column<int>(type: "INTEGER", nullable: false),
                strength = table.Column<int>(type: "INTEGER", nullable: false),
                is_bot = table.Column<bool>(type: "INTEGER", nullable: false),
                updated_at = table.Column<DateTime>(type: "TEXT", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_ladder_entries", x => x.id);
                table.ForeignKey(
                    name: "FK_ladder_entries_ladder_seasons_ladder_id",
                    column: x => x.ladder_id,
                    principalTable: "ladder_seasons",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateIndex(name: "IX_ladder_seasons_end_date", table: "ladder_seasons", column: "end_date");
        migrationBuilder.CreateIndex(name: "IX_ladder_entries_ladder_id", table: "ladder_entries", column: "ladder_id");
        migrationBuilder.CreateIndex(name: "IX_ladder_entries_team_id", table: "ladder_entries", column: "team_id");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "ladder_entries");
        migrationBuilder.DropTable(name: "ladder_seasons");
    }
}
