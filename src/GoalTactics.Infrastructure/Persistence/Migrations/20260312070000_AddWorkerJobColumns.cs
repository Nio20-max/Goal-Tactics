using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260312070000_AddWorkerJobColumns")]
public partial class AddWorkerJobColumns : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.AddColumn<string>(
            name: "daily_reward_claimed_at",
            table: "users",
            nullable: true);

        migrationBuilder.AddColumn<int>(
            name: "season_number",
            table: "season_state",
            nullable: false,
            defaultValue: 0);

        migrationBuilder.AddColumn<int>(
            name: "current_matchday",
            table: "season_state",
            nullable: false,
            defaultValue: 0);

        migrationBuilder.AddColumn<string>(
            name: "started_at",
            table: "season_state",
            nullable: true);
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropColumn(name: "daily_reward_claimed_at", table: "users");
        migrationBuilder.DropColumn(name: "season_number", table: "season_state");
        migrationBuilder.DropColumn(name: "current_matchday", table: "season_state");
        migrationBuilder.DropColumn(name: "started_at", table: "season_state");
    }
}
