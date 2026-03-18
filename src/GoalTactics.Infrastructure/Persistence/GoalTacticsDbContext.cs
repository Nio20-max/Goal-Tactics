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

    public DbSet<TeamPlayerEntity> TeamPlayers => Set<TeamPlayerEntity>();

    public DbSet<TeamSkillCardEntity> TeamSkillCards => Set<TeamSkillCardEntity>();

    public DbSet<TeamTrainingStateEntity> TeamTrainingStates => Set<TeamTrainingStateEntity>();

    public DbSet<TeamNewsEntity> TeamNews => Set<TeamNewsEntity>();

    public DbSet<TeamAccomplishmentEntity> TeamAccomplishments => Set<TeamAccomplishmentEntity>();

    public DbSet<TeamMailEntity> TeamMail => Set<TeamMailEntity>();

    public DbSet<TeamFinanceHistoryEntity> TeamFinanceHistory => Set<TeamFinanceHistoryEntity>();

    public DbSet<TeamFinanceLedgerEntity> TeamFinanceLedger => Set<TeamFinanceLedgerEntity>();

    public DbSet<TeamEquipmentEntity> TeamEquipment => Set<TeamEquipmentEntity>();

    public DbSet<LeagueEntity> Leagues => Set<LeagueEntity>();

    public DbSet<SeasonStateEntity> SeasonStates => Set<SeasonStateEntity>();

    public DbSet<LeagueTeamEntity> LeagueTeams => Set<LeagueTeamEntity>();

    public DbSet<LeagueMatchEntity> LeagueMatches => Set<LeagueMatchEntity>();

    public DbSet<FriendRelationEntity> FriendRelations => Set<FriendRelationEntity>();

    public DbSet<FriendlyChallengeEntity> FriendlyChallenges => Set<FriendlyChallengeEntity>();

    public DbSet<LadderSeasonEntity> LadderSeasons => Set<LadderSeasonEntity>();

    public DbSet<LadderEntryEntity> LadderEntries => Set<LadderEntryEntity>();

    public DbSet<ChatMessageEntity> ChatMessages => Set<ChatMessageEntity>();

    public DbSet<ChatPresenceEntity> ChatPresence => Set<ChatPresenceEntity>();

    public DbSet<MatchPushSubscriptionEntity> MatchPushSubscriptions => Set<MatchPushSubscriptionEntity>();

    public DbSet<AuctionEntity> Auctions => Set<AuctionEntity>();

    public DbSet<AuctionBidEntity> AuctionBids => Set<AuctionBidEntity>();

    public DbSet<AuctionFavoriteEntity> AuctionFavorites => Set<AuctionFavoriteEntity>();

    public DbSet<SponsorContractEntity> SponsorContracts => Set<SponsorContractEntity>();

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
            entity.Property(x => x.FailedLoginAttempts).HasColumnName("failed_login_attempts").HasDefaultValue(0);
            entity.Property(x => x.LockedUntilUtc).HasColumnName("locked_until");
            entity.Property(x => x.EmailVerified).HasColumnName("email_verified").HasDefaultValue(false);
            entity.Property(x => x.EmailVerificationToken).HasColumnName("email_verification_token").HasMaxLength(128);
            entity.Property(x => x.EmailVerificationTokenExpiresUtc).HasColumnName("email_verification_token_expires");
            entity.Property(x => x.PasswordResetToken).HasColumnName("password_reset_token").HasMaxLength(128);
            entity.Property(x => x.PasswordResetTokenExpiresUtc).HasColumnName("password_reset_token_expires");
            entity.Property(x => x.DailyRewardClaimedUtc).HasColumnName("daily_reward_claimed_at");
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
            entity.Property(x => x.RefreshToken).HasColumnName("refresh_token").HasMaxLength(128);
            entity.Property(x => x.RefreshTokenExpiresUtc).HasColumnName("refresh_token_expires");
            entity.Property(x => x.RefreshTokenUsed).HasColumnName("refresh_token_used").HasDefaultValue(false);
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
            entity.Property(x => x.StadiumName).HasColumnName("stadium_name").HasMaxLength(96).IsRequired();
            entity.Property(x => x.GrassQuality).HasColumnName("grass_quality").IsRequired();
            entity.Property(x => x.LeagueTier).HasColumnName("league_tier").IsRequired();
            entity.Property(x => x.SelectedShirt).HasColumnName("selected_shirt").HasMaxLength(32);
            entity.Property(x => x.SelectedEmblem).HasColumnName("selected_emblem").HasMaxLength(32);
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
            entity.Property(x => x.OfficeLevel).HasColumnName("office_level").IsRequired();
            entity.Property(x => x.TrainingCenterLevel).HasColumnName("training_center_level").IsRequired();
            entity.Property(x => x.MedicalCenterLevel).HasColumnName("medical_center_level").IsRequired();
            entity.Property(x => x.YouthAcademyLevel).HasColumnName("youth_academy_level").IsRequired();
            entity.Property(x => x.FanShopLevel).HasColumnName("fan_shop_level").IsRequired();
            entity.Property(x => x.ParkingLevel).HasColumnName("parking_level").IsRequired();
            entity.Property(x => x.StadiumVipSeats).HasColumnName("stadium_vip_seats").IsRequired();
            entity.Property(x => x.StadiumSitSeats).HasColumnName("stadium_sit_seats").IsRequired();
            entity.Property(x => x.StadiumStandSeats).HasColumnName("stadium_stand_seats").IsRequired();
            entity.Property(x => x.StadiumVisitorsLastMatch).HasColumnName("stadium_visitors_last_match").IsRequired();
            entity.Property(x => x.StadiumVisitorsTotal).HasColumnName("stadium_visitors_total").IsRequired();
            entity.Property(x => x.StadiumEarningsLastMatch).HasColumnName("stadium_earnings_last_match").IsRequired();
            entity.Property(x => x.StadiumEarningsTotal).HasColumnName("stadium_earnings_total").IsRequired();
            entity.Property(x => x.StadiumMatchesCount).HasColumnName("stadium_matches_count").IsRequired();
            entity.Property(x => x.LastEconomyTickUtc).HasColumnName("last_economy_tick_utc");
            entity.Property(x => x.LastTrainingTickUtc).HasColumnName("last_training_tick_utc");
            entity.Property(x => x.LastSponsorPayoutUtc).HasColumnName("last_sponsor_payout_utc");
            entity.Property(x => x.ActiveConstructionId).HasColumnName("active_construction_id").HasMaxLength(64);
            entity.Property(x => x.ActiveConstructionPlaceId).HasColumnName("active_construction_place_id").HasMaxLength(64);
            entity.Property(x => x.ActiveConstructionType).HasColumnName("active_construction_type").HasMaxLength(64);
            entity.Property(x => x.ActiveConstructionCurrentValue).HasColumnName("active_construction_current_value").IsRequired();
            entity.Property(x => x.ActiveConstructionNewValue).HasColumnName("active_construction_new_value").IsRequired();
            entity.Property(x => x.ActiveConstructionUpgradeCost).HasColumnName("active_construction_upgrade_cost").IsRequired();
            entity.Property(x => x.ActiveConstructionUpgradeCostPremium).HasColumnName("active_construction_upgrade_cost_premium").IsRequired();
            entity.Property(x => x.ActiveConstructionStartUtc).HasColumnName("active_construction_start_utc");
            entity.Property(x => x.ActiveConstructionEndUtc).HasColumnName("active_construction_end_utc");
            entity.Property(x => x.ProgressDayCounter).HasColumnName("progress_day_counter").IsRequired();
            entity.HasOne(x => x.Team)
                .WithOne()
                .HasForeignKey<TeamResourcesEntity>(x => x.TeamId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<TeamPlayerEntity>(entity =>
        {
            entity.ToTable("team_players");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.TeamId).HasColumnName("team_id").IsRequired();
            entity.Property(x => x.Name).HasColumnName("name").HasMaxLength(64).IsRequired();
            entity.Property(x => x.Origin).HasColumnName("origin").HasMaxLength(8).IsRequired();
            entity.Property(x => x.Position).HasColumnName("position").HasMaxLength(8).IsRequired();
            entity.Property(x => x.ShirtNumber).HasColumnName("shirt_number").IsRequired();
            entity.Property(x => x.Age).HasColumnName("age").IsRequired();
            entity.Property(x => x.Talent).HasColumnName("talent").IsRequired();
            entity.Property(x => x.Strength).HasColumnName("strength").IsRequired();
            entity.Property(x => x.Experience).HasColumnName("experience").IsRequired();
            entity.Property(x => x.MarketValue).HasColumnName("market_value");
            entity.Property(x => x.Skill0).HasColumnName("skill_0");
            entity.Property(x => x.Skill1).HasColumnName("skill_1");
            entity.Property(x => x.Skill2).HasColumnName("skill_2");
            entity.Property(x => x.Skill3).HasColumnName("skill_3");
            entity.Property(x => x.Skill4).HasColumnName("skill_4");
            entity.Property(x => x.Skill5).HasColumnName("skill_5");
            entity.Property(x => x.Skill6).HasColumnName("skill_6");
            entity.Property(x => x.Skill7).HasColumnName("skill_7");
            entity.Property(x => x.Skill8).HasColumnName("skill_8");
            entity.Property(x => x.Skill9).HasColumnName("skill_9");
            entity.Property(x => x.Skill10).HasColumnName("skill_10");
            entity.Property(x => x.Skill11).HasColumnName("skill_11");
            entity.Property(x => x.Skill12).HasColumnName("skill_12");
            entity.Property(x => x.Skill13).HasColumnName("skill_13");
            entity.Property(x => x.Fitness).HasColumnName("fitness").IsRequired();
            entity.Property(x => x.Matches).HasColumnName("matches").IsRequired();
            entity.Property(x => x.Goals).HasColumnName("goals").IsRequired();
            entity.Property(x => x.YellowCards).HasColumnName("yellow_cards").IsRequired();
            entity.Property(x => x.RedCards).HasColumnName("red_cards").IsRequired();
            entity.Property(x => x.SuspensionMatchesRemaining).HasColumnName("suspension_matches_remaining").IsRequired();
            entity.Property(x => x.IndividualTrainingSkill).HasColumnName("individual_training_skill").HasMaxLength(32);
            entity.Property(x => x.IndividualTrainingUntilUtc).HasColumnName("individual_training_until_utc");
            entity.Property(x => x.ContractEndUtc).HasColumnName("contract_end_utc");
            entity.Property(x => x.IsScouted).HasColumnName("is_scouted").HasDefaultValue(false);
            entity.Property(x => x.ScoutingReadyAtUtc).HasColumnName("scouting_ready_at_utc");
            entity.Property(x => x.IsPremiumScouting).HasColumnName("is_premium_scout").IsRequired().HasDefaultValue(false);
            entity.Property(x => x.Head).HasColumnName("head").HasMaxLength(32).HasDefaultValue("01_head-A01");
            entity.Property(x => x.Body).HasColumnName("body").HasMaxLength(32).HasDefaultValue("01_body-A00");
            entity.Property(x => x.Gloves).HasColumnName("gloves").HasMaxLength(32).HasDefaultValue("01_Gloves01");
            entity.Property(x => x.Shoes).HasColumnName("shoes").HasMaxLength(32).HasDefaultValue("01_Shoes01");
            entity.HasIndex(x => x.TeamId);
            entity.HasOne(x => x.Team)
                .WithMany()
                .HasForeignKey(x => x.TeamId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<TeamSkillCardEntity>(entity =>
        {
            entity.ToTable("team_skill_cards");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.TeamId).HasColumnName("team_id").IsRequired();
            entity.Property(x => x.Skill).HasColumnName("skill").IsRequired();
            entity.Property(x => x.Rarity).HasColumnName("rarity").IsRequired();
            entity.Property(x => x.Count).HasColumnName("count").IsRequired();
            entity.Property(x => x.Bonus).HasColumnName("bonus").IsRequired();
            entity.HasIndex(x => x.TeamId);
            entity.HasOne(x => x.Team)
                .WithMany()
                .HasForeignKey(x => x.TeamId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<TeamTrainingStateEntity>(entity =>
        {
            entity.ToTable("team_training_state");
            entity.HasKey(x => x.TeamId);
            entity.Property(x => x.TeamId).HasColumnName("team_id");
            entity.Property(x => x.MainSkillIndex).HasColumnName("main_skill_index").IsRequired();
            entity.Property(x => x.SubSkillIndex).HasColumnName("sub_skill_index").IsRequired();
            entity.Property(x => x.CampType).HasColumnName("camp_type").HasMaxLength(32).IsRequired();
            entity.Property(x => x.CampActiveUntilUtc).HasColumnName("camp_active_until_utc");
            entity.Property(x => x.TrainingChangedAtUtc).HasColumnName("training_changed_at_utc");
            entity.Property(x => x.SelectedTacticId).HasColumnName("selected_tactic_id").HasMaxLength(64);
            entity.Property(x => x.SelectedTacticStartUtc).HasColumnName("selected_tactic_start_utc");
            entity.Property(x => x.TacticTrainingProgressJson).HasColumnName("tactic_training_progress");
            entity.Property(x => x.CampRefreshCount).HasColumnName("camp_refresh_count").HasDefaultValue(0);
            entity.HasOne(x => x.Team)
                .WithOne()
                .HasForeignKey<TeamTrainingStateEntity>(x => x.TeamId)
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

        modelBuilder.Entity<TeamAccomplishmentEntity>(entity =>
        {
            entity.ToTable("team_accomplishments");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.TeamId).HasColumnName("team_id").IsRequired();
            entity.Property(x => x.Name).HasColumnName("name").HasMaxLength(256).IsRequired();
            entity.Property(x => x.Image).HasColumnName("image").HasMaxLength(128).IsRequired();
            entity.Property(x => x.CreatedAtUtc).HasColumnName("created_at").IsRequired();
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

        modelBuilder.Entity<TeamFinanceLedgerEntity>(entity =>
        {
            entity.ToTable("team_finance_ledger");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.UserId).HasColumnName("user_id").IsRequired();
            entity.Property(x => x.Matchday).HasColumnName("matchday").IsRequired();
            entity.Property(x => x.Date).HasColumnName("date").IsRequired();
            entity.Property(x => x.BookingType).HasColumnName("booking_type").HasMaxLength(64).IsRequired();
            entity.Property(x => x.Value).HasColumnName("value").IsRequired();
            entity.Property(x => x.Description).HasColumnName("description").HasMaxLength(256).IsRequired();
            entity.Property(x => x.IsEarning).HasColumnName("is_earning").IsRequired();
            entity.HasIndex(x => new { x.UserId, x.Matchday });
        });

        modelBuilder.Entity<TeamEquipmentEntity>(entity =>
        {
            entity.ToTable("team_equipment");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.UserId).HasColumnName("user_id").IsRequired();
            entity.Property(x => x.Image).HasColumnName("image").HasMaxLength(32).IsRequired();
            entity.Property(x => x.EquipmentType).HasColumnName("equipment_type").HasMaxLength(16).IsRequired();
            entity.Property(x => x.IsActive).HasColumnName("is_active").IsRequired();
            entity.HasIndex(x => x.UserId);
        });

        modelBuilder.Entity<SeasonStateEntity>(entity =>
        {
            entity.ToTable("season_state");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id").HasMaxLength(32);
            entity.Property(x => x.LastSeasonProcessed).HasColumnName("last_season_processed").IsRequired();
            entity.Property(x => x.SeasonNumber).HasColumnName("season_number").IsRequired();
            entity.Property(x => x.CurrentMatchday).HasColumnName("current_matchday").IsRequired();
            entity.Property(x => x.StartedAtUtc).HasColumnName("started_at");
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

        modelBuilder.Entity<LeagueMatchEntity>(entity =>
        {
            entity.ToTable("league_matches");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.LeagueId).HasColumnName("league_id").IsRequired();
            entity.Property(x => x.Matchday).HasColumnName("matchday").IsRequired();
            entity.Property(x => x.HomeLeagueTeamId).HasColumnName("home_league_team_id").IsRequired();
            entity.Property(x => x.AwayLeagueTeamId).HasColumnName("away_league_team_id").IsRequired();
            entity.Property(x => x.HomeTeamName).HasColumnName("home_team_name").HasMaxLength(128);
            entity.Property(x => x.AwayTeamName).HasColumnName("away_team_name").HasMaxLength(128);
            entity.Property(x => x.HomeLogo).HasColumnName("home_logo").HasMaxLength(64);
            entity.Property(x => x.AwayLogo).HasColumnName("away_logo").HasMaxLength(64);
            entity.Property(x => x.HomeCountry).HasColumnName("home_country").HasMaxLength(8);
            entity.Property(x => x.AwayCountry).HasColumnName("away_country").HasMaxLength(8);
            entity.Property(x => x.HomeStrength).HasColumnName("home_strength").IsRequired();
            entity.Property(x => x.AwayStrength).HasColumnName("away_strength").IsRequired();
            entity.Property(x => x.HomeScore).HasColumnName("home_score");
            entity.Property(x => x.AwayScore).HasColumnName("away_score");
            entity.Property(x => x.IsPlayed).HasColumnName("is_played").IsRequired();
            entity.Property(x => x.ScheduledDateUtc).HasColumnName("scheduled_date_utc").IsRequired();
            entity.Property(x => x.PlayedAtUtc).HasColumnName("played_at_utc");
            entity.Property(x => x.EventsJson).HasColumnName("events_json");
            entity.HasIndex(x => x.LeagueId);
            entity.HasIndex(x => new { x.LeagueId, x.Matchday });
            entity.HasOne(x => x.League)
                .WithMany()
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

        modelBuilder.Entity<LadderSeasonEntity>(entity =>
        {
            entity.ToTable("ladder_seasons");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.EndDateUtc).HasColumnName("end_date").IsRequired();
            entity.Property(x => x.CreatedAtUtc).HasColumnName("created_at").IsRequired();
            entity.HasIndex(x => x.EndDateUtc);
        });

        modelBuilder.Entity<LadderEntryEntity>(entity =>
        {
            entity.ToTable("ladder_entries");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.LadderId).HasColumnName("ladder_id").IsRequired();
            entity.Property(x => x.TeamId).HasColumnName("team_id");
            entity.Property(x => x.TeamName).HasColumnName("team_name").HasMaxLength(128).IsRequired();
            entity.Property(x => x.TeamLogo).HasColumnName("team_logo").HasMaxLength(64).IsRequired();
            entity.Property(x => x.Points).HasColumnName("points").IsRequired();
            entity.Property(x => x.Rank).HasColumnName("rank").IsRequired();
            entity.Property(x => x.Stamina).HasColumnName("stamina").IsRequired();
            entity.Property(x => x.Strength).HasColumnName("strength").IsRequired();
            entity.Property(x => x.Played).HasColumnName("played").IsRequired();
            entity.Property(x => x.GoalsScored).HasColumnName("goals_scored").IsRequired();
            entity.Property(x => x.GoalsReceived).HasColumnName("goals_received").IsRequired();
            entity.Property(x => x.IsBot).HasColumnName("is_bot").IsRequired();
            entity.Property(x => x.UpdatedAtUtc).HasColumnName("updated_at").IsRequired();
            entity.HasIndex(x => x.LadderId);
            entity.HasIndex(x => x.TeamId).IsUnique(false);
            entity.HasOne(x => x.Ladder)
                .WithMany(x => x.Entries)
                .HasForeignKey(x => x.LadderId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<ChatMessageEntity>(entity =>
        {
            entity.ToTable("chat_messages");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.UserId).HasColumnName("user_id").IsRequired();
            entity.Property(x => x.Channel).HasColumnName("channel").HasMaxLength(16).IsRequired().HasDefaultValue("global");
            entity.Property(x => x.GroupKey).HasColumnName("group_key").HasMaxLength(64);
            entity.Property(x => x.TargetUserId).HasColumnName("target_user_id").HasMaxLength(32);
            entity.Property(x => x.Message).HasColumnName("message").HasMaxLength(512).IsRequired();
            entity.Property(x => x.CreatedAtUtc).HasColumnName("created_at").IsRequired();
            entity.HasIndex(x => x.CreatedAtUtc);
            entity.HasIndex(x => x.UserId);
            entity.HasIndex(x => x.Channel);
            entity.HasIndex(x => x.TargetUserId);
            entity.HasIndex(x => x.GroupKey);
            entity.HasOne(x => x.User)
                .WithMany()
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<ChatPresenceEntity>(entity =>
        {
            entity.ToTable("chat_presence");
            entity.HasKey(x => x.UserId);
            entity.Property(x => x.UserId).HasColumnName("user_id");
            entity.Property(x => x.LastTypingAtUtc).HasColumnName("last_typing_at").IsRequired();
            entity.Property(x => x.LastSeenAtUtc).HasColumnName("last_seen_at").IsRequired();
            entity.HasOne(x => x.User)
                .WithMany()
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<MatchPushSubscriptionEntity>(entity =>
        {
            entity.ToTable("match_push_subscriptions");
            entity.HasKey(x => new { x.UserId, x.MatchId });
            entity.Property(x => x.UserId).HasColumnName("user_id");
            entity.Property(x => x.MatchId).HasColumnName("match_id").HasMaxLength(64);
            entity.Property(x => x.EnabledAtUtc).HasColumnName("enabled_at").IsRequired();
            entity.HasIndex(x => x.MatchId);
            entity.HasOne(x => x.User)
                .WithMany()
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<AuctionEntity>(entity =>
        {
            entity.ToTable("auctions");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.PlayerId).HasColumnName("player_id");
            entity.Property(x => x.SellerTeamId).HasColumnName("seller_team_id");
            entity.Property(x => x.PlayerName).HasColumnName("player_name").HasMaxLength(128).IsRequired();
            entity.Property(x => x.PlayerCountry).HasColumnName("player_country").HasMaxLength(8).IsRequired();
            entity.Property(x => x.PlayerHead).HasColumnName("player_head").HasMaxLength(32).IsRequired();
            entity.Property(x => x.PlayerPosition).HasColumnName("player_position").IsRequired();
            entity.Property(x => x.PlayerStrength).HasColumnName("player_strength").IsRequired();
            entity.Property(x => x.PlayerTalent).HasColumnName("player_talent").IsRequired();
            entity.Property(x => x.PlayerAge).HasColumnName("player_age").IsRequired();
            entity.Property(x => x.MinimumBid).HasColumnName("minimum_bid").IsRequired();
            entity.Property(x => x.CurrentBid).HasColumnName("current_bid").IsRequired();
            entity.Property(x => x.CurrentBidderTeamId).HasColumnName("current_bidder_team_id");
            entity.Property(x => x.CurrentBidderTeamName).HasColumnName("current_bidder_team_name").HasMaxLength(128);
            entity.Property(x => x.CurrentBidderTeamLogo).HasColumnName("current_bidder_team_logo").HasMaxLength(64);
            entity.Property(x => x.EndDateUtc).HasColumnName("end_date_utc").IsRequired();
            entity.Property(x => x.Status).HasColumnName("status").HasMaxLength(16).IsRequired();
            entity.Property(x => x.CreatedAtUtc).HasColumnName("created_at").IsRequired();
            entity.HasIndex(x => x.Status);
            entity.HasIndex(x => x.EndDateUtc);
            entity.HasIndex(x => x.SellerTeamId);
        });

        modelBuilder.Entity<AuctionBidEntity>(entity =>
        {
            entity.ToTable("auction_bids");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id");
            entity.Property(x => x.AuctionId).HasColumnName("auction_id").IsRequired();
            entity.Property(x => x.TeamId).HasColumnName("team_id").IsRequired();
            entity.Property(x => x.TeamName).HasColumnName("team_name").HasMaxLength(128);
            entity.Property(x => x.Amount).HasColumnName("amount").IsRequired();
            entity.Property(x => x.CreatedAtUtc).HasColumnName("created_at").IsRequired();
            entity.HasIndex(x => x.AuctionId);
            entity.HasOne(x => x.Auction)
                .WithMany()
                .HasForeignKey(x => x.AuctionId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<AuctionFavoriteEntity>(entity =>
        {
            entity.ToTable("auction_favorites");
            entity.HasKey(x => new { x.UserId, x.AuctionId });
            entity.Property(x => x.UserId).HasColumnName("user_id");
            entity.Property(x => x.AuctionId).HasColumnName("auction_id");
            entity.HasIndex(x => x.UserId);
            entity.HasOne(x => x.Auction)
                .WithMany()
                .HasForeignKey(x => x.AuctionId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<SponsorContractEntity>(entity =>
        {
            entity.ToTable("sponsor_contracts");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Id).HasColumnName("id").HasMaxLength(32);
            entity.Property(x => x.TeamId).HasColumnName("team_id").HasMaxLength(32).IsRequired();
            entity.Property(x => x.Type).HasColumnName("type").HasMaxLength(16).IsRequired();
            entity.Property(x => x.SponsorName).HasColumnName("sponsor_name").HasMaxLength(128).IsRequired();
            entity.Property(x => x.SponsorDescription).HasColumnName("sponsor_description").HasMaxLength(256);
            entity.Property(x => x.BaseMoney).HasColumnName("base_money").IsRequired();
            entity.Property(x => x.BonusPerWin).HasColumnName("bonus_per_win");
            entity.Property(x => x.BonusPerGoal).HasColumnName("bonus_per_goal");
            entity.Property(x => x.StarsPayout).HasColumnName("stars_payout");
            entity.Property(x => x.StartDateUtc).HasColumnName("start_date_utc").IsRequired();
            entity.Property(x => x.EndDateUtc).HasColumnName("end_date_utc").IsRequired();
            entity.Property(x => x.IsActive).HasColumnName("is_active").IsRequired();
            entity.HasIndex(x => new { x.TeamId, x.IsActive });
            entity.HasOne(x => x.Team)
                .WithMany()
                .HasForeignKey(x => x.TeamId)
                .OnDelete(DeleteBehavior.Cascade);
        });
    }
}
