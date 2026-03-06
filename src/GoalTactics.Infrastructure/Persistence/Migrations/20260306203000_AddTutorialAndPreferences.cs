using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260306203000_AddTutorialAndPreferences")]
public partial class AddTutorialAndPreferences : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "tutorial_states",
            columns: table => new
            {
                user_id = table.Column<string>(type: "TEXT", nullable: false),
                current_topic_id = table.Column<string>(type: "TEXT", maxLength: 128, nullable: true),
                updated_at = table.Column<DateTime>(type: "TEXT", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_tutorial_states", x => x.user_id);
                table.ForeignKey(
                    name: "FK_tutorial_states_users_user_id",
                    column: x => x.user_id,
                    principalTable: "users",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateTable(
            name: "user_preferences",
            columns: table => new
            {
                user_id = table.Column<string>(type: "TEXT", nullable: false),
                auction_overbid = table.Column<bool>(type: "INTEGER", nullable: false),
                match_results = table.Column<bool>(type: "INTEGER", nullable: false),
                lineup_incomplete = table.Column<bool>(type: "INTEGER", nullable: false),
                friend_invite = table.Column<bool>(type: "INTEGER", nullable: false),
                ineffective_training = table.Column<bool>(type: "INTEGER", nullable: false),
                friendly_match = table.Column<bool>(type: "INTEGER", nullable: false),
                system_notifications = table.Column<bool>(type: "INTEGER", nullable: false),
                auction_end = table.Column<bool>(type: "INTEGER", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_user_preferences", x => x.user_id);
                table.ForeignKey(
                    name: "FK_user_preferences_users_user_id",
                    column: x => x.user_id,
                    principalTable: "users",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "tutorial_states");
        migrationBuilder.DropTable(name: "user_preferences");
    }
}
