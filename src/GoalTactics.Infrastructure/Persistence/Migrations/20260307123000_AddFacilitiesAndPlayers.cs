using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260307123000_AddFacilitiesAndPlayers")]
public partial class AddFacilitiesAndPlayers : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.AddColumn<string>(
            name: "stadium_name",
            table: "teams",
            type: "TEXT",
            maxLength: 96,
            nullable: false,
            defaultValue: "My Stadium");

        migrationBuilder.AddColumn<int>(
            name: "grass_quality",
            table: "teams",
            type: "INTEGER",
            nullable: false,
            defaultValue: 80);

        migrationBuilder.AddColumn<int>(
            name: "league_tier",
            table: "teams",
            type: "INTEGER",
            nullable: false,
            defaultValue: 4);

        migrationBuilder.AddColumn<int>(name: "office_level", table: "team_resources", type: "INTEGER", nullable: false, defaultValue: 1);
        migrationBuilder.AddColumn<int>(name: "training_center_level", table: "team_resources", type: "INTEGER", nullable: false, defaultValue: 1);
        migrationBuilder.AddColumn<int>(name: "medical_center_level", table: "team_resources", type: "INTEGER", nullable: false, defaultValue: 1);
        migrationBuilder.AddColumn<int>(name: "youth_academy_level", table: "team_resources", type: "INTEGER", nullable: false, defaultValue: 1);
        migrationBuilder.AddColumn<int>(name: "fan_shop_level", table: "team_resources", type: "INTEGER", nullable: false, defaultValue: 1);
        migrationBuilder.AddColumn<int>(name: "parking_level", table: "team_resources", type: "INTEGER", nullable: false, defaultValue: 1);
        migrationBuilder.AddColumn<int>(name: "stadium_vip_seats", table: "team_resources", type: "INTEGER", nullable: false, defaultValue: 200);
        migrationBuilder.AddColumn<int>(name: "stadium_sit_seats", table: "team_resources", type: "INTEGER", nullable: false, defaultValue: 2500);
        migrationBuilder.AddColumn<int>(name: "stadium_stand_seats", table: "team_resources", type: "INTEGER", nullable: false, defaultValue: 2300);
        migrationBuilder.AddColumn<long>(name: "stadium_visitors_last_match", table: "team_resources", type: "INTEGER", nullable: false, defaultValue: 0L);
        migrationBuilder.AddColumn<long>(name: "stadium_visitors_total", table: "team_resources", type: "INTEGER", nullable: false, defaultValue: 0L);
        migrationBuilder.AddColumn<decimal>(name: "stadium_earnings_last_match", table: "team_resources", type: "TEXT", nullable: false, defaultValue: 0m);
        migrationBuilder.AddColumn<decimal>(name: "stadium_earnings_total", table: "team_resources", type: "TEXT", nullable: false, defaultValue: 0m);
        migrationBuilder.AddColumn<int>(name: "stadium_matches_count", table: "team_resources", type: "INTEGER", nullable: false, defaultValue: 0);
        migrationBuilder.AddColumn<DateTime>(name: "last_economy_tick_utc", table: "team_resources", type: "TEXT", nullable: true);
        migrationBuilder.AddColumn<DateTime>(name: "last_training_tick_utc", table: "team_resources", type: "TEXT", nullable: true);
        migrationBuilder.AddColumn<int>(name: "progress_day_counter", table: "team_resources", type: "INTEGER", nullable: false, defaultValue: 0);

        migrationBuilder.CreateTable(
            name: "team_players",
            columns: table => new
            {
                id = table.Column<string>(type: "TEXT", nullable: false),
                team_id = table.Column<string>(type: "TEXT", nullable: false),
                name = table.Column<string>(type: "TEXT", maxLength: 64, nullable: false),
                origin = table.Column<string>(type: "TEXT", maxLength: 8, nullable: false),
                position = table.Column<string>(type: "TEXT", maxLength: 8, nullable: false),
                shirt_number = table.Column<int>(type: "INTEGER", nullable: false),
                age = table.Column<int>(type: "INTEGER", nullable: false),
                talent = table.Column<int>(type: "INTEGER", nullable: false),
                strength = table.Column<decimal>(type: "TEXT", nullable: false),
                fitness = table.Column<int>(type: "INTEGER", nullable: false),
                matches = table.Column<int>(type: "INTEGER", nullable: false),
                goals = table.Column<int>(type: "INTEGER", nullable: false),
                yellow_cards = table.Column<int>(type: "INTEGER", nullable: false),
                red_cards = table.Column<int>(type: "INTEGER", nullable: false),
                individual_training_skill = table.Column<string>(type: "TEXT", maxLength: 32, nullable: true),
                individual_training_until_utc = table.Column<DateTime>(type: "TEXT", nullable: true)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_team_players", x => x.id);
                table.ForeignKey(
                    name: "FK_team_players_teams_team_id",
                    column: x => x.team_id,
                    principalTable: "teams",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateTable(
            name: "team_training_state",
            columns: table => new
            {
                team_id = table.Column<string>(type: "TEXT", nullable: false),
                main_skill_index = table.Column<int>(type: "INTEGER", nullable: false),
                sub_skill_index = table.Column<int>(type: "INTEGER", nullable: false),
                camp_type = table.Column<string>(type: "TEXT", maxLength: 32, nullable: false),
                camp_active_until_utc = table.Column<DateTime>(type: "TEXT", nullable: true)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_team_training_state", x => x.team_id);
                table.ForeignKey(
                    name: "FK_team_training_state_teams_team_id",
                    column: x => x.team_id,
                    principalTable: "teams",
                    principalColumn: "id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateIndex(name: "IX_team_players_team_id", table: "team_players", column: "team_id");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "team_players");
        migrationBuilder.DropTable(name: "team_training_state");

        migrationBuilder.DropColumn(name: "stadium_name", table: "teams");
        migrationBuilder.DropColumn(name: "grass_quality", table: "teams");
        migrationBuilder.DropColumn(name: "league_tier", table: "teams");

        migrationBuilder.DropColumn(name: "office_level", table: "team_resources");
        migrationBuilder.DropColumn(name: "training_center_level", table: "team_resources");
        migrationBuilder.DropColumn(name: "medical_center_level", table: "team_resources");
        migrationBuilder.DropColumn(name: "youth_academy_level", table: "team_resources");
        migrationBuilder.DropColumn(name: "fan_shop_level", table: "team_resources");
        migrationBuilder.DropColumn(name: "parking_level", table: "team_resources");
        migrationBuilder.DropColumn(name: "stadium_vip_seats", table: "team_resources");
        migrationBuilder.DropColumn(name: "stadium_sit_seats", table: "team_resources");
        migrationBuilder.DropColumn(name: "stadium_stand_seats", table: "team_resources");
        migrationBuilder.DropColumn(name: "stadium_visitors_last_match", table: "team_resources");
        migrationBuilder.DropColumn(name: "stadium_visitors_total", table: "team_resources");
        migrationBuilder.DropColumn(name: "stadium_earnings_last_match", table: "team_resources");
        migrationBuilder.DropColumn(name: "stadium_earnings_total", table: "team_resources");
        migrationBuilder.DropColumn(name: "stadium_matches_count", table: "team_resources");
        migrationBuilder.DropColumn(name: "last_economy_tick_utc", table: "team_resources");
        migrationBuilder.DropColumn(name: "last_training_tick_utc", table: "team_resources");
        migrationBuilder.DropColumn(name: "progress_day_counter", table: "team_resources");
    }
}
