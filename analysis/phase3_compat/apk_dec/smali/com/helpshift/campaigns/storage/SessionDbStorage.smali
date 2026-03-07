.class public Lcom/helpshift/campaigns/storage/SessionDbStorage;
.super Ljava/lang/Object;
.source "SessionDbStorage.java"

# interfaces
.implements Lcom/helpshift/campaigns/storage/SessionStorage;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_SessionDB"


# instance fields
.field private final helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    return-void
.end method

.method private cursorToSessionModel(Landroid/database/Cursor;)Lcom/helpshift/campaigns/models/SessionModel;
    .locals 8

    const-string v0, "Helpshift_SessionDB"

    .line 324
    new-instance v7, Lcom/helpshift/campaigns/models/SessionModelBuilder;

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v1, 0x1

    .line 325
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v1, 0x2

    .line 326
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v1, 0x3

    .line 327
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Lcom/helpshift/campaigns/models/SessionModelBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    const/4 v1, 0x4

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-virtual {v7, v1, v2}, Lcom/helpshift/campaigns/models/SessionModelBuilder;->setEndTime(J)Lcom/helpshift/campaigns/models/SessionModelBuilder;

    move-result-object v1

    const/4 v2, 0x6

    .line 328
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/helpshift/campaigns/models/SessionModelBuilder;->setSyncStatus(Ljava/lang/Integer;)Lcom/helpshift/campaigns/models/SessionModelBuilder;

    move-result-object v1

    const/4 v2, 0x5

    const/4 v3, 0x0

    .line 330
    :try_start_0
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object p1

    invoke-static {p1}, Lcom/helpshift/util/ByteArrayUtil;->toObject([B)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Lcom/helpshift/campaigns/models/SessionModelBuilder;->setDurations(Ljava/util/ArrayList;)Lcom/helpshift/campaigns/models/SessionModelBuilder;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 341
    invoke-virtual {v1, v3}, Lcom/helpshift/campaigns/models/SessionModelBuilder;->setDurations(Ljava/util/ArrayList;)Lcom/helpshift/campaigns/models/SessionModelBuilder;

    move-result-object v1

    const-string v2, "Class cast Exception in retrieving session duration :"

    .line 342
    invoke-static {v0, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception p1

    .line 337
    invoke-virtual {v1, v3}, Lcom/helpshift/campaigns/models/SessionModelBuilder;->setDurations(Ljava/util/ArrayList;)Lcom/helpshift/campaigns/models/SessionModelBuilder;

    move-result-object v1

    const-string v2, "Class not found Exception in retrieving session duration :"

    .line 338
    invoke-static {v0, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_2
    move-exception p1

    .line 333
    invoke-virtual {v1, v3}, Lcom/helpshift/campaigns/models/SessionModelBuilder;->setDurations(Ljava/util/ArrayList;)Lcom/helpshift/campaigns/models/SessionModelBuilder;

    move-result-object v1

    const-string v2, "IO Exception in retrieving session duration :"

    .line 334
    invoke-static {v0, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    move-object p1, v1

    .line 344
    :goto_1
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/SessionModelBuilder;->build()Lcom/helpshift/campaigns/models/SessionModel;

    move-result-object p1

    return-object p1
.end method

.method private sessionToContentValues(Lcom/helpshift/campaigns/models/SessionModel;)Landroid/content/ContentValues;
    .locals 8

    const-string v0, ""

    const-string v1, "durations"

    .line 305
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 306
    iget-object v3, p1, Lcom/helpshift/campaigns/models/SessionModel;->identifier:Ljava/lang/String;

    const-string v4, "identifier"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    iget-object v3, p1, Lcom/helpshift/campaigns/models/SessionModel;->deviceIdentifier:Ljava/lang/String;

    const-string v4, "device_identifier"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    iget-object v3, p1, Lcom/helpshift/campaigns/models/SessionModel;->userIdentifier:Ljava/lang/String;

    const-string/jumbo v4, "user_identifier"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    iget-wide v3, p1, Lcom/helpshift/campaigns/models/SessionModel;->startTime:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const-string/jumbo v4, "start_time"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 311
    iget-wide v3, p1, Lcom/helpshift/campaigns/models/SessionModel;->endTime:J

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-lez v7, :cond_0

    iget-wide v5, p1, Lcom/helpshift/campaigns/models/SessionModel;->endTime:J

    :cond_0
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const-string v4, "end_time"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 313
    :try_start_0
    iget-object v3, p1, Lcom/helpshift/campaigns/models/SessionModel;->durations:Ljava/util/ArrayList;

    invoke-static {v3}, Lcom/helpshift/util/ByteArrayUtil;->toByteArray(Ljava/lang/Object;)[B

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 316
    :catch_0
    invoke-virtual {v2, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    :goto_0
    iget-object p1, p1, Lcom/helpshift/campaigns/models/SessionModel;->syncStatus:Ljava/lang/Integer;

    const-string/jumbo v1, "sync_status"

    invoke-virtual {v2, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p1, "extras"

    .line 319
    invoke-virtual {v2, p1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2
.end method


# virtual methods
.method public cleanUpInvalidSessions()I
    .locals 5

    .line 239
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    monitor-enter v0

    :try_start_0
    const-string v1, "end_time=0"

    .line 242
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "sessions"

    const/4 v4, 0x0

    .line 243
    invoke-virtual {v2, v3, v1, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    const-string v2, "Helpshift_SessionDB"

    const-string v3, "Error cleaning up invalid sessions"

    .line 246
    invoke-static {v2, v3, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v1, 0x0

    .line 248
    :goto_0
    monitor-exit v0

    return v1

    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public getAllSessions(Ljava/lang/Integer;)Ljava/util/ArrayList;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/helpshift/campaigns/models/SessionModel;",
            ">;"
        }
    .end annotation

    .line 201
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 202
    iget-object v1, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    monitor-enter v1

    const/4 v2, 0x0

    .line 205
    :try_start_0
    iget-object v3, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    invoke-virtual {v3}, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string/jumbo v7, "sync_status=? AND end_time>?"

    const/4 v3, 0x2

    new-array v8, v3, [Ljava/lang/String;

    .line 207
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v3, 0x0

    aput-object p1, v8, v3

    const/4 p1, 0x1

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v8, p1

    const-string v5, "sessions"

    const/4 v6, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    .line 208
    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 210
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 211
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->isAfterLast()Z

    move-result p1

    if-nez p1, :cond_0

    .line 212
    invoke-direct {p0, v2}, Lcom/helpshift/campaigns/storage/SessionDbStorage;->cursorToSessionModel(Landroid/database/Cursor;)Lcom/helpshift/campaigns/models/SessionModel;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 213
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    if-eqz v2, :cond_1

    .line 222
    :goto_1
    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_0
    move-exception p1

    :try_start_2
    const-string v3, "Helpshift_SessionDB"

    const-string v4, "Error getting all sessions"

    .line 218
    invoke-static {v3, v4, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v2, :cond_1

    goto :goto_1

    .line 225
    :cond_1
    :goto_2
    :try_start_3
    monitor-exit v1

    return-object v0

    :goto_3
    if-eqz v2, :cond_2

    .line 222
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 224
    :cond_2
    throw p1

    :catchall_1
    move-exception p1

    .line 225
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1
.end method

.method public getSession(Ljava/lang/String;)Lcom/helpshift/campaigns/models/SessionModel;
    .locals 11

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 266
    :cond_0
    iget-object v1, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    monitor-enter v1

    :try_start_0
    const-string v5, "identifier=?"

    const/4 v2, 0x1

    new-array v6, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v6, v2

    .line 271
    iget-object p1, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    invoke-virtual {p1}, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "sessions"

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 272
    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 273
    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 274
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/SessionDbStorage;->cursorToSessionModel(Landroid/database/Cursor;)Lcom/helpshift/campaigns/models/SessionModel;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_1
    if-eqz p1, :cond_2

    .line 282
    :goto_0
    :try_start_2
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_2

    :catch_0
    move-exception v2

    goto :goto_1

    :catchall_0
    move-exception p1

    move-object v10, v0

    move-object v0, p1

    move-object p1, v10

    goto :goto_3

    :catch_1
    move-exception v2

    move-object p1, v0

    :goto_1
    :try_start_3
    const-string v3, "Helpshift_SessionDB"

    const-string v4, "Error getting session"

    .line 278
    invoke-static {v3, v4, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz p1, :cond_2

    goto :goto_0

    .line 285
    :cond_2
    :goto_2
    :try_start_4
    monitor-exit v1

    return-object v0

    :catchall_1
    move-exception v0

    :goto_3
    if-eqz p1, :cond_3

    .line 282
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 284
    :cond_3
    throw v0

    :catchall_2
    move-exception p1

    .line 286
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw p1
.end method

.method protected reinitStorage()V
    .locals 4

    .line 293
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    monitor-enter v0

    .line 295
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "sessions"

    const/4 v3, 0x0

    .line 296
    invoke-virtual {v1, v2, v3, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    const-string v2, "Helpshift_SessionDB"

    const-string v3, "Error reiniting session storage"

    .line 299
    invoke-static {v2, v3, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 301
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public removeSessions([Ljava/lang/String;)V
    .locals 5

    if-nez p1, :cond_0

    return-void

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    monitor-enter v0

    const/4 v1, 0x0

    const/16 v2, 0x384

    .line 163
    :try_start_0
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/helpshift/util/DatabaseUtils;->createBatches(ILjava/util/List;)Ljava/util/List;

    move-result-object p1

    .line 165
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 166
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 167
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 168
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    .line 169
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "identifier in ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v4, v2

    .line 170
    invoke-static {v4}, Lcom/helpshift/util/DatabaseUtils;->makePlaceholders(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "sessions"

    .line 171
    invoke-virtual {v1, v4, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    .line 173
    :cond_1
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_2

    .line 181
    :try_start_1
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 182
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_2
    const-string v1, "Helpshift_SessionDB"

    const-string v2, "Error removing sessions inside finally block, "

    .line 186
    :goto_1
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_1
    move-exception p1

    :try_start_3
    const-string v2, "Helpshift_SessionDB"

    const-string v3, "Error removing sessions"

    .line 177
    invoke-static {v2, v3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v1, :cond_2

    .line 181
    :try_start_4
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 182
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_2

    :catch_2
    move-exception p1

    :try_start_5
    const-string v1, "Helpshift_SessionDB"

    const-string v2, "Error removing sessions inside finally block, "

    goto :goto_1

    .line 189
    :cond_2
    :goto_2
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    return-void

    :goto_3
    if-eqz v1, :cond_3

    .line 181
    :try_start_6
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 182
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_4

    :catchall_1
    move-exception p1

    goto :goto_5

    :catch_3
    move-exception v1

    :try_start_7
    const-string v2, "Helpshift_SessionDB"

    const-string v3, "Error removing sessions inside finally block, "

    .line 186
    invoke-static {v2, v3, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 188
    :cond_3
    :goto_4
    throw p1

    .line 189
    :goto_5
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    throw p1
.end method

.method public setSyncStatus(Ljava/lang/Integer;[Ljava/lang/String;)V
    .locals 5

    if-nez p2, :cond_0

    return-void

    .line 110
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    monitor-enter v0

    const/4 v1, 0x0

    .line 114
    :try_start_0
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string/jumbo v3, "sync_status"

    .line 115
    invoke-virtual {v2, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const/16 p1, 0x384

    .line 117
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/helpshift/util/DatabaseUtils;->createBatches(ILjava/util/List;)Ljava/util/List;

    move-result-object p1

    .line 119
    iget-object p2, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    invoke-virtual {p2}, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 120
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 121
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 122
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {p2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/String;

    .line 123
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "identifier in ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v4, p2

    .line 124
    invoke-static {v4}, Lcom/helpshift/util/DatabaseUtils;->makePlaceholders(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "sessions"

    .line 125
    invoke-virtual {v1, v4, v2, v3, p2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    .line 127
    :cond_1
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_2

    .line 135
    :try_start_1
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 136
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_2
    const-string p2, "Helpshift_SessionDB"

    const-string v1, "Error in setting sync status inside finally block, "

    .line 140
    :goto_1
    invoke-static {p2, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_1
    move-exception p1

    :try_start_3
    const-string p2, "Helpshift_SessionDB"

    const-string v2, "Error in setting sync status"

    .line 131
    invoke-static {p2, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v1, :cond_2

    .line 135
    :try_start_4
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 136
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_2

    :catch_2
    move-exception p1

    :try_start_5
    const-string p2, "Helpshift_SessionDB"

    const-string v1, "Error in setting sync status inside finally block, "

    goto :goto_1

    .line 143
    :cond_2
    :goto_2
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    return-void

    :goto_3
    if-eqz v1, :cond_3

    .line 135
    :try_start_6
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p2

    if-eqz p2, :cond_3

    .line 136
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_4

    :catchall_1
    move-exception p1

    goto :goto_5

    :catch_3
    move-exception p2

    :try_start_7
    const-string v1, "Helpshift_SessionDB"

    const-string v2, "Error in setting sync status inside finally block, "

    .line 140
    invoke-static {v1, v2, p2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 142
    :cond_3
    :goto_4
    throw p1

    .line 143
    :goto_5
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    throw p1
.end method

.method public storeSession(Lcom/helpshift/campaigns/models/SessionModel;)V
    .locals 5

    if-nez p1, :cond_0

    return-void

    .line 45
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    monitor-enter v0

    :try_start_0
    const-string v1, "identifier=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    .line 48
    iget-object v4, p1, Lcom/helpshift/campaigns/models/SessionModel;->identifier:Ljava/lang/String;

    aput-object v4, v2, v3

    .line 50
    iget-object v3, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    invoke-virtual {v3}, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "sessions"

    .line 51
    invoke-static {v3, v4, v1, v2}, Lcom/helpshift/util/DatabaseUtils;->exists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string v4, "sessions"

    .line 52
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/SessionDbStorage;->sessionToContentValues(Lcom/helpshift/campaigns/models/SessionModel;)Landroid/content/ContentValues;

    move-result-object p1

    invoke-virtual {v3, v4, p1, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const-string v1, "sessions"

    const/4 v2, 0x0

    .line 55
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/SessionDbStorage;->sessionToContentValues(Lcom/helpshift/campaigns/models/SessionModel;)Landroid/content/ContentValues;

    move-result-object p1

    invoke-virtual {v3, v1, v2, p1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
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
    const-string v1, "Helpshift_SessionDB"

    const-string v2, "Error storing sessions"

    .line 59
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public updateSession(Lcom/helpshift/campaigns/models/SessionModel;)V
    .locals 11

    if-nez p1, :cond_0

    return-void

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    monitor-enter v0

    :try_start_0
    const-string v1, "identifier=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    .line 77
    iget-object v4, p1, Lcom/helpshift/campaigns/models/SessionModel;->identifier:Ljava/lang/String;

    aput-object v4, v2, v3

    .line 79
    iget-object v3, p0, Lcom/helpshift/campaigns/storage/SessionDbStorage;->helper:Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;

    invoke-virtual {v3}, Lcom/helpshift/campaigns/storage/SessionDbStorageHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "sessions"

    .line 80
    invoke-static {v3, v4, v1, v2}, Lcom/helpshift/util/DatabaseUtils;->exists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 81
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    const-string/jumbo v5, "start_time"

    .line 82
    iget-wide v6, p1, Lcom/helpshift/campaigns/models/SessionModel;->startTime:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v5, "end_time"

    .line 83
    iget-wide v6, p1, Lcom/helpshift/campaigns/models/SessionModel;->endTime:J

    const-wide/16 v8, 0x0

    cmp-long v10, v6, v8

    if-lez v10, :cond_1

    iget-wide v8, p1, Lcom/helpshift/campaigns/models/SessionModel;->endTime:J

    :cond_1
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    const-string v5, "durations"

    .line 85
    iget-object p1, p1, Lcom/helpshift/campaigns/models/SessionModel;->durations:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/helpshift/util/ByteArrayUtil;->toByteArray(Ljava/lang/Object;)[B

    move-result-object p1

    invoke-virtual {v4, v5, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    :try_start_2
    const-string p1, "durations"

    const-string v5, ""

    .line 88
    invoke-virtual {v4, p1, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const-string p1, "sessions"

    .line 90
    invoke-virtual {v3, p1, v4, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_1
    move-exception p1

    :try_start_3
    const-string v1, "Helpshift_SessionDB"

    const-string v2, "Error updating session"

    .line 94
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 96
    :cond_2
    :goto_1
    monitor-exit v0

    return-void

    :goto_2
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p1
.end method
