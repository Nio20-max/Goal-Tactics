.class public Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;
.super Ljava/lang/Object;
.source "ConversationDbMigration_6_to_7.java"

# interfaces
.implements Lcom/helpshift/db/base/IMigrator;


# instance fields
.field private ADD_EPOCH_TIME_CREATE_AT_COLUMN_INTO_CONVERSATIONS_TABLE:Ljava/lang/String;

.field private ADD_EPOCH_TIME_CREATE_AT_COLUMN_INTO_MESSAGES_TABLE:Ljava/lang/String;

.field private ADD_FULL_PRIVACY_ENABLED_COLUMN_INTO_CONVERSATIONS_TABLE:Ljava/lang/String;

.field private ADD_HAS_OLDER_MESSAGES_COLUMN_INTO_INBOX_TABLE:Ljava/lang/String;

.field private ADD_IS_REDACTED_COLUMN_INTO_CONVERSATIONS_TABLE:Ljava/lang/String;

.field private ADD_IS_REDACTED_COLUMN_INTO_MESSAGES_TABLE:Ljava/lang/String;

.field private ADD_LAST_CONVERSATIONS_REDACTED_TIME_COLUMN_INTO_INBOX_TABLE:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "ALTER TABLE conversation_inbox ADD COLUMN has_older_messages INT ;"

    .line 18
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->ADD_HAS_OLDER_MESSAGES_COLUMN_INTO_INBOX_TABLE:Ljava/lang/String;

    const-string v0, "ALTER TABLE conversation_inbox ADD COLUMN last_conv_redaction_time INT ;"

    .line 21
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->ADD_LAST_CONVERSATIONS_REDACTED_TIME_COLUMN_INTO_INBOX_TABLE:Ljava/lang/String;

    const-string v0, "ALTER TABLE issues ADD COLUMN full_privacy_enabled INTEGER ;"

    .line 25
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->ADD_FULL_PRIVACY_ENABLED_COLUMN_INTO_CONVERSATIONS_TABLE:Ljava/lang/String;

    const-string v0, "ALTER TABLE issues ADD COLUMN is_redacted INTEGER ;"

    .line 28
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->ADD_IS_REDACTED_COLUMN_INTO_CONVERSATIONS_TABLE:Ljava/lang/String;

    const-string v0, "ALTER TABLE issues ADD COLUMN epoch_time_created_at INTEGER NOT NULL DEFAULT 0 ;"

    .line 31
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->ADD_EPOCH_TIME_CREATE_AT_COLUMN_INTO_CONVERSATIONS_TABLE:Ljava/lang/String;

    const-string v0, "ALTER TABLE messages ADD COLUMN is_redacted INTEGER ;"

    .line 36
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->ADD_IS_REDACTED_COLUMN_INTO_MESSAGES_TABLE:Ljava/lang/String;

    const-string v0, "ALTER TABLE messages ADD COLUMN epoch_time_created_at INTEGER NOT NULL DEFAULT 0 ;"

    .line 39
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->ADD_EPOCH_TIME_CREATE_AT_COLUMN_INTO_MESSAGES_TABLE:Ljava/lang/String;

    return-void
.end method

.method private migrateData(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 13

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "_id"

    const-string v2, "created_at"

    .line 62
    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v11

    const-string v4, "issues"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v3, p1

    move-object v5, v11

    .line 65
    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 67
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 69
    :cond_0
    invoke-interface {v3, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .line 70
    invoke-interface {v3, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v3, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 71
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v0, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-nez v4, :cond_0

    .line 74
    :cond_1
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 77
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const-string v4, "messages"

    move-object v3, p1

    move-object v5, v11

    .line 78
    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 80
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 82
    :cond_2
    invoke-interface {v3, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .line 83
    invoke-interface {v3, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v3, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 84
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v12, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 87
    :cond_3
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 90
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 91
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 92
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 93
    invoke-static {v3}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v3

    .line 94
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 97
    :cond_4
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 98
    invoke-interface {v12}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 99
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 100
    invoke-static {v4}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v4

    .line 101
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 105
    :cond_5
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    const-string v5, "_id = ?"

    const-string v6, "epoch_time_created_at"

    if-eqz v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 106
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    .line 107
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    .line 108
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 109
    invoke-virtual {v8, v6, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    new-array v2, v4, [Ljava/lang/String;

    .line 112
    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const-string v3, "issues"

    .line 113
    invoke-virtual {p1, v3, v8, v5, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_2

    .line 119
    :cond_6
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 120
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    .line 121
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 122
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 123
    invoke-virtual {v7, v6, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    new-array v1, v4, [Ljava/lang/String;

    .line 126
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    const-string v2, "messages"

    .line 127
    invoke-virtual {p1, v2, v7, v5, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_3

    :cond_7
    return-void
.end method

.method private migrateTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->ADD_HAS_OLDER_MESSAGES_COLUMN_INTO_INBOX_TABLE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 52
    iget-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->ADD_LAST_CONVERSATIONS_REDACTED_TIME_COLUMN_INTO_INBOX_TABLE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 53
    iget-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->ADD_FULL_PRIVACY_ENABLED_COLUMN_INTO_CONVERSATIONS_TABLE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 54
    iget-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->ADD_IS_REDACTED_COLUMN_INTO_CONVERSATIONS_TABLE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 55
    iget-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->ADD_EPOCH_TIME_CREATE_AT_COLUMN_INTO_MESSAGES_TABLE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 56
    iget-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->ADD_IS_REDACTED_COLUMN_INTO_MESSAGES_TABLE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 57
    iget-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->ADD_EPOCH_TIME_CREATE_AT_COLUMN_INTO_CONVERSATIONS_TABLE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public migrate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1}, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->migrateTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 47
    invoke-direct {p0, p1}, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_6_to_7;->migrateData(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method
