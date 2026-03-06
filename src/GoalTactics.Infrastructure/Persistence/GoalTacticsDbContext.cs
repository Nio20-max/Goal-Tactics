using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.Infrastructure.Persistence;

public sealed class GoalTacticsDbContext(DbContextOptions<GoalTacticsDbContext> options) : DbContext(options)
{
    public DbSet<UserEntity> Users => Set<UserEntity>();

    public DbSet<UserSessionEntity> UserSessions => Set<UserSessionEntity>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<UserEntity>(entity =>
        {
            entity.ToTable("users");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.ManagerName).HasColumnName("manager_name").HasMaxLength(64).IsRequired();
            entity.Property(x => x.Email).HasColumnName("email").HasMaxLength(256).IsRequired();
            entity.Property(x => x.PasswordHash).HasColumnName("password_hash").HasMaxLength(512).IsRequired();
            entity.Property(x => x.CreatedAtUtc).HasColumnName("created_at").IsRequired();
            entity.Property(x => x.LastLoginAtUtc).HasColumnName("last_login_at");
            entity.Property(x => x.LastActivityAtUtc).HasColumnName("last_activity_at");
            entity.Property(x => x.DeletedAtUtc).HasColumnName("deleted_at");
            entity.HasIndex(x => x.Email).IsUnique();
        });

        modelBuilder.Entity<UserSessionEntity>(entity =>
        {
            entity.ToTable("user_sessions");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.UserId).HasColumnName("user_id").IsRequired();
            entity.Property(x => x.TokenId).HasColumnName("token_id").HasMaxLength(64).IsRequired();
            entity.Property(x => x.IssuedAtUtc).HasColumnName("issued_at").IsRequired();
            entity.Property(x => x.ExpiresAtUtc).HasColumnName("expires_at").IsRequired();
            entity.Property(x => x.RevokedAtUtc).HasColumnName("revoked_at");
            entity.Property(x => x.ClientVersion).HasColumnName("client_version").HasMaxLength(32);
            entity.Property(x => x.Capabilities).HasColumnName("capabilities").HasMaxLength(256);
            entity.Property(x => x.Platform).HasColumnName("platform").HasMaxLength(32);
            entity.Property(x => x.DeviceId).HasColumnName("device_id").HasMaxLength(128);
            entity.HasIndex(x => x.TokenId).IsUnique();
            entity.HasIndex(x => x.UserId);
            entity.HasOne(x => x.User)
                .WithMany(x => x.Sessions)
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);
        });
    }
}
