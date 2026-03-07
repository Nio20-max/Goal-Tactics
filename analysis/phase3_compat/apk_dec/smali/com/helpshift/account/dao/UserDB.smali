.class public Lcom/helpshift/account/dao/UserDB;
.super Ljava/lang/Object;
.source "UserDB.java"


# static fields
.field private static final INT_TRUE:Ljava/lang/Integer;

.field private static final TAG:Ljava/lang/String; = "Helpshift_UserDB"

.field private static final WHERE_LOCAL_ID_IS:Ljava/lang/String; = "_id = ?"

.field private static instance:Lcom/helpshift/account/dao/UserDB;


# instance fields
.field private final userDBHelper:Lcom/helpshift/db/user/UserDBHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x1

    .line 37
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/helpshift/account/dao/UserDB;->INT_TRUE:Ljava/lang/Integer;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Lcom/helpshift/db/user/UserDBHelper;

    new-instance v1, Lcom/helpshift/db/user/UserDatabaseContract;

    invoke-direct {v1}, Lcom/helpshift/db/user/UserDatabaseContract;-><init>()V

    invoke-direct {v0, p1, v1}, Lcom/helpshift/db/user/UserDBHelper;-><init>(Landroid/content/Context;Lcom/helpshift/db/base/DatabaseContract;)V

    iput-object v0, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    return-void
.end method

.method private clearedUserDMtoContentValues(Lcom/helpshift/account/domainmodel/ClearedUserDM;)Landroid/content/ContentValues;
    .locals 3

    .line 366
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 367
    iget-object v1, p1, Lcom/helpshift/account/domainmodel/ClearedUserDM;->localId:Ljava/lang/Long;

    const-string v2, "_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 368
    iget-object v1, p1, Lcom/helpshift/account/domainmodel/ClearedUserDM;->identifier:Ljava/lang/String;

    const-string v2, "identifier"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 369
    iget-object v1, p1, Lcom/helpshift/account/domainmodel/ClearedUserDM;->email:Ljava/lang/String;

    const-string v2, "email"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    iget-object v1, p1, Lcom/helpshift/account/domainmodel/ClearedUserDM;->authToken:Ljava/lang/String;

    const-string v2, "auth_token"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    iget-object v1, p1, Lcom/helpshift/account/domainmodel/ClearedUserDM;->deviceId:Ljava/lang/String;

    const-string v2, "deviceid"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    iget-object p1, p1, Lcom/helpshift/account/domainmodel/ClearedUserDM;->syncState:Lcom/helpshift/account/dao/ClearedUserSyncState;

    invoke-virtual {p1}, Lcom/helpshift/account/dao/ClearedUserSyncState;->ordinal()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string/jumbo v1, "sync_state"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    return-object v0
.end method

.method private declared-synchronized createUser(Lcom/helpshift/account/domainmodel/UserDM;Z)Lcom/helpshift/account/domainmodel/UserDM;
    .locals 4

    monitor-enter p0

    const/4 v0, 0x0

    .line 59
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v1}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 60
    invoke-direct {p0, p1}, Lcom/helpshift/account/dao/UserDB;->userDMToContentValues(Lcom/helpshift/account/domainmodel/UserDM;)Landroid/content/ContentValues;

    move-result-object v2

    const-string/jumbo v3, "user_table"

    .line 61
    invoke-virtual {v1, v3, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    const-string v2, "Helpshift_UserDB"

    const-string v3, "Error in creating user"

    .line 64
    invoke-static {v2, v3, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    if-eqz p2, :cond_0

    .line 66
    iget-object p2, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {p2}, Lcom/helpshift/db/user/UserDBHelper;->close()V

    const/4 p2, 0x0

    .line 67
    invoke-direct {p0, p1, p2}, Lcom/helpshift/account/dao/UserDB;->createUser(Lcom/helpshift/account/domainmodel/UserDM;Z)Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_0
    move-object p2, v0

    :goto_0
    if-nez p2, :cond_1

    .line 72
    monitor-exit p0

    return-object v0

    .line 74
    :cond_1
    :try_start_2
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/account/dao/UserDB;->getUserDMWithLocalId(Lcom/helpshift/account/domainmodel/UserDM;J)Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object p1

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method private cursorToClearedUserDM(Landroid/database/Cursor;)Lcom/helpshift/account/domainmodel/ClearedUserDM;
    .locals 9

    const-string v0, "_id"

    .line 329
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const-string v0, "identifier"

    .line 331
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string v0, "email"

    .line 332
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v0, "deviceid"

    .line 333
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const-string v0, "auth_token"

    .line 334
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v0, "sync_state"

    .line 337
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    .line 336
    invoke-direct {p0, p1}, Lcom/helpshift/account/dao/UserDB;->intToClearedUserSyncState(I)Lcom/helpshift/account/dao/ClearedUserSyncState;

    move-result-object v8

    .line 339
    new-instance p1, Lcom/helpshift/account/domainmodel/ClearedUserDM;

    move-object v2, p1

    invoke-direct/range {v2 .. v8}, Lcom/helpshift/account/domainmodel/ClearedUserDM;-><init>(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/account/dao/ClearedUserSyncState;)V

    return-object p1
.end method

.method private cursorToLegacyProfile(Landroid/database/Cursor;)Lcom/helpshift/migration/legacyUser/LegacyProfile;
    .locals 7

    const-string v0, "identifier"

    .line 350
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v0, "email"

    .line 351
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v0, "name"

    .line 352
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string v0, "serverid"

    .line 353
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v0, "migration_state"

    .line 356
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    .line 355
    invoke-direct {p0, p1}, Lcom/helpshift/account/dao/UserDB;->intToMigrationState(I)Lcom/helpshift/migration/MigrationState;

    move-result-object v6

    .line 358
    new-instance p1, Lcom/helpshift/migration/legacyUser/LegacyProfile;

    move-object v1, p1

    invoke-direct/range {v1 .. v6}, Lcom/helpshift/migration/legacyUser/LegacyProfile;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/migration/MigrationState;)V

    return-object p1
.end method

.method private cursorToRedactionDetail(Landroid/database/Cursor;)Lcom/helpshift/redaction/RedactionDetail;
    .locals 4

    const-string/jumbo v0, "user_local_id"

    .line 771
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    const-string v2, "redaction_state"

    .line 774
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 773
    invoke-direct {p0, v2}, Lcom/helpshift/account/dao/UserDB;->intToRedactionState(I)Lcom/helpshift/redaction/RedactionState;

    move-result-object v2

    const-string v3, "redaction_type"

    .line 777
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    .line 776
    invoke-direct {p0, p1}, Lcom/helpshift/account/dao/UserDB;->intToRedactionType(I)Lcom/helpshift/redaction/RedactionType;

    move-result-object p1

    .line 778
    new-instance v3, Lcom/helpshift/redaction/RedactionDetail;

    invoke-direct {v3, v0, v1, v2, p1}, Lcom/helpshift/redaction/RedactionDetail;-><init>(JLcom/helpshift/redaction/RedactionState;Lcom/helpshift/redaction/RedactionType;)V

    return-object v3
.end method

.method private cursorToUserDM(Landroid/database/Cursor;)Lcom/helpshift/account/domainmodel/UserDM;
    .locals 14

    const-string v0, "_id"

    .line 296
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const-string v0, "identifier"

    .line 297
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string v0, "name"

    .line 298
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const-string v0, "email"

    .line 299
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v0, "deviceid"

    .line 300
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const-string v0, "auth_token"

    .line 301
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    const-string v0, "active"

    .line 302
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    .line 303
    sget-object v1, Lcom/helpshift/account/dao/UserDB;->INT_TRUE:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v2, "anonymous"

    .line 304
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 305
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-ne v2, v10, :cond_1

    const/4 v10, 0x1

    goto :goto_1

    :cond_1
    const/4 v10, 0x0

    :goto_1
    const-string v2, "issue_exists"

    .line 306
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 307
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v12

    if-ne v2, v12, :cond_2

    const/4 v12, 0x1

    goto :goto_2

    :cond_2
    const/4 v12, 0x0

    :goto_2
    const-string v2, "push_token_synced"

    .line 309
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 310
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v2, v1, :cond_3

    const/4 v1, 0x1

    goto :goto_3

    :cond_3
    const/4 v1, 0x0

    :goto_3
    const-string v2, "initial_state_synced"

    .line 313
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    .line 312
    invoke-direct {p0, p1}, Lcom/helpshift/account/dao/UserDB;->intToUserSyncStatus(I)Lcom/helpshift/account/domainmodel/UserSyncStatus;

    move-result-object v13

    .line 315
    new-instance p1, Lcom/helpshift/account/domainmodel/UserDM;

    move-object v2, p1

    move v8, v0

    move v9, v10

    move v10, v1

    invoke-direct/range {v2 .. v13}, Lcom/helpshift/account/domainmodel/UserDM;-><init>(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZLjava/lang/String;ZLcom/helpshift/account/domainmodel/UserSyncStatus;)V

    return-object p1
.end method

.method private getClearUserDMWithLocalId(Lcom/helpshift/account/domainmodel/ClearedUserDM;J)Lcom/helpshift/account/domainmodel/ClearedUserDM;
    .locals 8

    .line 450
    new-instance v7, Lcom/helpshift/account/domainmodel/ClearedUserDM;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iget-object v2, p1, Lcom/helpshift/account/domainmodel/ClearedUserDM;->identifier:Ljava/lang/String;

    iget-object v3, p1, Lcom/helpshift/account/domainmodel/ClearedUserDM;->email:Ljava/lang/String;

    iget-object v4, p1, Lcom/helpshift/account/domainmodel/ClearedUserDM;->authToken:Ljava/lang/String;

    iget-object v5, p1, Lcom/helpshift/account/domainmodel/ClearedUserDM;->deviceId:Ljava/lang/String;

    iget-object v6, p1, Lcom/helpshift/account/domainmodel/ClearedUserDM;->syncState:Lcom/helpshift/account/dao/ClearedUserSyncState;

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/helpshift/account/domainmodel/ClearedUserDM;-><init>(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/account/dao/ClearedUserSyncState;)V

    return-object v7
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/helpshift/account/dao/UserDB;
    .locals 2

    const-class v0, Lcom/helpshift/account/dao/UserDB;

    monitor-enter v0

    .line 44
    :try_start_0
    sget-object v1, Lcom/helpshift/account/dao/UserDB;->instance:Lcom/helpshift/account/dao/UserDB;

    if-nez v1, :cond_0

    .line 45
    new-instance v1, Lcom/helpshift/account/dao/UserDB;

    invoke-direct {v1, p0}, Lcom/helpshift/account/dao/UserDB;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/helpshift/account/dao/UserDB;->instance:Lcom/helpshift/account/dao/UserDB;

    .line 47
    :cond_0
    sget-object p0, Lcom/helpshift/account/dao/UserDB;->instance:Lcom/helpshift/account/dao/UserDB;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private declared-synchronized getUser(Ljava/lang/String;[Ljava/lang/String;Z)Lcom/helpshift/account/domainmodel/UserDM;
    .locals 10

    monitor-enter p0

    const/4 v0, 0x0

    .line 116
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v1}, Lcom/helpshift/db/user/UserDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string/jumbo v3, "user_table"

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v5, p1

    move-object v6, p2

    .line 117
    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 126
    invoke-direct {p0, v1}, Lcom/helpshift/account/dao/UserDB;->cursorToUserDM(Landroid/database/Cursor;)Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_0
    if-eqz v1, :cond_3

    .line 138
    :goto_0
    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_2

    :catch_0
    move-exception v2

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_1
    move-exception v2

    move-object v1, v0

    :goto_1
    :try_start_3
    const-string v3, "Helpshift_UserDB"

    const-string v4, "Error in reading user"

    .line 130
    invoke-static {v3, v4, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    if-eqz p3, :cond_2

    .line 132
    iget-object p3, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {p3}, Lcom/helpshift/db/user/UserDBHelper;->close()V

    const/4 p3, 0x0

    .line 133
    invoke-direct {p0, p1, p2, p3}, Lcom/helpshift/account/dao/UserDB;->getUser(Ljava/lang/String;[Ljava/lang/String;Z)Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v1, :cond_1

    .line 138
    :try_start_4
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 133
    :cond_1
    monitor-exit p0

    return-object p1

    :cond_2
    if-eqz v1, :cond_3

    goto :goto_0

    .line 142
    :cond_3
    :goto_2
    monitor-exit p0

    return-object v0

    :catchall_1
    move-exception p1

    move-object v0, v1

    :goto_3
    if-eqz v0, :cond_4

    .line 138
    :try_start_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 140
    :cond_4
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private getUserDMWithLocalId(Lcom/helpshift/account/domainmodel/UserDM;J)Lcom/helpshift/account/domainmodel/UserDM;
    .locals 13

    .line 443
    new-instance v12, Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getEmail()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getName()Ljava/lang/String;

    move-result-object v4

    .line 444
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getDeviceId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->isActiveUser()Z

    move-result v6

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->isAnonymousUser()Z

    move-result v7

    .line 445
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->isPushTokenSynced()Z

    move-result v8

    .line 446
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getAuthToken()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->issueExists()Z

    move-result v10

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getSyncState()Lcom/helpshift/account/domainmodel/UserSyncStatus;

    move-result-object v11

    move-object v0, v12

    invoke-direct/range {v0 .. v11}, Lcom/helpshift/account/domainmodel/UserDM;-><init>(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZLjava/lang/String;ZLcom/helpshift/account/domainmodel/UserSyncStatus;)V

    return-object v12
.end method

.method private intToClearedUserSyncState(I)Lcom/helpshift/account/dao/ClearedUserSyncState;
    .locals 1

    if-ltz p1, :cond_0

    const/4 v0, 0x3

    if-le p1, v0, :cond_1

    :cond_0
    const/4 p1, 0x0

    .line 728
    :cond_1
    invoke-static {}, Lcom/helpshift/account/dao/ClearedUserSyncState;->values()[Lcom/helpshift/account/dao/ClearedUserSyncState;

    move-result-object v0

    aget-object p1, v0, p1

    return-object p1
.end method

.method private intToMigrationState(I)Lcom/helpshift/migration/MigrationState;
    .locals 1

    if-ltz p1, :cond_0

    const/4 v0, 0x3

    if-le p1, v0, :cond_1

    :cond_0
    const/4 p1, 0x0

    .line 721
    :cond_1
    invoke-static {}, Lcom/helpshift/migration/MigrationState;->values()[Lcom/helpshift/migration/MigrationState;

    move-result-object v0

    aget-object p1, v0, p1

    return-object p1
.end method

.method private intToRedactionState(I)Lcom/helpshift/redaction/RedactionState;
    .locals 2

    .line 735
    invoke-static {}, Lcom/helpshift/redaction/RedactionState;->values()[Lcom/helpshift/redaction/RedactionState;

    move-result-object v0

    if-ltz p1, :cond_0

    .line 736
    array-length v1, v0

    if-le p1, v1, :cond_1

    :cond_0
    const/4 p1, 0x0

    .line 740
    :cond_1
    aget-object p1, v0, p1

    return-object p1
.end method

.method private intToRedactionType(I)Lcom/helpshift/redaction/RedactionType;
    .locals 2

    .line 747
    invoke-static {}, Lcom/helpshift/redaction/RedactionType;->values()[Lcom/helpshift/redaction/RedactionType;

    move-result-object v0

    if-ltz p1, :cond_0

    .line 748
    array-length v1, v0

    if-le p1, v1, :cond_1

    :cond_0
    const/4 p1, 0x0

    .line 751
    :cond_1
    aget-object p1, v0, p1

    return-object p1
.end method

.method private intToUserSyncStatus(I)Lcom/helpshift/account/domainmodel/UserSyncStatus;
    .locals 1

    if-ltz p1, :cond_0

    const/4 v0, 0x3

    if-le p1, v0, :cond_1

    :cond_0
    const/4 p1, 0x0

    .line 714
    :cond_1
    invoke-static {}, Lcom/helpshift/account/domainmodel/UserSyncStatus;->values()[Lcom/helpshift/account/domainmodel/UserSyncStatus;

    move-result-object v0

    aget-object p1, v0, p1

    return-object p1
.end method

.method private legacyAnalyticsIDPairToContentValues(Lcom/helpshift/common/platform/network/KeyValuePair;)Landroid/content/ContentValues;
    .locals 3

    .line 436
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 437
    iget-object v1, p1, Lcom/helpshift/common/platform/network/KeyValuePair;->key:Ljava/lang/String;

    const-string v2, "identifier"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 438
    iget-object p1, p1, Lcom/helpshift/common/platform/network/KeyValuePair;->value:Ljava/lang/String;

    const-string v1, "analytics_event_id"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private legacyProfileToContentValues(Lcom/helpshift/migration/legacyUser/LegacyProfile;)Landroid/content/ContentValues;
    .locals 3

    .line 426
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 427
    iget-object v1, p1, Lcom/helpshift/migration/legacyUser/LegacyProfile;->identifier:Ljava/lang/String;

    const-string v2, "identifier"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 428
    iget-object v1, p1, Lcom/helpshift/migration/legacyUser/LegacyProfile;->name:Ljava/lang/String;

    const-string v2, "name"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 429
    iget-object v1, p1, Lcom/helpshift/migration/legacyUser/LegacyProfile;->email:Ljava/lang/String;

    const-string v2, "email"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 430
    iget-object v1, p1, Lcom/helpshift/migration/legacyUser/LegacyProfile;->serverId:Ljava/lang/String;

    const-string v2, "serverid"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 431
    iget-object p1, p1, Lcom/helpshift/migration/legacyUser/LegacyProfile;->migrationState:Lcom/helpshift/migration/MigrationState;

    invoke-virtual {p1}, Lcom/helpshift/migration/MigrationState;->ordinal()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string v1, "migration_state"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    return-object v0
.end method

.method private redactionDetailToContentValues(Lcom/helpshift/redaction/RedactionDetail;)Landroid/content/ContentValues;
    .locals 3

    .line 758
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 759
    iget-wide v1, p1, Lcom/helpshift/redaction/RedactionDetail;->userLocalId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string/jumbo v2, "user_local_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 760
    iget-object v1, p1, Lcom/helpshift/redaction/RedactionDetail;->redactionState:Lcom/helpshift/redaction/RedactionState;

    .line 761
    invoke-virtual {v1}, Lcom/helpshift/redaction/RedactionState;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "redaction_state"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 762
    iget-object p1, p1, Lcom/helpshift/redaction/RedactionDetail;->redactionType:Lcom/helpshift/redaction/RedactionType;

    invoke-virtual {p1}, Lcom/helpshift/redaction/RedactionType;->ordinal()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string v1, "redaction_type"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    return-object v0
.end method

.method private declared-synchronized updateUser(Lcom/helpshift/account/domainmodel/UserDM;Z)Z
    .locals 8

    monitor-enter p0

    .line 83
    :try_start_0
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 84
    monitor-exit p0

    return v1

    :cond_0
    const/4 v0, 0x1

    .line 91
    :try_start_1
    iget-object v2, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v2}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 93
    invoke-direct {p0, p1}, Lcom/helpshift/account/dao/UserDB;->userDMToContentValues(Lcom/helpshift/account/domainmodel/UserDM;)Landroid/content/ContentValues;

    move-result-object v3

    const-string/jumbo v4, "user_table"

    const-string v5, "_id = ?"

    new-array v6, v0, [Ljava/lang/String;

    .line 97
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v1

    .line 94
    invoke-virtual {v2, v4, v3, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v1, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    const-string v2, "Helpshift_UserDB"

    const-string v3, "Error in updating user"

    .line 101
    invoke-static {v2, v3, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    if-eqz p2, :cond_1

    .line 103
    iget-object p2, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {p2}, Lcom/helpshift/db/user/UserDBHelper;->close()V

    .line 104
    invoke-direct {p0, p1, v1}, Lcom/helpshift/account/dao/UserDB;->updateUser(Lcom/helpshift/account/domainmodel/UserDM;Z)Z

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return p1

    .line 108
    :cond_1
    :goto_0
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private userDMToContentValues(Lcom/helpshift/account/domainmodel/UserDM;)Landroid/content/ContentValues;
    .locals 4

    .line 377
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 378
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 379
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    const-string v2, "_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 382
    :cond_0
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    const-string v2, "identifier"

    const-string v3, ""

    if-eqz v1, :cond_1

    .line 383
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 386
    :cond_1
    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 389
    :goto_0
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "name"

    if-eqz v1, :cond_2

    .line 390
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 393
    :cond_2
    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 396
    :goto_1
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getEmail()Ljava/lang/String;

    move-result-object v1

    const-string v2, "email"

    if-eqz v1, :cond_3

    .line 397
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getEmail()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 400
    :cond_3
    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    :goto_2
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    const-string v2, "deviceid"

    if-eqz v1, :cond_4

    .line 404
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 407
    :cond_4
    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 410
    :goto_3
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getAuthToken()Ljava/lang/String;

    move-result-object v1

    const-string v2, "auth_token"

    if-eqz v1, :cond_5

    .line 411
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getAuthToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 414
    :cond_5
    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    :goto_4
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->isActiveUser()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "active"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 418
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->isAnonymousUser()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "anonymous"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 419
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->issueExists()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "issue_exists"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 420
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->isPushTokenSynced()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "push_token_synced"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 421
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getSyncState()Lcom/helpshift/account/domainmodel/UserSyncStatus;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserSyncStatus;->ordinal()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string v1, "initial_state_synced"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    return-object v0
.end method


# virtual methods
.method declared-synchronized activateUser(Ljava/lang/Long;)Z
    .locals 9

    monitor-enter p0

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 226
    monitor-exit p0

    return v0

    :cond_0
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 233
    :try_start_0
    iget-object v3, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v3}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 234
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string v4, "active"

    .line 235
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 236
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    const-string v5, "active"

    .line 237
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 239
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string/jumbo v5, "user_table"

    const-string v6, "_id = ?"

    new-array v7, v2, [Ljava/lang/String;

    .line 244
    invoke-virtual {p1}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v0

    .line 241
    invoke-virtual {v1, v5, v3, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_1

    const-string/jumbo v3, "user_table"

    const-string v5, "_id != ?"

    new-array v6, v2, [Ljava/lang/String;

    .line 252
    invoke-virtual {p1}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v6, v0

    .line 249
    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 254
    :cond_1
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_2

    .line 263
    :try_start_1
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string v0, "Helpshift_UserDB"

    const-string v1, "Error in activating user in finally block"

    .line 267
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_1
    move-exception p1

    :try_start_3
    const-string v2, "Helpshift_UserDB"

    const-string v3, "Error in activating user"

    .line 258
    invoke-static {v2, v3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v1, :cond_3

    .line 263
    :try_start_4
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    :catch_2
    move-exception p1

    :try_start_5
    const-string v1, "Helpshift_UserDB"

    const-string v2, "Error in activating user in finally block"

    .line 267
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 271
    :cond_3
    :goto_1
    monitor-exit p0

    return v0

    :goto_2
    if-eqz v1, :cond_4

    .line 263
    :try_start_6
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception p1

    goto :goto_4

    :catch_3
    move-exception v0

    :try_start_7
    const-string v1, "Helpshift_UserDB"

    const-string v2, "Error in activating user in finally block"

    .line 267
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 269
    :cond_4
    :goto_3
    throw p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :goto_4
    monitor-exit p0

    throw p1
.end method

.method createUser(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/account/domainmodel/UserDM;
    .locals 1

    const/4 v0, 0x1

    .line 51
    invoke-direct {p0, p1, v0}, Lcom/helpshift/account/dao/UserDB;->createUser(Lcom/helpshift/account/domainmodel/UserDM;Z)Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object p1

    return-object p1
.end method

.method declared-synchronized deleteClearedUser(Ljava/lang/Long;)Z
    .locals 8

    monitor-enter p0

    const/4 v0, 0x0

    const/4 v1, 0x1

    const-wide/16 v2, 0x0

    .line 538
    :try_start_0
    iget-object v4, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v4}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string/jumbo v5, "user_table"

    const-string v6, "_id = ?"

    new-array v7, v1, [Ljava/lang/String;

    .line 541
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v7, v0

    .line 539
    invoke-virtual {v4, v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    int-to-long v4, p1

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    const-string v4, "Helpshift_UserDB"

    const-string v5, "Error in deleting cleared user"

    .line 544
    invoke-static {v4, v5, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-wide v4, v2

    :goto_0
    cmp-long p1, v4, v2

    if-lez p1, :cond_0

    const/4 v0, 0x1

    .line 546
    :cond_0
    monitor-exit p0

    return v0

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method declared-synchronized deleteLegacyProfile(Ljava/lang/String;)V
    .locals 5

    monitor-enter p0

    .line 584
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "legacy_profile_table"

    const-string v2, "identifier = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    .line 585
    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    const-string v0, "Helpshift_UserDB"

    const-string v1, "Error in deleting legacy profile"

    .line 590
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 592
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method declared-synchronized deleteRedactionDetail(J)V
    .locals 5

    monitor-enter p0

    .line 859
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "redaction_info_table"

    const-string/jumbo v2, "user_local_id = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    .line 862
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v3, v4

    .line 860
    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    const-string p2, "Helpshift_UserDB"

    const-string v0, "Error in deleting redaction detail"

    .line 865
    invoke-static {p2, v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 867
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method declared-synchronized deleteUser(Ljava/lang/Long;)Z
    .locals 8

    monitor-enter p0

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 277
    monitor-exit p0

    return v0

    :cond_0
    const/4 v1, 0x1

    const-wide/16 v2, 0x0

    .line 284
    :try_start_0
    iget-object v4, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v4}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string/jumbo v5, "user_table"

    const-string v6, "_id = ?"

    new-array v7, v1, [Ljava/lang/String;

    .line 287
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v7, v0

    .line 285
    invoke-virtual {v4, v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    int-to-long v4, p1

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    const-string v4, "Helpshift_UserDB"

    const-string v5, "Error in deleting user"

    .line 290
    invoke-static {v4, v5, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-wide v4, v2

    :goto_0
    cmp-long p1, v4, v2

    if-lez p1, :cond_1

    const/4 v0, 0x1

    .line 292
    :cond_1
    monitor-exit p0

    return v0

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method dropAndCreateDatabase()V
    .locals 2

    .line 870
    iget-object v0, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/db/user/UserDBHelper;->dropAndCreateAllTables(Landroid/database/sqlite/SQLiteDatabase;)Z

    return-void
.end method

.method declared-synchronized fetchClearedUsers()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/account/domainmodel/ClearedUserDM;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 478
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v1, 0x0

    .line 482
    :try_start_1
    iget-object v2, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v2}, Lcom/helpshift/db/user/UserDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "cleared_user_table"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    .line 483
    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 491
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 493
    :cond_0
    invoke-direct {p0, v1}, Lcom/helpshift/account/dao/UserDB;->cursorToClearedUserDM(Landroid/database/Cursor;)Lcom/helpshift/account/domainmodel/ClearedUserDM;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 494
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v2, :cond_0

    :cond_1
    if-eqz v1, :cond_2

    .line 502
    :goto_0
    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v2

    :try_start_3
    const-string v3, "Helpshift_UserDB"

    const-string v4, "Error in reading all cleared users"

    .line 498
    invoke-static {v3, v4, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v1, :cond_2

    goto :goto_0

    .line 506
    :cond_2
    :goto_1
    monitor-exit p0

    return-object v0

    :goto_2
    if-eqz v1, :cond_3

    .line 502
    :try_start_4
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 504
    :cond_3
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized fetchLegacyAnalyticsEventId(Ljava/lang/String;)Ljava/lang/String;
    .locals 10

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    new-array v5, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p1, v5, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/4 p1, 0x0

    .line 684
    :try_start_1
    iget-object v0, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/user/UserDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "legacy_analytics_event_id_table"

    const/4 v3, 0x0

    const-string v4, "identifier = ?"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 685
    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 693
    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "analytics_event_id"

    .line 695
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    .line 694
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_0
    if-eqz v0, :cond_1

    .line 703
    :goto_0
    :try_start_3
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_2

    :catch_0
    move-exception v1

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object v9, v0

    move-object v0, p1

    move-object p1, v9

    goto :goto_3

    :catch_1
    move-exception v1

    move-object v0, p1

    :goto_1
    :try_start_4
    const-string v2, "Helpshift_UserDB"

    const-string v3, "Error in reading legacy analytics eventID with identifier"

    .line 699
    invoke-static {v2, v3, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v0, :cond_1

    goto :goto_0

    .line 707
    :cond_1
    :goto_2
    monitor-exit p0

    return-object p1

    :catchall_1
    move-exception p1

    :goto_3
    if-eqz v0, :cond_2

    .line 703
    :try_start_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 705
    :cond_2
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized fetchLegacyProfile(Ljava/lang/String;)Lcom/helpshift/migration/legacyUser/LegacyProfile;
    .locals 10

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    new-array v5, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p1, v5, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/4 p1, 0x0

    .line 601
    :try_start_1
    iget-object v0, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/user/UserDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "legacy_profile_table"

    const/4 v3, 0x0

    const-string v4, "identifier = ?"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 602
    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 610
    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 611
    invoke-direct {p0, v0}, Lcom/helpshift/account/dao/UserDB;->cursorToLegacyProfile(Landroid/database/Cursor;)Lcom/helpshift/migration/legacyUser/LegacyProfile;

    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_0
    if-eqz v0, :cond_1

    .line 619
    :goto_0
    :try_start_3
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_2

    :catch_0
    move-exception v1

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object v9, v0

    move-object v0, p1

    move-object p1, v9

    goto :goto_3

    :catch_1
    move-exception v1

    move-object v0, p1

    :goto_1
    :try_start_4
    const-string v2, "Helpshift_UserDB"

    const-string v3, "Error in reading legacy profile with identifier"

    .line 615
    invoke-static {v2, v3, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v0, :cond_1

    goto :goto_0

    .line 623
    :cond_1
    :goto_2
    monitor-exit p0

    return-object p1

    :catchall_1
    move-exception p1

    :goto_3
    if-eqz v0, :cond_2

    .line 619
    :try_start_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 621
    :cond_2
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized fetchRedactionDetail(J)Lcom/helpshift/redaction/RedactionDetail;
    .locals 10

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    new-array v5, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    .line 814
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v5, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/4 p1, 0x0

    .line 816
    :try_start_1
    iget-object p2, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {p2}, Lcom/helpshift/db/user/UserDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "redaction_info_table"

    const/4 v3, 0x0

    const-string/jumbo v4, "user_local_id = ?"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 817
    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 825
    :try_start_2
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 826
    invoke-direct {p0, p2}, Lcom/helpshift/account/dao/UserDB;->cursorToRedactionDetail(Landroid/database/Cursor;)Lcom/helpshift/redaction/RedactionDetail;

    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_0
    if-eqz p2, :cond_1

    .line 834
    :goto_0
    :try_start_3
    invoke-interface {p2}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_1

    :catchall_0
    move-exception p2

    move-object v9, p2

    move-object p2, p1

    move-object p1, v9

    goto :goto_3

    :catch_1
    move-exception v0

    move-object p2, p1

    :goto_1
    :try_start_4
    const-string v1, "Helpshift_UserDB"

    const-string v2, "Error in reading redaction detail of the user"

    .line 830
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz p2, :cond_1

    goto :goto_0

    .line 837
    :cond_1
    :goto_2
    monitor-exit p0

    return-object p1

    :catchall_1
    move-exception p1

    :goto_3
    if-eqz p2, :cond_2

    .line 834
    :try_start_5
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 836
    :cond_2
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized fetchUser(Ljava/lang/Long;)Lcom/helpshift/account/domainmodel/UserDM;
    .locals 3

    monitor-enter p0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 148
    monitor-exit p0

    return-object p1

    :cond_0
    const/4 v0, 0x1

    :try_start_0
    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 150
    invoke-virtual {p1}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    const-string p1, "_id = ?"

    .line 151
    invoke-direct {p0, p1, v1, v0}, Lcom/helpshift/account/dao/UserDB;->getUser(Ljava/lang/String;[Ljava/lang/String;Z)Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized fetchUser(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/account/domainmodel/UserDM;
    .locals 3

    monitor-enter p0

    if-nez p1, :cond_0

    if-nez p2, :cond_0

    const/4 p1, 0x0

    .line 157
    monitor-exit p0

    return-object p1

    :cond_0
    if-nez p1, :cond_1

    :try_start_0
    const-string p1, ""

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_1
    :goto_0
    if-nez p2, :cond_2

    const-string p2, ""

    :cond_2
    const-string v0, "identifier = ? AND email = ?"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p2, v1, p1

    .line 170
    invoke-direct {p0, v0, v1, p1}, Lcom/helpshift/account/dao/UserDB;->getUser(Ljava/lang/String;[Ljava/lang/String;Z)Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method declared-synchronized fetchUsers()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/account/domainmodel/UserDM;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 192
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v1, 0x0

    .line 196
    :try_start_1
    iget-object v2, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v2}, Lcom/helpshift/db/user/UserDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string/jumbo v4, "user_table"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    .line 197
    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 205
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 207
    :cond_0
    invoke-direct {p0, v1}, Lcom/helpshift/account/dao/UserDB;->cursorToUserDM(Landroid/database/Cursor;)Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 208
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v2, :cond_0

    :cond_1
    if-eqz v1, :cond_2

    .line 216
    :goto_0
    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v2

    :try_start_3
    const-string v3, "Helpshift_UserDB"

    const-string v4, "Error in reading all users"

    .line 212
    invoke-static {v3, v4, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v1, :cond_2

    goto :goto_0

    .line 220
    :cond_2
    :goto_1
    monitor-exit p0

    return-object v0

    :goto_2
    if-eqz v1, :cond_3

    .line 216
    :try_start_4
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 218
    :cond_3
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getActiveUser()Lcom/helpshift/account/domainmodel/UserDM;
    .locals 5

    monitor-enter p0

    :try_start_0
    const-string v0, "active = ?"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    .line 176
    sget-object v4, Lcom/helpshift/account/dao/UserDB;->INT_TRUE:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 178
    invoke-direct {p0, v0, v2, v1}, Lcom/helpshift/account/dao/UserDB;->getUser(Ljava/lang/String;[Ljava/lang/String;Z)Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getAnonymousUser()Lcom/helpshift/account/domainmodel/UserDM;
    .locals 5

    monitor-enter p0

    :try_start_0
    const-string v0, "anonymous = ?"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    .line 184
    sget-object v4, Lcom/helpshift/account/dao/UserDB;->INT_TRUE:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 186
    invoke-direct {p0, v0, v2, v1}, Lcom/helpshift/account/dao/UserDB;->getUser(Ljava/lang/String;[Ljava/lang/String;Z)Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized insertClearedUser(Lcom/helpshift/account/domainmodel/ClearedUserDM;)Lcom/helpshift/account/domainmodel/ClearedUserDM;
    .locals 4

    monitor-enter p0

    const/4 v0, 0x0

    .line 461
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v1}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 462
    invoke-direct {p0, p1}, Lcom/helpshift/account/dao/UserDB;->clearedUserDMtoContentValues(Lcom/helpshift/account/domainmodel/ClearedUserDM;)Landroid/content/ContentValues;

    move-result-object v2

    const-string v3, "cleared_user_table"

    .line 463
    invoke-virtual {v1, v3, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    const-string v2, "Helpshift_UserDB"

    const-string v3, "Error in creating cleared user"

    .line 466
    invoke-static {v2, v3, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v1, v0

    :goto_0
    if-nez v1, :cond_0

    .line 470
    monitor-exit p0

    return-object v0

    .line 472
    :cond_0
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/account/dao/UserDB;->getClearUserDMWithLocalId(Lcom/helpshift/account/domainmodel/ClearedUserDM;J)Lcom/helpshift/account/domainmodel/ClearedUserDM;

    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object p1

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method declared-synchronized insertRedactionDetail(Lcom/helpshift/redaction/RedactionDetail;)V
    .locals 3

    monitor-enter p0

    .line 786
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 787
    invoke-direct {p0, p1}, Lcom/helpshift/account/dao/UserDB;->redactionDetailToContentValues(Lcom/helpshift/redaction/RedactionDetail;)Landroid/content/ContentValues;

    move-result-object p1

    const-string v1, "redaction_info_table"

    const/4 v2, 0x0

    .line 788
    invoke-virtual {v0, v1, v2, p1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    const-string v0, "Helpshift_UserDB"

    const-string v1, "Error in inserting redaction info of the user"

    .line 791
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 793
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method declared-synchronized storeLegacyAnalyticsEventIds(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/common/platform/network/KeyValuePair;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    const/4 v0, 0x0

    .line 653
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v1}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 655
    :try_start_1
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 656
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/common/platform/network/KeyValuePair;

    .line 657
    invoke-direct {p0, v2}, Lcom/helpshift/account/dao/UserDB;->legacyAnalyticsIDPairToContentValues(Lcom/helpshift/common/platform/network/KeyValuePair;)Landroid/content/ContentValues;

    move-result-object v2

    const-string v3, "legacy_analytics_event_id_table"

    .line 658
    invoke-virtual {v1, v3, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_0

    .line 660
    :cond_0
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_1

    .line 668
    :try_start_2
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_3

    :catch_0
    move-exception p1

    :try_start_3
    const-string v0, "Helpshift_UserDB"

    const-string v1, "Error in storing legacy analytics events in finally block"

    .line 672
    :goto_1
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_3

    :catchall_0
    move-exception p1

    move-object v0, v1

    goto :goto_4

    :catch_1
    move-exception p1

    move-object v0, v1

    goto :goto_2

    :catchall_1
    move-exception p1

    goto :goto_4

    :catch_2
    move-exception p1

    :goto_2
    :try_start_4
    const-string v1, "Helpshift_UserDB"

    const-string v2, "Error in storing legacy analytics events"

    .line 663
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v0, :cond_1

    .line 668
    :try_start_5
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_3

    :catch_3
    move-exception p1

    :try_start_6
    const-string v0, "Helpshift_UserDB"

    const-string v1, "Error in storing legacy analytics events in finally block"
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto :goto_1

    .line 675
    :cond_1
    :goto_3
    monitor-exit p0

    return-void

    :goto_4
    if-eqz v0, :cond_2

    .line 668
    :try_start_7
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto :goto_5

    :catchall_2
    move-exception p1

    goto :goto_6

    :catch_4
    move-exception v0

    :try_start_8
    const-string v1, "Helpshift_UserDB"

    const-string v2, "Error in storing legacy analytics events in finally block"

    .line 672
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 674
    :cond_2
    :goto_5
    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :goto_6
    monitor-exit p0

    throw p1
.end method

.method declared-synchronized storeLegacyProfiles(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/migration/legacyUser/LegacyProfile;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    const/4 v0, 0x0

    .line 553
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v1}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 555
    :try_start_1
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 557
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/migration/legacyUser/LegacyProfile;

    .line 558
    invoke-direct {p0, v2}, Lcom/helpshift/account/dao/UserDB;->legacyProfileToContentValues(Lcom/helpshift/migration/legacyUser/LegacyProfile;)Landroid/content/ContentValues;

    move-result-object v2

    const-string v3, "legacy_profile_table"

    .line 559
    invoke-virtual {v1, v3, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_0

    .line 563
    :cond_0
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_1

    .line 571
    :try_start_2
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_3

    :catch_0
    move-exception p1

    :try_start_3
    const-string v0, "Helpshift_UserDB"

    const-string v1, "Error in storing legacy profiles in finally block"

    .line 575
    :goto_1
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_3

    :catchall_0
    move-exception p1

    move-object v0, v1

    goto :goto_4

    :catch_1
    move-exception p1

    move-object v0, v1

    goto :goto_2

    :catchall_1
    move-exception p1

    goto :goto_4

    :catch_2
    move-exception p1

    :goto_2
    :try_start_4
    const-string v1, "Helpshift_UserDB"

    const-string v2, "Error in storing legacy profiles"

    .line 566
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v0, :cond_1

    .line 571
    :try_start_5
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_3

    :catch_3
    move-exception p1

    :try_start_6
    const-string v0, "Helpshift_UserDB"

    const-string v1, "Error in storing legacy profiles in finally block"
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto :goto_1

    .line 578
    :cond_1
    :goto_3
    monitor-exit p0

    return-void

    :goto_4
    if-eqz v0, :cond_2

    .line 571
    :try_start_7
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto :goto_5

    :catchall_2
    move-exception p1

    goto :goto_6

    :catch_4
    move-exception v0

    :try_start_8
    const-string v1, "Helpshift_UserDB"

    const-string v2, "Error in storing legacy profiles in finally block"

    .line 575
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 577
    :cond_2
    :goto_5
    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :goto_6
    monitor-exit p0

    throw p1
.end method

.method declared-synchronized updateClearedUserSyncState(Ljava/lang/Long;Lcom/helpshift/account/dao/ClearedUserSyncState;)Z
    .locals 6

    monitor-enter p0

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 515
    :try_start_0
    iget-object v2, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v2}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 517
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string/jumbo v4, "sync_state"

    .line 518
    invoke-virtual {p2}, Lcom/helpshift/account/dao/ClearedUserSyncState;->ordinal()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v3, v4, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p2, "cleared_user_table"

    const-string v4, "_id = ?"

    new-array v5, v0, [Ljava/lang/String;

    .line 522
    invoke-virtual {p1}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v5, v1

    .line 519
    invoke-virtual {v2, p2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    const-string p2, "Helpshift_UserDB"

    const-string v0, "Error in updating cleared user sync status"

    .line 526
    invoke-static {p2, v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, 0x0

    .line 529
    :goto_0
    monitor-exit p0

    return v0

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method declared-synchronized updateRedactionDetail(Lcom/helpshift/redaction/RedactionDetail;)V
    .locals 8

    monitor-enter p0

    .line 798
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 799
    invoke-direct {p0, p1}, Lcom/helpshift/account/dao/UserDB;->redactionDetailToContentValues(Lcom/helpshift/redaction/RedactionDetail;)Landroid/content/ContentValues;

    move-result-object v1

    const-string v2, "redaction_info_table"

    const-string/jumbo v3, "user_local_id = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    .line 800
    iget-wide v6, p1, Lcom/helpshift/redaction/RedactionDetail;->userLocalId:J

    .line 803
    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v5

    .line 800
    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    const-string v0, "Helpshift_UserDB"

    const-string v1, "Error in updating redaction detail"

    .line 806
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 808
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method declared-synchronized updateRedactionState(JLcom/helpshift/redaction/RedactionState;)V
    .locals 5

    monitor-enter p0

    .line 843
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 844
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "redaction_state"

    .line 845
    invoke-virtual {p3}, Lcom/helpshift/redaction/RedactionState;->ordinal()I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {v1, v2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p3, "redaction_info_table"

    const-string/jumbo v2, "user_local_id = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    .line 849
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v3, v4

    .line 846
    invoke-virtual {v0, p3, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    const-string p2, "Helpshift_UserDB"

    const-string p3, "Error in updating redaction status"

    .line 852
    invoke-static {p2, p3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 854
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method declared-synchronized updateUser(Lcom/helpshift/account/domainmodel/UserDM;)Z
    .locals 1

    monitor-enter p0

    const/4 v0, 0x1

    .line 79
    :try_start_0
    invoke-direct {p0, p1, v0}, Lcom/helpshift/account/dao/UserDB;->updateUser(Lcom/helpshift/account/domainmodel/UserDM;Z)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized updateUserMigrationState(Ljava/lang/String;Lcom/helpshift/migration/MigrationState;)Z
    .locals 6

    monitor-enter p0

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 632
    :try_start_0
    iget-object v2, p0, Lcom/helpshift/account/dao/UserDB;->userDBHelper:Lcom/helpshift/db/user/UserDBHelper;

    invoke-virtual {v2}, Lcom/helpshift/db/user/UserDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 634
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string v4, "migration_state"

    .line 635
    invoke-virtual {p2}, Lcom/helpshift/migration/MigrationState;->ordinal()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v3, v4, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p2, "legacy_profile_table"

    const-string v4, "identifier = ?"

    new-array v5, v0, [Ljava/lang/String;

    aput-object p1, v5, v1

    .line 636
    invoke-virtual {v2, p2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    const-string p2, "Helpshift_UserDB"

    const-string v0, "Error in updating user migration sync status"

    .line 643
    invoke-static {p2, v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, 0x0

    .line 646
    :goto_0
    monitor-exit p0

    return v0

    :goto_1
    monitor-exit p0

    throw p1
.end method
