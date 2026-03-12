using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260312020000_AddAuctionTables")]
public partial class AddAuctionTables : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "auctions",
            columns: table => new
            {
                id = table.Column<string>(nullable: false),
                player_id = table.Column<string>(nullable: true),
                seller_team_id = table.Column<string>(nullable: true),
                player_name = table.Column<string>(maxLength: 128, nullable: false),
                player_country = table.Column<string>(maxLength: 8, nullable: false),
                player_head = table.Column<string>(maxLength: 32, nullable: false),
                player_position = table.Column<int>(nullable: false),
                player_strength = table.Column<decimal>(nullable: false),
                player_talent = table.Column<int>(nullable: false),
                player_age = table.Column<int>(nullable: false),
                minimum_bid = table.Column<long>(nullable: false),
                current_bid = table.Column<long>(nullable: false),
                current_bidder_team_id = table.Column<string>(nullable: true),
                current_bidder_team_name = table.Column<string>(maxLength: 128, nullable: true),
                current_bidder_team_logo = table.Column<string>(maxLength: 64, nullable: true),
                end_date_utc = table.Column<string>(nullable: false),
                status = table.Column<string>(maxLength: 16, nullable: false),
                created_at = table.Column<string>(nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_auctions", x => x.id);
            });

        migrationBuilder.CreateIndex(name: "IX_auctions_status", table: "auctions", column: "status");
        migrationBuilder.CreateIndex(name: "IX_auctions_end_date_utc", table: "auctions", column: "end_date_utc");
        migrationBuilder.CreateIndex(name: "IX_auctions_seller_team_id", table: "auctions", column: "seller_team_id");

        migrationBuilder.CreateTable(
            name: "auction_bids",
            columns: table => new
            {
                id = table.Column<string>(nullable: false),
                auction_id = table.Column<string>(nullable: false),
                team_id = table.Column<string>(nullable: false),
                team_name = table.Column<string>(maxLength: 128, nullable: true),
                amount = table.Column<long>(nullable: false),
                created_at = table.Column<string>(nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_auction_bids", x => x.id);
                table.ForeignKey(
                    name: "FK_auction_bids_auctions_auction_id",
                    column: x => x.auction_id,
                    principalTable: "auctions",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateIndex(name: "IX_auction_bids_auction_id", table: "auction_bids", column: "auction_id");

        migrationBuilder.CreateTable(
            name: "auction_favorites",
            columns: table => new
            {
                user_id = table.Column<string>(nullable: false),
                auction_id = table.Column<string>(nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_auction_favorites", x => new { x.user_id, x.auction_id });
                table.ForeignKey(
                    name: "FK_auction_favorites_auctions_auction_id",
                    column: x => x.auction_id,
                    principalTable: "auctions",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateIndex(name: "IX_auction_favorites_user_id", table: "auction_favorites", column: "user_id");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "auction_favorites");
        migrationBuilder.DropTable(name: "auction_bids");
        migrationBuilder.DropTable(name: "auctions");
    }
}
