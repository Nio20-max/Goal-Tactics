.class public Lcom/helpshift/db/conversation/ConversationDBHelper;
.super Lcom/helpshift/db/base/BaseSqliteHelper;
.source "ConversationDBHelper.java"

# interfaces
.implements Lcom/helpshift/db/base/BaseSqliteHelper$IDbMigrationListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/helpshift/db/conversation/ConversationDatabaseContract;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Lcom/helpshift/db/base/BaseSqliteHelper;-><init>(Landroid/content/Context;Lcom/helpshift/db/base/DatabaseContract;)V

    .line 15
    invoke-virtual {p0, p0}, Lcom/helpshift/db/conversation/ConversationDBHelper;->setListener(Lcom/helpshift/db/base/BaseSqliteHelper$IDbMigrationListener;)V

    return-void
.end method


# virtual methods
.method public onDbMigrationFailed(Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;Ljava/lang/String;)V
    .locals 0

    .line 28
    sget-object p2, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;->UPGRADE:Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

    if-ne p1, p2, :cond_0

    .line 29
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/helpshift/CoreApi;->resetUsersSyncStatusAndStartSetupForActiveUser()V

    :cond_0
    return-void
.end method

.method public onDbMigrationSuccess(Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;Ljava/lang/String;)V
    .locals 0

    .line 21
    sget-object p2, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;->DOWNGRADE:Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

    if-ne p1, p2, :cond_0

    .line 22
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/helpshift/CoreApi;->resetUsersSyncStatusAndStartSetupForActiveUser()V

    :cond_0
    return-void
.end method
