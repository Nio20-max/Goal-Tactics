using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260311170000_AddFinanceLedger")]
public partial class AddFinanceLedger : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "team_finance_ledger",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                user_id = table.Column<string>(type: "TEXT", nullable: false),
                matchday = table.Column<int>(type: "INTEGER", nullable: false),
                date = table.Column<DateTime>(type: "TEXT", nullable: false),
                booking_type = table.Column<string>(type: "TEXT", maxLength: 64, nullable: false),
                value = table.Column<decimal>(type: "TEXT", nullable: false),
                description = table.Column<string>(type: "TEXT", maxLength: 256, nullable: false),
                is_earning = table.Column<bool>(type: "INTEGER", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_team_finance_ledger", x => x.id);
            });

        migrationBuilder.CreateIndex(
            name: "IX_team_finance_ledger_user_id_matchday",
            table: "team_finance_ledger",
            columns: new[] { "user_id", "matchday" });
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "team_finance_ledger");
    }
}
