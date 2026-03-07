.class public Lcom/ironsource/sdk/controller/ControllerManager;
.super Ljava/lang/Object;
.source "ControllerManager.java"

# interfaces
.implements Lcom/ironsource/sdk/controller/ControllerEventListener;


# static fields
.field private static final mUiHandler:Landroid/os/Handler;


# instance fields
.field private TAG:Ljava/lang/String;

.field private mCommandExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

.field private mController:Lcom/ironsource/sdk/controller/IronSourceController;

.field private mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

.field private mControllerState:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

.field private mGlobalControllerTimer:Landroid/os/CountDownTimer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 43
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/ironsource/sdk/controller/ControllerManager;->mUiHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/ironsource/sdk/service/TokenService;Lcom/ironsource/sdk/controller/DemandSourceManager;)V
    .locals 2

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const-class v0, Lcom/ironsource/sdk/controller/ControllerManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->TAG:Ljava/lang/String;

    .line 34
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;->None:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    iput-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerState:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    .line 50
    new-instance v0, Lcom/ironsource/sdk/controller/CommandExecutor;

    const-string v1, "NativeCommandExecutor"

    invoke-direct {v0, v1}, Lcom/ironsource/sdk/controller/CommandExecutor;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mCommandExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    .line 51
    new-instance v0, Lcom/ironsource/sdk/controller/CommandExecutor;

    const-string v1, "ControllerCommandsExecutor"

    invoke-direct {v0, v1}, Lcom/ironsource/sdk/controller/CommandExecutor;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    .line 52
    invoke-direct {p0, p1, p2, p3}, Lcom/ironsource/sdk/controller/ControllerManager;->createController(Landroid/app/Activity;Lcom/ironsource/sdk/service/TokenService;Lcom/ironsource/sdk/controller/DemandSourceManager;)V

    return-void
.end method

.method static synthetic access$000(Lcom/ironsource/sdk/controller/ControllerManager;Landroid/app/Activity;Lcom/ironsource/sdk/service/TokenService;Lcom/ironsource/sdk/controller/DemandSourceManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 30
    invoke-direct {p0, p1, p2, p3}, Lcom/ironsource/sdk/controller/ControllerManager;->createWebController(Landroid/app/Activity;Lcom/ironsource/sdk/service/TokenService;Lcom/ironsource/sdk/controller/DemandSourceManager;)V

    return-void
.end method

.method static synthetic access$100(Lcom/ironsource/sdk/controller/ControllerManager;Ljava/lang/String;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/ControllerManager;->createNativeController(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/ironsource/sdk/controller/ControllerManager;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/ironsource/sdk/controller/ControllerManager;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/ironsource/sdk/controller/ControllerManager;->destroyWebControllerIfExist()V

    return-void
.end method

.method static synthetic access$400()Landroid/os/Handler;
    .locals 1

    .line 30
    sget-object v0, Lcom/ironsource/sdk/controller/ControllerManager;->mUiHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$500(Lcom/ironsource/sdk/controller/ControllerManager;)Lcom/ironsource/sdk/controller/IronSourceController;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mController:Lcom/ironsource/sdk/controller/IronSourceController;

    return-object p0
.end method

.method static synthetic access$502(Lcom/ironsource/sdk/controller/ControllerManager;Lcom/ironsource/sdk/controller/IronSourceController;)Lcom/ironsource/sdk/controller/IronSourceController;
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mController:Lcom/ironsource/sdk/controller/IronSourceController;

    return-object p1
.end method

.method private createController(Landroid/app/Activity;Lcom/ironsource/sdk/service/TokenService;Lcom/ironsource/sdk/controller/DemandSourceManager;)V
    .locals 2

    .line 65
    sget-object v0, Lcom/ironsource/sdk/controller/ControllerManager;->mUiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/ironsource/sdk/controller/ControllerManager$1;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/ironsource/sdk/controller/ControllerManager$1;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;Landroid/app/Activity;Lcom/ironsource/sdk/service/TokenService;Lcom/ironsource/sdk/controller/DemandSourceManager;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private createNativeController(Ljava/lang/String;)V
    .locals 3

    .line 135
    sget-object v0, Lcom/ironsource/sdk/Events/SDK5Events;->createControllerNative:Lcom/ironsource/sdk/Events/SDK5Events$Event;

    new-instance v1, Lcom/ironsource/sdk/Events/ISNEventParams;

    invoke-direct {v1}, Lcom/ironsource/sdk/Events/ISNEventParams;-><init>()V

    const-string v2, "callfailreason"

    .line 137
    invoke-virtual {v1, v2, p1}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ironsource/sdk/Events/ISNEventParams;->getData()Ljava/util/HashMap;

    move-result-object v1

    .line 135
    invoke-static {v0, v1}, Lcom/ironsource/sdk/Events/ISNEventsTracker;->logEvent(Lcom/ironsource/sdk/Events/SDK5Events$Event;Ljava/util/Map;)V

    .line 139
    new-instance v0, Lcom/ironsource/sdk/controller/NativeController;

    invoke-direct {v0, p0}, Lcom/ironsource/sdk/controller/NativeController;-><init>(Lcom/ironsource/sdk/controller/ControllerEventListener;)V

    iput-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mController:Lcom/ironsource/sdk/controller/IronSourceController;

    .line 140
    check-cast v0, Lcom/ironsource/sdk/controller/NativeController;

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/controller/NativeController;->setFailedControllerReason(Ljava/lang/String;)V

    .line 141
    iget-object p1, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mCommandExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    invoke-virtual {p1}, Lcom/ironsource/sdk/controller/CommandExecutor;->setReady()V

    .line 142
    iget-object p1, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mCommandExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    invoke-virtual {p1}, Lcom/ironsource/sdk/controller/CommandExecutor;->purgeDelayedCommands()V

    return-void
.end method

.method private createWebController(Landroid/app/Activity;Lcom/ironsource/sdk/service/TokenService;Lcom/ironsource/sdk/controller/DemandSourceManager;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 81
    sget-object v0, Lcom/ironsource/sdk/Events/SDK5Events;->createControllerWeb:Lcom/ironsource/sdk/Events/SDK5Events$Event;

    invoke-static {v0}, Lcom/ironsource/sdk/Events/ISNEventsTracker;->logEvent(Lcom/ironsource/sdk/Events/SDK5Events$Event;)V

    .line 83
    new-instance v0, Lcom/ironsource/sdk/controller/WebController;

    invoke-direct {v0, p1, p3, p0}, Lcom/ironsource/sdk/controller/WebController;-><init>(Landroid/app/Activity;Lcom/ironsource/sdk/controller/DemandSourceManager;Lcom/ironsource/sdk/controller/ControllerEventListener;)V

    iput-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mController:Lcom/ironsource/sdk/controller/IronSourceController;

    .line 88
    check-cast v0, Lcom/ironsource/sdk/controller/WebController;

    .line 90
    new-instance p3, Lcom/ironsource/sdk/controller/TokenJSAdapter;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p3, v1, p2}, Lcom/ironsource/sdk/controller/TokenJSAdapter;-><init>(Landroid/content/Context;Lcom/ironsource/sdk/service/TokenService;)V

    invoke-virtual {v0, p3}, Lcom/ironsource/sdk/controller/WebController;->addTokenJSInterface(Lcom/ironsource/sdk/controller/TokenJSAdapter;)V

    .line 91
    new-instance p2, Lcom/ironsource/sdk/controller/OMIDJSAdapter;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p2, p3}, Lcom/ironsource/sdk/controller/OMIDJSAdapter;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Lcom/ironsource/sdk/controller/WebController;->addOmidJSInterface(Lcom/ironsource/sdk/controller/OMIDJSAdapter;)V

    .line 92
    new-instance p2, Lcom/ironsource/sdk/controller/PermissionsJSAdapter;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p2, p3}, Lcom/ironsource/sdk/controller/PermissionsJSAdapter;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Lcom/ironsource/sdk/controller/WebController;->addPermissionsJSInterface(Lcom/ironsource/sdk/controller/PermissionsJSAdapter;)V

    .line 93
    new-instance p2, Lcom/ironsource/sdk/controller/BannerJSAdapter;

    invoke-direct {p2}, Lcom/ironsource/sdk/controller/BannerJSAdapter;-><init>()V

    invoke-virtual {v0, p2}, Lcom/ironsource/sdk/controller/WebController;->addBannerJSInterface(Lcom/ironsource/sdk/controller/BannerJSAdapter;)V

    .line 94
    new-instance p2, Lcom/ironsource/sdk/controller/DeviceDataJSAdapter;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p2, p3}, Lcom/ironsource/sdk/controller/DeviceDataJSAdapter;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Lcom/ironsource/sdk/controller/WebController;->addDeviceDataJSInterface(Lcom/ironsource/sdk/controller/DeviceDataJSAdapter;)V

    .line 95
    new-instance p2, Lcom/ironsource/sdk/controller/AdViewsJSAdapter;

    invoke-direct {p2, p1}, Lcom/ironsource/sdk/controller/AdViewsJSAdapter;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, p2}, Lcom/ironsource/sdk/controller/WebController;->addAdViewsJSInterface(Lcom/ironsource/sdk/controller/AdViewsJSAdapter;)V

    .line 99
    new-instance p1, Lcom/ironsource/sdk/controller/ControllerManager$2;

    const-wide/32 v3, 0x30d40

    const-wide/16 v5, 0x3e8

    move-object v1, p1

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/ironsource/sdk/controller/ControllerManager$2;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;JJ)V

    .line 120
    invoke-virtual {p1}, Lcom/ironsource/sdk/controller/ControllerManager$2;->start()Landroid/os/CountDownTimer;

    move-result-object p1

    iput-object p1, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mGlobalControllerTimer:Landroid/os/CountDownTimer;

    .line 122
    invoke-virtual {v0}, Lcom/ironsource/sdk/controller/WebController;->downloadController()V

    .line 123
    iget-object p1, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mCommandExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    invoke-virtual {p1}, Lcom/ironsource/sdk/controller/CommandExecutor;->setReady()V

    .line 124
    iget-object p1, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mCommandExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    invoke-virtual {p1}, Lcom/ironsource/sdk/controller/CommandExecutor;->purgeDelayedCommands()V

    return-void
.end method

.method private destroyWebControllerIfExist()V
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mController:Lcom/ironsource/sdk/controller/IronSourceController;

    if-eqz v0, :cond_0

    .line 129
    invoke-interface {v0}, Lcom/ironsource/sdk/controller/IronSourceController;->destroy()V

    :cond_0
    return-void
.end method

.method private isControllerStateReady()Z
    .locals 2

    .line 146
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;->Ready:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    iget-object v1, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerState:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .line 382
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mGlobalControllerTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_0

    .line 383
    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    :cond_0
    const/4 v0, 0x0

    .line 385
    iput-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mGlobalControllerTimer:Landroid/os/CountDownTimer;

    .line 386
    sget-object v0, Lcom/ironsource/sdk/controller/ControllerManager;->mUiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/ironsource/sdk/controller/ControllerManager$17;

    invoke-direct {v1, p0}, Lcom/ironsource/sdk/controller/ControllerManager$17;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public enterBackground()V
    .locals 1

    .line 364
    invoke-direct {p0}, Lcom/ironsource/sdk/controller/ControllerManager;->isControllerStateReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 365
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mController:Lcom/ironsource/sdk/controller/IronSourceController;

    invoke-interface {v0}, Lcom/ironsource/sdk/controller/IronSourceController;->enterBackground()V

    :cond_0
    return-void
.end method

.method public enterForeground()V
    .locals 1

    .line 358
    invoke-direct {p0}, Lcom/ironsource/sdk/controller/ControllerManager;->isControllerStateReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 359
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mController:Lcom/ironsource/sdk/controller/IronSourceController;

    invoke-interface {v0}, Lcom/ironsource/sdk/controller/IronSourceController;->enterForeground()V

    :cond_0
    return-void
.end method

.method public executeCommand(Ljava/lang/Runnable;)V
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mCommandExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/controller/CommandExecutor;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public getController()Lcom/ironsource/sdk/controller/IronSourceController;
    .locals 1

    .line 398
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mController:Lcom/ironsource/sdk/controller/IronSourceController;

    return-object v0
.end method

.method public getOfferWallCredits(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V
    .locals 2

    .line 221
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    new-instance v1, Lcom/ironsource/sdk/controller/ControllerManager$6;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/ironsource/sdk/controller/ControllerManager$6;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/CommandExecutor;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public handleControllerStageFailed(Ljava/lang/String;)V
    .locals 3

    .line 178
    sget-object v0, Lcom/ironsource/sdk/Events/SDK5Events;->controllerFailed:Lcom/ironsource/sdk/Events/SDK5Events$Event;

    new-instance v1, Lcom/ironsource/sdk/Events/ISNEventParams;

    invoke-direct {v1}, Lcom/ironsource/sdk/Events/ISNEventParams;-><init>()V

    const-string v2, "callfailreason"

    .line 179
    invoke-virtual {v1, v2, p1}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ironsource/sdk/Events/ISNEventParams;->getData()Ljava/util/HashMap;

    move-result-object v1

    .line 178
    invoke-static {v0, v1}, Lcom/ironsource/sdk/Events/ISNEventsTracker;->logEvent(Lcom/ironsource/sdk/Events/SDK5Events$Event;Ljava/util/Map;)V

    .line 181
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mGlobalControllerTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_0

    .line 182
    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 185
    :cond_0
    invoke-direct {p0}, Lcom/ironsource/sdk/controller/ControllerManager;->destroyWebControllerIfExist()V

    .line 187
    sget-object v0, Lcom/ironsource/sdk/controller/ControllerManager;->mUiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/ironsource/sdk/controller/ControllerManager$3;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/sdk/controller/ControllerManager$3;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public handleControllerStageLoaded()V
    .locals 1

    .line 155
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;->Loaded:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    iput-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerState:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    return-void
.end method

.method public handleControllerStageReady()V
    .locals 1

    .line 160
    sget-object v0, Lcom/ironsource/sdk/Events/SDK5Events;->controllerStageReady:Lcom/ironsource/sdk/Events/SDK5Events$Event;

    invoke-static {v0}, Lcom/ironsource/sdk/Events/ISNEventsTracker;->logEvent(Lcom/ironsource/sdk/Events/SDK5Events$Event;)V

    .line 162
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;->Ready:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    iput-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerState:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    .line 164
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mGlobalControllerTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_0

    .line 166
    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 170
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    invoke-virtual {v0}, Lcom/ironsource/sdk/controller/CommandExecutor;->setReady()V

    .line 171
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    invoke-virtual {v0}, Lcom/ironsource/sdk/controller/CommandExecutor;->purgeDelayedCommands()V

    .line 173
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mController:Lcom/ironsource/sdk/controller/IronSourceController;

    invoke-interface {v0}, Lcom/ironsource/sdk/controller/IronSourceController;->restoreSavedState()V

    return-void
.end method

.method public initBanner(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/listeners/internals/DSBannerListener;)V
    .locals 8

    .line 330
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    new-instance v7, Lcom/ironsource/sdk/controller/ControllerManager$14;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/ironsource/sdk/controller/ControllerManager$14;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/listeners/internals/DSBannerListener;)V

    invoke-virtual {v0, v7}, Lcom/ironsource/sdk/controller/CommandExecutor;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public initInterstitial(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 8

    .line 257
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    new-instance v7, Lcom/ironsource/sdk/controller/ControllerManager$9;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/ironsource/sdk/controller/ControllerManager$9;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V

    invoke-virtual {v0, v7}, Lcom/ironsource/sdk/controller/CommandExecutor;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public initOfferWall(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ironsource/sdk/listeners/OnOfferWallListener;",
            ")V"
        }
    .end annotation

    .line 200
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    new-instance v7, Lcom/ironsource/sdk/controller/ControllerManager$4;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/ironsource/sdk/controller/ControllerManager$4;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V

    invoke-virtual {v0, v7}, Lcom/ironsource/sdk/controller/CommandExecutor;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public initRewardedVideo(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;)V
    .locals 8

    .line 234
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    new-instance v7, Lcom/ironsource/sdk/controller/ControllerManager$7;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/ironsource/sdk/controller/ControllerManager$7;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;)V

    invoke-virtual {v0, v7}, Lcom/ironsource/sdk/controller/CommandExecutor;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public isInterstitialAdAvailable(Ljava/lang/String;)Z
    .locals 1

    .line 318
    invoke-direct {p0}, Lcom/ironsource/sdk/controller/ControllerManager;->isControllerStateReady()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 322
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mController:Lcom/ironsource/sdk/controller/IronSourceController;

    invoke-interface {v0, p1}, Lcom/ironsource/sdk/controller/IronSourceController;->isInterstitialAdAvailable(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public loadBanner(Lorg/json/JSONObject;Lcom/ironsource/sdk/listeners/internals/DSBannerListener;)V
    .locals 2

    .line 340
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    new-instance v1, Lcom/ironsource/sdk/controller/ControllerManager$15;

    invoke-direct {v1, p0, p1, p2}, Lcom/ironsource/sdk/controller/ControllerManager$15;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;Lorg/json/JSONObject;Lcom/ironsource/sdk/listeners/internals/DSBannerListener;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/CommandExecutor;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public loadInterstitial(Lcom/ironsource/sdk/data/DemandSource;Ljava/util/Map;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ironsource/sdk/data/DemandSource;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;",
            ")V"
        }
    .end annotation

    .line 280
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    new-instance v1, Lcom/ironsource/sdk/controller/ControllerManager$11;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/ironsource/sdk/controller/ControllerManager$11;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;Lcom/ironsource/sdk/data/DemandSource;Ljava/util/Map;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/CommandExecutor;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public loadInterstitial(Ljava/lang/String;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 2

    .line 268
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    new-instance v1, Lcom/ironsource/sdk/controller/ControllerManager$10;

    invoke-direct {v1, p0, p1, p2}, Lcom/ironsource/sdk/controller/ControllerManager$10;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;Ljava/lang/String;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/CommandExecutor;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public registerConnectionReceiver(Landroid/app/Activity;)V
    .locals 1

    .line 370
    invoke-direct {p0}, Lcom/ironsource/sdk/controller/ControllerManager;->isControllerStateReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 371
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mController:Lcom/ironsource/sdk/controller/IronSourceController;

    invoke-interface {v0, p1}, Lcom/ironsource/sdk/controller/IronSourceController;->registerConnectionReceiver(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method public setCommunicationWithAdView(Lcom/ironsource/sdk/ISNAdView/ISNAdView;)V
    .locals 1

    .line 402
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mController:Lcom/ironsource/sdk/controller/IronSourceController;

    if-eqz v0, :cond_0

    .line 403
    invoke-interface {v0, p1}, Lcom/ironsource/sdk/controller/IronSourceController;->setCommunicationWithAdView(Lcom/ironsource/sdk/ISNAdView/ISNAdView;)V

    :cond_0
    return-void
.end method

.method public showInterstitial(Lcom/ironsource/sdk/data/DemandSource;Ljava/util/Map;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ironsource/sdk/data/DemandSource;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;",
            ")V"
        }
    .end annotation

    .line 309
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    new-instance v1, Lcom/ironsource/sdk/controller/ControllerManager$13;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/ironsource/sdk/controller/ControllerManager$13;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;Lcom/ironsource/sdk/data/DemandSource;Ljava/util/Map;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/CommandExecutor;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public showInterstitial(Lorg/json/JSONObject;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 2

    .line 297
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    new-instance v1, Lcom/ironsource/sdk/controller/ControllerManager$12;

    invoke-direct {v1, p0, p1, p2}, Lcom/ironsource/sdk/controller/ControllerManager$12;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;Lorg/json/JSONObject;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/CommandExecutor;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public showOfferWall(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 209
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    new-instance v1, Lcom/ironsource/sdk/controller/ControllerManager$5;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/sdk/controller/ControllerManager$5;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;Ljava/util/Map;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/CommandExecutor;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public showRewardedVideo(Lorg/json/JSONObject;Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;)V
    .locals 2

    .line 244
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    new-instance v1, Lcom/ironsource/sdk/controller/ControllerManager$8;

    invoke-direct {v1, p0, p1, p2}, Lcom/ironsource/sdk/controller/ControllerManager$8;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;Lorg/json/JSONObject;Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/CommandExecutor;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public unregisterConnectionReceiver(Landroid/app/Activity;)V
    .locals 1

    .line 376
    invoke-direct {p0}, Lcom/ironsource/sdk/controller/ControllerManager;->isControllerStateReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 377
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mController:Lcom/ironsource/sdk/controller/IronSourceController;

    invoke-interface {v0, p1}, Lcom/ironsource/sdk/controller/IronSourceController;->unregisterConnectionReceiver(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method public updateConsentInfo(Lorg/json/JSONObject;)V
    .locals 2

    .line 349
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager;->mControllerCommandsExecutor:Lcom/ironsource/sdk/controller/CommandExecutor;

    new-instance v1, Lcom/ironsource/sdk/controller/ControllerManager$16;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/sdk/controller/ControllerManager$16;-><init>(Lcom/ironsource/sdk/controller/ControllerManager;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/CommandExecutor;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method
