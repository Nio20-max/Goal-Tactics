using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260315003000_AddPlayerSkillStatsAndMarketValue")]
public partial class AddPlayerSkillStatsAndMarketValue : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.AddColumn<decimal>(
            name: "market_value",
            table: "team_players",
            type: "TEXT",
            nullable: false,
            defaultValue: 0m);

        migrationBuilder.AddColumn<decimal>(name: "skill_0", table: "team_players", type: "TEXT", nullable: false, defaultValue: 0m);
        migrationBuilder.AddColumn<decimal>(name: "skill_1", table: "team_players", type: "TEXT", nullable: false, defaultValue: 0m);
        migrationBuilder.AddColumn<decimal>(name: "skill_2", table: "team_players", type: "TEXT", nullable: false, defaultValue: 0m);
        migrationBuilder.AddColumn<decimal>(name: "skill_3", table: "team_players", type: "TEXT", nullable: false, defaultValue: 0m);
        migrationBuilder.AddColumn<decimal>(name: "skill_4", table: "team_players", type: "TEXT", nullable: false, defaultValue: 0m);
        migrationBuilder.AddColumn<decimal>(name: "skill_5", table: "team_players", type: "TEXT", nullable: false, defaultValue: 0m);
        migrationBuilder.AddColumn<decimal>(name: "skill_6", table: "team_players", type: "TEXT", nullable: false, defaultValue: 0m);
        migrationBuilder.AddColumn<decimal>(name: "skill_7", table: "team_players", type: "TEXT", nullable: false, defaultValue: 0m);
        migrationBuilder.AddColumn<decimal>(name: "skill_8", table: "team_players", type: "TEXT", nullable: false, defaultValue: 0m);
        migrationBuilder.AddColumn<decimal>(name: "skill_9", table: "team_players", type: "TEXT", nullable: false, defaultValue: 0m);
        migrationBuilder.AddColumn<decimal>(name: "skill_10", table: "team_players", type: "TEXT", nullable: false, defaultValue: 0m);
        migrationBuilder.AddColumn<decimal>(name: "skill_11", table: "team_players", type: "TEXT", nullable: false, defaultValue: 0m);
        migrationBuilder.AddColumn<decimal>(name: "skill_12", table: "team_players", type: "TEXT", nullable: false, defaultValue: 0m);
        migrationBuilder.AddColumn<decimal>(name: "skill_13", table: "team_players", type: "TEXT", nullable: false, defaultValue: 0m);
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropColumn(name: "market_value", table: "team_players");
        migrationBuilder.DropColumn(name: "skill_0", table: "team_players");
        migrationBuilder.DropColumn(name: "skill_1", table: "team_players");
        migrationBuilder.DropColumn(name: "skill_2", table: "team_players");
        migrationBuilder.DropColumn(name: "skill_3", table: "team_players");
        migrationBuilder.DropColumn(name: "skill_4", table: "team_players");
        migrationBuilder.DropColumn(name: "skill_5", table: "team_players");
        migrationBuilder.DropColumn(name: "skill_6", table: "team_players");
        migrationBuilder.DropColumn(name: "skill_7", table: "team_players");
        migrationBuilder.DropColumn(name: "skill_8", table: "team_players");
        migrationBuilder.DropColumn(name: "skill_9", table: "team_players");
        migrationBuilder.DropColumn(name: "skill_10", table: "team_players");
        migrationBuilder.DropColumn(name: "skill_11", table: "team_players");
        migrationBuilder.DropColumn(name: "skill_12", table: "team_players");
        migrationBuilder.DropColumn(name: "skill_13", table: "team_players");
    }
}
