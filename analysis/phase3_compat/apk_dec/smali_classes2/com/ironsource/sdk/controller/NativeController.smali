.class public Lcom/ironsource/sdk/controller/NativeController;
.super Ljava/lang/Object;
.source "NativeController.java"

# interfaces
.implements Lcom/ironsource/sdk/controller/IronSourceController;


# static fields
.field private static final mUiHandler:Landroid/os/Handler;


# instance fields
.field private mFailedControllerReason:Ljava/lang/String;

.field private mOfferwallListener:Lcom/ironsource/sdk/listeners/OnOfferWallListener;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 24
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/ironsource/sdk/controller/NativeController;->mUiHandler:Landroid/os/Handler;

    return-void
.end method

.method constructor <init>(Lcom/ironsource/sdk/controller/ControllerEventListener;)V
    .locals 2

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 22
    iput-object v0, p0, Lcom/ironsource/sdk/controller/NativeController;->mFailedControllerReason:Ljava/lang/String;

    .line 28
    sget-object v0, Lcom/ironsource/sdk/controller/NativeController;->mUiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/ironsource/sdk/controller/NativeController$1;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/sdk/controller/NativeController$1;-><init>(Lcom/ironsource/sdk/controller/NativeController;Lcom/ironsource/sdk/controller/ControllerEventListener;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic access$000(Lcom/ironsource/sdk/controller/NativeController;)Ljava/lang/String;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/ironsource/sdk/controller/NativeController;->mFailedControllerReason:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/ironsource/sdk/controller/NativeController;)Lcom/ironsource/sdk/listeners/OnOfferWallListener;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/ironsource/sdk/controller/NativeController;->mOfferwallListener:Lcom/ironsource/sdk/listeners/OnOfferWallListener;

    return-object p0
.end method


# virtual methods
.method public destroy()V
    .locals 0

    return-void
.end method

.method public enterBackground()V
    .locals 0

    return-void
.end method

.method public enterForeground()V
    .locals 0

    return-void
.end method

.method public getOfferWallCredits(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V
    .locals 0

    if-eqz p3, :cond_0

    .line 70
    sget-object p1, Lcom/ironsource/sdk/controller/NativeController;->mUiHandler:Landroid/os/Handler;

    new-instance p2, Lcom/ironsource/sdk/controller/NativeController$4;

    invoke-direct {p2, p0, p3}, Lcom/ironsource/sdk/controller/NativeController$4;-><init>(Lcom/ironsource/sdk/controller/NativeController;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public initBanner(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/listeners/internals/DSBannerListener;)V
    .locals 0

    if-eqz p4, :cond_0

    .line 171
    sget-object p1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {p3}, Lcom/ironsource/sdk/data/DemandSource;->getDemandSourceName()Ljava/lang/String;

    move-result-object p2

    iget-object p3, p0, Lcom/ironsource/sdk/controller/NativeController;->mFailedControllerReason:Ljava/lang/String;

    invoke-interface {p4, p1, p2, p3}, Lcom/ironsource/sdk/listeners/internals/DSBannerListener;->onAdProductInitFailed(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public initInterstitial(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 0

    if-eqz p4, :cond_0

    .line 106
    sget-object p1, Lcom/ironsource/sdk/controller/NativeController;->mUiHandler:Landroid/os/Handler;

    new-instance p2, Lcom/ironsource/sdk/controller/NativeController$7;

    invoke-direct {p2, p0, p4, p3}, Lcom/ironsource/sdk/controller/NativeController$7;-><init>(Lcom/ironsource/sdk/controller/NativeController;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;Lcom/ironsource/sdk/data/DemandSource;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public initOfferWall(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V
    .locals 0
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

    if-eqz p4, :cond_0

    .line 43
    iput-object p4, p0, Lcom/ironsource/sdk/controller/NativeController;->mOfferwallListener:Lcom/ironsource/sdk/listeners/OnOfferWallListener;

    .line 44
    sget-object p1, Lcom/ironsource/sdk/controller/NativeController;->mUiHandler:Landroid/os/Handler;

    new-instance p2, Lcom/ironsource/sdk/controller/NativeController$2;

    invoke-direct {p2, p0}, Lcom/ironsource/sdk/controller/NativeController$2;-><init>(Lcom/ironsource/sdk/controller/NativeController;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public initRewardedVideo(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;)V
    .locals 0

    if-eqz p4, :cond_0

    .line 82
    sget-object p1, Lcom/ironsource/sdk/controller/NativeController;->mUiHandler:Landroid/os/Handler;

    new-instance p2, Lcom/ironsource/sdk/controller/NativeController$5;

    invoke-direct {p2, p0, p4, p3}, Lcom/ironsource/sdk/controller/NativeController$5;-><init>(Lcom/ironsource/sdk/controller/NativeController;Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;Lcom/ironsource/sdk/data/DemandSource;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public isInterstitialAdAvailable(Ljava/lang/String;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public loadBanner(Lorg/json/JSONObject;Lcom/ironsource/sdk/listeners/internals/DSBannerListener;)V
    .locals 2

    if-eqz p2, :cond_0

    .line 178
    sget-object v0, Lcom/ironsource/sdk/controller/NativeController;->mUiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/ironsource/sdk/controller/NativeController$12;

    invoke-direct {v1, p0, p2, p1}, Lcom/ironsource/sdk/controller/NativeController$12;-><init>(Lcom/ironsource/sdk/controller/NativeController;Lcom/ironsource/sdk/listeners/internals/DSBannerListener;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public loadInterstitial(Lcom/ironsource/sdk/data/DemandSource;Ljava/util/Map;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 1
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

    if-eqz p3, :cond_0

    .line 130
    sget-object p2, Lcom/ironsource/sdk/controller/NativeController;->mUiHandler:Landroid/os/Handler;

    new-instance v0, Lcom/ironsource/sdk/controller/NativeController$9;

    invoke-direct {v0, p0, p3, p1}, Lcom/ironsource/sdk/controller/NativeController$9;-><init>(Lcom/ironsource/sdk/controller/NativeController;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;Lcom/ironsource/sdk/data/DemandSource;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public loadInterstitial(Ljava/lang/String;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 2

    if-eqz p2, :cond_0

    .line 118
    sget-object v0, Lcom/ironsource/sdk/controller/NativeController;->mUiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/ironsource/sdk/controller/NativeController$8;

    invoke-direct {v1, p0, p2, p1}, Lcom/ironsource/sdk/controller/NativeController$8;-><init>(Lcom/ironsource/sdk/controller/NativeController;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public registerConnectionReceiver(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public restoreSavedState()V
    .locals 0

    return-void
.end method

.method public setCommunicationWithAdView(Lcom/ironsource/sdk/ISNAdView/ISNAdView;)V
    .locals 0

    return-void
.end method

.method setFailedControllerReason(Ljava/lang/String;)V
    .locals 0

    .line 37
    iput-object p1, p0, Lcom/ironsource/sdk/controller/NativeController;->mFailedControllerReason:Ljava/lang/String;

    return-void
.end method

.method public showInterstitial(Lcom/ironsource/sdk/data/DemandSource;Ljava/util/Map;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 1
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

    if-eqz p3, :cond_0

    .line 154
    sget-object p2, Lcom/ironsource/sdk/controller/NativeController;->mUiHandler:Landroid/os/Handler;

    new-instance v0, Lcom/ironsource/sdk/controller/NativeController$11;

    invoke-direct {v0, p0, p3, p1}, Lcom/ironsource/sdk/controller/NativeController$11;-><init>(Lcom/ironsource/sdk/controller/NativeController;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;Lcom/ironsource/sdk/data/DemandSource;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public showInterstitial(Lorg/json/JSONObject;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 2

    if-eqz p2, :cond_0

    .line 142
    sget-object v0, Lcom/ironsource/sdk/controller/NativeController;->mUiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/ironsource/sdk/controller/NativeController$10;

    invoke-direct {v1, p0, p2, p1}, Lcom/ironsource/sdk/controller/NativeController$10;-><init>(Lcom/ironsource/sdk/controller/NativeController;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public showOfferWall(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 55
    iget-object p1, p0, Lcom/ironsource/sdk/controller/NativeController;->mOfferwallListener:Lcom/ironsource/sdk/listeners/OnOfferWallListener;

    if-eqz p1, :cond_0

    .line 57
    sget-object p1, Lcom/ironsource/sdk/controller/NativeController;->mUiHandler:Landroid/os/Handler;

    new-instance v0, Lcom/ironsource/sdk/controller/NativeController$3;

    invoke-direct {v0, p0}, Lcom/ironsource/sdk/controller/NativeController$3;-><init>(Lcom/ironsource/sdk/controller/NativeController;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public showRewardedVideo(Lorg/json/JSONObject;Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;)V
    .locals 2

    if-eqz p2, :cond_0

    .line 94
    sget-object v0, Lcom/ironsource/sdk/controller/NativeController;->mUiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/ironsource/sdk/controller/NativeController$6;

    invoke-direct {v1, p0, p2, p1}, Lcom/ironsource/sdk/controller/NativeController$6;-><init>(Lcom/ironsource/sdk/controller/NativeController;Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public unregisterConnectionReceiver(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public updateConsentInfo(Lorg/json/JSONObject;)V
    .locals 0

    return-void
.end method
