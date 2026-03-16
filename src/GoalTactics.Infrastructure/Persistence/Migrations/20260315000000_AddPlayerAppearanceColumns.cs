using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260315000000_AddPlayerAppearanceColumns")]
public partial class AddPlayerAppearanceColumns : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.AddColumn<string>(
            name: "body",
            table: "team_players",
            maxLength: 32,
            nullable: false,
            defaultValue: "01_body-A00");

        migrationBuilder.AddColumn<string>(
            name: "gloves",
            table: "team_players",
            maxLength: 32,
            nullable: false,
            defaultValue: "01_Gloves01");

        migrationBuilder.AddColumn<string>(
            name: "shoes",
            table: "team_players",
            maxLength: 32,
            nullable: false,
            defaultValue: "01_Shoes01");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropColumn(name: "body", table: "team_players");
        migrationBuilder.DropColumn(name: "gloves", table: "team_players");
        migrationBuilder.DropColumn(name: "shoes", table: "team_players");
    }
}
