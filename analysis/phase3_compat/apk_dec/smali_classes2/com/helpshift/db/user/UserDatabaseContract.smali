.class public Lcom/helpshift/db/user/UserDatabaseContract;
.super Ljava/lang/Object;
.source "UserDatabaseContract.java"

# interfaces
.implements Lcom/helpshift/db/base/DatabaseContract;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_UserDB"


# instance fields
.field private final CREATE_CLEARED_USER_TABLE:Ljava/lang/String;

.field private final CREATE_LEGACY_ANALYTICS_EVENT_IDS_TABLE:Ljava/lang/String;

.field private final CREATE_LEGACY_PROFILE_TABLE:Ljava/lang/String;

.field public final CREATE_REDACTION_INFO_TABLE:Ljava/lang/String;

.field private final CREATE_USER_TABLE:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "CREATE TABLE user_table(_id INTEGER PRIMARY KEY AUTOINCREMENT, identifier TEXT, name TEXT, email TEXT, deviceid TEXT, auth_token TEXT, active INTEGER DEFAULT 0, anonymous INTEGER DEFAULT 0, issue_exists INTEGER DEFAULT 1, initial_state_synced INTEGER DEFAULT 0, push_token_synced INTEGER DEFAULT 0 );"

    .line 21
    iput-object v0, p0, Lcom/helpshift/db/user/UserDatabaseContract;->CREATE_USER_TABLE:Ljava/lang/String;

    const-string v0, "CREATE TABLE legacy_profile_table ( identifier TEXT PRIMARY KEY, name TEXT, email TEXT, serverid TEXT, migration_state INTEGER );"

    .line 38
    iput-object v0, p0, Lcom/helpshift/db/user/UserDatabaseContract;->CREATE_LEGACY_PROFILE_TABLE:Ljava/lang/String;

    const-string v0, "CREATE TABLE cleared_user_table ( _id INTEGER PRIMARY KEY AUTOINCREMENT, identifier TEXT, name TEXT, email TEXT, deviceid TEXT, auth_token TEXT, sync_state INTEGER );"

    .line 49
    iput-object v0, p0, Lcom/helpshift/db/user/UserDatabaseContract;->CREATE_CLEARED_USER_TABLE:Ljava/lang/String;

    const-string v0, "CREATE TABLE legacy_analytics_event_id_table ( identifier TEXT, analytics_event_id TEXT );"

    .line 62
    iput-object v0, p0, Lcom/helpshift/db/user/UserDatabaseContract;->CREATE_LEGACY_ANALYTICS_EVENT_IDS_TABLE:Ljava/lang/String;

    const-string v0, "CREATE TABLE redaction_info_table ( user_local_id INTEGER PRIMARY KEY, redaction_state INTEGER , redaction_type INTEGER );"

    .line 71
    iput-object v0, p0, Lcom/helpshift/db/user/UserDatabaseContract;->CREATE_REDACTION_INFO_TABLE:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getCreateTableQueries()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "CREATE TABLE cleared_user_table ( _id INTEGER PRIMARY KEY AUTOINCREMENT, identifier TEXT, name TEXT, email TEXT, deviceid TEXT, auth_token TEXT, sync_state INTEGER );"

    const-string v1, "CREATE TABLE user_table(_id INTEGER PRIMARY KEY AUTOINCREMENT, identifier TEXT, name TEXT, email TEXT, deviceid TEXT, auth_token TEXT, active INTEGER DEFAULT 0, anonymous INTEGER DEFAULT 0, issue_exists INTEGER DEFAULT 1, initial_state_synced INTEGER DEFAULT 0, push_token_synced INTEGER DEFAULT 0 );"

    const-string v2, "CREATE TABLE legacy_analytics_event_id_table ( identifier TEXT, analytics_event_id TEXT );"

    const-string v3, "CREATE TABLE legacy_profile_table ( identifier TEXT PRIMARY KEY, name TEXT, email TEXT, serverid TEXT, migration_state INTEGER );"

    const-string v4, "CREATE TABLE redaction_info_table ( user_local_id INTEGER PRIMARY KEY, redaction_state INTEGER , redaction_type INTEGER );"

    .line 93
    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDatabaseName()Ljava/lang/String;
    .locals 1

    .line 88
    invoke-static {}, Lcom/helpshift/support/db/SupportDBNameRepo;->getUserDbName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDatabaseVersion()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method public getMigratorsForUpgrade(I)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/helpshift/db/base/IMigrator;",
            ">;"
        }
    .end annotation

    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 104
    new-instance p1, Lcom/helpshift/db/user/migration/UserDbMigration_1_to_2;

    invoke-direct {p1, p0}, Lcom/helpshift/db/user/migration/UserDbMigration_1_to_2;-><init>(Lcom/helpshift/db/user/UserDatabaseContract;)V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-object v0
.end method

.method public getTableNames()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "user_table"

    const-string v1, "redaction_info_table"

    const-string v2, "legacy_analytics_event_id_table"

    const-string v3, "legacy_profile_table"

    const-string v4, "cleared_user_table"

    .line 111
    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    const-string v0, "Helpshift_UserDB"

    return-object v0
.end method
