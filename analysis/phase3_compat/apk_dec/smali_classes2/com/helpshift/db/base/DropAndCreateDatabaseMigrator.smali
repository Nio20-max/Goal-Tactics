.class public Lcom/helpshift/db/base/DropAndCreateDatabaseMigrator;
.super Ljava/lang/Object;
.source "DropAndCreateDatabaseMigrator.java"

# interfaces
.implements Lcom/helpshift/db/base/IMigrator;


# instance fields
.field private contract:Lcom/helpshift/db/base/DatabaseContract;


# direct methods
.method public constructor <init>(Lcom/helpshift/db/base/DatabaseContract;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/helpshift/db/base/DropAndCreateDatabaseMigrator;->contract:Lcom/helpshift/db/base/DatabaseContract;

    return-void
.end method

.method private createAllTables(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    .line 26
    iget-object v0, p0, Lcom/helpshift/db/base/DropAndCreateDatabaseMigrator;->contract:Lcom/helpshift/db/base/DatabaseContract;

    invoke-interface {v0}, Lcom/helpshift/db/base/DatabaseContract;->getCreateTableQueries()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 27
    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private dropAllTables(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4

    .line 20
    iget-object v0, p0, Lcom/helpshift/db/base/DropAndCreateDatabaseMigrator;->contract:Lcom/helpshift/db/base/DatabaseContract;

    invoke-interface {v0}, Lcom/helpshift/db/base/DatabaseContract;->getTableNames()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 21
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DROP TABLE IF EXISTS "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public migrate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/helpshift/db/base/DropAndCreateDatabaseMigrator;->dropAllTables(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 16
    invoke-direct {p0, p1}, Lcom/helpshift/db/base/DropAndCreateDatabaseMigrator;->createAllTables(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method
