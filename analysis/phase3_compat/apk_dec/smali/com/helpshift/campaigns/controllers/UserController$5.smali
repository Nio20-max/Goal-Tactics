.class Lcom/helpshift/campaigns/controllers/UserController$5;
.super Ljava/lang/Object;
.source "UserController.java"

# interfaces
.implements Lcom/helpshift/network/response/Response$Listener;


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

    .line 360
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/UserController$5;->this$0:Lcom/helpshift/campaigns/controllers/UserController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController$5;->val$userController:Lcom/helpshift/campaigns/controllers/UserController;

    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/UserController$5;->val$unSyncedList:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Ljava/lang/Object;Ljava/lang/Integer;)V
    .locals 2

    .line 363
    iget-object p1, p0, Lcom/helpshift/campaigns/controllers/UserController$5;->this$0:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController$5;->val$userController:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController$5;->val$unSyncedList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, v1}, Lcom/helpshift/campaigns/controllers/UserController;->handlePropertySyncSuccess(Lcom/helpshift/campaigns/controllers/UserController;Ljava/util/ArrayList;Z)V

    return-void
.end method
