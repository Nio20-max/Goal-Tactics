.class Lcom/ironsource/mediationsdk/ProgIsManager;
.super Lcom/ironsource/mediationsdk/BaseProgManager;
.source "ProgIsManager.java"

# interfaces
.implements Lcom/ironsource/mediationsdk/ProgIsManagerListener;
.implements Lcom/ironsource/mediationsdk/AuctionEventListener;
.implements Lcom/ironsource/mediationsdk/IProgManager;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;
    }
.end annotation


# instance fields
.field private mAdvancedLoading:Z

.field private mAuctionFallback:Ljava/lang/String;

.field private mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

.field private mAuctionHistory:Lcom/ironsource/mediationsdk/AuctionHistory;

.field private mAuctionTrial:I

.field private mCurrentAuctionId:Ljava/lang/String;

.field private mCurrentPlacement:Ljava/lang/String;

.field private mGenericNotifications:Lcom/ironsource/mediationsdk/AuctionResponseItem;

.field private mInitMangerTime:J

.field private mIsAuctionEnabled:Z

.field private mLoadStartTime:J

.field private mMaxSmashesToLoad:I

.field private mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

.field mShouldTrackNetworkState:Z

.field private final mSmashes:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/ironsource/mediationsdk/ProgIsSmash;",
            ">;"
        }
    .end annotation
.end field

.field private mState:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

.field private mTimeToWaitBeforeFirstAction:J

.field private mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/ironsource/mediationsdk/ProgIsSmash;",
            ">;"
        }
    .end annotation
.end field

.field private mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;",
            ">;"
        }
    .end annotation
.end field

.field private mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/ironsource/mediationsdk/AuctionResponseItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/ironsource/mediationsdk/model/InterstitialConfigurations;Ljava/lang/String;Ljava/lang/String;ILcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ironsource/mediationsdk/model/ProviderSettings;",
            ">;",
            "Lcom/ironsource/mediationsdk/model/InterstitialConfigurations;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;",
            ")V"
        }
    .end annotation

    move-object/from16 v7, p0

    move-object/from16 v0, p6

    .line 67
    invoke-direct {v7, v0}, Lcom/ironsource/mediationsdk/BaseProgManager;-><init>(Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;)V

    const-string v0, ""

    .line 62
    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionFallback:Ljava/lang/String;

    const/4 v8, 0x0

    .line 63
    iput-boolean v8, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mShouldTrackNetworkState:Z

    .line 68
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    const v1, 0x14188

    .line 69
    invoke-direct {v7, v1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I)V

    .line 70
    sget-object v1, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_NOT_INITIALIZED:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    invoke-direct {v7, v1}, Lcom/ironsource/mediationsdk/ProgIsManager;->setState(Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;)V

    .line 71
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 72
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v1, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 73
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    .line 74
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    .line 75
    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentPlacement:Ljava/lang/String;

    .line 76
    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentAuctionId:Ljava/lang/String;

    .line 78
    invoke-virtual/range {p2 .. p2}, Lcom/ironsource/mediationsdk/model/InterstitialConfigurations;->getInterstitialAdaptersSmartLoadAmount()I

    move-result v0

    iput v0, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mMaxSmashesToLoad:I

    .line 79
    invoke-virtual/range {p2 .. p2}, Lcom/ironsource/mediationsdk/model/InterstitialConfigurations;->getInterstitialAdvancedLoading()Z

    move-result v0

    iput-boolean v0, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mAdvancedLoading:Z

    .line 81
    invoke-static {}, Lcom/ironsource/mediationsdk/CallbackThrottler;->getInstance()Lcom/ironsource/mediationsdk/CallbackThrottler;

    move-result-object v0

    move/from16 v1, p5

    invoke-virtual {v0, v1}, Lcom/ironsource/mediationsdk/CallbackThrottler;->setDelayLoadFailureNotificationInSeconds(I)V

    .line 83
    invoke-virtual/range {p2 .. p2}, Lcom/ironsource/mediationsdk/model/InterstitialConfigurations;->getInterstitialAuctionSettings()Lcom/ironsource/mediationsdk/utils/AuctionSettings;

    move-result-object v11

    .line 84
    invoke-virtual {v11}, Lcom/ironsource/mediationsdk/utils/AuctionSettings;->getTimeToWaitBeforeFirstAuctionMs()J

    move-result-wide v0

    iput-wide v0, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mTimeToWaitBeforeFirstAction:J

    .line 85
    invoke-virtual {v11}, Lcom/ironsource/mediationsdk/utils/AuctionSettings;->getNumOfMaxTrials()I

    move-result v0

    const/4 v12, 0x1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mIsAuctionEnabled:Z

    if-eqz v0, :cond_1

    .line 88
    new-instance v0, Lcom/ironsource/mediationsdk/AuctionHandler;

    const-string v1, "interstitial"

    invoke-direct {v0, v1, v11, v7}, Lcom/ironsource/mediationsdk/AuctionHandler;-><init>(Ljava/lang/String;Lcom/ironsource/mediationsdk/utils/AuctionSettings;Lcom/ironsource/mediationsdk/AuctionEventListener;)V

    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

    .line 91
    :cond_1
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 93
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_2
    :goto_1
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/ironsource/mediationsdk/model/ProviderSettings;

    .line 94
    invoke-static {}, Lcom/ironsource/mediationsdk/AdapterRepository;->getInstance()Lcom/ironsource/mediationsdk/AdapterRepository;

    move-result-object v0

    invoke-virtual {v3}, Lcom/ironsource/mediationsdk/model/ProviderSettings;->getInterstitialSettings()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Lcom/ironsource/mediationsdk/AdapterRepository;->getAdapter(Lcom/ironsource/mediationsdk/model/ProviderSettings;Lorg/json/JSONObject;)Lcom/ironsource/mediationsdk/AbstractAdapter;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 95
    invoke-static {}, Lcom/ironsource/mediationsdk/AdaptersCompatibilityHandler;->getInstance()Lcom/ironsource/mediationsdk/AdaptersCompatibilityHandler;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/ironsource/mediationsdk/AdaptersCompatibilityHandler;->isAdapterVersionISCompatible(Lcom/ironsource/mediationsdk/AbstractAdapter;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 96
    new-instance v15, Lcom/ironsource/mediationsdk/ProgIsSmash;

    invoke-virtual/range {p2 .. p2}, Lcom/ironsource/mediationsdk/model/InterstitialConfigurations;->getInterstitialAdaptersSmartLoadTimeout()I

    move-result v5

    move-object v0, v15

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v4, p0

    invoke-direct/range {v0 .. v6}, Lcom/ironsource/mediationsdk/ProgIsSmash;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/mediationsdk/model/ProviderSettings;Lcom/ironsource/mediationsdk/ProgIsManagerListener;ILcom/ironsource/mediationsdk/AbstractAdapter;)V

    .line 97
    invoke-virtual {v15}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v0

    .line 98
    iget-object v1, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0, v15}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 103
    :cond_3
    new-instance v0, Lcom/ironsource/mediationsdk/AuctionHistory;

    invoke-virtual {v11}, Lcom/ironsource/mediationsdk/utils/AuctionSettings;->getAuctionSavedHistoryLimit()I

    move-result v1

    invoke-direct {v0, v13, v1}, Lcom/ironsource/mediationsdk/AuctionHistory;-><init>(Ljava/util/List;I)V

    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionHistory:Lcom/ironsource/mediationsdk/AuctionHistory;

    .line 104
    new-instance v0, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {v0, v1}, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;-><init>(Ljava/util/List;)V

    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    .line 106
    iget-object v0, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ironsource/mediationsdk/ProgIsSmash;

    .line 107
    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->isBidder()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 108
    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->initForBidding()V

    goto :goto_2

    .line 112
    :cond_5
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, v7, Lcom/ironsource/mediationsdk/ProgIsManager;->mInitMangerTime:J

    .line 113
    sget-object v0, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_READY_TO_LOAD:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    invoke-direct {v7, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->setState(Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;)V

    .line 114
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    sub-long/2addr v0, v9

    const v2, 0x14189

    new-array v3, v12, [[Ljava/lang/Object;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "duration"

    aput-object v5, v4, v8

    .line 115
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v4, v12

    aput-object v4, v3, v8

    invoke-direct {v7, v2, v3}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$002(Lcom/ironsource/mediationsdk/ProgIsManager;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentAuctionId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lcom/ironsource/mediationsdk/ProgIsManager;)J
    .locals 2

    .line 43
    iget-wide v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mInitMangerTime:J

    return-wide v0
.end method

.method static synthetic access$1000(Lcom/ironsource/mediationsdk/ProgIsManager;)Lcom/ironsource/mediationsdk/AuctionHistory;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionHistory:Lcom/ironsource/mediationsdk/AuctionHistory;

    return-object p0
.end method

.method static synthetic access$200(Lcom/ironsource/mediationsdk/ProgIsManager;)J
    .locals 2

    .line 43
    iget-wide v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mTimeToWaitBeforeFirstAction:J

    return-wide v0
.end method

.method static synthetic access$300(Lcom/ironsource/mediationsdk/ProgIsManager;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgIsManager;->makeAuction()V

    return-void
.end method

.method static synthetic access$400(Lcom/ironsource/mediationsdk/ProgIsManager;I[[Ljava/lang/Object;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1, p2}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$500(Lcom/ironsource/mediationsdk/ProgIsManager;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

    return-object p0
.end method

.method static synthetic access$600(Lcom/ironsource/mediationsdk/ProgIsManager;)Lcom/ironsource/mediationsdk/utils/SessionCappingManager;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    return-object p0
.end method

.method static synthetic access$700(Lcom/ironsource/mediationsdk/ProgIsManager;Ljava/lang/String;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->logInternal(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Lcom/ironsource/mediationsdk/ProgIsManager;Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->setState(Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;)V

    return-void
.end method

.method static synthetic access$900(Lcom/ironsource/mediationsdk/ProgIsManager;)Lcom/ironsource/mediationsdk/AuctionHandler;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

    return-object p0
.end method

.method private extractNonBidderProvidersFromWaterfall()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ironsource/mediationsdk/AuctionResponseItem;",
            ">;"
        }
    .end annotation

    .line 220
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 221
    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ironsource/mediationsdk/ProgIsSmash;

    .line 222
    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/ProgIsSmash;->isBidder()Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    invoke-virtual {v3, v2}, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;->isCapped(Lcom/ironsource/mediationsdk/ProgSmash;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 226
    :cond_1
    new-instance v3, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lcom/ironsource/mediationsdk/AuctionResponseItem;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private getAsString(Lcom/ironsource/mediationsdk/AuctionResponseItem;)Ljava/lang/String;
    .locals 2

    .line 234
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ironsource/mediationsdk/ProgIsSmash;

    if-eqz v0, :cond_0

    .line 238
    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceType()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 241
    :cond_0
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getServerData()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "1"

    goto :goto_0

    :cond_1
    const-string v0, "2"

    .line 244
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getInstanceName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private loadSmash(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 2

    .line 285
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getServerData()Ljava/lang/String;

    move-result-object v0

    .line 286
    invoke-virtual {p1, v0}, Lcom/ironsource/mediationsdk/ProgIsSmash;->setDynamicDemandSourceIdByServerData(Ljava/lang/String;)V

    const/16 v1, 0x7d2

    .line 287
    invoke-direct {p0, v1, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/ProgIsSmash;)V

    .line 288
    invoke-virtual {p1, v0}, Lcom/ironsource/mediationsdk/ProgIsSmash;->loadInterstitial(Ljava/lang/String;)V

    return-void
.end method

.method private loadSmashes()V
    .locals 8

    .line 294
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 295
    sget-object v0, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_READY_TO_LOAD:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->setState(Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;)V

    const/16 v0, 0x83e

    const/4 v2, 0x2

    new-array v3, v2, [[Ljava/lang/Object;

    new-array v4, v2, [Ljava/lang/Object;

    const-string v5, "errorCode"

    aput-object v5, v4, v1

    const/16 v5, 0x40b

    .line 296
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v4, v7

    aput-object v4, v3, v1

    new-array v2, v2, [Ljava/lang/Object;

    const-string v4, "reason"

    aput-object v4, v2, v1

    const-string v1, "Empty waterfall"

    aput-object v1, v2, v7

    aput-object v2, v3, v7

    invoke-direct {p0, v0, v3}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 297
    invoke-static {}, Lcom/ironsource/mediationsdk/CallbackThrottler;->getInstance()Lcom/ironsource/mediationsdk/CallbackThrottler;

    move-result-object v0

    new-instance v2, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    invoke-direct {v2, v5, v1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/ironsource/mediationsdk/CallbackThrottler;->onInterstitialAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    return-void

    .line 301
    :cond_0
    sget-object v0, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_LOADING_SMASHES:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->setState(Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;)V

    const/4 v0, 0x0

    .line 304
    :goto_0
    iget-object v2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_4

    iget v2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mMaxSmashesToLoad:I

    if-ge v0, v2, :cond_4

    .line 305
    iget-object v2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ironsource/mediationsdk/ProgIsSmash;

    .line 307
    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getIsLoadCandidate()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 309
    iget-boolean v3, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mAdvancedLoading:Z

    if-eqz v3, :cond_2

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/ProgIsSmash;->isBidder()Z

    move-result v3

    if-eqz v3, :cond_2

    if-nez v0, :cond_1

    .line 315
    invoke-direct {p0, v2}, Lcom/ironsource/mediationsdk/ProgIsManager;->loadSmash(Lcom/ironsource/mediationsdk/ProgIsSmash;)V

    goto :goto_1

    .line 318
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Advanced Loading: Won\'t start loading bidder "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " as a non bidder is being loaded"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->logInternal(Ljava/lang/String;)V

    goto :goto_1

    .line 324
    :cond_2
    invoke-direct {p0, v2}, Lcom/ironsource/mediationsdk/ProgIsManager;->loadSmash(Lcom/ironsource/mediationsdk/ProgIsSmash;)V

    add-int/lit8 v0, v0, 0x1

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    :goto_1
    return-void
.end method

.method private logAPIError(Ljava/lang/String;)V
    .locals 3

    .line 683
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->API:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const/4 v2, 0x3

    invoke-virtual {v0, v1, p1, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private logInternal(Ljava/lang/String;)V
    .locals 4

    .line 689
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ProgIsManager "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private logSmashCallback(Lcom/ironsource/mediationsdk/ProgIsSmash;Ljava/lang/String;)V
    .locals 2

    .line 675
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ProgIsManager "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " : "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 676
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object p2

    sget-object v0, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private makeAuction()V
    .locals 1

    .line 122
    sget-object v0, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_AUCTION:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->setState(Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;)V

    .line 123
    new-instance v0, Lcom/ironsource/mediationsdk/ProgIsManager$1;

    invoke-direct {v0, p0}, Lcom/ironsource/mediationsdk/ProgIsManager$1;-><init>(Lcom/ironsource/mediationsdk/ProgIsManager;)V

    invoke-static {v0}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private sendMediationEvent(I)V
    .locals 2

    const/4 v0, 0x0

    .line 695
    check-cast v0, [[Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;Z)V

    return-void
.end method

.method private sendMediationEvent(I[[Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x0

    .line 701
    invoke-direct {p0, p1, p2, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;Z)V

    return-void
.end method

.method private sendMediationEvent(I[[Ljava/lang/Object;Z)V
    .locals 6

    .line 719
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "provider"

    const-string v2, "Mediation"

    .line 720
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x1

    .line 721
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "programmatic"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 724
    iget-object v2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentAuctionId:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 725
    iget-object v2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentAuctionId:Ljava/lang/String;

    const-string v3, "auctionId"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    if-eqz p3, :cond_1

    .line 728
    iget-object p3, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_1

    .line 729
    iget-object p3, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentPlacement:Ljava/lang/String;

    const-string v2, "placement"

    invoke-interface {v0, v2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 732
    :cond_1
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->shouldAddAuctionParams(I)Z

    move-result p3

    if-eqz p3, :cond_2

    .line 733
    invoke-static {}, Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;->getInstance()Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;

    move-result-object p3

    iget v2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionTrial:I

    iget-object v3, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionFallback:Ljava/lang/String;

    invoke-virtual {p3, v0, v2, v3}, Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;->setEventAuctionParams(Ljava/util/Map;ILjava/lang/String;)V

    :cond_2
    if-eqz p2, :cond_3

    .line 738
    :try_start_0
    array-length p3, p2

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, p3, :cond_3

    aget-object v4, p2, v3

    .line 739
    aget-object v5, v4, v2

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    aget-object v4, v4, v1

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    move-exception p2

    .line 743
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sendMediationEvent "

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/ironsource/mediationsdk/ProgIsManager;->logInternal(Ljava/lang/String;)V

    .line 746
    :cond_3
    new-instance p2, Lcom/ironsource/eventsmodule/EventData;

    new-instance p3, Lorg/json/JSONObject;

    invoke-direct {p3, v0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-direct {p2, p1, p3}, Lcom/ironsource/eventsmodule/EventData;-><init>(ILorg/json/JSONObject;)V

    .line 747
    invoke-static {}, Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;->getInstance()Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;->log(Lcom/ironsource/eventsmodule/EventData;)V

    return-void
.end method

.method private sendMediationEventWithPlacement(I)V
    .locals 2

    const/4 v0, 0x0

    .line 713
    check-cast v0, [[Ljava/lang/Object;

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;Z)V

    return-void
.end method

.method private sendMediationEventWithPlacement(I[[Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x1

    .line 707
    invoke-direct {p0, p1, p2, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;Z)V

    return-void
.end method

.method private sendProviderEvent(ILcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 2

    const/4 v0, 0x0

    .line 769
    check-cast v0, [[Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/ProgIsSmash;[[Ljava/lang/Object;Z)V

    return-void
.end method

.method private sendProviderEvent(ILcom/ironsource/mediationsdk/ProgIsSmash;[[Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x0

    .line 775
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/ProgIsSmash;[[Ljava/lang/Object;Z)V

    return-void
.end method

.method private sendProviderEvent(ILcom/ironsource/mediationsdk/ProgIsSmash;[[Ljava/lang/Object;Z)V
    .locals 5

    .line 793
    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getProviderEventData()Ljava/util/Map;

    move-result-object p2

    .line 795
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentAuctionId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 796
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentAuctionId:Ljava/lang/String;

    const-string v1, "auctionId"

    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    if-eqz p4, :cond_1

    .line 799
    iget-object p4, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_1

    .line 800
    iget-object p4, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentPlacement:Ljava/lang/String;

    const-string v0, "placement"

    invoke-interface {p2, v0, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 803
    :cond_1
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->shouldAddAuctionParams(I)Z

    move-result p4

    if-eqz p4, :cond_2

    .line 804
    invoke-static {}, Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;->getInstance()Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;

    move-result-object p4

    iget v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionTrial:I

    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionFallback:Ljava/lang/String;

    invoke-virtual {p4, p2, v0, v1}, Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;->setEventAuctionParams(Ljava/util/Map;ILjava/lang/String;)V

    :cond_2
    if-eqz p3, :cond_3

    .line 809
    :try_start_0
    array-length p4, p3

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p4, :cond_3

    aget-object v2, p3, v1

    .line 810
    aget-object v3, v2, v0

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    aget-object v2, v2, v4

    invoke-interface {p2, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    move-exception p3

    .line 814
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object p4

    sget-object v0, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "IS sendProviderEvent "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p3}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const/4 v1, 0x3

    invoke-virtual {p4, v0, p3, v1}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 817
    :cond_3
    new-instance p3, Lcom/ironsource/eventsmodule/EventData;

    new-instance p4, Lorg/json/JSONObject;

    invoke-direct {p4, p2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-direct {p3, p1, p4}, Lcom/ironsource/eventsmodule/EventData;-><init>(ILorg/json/JSONObject;)V

    .line 818
    invoke-static {}, Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;->getInstance()Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;->log(Lcom/ironsource/eventsmodule/EventData;)V

    return-void
.end method

.method private sendProviderEventWithPlacement(ILcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 2

    const/4 v0, 0x0

    .line 787
    check-cast v0, [[Ljava/lang/Object;

    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/ProgIsSmash;[[Ljava/lang/Object;Z)V

    return-void
.end method

.method private sendProviderEventWithPlacement(ILcom/ironsource/mediationsdk/ProgIsSmash;[[Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x1

    .line 781
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/ProgIsSmash;[[Ljava/lang/Object;Z)V

    return-void
.end method

.method private setState(Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;)V
    .locals 2

    .line 668
    iput-object p1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mState:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    .line 669
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->logInternal(Ljava/lang/String;)V

    return-void
.end method

.method private shouldAddAuctionParams(I)Z
    .locals 1

    const/16 v0, 0x7d2

    if-eq p1, v0, :cond_1

    const/16 v0, 0x7d3

    if-eq p1, v0, :cond_1

    const/16 v0, 0x898

    if-eq p1, v0, :cond_1

    const/16 v0, 0x7d5

    if-eq p1, v0, :cond_1

    const/16 v0, 0x89c

    if-eq p1, v0, :cond_1

    const/16 v0, 0x899

    if-eq p1, v0, :cond_1

    const/16 v0, 0x89b

    if-eq p1, v0, :cond_1

    const/16 v0, 0x7d6

    if-eq p1, v0, :cond_1

    const/16 v0, 0x7d4

    if-eq p1, v0, :cond_1

    const/16 v0, 0x83e

    if-eq p1, v0, :cond_1

    const/16 v0, 0x8fd

    if-eq p1, v0, :cond_1

    const/16 v0, 0x8fc

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private showInterstitial(Lcom/ironsource/mediationsdk/ProgIsSmash;Ljava/lang/String;)V
    .locals 1

    .line 428
    sget-object v0, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_SHOWING:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->setState(Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;)V

    .line 429
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->showInterstitial()V

    const/16 v0, 0x899

    .line 430
    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEventWithPlacement(ILcom/ironsource/mediationsdk/ProgIsSmash;)V

    .line 432
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    invoke-virtual {v0, p1}, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;->increaseShowCounter(Lcom/ironsource/mediationsdk/ProgSmash;)V

    .line 433
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    invoke-virtual {v0, p1}, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;->isCapped(Lcom/ironsource/mediationsdk/ProgSmash;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 434
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->setCappedPerSession()V

    const/16 v0, 0x961

    .line 435
    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/ProgIsSmash;)V

    .line 436
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " was session capped"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->sendAutomationLog(Ljava/lang/String;)V

    .line 439
    :cond_0
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, p2}, Lcom/ironsource/mediationsdk/utils/CappingManager;->incrementIsShowCounter(Landroid/content/Context;Ljava/lang/String;)V

    .line 440
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, p2}, Lcom/ironsource/mediationsdk/utils/CappingManager;->isInterstitialPlacementCapped(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 p1, 0x960

    .line 441
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEventWithPlacement(I)V

    :cond_1
    return-void
.end method

.method private updateWaterfall(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ironsource/mediationsdk/AuctionResponseItem;",
            ">;)V"
        }
    .end annotation

    .line 250
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 251
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 252
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 253
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 254
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    .line 255
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, v1}, Lcom/ironsource/mediationsdk/ProgIsManager;->getAsString(Lcom/ironsource/mediationsdk/AuctionResponseItem;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    iget-object v3, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getInstanceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ironsource/mediationsdk/ProgIsSmash;

    if-eqz v3, :cond_0

    .line 258
    invoke-virtual {v3, v2}, Lcom/ironsource/mediationsdk/ProgIsSmash;->setIsLoadCandidate(Z)V

    .line 259
    iget-object v2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2, v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 260
    iget-object v2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    iget-object v2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;->ISAuctionPerformanceDidntAttemptToLoad:Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;

    invoke-virtual {v2, v1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 264
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateWaterfall() - could not find matching smash for auction response item "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ironsource/mediationsdk/ProgIsManager;->logInternal(Ljava/lang/String;)V

    goto :goto_0

    .line 268
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateWaterfall() - response waterfall is "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->logInternal(Ljava/lang/String;)V

    .line 270
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-nez p1, :cond_2

    const-string p1, "Updated waterfall is empty"

    .line 271
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->logInternal(Ljava/lang/String;)V

    :cond_2
    const/16 p1, 0x907

    new-array v1, v2, [[Ljava/lang/Object;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "ext1"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 274
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v2

    aput-object v3, v1, v5

    invoke-direct {p0, p1, v1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    return-void
.end method

.method private updateWaterfallToNonBidding()V
    .locals 1

    .line 213
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgIsManager;->extractNonBidderProvidersFromWaterfall()Ljava/util/List;

    move-result-object v0

    .line 214
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->updateWaterfall(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public declared-synchronized isInterstitialReady()Z
    .locals 3

    monitor-enter p0

    .line 448
    :try_start_0
    iget-boolean v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mShouldTrackNetworkState:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->isNetworkConnected(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mState:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    sget-object v2, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eq v0, v2, :cond_2

    .line 449
    :cond_1
    monitor-exit p0

    return v1

    .line 452
    :cond_2
    :try_start_1
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ironsource/mediationsdk/ProgIsSmash;

    .line 453
    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/ProgIsSmash;->isReadyToShow()Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_3

    const/4 v0, 0x1

    .line 454
    monitor-exit p0

    return v0

    .line 458
    :cond_4
    monitor-exit p0

    return v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized loadInterstitial()V
    .locals 4

    monitor-enter p0

    .line 334
    :try_start_0
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mState:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    sget-object v1, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_SHOWING:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    if-ne v0, v1, :cond_0

    const-string v0, "loadInterstitial: load cannot be invoked while showing an ad"

    .line 336
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v1

    sget-object v2, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->API:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const/4 v3, 0x3

    invoke-virtual {v1, v2, v0, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 337
    new-instance v1, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const/16 v2, 0x40d

    invoke-direct {v1, v2, v0}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 338
    invoke-static {}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/ISListenerWrapper;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->onInterstitialAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 339
    monitor-exit p0

    return-void

    .line 342
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mState:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    sget-object v1, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_READY_TO_LOAD:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mState:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    sget-object v1, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    if-ne v0, v1, :cond_2

    :cond_1
    invoke-static {}, Lcom/ironsource/mediationsdk/CallbackThrottler;->getInstance()Lcom/ironsource/mediationsdk/CallbackThrottler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/CallbackThrottler;->hasPendingInvocation()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    const-string v0, "loadInterstitial: load is already in progress"

    .line 343
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->logInternal(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 344
    monitor-exit p0

    return-void

    :cond_3
    :try_start_2
    const-string v0, ""

    .line 347
    iput-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentAuctionId:Ljava/lang/String;

    const-string v0, ""

    .line 348
    iput-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentPlacement:Ljava/lang/String;

    const/16 v0, 0x7d1

    .line 349
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I)V

    .line 350
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mLoadStartTime:J

    .line 352
    iget-boolean v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mIsAuctionEnabled:Z

    if-eqz v0, :cond_5

    .line 353
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 355
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionHistory:Lcom/ironsource/mediationsdk/AuctionHistory;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, v1}, Lcom/ironsource/mediationsdk/AuctionHistory;->storeWaterfallPerformance(Ljava/util/concurrent/ConcurrentHashMap;)V

    .line 356
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 359
    :cond_4
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgIsManager;->makeAuction()V

    goto :goto_0

    .line 361
    :cond_5
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgIsManager;->updateWaterfallToNonBidding()V

    .line 362
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgIsManager;->loadSmashes()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 364
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onAuctionFailed(ILjava/lang/String;ILjava/lang/String;J)V
    .locals 6

    const-string v0, "Auction failed | moving to fallback waterfall"

    .line 195
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->logInternal(Ljava/lang/String;)V

    .line 197
    iput p3, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionTrial:I

    .line 198
    iput-object p4, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionFallback:Ljava/lang/String;

    .line 199
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    const-string p4, "duration"

    const-string v0, "errorCode"

    const/16 v1, 0x8fc

    const/4 v2, 0x1

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-eqz p3, :cond_0

    new-array p2, v3, [[Ljava/lang/Object;

    new-array p3, v3, [Ljava/lang/Object;

    aput-object v0, p3, v4

    .line 200
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, p3, v2

    aput-object p3, p2, v4

    new-array p1, v3, [Ljava/lang/Object;

    aput-object p4, p1, v4

    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    aput-object p3, p1, v2

    aput-object p1, p2, v2

    invoke-direct {p0, v1, p2}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const/4 p3, 0x3

    new-array p3, p3, [[Ljava/lang/Object;

    new-array v5, v3, [Ljava/lang/Object;

    aput-object v0, v5, v4

    .line 202
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v5, v2

    aput-object v5, p3, v4

    new-array p1, v3, [Ljava/lang/Object;

    const-string v0, "reason"

    aput-object v0, p1, v4

    aput-object p2, p1, v2

    aput-object p1, p3, v2

    new-array p1, v3, [Ljava/lang/Object;

    aput-object p4, p1, v4

    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    aput-object p2, p1, v2

    aput-object p1, p3, v3

    invoke-direct {p0, v1, p3}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 205
    :goto_0
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgIsManager;->updateWaterfallToNonBidding()V

    .line 206
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgIsManager;->loadSmashes()V

    return-void
.end method

.method public onAuctionSuccess(Ljava/util/List;Ljava/lang/String;Lcom/ironsource/mediationsdk/AuctionResponseItem;IJ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ironsource/mediationsdk/AuctionResponseItem;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/ironsource/mediationsdk/AuctionResponseItem;",
            "IJ)V"
        }
    .end annotation

    .line 184
    iput-object p2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentAuctionId:Ljava/lang/String;

    .line 185
    iput-object p3, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mGenericNotifications:Lcom/ironsource/mediationsdk/AuctionResponseItem;

    .line 186
    iput p4, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionTrial:I

    const-string p2, ""

    .line 187
    iput-object p2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionFallback:Ljava/lang/String;

    const/4 p2, 0x1

    new-array p3, p2, [[Ljava/lang/Object;

    const/4 p4, 0x2

    new-array p4, p4, [Ljava/lang/Object;

    const-string v0, "duration"

    const/4 v1, 0x0

    aput-object v0, p4, v1

    .line 188
    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p5

    aput-object p5, p4, p2

    aput-object p4, p3, v1

    const/16 p2, 0x8fd

    invoke-direct {p0, p2, p3}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 189
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->updateWaterfall(Ljava/util/List;)V

    .line 190
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgIsManager;->loadSmashes()V

    return-void
.end method

.method public onInterstitialAdClicked(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 1

    const-string v0, "onInterstitialAdClicked"

    .line 643
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgIsSmash;Ljava/lang/String;)V

    .line 644
    invoke-static {}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/ISListenerWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->onInterstitialAdClicked()V

    const/16 v0, 0x7d6

    .line 645
    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEventWithPlacement(ILcom/ironsource/mediationsdk/ProgIsSmash;)V

    return-void
.end method

.method public onInterstitialAdClosed(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 8

    .line 602
    monitor-enter p0

    :try_start_0
    const-string v0, "onInterstitialAdClosed"

    .line 603
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgIsSmash;Ljava/lang/String;)V

    .line 606
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/SessionDepthManager;->getInstance()Lcom/ironsource/mediationsdk/utils/SessionDepthManager;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/ironsource/mediationsdk/utils/SessionDepthManager;->getSessionDepth(I)I

    move-result v0

    const/16 v2, 0x89c

    const/4 v3, 0x1

    new-array v4, v3, [[Ljava/lang/Object;

    new-array v5, v1, [Ljava/lang/Object;

    const-string v6, "sessionDepth"

    const/4 v7, 0x0

    aput-object v6, v5, v7

    .line 607
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v3

    aput-object v5, v4, v7

    invoke-direct {p0, v2, p1, v4}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEventWithPlacement(ILcom/ironsource/mediationsdk/ProgIsSmash;[[Ljava/lang/Object;)V

    .line 608
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/SessionDepthManager;->getInstance()Lcom/ironsource/mediationsdk/utils/SessionDepthManager;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/ironsource/mediationsdk/utils/SessionDepthManager;->increaseSessionDepth(I)V

    .line 610
    invoke-static {}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/ISListenerWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->onInterstitialAdClosed()V

    .line 611
    sget-object p1, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_READY_TO_LOAD:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->setState(Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;)V

    .line 612
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onInterstitialAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;J)V
    .locals 8

    .line 502
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 504
    monitor-enter p0

    .line 505
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onInterstitialAdLoadFailed error="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mState:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p2, v1}, Lcom/ironsource/mediationsdk/ProgIsManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgIsSmash;Ljava/lang/String;)V

    const/16 v1, 0x898

    const/4 v2, 0x3

    new-array v2, v2, [[Ljava/lang/Object;

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Object;

    const-string v5, "errorCode"

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 506
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v7, 0x1

    aput-object v5, v4, v7

    aput-object v4, v2, v6

    new-array v4, v3, [Ljava/lang/Object;

    const-string v5, "reason"

    aput-object v5, v4, v6

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v7

    aput-object v4, v2, v7

    new-array p1, v3, [Ljava/lang/Object;

    const-string v4, "duration"

    aput-object v4, p1, v6

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    aput-object p3, p1, v7

    aput-object p1, v2, v3

    invoke-direct {p0, v1, p2, v2}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/ProgIsSmash;[[Ljava/lang/Object;)V

    if-eqz p2, :cond_0

    .line 511
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 512
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p3

    sget-object p4, Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;->ISAuctionPerformanceFailedToLoad:Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;

    invoke-virtual {p1, p3, p4}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 518
    :cond_0
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 p3, 0x0

    const/4 p4, 0x0

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ironsource/mediationsdk/ProgIsSmash;

    .line 519
    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getIsLoadCandidate()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 520
    iget-boolean v2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mAdvancedLoading:Z

    if-eqz v2, :cond_4

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->isBidder()Z

    move-result v2

    if-eqz v2, :cond_4

    if-nez p3, :cond_2

    if-eqz p4, :cond_4

    :cond_2
    if-eqz p3, :cond_3

    const-string p1, "a non bidder is being loaded"

    goto :goto_1

    :cond_3
    const-string p1, "a non bidder was already loaded successfully"

    .line 528
    :goto_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Advanced Loading: Won\'t start loading bidder "

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " as "

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->logInternal(Ljava/lang/String;)V

    goto :goto_3

    .line 533
    :cond_4
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 535
    iget-boolean v2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mAdvancedLoading:Z

    if-eqz v2, :cond_7

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/ProgIsSmash;->isBidder()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->isBidder()Z

    move-result v1

    if-nez v1, :cond_7

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    iget v2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mMaxSmashesToLoad:I

    if-ge v1, v2, :cond_7

    :goto_2
    const/4 p3, 0x1

    goto :goto_0

    .line 547
    :cond_5
    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->isLoadingInProgress()Z

    move-result v2

    if-eqz v2, :cond_6

    goto :goto_2

    .line 550
    :cond_6
    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->isReadyToShow()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 p4, 0x1

    goto :goto_0

    .line 555
    :cond_7
    :goto_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    if-nez p1, :cond_8

    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mState:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    sget-object p2, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_LOADING_SMASHES:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    if-ne p1, p2, :cond_8

    if-nez p3, :cond_8

    .line 556
    invoke-static {}, Lcom/ironsource/mediationsdk/CallbackThrottler;->getInstance()Lcom/ironsource/mediationsdk/CallbackThrottler;

    move-result-object p1

    new-instance p2, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const-string p3, "No ads to show"

    const/16 p4, 0x1fd

    invoke-direct {p2, p4, p3}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    invoke-virtual {p1, p2}, Lcom/ironsource/mediationsdk/CallbackThrottler;->onInterstitialAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    const/16 p1, 0x83e

    new-array p2, v7, [[Ljava/lang/Object;

    new-array p3, v3, [Ljava/lang/Object;

    const-string v1, "errorCode"

    aput-object v1, p3, v6

    .line 557
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    aput-object p4, p3, v7

    aput-object p3, p2, v6

    invoke-direct {p0, p1, p2}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 558
    sget-object p1, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_READY_TO_LOAD:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->setState(Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;)V

    .line 560
    :cond_8
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 563
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_9

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/ironsource/mediationsdk/ProgIsSmash;

    .line 564
    invoke-direct {p0, p2}, Lcom/ironsource/mediationsdk/ProgIsManager;->loadSmash(Lcom/ironsource/mediationsdk/ProgIsSmash;)V

    goto :goto_4

    :cond_9
    return-void

    :catchall_0
    move-exception p1

    .line 560
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public onInterstitialAdOpened(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 8

    .line 573
    monitor-enter p0

    :try_start_0
    const-string v0, "onInterstitialAdOpened"

    .line 574
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgIsSmash;Ljava/lang/String;)V

    .line 575
    invoke-static {}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/ISListenerWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->onInterstitialAdOpened()V

    const/16 v0, 0x7d5

    .line 576
    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEventWithPlacement(ILcom/ironsource/mediationsdk/ProgIsSmash;)V

    .line 578
    iget-boolean v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mIsAuctionEnabled:Z

    if-eqz v0, :cond_2

    .line 579
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    if-eqz v0, :cond_0

    .line 582
    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceType()I

    move-result v2

    iget-object v3, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mGenericNotifications:Lcom/ironsource/mediationsdk/AuctionResponseItem;

    iget-object v4, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/ironsource/mediationsdk/AuctionHandler;->reportImpression(Lcom/ironsource/mediationsdk/AuctionResponseItem;ILcom/ironsource/mediationsdk/AuctionResponseItem;Ljava/lang/String;)V

    .line 583
    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p1

    sget-object v2, Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;->ISAuctionPerformanceShowedSuccessfully:Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;

    invoke-virtual {v1, p1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 586
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->reportImpressionDataToPublisher(Lcom/ironsource/mediationsdk/AuctionResponseItem;Ljava/lang/String;)V

    goto :goto_1

    :cond_0
    if-eqz p1, :cond_1

    .line 589
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    const-string p1, "Smash is null"

    .line 590
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onInterstitialAdOpened showing instance "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " missing from waterfall"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->logInternal(Ljava/lang/String;)V

    const v0, 0x1418d

    const/4 v1, 0x3

    new-array v1, v1, [[Ljava/lang/Object;

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Object;

    const-string v4, "errorCode"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/16 v4, 0x3f3

    .line 591
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v6, 0x1

    aput-object v4, v3, v6

    aput-object v3, v1, v5

    new-array v3, v2, [Ljava/lang/Object;

    const-string v4, "reason"

    aput-object v4, v3, v5

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Showing missing "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mState:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    aput-object v3, v1, v6

    new-array v3, v2, [Ljava/lang/Object;

    const-string v4, "ext1"

    aput-object v4, v3, v5

    aput-object p1, v3, v6

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 595
    :cond_2
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onInterstitialAdReady(Lcom/ironsource/mediationsdk/ProgIsSmash;J)V
    .locals 15

    move-object v1, p0

    move-object/from16 v0, p1

    .line 465
    monitor-enter p0

    :try_start_0
    const-string v2, "onInterstitialAdReady"

    .line 466
    invoke-direct {p0, v0, v2}, Lcom/ironsource/mediationsdk/ProgIsManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgIsSmash;Ljava/lang/String;)V

    const/16 v2, 0x7d3

    const/4 v3, 0x1

    new-array v4, v3, [[Ljava/lang/Object;

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/Object;

    const-string v7, "duration"

    const/4 v8, 0x0

    aput-object v7, v6, v8

    .line 467
    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v3

    aput-object v6, v4, v8

    invoke-direct {p0, v2, v0, v4}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/ProgIsSmash;[[Ljava/lang/Object;)V

    if-eqz v0, :cond_0

    .line 472
    iget-object v2, v1, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual/range {p1 .. p1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 473
    iget-object v2, v1, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual/range {p1 .. p1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v4

    sget-object v6, Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;->ISAuctionPerformanceLoadedSuccessfully:Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;

    invoke-virtual {v2, v4, v6}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    :cond_0
    iget-object v2, v1, Lcom/ironsource/mediationsdk/ProgIsManager;->mState:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    sget-object v4, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_LOADING_SMASHES:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    if-ne v2, v4, :cond_3

    .line 477
    sget-object v2, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    invoke-direct {p0, v2}, Lcom/ironsource/mediationsdk/ProgIsManager;->setState(Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;)V

    .line 478
    invoke-static {}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/ISListenerWrapper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->onInterstitialAdReady()V

    .line 479
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    iget-wide v9, v1, Lcom/ironsource/mediationsdk/ProgIsManager;->mLoadStartTime:J

    sub-long/2addr v6, v9

    const/16 v2, 0x7d4

    new-array v4, v3, [[Ljava/lang/Object;

    new-array v9, v5, [Ljava/lang/Object;

    const-string v10, "duration"

    aput-object v10, v9, v8

    .line 480
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v9, v3

    aput-object v9, v4, v8

    invoke-direct {p0, v2, v4}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 482
    iget-boolean v2, v1, Lcom/ironsource/mediationsdk/ProgIsManager;->mIsAuctionEnabled:Z

    if-eqz v2, :cond_3

    .line 483
    iget-object v2, v1, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual/range {p1 .. p1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    if-eqz v14, :cond_1

    .line 486
    iget-object v2, v1, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

    invoke-virtual/range {p1 .. p1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceType()I

    move-result v3

    iget-object v4, v1, Lcom/ironsource/mediationsdk/ProgIsManager;->mGenericNotifications:Lcom/ironsource/mediationsdk/AuctionResponseItem;

    invoke-virtual {v2, v14, v3, v4}, Lcom/ironsource/mediationsdk/AuctionHandler;->reportLoadSuccess(Lcom/ironsource/mediationsdk/AuctionResponseItem;ILcom/ironsource/mediationsdk/AuctionResponseItem;)V

    .line 487
    iget-object v9, v1, Lcom/ironsource/mediationsdk/ProgIsManager;->mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

    iget-object v2, v1, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    move-object v10, v2

    check-cast v10, Ljava/util/concurrent/CopyOnWriteArrayList;

    iget-object v11, v1, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual/range {p1 .. p1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceType()I

    move-result v12

    iget-object v13, v1, Lcom/ironsource/mediationsdk/ProgIsManager;->mGenericNotifications:Lcom/ironsource/mediationsdk/AuctionResponseItem;

    invoke-virtual/range {v9 .. v14}, Lcom/ironsource/mediationsdk/AuctionHandler;->reportAuctionLose(Ljava/util/concurrent/CopyOnWriteArrayList;Ljava/util/concurrent/ConcurrentHashMap;ILcom/ironsource/mediationsdk/AuctionResponseItem;Lcom/ironsource/mediationsdk/AuctionResponseItem;)V

    goto :goto_1

    :cond_1
    if-eqz v0, :cond_2

    .line 489
    invoke-virtual/range {p1 .. p1}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    const-string v0, "Smash is null"

    .line 490
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onInterstitialAdReady winner instance "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " missing from waterfall"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/ironsource/mediationsdk/ProgIsManager;->logInternal(Ljava/lang/String;)V

    const v2, 0x1418d

    const/4 v4, 0x3

    new-array v4, v4, [[Ljava/lang/Object;

    new-array v6, v5, [Ljava/lang/Object;

    const-string v7, "errorCode"

    aput-object v7, v6, v8

    const/16 v7, 0x3f2

    .line 491
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v3

    aput-object v6, v4, v8

    new-array v6, v5, [Ljava/lang/Object;

    const-string v7, "reason"

    aput-object v7, v6, v8

    const-string v7, "Loaded missing"

    aput-object v7, v6, v3

    aput-object v6, v4, v3

    new-array v6, v5, [Ljava/lang/Object;

    const-string v7, "ext1"

    aput-object v7, v6, v8

    aput-object v0, v6, v3

    aput-object v6, v4, v5

    invoke-direct {p0, v2, v4}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 495
    :cond_3
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 7

    .line 628
    monitor-enter p0

    .line 629
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onInterstitialAdShowFailed error="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p2, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgIsSmash;Ljava/lang/String;)V

    .line 630
    invoke-static {}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/ISListenerWrapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    const/16 v0, 0x89b

    const/4 v1, 0x2

    new-array v2, v1, [[Ljava/lang/Object;

    new-array v3, v1, [Ljava/lang/Object;

    const-string v4, "errorCode"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 631
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v6, 0x1

    aput-object v4, v3, v6

    aput-object v3, v2, v5

    new-array v1, v1, [Ljava/lang/Object;

    const-string v3, "reason"

    aput-object v3, v1, v5

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v6

    aput-object v1, v2, v6

    invoke-direct {p0, v0, p2, v2}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEventWithPlacement(ILcom/ironsource/mediationsdk/ProgIsSmash;[[Ljava/lang/Object;)V

    .line 633
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p2

    sget-object v0, Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;->ISAuctionPerformanceFailedToShow:Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;

    invoke-virtual {p1, p2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 635
    sget-object p1, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_READY_TO_LOAD:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->setState(Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;)V

    .line 636
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onInterstitialAdShowSucceeded(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 1

    const-string v0, "onInterstitialAdShowSucceeded"

    .line 619
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgIsSmash;Ljava/lang/String;)V

    .line 620
    invoke-static {}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/ISListenerWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->onInterstitialAdShowSucceeded()V

    const/16 v0, 0x89a

    .line 621
    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEventWithPlacement(ILcom/ironsource/mediationsdk/ProgIsSmash;)V

    return-void
.end method

.method public onInterstitialAdVisible(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 1

    const-string v0, "onInterstitialAdVisible"

    .line 652
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgIsSmash;Ljava/lang/String;)V

    return-void
.end method

.method public onInterstitialInitFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 5

    const/4 v0, 0x1

    new-array v1, v0, [[Ljava/lang/Object;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "reason"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    .line 657
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, v0

    aput-object v2, v1, v4

    const/16 p1, 0x89e

    invoke-direct {p0, p1, p2, v1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/ProgIsSmash;[[Ljava/lang/Object;)V

    return-void
.end method

.method public onInterstitialInitSuccess(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 1

    const/16 v0, 0x89d

    .line 662
    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/ProgIsSmash;)V

    return-void
.end method

.method shouldTrackNetworkState(Landroid/content/Context;Z)V
    .locals 3

    .line 824
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object p1

    sget-object v0, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Should Track Network State: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 825
    iput-boolean p2, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mShouldTrackNetworkState:Z

    return-void
.end method

.method public declared-synchronized showInterstitial(Ljava/lang/String;)V
    .locals 8

    monitor-enter p0

    .line 371
    :try_start_0
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mState:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    sget-object v1, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_SHOWING:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    const/16 v2, 0x83f

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x2

    if-ne v0, v1, :cond_0

    const-string p1, "showInterstitial error: can\'t show ad while an ad is already showing"

    .line 373
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->logAPIError(Ljava/lang/String;)V

    .line 374
    new-instance v0, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const/16 v1, 0x40c

    invoke-direct {v0, v1, p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 375
    invoke-static {}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/ISListenerWrapper;

    move-result-object v6

    invoke-virtual {v6, v0}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array v0, v5, [[Ljava/lang/Object;

    new-array v6, v5, [Ljava/lang/Object;

    const-string v7, "errorCode"

    aput-object v7, v6, v4

    .line 376
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v6, v3

    aput-object v6, v0, v4

    new-array v1, v5, [Ljava/lang/Object;

    const-string v5, "reason"

    aput-object v5, v1, v4

    aput-object p1, v1, v3

    aput-object v1, v0, v3

    invoke-direct {p0, v2, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 377
    monitor-exit p0

    return-void

    .line 380
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mState:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    sget-object v1, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    const/16 v6, 0x1fd

    if-eq v0, v1, :cond_1

    .line 382
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "showInterstitial() error state="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mState:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->logInternal(Ljava/lang/String;)V

    const-string p1, "showInterstitial error: show called while no ads are available"

    .line 384
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->logAPIError(Ljava/lang/String;)V

    .line 385
    new-instance v0, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    invoke-direct {v0, v6, p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 386
    invoke-static {}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/ISListenerWrapper;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array v0, v5, [[Ljava/lang/Object;

    new-array v1, v5, [Ljava/lang/Object;

    const-string v7, "errorCode"

    aput-object v7, v1, v4

    .line 387
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v1, v3

    aput-object v1, v0, v4

    new-array v1, v5, [Ljava/lang/Object;

    const-string v5, "reason"

    aput-object v5, v1, v4

    aput-object p1, v1, v3

    aput-object v1, v0, v3

    invoke-direct {p0, v2, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 388
    monitor-exit p0

    return-void

    :cond_1
    if-nez p1, :cond_2

    :try_start_2
    const-string p1, "showInterstitial error: empty default placement"

    .line 393
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->logAPIError(Ljava/lang/String;)V

    .line 394
    new-instance v0, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const/16 v1, 0x3fc

    invoke-direct {v0, v1, p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 395
    invoke-static {}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/ISListenerWrapper;

    move-result-object v6

    invoke-virtual {v6, v0}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array v0, v5, [[Ljava/lang/Object;

    new-array v6, v5, [Ljava/lang/Object;

    const-string v7, "errorCode"

    aput-object v7, v6, v4

    .line 396
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v6, v3

    aput-object v6, v0, v4

    new-array v1, v5, [Ljava/lang/Object;

    const-string v5, "reason"

    aput-object v5, v1, v4

    aput-object p1, v1, v3

    aput-object v1, v0, v3

    invoke-direct {p0, v2, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEvent(I[[Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 397
    monitor-exit p0

    return-void

    .line 400
    :cond_2
    :try_start_3
    iput-object p1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentPlacement:Ljava/lang/String;

    const/16 p1, 0x834

    .line 401
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEventWithPlacement(I)V

    .line 403
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/ironsource/mediationsdk/utils/CappingManager;->isInterstitialPlacementCapped(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 404
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "placement "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " is capped"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 405
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->logAPIError(Ljava/lang/String;)V

    .line 406
    new-instance v0, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const/16 v1, 0x20c

    invoke-direct {v0, v1, p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 407
    invoke-static {}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/ISListenerWrapper;

    move-result-object v6

    invoke-virtual {v6, v0}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array v0, v5, [[Ljava/lang/Object;

    new-array v6, v5, [Ljava/lang/Object;

    const-string v7, "errorCode"

    aput-object v7, v6, v4

    .line 408
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v6, v3

    aput-object v6, v0, v4

    new-array v1, v5, [Ljava/lang/Object;

    const-string v5, "reason"

    aput-object v5, v1, v4

    aput-object p1, v1, v3

    aput-object v1, v0, v3

    invoke-direct {p0, v2, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEventWithPlacement(I[[Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 409
    monitor-exit p0

    return-void

    .line 412
    :cond_3
    :try_start_4
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ironsource/mediationsdk/ProgIsSmash;

    .line 413
    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/ProgIsSmash;->isReadyToShow()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 414
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgIsManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->showInterstitial(Lcom/ironsource/mediationsdk/ProgIsSmash;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 415
    monitor-exit p0

    return-void

    .line 417
    :cond_4
    :try_start_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "showInterstitial "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/ProgIsSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " isReadyToShow() == false"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgIsManager;->logInternal(Ljava/lang/String;)V

    goto :goto_0

    .line 421
    :cond_5
    invoke-static {}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/ISListenerWrapper;

    move-result-object p1

    const-string v0, "Interstitial"

    invoke-static {v0}, Lcom/ironsource/mediationsdk/utils/ErrorBuilder;->buildNoAdsToShowError(Ljava/lang/String;)Lcom/ironsource/mediationsdk/logger/IronSourceError;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/ironsource/mediationsdk/ISListenerWrapper;->onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array p1, v5, [[Ljava/lang/Object;

    new-array v0, v5, [Ljava/lang/Object;

    const-string v1, "errorCode"

    aput-object v1, v0, v4

    .line 422
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    aput-object v0, p1, v4

    new-array v0, v5, [Ljava/lang/Object;

    const-string v1, "reason"

    aput-object v1, v0, v4

    const-string v1, "Show Fail - No ads to show"

    aput-object v1, v0, v3

    aput-object v0, p1, v3

    invoke-direct {p0, v2, p1}, Lcom/ironsource/mediationsdk/ProgIsManager;->sendMediationEventWithPlacement(I[[Ljava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 423
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
