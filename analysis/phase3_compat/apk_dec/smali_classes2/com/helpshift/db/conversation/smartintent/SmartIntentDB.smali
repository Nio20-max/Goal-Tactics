.class public Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;
.super Ljava/lang/Object;
.source "SmartIntentDB.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_SiDB"

.field private static mInstance:Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;


# instance fields
.field private final siDbHelper:Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    new-instance v0, Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;

    new-instance v1, Lcom/helpshift/db/smartintents/SmartIntentDatabaseContract;

    invoke-direct {v1}, Lcom/helpshift/db/smartintents/SmartIntentDatabaseContract;-><init>()V

    invoke-direct {v0, p1, v1}, Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;-><init>(Landroid/content/Context;Lcom/helpshift/db/base/DatabaseContract;)V

    iput-object v0, p0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->siDbHelper:Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;

    return-void
.end method

.method private buildIntentIdToChildIntentMap(Ljava/util/List;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;>;"
        }
    .end annotation

    .line 617
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 618
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 619
    iget-object v2, v1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->parentServerId:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 620
    iget-object v2, v1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->parentServerId:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 621
    invoke-static {v2}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 622
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 624
    :cond_1
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 625
    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->parentServerId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private buildIntentTree(Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;"
        }
    .end annotation

    .line 579
    invoke-direct {p0, p1}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->filterRootIntents(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 582
    invoke-direct {p0, p1}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->buildIntentIdToChildIntentMap(Ljava/util/List;)Ljava/util/Map;

    move-result-object p1

    .line 584
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 585
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 586
    iget-object v4, v3, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->serverId:Ljava/lang/String;

    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 587
    invoke-static {v4}, Lcom/helpshift/util/ListUtils;->isNotEmpty(Ljava/util/List;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 588
    iput-object v4, v3, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->children:Ljava/util/List;

    .line 589
    invoke-interface {v1, v4}, Ljava/util/Queue;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 592
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Queue;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 593
    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 594
    iget-object v3, v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->serverId:Ljava/lang/String;

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 595
    invoke-static {v3}, Lcom/helpshift/util/ListUtils;->isNotEmpty(Ljava/util/List;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 596
    iput-object v3, v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->children:Ljava/util/List;

    .line 597
    invoke-interface {v1, v3}, Ljava/util/Queue;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    :cond_2
    return-object v0
.end method

.method private cursorToModelWithoutWordProbabilities(Landroid/database/Cursor;)Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;
    .locals 18

    move-object/from16 v0, p1

    const-string v1, "local_id"

    .line 699
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const-string v3, "version"

    .line 700
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const-string v4, "confidence_threshold"

    .line 701
    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    const-string v6, "max_combined_confidence"

    .line 702
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v6

    const-string v8, "last_refreshed_at"

    .line 704
    invoke-interface {v0, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    const-string v10, "leaf_intent_server_ids"

    .line 706
    invoke-interface {v0, v10}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v0, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 705
    invoke-static {v10}, Lcom/helpshift/util/HSJSONUtils;->jsonArrayToStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v15

    const-string v10, "leaf_intent_base_probabilities"

    .line 708
    invoke-interface {v0, v10}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v0, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 707
    invoke-static {v0}, Lcom/helpshift/util/HSJSONUtils;->jsonToDoubleArrayList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v16

    .line 709
    new-instance v0, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;

    .line 710
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v13

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    const/16 v17, 0x0

    move-object v11, v0

    invoke-direct/range {v11 .. v17}, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;-><init>(Ljava/lang/Integer;Ljava/lang/Double;Ljava/lang/Double;Ljava/util/List;Ljava/util/List;Ljava/util/Map;)V

    .line 712
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->localId:Ljava/lang/Long;

    .line 713
    iput-wide v8, v0, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->lastRefreshedAt:J

    return-object v0
.end method

.method private cursorToSmartIntent(Landroid/database/Cursor;)Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;
    .locals 6

    const-string v0, "local_id"

    .line 564
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    const-string v2, "label"

    .line 566
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "server_id"

    .line 568
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "parent_server_id"

    .line 570
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 571
    new-instance v4, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    const/4 v5, 0x0

    invoke-direct {v4, v2, v3, p1, v5}, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 572
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, v4, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->localId:Ljava/lang/Long;

    return-object v4
.end method

.method private cursorToSmartIntentTree(Landroid/database/Cursor;Ljava/util/List;)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;)",
            "Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;"
        }
    .end annotation

    move-object/from16 v0, p1

    const-string v1, "local_id"

    .line 633
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const-string v3, "server_id"

    .line 635
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v3, "enforce_intent_selection"

    const/4 v4, 0x0

    .line 637
    invoke-static {v0, v3, v4}, Lcom/helpshift/util/DatabaseUtils;->parseBooleanColumnSafe(Landroid/database/Cursor;Ljava/lang/String;Z)Z

    move-result v12

    const-string v3, "last_refreshed_at"

    .line 639
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v14

    const-string v3, "tree_version"

    .line 640
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    const-string v3, "prompt_title"

    .line 642
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const-string v3, "text_input_hint"

    .line 644
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string v3, "search_title"

    .line 646
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    const-string v3, "empty_search_title"

    .line 648
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    const-string v3, "empty_search_description"

    .line 650
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    const-string v3, "token_delimiter"

    .line 652
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 651
    invoke-static {v0}, Lcom/helpshift/util/HSJSONUtils;->jsonArrayToStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v13

    .line 653
    new-instance v0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    move-object v4, v0

    move-wide/from16 v16, v1

    move-wide v1, v14

    move-object/from16 v14, p2

    invoke-direct/range {v4 .. v14}, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;Ljava/util/List;)V

    .line 657
    iput-wide v1, v0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->lastRefreshedAt:J

    .line 658
    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->localId:Ljava/lang/Long;

    return-object v0
.end method

.method private cursorToWordProbabilities(Landroid/database/Cursor;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    const-string v0, "probabilities"

    .line 783
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 784
    invoke-static {p1}, Lcom/helpshift/util/HSJSONUtils;->jsonToDoubleArrayList(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method private declared-synchronized deleteModelAndWordProbabilities(J)Z
    .locals 7

    monitor-enter p0

    :try_start_0
    const-string v0, "model_local_id = ?"

    const-string v1, "local_id = ?"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/String;

    .line 455
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v3, p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 p1, 0x0

    .line 460
    :try_start_1
    iget-object v4, p0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->siDbHelper:Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;

    invoke-virtual {v4}, Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    .line 461
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v4, "si_word_probabilities_table"

    .line 462
    invoke-virtual {p1, v4, v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    const-string v4, "si_models_table"

    .line 464
    invoke-virtual {p1, v4, v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 465
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p1, :cond_1

    .line 476
    :try_start_2
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 477
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_3
    const-string p2, "Helpshift_SiDB"

    .line 481
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Exception in ending transaction : word probabilites table or models table with "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 484
    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 482
    invoke-static {p2, v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_0
    move-exception p2

    goto :goto_2

    :catch_1
    move-exception v2

    :try_start_4
    const-string v4, "Helpshift_SiDB"

    .line 469
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error in delete word probabilities table or models table for selection :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "  "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "and selectionArgs"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 472
    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 469
    invoke-static {v4, v0, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz p1, :cond_0

    .line 476
    :try_start_5
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 477
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_0

    :catch_2
    move-exception p1

    :try_start_6
    const-string v0, "Helpshift_SiDB"

    .line 481
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception in ending transaction : word probabilites table or models table with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 484
    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 482
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :cond_0
    :goto_0
    const/4 v2, 0x0

    .line 487
    :cond_1
    :goto_1
    monitor-exit p0

    return v2

    :goto_2
    if-eqz p1, :cond_2

    .line 476
    :try_start_7
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 477
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_3

    :catch_3
    move-exception p1

    :try_start_8
    const-string v0, "Helpshift_SiDB"

    .line 481
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception in ending transaction : word probabilites table or models table with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 484
    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 482
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 486
    :cond_2
    :goto_3
    throw p2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized deleteTreeAndSmartIntents(J)Z
    .locals 7

    monitor-enter p0

    :try_start_0
    const-string v0, "tree_local_id = ? "

    const-string v1, "local_id = ?"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/String;

    .line 374
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v3, p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 p1, 0x0

    .line 380
    :try_start_1
    iget-object v4, p0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->siDbHelper:Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;

    invoke-virtual {v4}, Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    .line 381
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v4, "si_intents_table"

    .line 382
    invoke-virtual {p1, v4, v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    const-string v4, "si_tree_table"

    .line 383
    invoke-virtual {p1, v4, v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 384
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p1, :cond_1

    .line 394
    :try_start_2
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 395
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_3
    const-string p2, "Helpshift_SiDB"

    .line 399
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Exception in ending transaction : smartintents table or tree table with "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 400
    invoke-static {p2, v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_0
    move-exception p2

    goto :goto_2

    :catch_1
    move-exception v2

    :try_start_4
    const-string v4, "Helpshift_SiDB"

    .line 388
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error in delete smart intents table or tree table for selection :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "  "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "and selectionArgs"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 388
    invoke-static {v4, v0, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz p1, :cond_0

    .line 394
    :try_start_5
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 395
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_0

    :catch_2
    move-exception p1

    :try_start_6
    const-string v0, "Helpshift_SiDB"

    .line 399
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception in ending transaction : smartintents table or tree table with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 400
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :cond_0
    :goto_0
    const/4 v2, 0x0

    .line 404
    :cond_1
    :goto_1
    monitor-exit p0

    return v2

    :goto_2
    if-eqz p1, :cond_2

    .line 394
    :try_start_7
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 395
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_3

    :catch_3
    move-exception p1

    :try_start_8
    const-string v0, "Helpshift_SiDB"

    .line 399
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception in ending transaction : smartintents table or tree table with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 400
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 403
    :cond_2
    :goto_3
    throw p2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private filterRootIntents(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;"
        }
    .end annotation

    .line 605
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 606
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 607
    iget-object v2, v1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->parentServerId:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 608
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;
    .locals 2

    const-class v0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;

    monitor-enter v0

    .line 73
    :try_start_0
    sget-object v1, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->mInstance:Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;

    if-nez v1, :cond_0

    .line 74
    new-instance v1, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;

    invoke-direct {v1, p0}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->mInstance:Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;

    .line 76
    :cond_0
    sget-object p0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->mInstance:Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private getIntentsFlatList(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;"
        }
    .end annotation

    .line 193
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 194
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1, p1}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 195
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-object v0

    .line 198
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Queue;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    .line 199
    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 200
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    iget-object v2, p1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->children:Ljava/util/List;

    invoke-static {v2}, Lcom/helpshift/util/ListUtils;->isNotEmpty(Ljava/util/List;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 202
    iget-object v2, p1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->children:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/Queue;->addAll(Ljava/util/Collection;)Z

    .line 203
    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->children:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private getSmartIntents(J)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;"
        }
    .end annotation

    const-string v3, "tree_local_id = ? "

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    .line 533
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v4, p2

    .line 535
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    const/4 p2, 0x0

    .line 537
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->siDbHelper:Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "si_intents_table"

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 538
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p2

    .line 545
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 547
    :cond_0
    invoke-direct {p0, p2}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->cursorToSmartIntent(Landroid/database/Cursor;)Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    move-result-object v0

    .line 548
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 549
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    :cond_1
    if-eqz p2, :cond_2

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_1
    const-string v1, "Helpshift_SiDB"

    const-string v2, "Error in reading smart intents from db"

    .line 553
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p2, :cond_2

    .line 557
    :goto_0
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    :cond_2
    return-object p1

    :goto_1
    if-eqz p2, :cond_3

    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 559
    :cond_3
    throw p1
.end method

.method private declared-synchronized insert(Landroid/content/ContentValues;Ljava/lang/String;)J
    .locals 3

    monitor-enter p0

    .line 314
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->siDbHelper:Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const/4 v1, 0x0

    .line 315
    invoke-virtual {v0, p2, v1, p1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide p1
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
    const-string v0, "Helpshift_SiDB"

    .line 318
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error in inserting in table: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-wide/16 p1, -0x1

    .line 320
    :goto_0
    monitor-exit p0

    return-wide p1

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method private insertSmartIntents(JLjava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    const-string v0, "Error in ending the insert txn in smart intents table: "

    const-string v1, "Helpshift_SiDB"

    .line 144
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 145
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 146
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 147
    invoke-direct {p0, v4, p1, p2}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->smartIntentToContentValues(Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;J)Landroid/content/ContentValues;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 152
    :try_start_0
    iget-object p2, p0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->siDbHelper:Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;

    invoke-virtual {p2}, Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    :try_start_1
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 154
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/ContentValues;

    const-string v4, "si_intents_table"

    .line 155
    invoke-virtual {p2, v4, p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v3

    .line 156
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 158
    :cond_1
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz p2, :cond_2

    .line 166
    :try_start_2
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 167
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_3

    :catch_0
    move-exception p1

    goto :goto_2

    :catchall_0
    move-exception p2

    move-object v5, p2

    move-object p2, p1

    move-object p1, v5

    goto :goto_4

    :catch_1
    move-exception p2

    move-object v5, p2

    move-object p2, p1

    move-object p1, v5

    .line 161
    :goto_2
    :try_start_3
    invoke-interface {v2}, Ljava/util/List;->clear()V

    const-string p3, "Error in inserting in smart intents table: "

    .line 162
    invoke-static {v1, p3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz p2, :cond_2

    .line 166
    :try_start_4
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 167
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    :catch_2
    move-exception p1

    .line 171
    invoke-static {v1, v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_3
    return-object v2

    :catchall_1
    move-exception p1

    :goto_4
    if-eqz p2, :cond_3

    .line 166
    :try_start_5
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p3

    if-eqz p3, :cond_3

    .line 167
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_5

    :catch_3
    move-exception p2

    .line 171
    invoke-static {v1, v0, p2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 173
    :cond_3
    :goto_5
    throw p1
.end method

.method private insertWordProbabilities(JLjava/util/Map;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;>;)",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    const-string v0, "Error in ending the insert txn in word probabilities table: "

    const-string v1, "Helpshift_SiDB"

    .line 263
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 264
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 266
    invoke-interface {p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 268
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-direct {p0, p1, p2, v5, v4}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->wordProbabilitiesToContentValues(JLjava/lang/String;Ljava/util/List;)Landroid/content/ContentValues;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 273
    :try_start_0
    iget-object p2, p0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->siDbHelper:Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;

    invoke-virtual {p2}, Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 274
    :try_start_1
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 275
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/ContentValues;

    const-string v4, "si_word_probabilities_table"

    .line 277
    invoke-virtual {p2, v4, p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v3

    .line 278
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 280
    :cond_1
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz p2, :cond_2

    .line 288
    :try_start_2
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 289
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_3

    :catch_0
    move-exception p1

    goto :goto_2

    :catchall_0
    move-exception p2

    move-object v6, p2

    move-object p2, p1

    move-object p1, v6

    goto :goto_4

    :catch_1
    move-exception p2

    move-object v6, p2

    move-object p2, p1

    move-object p1, v6

    .line 283
    :goto_2
    :try_start_3
    invoke-interface {v2}, Ljava/util/List;->clear()V

    const-string p3, "Error in inserting in word probabilities table: "

    .line 284
    invoke-static {v1, p3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz p2, :cond_2

    .line 288
    :try_start_4
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 289
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    :catch_2
    move-exception p1

    .line 293
    invoke-static {v1, v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_3
    return-object v2

    :catchall_1
    move-exception p1

    :goto_4
    if-eqz p2, :cond_3

    .line 288
    :try_start_5
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result p3

    if-eqz p3, :cond_3

    .line 289
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_5

    :catch_3
    move-exception p2

    .line 293
    invoke-static {v1, v0, p2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 295
    :cond_3
    :goto_5
    throw p1
.end method

.method private smartIntentModelToContentValues(JLcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;)Landroid/content/ContentValues;
    .locals 5

    .line 244
    iget-object v0, p3, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->leafIntentServerIds:Ljava/util/List;

    .line 245
    invoke-static {v0}, Lcom/helpshift/util/HSJSONUtils;->listToJsonArray(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    .line 246
    iget-object v1, p3, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->leafIntentBaseProbabilities:Ljava/util/List;

    .line 247
    invoke-static {v1}, Lcom/helpshift/util/HSJSONUtils;->doubleListToJsonArray(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    .line 248
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 249
    iget-object v3, p3, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->localId:Ljava/lang/Long;

    const-string v4, "local_id"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 250
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "tree_local_id"

    invoke-virtual {v2, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 251
    iget-object p1, p3, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->version:Ljava/lang/Integer;

    const-string p2, "version"

    invoke-virtual {v2, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 252
    iget-wide p1, p3, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->lastRefreshedAt:J

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "last_refreshed_at"

    invoke-virtual {v2, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 253
    iget-object p1, p3, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->confidenceThreshold:Ljava/lang/Double;

    const-string p2, "confidence_threshold"

    invoke-virtual {v2, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 254
    iget-object p1, p3, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->maxCombinedConfidence:Ljava/lang/Double;

    const-string p2, "max_combined_confidence"

    invoke-virtual {v2, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string p1, "leaf_intent_server_ids"

    .line 255
    invoke-virtual {v2, p1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "leaf_intent_base_probabilities"

    .line 256
    invoke-virtual {v2, p1, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2
.end method

.method private smartIntentToContentValues(Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;J)Landroid/content/ContentValues;
    .locals 1

    .line 210
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 211
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    const-string p3, "tree_local_id"

    invoke-virtual {v0, p3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 212
    iget-object p2, p1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->label:Ljava/lang/String;

    const-string p3, "label"

    invoke-virtual {v0, p3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    iget-object p2, p1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->serverId:Ljava/lang/String;

    const-string p3, "server_id"

    invoke-virtual {v0, p3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->parentServerId:Ljava/lang/String;

    const-string p2, "parent_server_id"

    invoke-virtual {v0, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private smartIntentTreeToContentValues(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;Lcom/helpshift/account/domainmodel/UserDM;)Landroid/content/ContentValues;
    .locals 3

    .line 124
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 125
    invoke-virtual {p2}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object p2

    const-string v1, "user_local_id"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 126
    iget-object p2, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->serverId:Ljava/lang/String;

    const-string v1, "server_id"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    iget p2, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->version:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const-string v1, "tree_version"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 128
    iget-boolean p2, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->enforceIntentSelection:Z

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const-string v1, "enforce_intent_selection"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 129
    iget-wide v1, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->lastRefreshedAt:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    const-string v1, "last_refreshed_at"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 130
    iget-object p2, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->promptTitle:Ljava/lang/String;

    const-string v1, "prompt_title"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    iget-object p2, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->textInputHint:Ljava/lang/String;

    const-string v1, "text_input_hint"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    iget-object p2, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->searchTitle:Ljava/lang/String;

    const-string v1, "search_title"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    iget-object p2, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->emptySearchTitle:Ljava/lang/String;

    const-string v1, "empty_search_title"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    iget-object p2, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->emptySearchDescription:Ljava/lang/String;

    const-string v1, "empty_search_description"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->tokenDelimiter:Ljava/util/List;

    invoke-static {p1}, Lcom/helpshift/util/HSJSONUtils;->listToJsonArray(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object p1

    .line 136
    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "token_delimiter"

    .line 135
    invoke-virtual {v0, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private wordProbabilitiesToContentValues(JLjava/lang/String;Ljava/util/List;)Landroid/content/ContentValues;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;)",
            "Landroid/content/ContentValues;"
        }
    .end annotation

    .line 301
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 302
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "model_local_id"

    invoke-virtual {v0, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p1, "word"

    .line 303
    invoke-virtual {v0, p1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    invoke-static {p4}, Lcom/helpshift/util/HSJSONUtils;->doubleListToJsonArray(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "probabilities"

    .line 306
    invoke-virtual {v0, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public declared-synchronized deleteModel(J)Z
    .locals 8

    monitor-enter p0

    :try_start_0
    const-string v3, "tree_local_id = ? "

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    .line 415
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v4, p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 p1, 0x0

    .line 419
    :try_start_1
    iget-object v0, p0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->siDbHelper:Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "si_models_table"

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 421
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    .line 429
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "local_id"

    .line 430
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 431
    invoke-direct {p0, v0, v1}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->deleteModelAndWordProbabilities(J)Z

    move-result p2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    if-eqz p1, :cond_1

    .line 439
    :goto_0
    :try_start_2
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catchall_0
    move-exception p2

    goto :goto_2

    :catch_0
    move-exception v0

    :try_start_3
    const-string v1, "Helpshift_SiDB"

    const-string v2, "Error in deleting the model table"

    .line 435
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz p1, :cond_1

    goto :goto_0

    .line 442
    :cond_1
    :goto_1
    monitor-exit p0

    return p2

    :goto_2
    if-eqz p1, :cond_2

    .line 439
    :try_start_4
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 441
    :cond_2
    throw p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized deleteTreeAndModel(Lcom/helpshift/account/domainmodel/UserDM;)Z
    .locals 10

    monitor-enter p0

    :try_start_0
    const-string v3, "user_local_id = ? "

    const/4 v8, 0x1

    new-array v4, v8, [Ljava/lang/String;

    .line 332
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v9, 0x0

    aput-object p1, v4, v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 p1, 0x0

    .line 336
    :try_start_1
    iget-object v0, p0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->siDbHelper:Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;

    invoke-virtual {v0}, Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "si_tree_table"

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 338
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    .line 346
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "local_id"

    .line 347
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 348
    invoke-direct {p0, v0, v1}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->deleteTreeAndSmartIntents(J)Z

    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_0

    .line 349
    :try_start_2
    invoke-virtual {p0, v0, v1}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->deleteModel(J)Z

    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v0, :cond_0

    goto :goto_0

    :catch_0
    move-exception v0

    move v9, v2

    goto :goto_2

    :cond_0
    const/4 v8, 0x0

    :goto_0
    move v9, v8

    :cond_1
    if-eqz p1, :cond_2

    .line 357
    :goto_1
    :try_start_3
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_3

    :catchall_0
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    :goto_2
    :try_start_4
    const-string v1, "Helpshift_SiDB"

    const-string v2, "Error in deleting the tree and model"

    .line 353
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz p1, :cond_2

    goto :goto_1

    .line 360
    :cond_2
    :goto_3
    monitor-exit p0

    return v9

    :goto_4
    if-eqz p1, :cond_3

    .line 357
    :try_start_5
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 359
    :cond_3
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getModelWithoutWordProbabilities(J)Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;
    .locals 9

    const-string v3, "tree_local_id = ? "

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    .line 670
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v4, p2

    const/4 p1, 0x0

    .line 674
    :try_start_0
    iget-object p2, p0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->siDbHelper:Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;

    invoke-virtual {p2}, Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "si_models_table"

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 675
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 683
    :try_start_1
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 684
    invoke-direct {p0, p2}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->cursorToModelWithoutWordProbabilities(Landroid/database/Cursor;)Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_0
    if-eqz p2, :cond_1

    .line 692
    :goto_0
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_1

    :catchall_0
    move-exception p2

    move-object v8, p2

    move-object p2, p1

    move-object p1, v8

    goto :goto_3

    :catch_1
    move-exception v0

    move-object p2, p1

    :goto_1
    :try_start_2
    const-string v1, "Helpshift_SiDB"

    const-string v2, "Error in reading the search model "

    .line 688
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    :goto_2
    return-object p1

    :catchall_1
    move-exception p1

    :goto_3
    if-eqz p2, :cond_2

    .line 692
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 694
    :cond_2
    throw p1
.end method

.method public getSmartIntentTree(J)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;
    .locals 9

    const-string v3, "user_local_id = ? "

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    .line 498
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v4, p2

    const/4 p1, 0x0

    .line 502
    :try_start_0
    iget-object p2, p0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->siDbHelper:Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;

    invoke-virtual {p2}, Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "si_tree_table"

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 504
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 512
    :try_start_1
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "local_id"

    .line 513
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 514
    invoke-direct {p0, v0, v1}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->getSmartIntents(J)Ljava/util/List;

    move-result-object v0

    .line 515
    invoke-direct {p0, v0}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->buildIntentTree(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 516
    invoke-direct {p0, p2, v0}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->cursorToSmartIntentTree(Landroid/database/Cursor;Ljava/util/List;)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_0
    if-eqz p2, :cond_1

    .line 524
    :goto_0
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_1

    :catchall_0
    move-exception p2

    move-object v8, p2

    move-object p2, p1

    move-object p1, v8

    goto :goto_3

    :catch_1
    move-exception v0

    move-object p2, p1

    :goto_1
    :try_start_2
    const-string v1, "Helpshift_SiDB"

    const-string v2, "Error in reading smart intent tree"

    .line 520
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    :goto_2
    return-object p1

    :catchall_1
    move-exception p1

    :goto_3
    if-eqz p2, :cond_2

    .line 524
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 526
    :cond_2
    throw p1
.end method

.method public getWordToIntentProbabilities(JLjava/lang/String;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    const-string v3, "model_local_id = ? AND word = ?"

    const/4 v0, 0x2

    new-array v4, v0, [Ljava/lang/String;

    .line 754
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v4, p2

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v4, p2

    const/4 p1, 0x0

    .line 758
    :try_start_0
    iget-object p2, p0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->siDbHelper:Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;

    invoke-virtual {p2}, Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "si_word_probabilities_table"

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 759
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 766
    :try_start_1
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p3

    if-eqz p3, :cond_0

    .line 767
    invoke-direct {p0, p2}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->cursorToWordProbabilities(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_0
    if-eqz p2, :cond_1

    .line 775
    :goto_0
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    goto :goto_2

    :catch_0
    move-exception p3

    goto :goto_1

    :catchall_0
    move-exception p2

    move-object v8, p2

    move-object p2, p1

    move-object p1, v8

    goto :goto_3

    :catch_1
    move-exception p3

    move-object p2, p1

    :goto_1
    :try_start_2
    const-string v0, "Helpshift_SiDB"

    const-string v1, "Error in getting word probabilities "

    .line 771
    invoke-static {v0, v1, p3}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    :goto_2
    return-object p1

    :catchall_1
    move-exception p1

    :goto_3
    if-eqz p2, :cond_2

    .line 775
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 777
    :cond_2
    throw p1
.end method

.method public declared-synchronized insertModel(JLcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;)Z
    .locals 4

    monitor-enter p0

    .line 227
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->smartIntentModelToContentValues(JLcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;)Landroid/content/ContentValues;

    move-result-object p1

    const-string p2, "si_models_table"

    .line 228
    invoke-direct {p0, p1, p2}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->insert(Landroid/content/ContentValues;Ljava/lang/String;)J

    move-result-wide p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v0, -0x1

    const/4 v2, 0x0

    cmp-long v3, p1, v0

    if-nez v3, :cond_0

    .line 230
    monitor-exit p0

    return v2

    .line 232
    :cond_0
    :try_start_1
    iget-object p3, p3, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->wordToLeafIntentProbabilitiesMapping:Ljava/util/Map;

    .line 233
    invoke-direct {p0, p1, p2, p3}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->insertWordProbabilities(JLjava/util/Map;)Ljava/util/List;

    move-result-object p3

    .line 234
    invoke-static {p3}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result p3

    if-eqz p3, :cond_1

    .line 235
    invoke-direct {p0, p1, p2}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->deleteModelAndWordProbabilities(J)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 236
    monitor-exit p0

    return v2

    :cond_1
    const/4 p1, 0x1

    .line 239
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized insertTree(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Z
    .locals 5

    monitor-enter p0

    .line 87
    :try_start_0
    invoke-direct {p0, p2, p1}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->smartIntentTreeToContentValues(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;Lcom/helpshift/account/domainmodel/UserDM;)Landroid/content/ContentValues;

    move-result-object p1

    const-string v0, "si_tree_table"

    .line 88
    invoke-direct {p0, p1, v0}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->insert(Landroid/content/ContentValues;Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v2, -0x1

    const/4 p1, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    .line 90
    monitor-exit p0

    return p1

    .line 92
    :cond_0
    :try_start_1
    iget-object p2, p2, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->rootIntents:Ljava/util/List;

    invoke-direct {p0, p2}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->getIntentsFlatList(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    .line 93
    invoke-direct {p0, v0, v1, p2}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->insertSmartIntents(JLjava/util/List;)Ljava/util/List;

    move-result-object p2

    .line 94
    invoke-static {p2}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 95
    invoke-direct {p0, v0, v1}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->deleteTreeAndSmartIntents(J)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 96
    monitor-exit p0

    return p1

    :cond_1
    const/4 p1, 0x1

    .line 99
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized updateModelRefreshedAt(JJ)Z
    .locals 3

    monitor-enter p0

    .line 726
    :try_start_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "last_refreshed_at"

    .line 727
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-virtual {v0, v1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p3, "tree_local_id = ? "

    const/4 p4, 0x1

    new-array v1, p4, [Ljava/lang/String;

    .line 729
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v1, p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 731
    :try_start_1
    iget-object p1, p0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->siDbHelper:Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;

    invoke-virtual {p1}, Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const-string v2, "si_models_table"

    .line 732
    invoke-virtual {p1, v2, v0, p3, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string p3, "Helpshift_SiDB"

    const-string p4, "Error in updating model refreshedAt"

    .line 739
    invoke-static {p3, p4, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const/4 p4, 0x0

    .line 741
    :goto_0
    monitor-exit p0

    return p4

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized updateTreeRefreshedAt(Lcom/helpshift/account/domainmodel/UserDM;J)Z
    .locals 4

    monitor-enter p0

    .line 105
    :try_start_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "last_refreshed_at"

    .line 106
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p2, "user_local_id = ? "

    const/4 p3, 0x1

    new-array v1, p3, [Ljava/lang/String;

    .line 108
    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    :try_start_1
    iget-object p1, p0, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->siDbHelper:Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;

    invoke-virtual {p1}, Lcom/helpshift/db/smartintents/SmartIntentsDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const-string v3, "si_tree_table"

    .line 111
    invoke-virtual {p1, v3, v0, p2, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string p2, "Helpshift_SiDB"

    const-string p3, "Error in updating tree refreshedAt"

    .line 118
    invoke-static {p2, p3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const/4 p3, 0x0

    .line 120
    :goto_0
    monitor-exit p0

    return p3

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
