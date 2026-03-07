.class public Lcom/helpshift/campaigns/storage/CampaignDbStorage;
.super Ljava/lang/Object;
.source "CampaignDbStorage.java"

# interfaces
.implements Lcom/helpshift/campaigns/storage/CampaignStorage;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_CampDBStore"


# instance fields
.field private final helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

.field private observers:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Lcom/helpshift/campaigns/observers/CampaignStorageObserver;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    .line 35
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->observers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    return-void
.end method

.method private campaignToContentValues(Lcom/helpshift/campaigns/models/CampaignDetailModel;)Landroid/content/ContentValues;
    .locals 6

    const-string v0, "messages"

    const-string v1, "actions"

    const-string v2, ""

    .line 369
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 370
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    const-string v5, "identifier"

    invoke-virtual {v3, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    iget-object v4, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->userIdentifier:Ljava/lang/String;

    const-string/jumbo v5, "user_identifier"

    invoke-virtual {v3, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getTitle()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "title"

    invoke-virtual {v3, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 373
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getBody()Ljava/lang/String;

    move-result-object v4

    const-string v5, "body"

    invoke-virtual {v3, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    iget-object v4, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageUrl:Ljava/lang/String;

    const-string v5, "cover_image_url"

    invoke-virtual {v3, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    iget-object v4, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageFilePath:Ljava/lang/String;

    const-string v5, "cover_image_file_path"

    invoke-virtual {v3, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 376
    iget-object v4, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageUrl:Ljava/lang/String;

    const-string v5, "icon_image_url"

    invoke-virtual {v3, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    iget-object v4, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageFilePath:Ljava/lang/String;

    const-string v5, "icon_image_file_path"

    invoke-virtual {v3, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getBackgroundColor()Ljava/lang/String;

    move-result-object v4

    const-string v5, "background_color"

    invoke-virtual {v3, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getTitleColor()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "title_color"

    invoke-virtual {v3, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 380
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getBodyColor()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "text_color"

    invoke-virtual {v3, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    :try_start_0
    iget-object v4, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    invoke-static {v4}, Lcom/helpshift/util/ByteArrayUtil;->toByteArray(Ljava/lang/Object;)[B

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 385
    :catch_0
    invoke-virtual {v3, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 388
    :goto_0
    :try_start_1
    iget-object v1, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->messages:Ljava/util/List;

    invoke-static {v1}, Lcom/helpshift/util/ByteArrayUtil;->toByteArray(Ljava/lang/Object;)[B

    move-result-object v1

    invoke-virtual {v3, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 391
    :catch_1
    invoke-virtual {v3, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 393
    :goto_1
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getReadStatus()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "read_status"

    invoke-virtual {v3, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 394
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getSeenStatus()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "seen_status"

    invoke-virtual {v3, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 395
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getCreatedAt()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const-string v1, "created_at"

    invoke-virtual {v3, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 396
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getExpiryTimeStamp()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string v0, "expiry_time_stamp"

    invoke-virtual {v3, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p1, "extra_data"

    .line 397
    invoke-virtual {v3, p1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object v3
.end method

.method private cursorToCampaignDetailModel(Landroid/database/Cursor;)Lcom/helpshift/campaigns/models/CampaignDetailModel;
    .locals 25

    move-object/from16 v1, p1

    const-string v2, "Helpshift_CampDBStore"

    const/4 v3, 0x0

    :try_start_0
    const-string v0, "actions"

    .line 406
    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/util/ByteArrayUtil;->toObject([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    move-object/from16 v23, v0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v4, "Class cast Exception in retrieving campaign actions :"

    .line 415
    invoke-static {v2, v4, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v4, "Class not found exception in retrieving campaign actions :"

    .line 412
    invoke-static {v2, v4, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_2
    move-exception v0

    const-string v4, "IO exception in retrieving campaign actions :"

    .line 409
    invoke-static {v2, v4, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    move-object/from16 v23, v3

    :goto_1
    :try_start_1
    const-string v0, "messages"

    .line 421
    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/util/ByteArrayUtil;->toObject([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_3

    move-object/from16 v24, v0

    goto :goto_3

    :catch_3
    move-exception v0

    const-string v4, "Class cast Exception in retrieving campaign messages :"

    .line 430
    invoke-static {v2, v4, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    :catch_4
    move-exception v0

    const-string v4, "Class not found exception in retrieving campaign messages :"

    .line 427
    invoke-static {v2, v4, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    :catch_5
    move-exception v0

    const-string v4, "IO exception in retrieving campaign messages :"

    .line 424
    invoke-static {v2, v4, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2
    move-object/from16 v24, v3

    .line 433
    :goto_3
    new-instance v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    const-string v2, "identifier"

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v2, "user_identifier"

    .line 434
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v2, "title"

    .line 435
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string v2, "body"

    .line 436
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    const-string v2, "cover_image_url"

    .line 437
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    const-string v2, "cover_image_file_path"

    .line 438
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    const-string v2, "icon_image_url"

    .line 439
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    const-string v2, "icon_image_file_path"

    .line 440
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    const-string v2, "background_color"

    .line 441
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v2, "title_color"

    .line 442
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    const-string/jumbo v2, "text_color"

    .line 443
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    const-string v2, "read_status"

    .line 444
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v2, v4, :cond_0

    const/16 v17, 0x1

    goto :goto_4

    :cond_0
    const/16 v17, 0x0

    :goto_4
    const-string v2, "seen_status"

    .line 445
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    if-ne v2, v4, :cond_1

    const/16 v18, 0x1

    goto :goto_5

    :cond_1
    const/16 v18, 0x0

    :goto_5
    const-string v2, "created_at"

    .line 446
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v19

    const-string v2, "expiry_time_stamp"

    .line 447
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v21

    move-object v5, v0

    invoke-direct/range {v5 .. v24}, Lcom/helpshift/campaigns/models/CampaignDetailModel;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZJJLjava/util/List;Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public addCampaign(Lcom/helpshift/campaigns/models/CampaignDetailModel;)V
    .locals 7

    if-eqz p1, :cond_3

    .line 41
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->userIdentifier:Ljava/lang/String;

    .line 42
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 43
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 44
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getBody()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageUrl:Ljava/lang/String;

    .line 45
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_3

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    monitor-enter v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 51
    :try_start_0
    iget-object v3, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    invoke-virtual {v3}, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "identifier=?"

    new-array v5, v1, [Ljava/lang/String;

    .line 53
    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v2

    const-string v6, "campaigns"

    .line 54
    invoke-static {v3, v6, v4, v5}, Lcom/helpshift/util/DatabaseUtils;->exists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "campaigns"

    const/4 v5, 0x0

    .line 55
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->campaignToContentValues(Lcom/helpshift/campaigns/models/CampaignDetailModel;)Landroid/content/ContentValues;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception v1

    :try_start_1
    const-string v3, "Helpshift_CampDBStore"

    .line 60
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception in adding campaign with id "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v1, 0x0

    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    .line 63
    iget-object v1, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->observers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/observers/CampaignStorageObserver;

    .line 64
    invoke-interface {v2, p1}, Lcom/helpshift/campaigns/observers/CampaignStorageObserver;->campaignDetailModelAdded(Lcom/helpshift/campaigns/models/CampaignDetailModel;)V

    goto :goto_1

    .line 67
    :cond_2
    monitor-exit v0

    return-void

    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_3
    :goto_3
    return-void
.end method

.method public addObserver(Lcom/helpshift/campaigns/observers/CampaignStorageObserver;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 359
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->observers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public deleteCampaign(Ljava/lang/String;)V
    .locals 7

    .line 302
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 306
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    monitor-enter v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 309
    :try_start_0
    iget-object v3, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    invoke-virtual {v3}, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "identifier=?"

    new-array v5, v1, [Ljava/lang/String;

    aput-object p1, v5, v2

    const-string v6, "campaigns"

    .line 312
    invoke-virtual {v3, v6, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception v1

    :try_start_1
    const-string v3, "Helpshift_CampDBStore"

    .line 316
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception in deleting campaign for id "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    .line 320
    iget-object v1, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->observers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/observers/CampaignStorageObserver;

    .line 321
    invoke-interface {v2, p1}, Lcom/helpshift/campaigns/observers/CampaignStorageObserver;->campaignDeleted(Ljava/lang/String;)V

    goto :goto_1

    .line 324
    :cond_1
    monitor-exit v0

    return-void

    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public deleteCampaigns([Ljava/lang/String;)V
    .locals 7

    if-eqz p1, :cond_3

    .line 329
    array-length v0, p1

    if-nez v0, :cond_0

    goto :goto_3

    .line 333
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    monitor-enter v0

    const/4 v1, 0x0

    .line 336
    :try_start_0
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 337
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "identifier in ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v4, p1

    .line 338
    invoke-static {v4}, Lcom/helpshift/util/DatabaseUtils;->makePlaceholders(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "campaigns"

    .line 339
    invoke-virtual {v2, v4, v3, p1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v2, 0x1

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception v2

    :try_start_1
    const-string v3, "Helpshift_CampDBStore"

    const-string v4, "Exception in deleting campaigns "

    .line 343
    invoke-static {v3, v4, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_2

    .line 347
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->observers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/campaigns/observers/CampaignStorageObserver;

    .line 348
    array-length v4, p1

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v4, :cond_1

    aget-object v6, p1, v5

    .line 349
    invoke-interface {v3, v6}, Lcom/helpshift/campaigns/observers/CampaignStorageObserver;->campaignDeleted(Ljava/lang/String;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 353
    :cond_2
    monitor-exit v0

    return-void

    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_3
    :goto_3
    return-void
.end method

.method public getAllCampaigns(Ljava/lang/String;)Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/CampaignDetailModel;",
            ">;"
        }
    .end annotation

    .line 193
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 198
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    monitor-enter v0

    .line 201
    :try_start_0
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string/jumbo v6, "user_identifier=?"

    const/4 v2, 0x1

    new-array v7, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v7, v2

    const-string v10, "created_at DESC"

    const-string v4, "campaigns"

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 205
    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 206
    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 207
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 208
    :goto_0
    :try_start_2
    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_1

    .line 209
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->cursorToCampaignDetailModel(Landroid/database/Cursor;)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :cond_1
    move-object v1, v2

    goto :goto_1

    :catch_0
    move-exception v1

    goto :goto_2

    :cond_2
    :goto_1
    if-eqz p1, :cond_4

    .line 219
    :try_start_3
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_3

    :catch_1
    move-exception v2

    move-object v11, v2

    move-object v2, v1

    move-object v1, v11

    goto :goto_2

    :catchall_0
    move-exception p1

    move-object v11, v1

    move-object v1, p1

    move-object p1, v11

    goto :goto_4

    :catch_2
    move-exception p1

    move-object v2, v1

    move-object v1, p1

    move-object p1, v2

    :goto_2
    :try_start_4
    const-string v3, "Helpshift_CampDBStore"

    const-string v4, "Exception in retrieving all the campaigns "

    .line 215
    invoke-static {v3, v4, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz p1, :cond_3

    .line 219
    :try_start_5
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_3
    move-object v1, v2

    .line 222
    :cond_4
    :goto_3
    monitor-exit v0

    return-object v1

    :catchall_1
    move-exception v1

    :goto_4
    if-eqz p1, :cond_5

    .line 219
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 221
    :cond_5
    throw v1

    :catchall_2
    move-exception p1

    .line 222
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw p1
.end method

.method public getAllCampaigns(ZLjava/lang/String;)Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/CampaignDetailModel;",
            ">;"
        }
    .end annotation

    .line 228
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 233
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    monitor-enter v0

    .line 236
    :try_start_0
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    if-eqz p1, :cond_1

    const-string v2, "1"

    goto :goto_0

    :cond_1
    const-string v2, "0"

    .line 245
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "read_status="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " and "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v2, "user_identifier"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "=?"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v2, 0x1

    new-array v7, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p2, v7, v2

    const-string v10, "created_at DESC"

    const-string v4, "campaigns"

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 249
    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 250
    :try_start_1
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 251
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 252
    :goto_1
    :try_start_2
    invoke-interface {p2}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_2

    .line 253
    invoke-direct {p0, p2}, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->cursorToCampaignDetailModel(Landroid/database/Cursor;)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 254
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :cond_2
    move-object v1, v2

    goto :goto_2

    :catch_0
    move-exception v1

    move-object v11, v1

    move-object v1, p2

    move-object p2, v11

    goto :goto_3

    :cond_3
    :goto_2
    if-eqz p2, :cond_5

    .line 263
    :try_start_3
    invoke-interface {p2}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_4

    :catchall_0
    move-exception p1

    move-object v1, p2

    goto :goto_5

    :catch_1
    move-exception v2

    move-object v11, v1

    move-object v1, p2

    move-object p2, v2

    move-object v2, v11

    goto :goto_3

    :catchall_1
    move-exception p1

    goto :goto_5

    :catch_2
    move-exception p2

    move-object v2, v1

    :goto_3
    :try_start_4
    const-string v3, "Helpshift_CampDBStore"

    .line 259
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception in fetching all the campaigns with read status : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1, p2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v1, :cond_4

    .line 263
    :try_start_5
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_4
    move-object v1, v2

    .line 266
    :cond_5
    :goto_4
    monitor-exit v0

    return-object v1

    :goto_5
    if-eqz v1, :cond_6

    .line 263
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 265
    :cond_6
    throw p1

    :catchall_2
    move-exception p1

    .line 266
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw p1
.end method

.method public getCampaign(Ljava/lang/String;)Lcom/helpshift/campaigns/models/CampaignDetailModel;
    .locals 11

    .line 272
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 277
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    monitor-enter v0

    .line 280
    :try_start_0
    iget-object v2, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v6, "identifier=?"

    const/4 v2, 0x1

    new-array v7, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v7, v2

    const-string v4, "campaigns"

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    .line 283
    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 284
    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 285
    invoke-direct {p0, v2}, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->cursorToCampaignDetailModel(Landroid/database/Cursor;)Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_1
    if-eqz v2, :cond_2

    .line 293
    :goto_0
    :try_start_2
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_2

    :catch_0
    move-exception v3

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_1
    move-exception v3

    move-object v2, v1

    :goto_1
    :try_start_3
    const-string v4, "Helpshift_CampDBStore"

    .line 289
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception while fetching campaign for id : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1, v3}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v2, :cond_2

    goto :goto_0

    .line 296
    :cond_2
    :goto_2
    :try_start_4
    monitor-exit v0

    return-object v1

    :catchall_1
    move-exception p1

    move-object v1, v2

    :goto_3
    if-eqz v1, :cond_3

    .line 293
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 295
    :cond_3
    throw p1

    :catchall_2
    move-exception p1

    .line 296
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw p1
.end method

.method public markCampaignAsRead(Ljava/lang/String;)V
    .locals 9

    .line 133
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    monitor-enter v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 139
    :try_start_0
    iget-object v3, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    invoke-virtual {v3}, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "identifier=?"

    new-array v5, v2, [Ljava/lang/String;

    aput-object p1, v5, v1

    const-string v6, "campaigns"

    .line 142
    invoke-static {v3, v6, v4, v5}, Lcom/helpshift/util/DatabaseUtils;->exists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 143
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    const-string v7, "read_status"

    .line 144
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v7, "campaigns"

    .line 145
    invoke-virtual {v3, v7, v6, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception v2

    :try_start_1
    const-string v3, "Helpshift_CampDBStore"

    .line 150
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception in marking campaign as read for id : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    if-eqz v1, :cond_2

    .line 154
    iget-object v1, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->observers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/observers/CampaignStorageObserver;

    .line 155
    invoke-interface {v2, p1}, Lcom/helpshift/campaigns/observers/CampaignStorageObserver;->campaignRead(Ljava/lang/String;)V

    goto :goto_1

    .line 158
    :cond_2
    monitor-exit v0

    return-void

    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public markCampaignAsSeen(Ljava/lang/String;)V
    .locals 9

    .line 163
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 166
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    monitor-enter v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 169
    :try_start_0
    iget-object v3, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    invoke-virtual {v3}, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "identifier=?"

    new-array v5, v2, [Ljava/lang/String;

    aput-object p1, v5, v1

    const-string v6, "campaigns"

    .line 172
    invoke-static {v3, v6, v4, v5}, Lcom/helpshift/util/DatabaseUtils;->exists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 173
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    const-string v7, "seen_status"

    .line 174
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v7, "read_status"

    .line 175
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v7, "campaigns"

    .line 176
    invoke-virtual {v3, v7, v6, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception v2

    :try_start_1
    const-string v3, "Helpshift_CampDBStore"

    .line 181
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception in marking campaign as read for id : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    if-eqz v1, :cond_2

    .line 184
    iget-object v1, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->observers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/observers/CampaignStorageObserver;

    .line 185
    invoke-interface {v2, p1}, Lcom/helpshift/campaigns/observers/CampaignStorageObserver;->campaignSeen(Ljava/lang/String;)V

    goto :goto_1

    .line 188
    :cond_2
    monitor-exit v0

    return-void

    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public reinitStorage()V
    .locals 4

    .line 455
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    monitor-enter v0

    .line 457
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const-string v2, "campaigns"

    const/4 v3, 0x0

    .line 458
    invoke-virtual {v1, v2, v3, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    :try_start_1
    const-string v1, "Helpshift_CampDBStore"

    const-string v2, "Exception while reinitializing the storage"

    .line 461
    invoke-static {v1, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public removeObserver(Lcom/helpshift/campaigns/observers/CampaignStorageObserver;)V
    .locals 1

    .line 365
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->observers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public updateCampaignWIthCoverImageFilePath(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 102
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 106
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    monitor-enter v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 109
    :try_start_0
    iget-object v3, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    invoke-virtual {v3}, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "identifier=?"

    new-array v5, v1, [Ljava/lang/String;

    aput-object p1, v5, v2

    const-string v6, "campaigns"

    .line 112
    invoke-static {v3, v6, v4, v5}, Lcom/helpshift/util/DatabaseUtils;->exists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 113
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    const-string v7, "cover_image_file_path"

    .line 114
    invoke-virtual {v6, v7, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "campaigns"

    .line 115
    invoke-virtual {v3, p2, v6, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception p2

    :try_start_1
    const-string v1, "Helpshift_CampDBStore"

    .line 120
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception in updating cover image path for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3, p2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v1, 0x0

    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    .line 124
    iget-object p2, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->observers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {p2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/observers/CampaignStorageObserver;

    .line 125
    invoke-interface {v1, p1}, Lcom/helpshift/campaigns/observers/CampaignStorageObserver;->campaignCoverImageFilePathUpdated(Ljava/lang/String;)V

    goto :goto_1

    .line 128
    :cond_2
    monitor-exit v0

    return-void

    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public updateCampaignWithIconImageFilePath(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 72
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    monitor-enter v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 78
    :try_start_0
    iget-object v3, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->helper:Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;

    invoke-virtual {v3}, Lcom/helpshift/campaigns/storage/CampaignDbStorageHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "identifier=?"

    new-array v5, v1, [Ljava/lang/String;

    aput-object p1, v5, v2

    const-string v6, "campaigns"

    .line 81
    invoke-static {v3, v6, v4, v5}, Lcom/helpshift/util/DatabaseUtils;->exists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 82
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    const-string v7, "icon_image_file_path"

    .line 83
    invoke-virtual {v6, v7, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "campaigns"

    .line 84
    invoke-virtual {v3, p2, v6, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception p2

    :try_start_1
    const-string v1, "Helpshift_CampDBStore"

    .line 89
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception in updating icon image path for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3, p2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v1, 0x0

    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    .line 93
    iget-object p2, p0, Lcom/helpshift/campaigns/storage/CampaignDbStorage;->observers:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {p2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/observers/CampaignStorageObserver;

    .line 94
    invoke-interface {v1, p1}, Lcom/helpshift/campaigns/observers/CampaignStorageObserver;->campaignIconImageFilePathUpdated(Ljava/lang/String;)V

    goto :goto_1

    .line 97
    :cond_2
    monitor-exit v0

    return-void

    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
