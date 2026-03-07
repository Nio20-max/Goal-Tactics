.class public Lcom/helpshift/db/conversation/migration/ConversationDbMigration_10_to_11;
.super Ljava/lang/Object;
.source "ConversationDbMigration_10_to_11.java"

# interfaces
.implements Lcom/helpshift/db/base/IMigrator;


# instance fields
.field private final TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Helpshft_dbMgrte10_11"

    .line 12
    iput-object v0, p0, Lcom/helpshift/db/conversation/migration/ConversationDbMigration_10_to_11;->TAG:Ljava/lang/String;

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

    const-string v0, "CREATE TABLE IF NOT EXISTS action_cards ( _id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,image_url TEXT,file_path TEXT,is_image_secure INTEGER,message_id TEXT NOT NULL,FOREIGN KEY(message_id) REFERENCES messages (server_id));"

    .line 17
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE IF NOT EXISTS actions ( _id INTEGER PRIMARY KEY AUTOINCREMENT,action_sha TEXT NOT NULL,action_title TEXT NOT NULL,action_type TEXT NOT NULL,action_data TEXT NOT NULL,action_card_id INTEGER NOT NULL,FOREIGN KEY(action_card_id) REFERENCES action_cards (_id));"

    .line 18
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method
