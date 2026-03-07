.class Lcom/helpshift/campaigns/controllers/UserController$7;
.super Ljava/lang/Object;
.source "UserController.java"

# interfaces
.implements Lcom/helpshift/network/response/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/UserController;->getRequestWithFullData()Lcom/helpshift/network/request/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/helpshift/network/response/Response$Listener<",
        "Lorg/json/JSONArray;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/UserController;

.field final synthetic val$batchPropertyKeys:Ljava/util/ArrayList;

.field final synthetic val$userController:Lcom/helpshift/campaigns/controllers/UserController;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/campaigns/controllers/UserController;Ljava/util/ArrayList;)V
    .locals 0

    .line 388
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/UserController$7;->this$0:Lcom/helpshift/campaigns/controllers/UserController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController$7;->val$userController:Lcom/helpshift/campaigns/controllers/UserController;

    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/UserController$7;->val$batchPropertyKeys:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;Ljava/lang/Integer;)V
    .locals 0

    .line 388
    check-cast p1, Lorg/json/JSONArray;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/campaigns/controllers/UserController$7;->onResponse(Lorg/json/JSONArray;Ljava/lang/Integer;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONArray;Ljava/lang/Integer;)V
    .locals 2

    .line 391
    iget-object p1, p0, Lcom/helpshift/campaigns/controllers/UserController$7;->this$0:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController$7;->val$userController:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController$7;->val$batchPropertyKeys:Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-virtual {p1, p2, v0, v1}, Lcom/helpshift/campaigns/controllers/UserController;->handlePropertySyncSuccess(Lcom/helpshift/campaigns/controllers/UserController;Ljava/util/ArrayList;Z)V

    return-void
.end method
