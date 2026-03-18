using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260318181000_AddChatChannelsAndPrivateScopes")]
public partial class AddChatChannelsAndPrivateScopes : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.AddColumn<string>(
            name: "channel",
            table: "chat_messages",
            type: "TEXT",
            maxLength: 16,
            nullable: false,
            defaultValue: "global");

        migrationBuilder.AddColumn<string>(
            name: "group_key",
            table: "chat_messages",
            type: "TEXT",
            maxLength: 64,
            nullable: true);

        migrationBuilder.AddColumn<string>(
            name: "target_user_id",
            table: "chat_messages",
            type: "TEXT",
            maxLength: 32,
            nullable: true);

        migrationBuilder.CreateIndex(
            name: "IX_chat_messages_channel",
            table: "chat_messages",
            column: "channel");

        migrationBuilder.CreateIndex(
            name: "IX_chat_messages_group_key",
            table: "chat_messages",
            column: "group_key");

        migrationBuilder.CreateIndex(
            name: "IX_chat_messages_target_user_id",
            table: "chat_messages",
            column: "target_user_id");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropIndex(name: "IX_chat_messages_channel", table: "chat_messages");
        migrationBuilder.DropIndex(name: "IX_chat_messages_group_key", table: "chat_messages");
        migrationBuilder.DropIndex(name: "IX_chat_messages_target_user_id", table: "chat_messages");

        migrationBuilder.DropColumn(name: "channel", table: "chat_messages");
        migrationBuilder.DropColumn(name: "group_key", table: "chat_messages");
        migrationBuilder.DropColumn(name: "target_user_id", table: "chat_messages");
    }
}
