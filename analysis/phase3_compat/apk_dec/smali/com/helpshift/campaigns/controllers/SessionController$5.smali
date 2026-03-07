.class Lcom/helpshift/campaigns/controllers/SessionController$5;
.super Ljava/lang/Object;
.source "SessionController.java"

# interfaces
.implements Lcom/helpshift/network/response/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/SessionController;->getRequest()Lcom/helpshift/network/request/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/SessionController;

.field final synthetic val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

.field final synthetic val$sessions:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/SessionController;Lcom/helpshift/campaigns/controllers/SessionController;[Ljava/lang/String;)V
    .locals 0

    .line 229
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/SessionController$5;->this$0:Lcom/helpshift/campaigns/controllers/SessionController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/SessionController$5;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/SessionController$5;->val$sessions:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/helpshift/network/errors/NetworkError;Ljava/lang/Integer;)V
    .locals 2

    .line 232
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/SessionController$5;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    iget-object p2, p2, Lcom/helpshift/campaigns/controllers/SessionController;->storage:Lcom/helpshift/campaigns/storage/SessionStorage;

    sget-object v0, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/SessionController$5;->val$sessions:[Ljava/lang/String;

    invoke-interface {p2, v0, v1}, Lcom/helpshift/campaigns/storage/SessionStorage;->setSyncStatus(Ljava/lang/Integer;[Ljava/lang/String;)V

    .line 233
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/SessionController$5;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    iget-object p2, p2, Lcom/helpshift/campaigns/controllers/SessionController;->syncController:Lcom/helpshift/controllers/SyncController;

    const-string v0, "data_type_session"

    invoke-virtual {p2, v0, p1}, Lcom/helpshift/controllers/SyncController;->dataSyncFailed(Ljava/lang/String;Lcom/helpshift/network/errors/NetworkError;)V

    return-void
.end method
