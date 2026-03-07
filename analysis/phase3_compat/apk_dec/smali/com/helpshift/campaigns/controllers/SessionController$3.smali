.class Lcom/helpshift/campaigns/controllers/SessionController$3;
.super Ljava/lang/Object;
.source "SessionController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/SessionController;->updateDurations()V
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

    .line 123
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/SessionController$3;->this$0:Lcom/helpshift/campaigns/controllers/SessionController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/SessionController$3;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController$3;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/SessionController;->currentSession:Lcom/helpshift/campaigns/models/SessionModel;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/SessionModel;->updateDurations()V

    .line 127
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController$3;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/SessionController;->updateSession()V

    return-void
.end method
