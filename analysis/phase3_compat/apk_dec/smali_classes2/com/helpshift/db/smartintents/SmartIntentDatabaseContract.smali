.class public Lcom/helpshift/db/smartintents/SmartIntentDatabaseContract;
.super Ljava/lang/Object;
.source "SmartIntentDatabaseContract.java"

# interfaces
.implements Lcom/helpshift/db/base/DatabaseContract;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_SmrtIntentDB"


# instance fields
.field public final CREATE_SMART_INTENT_MODELS_TABLE:Ljava/lang/String;

.field public final CREATE_SMART_INTENT_TABLE:Ljava/lang/String;

.field public final CREATE_SMART_INTENT_TREE_TABLE:Ljava/lang/String;

.field public final CREATE_SMART_INTENT_WORD_PROBABILITIES_TABLE:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "CREATE TABLE si_tree_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, user_local_id INTEGER NOT NULL, server_id TEXT NOT NULL, tree_version INTEGER NOT NULL, enforce_intent_selection INTEGER NOT NULL, last_refreshed_at INTEGER, prompt_title TEXT, text_input_hint TEXT, search_title TEXT, empty_search_title TEXT, empty_search_description TEXT, token_delimiter TEXT ); "

    .line 46
    iput-object v0, p0, Lcom/helpshift/db/smartintents/SmartIntentDatabaseContract;->CREATE_SMART_INTENT_TREE_TABLE:Ljava/lang/String;

    const-string v0, "CREATE TABLE si_intents_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_local_id INTEGER NOT NULL, label TEXT NOT NULL, server_id TEXT NOT NULL, parent_server_id TEXT );"

    .line 62
    iput-object v0, p0, Lcom/helpshift/db/smartintents/SmartIntentDatabaseContract;->CREATE_SMART_INTENT_TABLE:Ljava/lang/String;

    const-string v0, "CREATE TABLE  si_models_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_local_id INTEGER NOT NULL, version INTEGER NOT NULL, last_refreshed_at INTEGER, confidence_threshold TEXT NOT NULL, max_combined_confidence TEXT NOT NULL, leaf_intent_server_ids TEXT NOT NULL, leaf_intent_base_probabilities TEXT NOT NULL  );"

    .line 70
    iput-object v0, p0, Lcom/helpshift/db/smartintents/SmartIntentDatabaseContract;->CREATE_SMART_INTENT_MODELS_TABLE:Ljava/lang/String;

    const-string v0, "CREATE TABLE si_word_probabilities_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, model_local_id INTEGER NOT NULL, word TEXT NOT NULL, probabilities TEXT NOT NULL );"

    .line 82
    iput-object v0, p0, Lcom/helpshift/db/smartintents/SmartIntentDatabaseContract;->CREATE_SMART_INTENT_WORD_PROBABILITIES_TABLE:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getCreateTableQueries()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "CREATE TABLE si_tree_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, user_local_id INTEGER NOT NULL, server_id TEXT NOT NULL, tree_version INTEGER NOT NULL, enforce_intent_selection INTEGER NOT NULL, last_refreshed_at INTEGER, prompt_title TEXT, text_input_hint TEXT, search_title TEXT, empty_search_title TEXT, empty_search_description TEXT, token_delimiter TEXT ); "

    const-string v1, "CREATE TABLE si_intents_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_local_id INTEGER NOT NULL, label TEXT NOT NULL, server_id TEXT NOT NULL, parent_server_id TEXT );"

    const-string v2, "CREATE TABLE  si_models_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_local_id INTEGER NOT NULL, version INTEGER NOT NULL, last_refreshed_at INTEGER, confidence_threshold TEXT NOT NULL, max_combined_confidence TEXT NOT NULL, leaf_intent_server_ids TEXT NOT NULL, leaf_intent_base_probabilities TEXT NOT NULL  );"

    const-string v3, "CREATE TABLE si_word_probabilities_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, model_local_id INTEGER NOT NULL, word TEXT NOT NULL, probabilities TEXT NOT NULL );"

    .line 101
    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDatabaseName()Ljava/lang/String;
    .locals 1

    .line 96
    invoke-static {}, Lcom/helpshift/support/db/SupportDBNameRepo;->getSmartIntentDbName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDatabaseVersion()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getMigratorsForUpgrade(I)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/helpshift/db/base/IMigrator;",
            ">;"
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method public getTableNames()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "si_tree_table"

    const-string v1, "si_intents_table"

    const-string v2, "si_models_table"

    const-string v3, "si_word_probabilities_table"

    .line 114
    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    const-string v0, "Helpshift_SmrtIntentDB"

    return-object v0
.end method
