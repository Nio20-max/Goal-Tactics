using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260311113000_AddSponsorAndConstructionState")]
public partial class AddSponsorAndConstructionState : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.AddColumn<DateTime>(
            name: "last_sponsor_payout_utc",
            table: "team_resources",
            type: "TEXT",
            nullable: true);

        migrationBuilder.AddColumn<string>(
            name: "active_construction_id",
            table: "team_resources",
            type: "TEXT",
            maxLength: 64,
            nullable: true);

        migrationBuilder.AddColumn<string>(
            name: "active_construction_place_id",
            table: "team_resources",
            type: "TEXT",
            maxLength: 64,
            nullable: true);

        migrationBuilder.AddColumn<string>(
            name: "active_construction_type",
            table: "team_resources",
            type: "TEXT",
            maxLength: 64,
            nullable: true);

        migrationBuilder.AddColumn<int>(
            name: "active_construction_current_value",
            table: "team_resources",
            type: "INTEGER",
            nullable: false,
            defaultValue: 0);

        migrationBuilder.AddColumn<int>(
            name: "active_construction_new_value",
            table: "team_resources",
            type: "INTEGER",
            nullable: false,
            defaultValue: 0);

        migrationBuilder.AddColumn<decimal>(
            name: "active_construction_upgrade_cost",
            table: "team_resources",
            type: "TEXT",
            nullable: false,
            defaultValue: 0m);

        migrationBuilder.AddColumn<decimal>(
            name: "active_construction_upgrade_cost_premium",
            table: "team_resources",
            type: "TEXT",
            nullable: false,
            defaultValue: 0m);

        migrationBuilder.AddColumn<DateTime>(
            name: "active_construction_start_utc",
            table: "team_resources",
            type: "TEXT",
            nullable: true);

        migrationBuilder.AddColumn<DateTime>(
            name: "active_construction_end_utc",
            table: "team_resources",
            type: "TEXT",
            nullable: true);
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropColumn(name: "last_sponsor_payout_utc", table: "team_resources");
        migrationBuilder.DropColumn(name: "active_construction_id", table: "team_resources");
        migrationBuilder.DropColumn(name: "active_construction_place_id", table: "team_resources");
        migrationBuilder.DropColumn(name: "active_construction_type", table: "team_resources");
        migrationBuilder.DropColumn(name: "active_construction_current_value", table: "team_resources");
        migrationBuilder.DropColumn(name: "active_construction_new_value", table: "team_resources");
        migrationBuilder.DropColumn(name: "active_construction_upgrade_cost", table: "team_resources");
        migrationBuilder.DropColumn(name: "active_construction_upgrade_cost_premium", table: "team_resources");
        migrationBuilder.DropColumn(name: "active_construction_start_utc", table: "team_resources");
        migrationBuilder.DropColumn(name: "active_construction_end_utc", table: "team_resources");
    }
}