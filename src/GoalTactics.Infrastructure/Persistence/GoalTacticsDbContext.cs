using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.Infrastructure.Persistence;

public sealed class GoalTacticsDbContext(DbContextOptions<GoalTacticsDbContext> options) : DbContext(options)
{
    public DbSet<UserEntity> Users => Set<UserEntity>();

    public DbSet<UserSessionEntity> UserSessions => Set<UserSessionEntity>();

    public DbSet<UserPreferencesEntity> UserPreferences => Set<UserPreferencesEntity>();

    public DbSet<TutorialStateEntity> TutorialStates => Set<TutorialStateEntity>();

    public DbSet<TeamEntity> Teams => Set<TeamEntity>();

    public DbSet<TeamResourcesEntity> TeamResources => Set<TeamResourcesEntity>();

    public DbSet<TeamNewsEntity> TeamNews => Set<TeamNewsEntity>();

    public DbSet<TeamMailEntity> TeamMail => Set<TeamMailEntity>();

    public DbSet<TeamFinanceHistoryEntity> TeamFinanceHistory => Set<TeamFinanceHistoryEntity>();

    public DbSet<LeagueEntity> Leagues => Set<LeagueEntity>();

    public DbSet<LeagueTeamEntity> LeagueTeams => Set<LeagueTeamEntity>();

    public DbSet<FriendRelationEntity> FriendRelations => Set<FriendRelationEntity>();

    public DbSet<FriendlyChallengeEntity> FriendlyChallenges => Set<FriendlyChallengeEntity>();

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

        modelBuilder.Entity<UserPreferencesEntity>(entity =>
        {
            entity.ToTable("user_preferences");
            entity.HasKey(x => x.UserId);
            entity.Property(x => x.UserId).HasColumnName("user_id");
            entity.Property(x => x.AuctionOverbid).HasColumnName("auction_overbid").IsRequired();
            entity.Property(x => x.MatchResults).HasColumnName("match_results").IsRequired();
            entity.Property(x => x.LineupIncomplete).HasColumnName("lineup_incomplete").IsRequired();
            entity.Property(x => x.FriendInvite).HasColumnName("friend_invite").IsRequired();
            entity.Property(x => x.IneffectiveTraining).HasColumnName("ineffective_training").IsRequired();
            entity.Property(x => x.FriendlyMatch).HasColumnName("friendly_match").IsRequired();
            entity.Property(x => x.SystemNotifications).HasColumnName("system_notifications").IsRequired();
            entity.Property(x => x.AuctionEnd).HasColumnName("auction_end").IsRequired();
            entity.HasOne(x => x.User)
                .WithOne()
                .HasForeignKey<UserPreferencesEntity>(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<TutorialStateEntity>(entity =>
        {
            entity.ToTable("tutorial_states");
            entity.HasKey(x => x.UserId);
            entity.Property(x => x.UserId).HasColumnName("user_id");
            entity.Property(x => x.CurrentTopicId).HasColumnName("current_topic_id").HasMaxLength(128);
            entity.Property(x => x.UpdatedAtUtc).HasColumnName("updated_at").IsRequired();
            entity.HasOne(x => x.User)
                .WithOne()
                .HasForeignKey<TutorialStateEntity>(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<TeamEntity>(entity =>
        {
            entity.ToTable("teams");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.UserId).HasColumnName("user_id").IsRequired();
            entity.Property(x => x.Name).HasColumnName("name").HasMaxLength(64).IsRequired();
            entity.Property(x => x.Country).HasColumnName("country").HasMaxLength(8).IsRequired();
            entity.Property(x => x.CountryName).HasColumnName("country_name").HasMaxLength(64).IsRequired();
            entity.Property(x => x.LeagueName).HasColumnName("league_name").HasMaxLength(64).IsRequired();
            entity.Property(x => x.MarketValue).HasColumnName("market_value").IsRequired();
            entity.Property(x => x.Mood).HasColumnName("mood").IsRequired();
            entity.Property(x => x.TeamMood).HasColumnName("team_mood").HasMaxLength(32).IsRequired();
            entity.Property(x => x.Wins).HasColumnName("wins").IsRequired();
            entity.Property(x => x.Losses).HasColumnName("losses").IsRequired();
            entity.Property(x => x.Fans).HasColumnName("fans").IsRequired();
            entity.Property(x => x.Members).HasColumnName("members").IsRequired();
            entity.Property(x => x.Strength).HasColumnName("strength").IsRequired();
            entity.Property(x => x.MatchTrend).HasColumnName("match_trend").HasMaxLength(32).IsRequired();
            entity.HasIndex(x => x.UserId).IsUnique();
            entity.HasOne(x => x.User)
                .WithMany()
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<TeamResourcesEntity>(entity =>
        {
            entity.ToTable("team_resources");
            entity.HasKey(x => x.TeamId);
            entity.Property(x => x.TeamId).HasColumnName("team_id");
            entity.Property(x => x.Money).HasColumnName("money").IsRequired();
            entity.Property(x => x.Medipacks).HasColumnName("medipacks").IsRequired();
            entity.Property(x => x.GTStars).HasColumnName("gt_stars").IsRequired();
            entity.HasOne(x => x.Team)
                .WithOne()
                .HasForeignKey<TeamResourcesEntity>(x => x.TeamId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<TeamNewsEntity>(entity =>
        {
            entity.ToTable("team_news");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.TeamId).HasColumnName("team_id").IsRequired();
            entity.Property(x => x.DateText).HasColumnName("date_text").HasMaxLength(64).IsRequired();
            entity.Property(x => x.Title).HasColumnName("title").HasMaxLength(128).IsRequired();
            entity.Property(x => x.Text).HasColumnName("text").HasMaxLength(2048).IsRequired();
            entity.HasIndex(x => x.TeamId);
        });

        modelBuilder.Entity<TeamMailEntity>(entity =>
        {
            entity.ToTable("team_mail");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.UserId).HasColumnName("user_id").IsRequired();
            entity.Property(x => x.DateText).HasColumnName("date_text").HasMaxLength(64).IsRequired();
            entity.Property(x => x.Subject).HasColumnName("subject").HasMaxLength(256).IsRequired();
            entity.Property(x => x.Sender).HasColumnName("sender").HasMaxLength(128).IsRequired();
            entity.Property(x => x.Message).HasColumnName("message").HasMaxLength(4096).IsRequired();
            entity.Property(x => x.Extra).HasColumnName("extra").HasMaxLength(1024).IsRequired();
            entity.Property(x => x.IsNew).HasColumnName("is_new").IsRequired();
            entity.Property(x => x.SenderType).HasColumnName("sender_type").IsRequired();
            entity.HasIndex(x => x.UserId);
        });

        modelBuilder.Entity<TeamFinanceHistoryEntity>(entity =>
        {
            entity.ToTable("team_finance_history");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.UserId).HasColumnName("user_id").IsRequired();
            entity.Property(x => x.Date).HasColumnName("date").IsRequired();
            entity.Property(x => x.Income).HasColumnName("income").IsRequired();
            entity.Property(x => x.Outcome).HasColumnName("outcome").IsRequired();
            entity.Property(x => x.Balance).HasColumnName("balance").IsRequired();
            entity.HasIndex(x => x.UserId);
        });

        modelBuilder.Entity<LeagueEntity>(entity =>
        {
            entity.ToTable("leagues");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.Tier).HasColumnName("tier").IsRequired();
            entity.Property(x => x.GroupNumber).HasColumnName("group_number").IsRequired();
            entity.Property(x => x.Name).HasColumnName("name").HasMaxLength(64).IsRequired();
            entity.Property(x => x.Mount).HasColumnName("mount").IsRequired();
            entity.Property(x => x.Dismount).HasColumnName("dismount").IsRequired();
            entity.HasIndex(x => new { x.Tier, x.GroupNumber }).IsUnique();
        });

        modelBuilder.Entity<LeagueTeamEntity>(entity =>
        {
            entity.ToTable("league_teams");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.LeagueId).HasColumnName("league_id").IsRequired();
            entity.Property(x => x.TeamId).HasColumnName("team_id");
            entity.Property(x => x.TeamName).HasColumnName("team_name").HasMaxLength(128).IsRequired();
            entity.Property(x => x.IsBot).HasColumnName("is_bot").IsRequired();
            entity.Property(x => x.Strength).HasColumnName("strength").IsRequired();
            entity.Property(x => x.Country).HasColumnName("country").HasMaxLength(8).IsRequired();
            entity.Property(x => x.Logo).HasColumnName("logo").HasMaxLength(64).IsRequired();
            entity.Property(x => x.IsOnline).HasColumnName("is_online").IsRequired();
            entity.Property(x => x.MatchesHome).HasColumnName("matches_home").IsRequired();
            entity.Property(x => x.MatchesAway).HasColumnName("matches_away").IsRequired();
            entity.Property(x => x.WinsHome).HasColumnName("wins_home").IsRequired();
            entity.Property(x => x.WinsAway).HasColumnName("wins_away").IsRequired();
            entity.Property(x => x.LossesHome).HasColumnName("losses_home").IsRequired();
            entity.Property(x => x.LossesAway).HasColumnName("losses_away").IsRequired();
            entity.Property(x => x.DrawsHome).HasColumnName("draws_home").IsRequired();
            entity.Property(x => x.DrawsAway).HasColumnName("draws_away").IsRequired();
            entity.Property(x => x.GoalsScoredHome).HasColumnName("goals_scored_home").IsRequired();
            entity.Property(x => x.GoalsScoredAway).HasColumnName("goals_scored_away").IsRequired();
            entity.Property(x => x.GoalsReceivedHome).HasColumnName("goals_received_home").IsRequired();
            entity.Property(x => x.GoalsReceivedAway).HasColumnName("goals_received_away").IsRequired();
            entity.Property(x => x.PointsHome).HasColumnName("points_home").IsRequired();
            entity.Property(x => x.PointsAway).HasColumnName("points_away").IsRequired();
            entity.HasIndex(x => x.LeagueId);
            entity.HasIndex(x => x.TeamId).IsUnique(false);
            entity.HasOne(x => x.League)
                .WithMany(x => x.Teams)
                .HasForeignKey(x => x.LeagueId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<FriendRelationEntity>(entity =>
        {
            entity.ToTable("friend_relations");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.PairKey).HasColumnName("pair_key").HasMaxLength(80).IsRequired();
            entity.Property(x => x.RequesterUserId).HasColumnName("requester_user_id").IsRequired();
            entity.Property(x => x.AddresseeUserId).HasColumnName("addressee_user_id").IsRequired();
            entity.Property(x => x.Status).HasColumnName("status").IsRequired();
            entity.Property(x => x.IsLikedByRequester).HasColumnName("is_liked_by_requester").IsRequired();
            entity.Property(x => x.CreatedAtUtc).HasColumnName("created_at").IsRequired();
            entity.Property(x => x.UpdatedAtUtc).HasColumnName("updated_at").IsRequired();
            entity.HasIndex(x => x.PairKey).IsUnique();
            entity.HasIndex(x => x.RequesterUserId);
            entity.HasIndex(x => x.AddresseeUserId);
        });

        modelBuilder.Entity<FriendlyChallengeEntity>(entity =>
        {
            entity.ToTable("friendly_challenges");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.HomeUserId).HasColumnName("home_user_id").IsRequired();
            entity.Property(x => x.AwayUserId).HasColumnName("away_user_id").IsRequired();
            entity.Property(x => x.HomeTeamId).HasColumnName("home_team_id").IsRequired();
            entity.Property(x => x.AwayTeamId).HasColumnName("away_team_id").IsRequired();
            entity.Property(x => x.Status).HasColumnName("status").IsRequired();
            entity.Property(x => x.MatchDateUtc).HasColumnName("match_date").IsRequired();
            entity.Property(x => x.EndDateUtc).HasColumnName("end_date").IsRequired();
            entity.Property(x => x.CreatedAtUtc).HasColumnName("created_at").IsRequired();
            entity.HasIndex(x => x.HomeUserId);
            entity.HasIndex(x => x.AwayUserId);
            entity.HasIndex(x => x.MatchDateUtc);
        });
    }
}
