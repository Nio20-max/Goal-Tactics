using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260306234500_AddFriendsSlice")]
public partial class AddFriendsSlice : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "friend_relations",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                pair_key = table.Column<string>(type: "TEXT", maxLength: 80, nullable: false),
                requester_user_id = table.Column<string>(type: "TEXT", nullable: false),
                addressee_user_id = table.Column<string>(type: "TEXT", nullable: false),
                status = table.Column<int>(type: "INTEGER", nullable: false),
                is_liked_by_requester = table.Column<bool>(type: "INTEGER", nullable: false),
                created_at = table.Column<DateTime>(type: "TEXT", nullable: false),
                updated_at = table.Column<DateTime>(type: "TEXT", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_friend_relations", x => x.id);
            });

        migrationBuilder.CreateTable(
            name: "friendly_challenges",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                home_user_id = table.Column<string>(type: "TEXT", nullable: false),
                away_user_id = table.Column<string>(type: "TEXT", nullable: false),
                home_team_id = table.Column<string>(type: "TEXT", nullable: false),
                away_team_id = table.Column<string>(type: "TEXT", nullable: false),
                status = table.Column<int>(type: "INTEGER", nullable: false),
                match_date = table.Column<DateTime>(type: "TEXT", nullable: false),
                end_date = table.Column<DateTime>(type: "TEXT", nullable: false),
                created_at = table.Column<DateTime>(type: "TEXT", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_friendly_challenges", x => x.id);
            });

        migrationBuilder.CreateIndex(name: "IX_friend_relations_pair_key", table: "friend_relations", column: "pair_key", unique: true);
        migrationBuilder.CreateIndex(name: "IX_friend_relations_requester_user_id", table: "friend_relations", column: "requester_user_id");
        migrationBuilder.CreateIndex(name: "IX_friend_relations_addressee_user_id", table: "friend_relations", column: "addressee_user_id");
        migrationBuilder.CreateIndex(name: "IX_friendly_challenges_home_user_id", table: "friendly_challenges", column: "home_user_id");
        migrationBuilder.CreateIndex(name: "IX_friendly_challenges_away_user_id", table: "friendly_challenges", column: "away_user_id");
        migrationBuilder.CreateIndex(name: "IX_friendly_challenges_match_date", table: "friendly_challenges", column: "match_date");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "friendly_challenges");
        migrationBuilder.DropTable(name: "friend_relations");
    }
}
