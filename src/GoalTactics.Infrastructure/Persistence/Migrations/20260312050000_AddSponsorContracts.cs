using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260312050000_AddSponsorContracts")]
public partial class AddSponsorContracts : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "sponsor_contracts",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", maxLength: 32, nullable: false),
                team_id = table.Column<string>(type: "TEXT", maxLength: 32, nullable: false),
                type = table.Column<string>(type: "TEXT", maxLength: 16, nullable: false),
                sponsor_name = table.Column<string>(type: "TEXT", maxLength: 128, nullable: false),
                sponsor_description = table.Column<string>(type: "TEXT", maxLength: 256, nullable: true),
                base_money = table.Column<long>(type: "INTEGER", nullable: false),
                bonus_per_win = table.Column<long>(type: "INTEGER", nullable: false, defaultValue: 0L),
                bonus_per_goal = table.Column<long>(type: "INTEGER", nullable: false, defaultValue: 0L),
                stars_payout = table.Column<int>(type: "INTEGER", nullable: false, defaultValue: 0),
                start_date_utc = table.Column<DateTime>(type: "TEXT", nullable: false),
                end_date_utc = table.Column<DateTime>(type: "TEXT", nullable: false),
                is_active = table.Column<bool>(type: "INTEGER", nullable: false, defaultValue: true)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_sponsor_contracts", x => x.id);
                table.ForeignKey(
                    name: "FK_sponsor_contracts_teams_team_id",
                    column: x => x.team_id,
                    principalTable: "teams",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateIndex(
            name: "IX_sponsor_contracts_team_id_is_active",
            table: "sponsor_contracts",
            columns: new[] { "team_id", "is_active" });
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "sponsor_contracts");
    }
}
