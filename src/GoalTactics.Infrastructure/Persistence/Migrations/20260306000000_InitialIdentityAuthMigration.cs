using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Infrastructure;
using GoalTactics.Infrastructure.Persistence;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260306000000_InitialIdentityAuthMigration")]
public partial class InitialIdentityAuthMigration : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "users",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                manager_name = table.Column<string>(type: "TEXT", maxLength: 64, nullable: false),
                email = table.Column<string>(type: "TEXT", maxLength: 256, nullable: false),
                password_hash = table.Column<string>(type: "TEXT", maxLength: 512, nullable: false),
                created_at = table.Column<DateTime>(type: "TEXT", nullable: false),
                last_login_at = table.Column<DateTime>(type: "TEXT", nullable: true),
                last_activity_at = table.Column<DateTime>(type: "TEXT", nullable: true),
                deleted_at = table.Column<DateTime>(type: "TEXT", nullable: true)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_users", x => x.id);
            });

        migrationBuilder.CreateTable(
            name: "user_sessions",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                user_id = table.Column<string>(type: "TEXT", nullable: false),
                token_id = table.Column<string>(type: "TEXT", maxLength: 64, nullable: false),
                issued_at = table.Column<DateTime>(type: "TEXT", nullable: false),
                expires_at = table.Column<DateTime>(type: "TEXT", nullable: false),
                revoked_at = table.Column<DateTime>(type: "TEXT", nullable: true),
                client_version = table.Column<string>(type: "TEXT", maxLength: 32, nullable: true),
                capabilities = table.Column<string>(type: "TEXT", maxLength: 256, nullable: true),
                platform = table.Column<string>(type: "TEXT", maxLength: 32, nullable: true),
                device_id = table.Column<string>(type: "TEXT", maxLength: 128, nullable: true)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_user_sessions", x => x.id);
                table.ForeignKey(
                    name: "FK_user_sessions_users_user_id",
                    column: x => x.user_id,
                    principalTable: "users",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateIndex(
            name: "IX_user_sessions_token_id",
            table: "user_sessions",
            column: "token_id",
            unique: true);

        migrationBuilder.CreateIndex(
            name: "IX_user_sessions_user_id",
            table: "user_sessions",
            column: "user_id");

        migrationBuilder.CreateIndex(
            name: "IX_users_email",
            table: "users",
            column: "email",
            unique: true);
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "user_sessions");
        migrationBuilder.DropTable(name: "users");
    }
}
