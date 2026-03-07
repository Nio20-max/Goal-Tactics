.class Lcom/helpshift/campaigns/controllers/UserController$6;
.super Ljava/lang/Object;
.source "UserController.java"

# interfaces
.implements Lcom/helpshift/network/response/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/UserController;->getRequest()Lcom/helpshift/network/request/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/UserController;

.field final synthetic val$unSyncedList:Ljava/util/ArrayList;

.field final synthetic val$userController:Lcom/helpshift/campaigns/controllers/UserController;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/campaigns/controllers/UserController;Ljava/util/ArrayList;)V
    .locals 0

    .line 367
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/UserController$6;->this$0:Lcom/helpshift/campaigns/controllers/UserController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController$6;->val$userController:Lcom/helpshift/campaigns/controllers/UserController;

    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/UserController$6;->val$unSyncedList:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/helpshift/network/errors/NetworkError;Ljava/lang/Integer;)V
    .locals 2

    .line 370
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController$6;->this$0:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController$6;->val$userController:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$6;->val$unSyncedList:Ljava/util/ArrayList;

    invoke-virtual {p2, v0, v1, p1}, Lcom/helpshift/campaigns/controllers/UserController;->handlePropertySyncFailure(Lcom/helpshift/campaigns/controllers/UserController;Ljava/util/ArrayList;Lcom/helpshift/network/errors/NetworkError;)V

    return-void
.end method
