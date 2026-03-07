.class public Lcom/helpshift/db/conversation/ConversationDatabaseContract;
.super Ljava/lang/Object;
.source "ConversationDatabaseContract.java"

# interfaces
.implements Lcom/helpshift/db/base/DatabaseContract;


# static fields
.field public static final CREATE_ACTION_CARD_TABLE:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS action_cards ( _id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,image_url TEXT,file_path TEXT,is_image_secure INTEGER,message_id TEXT NOT NULL,FOREIGN KEY(message_id) REFERENCES messages (server_id));"

.field public static final CREATE_ACTION_TABLE:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS actions ( _id INTEGER PRIMARY KEY AUTOINCREMENT,action_sha TEXT NOT NULL,action_title TEXT NOT NULL,action_type TEXT NOT NULL,action_data TEXT NOT NULL,action_card_id INTEGER NOT NULL,FOREIGN KEY(action_card_id) REFERENCES action_cards (_id));"

.field private static final TAG:Ljava/lang/String; = "ConversationDatabase"


# instance fields
.field private final CREATE_CONVERSATION_INBOX_TABLE:Ljava/lang/String;

.field private final CREATE_CONVERSATION_TABLE:Ljava/lang/String;

.field private final CREATE_FAQ_LIST_SUGGESTIONS_CACHE_TABLE:Ljava/lang/String;

.field private final CREATE_MESSAGES_TABLE:Ljava/lang/String;

.field private final CREATE_SERVER_ID_INDEX_MESSAGES_TABLE:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "CREATE TABLE messages ( _id INTEGER PRIMARY KEY AUTOINCREMENT, server_id TEXT, conversation_id TEXT, body TEXT, author_name TEXT, type TEXT, meta TEXT, is_redacted INTEGER, created_at TEXT, epoch_time_created_at INTEGER NOT NULL, md_state INTEGER, author_id TEXT, local_avatar_image_path TEXT, author_role TEXT  );"

    .line 29
    iput-object v0, p0, Lcom/helpshift/db/conversation/ConversationDatabaseContract;->CREATE_MESSAGES_TABLE:Ljava/lang/String;

    const-string v0, "CREATE INDEX SERVER_IDX ON messages(server_id)"

    .line 49
    iput-object v0, p0, Lcom/helpshift/db/conversation/ConversationDatabaseContract;->CREATE_SERVER_ID_INDEX_MESSAGES_TABLE:Ljava/lang/String;

    const-string v0, "CREATE TABLE issues ( _id INTEGER PRIMARY KEY AUTOINCREMENT,server_id TEXT UNIQUE, pre_conv_server_id TEXT UNIQUE, publish_id TEXT, uuid TEXT NOT NULL, user_local_id TEXT NOT NULL, title TEXT NOT NULL,issue_type TEXT NOT NULL, state INTEGER NOT NULL, show_agent_name INTEGER,message_cursor TEXT,start_new_conversation_action INTEGER, is_redacted INTEGER, meta TEXT,last_user_activity_time INTEGER, full_privacy_enabled INTEGER, epoch_time_created_at INTEGER NOT NULL, created_at TEXT NOT NULL,updated_at TEXT NOT NULL, acid TEXT, resolution_expiry_at INTEGER, csat_expiry_at INTEGER, can_start_new_conversation INTEGER, feedback_bots_enabled INTEGER  );"

    .line 53
    iput-object v0, p0, Lcom/helpshift/db/conversation/ConversationDatabaseContract;->CREATE_CONVERSATION_TABLE:Ljava/lang/String;

    const-string v0, "CREATE TABLE conversation_inbox ( user_local_id TEXT PRIMARY KEY NOT NULL, form_name TEXT,form_email TEXT,description_draft TEXT,description_draft_timestamp TEXT,attachment_draft TEXT,description_type TEXT,archival_text TEXT, reply_text TEXT, persist_message_box INT, since TEXT, has_older_messages INT, last_conv_redaction_time INT );"

    .line 82
    iput-object v0, p0, Lcom/helpshift/db/conversation/ConversationDatabaseContract;->CREATE_CONVERSATION_INBOX_TABLE:Ljava/lang/String;

    const-string v0, "CREATE TABLE faq_suggestions ( _id INTEGER PRIMARY KEY AUTOINCREMENT,question_id TEXT NOT NULL,publish_id TEXT NOT NULL,language TEXT NOT NULL,section_id TEXT NOT NULL,title TEXT NOT NULL,body TEXT NOT NULL,helpful INTEGER,rtl INTEGER,tags TEXT,c_tags TEXT );"

    .line 100
    iput-object v0, p0, Lcom/helpshift/db/conversation/ConversationDatabaseContract;->CREATE_FAQ_LIST_SUGGESTIONS_CACHE_TABLE:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getCreateTableQueries()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "CREATE TABLE issues ( _id INTEGER PRIMARY KEY AUTOINCREMENT,server_id TEXT UNIQUE, pre_conv_server_id TEXT UNIQUE, publish_id TEXT, uuid TEXT NOT NULL, user_local_id TEXT NOT NULL, title TEXT NOT NULL,issue_type TEXT NOT NULL, state INTEGER NOT NULL, show_agent_name INTEGER,message_cursor TEXT,start_new_conversation_action INTEGER, is_redacted INTEGER, meta TEXT,last_user_activity_time INTEGER, full_privacy_enabled INTEGER, epoch_time_created_at INTEGER NOT NULL, created_at TEXT NOT NULL,updated_at TEXT NOT NULL, acid TEXT, resolution_expiry_at INTEGER, csat_expiry_at INTEGER, can_start_new_conversation INTEGER, feedback_bots_enabled INTEGER  );"

    const-string v1, "CREATE TABLE conversation_inbox ( user_local_id TEXT PRIMARY KEY NOT NULL, form_name TEXT,form_email TEXT,description_draft TEXT,description_draft_timestamp TEXT,attachment_draft TEXT,description_type TEXT,archival_text TEXT, reply_text TEXT, persist_message_box INT, since TEXT, has_older_messages INT, last_conv_redaction_time INT );"

    const-string v2, "CREATE TABLE messages ( _id INTEGER PRIMARY KEY AUTOINCREMENT, server_id TEXT, conversation_id TEXT, body TEXT, author_name TEXT, type TEXT, meta TEXT, is_redacted INTEGER, created_at TEXT, epoch_time_created_at INTEGER NOT NULL, md_state INTEGER, author_id TEXT, local_avatar_image_path TEXT, author_role TEXT  );"

    const-string v3, "CREATE INDEX SERVER_IDX ON messages(server_id)"

    const-string v4, "CREATE TABLE faq_suggestions ( _id INTEGER PRIMARY KEY AUTOINCREMENT,question_id TEXT NOT NULL,publish_id TEXT NOT NULL,language TEXT NOT NULL,section_id TEXT NOT NULL,title TEXT NOT NULL,body TEXT NOT NULL,helpful INTEGER,rtl INTEGER,tags TEXT,c_tags TEXT );"

    const-string v5, "CREATE TABLE IF NOT EXISTS action_cards ( _id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,image_url TEXT,file_path TEXT,is_image_secure INTEGER,message_id TEXT NOT NULL,FOREIGN KEY(message_id) REFERENCES messages (server_id));"

    const-string v6, "CREATE TABLE IF NOT EXISTS actions ( _id INTEGER PRIMARY KEY AUTOINCREMENT,action_sha TEXT NOT NULL,action_title TEXT NOT NULL,action_type TEXT NOT NULL,action_data TEXT NOT NULL,action_card_id INTEGER NOT NULL,FOREIGN KEY(action_card_id) REFERENCES action_cards (_id));"

    .line 149
    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDatabaseName()Ljava/lang/String;
    .locals 1

    .line 144
    invoke-static {}, Lcom/helpshift/support/db/SupportDBNameRepo;->getIssuesDbName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDatabaseVersion()I
    .locals 1

    const/16 v0, 0xc

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

    .line 160
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x6

    if-lt p1, v1, :cond_5

    if-ne p1, v1, :cond_0

    .line 164
    new-instance v1, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;

    invoke-direct {v1}, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    const/4 v1, 0x7

    if-gt p1, v1, :cond_1

    .line 167
    new-instance v1, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;

    invoke-direct {v1}, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    const/16 v1, 0x8

    if-gt p1, v1, :cond_2

    .line 170
    new-instance v1, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_8_to_9;

    invoke-direct {v1}, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_8_to_9;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    const/16 v1, 0x9

    if-gt p1, v1, :cond_3

    .line 173
    new-instance v1, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_9_to_10;

    invoke-direct {v1}, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_9_to_10;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    const/16 v1, 0xa

    if-gt p1, v1, :cond_4

    .line 176
    new-instance v1, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_10_to_11;

    invoke-direct {v1}, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_10_to_11;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    const/16 v1, 0xb

    if-gt p1, v1, :cond_6

    .line 179
    new-instance p1, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_11_to_12;

    invoke-direct {p1}, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_11_to_12;-><init>()V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 183
    :cond_5
    new-instance p1, Lcom/helpshift/db/base/DropAndCreateDatabaseMigrator;

    invoke-direct {p1, p0}, Lcom/helpshift/db/base/DropAndCreateDatabaseMigrator;-><init>(Lcom/helpshift/db/base/DatabaseContract;)V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6
    :goto_0
    return-object v0
.end method

.method public getTableNames()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "actions"

    const-string v1, "action_cards"

    const-string v2, "messages"

    const-string v3, "conversation_inbox"

    const-string v4, "issues"

    const-string v5, "faq_suggestions"

    .line 190
    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    const-string v0, "ConversationDatabase"

    return-object v0
.end method
