.class Lcom/helpshift/campaigns/controllers/UserController$8;
.super Ljava/lang/Object;
.source "UserController.java"

# interfaces
.implements Lcom/helpshift/network/response/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/UserController;->getRequestWithFullData()Lcom/helpshift/network/request/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/UserController;

.field final synthetic val$batchPropertyKeys:Ljava/util/ArrayList;

.field final synthetic val$unSyncedPropertyKeys:Ljava/util/ArrayList;

.field final synthetic val$userController:Lcom/helpshift/campaigns/controllers/UserController;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/UserController;Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/helpshift/campaigns/controllers/UserController;)V
    .locals 0

    .line 395
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/UserController$8;->this$0:Lcom/helpshift/campaigns/controllers/UserController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController$8;->val$batchPropertyKeys:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/UserController$8;->val$unSyncedPropertyKeys:Ljava/util/ArrayList;

    iput-object p4, p0, Lcom/helpshift/campaigns/controllers/UserController$8;->val$userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/helpshift/network/errors/NetworkError;Ljava/lang/Integer;)V
    .locals 2

    .line 400
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController$8;->val$batchPropertyKeys:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController$8;->val$unSyncedPropertyKeys:Ljava/util/ArrayList;

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 401
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController$8;->val$userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {p2}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object p2

    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController$8;->val$batchPropertyKeys:Ljava/util/ArrayList;

    invoke-virtual {p2, v0}, Lcom/helpshift/campaigns/models/UserModel;->checkAndMarkPropertiesAsSynced(Ljava/util/List;)V

    .line 402
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController$8;->this$0:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController$8;->val$userController:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$8;->val$unSyncedPropertyKeys:Ljava/util/ArrayList;

    invoke-virtual {p2, v0, v1, p1}, Lcom/helpshift/campaigns/controllers/UserController;->handlePropertySyncFailure(Lcom/helpshift/campaigns/controllers/UserController;Ljava/util/ArrayList;Lcom/helpshift/network/errors/NetworkError;)V

    return-void
.end method
