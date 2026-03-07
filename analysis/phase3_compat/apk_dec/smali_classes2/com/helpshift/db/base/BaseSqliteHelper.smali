.class public abstract Lcom/helpshift/db/base/BaseSqliteHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "BaseSqliteHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/db/base/BaseSqliteHelper$IDbMigrationListener;,
        Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;
    }
.end annotation


# instance fields
.field private contract:Lcom/helpshift/db/base/DatabaseContract;

.field private listener:Lcom/helpshift/db/base/BaseSqliteHelper$IDbMigrationListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/helpshift/db/base/DatabaseContract;)V
    .locals 3

    .line 29
    invoke-interface {p2}, Lcom/helpshift/db/base/DatabaseContract;->getDatabaseName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2}, Lcom/helpshift/db/base/DatabaseContract;->getDatabaseVersion()I

    move-result v1

    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v2, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 30
    iput-object p2, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    return-void
.end method

.method private createAllTables(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    .line 144
    iget-object v0, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

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

    .line 145
    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private dropAllTables(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4

    .line 138
    iget-object v0, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

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

    .line 139
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

.method private dropAndCreateAllTablesOnMigrate(Landroid/database/sqlite/SQLiteDatabase;)Z
    .locals 3

    .line 92
    :try_start_0
    invoke-direct {p0, p1}, Lcom/helpshift/db/base/BaseSqliteHelper;->dropAllTables(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 93
    invoke-direct {p0, p1}, Lcom/helpshift/db/base/BaseSqliteHelper;->createAllTables(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    move-exception p1

    .line 96
    iget-object v0, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    invoke-interface {v0}, Lcom/helpshift/db/base/DatabaseContract;->getTag()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception while recreating tables on DB upgrade/downgrade: version: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    .line 97
    invoke-interface {v2}, Lcom/helpshift/db/base/DatabaseContract;->getDatabaseVersion()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    .line 96
    invoke-static {v0, v1, p1, v2}, Lcom/helpshift/util/HSLogger;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    .line 99
    throw p1
.end method

.method private migrate(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;I)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/util/List<",
            "Lcom/helpshift/db/base/IMigrator;",
            ">;I)Z"
        }
    .end annotation

    const/4 v0, 0x0

    .line 161
    :try_start_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/db/base/IMigrator;

    .line 162
    invoke-interface {v1, p1}, Lcom/helpshift/db/base/IMigrator;->migrate(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    goto :goto_1

    :catch_0
    move-exception p2

    .line 167
    iget-object v1, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    invoke-interface {v1}, Lcom/helpshift/db/base/DatabaseContract;->getTag()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception while migrating "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    .line 168
    invoke-interface {v3}, Lcom/helpshift/db/base/DatabaseContract;->getDatabaseName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " old: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ", new: "

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    .line 169
    invoke-interface {p3}, Lcom/helpshift/db/base/DatabaseContract;->getDatabaseVersion()I

    move-result p3

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    new-array v2, v0, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    .line 167
    invoke-static {v1, p3, p2, v2}, Lcom/helpshift/util/HSLogger;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    :goto_1
    if-nez v0, :cond_1

    .line 173
    invoke-direct {p0, p1}, Lcom/helpshift/db/base/BaseSqliteHelper;->dropAndCreateAllTablesOnMigrate(Landroid/database/sqlite/SQLiteDatabase;)Z

    :cond_1
    return v0
.end method


# virtual methods
.method public dropAndCreateAllTables(Landroid/database/sqlite/SQLiteDatabase;)Z
    .locals 6

    const-string v0, "Error in recreating inside finally block, "

    .line 111
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x0

    .line 113
    :try_start_0
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 114
    invoke-direct {p0, p1}, Lcom/helpshift/db/base/BaseSqliteHelper;->dropAllTables(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 115
    invoke-direct {p0, p1}, Lcom/helpshift/db/base/BaseSqliteHelper;->createAllTables(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 116
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    :try_start_1
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 126
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    :catch_0
    move-exception p1

    .line 130
    iget-object v2, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    invoke-interface {v2}, Lcom/helpshift/db/base/DatabaseContract;->getTag()Ljava/lang/String;

    move-result-object v2

    new-array v1, v1, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    invoke-static {v2, v0, p1, v1}, Lcom/helpshift/util/HSLogger;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    goto :goto_3

    :catchall_0
    move-exception v2

    goto :goto_1

    :catch_1
    move-exception v2

    .line 119
    :try_start_2
    iget-object v3, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    invoke-interface {v3}, Lcom/helpshift/db/base/DatabaseContract;->getTag()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception while recreating tables: version: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    .line 120
    invoke-interface {v5}, Lcom/helpshift/db/base/DatabaseContract;->getDatabaseVersion()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v5, v1, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    .line 119
    invoke-static {v3, v4, v2, v5}, Lcom/helpshift/util/HSLogger;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 125
    :try_start_3
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 126
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    :catch_2
    move-exception p1

    .line 130
    iget-object v2, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    invoke-interface {v2}, Lcom/helpshift/db/base/DatabaseContract;->getTag()Ljava/lang/String;

    move-result-object v2

    new-array v3, v1, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    invoke-static {v2, v0, p1, v3}, Lcom/helpshift/util/HSLogger;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    :cond_0
    :goto_0
    return v1

    .line 125
    :goto_1
    :try_start_4
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 126
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_2

    :catch_3
    move-exception p1

    .line 130
    iget-object v3, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    invoke-interface {v3}, Lcom/helpshift/db/base/DatabaseContract;->getTag()Ljava/lang/String;

    move-result-object v3

    new-array v1, v1, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    invoke-static {v3, v0, p1, v1}, Lcom/helpshift/util/HSLogger;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    .line 132
    :cond_1
    :goto_2
    throw v2

    :cond_2
    :goto_3
    const/4 p1, 0x1

    return p1
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4

    const-string v0, "Error in onCreate inside finally block, "

    const/4 v1, 0x0

    .line 45
    :try_start_0
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 46
    invoke-direct {p0, p1}, Lcom/helpshift/db/base/BaseSqliteHelper;->createAllTables(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 47
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    :try_start_1
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 52
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 56
    iget-object v2, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    invoke-interface {v2}, Lcom/helpshift/db/base/DatabaseContract;->getTag()Ljava/lang/String;

    move-result-object v2

    new-array v1, v1, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    invoke-static {v2, v0, p1, v1}, Lcom/helpshift/util/HSLogger;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    :cond_0
    :goto_0
    return-void

    :catchall_0
    move-exception v2

    .line 51
    :try_start_2
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 52
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    .line 56
    iget-object v3, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    invoke-interface {v3}, Lcom/helpshift/db/base/DatabaseContract;->getTag()Ljava/lang/String;

    move-result-object v3

    new-array v1, v1, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    invoke-static {v3, v0, p1, v1}, Lcom/helpshift/util/HSLogger;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    .line 58
    :cond_1
    :goto_1
    throw v2
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    .line 79
    invoke-direct {p0, p1}, Lcom/helpshift/db/base/BaseSqliteHelper;->dropAndCreateAllTablesOnMigrate(Landroid/database/sqlite/SQLiteDatabase;)Z

    move-result p1

    .line 80
    iget-object p2, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->listener:Lcom/helpshift/db/base/BaseSqliteHelper$IDbMigrationListener;

    if-eqz p2, :cond_1

    if-eqz p1, :cond_0

    .line 82
    sget-object p1, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;->DOWNGRADE:Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

    iget-object p3, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    invoke-interface {p3}, Lcom/helpshift/db/base/DatabaseContract;->getDatabaseName()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p2, p1, p3}, Lcom/helpshift/db/base/BaseSqliteHelper$IDbMigrationListener;->onDbMigrationSuccess(Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;Ljava/lang/String;)V

    goto :goto_0

    .line 85
    :cond_0
    sget-object p1, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;->DOWNGRADE:Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

    iget-object p3, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    invoke-interface {p3}, Lcom/helpshift/db/base/DatabaseContract;->getDatabaseName()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p2, p1, p3}, Lcom/helpshift/db/base/BaseSqliteHelper$IDbMigrationListener;->onDbMigrationFailed(Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 1

    .line 63
    iget-object p3, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    invoke-interface {p3, p2}, Lcom/helpshift/db/base/DatabaseContract;->getMigratorsForUpgrade(I)Ljava/util/List;

    move-result-object p3

    .line 64
    invoke-static {p3}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 65
    invoke-direct {p0, p1, p3, p2}, Lcom/helpshift/db/base/BaseSqliteHelper;->migrate(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;I)Z

    move-result p1

    .line 66
    iget-object p2, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->listener:Lcom/helpshift/db/base/BaseSqliteHelper$IDbMigrationListener;

    if-eqz p2, :cond_1

    if-eqz p1, :cond_0

    .line 68
    sget-object p1, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;->UPGRADE:Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

    iget-object p3, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    invoke-interface {p3}, Lcom/helpshift/db/base/DatabaseContract;->getDatabaseName()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p2, p1, p3}, Lcom/helpshift/db/base/BaseSqliteHelper$IDbMigrationListener;->onDbMigrationSuccess(Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;Ljava/lang/String;)V

    goto :goto_0

    .line 71
    :cond_0
    sget-object p1, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;->UPGRADE:Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

    iget-object p3, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->contract:Lcom/helpshift/db/base/DatabaseContract;

    invoke-interface {p3}, Lcom/helpshift/db/base/DatabaseContract;->getDatabaseName()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p2, p1, p3}, Lcom/helpshift/db/base/BaseSqliteHelper$IDbMigrationListener;->onDbMigrationFailed(Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setListener(Lcom/helpshift/db/base/BaseSqliteHelper$IDbMigrationListener;)V
    .locals 0

    .line 39
    iput-object p1, p0, Lcom/helpshift/db/base/BaseSqliteHelper;->listener:Lcom/helpshift/db/base/BaseSqliteHelper$IDbMigrationListener;

    return-void
.end method
