using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260312060000_AddLadderGoalTracking")]
public partial class AddLadderGoalTracking : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.AddColumn<int>(
            name: "played",
            table: "ladder_entries",
            nullable: false,
            defaultValue: 0);

        migrationBuilder.AddColumn<int>(
            name: "goals_scored",
            table: "ladder_entries",
            nullable: false,
            defaultValue: 0);

        migrationBuilder.AddColumn<int>(
            name: "goals_received",
            table: "ladder_entries",
            nullable: false,
            defaultValue: 0);
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropColumn(name: "played", table: "ladder_entries");
        migrationBuilder.DropColumn(name: "goals_scored", table: "ladder_entries");
        migrationBuilder.DropColumn(name: "goals_received", table: "ladder_entries");
    }
}
