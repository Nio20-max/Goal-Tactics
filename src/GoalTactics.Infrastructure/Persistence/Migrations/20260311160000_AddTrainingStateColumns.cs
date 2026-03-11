using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260311160000_AddTrainingStateColumns")]
public partial class AddTrainingStateColumns : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.AddColumn<DateTime>(
            name: "training_changed_at_utc",
            table: "team_training_state",
            nullable: true);

        migrationBuilder.AddColumn<string>(
            name: "selected_tactic_id",
            table: "team_training_state",
            maxLength: 64,
            nullable: true);

        migrationBuilder.AddColumn<DateTime>(
            name: "selected_tactic_start_utc",
            table: "team_training_state",
            nullable: true);
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropColumn(name: "training_changed_at_utc", table: "team_training_state");
        migrationBuilder.DropColumn(name: "selected_tactic_id", table: "team_training_state");
        migrationBuilder.DropColumn(name: "selected_tactic_start_utc", table: "team_training_state");
    }
}
