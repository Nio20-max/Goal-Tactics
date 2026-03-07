.class Lcom/helpshift/campaigns/controllers/SwitchUserController$1;
.super Ljava/lang/Object;
.source "SwitchUserController.java"

# interfaces
.implements Lcom/helpshift/network/response/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/SwitchUserController;->getRequest()Lcom/helpshift/network/request/Request;
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
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/SwitchUserController;

.field final synthetic val$controller:Lcom/helpshift/campaigns/controllers/SwitchUserController;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/SwitchUserController;Lcom/helpshift/campaigns/controllers/SwitchUserController;)V
    .locals 0

    .line 137
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController$1;->this$0:Lcom/helpshift/campaigns/controllers/SwitchUserController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController$1;->val$controller:Lcom/helpshift/campaigns/controllers/SwitchUserController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;Ljava/lang/Integer;)V
    .locals 0

    .line 137
    check-cast p1, Lorg/json/JSONArray;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/campaigns/controllers/SwitchUserController$1;->onResponse(Lorg/json/JSONArray;Ljava/lang/Integer;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONArray;Ljava/lang/Integer;)V
    .locals 1

    .line 140
    iget-object p1, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController$1;->val$controller:Lcom/helpshift/campaigns/controllers/SwitchUserController;

    iget-object p1, p1, Lcom/helpshift/campaigns/controllers/SwitchUserController;->syncController:Lcom/helpshift/controllers/SyncController;

    const-string p2, "data_type_switch_user"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/helpshift/controllers/SyncController;->dataSynced(Ljava/lang/String;Z)V

    .line 141
    iget-object p1, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController$1;->val$controller:Lcom/helpshift/campaigns/controllers/SwitchUserController;

    iget-object p1, p1, Lcom/helpshift/campaigns/controllers/SwitchUserController;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController$1;->this$0:Lcom/helpshift/campaigns/controllers/SwitchUserController;

    iget-object p2, p2, Lcom/helpshift/campaigns/controllers/SwitchUserController;->currentUser:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/helpshift/model/SdkInfoModel;->setUserIdSyncedWithBackend(Ljava/lang/String;)V

    .line 142
    iget-object p1, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController$1;->val$controller:Lcom/helpshift/campaigns/controllers/SwitchUserController;

    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/SwitchUserController$1;->this$0:Lcom/helpshift/campaigns/controllers/SwitchUserController;

    iget-object p2, p2, Lcom/helpshift/campaigns/controllers/SwitchUserController;->currentUser:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/helpshift/campaigns/controllers/SwitchUserController;->doneSwitch(Ljava/lang/String;)V

    return-void
.end method
