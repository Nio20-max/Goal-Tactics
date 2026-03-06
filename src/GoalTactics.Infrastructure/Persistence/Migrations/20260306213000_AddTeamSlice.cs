using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260306213000_AddTeamSlice")]
public partial class AddTeamSlice : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "teams",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                user_id = table.Column<string>(type: "TEXT", nullable: false),
                name = table.Column<string>(type: "TEXT", maxLength: 64, nullable: false),
                country = table.Column<string>(type: "TEXT", maxLength: 8, nullable: false),
                country_name = table.Column<string>(type: "TEXT", maxLength: 64, nullable: false),
                league_name = table.Column<string>(type: "TEXT", maxLength: 64, nullable: false),
                market_value = table.Column<decimal>(type: "TEXT", nullable: false),
                mood = table.Column<int>(type: "INTEGER", nullable: false),
                team_mood = table.Column<string>(type: "TEXT", maxLength: 32, nullable: false),
                wins = table.Column<int>(type: "INTEGER", nullable: false),
                losses = table.Column<int>(type: "INTEGER", nullable: false),
                fans = table.Column<int>(type: "INTEGER", nullable: false),
                members = table.Column<int>(type: "INTEGER", nullable: false),
                strength = table.Column<int>(type: "INTEGER", nullable: false),
                match_trend = table.Column<string>(type: "TEXT", maxLength: 32, nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_teams", x => x.id);
                table.ForeignKey(
                    name: "FK_teams_users_user_id",
                    column: x => x.user_id,
                    principalTable: "users",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateTable(
            name: "team_finance_history",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                user_id = table.Column<string>(type: "TEXT", nullable: false),
                date = table.Column<DateTime>(type: "TEXT", nullable: false),
                income = table.Column<decimal>(type: "TEXT", nullable: false),
                outcome = table.Column<decimal>(type: "TEXT", nullable: false),
                balance = table.Column<decimal>(type: "TEXT", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_team_finance_history", x => x.id);
            });

        migrationBuilder.CreateTable(
            name: "team_mail",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                user_id = table.Column<string>(type: "TEXT", nullable: false),
                date_text = table.Column<string>(type: "TEXT", maxLength: 64, nullable: false),
                subject = table.Column<string>(type: "TEXT", maxLength: 256, nullable: false),
                sender = table.Column<string>(type: "TEXT", maxLength: 128, nullable: false),
                message = table.Column<string>(type: "TEXT", maxLength: 4096, nullable: false),
                extra = table.Column<string>(type: "TEXT", maxLength: 1024, nullable: false),
                is_new = table.Column<bool>(type: "INTEGER", nullable: false),
                sender_type = table.Column<int>(type: "INTEGER", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_team_mail", x => x.id);
            });

        migrationBuilder.CreateTable(
            name: "team_news",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                team_id = table.Column<string>(type: "TEXT", nullable: false),
                date_text = table.Column<string>(type: "TEXT", maxLength: 64, nullable: false),
                title = table.Column<string>(type: "TEXT", maxLength: 128, nullable: false),
                text = table.Column<string>(type: "TEXT", maxLength: 2048, nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_team_news", x => x.id);
            });

        migrationBuilder.CreateTable(
            name: "team_resources",
            columns: table => new
            {
                team_id = table.Column<string>(type: "TEXT", nullable: false),
                money = table.Column<decimal>(type: "TEXT", nullable: false),
                medipacks = table.Column<decimal>(type: "TEXT", nullable: false),
                gt_stars = table.Column<decimal>(type: "TEXT", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_team_resources", x => x.team_id);
                table.ForeignKey(
                    name: "FK_team_resources_teams_team_id",
                    column: x => x.team_id,
                    principalTable: "teams",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateIndex(name: "IX_teams_user_id", table: "teams", column: "user_id", unique: true);
        migrationBuilder.CreateIndex(name: "IX_team_finance_history_user_id", table: "team_finance_history", column: "user_id");
        migrationBuilder.CreateIndex(name: "IX_team_mail_user_id", table: "team_mail", column: "user_id");
        migrationBuilder.CreateIndex(name: "IX_team_news_team_id", table: "team_news", column: "team_id");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "team_finance_history");
        migrationBuilder.DropTable(name: "team_mail");
        migrationBuilder.DropTable(name: "team_news");
        migrationBuilder.DropTable(name: "team_resources");
        migrationBuilder.DropTable(name: "teams");
    }
}
