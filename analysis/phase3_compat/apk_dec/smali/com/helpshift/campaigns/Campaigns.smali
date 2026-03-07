.class public Lcom/helpshift/campaigns/Campaigns;
.super Ljava/lang/Object;
.source "Campaigns.java"

# interfaces
.implements Lcom/helpshift/Core$ApiProvider;
.implements Lcom/helpshift/campaigns/observers/CampaignStorageObserver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/campaigns/Campaigns$Delegate;,
        Lcom/helpshift/campaigns/Campaigns$LazyHolder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_Campaigns"

.field static delegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addProperties(Ljava/util/Map;)[Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 178
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 181
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 182
    invoke-interface {v0}, Lcom/helpshift/util/concurrent/ApiExecutor;->awaitForSyncExecution()V

    .line 183
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 184
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 185
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Landroid/location/Location;

    if-nez v2, :cond_1

    .line 187
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/Integer;

    if-eqz v2, :cond_2

    .line 188
    new-instance v2, Lcom/helpshift/campaigns/models/PropertyValue;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-long v3, v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/helpshift/campaigns/models/PropertyValue;-><init>(Ljava/lang/Object;)V

    goto :goto_1

    .line 191
    :cond_2
    new-instance v2, Lcom/helpshift/campaigns/models/PropertyValue;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/helpshift/campaigns/models/PropertyValue;-><init>(Ljava/lang/Object;)V

    .line 193
    :goto_1
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 197
    :cond_3
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object p0

    iget-object p0, p0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {p0, v0}, Lcom/helpshift/campaigns/controllers/UserController;->addProperties(Ljava/util/HashMap;)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static addProperty(Ljava/lang/String;Ljava/lang/Boolean;)Z
    .locals 0

    .line 136
    invoke-static {p0, p1}, Lcom/helpshift/campaigns/Campaigns;->addPropertyInternal(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static addProperty(Ljava/lang/String;Ljava/lang/Integer;)Z
    .locals 2

    if-eqz p1, :cond_0

    .line 105
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    int-to-long v0, p1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 106
    :goto_0
    invoke-static {p0, p1}, Lcom/helpshift/campaigns/Campaigns;->addPropertyInternal(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static addProperty(Ljava/lang/String;Ljava/lang/Long;)Z
    .locals 0

    .line 121
    invoke-static {p0, p1}, Lcom/helpshift/campaigns/Campaigns;->addPropertyInternal(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static addProperty(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 90
    invoke-static {p0, p1}, Lcom/helpshift/campaigns/Campaigns;->addPropertyInternal(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static addProperty(Ljava/lang/String;Ljava/util/Date;)Z
    .locals 0

    .line 151
    invoke-static {p0, p1}, Lcom/helpshift/campaigns/Campaigns;->addPropertyInternal(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static addPropertyInternal(Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 2

    .line 155
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 158
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 159
    invoke-interface {v0}, Lcom/helpshift/util/concurrent/ApiExecutor;->awaitForSyncExecution()V

    .line 160
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    new-instance v1, Lcom/helpshift/campaigns/models/PropertyValue;

    invoke-direct {v1, p1}, Lcom/helpshift/campaigns/models/PropertyValue;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p0, v1}, Lcom/helpshift/campaigns/controllers/UserController;->addProperty(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;)Z

    move-result p0

    return p0
.end method

.method public static configure(Ljava/util/Map;)V
    .locals 1

    const-string v0, "muteNotifications"

    .line 338
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 339
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    .line 340
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lcom/helpshift/model/AppInfoModel;->setMuteNotifications(Ljava/lang/Boolean;)V

    goto :goto_0

    .line 343
    :cond_0
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p0

    iget-object p0, p0, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/helpshift/model/AppInfoModel;->setMuteNotifications(Ljava/lang/Boolean;)V

    :goto_0
    return-void
.end method

.method public static getCountOfUnreadMessages()I
    .locals 4

    .line 275
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, -0x1

    return v0

    .line 278
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 279
    invoke-interface {v0}, Lcom/helpshift/util/concurrent/ApiExecutor;->awaitForSyncExecution()V

    .line 283
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 284
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    .line 286
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    const/4 v3, 0x0

    .line 283
    invoke-static {v0, v1, v3, v2}, Lcom/helpshift/campaigns/util/InAppCampaignsUtil;->cleanAndGetActiveCampaigns(Landroid/content/Context;Lcom/helpshift/campaigns/storage/CampaignStorage;ZLjava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 288
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    :cond_1
    return v3
.end method

.method public static getInstance()Lcom/helpshift/campaigns/Campaigns;
    .locals 1

    .line 75
    sget-object v0, Lcom/helpshift/campaigns/Campaigns$LazyHolder;->INSTANCE:Lcom/helpshift/campaigns/Campaigns;

    return-object v0
.end method

.method private reconcileSDKVersionFromSupport(Landroid/content/Context;)V
    .locals 3

    .line 506
    invoke-static {p1}, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;->getInstance(Landroid/content/Context;)Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;->getCurrentSDKVersion()Ljava/lang/String;

    move-result-object v0

    .line 508
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    const-string v1, "HSJsonData"

    .line 509
    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "libraryVersion"

    const-string v2, ""

    .line 511
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 512
    invoke-static {p1}, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;->getInstance(Landroid/content/Context;)Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;->setCurrentSDKVersion(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static setDelegate(Lcom/helpshift/campaigns/Campaigns$Delegate;)V
    .locals 2

    .line 325
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 328
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 329
    new-instance v1, Lcom/helpshift/campaigns/Campaigns$4;

    invoke-direct {v1, p0}, Lcom/helpshift/campaigns/Campaigns$4;-><init>(Lcom/helpshift/campaigns/Campaigns$Delegate;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setInboxMessageDelegate(Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;)V
    .locals 2

    .line 299
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 302
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 303
    new-instance v1, Lcom/helpshift/campaigns/Campaigns$3;

    invoke-direct {v1, p0}, Lcom/helpshift/campaigns/Campaigns$3;-><init>(Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static showInbox(Landroid/app/Activity;)V
    .locals 2

    .line 216
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 219
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 220
    new-instance v1, Lcom/helpshift/campaigns/Campaigns$1;

    invoke-direct {v1, p0}, Lcom/helpshift/campaigns/Campaigns$1;-><init>(Landroid/app/Activity;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static showMessage(Ljava/lang/String;Landroid/app/Activity;)V
    .locals 2

    .line 250
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 253
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 254
    new-instance v1, Lcom/helpshift/campaigns/Campaigns$2;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/campaigns/Campaigns$2;-><init>(Ljava/lang/String;Landroid/app/Activity;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public _clearAnonymousUser()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public _getActionExecutor()Lcom/helpshift/executors/ActionExecutor;
    .locals 1

    .line 583
    new-instance v0, Lcom/helpshift/executors/CampaignActionExecutor;

    invoke-direct {v0}, Lcom/helpshift/executors/CampaignActionExecutor;-><init>()V

    return-object v0
.end method

.method public _handlePush(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 537
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 538
    new-instance v1, Lcom/helpshift/campaigns/Campaigns$5;

    invoke-direct {v1, p0, p1, p2}, Lcom/helpshift/campaigns/Campaigns$5;-><init>(Lcom/helpshift/campaigns/Campaigns;Landroid/content/Context;Landroid/content/Intent;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public _install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 389
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/helpshift/campaigns/Campaigns;->_install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public _install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
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

    .line 402
    new-instance v0, Lcom/helpshift/campaigns/providers/CampaignsModuleAPIs;

    invoke-direct {v0}, Lcom/helpshift/campaigns/providers/CampaignsModuleAPIs;-><init>()V

    invoke-static {v0}, Lcom/helpshift/providers/CrossModuleDataProvider;->setCampaignsDataProvider(Lcom/helpshift/providers/ICampaignsModuleAPIs;)V

    .line 405
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    .line 409
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v0

    const-string v1, "enableInboxPolling"

    .line 410
    invoke-interface {p5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 411
    instance-of v2, v1, Ljava/lang/Boolean;

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    check-cast v1, Ljava/lang/Boolean;

    .line 412
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    .line 414
    :goto_0
    iget-object v0, v0, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/model/AppInfoModel;->setEnableInboxPolling(Ljava/lang/Boolean;)V

    .line 417
    invoke-static {}, Lcom/helpshift/controllers/ControllerFactory;->getInstance()Lcom/helpshift/controllers/ControllerFactory;

    .line 418
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    .line 419
    invoke-static {}, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->getInstance()Lcom/helpshift/campaigns/network/NetworkManagerFactory;

    .line 421
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    invoke-virtual {v1}, Lcom/helpshift/model/AppInfoModel;->isInstalled()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 422
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/helpshift/model/SdkInfoModel;->setFirstLaunch(Ljava/lang/Boolean;)V

    goto :goto_1

    .line 425
    :cond_1
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/helpshift/model/SdkInfoModel;->setFirstLaunch(Ljava/lang/Boolean;)V

    .line 428
    :goto_1
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    invoke-virtual {v1, p2, p3, p4}, Lcom/helpshift/model/AppInfoModel;->install(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "font"

    .line 430
    invoke-interface {p5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 431
    instance-of p3, p2, Ljava/lang/String;

    if-eqz p3, :cond_2

    check-cast p2, Ljava/lang/String;

    goto :goto_2

    :cond_2
    const/4 p2, 0x0

    .line 432
    :goto_2
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p3

    iget-object p3, p3, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    invoke-virtual {p3, p2}, Lcom/helpshift/model/AppInfoModel;->setFontPath(Ljava/lang/String;)V

    .line 435
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p2

    iget-object p2, p2, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    invoke-virtual {p2}, Lcom/helpshift/model/AppInfoModel;->getFontPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/helpshift/views/FontApplier;->setFontPath(Ljava/lang/String;)V

    const-string p2, "notificationSound"

    .line 437
    invoke-interface {p5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 438
    instance-of p3, p2, Ljava/lang/Integer;

    if-eqz p3, :cond_3

    .line 439
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p3

    iget-object p3, p3, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p3, p2}, Lcom/helpshift/model/AppInfoModel;->setNotificationSoundId(Ljava/lang/Integer;)V

    :cond_3
    const-string p2, "notificationIcon"

    .line 442
    invoke-interface {p5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 443
    instance-of p3, p2, Ljava/lang/Integer;

    if-eqz p3, :cond_4

    .line 444
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p3

    iget-object p3, p3, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p3, p2}, Lcom/helpshift/model/AppInfoModel;->setNotificationIconId(Ljava/lang/Integer;)V

    :cond_4
    const-string p2, "campaignsNotificationChannelId"

    .line 447
    invoke-interface {p5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 448
    instance-of p3, p2, Ljava/lang/String;

    if-eqz p3, :cond_5

    .line 449
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p3

    iget-object p3, p3, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    check-cast p2, Ljava/lang/String;

    .line 450
    invoke-virtual {p3, p2}, Lcom/helpshift/model/AppInfoModel;->setCampaignsNotificationChannelId(Ljava/lang/String;)V

    :cond_5
    const-string p2, "largeNotificationIcon"

    .line 453
    invoke-interface {p5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    .line 454
    instance-of p3, p3, Ljava/lang/Integer;

    if-eqz p3, :cond_6

    .line 455
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p3

    iget-object p3, p3, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    .line 456
    invoke-interface {p5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p3, p2}, Lcom/helpshift/model/AppInfoModel;->setLargeNotificationIconId(Ljava/lang/Integer;)V

    :cond_6
    const-string p2, "screenOrientation"

    .line 459
    invoke-interface {p5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 460
    instance-of p3, p2, Ljava/lang/Integer;

    if-eqz p3, :cond_7

    .line 461
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p3

    iget-object p3, p3, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p3, p2}, Lcom/helpshift/model/AppInfoModel;->setScreenOrientation(Ljava/lang/Integer;)V

    goto :goto_3

    .line 464
    :cond_7
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p2

    iget-object p2, p2, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    const/4 p3, -0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/helpshift/model/AppInfoModel;->setScreenOrientation(Ljava/lang/Integer;)V

    :goto_3
    const-string p2, "sdkType"

    .line 467
    invoke-interface {p5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 468
    instance-of p3, p2, Ljava/lang/String;

    if-eqz p3, :cond_8

    .line 469
    iget-object p3, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p3, p2}, Lcom/helpshift/campaigns/controllers/DeviceController;->setDevelopmentPlatform(Ljava/lang/String;)V

    goto :goto_4

    .line 472
    :cond_8
    iget-object p2, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    const-string p3, "android"

    invoke-virtual {p2, p3}, Lcom/helpshift/campaigns/controllers/DeviceController;->setDevelopmentPlatform(Ljava/lang/String;)V

    :goto_4
    const-string p2, "disableHelpshiftBranding"

    .line 475
    invoke-interface {p5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 476
    instance-of p3, p2, Ljava/lang/Boolean;

    if-eqz p3, :cond_9

    .line 477
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p3

    iget-object p3, p3, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p3, p2}, Lcom/helpshift/model/AppInfoModel;->setDisableHelpshiftBranding(Ljava/lang/Boolean;)V

    goto :goto_5

    .line 480
    :cond_9
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p2

    iget-object p2, p2, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/helpshift/model/AppInfoModel;->setDisableHelpshiftBranding(Ljava/lang/Boolean;)V

    :goto_5
    const-string p2, "disableAnimations"

    .line 483
    invoke-interface {p5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 484
    instance-of p3, p2, Ljava/lang/Boolean;

    if-eqz p3, :cond_a

    .line 485
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p3

    iget-object p3, p3, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p3, p2}, Lcom/helpshift/model/AppInfoModel;->setDisableAnimations(Ljava/lang/Boolean;)V

    goto :goto_6

    .line 488
    :cond_a
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p2

    iget-object p2, p2, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/helpshift/model/AppInfoModel;->setDisableAnimations(Ljava/lang/Boolean;)V

    .line 492
    :goto_6
    invoke-static {p1}, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;->getInstance(Landroid/content/Context;)Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;

    move-result-object p1

    .line 493
    invoke-virtual {p1}, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;->getCurrentSDKVersion()Ljava/lang/String;

    move-result-object p2

    const-string p3, "7.11.1"

    .line 494
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_b

    .line 495
    invoke-virtual {p1, p3}, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;->setCurrentSDKVersion(Ljava/lang/String;)V

    :cond_b
    return-void
.end method

.method public _login(Lcom/helpshift/HelpshiftUser;)Z
    .locals 1

    .line 558
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/controllers/UserController;->login(Lcom/helpshift/HelpshiftUser;)Z

    move-result p1

    return p1
.end method

.method public _logout()Z
    .locals 1

    .line 566
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/UserController;->logout()Z

    move-result v0

    return v0
.end method

.method public _preInstall(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 6
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

    .line 357
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/Campaigns;->reconcileSDKVersionFromSupport(Landroid/content/Context;)V

    .line 361
    sget-object v5, Lcom/helpshift/campaigns/storage/CampaignsDBNameRepo;->dbNames:Ljava/util/Map;

    const-string v1, "HSCampaignsSharedPref"

    move-object v0, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lcom/helpshift/util/SDKSanityCheck;->checkInstallCredsSanity(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 368
    invoke-static {p1}, Lcom/helpshift/util/HelpshiftContext;->setApplicationContext(Landroid/content/Context;)V

    if-eqz p5, :cond_0

    const-string p2, "manualLifecycleTracking"

    .line 371
    invoke-interface {p5, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 372
    invoke-interface {p5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 375
    :goto_0
    new-instance p3, Lcom/helpshift/app/CampaignAppLifeCycleListener;

    invoke-direct {p3}, Lcom/helpshift/app/CampaignAppLifeCycleListener;-><init>()V

    .line 376
    invoke-static {p3}, Lcom/helpshift/util/HelpshiftContext;->setCampaignAppLifeCycleListener(Lcom/helpshift/app/CampaignAppLifeCycleListener;)V

    .line 377
    invoke-static {}, Lcom/helpshift/applifecycle/HSAppLifeCycleController;->getInstance()Lcom/helpshift/applifecycle/HSAppLifeCycleController;

    move-result-object p4

    .line 378
    invoke-virtual {p4, p1, p2}, Lcom/helpshift/applifecycle/HSAppLifeCycleController;->init(Landroid/app/Application;Z)V

    .line 379
    invoke-virtual {p4, p3}, Lcom/helpshift/applifecycle/HSAppLifeCycleController;->registerAppLifeCycleListener(Lcom/helpshift/applifecycle/HSAppLifeCycleListener;)V

    return-void
.end method

.method public _registerDeviceToken(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 529
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object p1

    iget-object p1, p1, Lcom/helpshift/campaigns/controllers/ControllerFactory;->deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    invoke-virtual {p1, p2}, Lcom/helpshift/campaigns/controllers/DeviceController;->setPushToken(Ljava/lang/String;)V

    return-void
.end method

.method public _setNameAndEmail(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 521
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/campaigns/controllers/UserController;->setNameAndEmail(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public _setSDKLanguage(Ljava/lang/String;)V
    .locals 1

    .line 591
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {v0, p1}, Lcom/helpshift/model/SdkInfoModel;->setSdkLanguage(Ljava/lang/String;)V

    return-void
.end method

.method public _setTheme(I)V
    .locals 2

    .line 599
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 602
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 603
    new-instance v1, Lcom/helpshift/campaigns/Campaigns$6;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/campaigns/Campaigns$6;-><init>(Lcom/helpshift/campaigns/Campaigns;I)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public campaignCoverImageFilePathUpdated(Ljava/lang/String;)V
    .locals 1

    .line 636
    sget-object v0, Lcom/helpshift/campaigns/Campaigns;->delegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    if-eqz v0, :cond_0

    .line 637
    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;->coverImageDownloaded(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public campaignDeleted(Ljava/lang/String;)V
    .locals 1

    .line 646
    sget-object v0, Lcom/helpshift/campaigns/Campaigns;->delegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    if-eqz v0, :cond_0

    .line 647
    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;->inboxMessageDeleted(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public campaignDetailModelAdded(Lcom/helpshift/campaigns/models/CampaignDetailModel;)V
    .locals 1

    .line 616
    sget-object v0, Lcom/helpshift/campaigns/Campaigns;->delegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    if-eqz v0, :cond_0

    .line 617
    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;->inboxMessageAdded(Lcom/helpshift/campaigns/models/InboxMessage;)V

    :cond_0
    return-void
.end method

.method public campaignIconImageFilePathUpdated(Ljava/lang/String;)V
    .locals 1

    .line 626
    sget-object v0, Lcom/helpshift/campaigns/Campaigns;->delegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    if-eqz v0, :cond_0

    .line 627
    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;->iconImageDownloaded(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public campaignRead(Ljava/lang/String;)V
    .locals 1

    .line 656
    sget-object v0, Lcom/helpshift/campaigns/Campaigns;->delegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    if-eqz v0, :cond_0

    .line 657
    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;->inboxMessageMarkedAsRead(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public campaignSeen(Ljava/lang/String;)V
    .locals 1

    .line 666
    sget-object v0, Lcom/helpshift/campaigns/Campaigns;->delegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    if-eqz v0, :cond_0

    .line 667
    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;->inboxMessageMarkedAsSeen(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
