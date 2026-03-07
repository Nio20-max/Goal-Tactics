.class public Lcom/helpshift/db/network/HSNetworkMetadataDB;
.super Ljava/lang/Object;
.source "HSNetworkMetadataDB.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_NetworkDB"

.field private static mInstance:Lcom/helpshift/db/network/HSNetworkMetadataDB;


# instance fields
.field private final hsNetworkDbHelper:Lcom/helpshift/db/network/HSNetworkDBHelper;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lcom/helpshift/db/network/HSNetworkDBHelper;

    new-instance v1, Lcom/helpshift/db/network/HSNetworkDatabaseContract;

    invoke-direct {v1}, Lcom/helpshift/db/network/HSNetworkDatabaseContract;-><init>()V

    invoke-direct {v0, p1, v1}, Lcom/helpshift/db/network/HSNetworkDBHelper;-><init>(Landroid/content/Context;Lcom/helpshift/db/base/DatabaseContract;)V

    iput-object v0, p0, Lcom/helpshift/db/network/HSNetworkMetadataDB;->hsNetworkDbHelper:Lcom/helpshift/db/network/HSNetworkDBHelper;

    return-void
.end method

.method private cursorToUrlMetadata(Landroid/database/Cursor;)Lcom/helpshift/common/domain/network/HSUrlMetadata;
    .locals 7

    const-string v0, "url"

    .line 182
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v0, "etag"

    .line 183
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v0, "last_fetch_ts"

    .line 184
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 185
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    :goto_0
    move-wide v4, v0

    const/4 v0, 0x0

    const-string v1, "is_last_fetch_success"

    .line 187
    invoke-static {p1, v1, v0}, Lcom/helpshift/util/DatabaseUtils;->parseBooleanColumnSafe(Landroid/database/Cursor;Ljava/lang/String;Z)Z

    move-result v6

    .line 188
    new-instance p1, Lcom/helpshift/common/domain/network/HSUrlMetadata;

    move-object v1, p1

    invoke-direct/range {v1 .. v6}, Lcom/helpshift/common/domain/network/HSUrlMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;JZ)V

    return-object p1
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/helpshift/db/network/HSNetworkMetadataDB;
    .locals 2

    const-class v0, Lcom/helpshift/db/network/HSNetworkMetadataDB;

    monitor-enter v0

    .line 27
    :try_start_0
    sget-object v1, Lcom/helpshift/db/network/HSNetworkMetadataDB;->mInstance:Lcom/helpshift/db/network/HSNetworkMetadataDB;

    if-nez v1, :cond_0

    .line 28
    new-instance v1, Lcom/helpshift/db/network/HSNetworkMetadataDB;

    invoke-direct {v1, p0}, Lcom/helpshift/db/network/HSNetworkMetadataDB;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/helpshift/db/network/HSNetworkMetadataDB;->mInstance:Lcom/helpshift/db/network/HSNetworkMetadataDB;

    .line 30
    :cond_0
    sget-object p0, Lcom/helpshift/db/network/HSNetworkMetadataDB;->mInstance:Lcom/helpshift/db/network/HSNetworkMetadataDB;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private metadataToContentValues(Lcom/helpshift/common/domain/network/HSUrlMetadata;)Landroid/content/ContentValues;
    .locals 3

    .line 174
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 175
    iget-wide v1, p1, Lcom/helpshift/common/domain/network/HSUrlMetadata;->lastFetchTimestamp:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "last_fetch_ts"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 176
    iget-object v1, p1, Lcom/helpshift/common/domain/network/HSUrlMetadata;->etag:Ljava/lang/String;

    const-string v2, "etag"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    iget-boolean p1, p1, Lcom/helpshift/common/domain/network/HSUrlMetadata;->isLastFetchSuccessful:Z

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string v1, "is_last_fetch_success"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    return-object v0
.end method

.method private declared-synchronized updateUrlMetadataWithValues(Ljava/lang/String;Landroid/content/ContentValues;)Z
    .locals 5

    monitor-enter p0

    :try_start_0
    const-string v0, "url = ?"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v2, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    :try_start_1
    iget-object p1, p0, Lcom/helpshift/db/network/HSNetworkMetadataDB;->hsNetworkDbHelper:Lcom/helpshift/db/network/HSNetworkDBHelper;

    invoke-virtual {p1}, Lcom/helpshift/db/network/HSNetworkDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const-string v4, "hs_url_metadata_table"

    .line 88
    invoke-virtual {p1, v4, p2, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    :try_start_2
    const-string p1, "Helpshift_NetworkDB"

    const-string p2, "Error in updating the metadata of url"

    .line 94
    invoke-static {p1, p2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const/4 p1, 0x0

    :goto_0
    if-lez p1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    .line 96
    :goto_1
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method public declared-synchronized deleteAllUrlsMetadata()Z
    .locals 3

    monitor-enter p0

    .line 162
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/db/network/HSNetworkMetadataDB;->hsNetworkDbHelper:Lcom/helpshift/db/network/HSNetworkDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/network/HSNetworkDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "hs_url_metadata_table"

    const/4 v2, 0x0

    .line 163
    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    .line 164
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    :try_start_1
    const-string v0, "Helpshift_NetworkDB"

    const-string v1, "Error in deleting urls metadata"

    .line 167
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, 0x0

    .line 168
    monitor-exit p0

    return v0

    :goto_0
    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized deleteMetadataForUrl(Ljava/lang/String;)Z
    .locals 5

    monitor-enter p0

    :try_start_0
    const-string v0, "url = ? "

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v2, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 145
    :try_start_1
    iget-object p1, p0, Lcom/helpshift/db/network/HSNetworkMetadataDB;->hsNetworkDbHelper:Lcom/helpshift/db/network/HSNetworkDBHelper;

    invoke-virtual {p1}, Lcom/helpshift/db/network/HSNetworkDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const-string v4, "hs_url_metadata_table"

    .line 146
    invoke-virtual {p1, v4, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 147
    monitor-exit p0

    return v1

    :catch_0
    :try_start_2
    const-string p1, "Helpshift_NetworkDB"

    const-string v0, "Error in deleting metadata for url"

    .line 150
    invoke-static {p1, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 151
    monitor-exit p0

    return v3

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized insertMetadataForUrl(Ljava/lang/String;Lcom/helpshift/common/domain/network/HSUrlMetadata;)Z
    .locals 4

    monitor-enter p0

    .line 41
    :try_start_0
    invoke-direct {p0, p2}, Lcom/helpshift/db/network/HSNetworkMetadataDB;->metadataToContentValues(Lcom/helpshift/common/domain/network/HSUrlMetadata;)Landroid/content/ContentValues;

    move-result-object p2

    const-string v0, "url"

    .line 42
    invoke-virtual {p2, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v0, -0x1

    .line 45
    :try_start_1
    iget-object p1, p0, Lcom/helpshift/db/network/HSNetworkMetadataDB;->hsNetworkDbHelper:Lcom/helpshift/db/network/HSNetworkDBHelper;

    invoke-virtual {p1}, Lcom/helpshift/db/network/HSNetworkDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const-string v2, "hs_url_metadata_table"

    const/4 v3, 0x0

    .line 46
    invoke-virtual {p1, v2, v3, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    :try_start_2
    const-string p1, "Helpshift_NetworkDB"

    const-string p2, "Error in inserting metadata of url"

    .line 49
    invoke-static {p1, p2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-wide p1, v0

    :goto_0
    cmp-long v2, p1, v0

    if-eqz v2, :cond_0

    const/4 p1, 0x1

    goto :goto_1

    :cond_0
    const/4 p1, 0x0

    .line 51
    :goto_1
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized readMetadataForUrl(Ljava/lang/String;)Lcom/helpshift/common/domain/network/HSUrlMetadata;
    .locals 9

    monitor-enter p0

    :try_start_0
    const-string v3, "url = ? "

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p1, v4, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/4 p1, 0x0

    .line 112
    :try_start_1
    iget-object v0, p0, Lcom/helpshift/db/network/HSNetworkMetadataDB;->hsNetworkDbHelper:Lcom/helpshift/db/network/HSNetworkDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/network/HSNetworkDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "hs_url_metadata_table"

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 113
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 120
    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 121
    invoke-direct {p0, v0}, Lcom/helpshift/db/network/HSNetworkMetadataDB;->cursorToUrlMetadata(Landroid/database/Cursor;)Lcom/helpshift/common/domain/network/HSUrlMetadata;

    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_0
    if-eqz v0, :cond_1

    .line 129
    :goto_0
    :try_start_3
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object v8, v0

    move-object v0, p1

    move-object p1, v8

    goto :goto_2

    :catch_0
    move-object v0, p1

    :catch_1
    :try_start_4
    const-string v1, "Helpshift_NetworkDB"

    const-string v2, "error in reading the metadata of url"

    .line 125
    invoke-static {v1, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v0, :cond_1

    goto :goto_0

    .line 132
    :cond_1
    :goto_1
    monitor-exit p0

    return-object p1

    :catchall_1
    move-exception p1

    :goto_2
    if-eqz v0, :cond_2

    .line 129
    :try_start_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 131
    :cond_2
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized updateLastFetchTimestampForUrl(Ljava/lang/String;JZ)Z
    .locals 2

    monitor-enter p0

    .line 75
    :try_start_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "last_fetch_ts"

    .line 76
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p2, "is_last_fetch_success"

    if-eqz p4, :cond_0

    const/4 p3, 0x1

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    .line 77
    :goto_0
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {v0, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 78
    invoke-direct {p0, p1, v0}, Lcom/helpshift/db/network/HSNetworkMetadataDB;->updateUrlMetadataWithValues(Ljava/lang/String;Landroid/content/ContentValues;)Z

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

.method public declared-synchronized updateMetadataForUrl(Ljava/lang/String;Lcom/helpshift/common/domain/network/HSUrlMetadata;)Z
    .locals 0

    monitor-enter p0

    .line 62
    :try_start_0
    invoke-direct {p0, p2}, Lcom/helpshift/db/network/HSNetworkMetadataDB;->metadataToContentValues(Lcom/helpshift/common/domain/network/HSUrlMetadata;)Landroid/content/ContentValues;

    move-result-object p2

    .line 63
    invoke-direct {p0, p1, p2}, Lcom/helpshift/db/network/HSNetworkMetadataDB;->updateUrlMetadataWithValues(Ljava/lang/String;Landroid/content/ContentValues;)Z

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
