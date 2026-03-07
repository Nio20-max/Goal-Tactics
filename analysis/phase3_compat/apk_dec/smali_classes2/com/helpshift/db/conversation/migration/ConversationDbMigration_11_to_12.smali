.class public Lcom/helpshift/db/conversation/migration/ConversationDbMigration_11_to_12;
.super Ljava/lang/Object;
.source "ConversationDbMigration_11_to_12.java"

# interfaces
.implements Lcom/helpshift/db/base/IMigrator;


# instance fields
.field private final ADD_CAN_START_NEW_CONVERSATION_COLUMN:Ljava/lang/String;

.field private final ADD_FEEDBACK_BOT_ENABLED_COLUMN:Ljava/lang/String;

.field private final TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Helpshft_dbMgrte11_12"

    .line 11
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_11_to_12;->TAG:Ljava/lang/String;

    const-string v0, "ALTER TABLE issues ADD COLUMN feedback_bots_enabled INTEGER ;"

    .line 13
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_11_to_12;->ADD_FEEDBACK_BOT_ENABLED_COLUMN:Ljava/lang/String;

    const-string v0, "ALTER TABLE issues ADD COLUMN can_start_new_conversation INTEGER ;"

    .line 17
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_11_to_12;->ADD_CAN_START_NEW_CONVERSATION_COLUMN:Ljava/lang/String;

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

    const-string v0, "ALTER TABLE issues ADD COLUMN feedback_bots_enabled INTEGER ;"

    .line 23
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "ALTER TABLE issues ADD COLUMN can_start_new_conversation INTEGER ;"

    .line 24
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method
