using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260315001000_AddTeamSkillCards")]
public partial class AddTeamSkillCards : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "team_skill_cards",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                team_id = table.Column<string>(type: "TEXT", nullable: false),
                skill = table.Column<int>(type: "INTEGER", nullable: false),
                rarity = table.Column<int>(type: "INTEGER", nullable: false),
                count = table.Column<int>(type: "INTEGER", nullable: false),
                bonus = table.Column<decimal>(type: "TEXT", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_team_skill_cards", x => x.id);
                table.ForeignKey(
                    name: "FK_team_skill_cards_teams_team_id",
                    column: x => x.team_id,
                    principalTable: "teams",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateIndex(
            name: "IX_team_skill_cards_team_id",
            table: "team_skill_cards",
            column: "team_id");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "team_skill_cards");
    }
}
