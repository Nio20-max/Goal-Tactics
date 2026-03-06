using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260307013000_AddChatAndMatchPushHardening")]
public partial class AddChatAndMatchPushHardening : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "chat_messages",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                user_id = table.Column<string>(type: "TEXT", nullable: false),
                message = table.Column<string>(type: "TEXT", maxLength: 512, nullable: false),
                created_at = table.Column<DateTime>(type: "TEXT", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_chat_messages", x => x.id);
                table.ForeignKey(
                    name: "FK_chat_messages_users_user_id",
                    column: x => x.user_id,
                    principalTable: "users",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateTable(
            name: "chat_presence",
            columns: table => new
            {
                user_id = table.Column<string>(type: "TEXT", nullable: false),
                last_typing_at = table.Column<DateTime>(type: "TEXT", nullable: false),
                last_seen_at = table.Column<DateTime>(type: "TEXT", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_chat_presence", x => x.user_id);
                table.ForeignKey(
                    name: "FK_chat_presence_users_user_id",
                    column: x => x.user_id,
                    principalTable: "users",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateTable(
            name: "match_push_subscriptions",
            columns: table => new
            {
                user_id = table.Column<string>(type: "TEXT", nullable: false),
                match_id = table.Column<string>(type: "TEXT", maxLength: 64, nullable: false),
                enabled_at = table.Column<DateTime>(type: "TEXT", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_match_push_subscriptions", x => new { x.user_id, x.match_id });
                table.ForeignKey(
                    name: "FK_match_push_subscriptions_users_user_id",
                    column: x => x.user_id,
                    principalTable: "users",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateIndex(name: "IX_chat_messages_created_at", table: "chat_messages", column: "created_at");
        migrationBuilder.CreateIndex(name: "IX_chat_messages_user_id", table: "chat_messages", column: "user_id");
        migrationBuilder.CreateIndex(name: "IX_match_push_subscriptions_match_id", table: "match_push_subscriptions", column: "match_id");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "chat_messages");
        migrationBuilder.DropTable(name: "chat_presence");
        migrationBuilder.DropTable(name: "match_push_subscriptions");
    }
}
