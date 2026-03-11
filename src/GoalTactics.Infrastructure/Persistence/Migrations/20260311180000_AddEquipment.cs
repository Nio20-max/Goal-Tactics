using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Infrastructure;
using GoalTactics.Infrastructure.Persistence;

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260311180000_AddEquipment")]
public partial class AddEquipment : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "team_equipment",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                user_id = table.Column<string>(type: "TEXT", nullable: false),
                image = table.Column<string>(type: "TEXT", maxLength: 32, nullable: false),
                equipment_type = table.Column<string>(type: "TEXT", maxLength: 16, nullable: false),
                is_active = table.Column<bool>(type: "INTEGER", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_team_equipment", x => x.id);
            });

        migrationBuilder.CreateIndex(
            name: "IX_team_equipment_user_id",
            table: "team_equipment",
            column: "user_id");

        migrationBuilder.AddColumn<string>(
            name: "selected_shirt",
            table: "teams",
            type: "TEXT",
            maxLength: 32,
            nullable: true);

        migrationBuilder.AddColumn<string>(
            name: "selected_emblem",
            table: "teams",
            type: "TEXT",
            maxLength: 32,
            nullable: true);
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "team_equipment");
        migrationBuilder.DropColumn(name: "selected_shirt", table: "teams");
        migrationBuilder.DropColumn(name: "selected_emblem", table: "teams");
    }
}
