.class Lcom/helpshift/campaigns/controllers/SessionController$1;
.super Ljava/lang/Object;
.source "SessionController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/SessionController;->startSession()V
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

    .line 84
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/SessionController$1;->this$0:Lcom/helpshift/campaigns/controllers/SessionController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/SessionController$1;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 87
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController$1;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    new-instance v1, Lcom/helpshift/campaigns/models/SessionModel;

    invoke-direct {v1}, Lcom/helpshift/campaigns/models/SessionModel;-><init>()V

    iput-object v1, v0, Lcom/helpshift/campaigns/controllers/SessionController;->currentSession:Lcom/helpshift/campaigns/models/SessionModel;

    .line 88
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController$1;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/SessionController;->storeSession()V

    return-void
.end method
