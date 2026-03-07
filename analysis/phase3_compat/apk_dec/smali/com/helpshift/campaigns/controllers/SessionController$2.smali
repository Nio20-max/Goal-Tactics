.class Lcom/helpshift/campaigns/controllers/SessionController$2;
.super Ljava/lang/Object;
.source "SessionController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/SessionController;->endSession()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/SessionController;

.field final synthetic val$controller:Lcom/helpshift/campaigns/controllers/SessionController;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/SessionController;Lcom/helpshift/campaigns/controllers/SessionController;)V
    .locals 0

    .line 101
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/SessionController$2;->this$0:Lcom/helpshift/campaigns/controllers/SessionController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/SessionController$2;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 104
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController$2;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/SessionController;->currentSession:Lcom/helpshift/campaigns/models/SessionModel;

    if-eqz v0, :cond_0

    .line 105
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController$2;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/SessionController;->currentSession:Lcom/helpshift/campaigns/models/SessionModel;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/SessionModel;->endNow()V

    .line 106
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController$2;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/SessionController;->updateSession()V

    .line 107
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController$2;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/helpshift/campaigns/controllers/SessionController;->currentSession:Lcom/helpshift/campaigns/models/SessionModel;

    .line 108
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController$2;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/SessionController;->syncController:Lcom/helpshift/controllers/SyncController;

    const/4 v1, 0x1

    const-string v2, "data_type_session"

    invoke-virtual {v0, v2, v1}, Lcom/helpshift/controllers/SyncController;->incrementDataChangeCount(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method
