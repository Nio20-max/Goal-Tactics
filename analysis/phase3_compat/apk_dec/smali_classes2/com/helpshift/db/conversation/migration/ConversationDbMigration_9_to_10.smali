.class public Lcom/helpshift/db/conversation/migration/ConversationDbMigration_9_to_10;
.super Ljava/lang/Object;
.source "ConversationDbMigration_9_to_10.java"

# interfaces
.implements Lcom/helpshift/db/base/IMigrator;


# instance fields
.field private ADD_AUTHOR_ID_COLUMN_TO_MESSAGE_TABLE:Ljava/lang/String;

.field private ADD_AUTHOR_ROLE_COLUMN_TO_MESSAGE_TABLE:Ljava/lang/String;

.field private ADD_AVATAR_IMAGE_PATH_COLUMN_TO_MESSAGE_TABLE:Ljava/lang/String;

.field private ADD_CSAT_EXPIRY_AT_COLUMN_TO_CONVERSATION_TABLE:Ljava/lang/String;

.field private ADD_RESOLUTION_EXPIRY_AT_COLUMN_TO_CONVERSATION_TABLE:Ljava/lang/String;

.field private final TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Helpshft_dbMigrate9_10"

    .line 11
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_9_to_10;->TAG:Ljava/lang/String;

    const-string v0, "ALTER TABLE messages ADD COLUMN author_id TEXT; "

    .line 13
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_9_to_10;->ADD_AUTHOR_ID_COLUMN_TO_MESSAGE_TABLE:Ljava/lang/String;

    const-string v0, "ALTER TABLE messages ADD COLUMN author_role TEXT; "

    .line 16
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_9_to_10;->ADD_AUTHOR_ROLE_COLUMN_TO_MESSAGE_TABLE:Ljava/lang/String;

    const-string v0, "ALTER TABLE messages ADD COLUMN local_avatar_image_path TEXT; "

    .line 19
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_9_to_10;->ADD_AVATAR_IMAGE_PATH_COLUMN_TO_MESSAGE_TABLE:Ljava/lang/String;

    const-string v0, "ALTER TABLE issues ADD COLUMN resolution_expiry_at INTEGER ;"

    .line 22
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_9_to_10;->ADD_RESOLUTION_EXPIRY_AT_COLUMN_TO_CONVERSATION_TABLE:Ljava/lang/String;

    const-string v0, "ALTER TABLE issues ADD COLUMN csat_expiry_at INTEGER ;"

    .line 26
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_9_to_10;->ADD_CSAT_EXPIRY_AT_COLUMN_TO_CONVERSATION_TABLE:Ljava/lang/String;

    return-void
.end method

.method private migrateTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_9_to_10;->ADD_AUTHOR_ID_COLUMN_TO_MESSAGE_TABLE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 38
    iget-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_9_to_10;->ADD_AUTHOR_ROLE_COLUMN_TO_MESSAGE_TABLE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 39
    iget-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_9_to_10;->ADD_AVATAR_IMAGE_PATH_COLUMN_TO_MESSAGE_TABLE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 40
    iget-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_9_to_10;->ADD_RESOLUTION_EXPIRY_AT_COLUMN_TO_CONVERSATION_TABLE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 41
    iget-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_9_to_10;->ADD_CSAT_EXPIRY_AT_COLUMN_TO_CONVERSATION_TABLE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public migrate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 33
    invoke-direct {p0, p1}, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_9_to_10;->migrateTable(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method
