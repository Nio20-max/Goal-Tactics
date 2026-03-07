.class public final Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;
.super Ljava/lang/Object;
.source "IronSourceAdsPublisherAgent.java"

# interfaces
.implements Lcom/ironsource/sdk/SSAPublisher;
.implements Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;
.implements Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;
.implements Lcom/ironsource/sdk/listeners/internals/DSAdProductListener;
.implements Lcom/ironsource/sdk/listeners/internals/DSBannerListener;
.implements Lcom/ironsource/sdk/IronSourceNetworkAPI;
.implements Lcom/ironsource/sdk/agent/OnPauseOnResumeHandler;


# static fields
.field private static final TAG:Ljava/lang/String; = "IronSourceAdsPublisherAgent"

.field private static mutableContextWrapper:Landroid/content/MutableContextWrapper;

.field private static sInstance:Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;


# instance fields
.field private final SUPERSONIC_ADS:Ljava/lang/String;

.field private adViewContainerCounter:J

.field private mApplicationKey:Ljava/lang/String;

.field private mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

.field private mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

.field private mEnableLifeCycleListeners:Z

.field private mTokenService:Lcom/ironsource/sdk/service/TokenService;

.field private mUserId:Ljava/lang/String;


# direct methods
.method private constructor <init>(Landroid/app/Activity;I)V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p2, "SupersonicAds"

    .line 56
    iput-object p2, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->SUPERSONIC_ADS:Ljava/lang/String;

    const/4 p2, 0x0

    .line 67
    iput-boolean p2, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mEnableLifeCycleListeners:Z

    .line 74
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->initPublisherAgent(Landroid/app/Activity;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;)V
    .locals 1

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "SupersonicAds"

    .line 56
    iput-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->SUPERSONIC_ADS:Ljava/lang/String;

    const/4 v0, 0x0

    .line 67
    iput-boolean v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mEnableLifeCycleListeners:Z

    .line 78
    iput-object p1, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mApplicationKey:Ljava/lang/String;

    .line 79
    iput-object p2, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mUserId:Ljava/lang/String;

    .line 80
    invoke-direct {p0, p3}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->initPublisherAgent(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$000(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;)Lcom/ironsource/sdk/controller/ControllerManager;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    return-object p0
.end method

.method static synthetic access$100(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;)Ljava/lang/String;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mApplicationKey:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;)Ljava/lang/String;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mUserId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;)Lcom/ironsource/sdk/controller/DemandSourceManager;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    return-object p0
.end method

.method public static createInstance(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Lcom/ironsource/sdk/IronSourceNetworkAPI;
    .locals 0

    .line 123
    invoke-static {p1, p2, p0}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getInstance(Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;)Lcom/ironsource/sdk/IronSourceNetworkAPI;

    move-result-object p0

    return-object p0
.end method

.method private createToken(Landroid/app/Activity;)Lcom/ironsource/sdk/service/TokenService;
    .locals 3

    .line 113
    invoke-static {}, Lcom/ironsource/sdk/service/TokenService;->getInstance()Lcom/ironsource/sdk/service/TokenService;

    move-result-object v0

    .line 114
    invoke-virtual {v0}, Lcom/ironsource/sdk/service/TokenService;->fetchIndependentData()V

    .line 115
    iget-object v1, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mApplicationKey:Ljava/lang/String;

    iget-object v2, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mUserId:Ljava/lang/String;

    invoke-virtual {v0, p1, v1, v2}, Lcom/ironsource/sdk/service/TokenService;->fetchDependentData(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private decodeADM(Ljava/util/Map;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "adm"

    .line 835
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 836
    invoke-static {v1}, Lcom/ironsource/sdk/utils/SDKUtils;->decodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 837
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p1
.end method

.method private getAdProductListenerAsBNListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnBannerListener;
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 204
    :cond_0
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/DemandSource;->getListener()Lcom/ironsource/sdk/listeners/OnAdProductListener;

    move-result-object p1

    check-cast p1, Lcom/ironsource/sdk/listeners/OnBannerListener;

    return-object p1
.end method

.method private getAdProductListenerAsISListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnInterstitialListener;
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 196
    :cond_0
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/DemandSource;->getListener()Lcom/ironsource/sdk/listeners/OnAdProductListener;

    move-result-object p1

    check-cast p1, Lcom/ironsource/sdk/listeners/OnInterstitialListener;

    return-object p1
.end method

.method private getAdProductListenerAsRVListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 189
    :cond_0
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/DemandSource;->getListener()Lcom/ironsource/sdk/listeners/OnAdProductListener;

    move-result-object p1

    check-cast p1, Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;

    return-object p1
.end method

.method private getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;
    .locals 1

    .line 711
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 714
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    invoke-virtual {v0, p1, p2}, Lcom/ironsource/sdk/controller/DemandSourceManager;->getDemandSourceById(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p1

    return-object p1
.end method

.method public static declared-synchronized getInstance(Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;)Lcom/ironsource/sdk/IronSourceNetworkAPI;
    .locals 2

    const-class v0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;

    monitor-enter v0

    .line 133
    :try_start_0
    sget-object v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->sInstance:Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;

    if-nez v1, :cond_0

    .line 134
    sget-object v1, Lcom/ironsource/sdk/Events/SDK5Events;->initSDK:Lcom/ironsource/sdk/Events/SDK5Events$Event;

    invoke-static {v1}, Lcom/ironsource/sdk/Events/ISNEventsTracker;->logEvent(Lcom/ironsource/sdk/Events/SDK5Events$Event;)V

    .line 136
    new-instance v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;

    invoke-direct {v1, p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;)V

    sput-object v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->sInstance:Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;

    goto :goto_0

    .line 144
    :cond_0
    sget-object v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mutableContextWrapper:Landroid/content/MutableContextWrapper;

    invoke-virtual {v1, p2}, Landroid/content/MutableContextWrapper;->setBaseContext(Landroid/content/Context;)V

    .line 145
    invoke-static {}, Lcom/ironsource/sdk/service/TokenService;->getInstance()Lcom/ironsource/sdk/service/TokenService;

    move-result-object p2

    invoke-virtual {p2, p0}, Lcom/ironsource/sdk/service/TokenService;->collectApplicationKey(Ljava/lang/String;)V

    .line 146
    invoke-static {}, Lcom/ironsource/sdk/service/TokenService;->getInstance()Lcom/ironsource/sdk/service/TokenService;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/ironsource/sdk/service/TokenService;->collectApplicationUserId(Ljava/lang/String;)V

    .line 149
    :goto_0
    sget-object p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->sInstance:Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized getInstance(Landroid/app/Activity;)Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;

    monitor-enter v0

    const/4 v1, 0x0

    .line 156
    :try_start_0
    invoke-static {p0, v1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getInstance(Landroid/app/Activity;I)Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized getInstance(Landroid/app/Activity;I)Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;

    monitor-enter v0

    :try_start_0
    const-string v1, "IronSourceAdsPublisherAgent"

    const-string v2, "getInstance()"

    .line 165
    invoke-static {v1, v2}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    sget-object v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->sInstance:Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;

    if-nez v1, :cond_0

    .line 168
    new-instance v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;-><init>(Landroid/app/Activity;I)V

    sput-object v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->sInstance:Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;

    goto :goto_0

    .line 174
    :cond_0
    sget-object p1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mutableContextWrapper:Landroid/content/MutableContextWrapper;

    invoke-virtual {p1, p0}, Landroid/content/MutableContextWrapper;->setBaseContext(Landroid/content/Context;)V

    .line 177
    :goto_0
    sget-object p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->sInstance:Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private initPublisherAgent(Landroid/app/Activity;)V
    .locals 3

    .line 86
    :try_start_0
    invoke-static {p1}, Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;->getSupersonicPrefHelper(Landroid/content/Context;)Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;

    .line 87
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->createToken(Landroid/app/Activity;)Lcom/ironsource/sdk/service/TokenService;

    move-result-object v0

    iput-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mTokenService:Lcom/ironsource/sdk/service/TokenService;

    .line 88
    new-instance v0, Lcom/ironsource/sdk/controller/DemandSourceManager;

    invoke-direct {v0}, Lcom/ironsource/sdk/controller/DemandSourceManager;-><init>()V

    iput-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    .line 89
    new-instance v0, Lcom/ironsource/sdk/controller/ControllerManager;

    iget-object v1, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mTokenService:Lcom/ironsource/sdk/service/TokenService;

    iget-object v2, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    invoke-direct {v0, p1, v1, v2}, Lcom/ironsource/sdk/controller/ControllerManager;-><init>(Landroid/app/Activity;Lcom/ironsource/sdk/service/TokenService;Lcom/ironsource/sdk/controller/DemandSourceManager;)V

    iput-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    .line 95
    invoke-static {}, Lcom/ironsource/sdk/controller/FeaturesManager;->getInstance()Lcom/ironsource/sdk/controller/FeaturesManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/sdk/controller/FeaturesManager;->getDebugMode()I

    move-result v0

    invoke-static {v0}, Lcom/ironsource/sdk/utils/Logger;->enableLogging(I)V

    const-string v0, "IronSourceAdsPublisherAgent"

    const-string v1, "C\'tor"

    .line 97
    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    new-instance v0, Landroid/content/MutableContextWrapper;

    invoke-direct {v0, p1}, Landroid/content/MutableContextWrapper;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mutableContextWrapper:Landroid/content/MutableContextWrapper;

    .line 101
    invoke-static {}, Lcom/ironsource/sdk/utils/SDKUtils;->getNetworkConfiguration()Lorg/json/JSONObject;

    move-result-object v0

    .line 102
    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->decideOnListeningToApplicationLifeCycleEvents(Landroid/app/Application;Lorg/json/JSONObject;)V

    const-wide/16 v0, 0x0

    .line 104
    iput-wide v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->adViewContainerCounter:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 107
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private loadInAppBiddingAd(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ironsource/sdk/IronSourceAdInstance;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 807
    :try_start_0
    invoke-direct {p0, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->decodeADM(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 809
    new-instance v1, Lcom/ironsource/sdk/Events/ISNEventParams;

    invoke-direct {v1}, Lcom/ironsource/sdk/Events/ISNEventParams;-><init>()V

    .line 810
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    const-string v3, "callfailreason"

    invoke-virtual {v1, v3, v2}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object v1

    .line 811
    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->isInitialized()Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Lcom/ironsource/sdk/constants/Events;->INTIALIZED:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    sget-object v2, Lcom/ironsource/sdk/constants/Events;->UNINTIALIZED:Ljava/lang/Object;

    :goto_0
    const-string v3, "generalmessage"

    invoke-virtual {v1, v3, v2}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object v1

    .line 812
    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->isInAppBidding()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "isbiddinginstance"

    invoke-virtual {v1, v3, v2}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object v1

    .line 813
    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "demandsourcename"

    invoke-virtual {v1, v3, v2}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object v1

    .line 814
    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->isRewarded()Z

    move-result v2

    if-eqz v2, :cond_1

    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    goto :goto_1

    :cond_1
    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    :goto_1
    const-string v3, "producttype"

    invoke-virtual {v1, v3, v2}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object v1

    .line 816
    sget-object v2, Lcom/ironsource/sdk/Events/SDK5Events;->parseAdmFailed:Lcom/ironsource/sdk/Events/SDK5Events$Event;

    invoke-virtual {v1}, Lcom/ironsource/sdk/Events/ISNEventParams;->getData()Ljava/util/HashMap;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/ironsource/sdk/Events/ISNEventsTracker;->logEvent(Lcom/ironsource/sdk/Events/SDK5Events$Event;Ljava/util/Map;)V

    .line 818
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 819
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loadInAppBiddingAd failed decoding ADM "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IronSourceAdsPublisherAgent"

    invoke-static {v1, v0}, Lcom/ironsource/sdk/utils/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 821
    :goto_2
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->loadInstance(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V

    return-void
.end method

.method private loadInitializedInstance(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ironsource/sdk/IronSourceAdInstance;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 843
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "loadOnInitializedInstance "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IronSourceAdsPublisherAgent"

    invoke-static {v1, v0}, Lcom/ironsource/sdk/utils/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 844
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$15;

    invoke-direct {v1, p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$15;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method private loadInstance(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ironsource/sdk/IronSourceAdInstance;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 825
    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 826
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->loadInitializedInstance(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V

    goto :goto_0

    .line 828
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->loadUninitializedInstance(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V

    :goto_0
    return-void
.end method

.method private loadUninitializedInstance(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ironsource/sdk/IronSourceAdInstance;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 856
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "loadOnNewInstance "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IronSourceAdsPublisherAgent"

    invoke-static {v1, v0}, Lcom/ironsource/sdk/utils/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 858
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$16;

    invoke-direct {v1, p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$16;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method private updateConsentInToken(Lorg/json/JSONObject;)V
    .locals 2

    if-eqz p1, :cond_0

    const-string v0, "gdprConsentStatus"

    .line 742
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 744
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 745
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 746
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const-string v0, "consent"

    .line 747
    invoke-virtual {v1, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 748
    iget-object p1, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mTokenService:Lcom/ironsource/sdk/service/TokenService;

    invoke-virtual {p1, v1}, Lcom/ironsource/sdk/service/TokenService;->updateData(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 750
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method


# virtual methods
.method public createBanner(Landroid/app/Activity;Lcom/ironsource/sdk/ISAdSize;)Lcom/ironsource/sdk/ISNAdView/ISNAdView;
    .locals 5

    .line 757
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SupersonicAds_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->adViewContainerCounter:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 758
    iget-wide v1, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->adViewContainerCounter:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->adViewContainerCounter:J

    .line 759
    new-instance v1, Lcom/ironsource/sdk/ISNAdView/ISNAdView;

    invoke-direct {v1, p1, v0, p2}, Lcom/ironsource/sdk/ISNAdView/ISNAdView;-><init>(Landroid/app/Activity;Ljava/lang/String;Lcom/ironsource/sdk/ISAdSize;)V

    .line 760
    iget-object p1, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    invoke-virtual {p1, v1}, Lcom/ironsource/sdk/controller/ControllerManager;->setCommunicationWithAdView(Lcom/ironsource/sdk/ISNAdView/ISNAdView;)V

    return-object v1
.end method

.method public decideOnListeningToApplicationLifeCycleEvents(Landroid/app/Application;Lorg/json/JSONObject;)V
    .locals 2

    const-string v0, "enableLifeCycleListeners"

    const/4 v1, 0x0

    .line 904
    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mEnableLifeCycleListeners:Z

    if-eqz p2, :cond_0

    .line 906
    new-instance p2, Lcom/ironsource/sdk/agent/ActivityLifeCycleListener;

    invoke-direct {p2, p0}, Lcom/ironsource/sdk/agent/ActivityLifeCycleListener;-><init>(Lcom/ironsource/sdk/agent/OnPauseOnResumeHandler;)V

    .line 907
    invoke-virtual {p1, p2}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_0
    return-void
.end method

.method public getControllerManager()Lcom/ironsource/sdk/controller/ControllerManager;
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    return-object v0
.end method

.method public getOfferWallCredits(Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V
    .locals 2

    .line 318
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$7;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$7;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public getOfferWallCredits(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V
    .locals 2

    .line 305
    iput-object p1, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mApplicationKey:Ljava/lang/String;

    .line 306
    iput-object p2, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mUserId:Ljava/lang/String;

    .line 307
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$6;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$6;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public handleOnPause(Landroid/app/Activity;)V
    .locals 4

    .line 915
    :try_start_0
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    invoke-virtual {v0}, Lcom/ironsource/sdk/controller/ControllerManager;->enterBackground()V

    .line 918
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/controller/ControllerManager;->unregisterConnectionReceiver(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 921
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 922
    new-instance v0, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;

    invoke-direct {v0}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;-><init>()V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https://www.supersonicads.com/mobile/sdk5/log?method="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object p1

    const/4 v3, 0x0

    aget-object p1, p1, v3

    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v3

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :goto_0
    return-void
.end method

.method public handleOnResume(Landroid/app/Activity;)V
    .locals 1

    .line 929
    sget-object v0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mutableContextWrapper:Landroid/content/MutableContextWrapper;

    invoke-virtual {v0, p1}, Landroid/content/MutableContextWrapper;->setBaseContext(Landroid/content/Context;)V

    .line 931
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    invoke-virtual {v0}, Lcom/ironsource/sdk/controller/ControllerManager;->enterForeground()V

    .line 934
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/controller/ControllerManager;->registerConnectionReceiver(Landroid/app/Activity;)V

    return-void
.end method

.method public initBanner(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnBannerListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ironsource/sdk/listeners/OnBannerListener;",
            ")V"
        }
    .end annotation

    .line 379
    iput-object p1, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mApplicationKey:Ljava/lang/String;

    .line 380
    iput-object p2, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mUserId:Ljava/lang/String;

    .line 381
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0, v1, p3, p4, p5}, Lcom/ironsource/sdk/controller/DemandSourceManager;->createDemandSource(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnAdProductListener;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p3

    .line 382
    iget-object p4, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance p5, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$11;

    invoke-direct {p5, p0, p1, p2, p3}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$11;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;)V

    invoke-virtual {p4, p5}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public initBanner(Ljava/lang/String;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnBannerListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ironsource/sdk/listeners/OnBannerListener;",
            ")V"
        }
    .end annotation

    .line 392
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/ironsource/sdk/controller/DemandSourceManager;->createDemandSource(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnAdProductListener;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p1

    .line 393
    iget-object p2, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance p3, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$12;

    invoke-direct {p3, p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$12;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Lcom/ironsource/sdk/data/DemandSource;)V

    invoke-virtual {p2, p3}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public initInterstitial(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnInterstitialListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ironsource/sdk/listeners/OnInterstitialListener;",
            ")V"
        }
    .end annotation

    .line 333
    iput-object p1, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mApplicationKey:Ljava/lang/String;

    .line 334
    iput-object p2, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mUserId:Ljava/lang/String;

    .line 335
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0, v1, p3, p4, p5}, Lcom/ironsource/sdk/controller/DemandSourceManager;->createDemandSource(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnAdProductListener;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p3

    .line 336
    iget-object p4, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance p5, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$8;

    invoke-direct {p5, p0, p1, p2, p3}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$8;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;)V

    invoke-virtual {p4, p5}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

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

    .line 260
    iput-object p1, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mApplicationKey:Ljava/lang/String;

    .line 261
    iput-object p2, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mUserId:Ljava/lang/String;

    .line 262
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance v7, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$3;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$3;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V

    invoke-virtual {v0, v7}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public initOfferWall(Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ironsource/sdk/listeners/OnOfferWallListener;",
            ")V"
        }
    .end annotation

    .line 279
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$4;

    invoke-direct {v1, p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$4;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public initRewardedVideo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;",
            ")V"
        }
    .end annotation

    .line 218
    iput-object p1, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mApplicationKey:Ljava/lang/String;

    .line 219
    iput-object p2, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mUserId:Ljava/lang/String;

    .line 221
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    .line 222
    invoke-virtual {v0, v1, p3, p4, p5}, Lcom/ironsource/sdk/controller/DemandSourceManager;->createDemandSource(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnAdProductListener;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p3

    .line 229
    iget-object p4, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance p5, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$1;

    invoke-direct {p5, p0, p1, p2, p3}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$1;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;)V

    invoke-virtual {p4, p5}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public isAdAvailable(Lcom/ironsource/sdk/IronSourceAdInstance;)Z
    .locals 2

    .line 894
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "isAdAvailable "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IronSourceAdsPublisherAgent"

    invoke-static {v1, v0}, Lcom/ironsource/sdk/utils/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 896
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/ironsource/sdk/controller/DemandSourceManager;->getDemandSourceById(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 900
    :cond_0
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/DemandSource;->getAvailabilityState()Z

    move-result p1

    return p1
.end method

.method public isInterstitialAdAvailable(Ljava/lang/String;)Z
    .locals 1

    .line 364
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/controller/ControllerManager;->isInterstitialAdAvailable(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public loadAd(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ironsource/sdk/IronSourceAdInstance;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 788
    new-instance v0, Lcom/ironsource/sdk/Events/ISNEventParams;

    invoke-direct {v0}, Lcom/ironsource/sdk/Events/ISNEventParams;-><init>()V

    .line 790
    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->isInAppBidding()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "isbiddinginstance"

    invoke-virtual {v0, v2, v1}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object v1

    .line 791
    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "demandsourcename"

    invoke-virtual {v1, v3, v2}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object v1

    .line 792
    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->isRewarded()Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    goto :goto_0

    :cond_0
    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    :goto_0
    const-string v3, "producttype"

    invoke-virtual {v1, v3, v2}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    .line 793
    sget-object v1, Lcom/ironsource/sdk/Events/SDK5Events;->loadAd:Lcom/ironsource/sdk/Events/SDK5Events$Event;

    invoke-virtual {v0}, Lcom/ironsource/sdk/Events/ISNEventParams;->getData()Ljava/util/HashMap;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/ironsource/sdk/Events/ISNEventsTracker;->logEvent(Lcom/ironsource/sdk/Events/SDK5Events$Event;Ljava/util/Map;)V

    .line 795
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "loadAd "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IronSourceAdsPublisherAgent"

    invoke-static {v1, v0}, Lcom/ironsource/sdk/utils/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 796
    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->isInAppBidding()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 797
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->loadInAppBiddingAd(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V

    goto :goto_1

    .line 799
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->loadInstance(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V

    :goto_1
    return-void
.end method

.method public loadBanner(Lorg/json/JSONObject;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 404
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$13;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$13;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public loadInterstitial(Lorg/json/JSONObject;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    const-string v0, "demandSourceName"

    .line 350
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 351
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 354
    :cond_1
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$9;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$9;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onAdProductClick(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)V
    .locals 1

    .line 569
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p2

    if-eqz p2, :cond_2

    .line 571
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v0, :cond_0

    .line 572
    invoke-direct {p0, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsRVListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 574
    invoke-interface {p1}, Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;->onRVAdClicked()V

    goto :goto_0

    .line 576
    :cond_0
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v0, :cond_1

    .line 577
    invoke-direct {p0, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsISListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnInterstitialListener;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 579
    invoke-interface {p1}, Lcom/ironsource/sdk/listeners/OnInterstitialListener;->onInterstitialClick()V

    goto :goto_0

    .line 581
    :cond_1
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v0, :cond_2

    .line 582
    invoke-direct {p0, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsBNListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnBannerListener;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 584
    invoke-interface {p1}, Lcom/ironsource/sdk/listeners/OnBannerListener;->onBannerClick()V

    :cond_2
    :goto_0
    return-void
.end method

.method public onAdProductClose(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)V
    .locals 1

    .line 540
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 542
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v0, :cond_0

    .line 543
    invoke-direct {p0, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsRVListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 545
    invoke-interface {p1}, Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;->onRVAdClosed()V

    goto :goto_0

    .line 547
    :cond_0
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v0, :cond_1

    .line 548
    invoke-direct {p0, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsISListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnInterstitialListener;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 550
    invoke-interface {p1}, Lcom/ironsource/sdk/listeners/OnInterstitialListener;->onInterstitialClose()V

    :cond_1
    :goto_0
    return-void
.end method

.method public onAdProductEventNotificationReceived(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 3

    .line 594
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 597
    :try_start_0
    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v2, "demandSourceName"

    if-ne p1, v1, :cond_0

    .line 598
    :try_start_1
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsISListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnInterstitialListener;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 600
    invoke-virtual {p4, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 601
    invoke-interface {p1, p3, p4}, Lcom/ironsource/sdk/listeners/OnInterstitialListener;->onInterstitialEventNotificationReceived(Ljava/lang/String;Lorg/json/JSONObject;)V

    goto :goto_0

    .line 603
    :cond_0
    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v1, :cond_1

    .line 604
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsRVListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 606
    invoke-virtual {p4, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 607
    invoke-interface {p1, p3, p4}, Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;->onRVEventNotificationReceived(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 611
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :cond_1
    :goto_0
    return-void
.end method

.method public onAdProductInitFailed(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 483
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object v0

    .line 485
    new-instance v1, Lcom/ironsource/sdk/Events/ISNEventParams;

    invoke-direct {v1}, Lcom/ironsource/sdk/Events/ISNEventParams;-><init>()V

    const-string v2, "demandsourcename"

    .line 486
    invoke-virtual {v1, v2, p2}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object p2

    const-string v1, "producttype"

    .line 487
    invoke-virtual {p2, v1, p1}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object p2

    const-string v1, "callfailreason"

    .line 488
    invoke-virtual {p2, v1, p3}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object p2

    if-eqz v0, :cond_2

    .line 491
    invoke-static {v0}, Lcom/ironsource/sdk/Events/ISNEventsUtils;->getIsBiddingInstance(Lcom/ironsource/sdk/data/DemandSource;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "isbiddinginstance"

    invoke-virtual {p2, v2, v1}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    const/4 v1, 0x3

    .line 493
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/DemandSource;->setDemandSourceInitState(I)V

    .line 495
    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v1, :cond_0

    .line 496
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsRVListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 498
    invoke-interface {p1, p3}, Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;->onRVInitFail(Ljava/lang/String;)V

    goto :goto_0

    .line 500
    :cond_0
    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v1, :cond_1

    .line 501
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsISListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnInterstitialListener;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 503
    invoke-interface {p1, p3}, Lcom/ironsource/sdk/listeners/OnInterstitialListener;->onInterstitialInitFailed(Ljava/lang/String;)V

    goto :goto_0

    .line 505
    :cond_1
    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v1, :cond_2

    .line 506
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsBNListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnBannerListener;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 508
    invoke-interface {p1, p3}, Lcom/ironsource/sdk/listeners/OnBannerListener;->onBannerInitFailed(Ljava/lang/String;)V

    .line 513
    :cond_2
    :goto_0
    sget-object p1, Lcom/ironsource/sdk/Events/SDK5Events;->initProductFailed:Lcom/ironsource/sdk/Events/SDK5Events$Event;

    invoke-virtual {p2}, Lcom/ironsource/sdk/Events/ISNEventParams;->getData()Ljava/util/HashMap;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/ironsource/sdk/Events/ISNEventsTracker;->logEvent(Lcom/ironsource/sdk/Events/SDK5Events$Event;Ljava/util/Map;)V

    return-void
.end method

.method public onAdProductInitSuccess(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;Lcom/ironsource/sdk/data/AdUnitsReady;)V
    .locals 1

    .line 458
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p2

    if-eqz p2, :cond_2

    const/4 v0, 0x2

    .line 460
    invoke-virtual {p2, v0}, Lcom/ironsource/sdk/data/DemandSource;->setDemandSourceInitState(I)V

    .line 462
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v0, :cond_0

    .line 463
    invoke-direct {p0, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsRVListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 465
    invoke-interface {p1, p3}, Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;->onRVInitSuccess(Lcom/ironsource/sdk/data/AdUnitsReady;)V

    goto :goto_0

    .line 467
    :cond_0
    sget-object p3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, p3, :cond_1

    .line 468
    invoke-direct {p0, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsISListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnInterstitialListener;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 470
    invoke-interface {p1}, Lcom/ironsource/sdk/listeners/OnInterstitialListener;->onInterstitialInitSuccess()V

    goto :goto_0

    .line 472
    :cond_1
    sget-object p3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, p3, :cond_2

    .line 473
    invoke-direct {p0, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsBNListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnBannerListener;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 475
    invoke-interface {p1}, Lcom/ironsource/sdk/listeners/OnBannerListener;->onBannerInitSuccess()V

    :cond_2
    :goto_0
    return-void
.end method

.method public onAdProductOpen(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)V
    .locals 1

    .line 618
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 620
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v0, :cond_0

    .line 621
    invoke-direct {p0, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsISListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnInterstitialListener;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 623
    invoke-interface {p1}, Lcom/ironsource/sdk/listeners/OnInterstitialListener;->onInterstitialOpen()V

    goto :goto_0

    .line 625
    :cond_0
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v0, :cond_1

    .line 626
    invoke-direct {p0, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsRVListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 628
    invoke-interface {p1}, Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;->onRVAdOpened()V

    :cond_1
    :goto_0
    return-void
.end method

.method public onBannerLoadFail(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 777
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 779
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsBNListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnBannerListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 781
    invoke-interface {p1, p2}, Lcom/ironsource/sdk/listeners/OnBannerListener;->onBannerLoadFail(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onBannerLoadSuccess(Ljava/lang/String;)V
    .locals 1

    .line 766
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 768
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsBNListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnBannerListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 770
    invoke-interface {p1}, Lcom/ironsource/sdk/listeners/OnBannerListener;->onBannerLoadSuccess()V

    :cond_0
    return-void
.end method

.method public onInterstitialAdRewarded(Ljava/lang/String;I)V
    .locals 2

    .line 700
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object v0

    .line 701
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsISListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnInterstitialListener;

    move-result-object v1

    if-eqz v0, :cond_1

    if-nez v1, :cond_0

    goto :goto_0

    .line 707
    :cond_0
    invoke-interface {v1, p1, p2}, Lcom/ironsource/sdk/listeners/OnInterstitialListener;->onInterstitialAdRewarded(Ljava/lang/String;I)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onInterstitialLoadFailed(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 656
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object v0

    .line 658
    new-instance v1, Lcom/ironsource/sdk/Events/ISNEventParams;

    invoke-direct {v1}, Lcom/ironsource/sdk/Events/ISNEventParams;-><init>()V

    const-string v2, "callfailreason"

    .line 659
    invoke-virtual {v1, v2, p2}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object v2

    const-string v3, "demandsourcename"

    .line 660
    invoke-virtual {v2, v3, p1}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    if-eqz v0, :cond_1

    .line 663
    sget-object p1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/Events/ISNEventsUtils;->getProductType(Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    move-result-object p1

    const-string v2, "producttype"

    invoke-virtual {v1, v2, p1}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object p1

    .line 664
    invoke-virtual {v0}, Lcom/ironsource/sdk/data/DemandSource;->getDemandSourceInitState()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    sget-object v2, Lcom/ironsource/sdk/constants/Events;->INTIALIZED:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    sget-object v2, Lcom/ironsource/sdk/constants/Events;->UNINTIALIZED:Ljava/lang/Object;

    :goto_0
    const-string v3, "generalmessage"

    invoke-virtual {p1, v3, v2}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object p1

    .line 665
    invoke-static {v0}, Lcom/ironsource/sdk/Events/ISNEventsUtils;->getIsBiddingInstance(Lcom/ironsource/sdk/data/DemandSource;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "isbiddinginstance"

    invoke-virtual {p1, v3, v2}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    .line 667
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsISListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnInterstitialListener;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 669
    invoke-interface {p1, p2}, Lcom/ironsource/sdk/listeners/OnInterstitialListener;->onInterstitialLoadFailed(Ljava/lang/String;)V

    .line 673
    :cond_1
    sget-object p1, Lcom/ironsource/sdk/Events/SDK5Events;->loadAdFailed:Lcom/ironsource/sdk/Events/SDK5Events$Event;

    invoke-virtual {v1}, Lcom/ironsource/sdk/Events/ISNEventParams;->getData()Ljava/util/HashMap;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/ironsource/sdk/Events/ISNEventsTracker;->logEvent(Lcom/ironsource/sdk/Events/SDK5Events$Event;Ljava/util/Map;)V

    return-void
.end method

.method public onInterstitialLoadSuccess(Ljava/lang/String;)V
    .locals 4

    .line 637
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object v0

    .line 638
    new-instance v1, Lcom/ironsource/sdk/Events/ISNEventParams;

    invoke-direct {v1}, Lcom/ironsource/sdk/Events/ISNEventParams;-><init>()V

    const-string v2, "demandsourcename"

    .line 639
    invoke-virtual {v1, v2, p1}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object p1

    if-eqz v0, :cond_0

    .line 642
    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-static {v0, v1}, Lcom/ironsource/sdk/Events/ISNEventsUtils;->getProductType(Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    move-result-object v1

    const-string v2, "producttype"

    invoke-virtual {p1, v2, v1}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object v1

    .line 643
    invoke-static {v0}, Lcom/ironsource/sdk/Events/ISNEventsUtils;->getIsBiddingInstance(Lcom/ironsource/sdk/data/DemandSource;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "isbiddinginstance"

    invoke-virtual {v1, v3, v2}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    .line 645
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsISListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnInterstitialListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 647
    invoke-interface {v0}, Lcom/ironsource/sdk/listeners/OnInterstitialListener;->onInterstitialLoadSuccess()V

    .line 651
    :cond_0
    sget-object v0, Lcom/ironsource/sdk/Events/SDK5Events;->loadAdSuccess:Lcom/ironsource/sdk/Events/SDK5Events$Event;

    invoke-virtual {p1}, Lcom/ironsource/sdk/Events/ISNEventParams;->getData()Ljava/util/HashMap;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ironsource/sdk/Events/ISNEventsTracker;->logEvent(Lcom/ironsource/sdk/Events/SDK5Events$Event;Ljava/util/Map;)V

    return-void
.end method

.method public onInterstitialShowFailed(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 689
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 691
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsISListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnInterstitialListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 693
    invoke-interface {p1, p2}, Lcom/ironsource/sdk/listeners/OnInterstitialListener;->onInterstitialShowFailed(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onInterstitialShowSuccess(Ljava/lang/String;)V
    .locals 1

    .line 678
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 680
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsISListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnInterstitialListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 682
    invoke-interface {p1}, Lcom/ironsource/sdk/listeners/OnInterstitialListener;->onInterstitialShowSuccess()V

    :cond_0
    return-void
.end method

.method public onPause(Landroid/app/Activity;)V
    .locals 1

    .line 429
    iget-boolean v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mEnableLifeCycleListeners:Z

    if-eqz v0, :cond_0

    return-void

    .line 433
    :cond_0
    invoke-virtual {p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->handleOnPause(Landroid/app/Activity;)V

    return-void
.end method

.method public onRVAdCredited(Ljava/lang/String;I)V
    .locals 1

    .line 529
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 531
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsRVListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 533
    invoke-interface {p1, p2}, Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;->onRVAdCredited(I)V

    :cond_0
    return-void
.end method

.method public onRVNoMoreOffers(Ljava/lang/String;)V
    .locals 1

    .line 518
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 520
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsRVListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 522
    invoke-interface {p1}, Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;->onRVNoMoreOffers()V

    :cond_0
    return-void
.end method

.method public onRVShowFail(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 558
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getDemandSourceByName(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 560
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getAdProductListenerAsRVListener(Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 562
    invoke-interface {p1, p2}, Lcom/ironsource/sdk/listeners/OnRewardedVideoListener;->onRVShowFail(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onResume(Landroid/app/Activity;)V
    .locals 1

    .line 419
    iget-boolean v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mEnableLifeCycleListeners:Z

    if-eqz v0, :cond_0

    return-void

    .line 423
    :cond_0
    invoke-virtual {p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->handleOnResume(Landroid/app/Activity;)V

    return-void
.end method

.method public release(Landroid/app/Activity;)V
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    const-string v1, "IronSourceAdsPublisherAgent"

    const-string v2, "release()"

    .line 439
    invoke-static {v1, v2}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 441
    invoke-static {}, Lcom/ironsource/sdk/utils/DeviceProperties;->release()V

    .line 442
    iget-object v1, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    invoke-virtual {v1, p1}, Lcom/ironsource/sdk/controller/ControllerManager;->unregisterConnectionReceiver(Landroid/app/Activity;)V

    .line 443
    iget-object p1, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    invoke-virtual {p1}, Lcom/ironsource/sdk/controller/ControllerManager;->destroy()V

    .line 444
    iput-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 450
    :catch_0
    sput-object v0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->sInstance:Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;

    return-void
.end method

.method public setMediationState(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1

    .line 718
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 719
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 720
    invoke-static {p1}, Lcom/ironsource/sdk/utils/SDKUtils;->getProductType(Ljava/lang/String;)Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 722
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    invoke-virtual {v0, p1, p2}, Lcom/ironsource/sdk/controller/DemandSourceManager;->getDemandSourceById(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 724
    invoke-virtual {p1, p3}, Lcom/ironsource/sdk/data/DemandSource;->setMediationState(I)V

    :cond_0
    return-void
.end method

.method public showAd(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ironsource/sdk/IronSourceAdInstance;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 878
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "showAd "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IronSourceAdsPublisherAgent"

    invoke-static {v1, v0}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 879
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {p1}, Lcom/ironsource/sdk/IronSourceAdInstance;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/ironsource/sdk/controller/DemandSourceManager;->getDemandSourceById(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 884
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$17;

    invoke-direct {v1, p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$17;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Lcom/ironsource/sdk/data/DemandSource;Ljava/util/Map;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public showInterstitial(Lorg/json/JSONObject;)V
    .locals 2

    .line 369
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$10;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$10;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

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

    .line 294
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$5;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$5;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Ljava/util/Map;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public showRewardedVideo(Lorg/json/JSONObject;)V
    .locals 2

    .line 244
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$2;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$2;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method

.method public updateConsentInfo(Lorg/json/JSONObject;)V
    .locals 2

    .line 732
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->updateConsentInToken(Lorg/json/JSONObject;)V

    .line 733
    iget-object v0, p0, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->mControllerManager:Lcom/ironsource/sdk/controller/ControllerManager;

    new-instance v1, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$14;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent$14;-><init>(Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/ControllerManager;->executeCommand(Ljava/lang/Runnable;)V

    return-void
.end method
