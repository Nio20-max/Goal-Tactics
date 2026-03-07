.class public Lcom/helpshift/All;
.super Ljava/lang/Object;
.source "All.java"

# interfaces
.implements Lcom/helpshift/Core$ApiProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/All$LazyHolder;
    }
.end annotation


# instance fields
.field private campaigns:Lcom/helpshift/campaigns/Campaigns;

.field private support:Lcom/helpshift/support/Support;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    invoke-static {}, Lcom/helpshift/campaigns/Campaigns;->getInstance()Lcom/helpshift/campaigns/Campaigns;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/All;->campaigns:Lcom/helpshift/campaigns/Campaigns;

    .line 27
    invoke-static {}, Lcom/helpshift/support/Support;->getInstance()Lcom/helpshift/support/Support;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/All;->support:Lcom/helpshift/support/Support;

    return-void
.end method

.method private buildHelpshiftUserForCampaignLogin(Lcom/helpshift/HelpshiftUser;)Lcom/helpshift/HelpshiftUser;
    .locals 3

    .line 157
    invoke-virtual {p1}, Lcom/helpshift/HelpshiftUser;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 158
    invoke-virtual {p1}, Lcom/helpshift/HelpshiftUser;->getEmail()Ljava/lang/String;

    move-result-object v0

    .line 159
    new-instance v1, Lcom/helpshift/HelpshiftUser$Builder;

    invoke-virtual {p1}, Lcom/helpshift/HelpshiftUser;->getEmail()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/helpshift/HelpshiftUser$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    invoke-virtual {p1}, Lcom/helpshift/HelpshiftUser;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/helpshift/HelpshiftUser$Builder;->setName(Ljava/lang/String;)Lcom/helpshift/HelpshiftUser$Builder;

    move-result-object v0

    .line 161
    invoke-virtual {p1}, Lcom/helpshift/HelpshiftUser;->getAuthToken()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/helpshift/HelpshiftUser$Builder;->setAuthToken(Ljava/lang/String;)Lcom/helpshift/HelpshiftUser$Builder;

    move-result-object p1

    .line 162
    invoke-virtual {p1}, Lcom/helpshift/HelpshiftUser$Builder;->build()Lcom/helpshift/HelpshiftUser;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method public static getInstance()Lcom/helpshift/All;
    .locals 1

    .line 31
    sget-object v0, Lcom/helpshift/All$LazyHolder;->INSTANCE:Lcom/helpshift/All;

    return-object v0
.end method

.method private makeLoginConsistent()V
    .locals 6

    .line 131
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    .line 132
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/controllers/ControllerFactory;->deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    iget-object v1, v1, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/models/DeviceModel;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    .line 133
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 134
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v2

    invoke-interface {v2}, Lcom/helpshift/CoreApi;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object v2

    invoke-virtual {v2}, Lcom/helpshift/account/domainmodel/UserManagerDM;->getActiveUser()Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object v2

    .line 135
    invoke-virtual {v2}, Lcom/helpshift/account/domainmodel/UserDM;->isAnonymousUser()Z

    move-result v3

    if-nez v3, :cond_1

    .line 137
    new-instance v3, Lcom/helpshift/HelpshiftUser$Builder;

    invoke-virtual {v2}, Lcom/helpshift/account/domainmodel/UserDM;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Lcom/helpshift/account/domainmodel/UserDM;->getEmail()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/helpshift/HelpshiftUser$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    invoke-virtual {v2}, Lcom/helpshift/account/domainmodel/UserDM;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/helpshift/HelpshiftUser$Builder;->setName(Ljava/lang/String;)Lcom/helpshift/HelpshiftUser$Builder;

    move-result-object v2

    .line 139
    invoke-virtual {v2}, Lcom/helpshift/HelpshiftUser$Builder;->build()Lcom/helpshift/HelpshiftUser;

    move-result-object v2

    .line 141
    invoke-direct {p0, v2}, Lcom/helpshift/All;->buildHelpshiftUserForCampaignLogin(Lcom/helpshift/HelpshiftUser;)Lcom/helpshift/HelpshiftUser;

    move-result-object v2

    if-nez v1, :cond_0

    .line 142
    invoke-virtual {v2}, Lcom/helpshift/HelpshiftUser;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 143
    :cond_0
    iget-object v0, p0, Lcom/helpshift/All;->campaigns:Lcom/helpshift/campaigns/Campaigns;

    invoke-virtual {v0, v2}, Lcom/helpshift/campaigns/Campaigns;->_login(Lcom/helpshift/HelpshiftUser;)Z

    goto :goto_0

    :cond_1
    if-nez v1, :cond_2

    .line 147
    iget-object v0, p0, Lcom/helpshift/All;->campaigns:Lcom/helpshift/campaigns/Campaigns;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/Campaigns;->_logout()Z

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public _clearAnonymousUser()Z
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/helpshift/All;->support:Lcom/helpshift/support/Support;

    invoke-virtual {v0}, Lcom/helpshift/support/Support;->_clearAnonymousUser()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/helpshift/All;->campaigns:Lcom/helpshift/campaigns/Campaigns;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/Campaigns;->_clearAnonymousUser()Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public _getActionExecutor()Lcom/helpshift/executors/ActionExecutor;
    .locals 1

    .line 115
    new-instance v0, Lcom/helpshift/executors/SupportCampaignsActionExecutor;

    invoke-direct {v0}, Lcom/helpshift/executors/SupportCampaignsActionExecutor;-><init>()V

    return-object v0
.end method

.method public _handlePush(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 76
    invoke-static {p2}, Lcom/helpshift/campaigns/util/CampaignsNotification;->getCampaignsId(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/helpshift/All;->campaigns:Lcom/helpshift/campaigns/Campaigns;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/campaigns/Campaigns;->_handlePush(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_0

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/helpshift/All;->support:Lcom/helpshift/support/Support;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/support/Support;->_handlePush(Landroid/content/Context;Landroid/content/Intent;)V

    :goto_0
    return-void
.end method

.method public _install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 46
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/helpshift/All;->_install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public _install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/helpshift/All;->campaigns:Lcom/helpshift/campaigns/Campaigns;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/helpshift/campaigns/Campaigns;->_install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 56
    iget-object v1, p0, Lcom/helpshift/All;->support:Lcom/helpshift/support/Support;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/helpshift/support/Support;->_install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 57
    invoke-direct {p0}, Lcom/helpshift/All;->makeLoginConsistent()V

    .line 58
    new-instance p2, Lcom/helpshift/notifications/NotificationChannelsManager;

    invoke-direct {p2, p1}, Lcom/helpshift/notifications/NotificationChannelsManager;-><init>(Landroid/content/Context;)V

    .line 59
    invoke-virtual {p2}, Lcom/helpshift/notifications/NotificationChannelsManager;->checkAndUpdateDefaultChannelInfo()V

    return-void
.end method

.method public _login(Lcom/helpshift/HelpshiftUser;)Z
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/helpshift/All;->support:Lcom/helpshift/support/Support;

    invoke-virtual {v0, p1}, Lcom/helpshift/support/Support;->_login(Lcom/helpshift/HelpshiftUser;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    invoke-direct {p0, p1}, Lcom/helpshift/All;->buildHelpshiftUserForCampaignLogin(Lcom/helpshift/HelpshiftUser;)Lcom/helpshift/HelpshiftUser;

    move-result-object p1

    .line 90
    iget-object v0, p0, Lcom/helpshift/All;->campaigns:Lcom/helpshift/campaigns/Campaigns;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/Campaigns;->_login(Lcom/helpshift/HelpshiftUser;)Z

    move-result v0

    :cond_0
    return v0
.end method

.method public _logout()Z
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/helpshift/All;->support:Lcom/helpshift/support/Support;

    invoke-virtual {v0}, Lcom/helpshift/support/Support;->_logout()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/helpshift/All;->campaigns:Lcom/helpshift/campaigns/Campaigns;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/Campaigns;->_logout()Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public _preInstall(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 37
    iget-object v0, p0, Lcom/helpshift/All;->campaigns:Lcom/helpshift/campaigns/Campaigns;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/helpshift/campaigns/Campaigns;->_preInstall(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 38
    iget-object v1, p0, Lcom/helpshift/All;->support:Lcom/helpshift/support/Support;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/helpshift/support/Support;->_preInstall(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public _registerDeviceToken(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/helpshift/All;->campaigns:Lcom/helpshift/campaigns/Campaigns;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/campaigns/Campaigns;->_registerDeviceToken(Landroid/content/Context;Ljava/lang/String;)V

    .line 71
    iget-object v0, p0, Lcom/helpshift/All;->support:Lcom/helpshift/support/Support;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/support/Support;->_registerDeviceToken(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public _setNameAndEmail(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/helpshift/All;->campaigns:Lcom/helpshift/campaigns/Campaigns;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/campaigns/Campaigns;->_setNameAndEmail(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    iget-object v0, p0, Lcom/helpshift/All;->support:Lcom/helpshift/support/Support;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/support/Support;->_setNameAndEmail(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public _setSDKLanguage(Ljava/lang/String;)V
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/helpshift/All;->campaigns:Lcom/helpshift/campaigns/Campaigns;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/Campaigns;->_setSDKLanguage(Ljava/lang/String;)V

    .line 121
    iget-object v0, p0, Lcom/helpshift/All;->support:Lcom/helpshift/support/Support;

    invoke-virtual {v0, p1}, Lcom/helpshift/support/Support;->_setSDKLanguage(Ljava/lang/String;)V

    return-void
.end method

.method public _setTheme(I)V
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/helpshift/All;->campaigns:Lcom/helpshift/campaigns/Campaigns;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/Campaigns;->_setTheme(I)V

    .line 127
    iget-object v0, p0, Lcom/helpshift/All;->support:Lcom/helpshift/support/Support;

    invoke-virtual {v0, p1}, Lcom/helpshift/support/Support;->_setTheme(I)V

    return-void
.end method
