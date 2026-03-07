.class public Lcom/helpshift/db/user/migration/UserDbMigration_1_to_2;
.super Ljava/lang/Object;
.source "UserDbMigration_1_to_2.java"

# interfaces
.implements Lcom/helpshift/db/base/IMigrator;


# instance fields
.field private contract:Lcom/helpshift/db/user/UserDatabaseContract;


# direct methods
.method public constructor <init>(Lcom/helpshift/db/user/UserDatabaseContract;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/helpshift/db/user/migration/UserDbMigration_1_to_2;->contract:Lcom/helpshift/db/user/UserDatabaseContract;

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

    .line 17
    iget-object v0, p0, Lcom/helpshift/db/user/migration/UserDbMigration_1_to_2;->contract:Lcom/helpshift/db/user/UserDatabaseContract;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "CREATE TABLE redaction_info_table ( user_local_id INTEGER PRIMARY KEY, redaction_state INTEGER , redaction_type INTEGER );"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method
