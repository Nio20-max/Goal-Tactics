.class public Lcom/helpshift/campaigns/providers/CampaignsModuleAPIs;
.super Ljava/lang/Object;
.source "CampaignsModuleAPIs.java"

# interfaces
.implements Lcom/helpshift/providers/ICampaignsModuleAPIs;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDeviceIdentifier()Ljava/lang/String;
    .locals 1

    .line 18
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/DeviceModel;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUserIdentifier()Ljava/lang/String;
    .locals 1

    .line 13
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public logout()V
    .locals 1

    .line 23
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/UserController;->logout()Z

    return-void
.end method
