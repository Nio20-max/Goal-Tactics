using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260312040000_AddScoutingReadyAtAndHead")]
public partial class AddScoutingReadyAtAndHead : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.AddColumn<string>(
            name: "scouting_ready_at_utc",
            table: "team_players",
            nullable: true);

        migrationBuilder.AddColumn<string>(
            name: "head",
            table: "team_players",
            maxLength: 32,
            nullable: false,
            defaultValue: "01_head-A01");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropColumn(name: "scouting_ready_at_utc", table: "team_players");
        migrationBuilder.DropColumn(name: "head", table: "team_players");
    }
}
