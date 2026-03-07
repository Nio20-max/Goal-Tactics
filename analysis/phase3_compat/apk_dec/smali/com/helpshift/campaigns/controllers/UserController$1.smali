.class Lcom/helpshift/campaigns/controllers/UserController$1;
.super Ljava/lang/Object;
.source "UserController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/UserController;->logout()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/UserController;

.field final synthetic val$controller:Lcom/helpshift/campaigns/controllers/UserController;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/campaigns/controllers/UserController;)V
    .locals 0

    .line 145
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/UserController$1;->this$0:Lcom/helpshift/campaigns/controllers/UserController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController$1;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 151
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController$1;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/UserController;->currentUser:Lcom/helpshift/campaigns/models/UserModel;

    iget-object v0, v0, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    .line 152
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$1;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object v2, p0, Lcom/helpshift/campaigns/controllers/UserController$1;->this$0:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object v2, v2, Lcom/helpshift/campaigns/controllers/UserController;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {v2}, Lcom/helpshift/model/SdkInfoModel;->getDeviceId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/helpshift/campaigns/controllers/UserController;->switchToUser(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
