using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GoalTactics.Infrastructure.Persistence.Migrations;

[DbContext(typeof(GoalTacticsDbContext))]
[Migration("20260312030000_AddAuthHardeningColumns")]
public partial class AddAuthHardeningColumns : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        // User lockout and email verification columns
        migrationBuilder.AddColumn<int>(
            name: "failed_login_attempts",
            table: "users",
            nullable: false,
            defaultValue: 0);

        migrationBuilder.AddColumn<string>(
            name: "locked_until",
            table: "users",
            nullable: true);

        migrationBuilder.AddColumn<bool>(
            name: "email_verified",
            table: "users",
            nullable: false,
            defaultValue: false);

        migrationBuilder.AddColumn<string>(
            name: "email_verification_token",
            table: "users",
            maxLength: 128,
            nullable: true);

        migrationBuilder.AddColumn<string>(
            name: "email_verification_token_expires",
            table: "users",
            nullable: true);

        migrationBuilder.AddColumn<string>(
            name: "password_reset_token",
            table: "users",
            maxLength: 128,
            nullable: true);

        migrationBuilder.AddColumn<string>(
            name: "password_reset_token_expires",
            table: "users",
            nullable: true);

        // Refresh token columns on user_sessions
        migrationBuilder.AddColumn<string>(
            name: "refresh_token",
            table: "user_sessions",
            maxLength: 128,
            nullable: true);

        migrationBuilder.AddColumn<string>(
            name: "refresh_token_expires",
            table: "user_sessions",
            nullable: true);

        migrationBuilder.AddColumn<bool>(
            name: "refresh_token_used",
            table: "user_sessions",
            nullable: false,
            defaultValue: false);
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropColumn(name: "failed_login_attempts", table: "users");
        migrationBuilder.DropColumn(name: "locked_until", table: "users");
        migrationBuilder.DropColumn(name: "email_verified", table: "users");
        migrationBuilder.DropColumn(name: "email_verification_token", table: "users");
        migrationBuilder.DropColumn(name: "email_verification_token_expires", table: "users");
        migrationBuilder.DropColumn(name: "password_reset_token", table: "users");
        migrationBuilder.DropColumn(name: "password_reset_token_expires", table: "users");
        migrationBuilder.DropColumn(name: "refresh_token", table: "user_sessions");
        migrationBuilder.DropColumn(name: "refresh_token_expires", table: "user_sessions");
        migrationBuilder.DropColumn(name: "refresh_token_used", table: "user_sessions");
    }
}
