.class public Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;
.super Ljava/lang/Object;
.source "ConversationDbMigration_7_to_8.java"

# interfaces
.implements Lcom/helpshift/db/base/IMigrator;


# instance fields
.field private final CREATE_CONVERSATION_TABLE_DB_VERSION_8:Ljava/lang/String;

.field private RENAME_CONVERSATION_TABLE:Ljava/lang/String;

.field private TEMP_TABLE_CONVERSATIONS:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "issues_old"

    .line 12
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;->TEMP_TABLE_CONVERSATIONS:Ljava/lang/String;

    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ALTER TABLE issues RENAME TO "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;->TEMP_TABLE_CONVERSATIONS:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;->RENAME_CONVERSATION_TABLE:Ljava/lang/String;

    const-string v0, "CREATE TABLE issues ( _id INTEGER PRIMARY KEY AUTOINCREMENT,server_id TEXT UNIQUE, pre_conv_server_id TEXT UNIQUE, publish_id TEXT, uuid TEXT NOT NULL, user_local_id TEXT NOT NULL, title TEXT NOT NULL,issue_type TEXT NOT NULL, state INTEGER NOT NULL, show_agent_name INTEGER,message_cursor TEXT,start_new_conversation_action INTEGER, is_redacted INTEGER, meta TEXT,last_user_activity_time INTEGER, full_privacy_enabled INTEGER, epoch_time_created_at INTEGER NOT NULL, created_at TEXT NOT NULL,updated_at TEXT NOT NULL  );"

    .line 18
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;->CREATE_CONVERSATION_TABLE_DB_VERSION_8:Ljava/lang/String;

    return-void
.end method

.method private dropTemporaryTables(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DROP TABLE IF EXISTS "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;->TEMP_TABLE_CONVERSATIONS:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method private getDuplicacyRecord(Landroid/database/sqlite/SQLiteDatabase;)I
    .locals 2

    const-string v0, "SELECT Count(server_id) , Count(DISTINCT server_id) FROM issues"

    .line 116
    invoke-direct {p0, v0, p1}, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;->getDuplicateRecord(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;)I

    move-result v0

    const-string v1, "SELECT Count(pre_conv_server_id) , Count(DISTINCT pre_conv_server_id) FROM issues"

    .line 117
    invoke-direct {p0, v1, p1}, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;->getDuplicateRecord(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;)I

    move-result p1

    add-int/2addr v0, p1

    return v0
.end method

.method private getDuplicateRecord(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;)I
    .locals 1

    const/4 v0, 0x0

    .line 122
    invoke-virtual {p2, p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    .line 125
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    .line 126
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    const/4 v0, 0x1

    .line 127
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-int v0, p2, v0

    :cond_0
    if-eqz p1, :cond_1

    .line 133
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_1
    return v0

    :catchall_0
    move-exception p2

    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 135
    :cond_2
    throw p2
.end method

.method private migrateData(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "INSERT INTO issues (_id, server_id, pre_conv_server_id, publish_id, uuid, user_local_id, title,issue_type, state, show_agent_name,message_cursor,start_new_conversation_action, is_redacted, meta,last_user_activity_time, full_privacy_enabled, epoch_time_created_at, created_at, updated_at ) SELECT _id, server_id, pre_conv_server_id, publish_id, uuid, user_local_id, title,issue_type, state, show_agent_name,message_cursor,start_new_conversation_action, is_redacted, meta,last_user_activity_time, full_privacy_enabled, epoch_time_created_at, created_at, updated_at FROM "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;->TEMP_TABLE_CONVERSATIONS:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 102
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method private migrateTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;->RENAME_CONVERSATION_TABLE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE issues ( _id INTEGER PRIMARY KEY AUTOINCREMENT,server_id TEXT UNIQUE, pre_conv_server_id TEXT UNIQUE, publish_id TEXT, uuid TEXT NOT NULL, user_local_id TEXT NOT NULL, title TEXT NOT NULL,issue_type TEXT NOT NULL, state INTEGER NOT NULL, show_agent_name INTEGER,message_cursor TEXT,start_new_conversation_action INTEGER, is_redacted INTEGER, meta TEXT,last_user_activity_time INTEGER, full_privacy_enabled INTEGER, epoch_time_created_at INTEGER NOT NULL, created_at TEXT NOT NULL,updated_at TEXT NOT NULL  );"

    .line 60
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public migrate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 46
    invoke-direct {p0, p1}, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;->getDuplicacyRecord(Landroid/database/sqlite/SQLiteDatabase;)I

    move-result v0

    if-nez v0, :cond_0

    .line 47
    invoke-direct {p0, p1}, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;->migrateTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 48
    invoke-direct {p0, p1}, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;->migrateData(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 50
    invoke-direct {p0, p1}, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_7_to_8;->dropTemporaryTables(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void

    .line 53
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "Migration not possible as duplicate issue exists"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method
