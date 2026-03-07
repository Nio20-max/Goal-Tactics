.class public Lcom/helpshift/campaigns/storage/PropertyDbStorage;
.super Ljava/lang/Object;
.source "PropertyDbStorage.java"

# interfaces
.implements Lcom/helpshift/campaigns/storage/PropertyStorage;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_PropertyDB"


# instance fields
.field private final helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    return-void
.end method

.method private cursorToPropertyValue(Landroid/database/Cursor;)Lcom/helpshift/campaigns/models/PropertyValue;
    .locals 3

    .line 450
    new-instance v0, Lcom/helpshift/campaigns/models/PropertyValue;

    const/4 v1, 0x2

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/helpshift/campaigns/models/PropertyValue;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x3

    .line 451
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/models/PropertyValue;->setIsSynced(Ljava/lang/Integer;)V

    return-object v0
.end method

.method private getSecondaryName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 456
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 457
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "__hs_secondary_data"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private propertyToContentValues(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;)Landroid/content/ContentValues;
    .locals 2

    .line 440
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "key"

    .line 441
    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 442
    invoke-virtual {p2}, Lcom/helpshift/campaigns/models/PropertyValue;->toString()Ljava/lang/String;

    move-result-object p1

    const-string/jumbo v1, "value"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    invoke-virtual {p2}, Lcom/helpshift/campaigns/models/PropertyValue;->getType()Ljava/lang/String;

    move-result-object p1

    const-string/jumbo v1, "type"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 444
    invoke-virtual {p2}, Lcom/helpshift/campaigns/models/PropertyValue;->getIsSynced()Ljava/lang/Integer;

    move-result-object p1

    const-string/jumbo p2, "sync_status"

    invoke-virtual {v0, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p1, "extras"

    const-string p2, ""

    .line 445
    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, "\'"

    const-string v1, "$"

    .line 467
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public getAllProperties(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;"
        }
    .end annotation

    .line 387
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 391
    :cond_0
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 393
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    monitor-enter v2

    .line 396
    :try_start_0
    iget-object v3, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v3}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    .line 397
    iget-object v3, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v3, v0}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getTableName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 404
    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 405
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 406
    :goto_0
    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_1

    .line 407
    invoke-direct {p0, v0}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->cursorToPropertyValue(Landroid/database/Cursor;)Lcom/helpshift/campaigns/models/PropertyValue;

    move-result-object v1

    const/4 v4, 0x0

    .line 408
    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 409
    invoke-virtual {v3, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :cond_1
    move-object v1, v3

    goto :goto_1

    :catch_0
    move-exception v1

    goto :goto_2

    :cond_2
    :goto_1
    if-eqz v0, :cond_4

    .line 419
    :try_start_3
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_3

    :catch_1
    move-exception v3

    move-object v12, v3

    move-object v3, v1

    move-object v1, v12

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_4

    :catch_2
    move-exception v0

    move-object v3, v1

    move-object v1, v0

    move-object v0, v3

    :goto_2
    :try_start_4
    const-string v4, "Helpshift_PropertyDB"

    .line 415
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error getAllProperties for identifier : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v0, :cond_3

    .line 419
    :try_start_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_3
    move-object v1, v3

    .line 422
    :cond_4
    :goto_3
    monitor-exit v2

    return-object v1

    :catchall_1
    move-exception p1

    move-object v1, v0

    :goto_4
    if-eqz v1, :cond_5

    .line 419
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 421
    :cond_5
    throw p1

    :catchall_2
    move-exception p1

    .line 422
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw p1
.end method

.method public getAllSecondaryProperties(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;"
        }
    .end annotation

    .line 435
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 436
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->getSecondaryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->getAllProperties(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object p1

    return-object p1
.end method

.method public getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/campaigns/models/PropertyValue;
    .locals 11

    .line 200
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_4

    .line 204
    :cond_0
    invoke-direct {p0, p2}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 206
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    monitor-enter v0

    .line 209
    :try_start_0
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v6, "key=?"

    const/4 v2, 0x1

    new-array v7, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v7, v2

    .line 212
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v2, p2}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getTableName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 217
    :try_start_1
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 218
    invoke-direct {p0, p2}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->cursorToPropertyValue(Landroid/database/Cursor;)Lcom/helpshift/campaigns/models/PropertyValue;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_1
    if-eqz p2, :cond_2

    .line 226
    :goto_0
    :try_start_2
    invoke-interface {p2}, Landroid/database/Cursor;->close()V
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

    move-object p2, v1

    :goto_1
    :try_start_3
    const-string v3, "Helpshift_PropertyDB"

    .line 222
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error getProperty key: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz p2, :cond_2

    goto :goto_0

    .line 229
    :cond_2
    :goto_2
    :try_start_4
    monitor-exit v0

    return-object v1

    :catchall_1
    move-exception p1

    move-object v1, p2

    :goto_3
    if-eqz v1, :cond_3

    .line 226
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 228
    :cond_3
    throw p1

    :catchall_2
    move-exception p1

    .line 229
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw p1

    :cond_4
    :goto_4
    return-object v1
.end method

.method public getSecondaryProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/campaigns/models/PropertyValue;
    .locals 0

    .line 242
    invoke-direct {p0, p2}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 243
    invoke-direct {p0, p2}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->getSecondaryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/campaigns/models/PropertyValue;

    move-result-object p1

    return-object p1
.end method

.method public getUnsyncedProperties(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/helpshift/campaigns/models/PropertyValue;",
            ">;"
        }
    .end annotation

    .line 340
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 344
    :cond_0
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 346
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    monitor-enter v2

    .line 349
    :try_start_0
    iget-object v3, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v3}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string/jumbo v7, "sync_status=?"

    const/4 v3, 0x1

    new-array v8, v3, [Ljava/lang/String;

    .line 351
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v12, 0x0

    aput-object v3, v8, v12

    .line 352
    iget-object v3, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v3, v0}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getTableName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 357
    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 358
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 359
    :goto_0
    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_1

    .line 360
    invoke-direct {p0, v0}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->cursorToPropertyValue(Landroid/database/Cursor;)Lcom/helpshift/campaigns/models/PropertyValue;

    move-result-object v1

    .line 361
    invoke-interface {v0, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 362
    invoke-virtual {v3, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :cond_1
    move-object v1, v3

    goto :goto_1

    :catch_0
    move-exception v1

    goto :goto_2

    :cond_2
    :goto_1
    if-eqz v0, :cond_4

    .line 372
    :try_start_3
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_3

    :catch_1
    move-exception v3

    move-object v13, v3

    move-object v3, v1

    move-object v1, v13

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_4

    :catch_2
    move-exception v0

    move-object v3, v1

    move-object v1, v0

    move-object v0, v3

    :goto_2
    :try_start_4
    const-string v4, "Helpshift_PropertyDB"

    .line 368
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error getUnsyncedProperties for identifier : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v0, :cond_3

    .line 372
    :try_start_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_3
    move-object v1, v3

    .line 375
    :cond_4
    :goto_3
    monitor-exit v2

    return-object v1

    :catchall_1
    move-exception p1

    move-object v1, v0

    :goto_4
    if-eqz v1, :cond_5

    .line 372
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 374
    :cond_5
    throw p1

    :catchall_2
    move-exception p1

    .line 375
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw p1
.end method

.method public initSecondaryStorage(Ljava/lang/String;)V
    .locals 0

    .line 55
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 56
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->getSecondaryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->initStorage(Ljava/lang/String;)V

    return-void
.end method

.method public initStorage(Ljava/lang/String;)V
    .locals 3

    .line 37
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 38
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    monitor-enter v0

    .line 40
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 41
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v2, v1, p1}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->createIdentifierTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V
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
    const-string v1, "Helpshift_PropertyDB"

    const-string v2, "Error initStorage"

    .line 44
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 46
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public reinitSecondaryStorage(Ljava/lang/String;)V
    .locals 0

    .line 97
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 98
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->getSecondaryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->reinitStorage(Ljava/lang/String;)V

    return-void
.end method

.method public reinitStorage(Ljava/lang/String;)V
    .locals 4

    .line 65
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 66
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    monitor-enter v0

    const/4 v1, 0x0

    .line 69
    :try_start_0
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 70
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 71
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v2, v1, p1}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->dropIdentifierTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 72
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v2, v1, p1}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->createIdentifierTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 73
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 80
    :try_start_1
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 81
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_2
    const-string v1, "Helpshift_PropertyDB"

    const-string v2, "Error reinitStorage inside finally block"

    .line 85
    :goto_0
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_1
    move-exception p1

    :try_start_3
    const-string v2, "Helpshift_PropertyDB"

    const-string v3, "Error reinitStorage"

    .line 76
    invoke-static {v2, v3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v1, :cond_0

    .line 80
    :try_start_4
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 81
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    :catch_2
    move-exception p1

    :try_start_5
    const-string v1, "Helpshift_PropertyDB"

    const-string v2, "Error reinitStorage inside finally block"

    goto :goto_0

    .line 88
    :cond_0
    :goto_1
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    return-void

    :goto_2
    if-eqz v1, :cond_1

    .line 80
    :try_start_6
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 81
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception p1

    goto :goto_4

    :catch_3
    move-exception v1

    :try_start_7
    const-string v2, "Helpshift_PropertyDB"

    const-string v3, "Error reinitStorage inside finally block"

    .line 85
    invoke-static {v2, v3, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 87
    :cond_1
    :goto_3
    throw p1

    .line 88
    :goto_4
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    throw p1
.end method

.method public removeProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    .line 154
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 158
    :cond_0
    invoke-direct {p0, p2}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 159
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    monitor-enter v0

    .line 161
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 162
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v2, p2}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getTableName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v2, "key=?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    .line 165
    invoke-static {v1, p2, v2, v3}, Lcom/helpshift/util/DatabaseUtils;->exists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 166
    invoke-virtual {v1, p2, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p2

    :try_start_1
    const-string v1, "Helpshift_PropertyDB"

    .line 170
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error removeProperty key: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1, p2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 172
    :cond_1
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_2
    :goto_2
    return-void
.end method

.method public removePropertySecondaryStorage(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 184
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 188
    :cond_0
    invoke-direct {p0, p2}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 189
    invoke-direct {p0, p2}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->getSecondaryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->removeProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setProperty(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;Ljava/lang/String;)V
    .locals 5

    .line 109
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p2, :cond_2

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 113
    :cond_0
    invoke-direct {p0, p3}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 114
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    monitor-enter v0

    .line 116
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 117
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v2, p3}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getTableName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const-string v2, "key=?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    .line 120
    invoke-static {v1, p3, v2, v3}, Lcom/helpshift/util/DatabaseUtils;->exists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 121
    invoke-direct {p0, p1, p2}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->propertyToContentValues(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;)Landroid/content/ContentValues;

    move-result-object v4

    invoke-virtual {v1, p3, v4, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    .line 124
    invoke-direct {p0, p1, p2}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->propertyToContentValues(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;)Landroid/content/ContentValues;

    move-result-object v3

    invoke-virtual {v1, p3, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p3

    :try_start_1
    const-string v1, "Helpshift_PropertyDB"

    .line 128
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error setProperty key: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", value : "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1, p3}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 130
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_2
    :goto_2
    return-void
.end method

.method public setSecondaryProperty(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;Ljava/lang/String;)V
    .locals 0

    .line 142
    invoke-direct {p0, p3}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 143
    invoke-direct {p0, p3}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->getSecondaryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p1, p2, p3}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->setProperty(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;Ljava/lang/String;)V

    return-void
.end method

.method public setSecondaryPropertySyncStatus(Ljava/lang/Integer;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 329
    invoke-direct {p0, p3}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 330
    invoke-direct {p0, p3}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->getSecondaryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p1, p2, p3}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->setSyncStatus(Ljava/lang/Integer;[Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setSyncStatus(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 254
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 258
    :cond_0
    invoke-direct {p0, p3}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 259
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    monitor-enter v0

    .line 261
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "key=?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    .line 265
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    const-string/jumbo v5, "sync_status"

    .line 266
    invoke-virtual {v4, v5, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 267
    iget-object p1, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {p1, p3}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getTableName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1, v4, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
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
    const-string p3, "Helpshift_PropertyDB"

    .line 273
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error setSyncStatus key: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p3, p2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 275
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_1
    :goto_2
    return-void
.end method

.method public setSyncStatus(Ljava/lang/Integer;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    if-eqz p2, :cond_3

    .line 286
    array-length v0, p2

    if-eqz v0, :cond_3

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_5

    .line 290
    :cond_0
    invoke-direct {p0, p3}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->sanitizeForSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 291
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    monitor-enter v0

    const/4 v1, 0x0

    .line 294
    :try_start_0
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 295
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 297
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "key in ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v3, p2

    invoke-static {v3}, Lcom/helpshift/util/DatabaseUtils;->makePlaceholders(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 298
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string/jumbo v4, "sync_status"

    .line 299
    invoke-virtual {v3, v4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 300
    iget-object p1, p0, Lcom/helpshift/campaigns/storage/PropertyDbStorage;->helper:Lcom/helpshift/campaigns/storage/PropertyDbHelper;

    invoke-virtual {p1, p3}, Lcom/helpshift/campaigns/storage/PropertyDbHelper;->getTableName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1, v3, v2, p2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 302
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 309
    :try_start_1
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 310
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_2
    const-string p2, "Helpshift_PropertyDB"

    const-string p3, "Error setSyncStatus for multiple keys inside finally block"

    .line 314
    :goto_0
    invoke-static {p2, p3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_1
    move-exception p1

    :try_start_3
    const-string p2, "Helpshift_PropertyDB"

    const-string p3, "Error setSyncStatus for multiple keys"

    .line 305
    invoke-static {p2, p3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v1, :cond_1

    .line 309
    :try_start_4
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 310
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    :catch_2
    move-exception p1

    :try_start_5
    const-string p2, "Helpshift_PropertyDB"

    const-string p3, "Error setSyncStatus for multiple keys inside finally block"

    goto :goto_0

    .line 317
    :cond_1
    :goto_1
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    return-void

    :goto_2
    if-eqz v1, :cond_2

    .line 309
    :try_start_6
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p2

    if-eqz p2, :cond_2

    .line 310
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception p1

    goto :goto_4

    :catch_3
    move-exception p2

    :try_start_7
    const-string p3, "Helpshift_PropertyDB"

    const-string v1, "Error setSyncStatus for multiple keys inside finally block"

    .line 314
    invoke-static {p3, v1, p2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 316
    :cond_2
    :goto_3
    throw p1

    .line 317
    :goto_4
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    throw p1

    :cond_3
    :goto_5
    return-void
.end method
