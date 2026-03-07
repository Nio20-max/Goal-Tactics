.class Lcom/ironsource/mediationsdk/ProgRvManager;
.super Lcom/ironsource/mediationsdk/BaseProgManager;
.source "ProgRvManager.java"

# interfaces
.implements Lcom/ironsource/mediationsdk/ProgRvManagerListener;
.implements Lcom/ironsource/mediationsdk/RvLoadTriggerCallback;
.implements Lcom/ironsource/mediationsdk/AuctionEventListener;
.implements Lcom/ironsource/mediationsdk/IProgRvManager;
.implements Lcom/ironsource/environment/NetworkStateReceiver$NetworkStateReceiverListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;
    }
.end annotation


# instance fields
.field private mAdvancedLoading:Z

.field private mAuctionFallback:Ljava/lang/String;

.field private mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

.field private mAuctionHistory:Lcom/ironsource/mediationsdk/AuctionHistory;

.field private mAuctionStartTime:J

.field private mAuctionTrial:I

.field private mCurrentAuctionId:Ljava/lang/String;

.field private mCurrentPlacement:Ljava/lang/String;

.field private mGenericNotifications:Lcom/ironsource/mediationsdk/AuctionResponseItem;

.field private mIsAuctionEnabled:Z

.field private mIsAuctionOnShowStart:Z

.field private mIsShowingVideo:Z

.field private mLastChangedAvailabilityTime:J

.field private mLastReportedAvailabilityState:Ljava/lang/Boolean;

.field private mMaxSmashesToLoad:I

.field private mNetworkStateReceiver:Lcom/ironsource/environment/NetworkStateReceiver;

.field private mNextWaterfallToLoad:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ironsource/mediationsdk/AuctionResponseItem;",
            ">;"
        }
    .end annotation
.end field

.field private mRvLoadTrigger:Lcom/ironsource/mediationsdk/RvLoadTrigger;

.field private mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

.field private mSessionDepth:I

.field private mShouldLoadAfterClose:Z

.field private mShouldTrackNetworkState:Z

.field private final mSmashes:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/ironsource/mediationsdk/ProgRvSmash;",
            ">;"
        }
    .end annotation
.end field

.field private mState:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

.field private mTimeToWaitBeforeLoadMS:J

.field private mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/ironsource/mediationsdk/ProgRvSmash;",
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
.method public constructor <init>(Ljava/util/List;Lcom/ironsource/mediationsdk/model/RewardedVideoConfigurations;Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ironsource/mediationsdk/model/ProviderSettings;",
            ">;",
            "Lcom/ironsource/mediationsdk/model/RewardedVideoConfigurations;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;",
            ")V"
        }
    .end annotation

    move-object/from16 v7, p0

    move-object/from16 v0, p5

    .line 78
    invoke-direct {v7, v0}, Lcom/ironsource/mediationsdk/BaseProgManager;-><init>(Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;)V

    const/4 v8, 0x1

    .line 60
    iput v8, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mSessionDepth:I

    const-string v0, ""

    .line 70
    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionFallback:Ljava/lang/String;

    const/4 v9, 0x0

    .line 71
    iput-boolean v9, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mShouldTrackNetworkState:Z

    .line 79
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    const v1, 0x13da0

    .line 80
    invoke-direct {v7, v1}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEventWithoutAuctionId(I)V

    .line 81
    sget-object v1, Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;->RV_STATE_INITIATING:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    invoke-direct {v7, v1}, Lcom/ironsource/mediationsdk/ProgRvManager;->setState(Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;)V

    const/4 v1, 0x0

    .line 82
    iput-object v1, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mLastReportedAvailabilityState:Ljava/lang/Boolean;

    .line 84
    invoke-virtual/range {p2 .. p2}, Lcom/ironsource/mediationsdk/model/RewardedVideoConfigurations;->getRewardedVideoAdaptersSmartLoadAmount()I

    move-result v1

    iput v1, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mMaxSmashesToLoad:I

    .line 85
    invoke-virtual/range {p2 .. p2}, Lcom/ironsource/mediationsdk/model/RewardedVideoConfigurations;->getRewardedVideoAdvancedLoading()Z

    move-result v1

    iput-boolean v1, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mAdvancedLoading:Z

    .line 87
    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    .line 88
    invoke-virtual/range {p2 .. p2}, Lcom/ironsource/mediationsdk/model/RewardedVideoConfigurations;->getRewardedVideoAuctionSettings()Lcom/ironsource/mediationsdk/utils/AuctionSettings;

    move-result-object v12

    .line 89
    iput-boolean v9, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsShowingVideo:Z

    .line 91
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mNextWaterfallToLoad:Ljava/util/List;

    .line 93
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    .line 94
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    .line 95
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mLastChangedAvailabilityTime:J

    .line 97
    invoke-virtual {v12}, Lcom/ironsource/mediationsdk/utils/AuctionSettings;->getNumOfMaxTrials()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsAuctionEnabled:Z

    .line 98
    invoke-virtual {v12}, Lcom/ironsource/mediationsdk/utils/AuctionSettings;->getIsAuctionOnShowStart()Z

    move-result v0

    iput-boolean v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsAuctionOnShowStart:Z

    .line 99
    invoke-virtual {v12}, Lcom/ironsource/mediationsdk/utils/AuctionSettings;->getIsLoadWhileShow()Z

    move-result v0

    xor-int/2addr v0, v8

    iput-boolean v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mShouldLoadAfterClose:Z

    .line 100
    invoke-virtual {v12}, Lcom/ironsource/mediationsdk/utils/AuctionSettings;->getTimeToWaitBeforeLoadMs()J

    move-result-wide v0

    iput-wide v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mTimeToWaitBeforeLoadMS:J

    .line 102
    iget-boolean v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsAuctionEnabled:Z

    if-eqz v0, :cond_1

    .line 103
    new-instance v0, Lcom/ironsource/mediationsdk/AuctionHandler;

    const-string v1, "rewardedVideo"

    invoke-direct {v0, v1, v12, v7}, Lcom/ironsource/mediationsdk/AuctionHandler;-><init>(Ljava/lang/String;Lcom/ironsource/mediationsdk/utils/AuctionSettings;Lcom/ironsource/mediationsdk/AuctionEventListener;)V

    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

    .line 106
    :cond_1
    new-instance v0, Lcom/ironsource/mediationsdk/RvLoadTrigger;

    invoke-direct {v0, v12, v7}, Lcom/ironsource/mediationsdk/RvLoadTrigger;-><init>(Lcom/ironsource/mediationsdk/utils/AuctionSettings;Lcom/ironsource/mediationsdk/RvLoadTriggerCallback;)V

    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mRvLoadTrigger:Lcom/ironsource/mediationsdk/RvLoadTrigger;

    .line 107
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 108
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 110
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

    .line 111
    invoke-static {}, Lcom/ironsource/mediationsdk/AdapterRepository;->getInstance()Lcom/ironsource/mediationsdk/AdapterRepository;

    move-result-object v0

    invoke-virtual {v3}, Lcom/ironsource/mediationsdk/model/ProviderSettings;->getRewardedVideoSettings()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Lcom/ironsource/mediationsdk/AdapterRepository;->getAdapter(Lcom/ironsource/mediationsdk/model/ProviderSettings;Lorg/json/JSONObject;)Lcom/ironsource/mediationsdk/AbstractAdapter;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 112
    invoke-static {}, Lcom/ironsource/mediationsdk/AdaptersCompatibilityHandler;->getInstance()Lcom/ironsource/mediationsdk/AdaptersCompatibilityHandler;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/ironsource/mediationsdk/AdaptersCompatibilityHandler;->isAdapterVersionRVCompatible(Lcom/ironsource/mediationsdk/AbstractAdapter;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 113
    new-instance v15, Lcom/ironsource/mediationsdk/ProgRvSmash;

    invoke-virtual/range {p2 .. p2}, Lcom/ironsource/mediationsdk/model/RewardedVideoConfigurations;->getRewardedVideoAdaptersSmartLoadTimeout()I

    move-result v5

    move-object v0, v15

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v4, p0

    invoke-direct/range {v0 .. v6}, Lcom/ironsource/mediationsdk/ProgRvSmash;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/mediationsdk/model/ProviderSettings;Lcom/ironsource/mediationsdk/ProgRvManagerListener;ILcom/ironsource/mediationsdk/AbstractAdapter;)V

    .line 114
    invoke-virtual {v15}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v0

    .line 115
    iget-object v1, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v0, v15}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 120
    :cond_3
    new-instance v0, Lcom/ironsource/mediationsdk/AuctionHistory;

    invoke-virtual {v12}, Lcom/ironsource/mediationsdk/utils/AuctionSettings;->getAuctionSavedHistoryLimit()I

    move-result v1

    invoke-direct {v0, v13, v1}, Lcom/ironsource/mediationsdk/AuctionHistory;-><init>(Ljava/util/List;I)V

    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionHistory:Lcom/ironsource/mediationsdk/AuctionHistory;

    .line 121
    new-instance v0, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {v0, v1}, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;-><init>(Ljava/util/List;)V

    iput-object v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    .line 122
    iget-object v0, v7, Lcom/ironsource/mediationsdk/ProgRvManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

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

    check-cast v1, Lcom/ironsource/mediationsdk/ProgRvSmash;

    .line 123
    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->isBidder()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 124
    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->initForBidding()V

    goto :goto_2

    .line 128
    :cond_5
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    sub-long/2addr v0, v10

    const v2, 0x13da1

    new-array v3, v8, [[Ljava/lang/Object;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "duration"

    aput-object v5, v4, v9

    .line 129
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v4, v8

    aput-object v4, v3, v9

    invoke-direct {v7, v2, v3}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEventWithoutAuctionId(I[[Ljava/lang/Object;)V

    .line 131
    invoke-virtual {v12}, Lcom/ironsource/mediationsdk/utils/AuctionSettings;->getTimeToWaitBeforeFirstAuctionMs()J

    move-result-wide v0

    invoke-direct {v7, v0, v1}, Lcom/ironsource/mediationsdk/ProgRvManager;->loadRewardedVideo(J)V

    return-void
.end method

.method static synthetic access$000(Lcom/ironsource/mediationsdk/ProgRvManager;)V
    .locals 0

    .line 44
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgRvManager;->makeAuction()V

    return-void
.end method

.method static synthetic access$100(Lcom/ironsource/mediationsdk/ProgRvManager;Ljava/lang/String;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->logInternal(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/ironsource/mediationsdk/ProgRvManager;)Lcom/ironsource/mediationsdk/AuctionHistory;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionHistory:Lcom/ironsource/mediationsdk/AuctionHistory;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/ironsource/mediationsdk/ProgRvManager;)I
    .locals 0

    .line 44
    iget p0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSessionDepth:I

    return p0
.end method

.method static synthetic access$1200(Lcom/ironsource/mediationsdk/ProgRvManager;)Lcom/ironsource/mediationsdk/AuctionHandler;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/ironsource/mediationsdk/ProgRvManager;)V
    .locals 0

    .line 44
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgRvManager;->loadSmashesForNextWaterfall()V

    return-void
.end method

.method static synthetic access$202(Lcom/ironsource/mediationsdk/ProgRvManager;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 44
    iput-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentAuctionId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$302(Lcom/ironsource/mediationsdk/ProgRvManager;J)J
    .locals 0

    .line 44
    iput-wide p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionStartTime:J

    return-wide p1
.end method

.method static synthetic access$400(Lcom/ironsource/mediationsdk/ProgRvManager;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

    return-object p0
.end method

.method static synthetic access$500(Lcom/ironsource/mediationsdk/ProgRvManager;)Lcom/ironsource/mediationsdk/utils/SessionCappingManager;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    return-object p0
.end method

.method static synthetic access$600(Lcom/ironsource/mediationsdk/ProgRvManager;I[[Ljava/lang/Object;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1, p2}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$700(Lcom/ironsource/mediationsdk/ProgRvManager;)V
    .locals 0

    .line 44
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgRvManager;->handleLoadFailure()V

    return-void
.end method

.method static synthetic access$800(Lcom/ironsource/mediationsdk/ProgRvManager;I)V
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEventWithoutAuctionId(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/ironsource/mediationsdk/ProgRvManager;I[[Ljava/lang/Object;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1, p2}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEventWithoutAuctionId(I[[Ljava/lang/Object;)V

    return-void
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

    .line 369
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 370
    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

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

    check-cast v2, Lcom/ironsource/mediationsdk/ProgRvSmash;

    .line 371
    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/ProgRvSmash;->isBidder()Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    invoke-virtual {v3, v2}, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;->isCapped(Lcom/ironsource/mediationsdk/ProgSmash;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 375
    :cond_1
    new-instance v3, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lcom/ironsource/mediationsdk/AuctionResponseItem;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private getAsString(Lcom/ironsource/mediationsdk/AuctionResponseItem;)Ljava/lang/String;
    .locals 2

    .line 383
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ironsource/mediationsdk/ProgRvSmash;

    if-eqz v0, :cond_0

    .line 387
    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceType()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 390
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

    .line 393
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

.method private handleLoadFailure()V
    .locals 1

    .line 474
    sget-object v0, Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;->RV_STATE_NOT_LOADED:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->setState(Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;)V

    const/4 v0, 0x0

    .line 475
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->reportAvailabilityIfNeeded(Z)V

    .line 476
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mRvLoadTrigger:Lcom/ironsource/mediationsdk/RvLoadTrigger;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/RvLoadTrigger;->loadError()V

    return-void
.end method

.method private loadRewardedVideo(J)V
    .locals 7

    .line 137
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;->areAllSmashesCapped()Z

    move-result v0

    const-string v1, "reason"

    const-string v2, "errorCode"

    const v3, 0x13c69

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x2

    if-eqz v0, :cond_0

    new-array p1, v6, [[Ljava/lang/Object;

    new-array p2, v6, [Ljava/lang/Object;

    aput-object v2, p2, v5

    const v0, 0x13881

    .line 138
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, p2, v4

    aput-object p2, p1, v5

    new-array p2, v6, [Ljava/lang/Object;

    aput-object v1, p2, v5

    const-string v0, "all smashes are capped"

    aput-object v0, p2, v4

    aput-object p2, p1, v4

    invoke-direct {p0, v3, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 139
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgRvManager;->handleLoadFailure()V

    return-void

    .line 143
    :cond_0
    iget-boolean v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsAuctionEnabled:Z

    if-eqz v0, :cond_2

    .line 144
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 146
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionHistory:Lcom/ironsource/mediationsdk/AuctionHistory;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, v1}, Lcom/ironsource/mediationsdk/AuctionHistory;->storeWaterfallPerformance(Ljava/util/concurrent/ConcurrentHashMap;)V

    .line 147
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 150
    :cond_1
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    new-instance v1, Lcom/ironsource/mediationsdk/ProgRvManager$1;

    invoke-direct {v1, p0}, Lcom/ironsource/mediationsdk/ProgRvManager$1;-><init>(Lcom/ironsource/mediationsdk/ProgRvManager;)V

    invoke-virtual {v0, v1, p1, p2}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto :goto_0

    .line 158
    :cond_2
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgRvManager;->updateWaterfallToNonBidding()V

    .line 160
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mNextWaterfallToLoad:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    new-array p1, v6, [[Ljava/lang/Object;

    new-array p2, v6, [Ljava/lang/Object;

    aput-object v2, p2, v5

    const v0, 0x13882

    .line 161
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, p2, v4

    aput-object p2, p1, v5

    new-array p2, v6, [Ljava/lang/Object;

    aput-object v1, p2, v5

    const-string v0, "waterfall is empty"

    aput-object v0, p2, v4

    aput-object p2, p1, v4

    invoke-direct {p0, v3, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 162
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgRvManager;->handleLoadFailure()V

    return-void

    :cond_3
    const/16 p1, 0x3e8

    .line 166
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEventWithoutAuctionId(I)V

    .line 168
    iget-boolean p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mShouldLoadAfterClose:Z

    if-eqz p1, :cond_4

    iget-boolean p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsShowingVideo:Z

    if-nez p1, :cond_5

    .line 174
    :cond_4
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgRvManager;->loadSmashesForNextWaterfall()V

    :cond_5
    :goto_0
    return-void
.end method

.method private loadSmash(Lcom/ironsource/mediationsdk/ProgRvSmash;)V
    .locals 8

    .line 427
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getServerData()Ljava/lang/String;

    move-result-object v2

    .line 428
    invoke-static {}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->getInstance()Lcom/ironsource/mediationsdk/AuctionDataUtils;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->getDynamicDemandSourceIdFromServerData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 429
    iget-object v3, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentAuctionId:Ljava/lang/String;

    iget v4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionTrial:I

    iget-object v5, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionFallback:Ljava/lang/String;

    iget v6, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSessionDepth:I

    move-object v1, p1

    invoke-virtual/range {v1 .. v7}, Lcom/ironsource/mediationsdk/ProgRvSmash;->loadVideo(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method private loadSmashes()V
    .locals 7

    .line 435
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const v0, 0x13c69

    const/4 v2, 0x2

    new-array v3, v2, [[Ljava/lang/Object;

    new-array v4, v2, [Ljava/lang/Object;

    const-string v5, "errorCode"

    aput-object v5, v4, v1

    const v5, 0x13884

    .line 436
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v4, v6

    aput-object v4, v3, v1

    new-array v2, v2, [Ljava/lang/Object;

    const-string v4, "reason"

    aput-object v4, v2, v1

    const-string v1, "waterfall is empty"

    aput-object v1, v2, v6

    aput-object v2, v3, v6

    invoke-direct {p0, v0, v3}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 437
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgRvManager;->handleLoadFailure()V

    return-void

    .line 441
    :cond_0
    sget-object v0, Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;->RV_STATE_LOADING_SMASHES:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->setState(Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;)V

    const/4 v0, 0x0

    .line 444
    :goto_0
    iget-object v2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_4

    iget v2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mMaxSmashesToLoad:I

    if-ge v0, v2, :cond_4

    .line 445
    iget-object v2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ironsource/mediationsdk/ProgRvSmash;

    .line 447
    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getIsLoadCandidate()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 449
    iget-boolean v3, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAdvancedLoading:Z

    if-eqz v3, :cond_2

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/ProgRvSmash;->isBidder()Z

    move-result v3

    if-eqz v3, :cond_2

    if-nez v0, :cond_1

    .line 455
    invoke-direct {p0, v2}, Lcom/ironsource/mediationsdk/ProgRvManager;->loadSmash(Lcom/ironsource/mediationsdk/ProgRvSmash;)V

    goto :goto_1

    .line 458
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Advanced Loading: Won\'t start loading bidder "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " as a non bidder is being loaded"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logInternal(Ljava/lang/String;)V

    goto :goto_1

    .line 464
    :cond_2
    invoke-direct {p0, v2}, Lcom/ironsource/mediationsdk/ProgRvManager;->loadSmash(Lcom/ironsource/mediationsdk/ProgRvSmash;)V

    add-int/lit8 v0, v0, 0x1

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    :goto_1
    return-void
.end method

.method private loadSmashesForNextWaterfall()V
    .locals 1

    .line 332
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mNextWaterfallToLoad:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->updateWaterfall(Ljava/util/List;)V

    .line 333
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgRvManager;->loadSmashes()V

    return-void
.end method

.method private logAPIError(Ljava/lang/String;)V
    .locals 3

    .line 751
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->API:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const/4 v2, 0x3

    invoke-virtual {v0, v1, p1, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private logApi(Ljava/lang/String;)V
    .locals 3

    .line 757
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->API:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p1, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private logErrorInternal(Ljava/lang/String;)V
    .locals 4

    .line 744
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ProgRvManager: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x3

    invoke-virtual {v0, v1, p1, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private logInternal(Ljava/lang/String;)V
    .locals 4

    .line 738
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ProgRvManager: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private logSmashCallback(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V
    .locals 3

    .line 731
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " : "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 732
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object p2

    sget-object v0, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->ADAPTER_CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ProgRvManager: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private makeAuction()V
    .locals 1

    .line 282
    sget-object v0, Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;->RV_STATE_AUCTION_IN_PROGRESS:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->setState(Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;)V

    .line 283
    new-instance v0, Lcom/ironsource/mediationsdk/ProgRvManager$2;

    invoke-direct {v0, p0}, Lcom/ironsource/mediationsdk/ProgRvManager$2;-><init>(Lcom/ironsource/mediationsdk/ProgRvManager;)V

    invoke-static {v0}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private reportAvailabilityIfNeeded(Z)V
    .locals 8

    .line 714
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mLastReportedAvailabilityState:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eq v0, p1, :cond_2

    .line 715
    :cond_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mLastReportedAvailabilityState:Ljava/lang/Boolean;

    .line 716
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mLastChangedAvailabilityTime:J

    sub-long/2addr v0, v2

    .line 717
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mLastChangedAvailabilityTime:J

    const-string v2, "duration"

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz p1, :cond_1

    const/16 v6, 0x457

    new-array v7, v5, [[Ljava/lang/Object;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v2, v3, v4

    .line 720
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v3, v5

    aput-object v3, v7, v4

    invoke-direct {p0, v6, v7}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    const/16 v6, 0x458

    new-array v7, v5, [[Ljava/lang/Object;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v2, v3, v4

    .line 722
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v3, v5

    aput-object v3, v7, v4

    invoke-direct {p0, v6, v7}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 724
    :goto_0
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAvailabilityChanged(Z)V

    :cond_2
    return-void
.end method

.method private sendMediationEvent(I[[Ljava/lang/Object;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 775
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;ZZ)V

    return-void
.end method

.method private sendMediationEvent(I[[Ljava/lang/Object;ZZ)V
    .locals 5

    .line 793
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "provider"

    const-string v2, "Mediation"

    .line 794
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x1

    .line 795
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "programmatic"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p4, :cond_0

    .line 797
    iget-object p4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentAuctionId:Ljava/lang/String;

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_0

    .line 798
    iget-object p4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentAuctionId:Ljava/lang/String;

    const-string v2, "auctionId"

    invoke-interface {v0, v2, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    if-eqz p3, :cond_1

    .line 801
    iget-object p3, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_1

    .line 802
    iget-object p3, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    const-string p4, "placement"

    invoke-interface {v0, p4, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 805
    :cond_1
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->shouldAddAuctionParams(I)Z

    move-result p3

    if-eqz p3, :cond_2

    .line 806
    invoke-static {}, Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;->getInstance()Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;

    move-result-object p3

    iget p4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionTrial:I

    iget-object v2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionFallback:Ljava/lang/String;

    invoke-virtual {p3, v0, p4, v2}, Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;->setEventAuctionParams(Ljava/util/Map;ILjava/lang/String;)V

    .line 809
    :cond_2
    iget p3, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSessionDepth:I

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    const-string p4, "sessionDepth"

    invoke-interface {v0, p4, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_3

    .line 813
    :try_start_0
    array-length p3, p2

    const/4 p4, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p3, :cond_3

    aget-object v3, p2, v2

    .line 814
    aget-object v4, v3, p4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    aget-object v3, v3, v1

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    move-exception p2

    .line 818
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object p3

    sget-object p4, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ProgRvManager: RV sendMediationEvent "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v1, 0x3

    invoke-virtual {p3, p4, p2, v1}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 821
    :cond_3
    new-instance p2, Lcom/ironsource/eventsmodule/EventData;

    new-instance p3, Lorg/json/JSONObject;

    invoke-direct {p3, v0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-direct {p2, p1, p3}, Lcom/ironsource/eventsmodule/EventData;-><init>(ILorg/json/JSONObject;)V

    .line 822
    invoke-static {}, Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;->getInstance()Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;->log(Lcom/ironsource/eventsmodule/EventData;)V

    return-void
.end method

.method private sendMediationEventWithPlacement(I)V
    .locals 2

    const/4 v0, 0x0

    .line 781
    check-cast v0, [[Ljava/lang/Object;

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1, v1}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;ZZ)V

    return-void
.end method

.method private sendMediationEventWithPlacement(I[[Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x1

    .line 787
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;ZZ)V

    return-void
.end method

.method private sendMediationEventWithoutAuctionId(I)V
    .locals 2

    const/4 v0, 0x0

    .line 769
    check-cast v0, [[Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1, v1}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;ZZ)V

    return-void
.end method

.method private sendMediationEventWithoutAuctionId(I[[Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x0

    .line 763
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;ZZ)V

    return-void
.end method

.method private setState(Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;)V
    .locals 2

    .line 482
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "current state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mState:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", new state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logInternal(Ljava/lang/String;)V

    .line 483
    iput-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mState:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    return-void
.end method

.method private shouldAddAuctionParams(I)Z
    .locals 1

    const/16 v0, 0x3eb

    if-eq p1, v0, :cond_1

    const/16 v0, 0x516

    if-eq p1, v0, :cond_1

    const/16 v0, 0x515

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

.method private shouldNotifyNetworkAvailabilityChanged(Z)Z
    .locals 3

    .line 954
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mLastReportedAvailabilityState:Ljava/lang/Boolean;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v2, 0x1

    if-eqz p1, :cond_1

    .line 958
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/ironsource/mediationsdk/ProgRvManager;->isRewardedVideoAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    if-nez p1, :cond_2

    .line 962
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mLastReportedAvailabilityState:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2

    :goto_0
    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method private showVideo(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 2

    const-string v0, "showVideo()"

    .line 245
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logInternal(Ljava/lang/String;)V

    .line 246
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    invoke-virtual {v0, p1}, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;->increaseShowCounter(Lcom/ironsource/mediationsdk/ProgSmash;)V

    .line 247
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    invoke-virtual {v0, p1}, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;->isCapped(Lcom/ironsource/mediationsdk/ProgSmash;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 248
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->setCappedPerSession()V

    .line 249
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " rewarded video is now session capped"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->sendAutomationLog(Ljava/lang/String;)V

    .line 252
    :cond_0
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/model/Placement;->getPlacementName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/mediationsdk/utils/CappingManager;->incrementRvShowCounter(Landroid/content/Context;Ljava/lang/String;)V

    .line 253
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/model/Placement;->getPlacementName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/mediationsdk/utils/CappingManager;->isRvPlacementCapped(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x578

    .line 254
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEventWithPlacement(I)V

    .line 257
    :cond_1
    iget v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSessionDepth:I

    invoke-virtual {p1, p2, v0}, Lcom/ironsource/mediationsdk/ProgRvSmash;->showVideo(Lcom/ironsource/mediationsdk/model/Placement;I)V

    return-void
.end method

.method private updateNextWaterfallToLoad(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ironsource/mediationsdk/AuctionResponseItem;",
            ">;)V"
        }
    .end annotation

    .line 349
    iput-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mNextWaterfallToLoad:Ljava/util/List;

    .line 350
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 352
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    .line 353
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, v1}, Lcom/ironsource/mediationsdk/ProgRvManager;->getAsString(Lcom/ironsource/mediationsdk/AuctionResponseItem;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 356
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateNextWaterfallToLoad() - next waterfall is "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->logInternal(Ljava/lang/String;)V

    .line 358
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "Updated waterfall is empty"

    .line 359
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->logInternal(Ljava/lang/String;)V

    :cond_1
    const/16 p1, 0x51f

    const/4 v1, 0x1

    new-array v2, v1, [[Ljava/lang/Object;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "ext1"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 362
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v1

    aput-object v3, v2, v5

    invoke-direct {p0, p1, v2}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    return-void
.end method

.method private updateWaterfall(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ironsource/mediationsdk/AuctionResponseItem;",
            ">;)V"
        }
    .end annotation

    .line 399
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 400
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 401
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 403
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    .line 404
    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSmashes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getInstanceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ironsource/mediationsdk/ProgRvSmash;

    if-eqz v1, :cond_0

    const/4 v2, 0x1

    .line 406
    invoke-virtual {v1, v2}, Lcom/ironsource/mediationsdk/ProgRvSmash;->setIsLoadCandidate(Z)V

    .line 407
    iget-object v2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 408
    iget-object v2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getInstanceName()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;->ISAuctionPerformanceDidntAttemptToLoad:Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 412
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateWaterfall() - could not find matching smash for auction response item "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getInstanceName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logInternal(Ljava/lang/String;)V

    goto :goto_0

    .line 416
    :cond_1
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mNextWaterfallToLoad:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    return-void
.end method

.method private updateWaterfallToNonBidding()V
    .locals 3

    .line 340
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgRvManager;->extractNonBidderProvidersFromWaterfall()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->updateNextWaterfallToLoad(Ljava/util/List;)V

    .line 343
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "fallback_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentAuctionId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public declared-synchronized isRewardedVideoAvailable()Z
    .locals 3

    monitor-enter p0

    .line 263
    :try_start_0
    iget-boolean v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mShouldTrackNetworkState:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->isNetworkConnected(Landroid/content/Context;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 264
    monitor-exit p0

    return v1

    .line 267
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mState:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    sget-object v2, Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;->RV_STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    if-ne v0, v2, :cond_4

    iget-boolean v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsShowingVideo:Z

    if-eqz v0, :cond_1

    goto :goto_0

    .line 270
    :cond_1
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ironsource/mediationsdk/ProgRvSmash;

    .line 271
    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/ProgRvSmash;->isReadyToShow()Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_2

    const/4 v0, 0x1

    .line 272
    monitor-exit p0

    return v0

    .line 276
    :cond_3
    monitor-exit p0

    return v1

    .line 268
    :cond_4
    :goto_0
    monitor-exit p0

    return v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onAuctionFailed(ILjava/lang/String;ILjava/lang/String;J)V
    .locals 6

    const-string v0, "Auction failed | moving to fallback waterfall"

    .line 868
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logInternal(Ljava/lang/String;)V

    .line 870
    iput p3, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionTrial:I

    .line 871
    iput-object p4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionFallback:Ljava/lang/String;

    .line 872
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    const-string p4, "duration"

    const-string v0, "errorCode"

    const/16 v1, 0x515

    const/4 v2, 0x1

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-eqz p3, :cond_0

    new-array p2, v3, [[Ljava/lang/Object;

    new-array p3, v3, [Ljava/lang/Object;

    aput-object v0, p3, v4

    .line 873
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

    invoke-direct {p0, v1, p2}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEventWithoutAuctionId(I[[Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const/4 p3, 0x3

    new-array p3, p3, [[Ljava/lang/Object;

    new-array v5, v3, [Ljava/lang/Object;

    aput-object v0, v5, v4

    .line 875
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

    invoke-direct {p0, v1, p3}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEventWithoutAuctionId(I[[Ljava/lang/Object;)V

    .line 878
    :goto_0
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgRvManager;->updateWaterfallToNonBidding()V

    .line 880
    iget-boolean p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mShouldLoadAfterClose:Z

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsShowingVideo:Z

    if-nez p1, :cond_2

    .line 886
    :cond_1
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgRvManager;->loadSmashesForNextWaterfall()V

    :cond_2
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

    const-string v0, "makeAuction(): success"

    .line 845
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logInternal(Ljava/lang/String;)V

    .line 846
    iput-object p2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentAuctionId:Ljava/lang/String;

    .line 847
    iput-object p3, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mGenericNotifications:Lcom/ironsource/mediationsdk/AuctionResponseItem;

    .line 848
    iput p4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionTrial:I

    const-string p2, ""

    .line 849
    iput-object p2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionFallback:Ljava/lang/String;

    const/4 p2, 0x1

    new-array p3, p2, [[Ljava/lang/Object;

    const/4 p4, 0x2

    new-array p4, p4, [Ljava/lang/Object;

    const-string v0, "duration"

    const/4 v1, 0x0

    aput-object v0, p4, v1

    .line 850
    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p5

    aput-object p5, p4, p2

    aput-object p4, p3, v1

    const/16 p2, 0x516

    invoke-direct {p0, p2, p3}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 851
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->updateNextWaterfallToLoad(Ljava/util/List;)V

    .line 853
    iget-boolean p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mShouldLoadAfterClose:Z

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsShowingVideo:Z

    if-nez p1, :cond_1

    .line 859
    :cond_0
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/ProgRvManager;->loadSmashesForNextWaterfall()V

    :cond_1
    return-void
.end method

.method public onLoadError(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V
    .locals 8

    .line 525
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 527
    monitor-enter p0

    :try_start_0
    const-string v1, "onLoadError "

    .line 528
    invoke-direct {p0, p1, v1}, Lcom/ironsource/mediationsdk/ProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V

    .line 530
    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentAuctionId:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_0

    .line 531
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onLoadError was invoked with auctionId:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " and the current id is "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentAuctionId:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/ironsource/mediationsdk/ProgRvManager;->logInternal(Ljava/lang/String;)V

    const p2, 0x13da3

    const/4 v0, 0x2

    new-array v1, v0, [[Ljava/lang/Object;

    new-array v4, v0, [Ljava/lang/Object;

    const-string v5, "errorCode"

    aput-object v5, v4, v3

    const/4 v5, 0x4

    .line 532
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    aput-object v4, v1, v3

    new-array v0, v0, [Ljava/lang/Object;

    const-string v4, "reason"

    aput-object v4, v0, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "loadError wrong auction ID "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mState:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    aput-object v0, v1, v2

    invoke-virtual {p1, p2, v1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->sendProviderEvent(I[[Ljava/lang/Object;)V

    .line 533
    monitor-exit p0

    return-void

    .line 536
    :cond_0
    iget-object p2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    sget-object v4, Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;->ISAuctionPerformanceFailedToLoad:Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;

    invoke-virtual {p2, v1, v4}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 540
    iget-object p2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v1, 0x0

    const/4 v4, 0x0

    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/ironsource/mediationsdk/ProgRvSmash;

    .line 541
    invoke-virtual {v5}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getIsLoadCandidate()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 542
    iget-boolean v6, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAdvancedLoading:Z

    if-eqz v6, :cond_4

    invoke-virtual {v5}, Lcom/ironsource/mediationsdk/ProgRvSmash;->isBidder()Z

    move-result v6

    if-eqz v6, :cond_4

    if-nez v1, :cond_2

    if-eqz v4, :cond_4

    :cond_2
    if-eqz v1, :cond_3

    const-string p1, "a non bidder is being loaded"

    goto :goto_1

    :cond_3
    const-string p1, "a non bidder was already loaded successfully"

    .line 550
    :goto_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Advanced Loading: Won\'t start loading bidder "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " as "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->logInternal(Ljava/lang/String;)V

    goto :goto_3

    .line 554
    :cond_4
    iget-object v6, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v5}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 556
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 558
    iget-boolean v6, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAdvancedLoading:Z

    if-eqz v6, :cond_7

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->isBidder()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-virtual {v5}, Lcom/ironsource/mediationsdk/ProgRvSmash;->isBidder()Z

    move-result v5

    if-nez v5, :cond_7

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    iget v6, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mMaxSmashesToLoad:I

    if-ge v5, v6, :cond_7

    :goto_2
    const/4 v1, 0x1

    goto :goto_0

    .line 570
    :cond_5
    invoke-virtual {v5}, Lcom/ironsource/mediationsdk/ProgRvSmash;->isLoadingInProgress()Z

    move-result v6

    if-eqz v6, :cond_6

    goto :goto_2

    .line 572
    :cond_6
    invoke-virtual {v5}, Lcom/ironsource/mediationsdk/ProgRvSmash;->isReadyToShow()Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    .line 577
    :cond_7
    :goto_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    if-nez p1, :cond_8

    if-nez v4, :cond_8

    if-nez v1, :cond_8

    const-string p1, "onLoadError(): No other available smashes"

    .line 578
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->logInternal(Ljava/lang/String;)V

    .line 579
    invoke-direct {p0, v3}, Lcom/ironsource/mediationsdk/ProgRvManager;->reportAvailabilityIfNeeded(Z)V

    .line 580
    sget-object p1, Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;->RV_STATE_NOT_LOADED:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->setState(Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;)V

    .line 581
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mRvLoadTrigger:Lcom/ironsource/mediationsdk/RvLoadTrigger;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/RvLoadTrigger;->loadError()V

    .line 583
    :cond_8
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 586
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_9

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/ironsource/mediationsdk/ProgRvSmash;

    .line 587
    invoke-direct {p0, p2}, Lcom/ironsource/mediationsdk/ProgRvManager;->loadSmash(Lcom/ironsource/mediationsdk/ProgRvSmash;)V

    goto :goto_4

    :cond_9
    return-void

    :catchall_0
    move-exception p1

    .line 583
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized onLoadSuccess(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V
    .locals 11

    monitor-enter p0

    :try_start_0
    const-string v0, "onLoadSuccess "

    .line 491
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V

    .line 493
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentAuctionId:Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 494
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onLoadSuccess was invoked with auctionId: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " and the current id is "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentAuctionId:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/ironsource/mediationsdk/ProgRvManager;->logInternal(Ljava/lang/String;)V

    const p2, 0x13da3

    new-array v0, v2, [[Ljava/lang/Object;

    new-array v4, v2, [Ljava/lang/Object;

    const-string v5, "errorCode"

    aput-object v5, v4, v1

    .line 495
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v3

    aput-object v4, v0, v1

    new-array v2, v2, [Ljava/lang/Object;

    const-string v4, "reason"

    aput-object v4, v2, v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onLoadSuccess wrong auction ID "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mState:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    aput-object v2, v0, v3

    invoke-virtual {p1, p2, v0}, Lcom/ironsource/mediationsdk/ProgRvSmash;->sendProviderEvent(I[[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 496
    monitor-exit p0

    return-void

    .line 499
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mState:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    .line 500
    iget-object v4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;->ISAuctionPerformanceLoadedSuccessfully:Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;

    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 501
    invoke-direct {p0, v3}, Lcom/ironsource/mediationsdk/ProgRvManager;->reportAvailabilityIfNeeded(Z)V

    .line 503
    iget-object v4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mState:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    sget-object v5, Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;->RV_STATE_LOADING_SMASHES:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    if-ne v4, v5, :cond_3

    .line 504
    sget-object v4, Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;->RV_STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    invoke-direct {p0, v4}, Lcom/ironsource/mediationsdk/ProgRvManager;->setState(Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;)V

    .line 505
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionStartTime:J

    sub-long/2addr v4, v6

    const/16 v6, 0x3eb

    new-array v7, v3, [[Ljava/lang/Object;

    new-array v8, v2, [Ljava/lang/Object;

    const-string v9, "duration"

    aput-object v9, v8, v1

    .line 506
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v8, v3

    aput-object v8, v7, v1

    invoke-direct {p0, v6, v7}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 508
    iget-boolean v4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsAuctionEnabled:Z

    if-eqz v4, :cond_3

    .line 509
    iget-object v4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    if-eqz v10, :cond_1

    .line 512
    iget-object p2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceType()I

    move-result v0

    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mGenericNotifications:Lcom/ironsource/mediationsdk/AuctionResponseItem;

    invoke-virtual {p2, v10, v0, v1}, Lcom/ironsource/mediationsdk/AuctionHandler;->reportLoadSuccess(Lcom/ironsource/mediationsdk/AuctionResponseItem;ILcom/ironsource/mediationsdk/AuctionResponseItem;)V

    .line 513
    iget-object v5, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

    iget-object p2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    move-object v6, p2

    check-cast v6, Ljava/util/concurrent/CopyOnWriteArrayList;

    iget-object v7, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceType()I

    move-result v8

    iget-object v9, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mGenericNotifications:Lcom/ironsource/mediationsdk/AuctionResponseItem;

    invoke-virtual/range {v5 .. v10}, Lcom/ironsource/mediationsdk/AuctionHandler;->reportAuctionLose(Ljava/util/concurrent/CopyOnWriteArrayList;Ljava/util/concurrent/ConcurrentHashMap;ILcom/ironsource/mediationsdk/AuctionResponseItem;Lcom/ironsource/mediationsdk/AuctionResponseItem;)V

    goto :goto_1

    :cond_1
    if-eqz p1, :cond_2

    .line 515
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_2
    const-string p1, "Smash is null"

    .line 516
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onLoadSuccess winner instance "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " missing from waterfall. auctionId: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " and the current id is "

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentAuctionId:Ljava/lang/String;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/ironsource/mediationsdk/ProgRvManager;->logErrorInternal(Ljava/lang/String;)V

    const p2, 0x13da5

    const/4 v4, 0x3

    new-array v4, v4, [[Ljava/lang/Object;

    new-array v5, v2, [Ljava/lang/Object;

    const-string v6, "errorCode"

    aput-object v6, v5, v1

    const/16 v6, 0x3f2

    .line 517
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    aput-object v5, v4, v1

    new-array v5, v2, [Ljava/lang/Object;

    const-string v6, "reason"

    aput-object v6, v5, v1

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Loaded missing "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v3

    aput-object v5, v4, v3

    new-array v0, v2, [Ljava/lang/Object;

    const-string v5, "ext1"

    aput-object v5, v0, v1

    aput-object p1, v0, v3

    aput-object v0, v4, v2

    invoke-direct {p0, p2, v4}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 521
    :cond_3
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onLoadTriggered()V
    .locals 2

    monitor-enter p0

    .line 837
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onLoadTriggered: RV load was triggered in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mState:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " state"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logInternal(Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    .line 838
    invoke-direct {p0, v0, v1}, Lcom/ironsource/mediationsdk/ProgRvManager;->loadRewardedVideo(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 839
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onNetworkAvailabilityChanged(Z)V
    .locals 4

    .line 904
    iget-boolean v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mShouldTrackNetworkState:Z

    if-nez v0, :cond_0

    return-void

    .line 908
    :cond_0
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Network Availability Changed To: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 910
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->shouldNotifyNetworkAvailabilityChanged(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 911
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->reportAvailabilityIfNeeded(Z)V

    :cond_1
    return-void
.end method

.method public onRewardedVideoAdClicked(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 1

    const-string v0, "onRewardedVideoAdClicked"

    .line 707
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V

    .line 708
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdClicked(Lcom/ironsource/mediationsdk/model/Placement;)V

    return-void
.end method

.method public onRewardedVideoAdClosed(Lcom/ironsource/mediationsdk/ProgRvSmash;)V
    .locals 6

    .line 648
    monitor-enter p0

    const/16 v0, 0x4b3

    const/4 v1, 0x1

    :try_start_0
    new-array v2, v1, [[Ljava/lang/Object;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "ext1"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "otherRVAvailable = false"

    aput-object v4, v3, v1

    aput-object v3, v2, v5

    .line 652
    invoke-virtual {p1, v0, v2}, Lcom/ironsource/mediationsdk/ProgRvSmash;->sendProviderEventWithPlacement(I[[Ljava/lang/Object;)V

    .line 654
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onRewardedVideoAdClosed, mediation state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mState:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V

    .line 655
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdClosed()V

    .line 656
    iput-boolean v5, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsShowingVideo:Z

    .line 658
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mState:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    sget-object v0, Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;->RV_STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    if-eq p1, v0, :cond_0

    .line 659
    invoke-direct {p0, v5}, Lcom/ironsource/mediationsdk/ProgRvManager;->reportAvailabilityIfNeeded(Z)V

    .line 662
    :cond_0
    iget-boolean p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsAuctionOnShowStart:Z

    if-eqz p1, :cond_1

    .line 664
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mNextWaterfallToLoad:Ljava/util/List;

    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_2

    .line 665
    new-instance p1, Ljava/util/Timer;

    invoke-direct {p1}, Ljava/util/Timer;-><init>()V

    new-instance v0, Lcom/ironsource/mediationsdk/ProgRvManager$3;

    invoke-direct {v0, p0}, Lcom/ironsource/mediationsdk/ProgRvManager$3;-><init>(Lcom/ironsource/mediationsdk/ProgRvManager;)V

    iget-wide v1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mTimeToWaitBeforeLoadMS:J

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto :goto_0

    .line 674
    :cond_1
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mRvLoadTrigger:Lcom/ironsource/mediationsdk/RvLoadTrigger;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/RvLoadTrigger;->showEnd()V

    .line 676
    :cond_2
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onRewardedVideoAdEnded(Lcom/ironsource/mediationsdk/ProgRvSmash;)V
    .locals 1

    const-string v0, "onRewardedVideoAdEnded"

    .line 691
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V

    .line 692
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdEnded()V

    return-void
.end method

.method public onRewardedVideoAdOpened(Lcom/ironsource/mediationsdk/ProgRvSmash;)V
    .locals 8

    .line 596
    monitor-enter p0

    .line 597
    :try_start_0
    iget v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSessionDepth:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSessionDepth:I

    const-string v0, "onRewardedVideoAdOpened"

    .line 598
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V

    .line 599
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdOpened()V

    .line 601
    iget-boolean v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsAuctionEnabled:Z

    if-eqz v0, :cond_2

    .line 602
    iget-object v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    if-eqz v0, :cond_0

    .line 605
    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceType()I

    move-result v2

    iget-object v3, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mGenericNotifications:Lcom/ironsource/mediationsdk/AuctionResponseItem;

    iget-object v4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/ironsource/mediationsdk/AuctionHandler;->reportImpression(Lcom/ironsource/mediationsdk/AuctionResponseItem;ILcom/ironsource/mediationsdk/AuctionResponseItem;Ljava/lang/String;)V

    .line 606
    iget-object v1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p1

    sget-object v2, Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;->ISAuctionPerformanceShowedSuccessfully:Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;

    invoke-virtual {v1, p1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 609
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->reportImpressionDataToPublisher(Lcom/ironsource/mediationsdk/AuctionResponseItem;Ljava/lang/String;)V

    goto :goto_1

    :cond_0
    if-eqz p1, :cond_1

    .line 613
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    const-string p1, "Smash is null"

    .line 614
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onRewardedVideoAdOpened showing instance "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " missing from waterfall"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logErrorInternal(Ljava/lang/String;)V

    const v0, 0x13da5

    const/4 v2, 0x3

    new-array v2, v2, [[Ljava/lang/Object;

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Object;

    const-string v5, "errorCode"

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const/16 v5, 0x3f3

    .line 615
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    aput-object v4, v2, v6

    new-array v4, v3, [Ljava/lang/Object;

    const-string v5, "reason"

    aput-object v5, v4, v6

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Showing missing "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mState:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    aput-object v4, v2, v1

    new-array v4, v3, [Ljava/lang/Object;

    const-string v5, "ext1"

    aput-object v5, v4, v6

    aput-object p1, v4, v1

    aput-object v4, v2, v3

    invoke-direct {p0, v0, v2}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 621
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mRvLoadTrigger:Lcom/ironsource/mediationsdk/RvLoadTrigger;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/RvLoadTrigger;->showStart()V

    .line 622
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onRewardedVideoAdRewarded(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 1

    const-string v0, "onRewardedVideoAdRewarded"

    .line 699
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V

    .line 700
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdRewarded(Lcom/ironsource/mediationsdk/model/Placement;)V

    return-void
.end method

.method public onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgRvSmash;)V
    .locals 7

    .line 629
    monitor-enter p0

    .line 630
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onRewardedVideoAdShowFailed error="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p2, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V

    const/16 v0, 0x459

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

    move-result-object v3

    aput-object v3, v1, v6

    aput-object v1, v2, v6

    invoke-direct {p0, v0, v2}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEventWithPlacement(I[[Ljava/lang/Object;)V

    .line 633
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    .line 634
    iput-boolean v5, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsShowingVideo:Z

    .line 635
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/ProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p2

    sget-object v0, Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;->ISAuctionPerformanceFailedToShow:Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;

    invoke-virtual {p1, p2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 637
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mState:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    sget-object p2, Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;->RV_STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    if-eq p1, p2, :cond_0

    .line 638
    invoke-direct {p0, v5}, Lcom/ironsource/mediationsdk/ProgRvManager;->reportAvailabilityIfNeeded(Z)V

    .line 640
    :cond_0
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mRvLoadTrigger:Lcom/ironsource/mediationsdk/RvLoadTrigger;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/RvLoadTrigger;->showError()V

    .line 641
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onRewardedVideoAdStarted(Lcom/ironsource/mediationsdk/ProgRvSmash;)V
    .locals 1

    const-string v0, "onRewardedVideoAdStarted"

    .line 683
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/ProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V

    .line 684
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdStarted()V

    return-void
.end method

.method public shouldTrackNetworkState(Landroid/content/Context;Z)V
    .locals 4

    .line 925
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ProgRvManager Should Track Network State: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 926
    iput-boolean p2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mShouldTrackNetworkState:Z

    if-eqz p2, :cond_1

    .line 929
    iget-object p2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mNetworkStateReceiver:Lcom/ironsource/environment/NetworkStateReceiver;

    if-nez p2, :cond_0

    .line 930
    new-instance p2, Lcom/ironsource/environment/NetworkStateReceiver;

    invoke-direct {p2, p1, p0}, Lcom/ironsource/environment/NetworkStateReceiver;-><init>(Landroid/content/Context;Lcom/ironsource/environment/NetworkStateReceiver$NetworkStateReceiverListener;)V

    iput-object p2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mNetworkStateReceiver:Lcom/ironsource/environment/NetworkStateReceiver;

    .line 933
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mNetworkStateReceiver:Lcom/ironsource/environment/NetworkStateReceiver;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    goto :goto_0

    .line 935
    :cond_1
    iget-object p2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mNetworkStateReceiver:Lcom/ironsource/environment/NetworkStateReceiver;

    if-eqz p2, :cond_2

    .line 936
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mNetworkStateReceiver:Lcom/ironsource/environment/NetworkStateReceiver;

    invoke-virtual {p1, p2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public declared-synchronized showRewardedVideo(Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 8

    monitor-enter p0

    const/16 v0, 0x459

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez p1, :cond_0

    :try_start_0
    const-string p1, "showRewardedVideo error: empty default placement"

    .line 185
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->logAPIError(Ljava/lang/String;)V

    .line 186
    new-instance v4, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const/16 v5, 0x3fd

    invoke-direct {v4, v5, p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 187
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array v4, v1, [[Ljava/lang/Object;

    new-array v6, v1, [Ljava/lang/Object;

    const-string v7, "errorCode"

    aput-object v7, v6, v2

    .line 188
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v6, v3

    aput-object v6, v4, v2

    new-array v1, v1, [Ljava/lang/Object;

    const-string v5, "reason"

    aput-object v5, v1, v2

    aput-object p1, v1, v3

    aput-object v1, v4, v3

    invoke-direct {p0, v0, v4, v2, v3}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;ZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 189
    monitor-exit p0

    return-void

    .line 192
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/model/Placement;->getPlacementName()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    .line 193
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "showRewardedVideo("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/ironsource/mediationsdk/ProgRvManager;->logApi(Ljava/lang/String;)V

    const/16 v4, 0x44c

    .line 194
    invoke-direct {p0, v4}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEventWithPlacement(I)V

    .line 196
    iget-boolean v4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsShowingVideo:Z

    if-eqz v4, :cond_1

    const-string p1, "showRewardedVideo error: can\'t show ad while an ad is already showing"

    .line 198
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->logAPIError(Ljava/lang/String;)V

    .line 199
    new-instance v4, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const/16 v5, 0x3fe

    invoke-direct {v4, v5, p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 200
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array v4, v1, [[Ljava/lang/Object;

    new-array v6, v1, [Ljava/lang/Object;

    const-string v7, "errorCode"

    aput-object v7, v6, v2

    .line 201
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v6, v3

    aput-object v6, v4, v2

    new-array v1, v1, [Ljava/lang/Object;

    const-string v5, "reason"

    aput-object v5, v1, v2

    aput-object p1, v1, v3

    aput-object v1, v4, v3

    invoke-direct {p0, v0, v4}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEventWithPlacement(I[[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 202
    monitor-exit p0

    return-void

    .line 205
    :cond_1
    :try_start_2
    iget-object v4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mState:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    sget-object v5, Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;->RV_STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    if-eq v4, v5, :cond_2

    const-string p1, "showRewardedVideo error: show called while no ads are available"

    .line 207
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->logAPIError(Ljava/lang/String;)V

    .line 208
    new-instance v4, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const/16 v5, 0x3ff

    invoke-direct {v4, v5, p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 209
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array v4, v1, [[Ljava/lang/Object;

    new-array v6, v1, [Ljava/lang/Object;

    const-string v7, "errorCode"

    aput-object v7, v6, v2

    .line 210
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v6, v3

    aput-object v6, v4, v2

    new-array v1, v1, [Ljava/lang/Object;

    const-string v5, "reason"

    aput-object v5, v1, v2

    aput-object p1, v1, v3

    aput-object v1, v4, v3

    invoke-direct {p0, v0, v4}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEventWithPlacement(I[[Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 211
    monitor-exit p0

    return-void

    .line 214
    :cond_2
    :try_start_3
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object v4

    invoke-virtual {v4}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/ironsource/mediationsdk/utils/CappingManager;->isRvPlacementCapped(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 215
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "showRewardedVideo error: placement "

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " is capped"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 216
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->logAPIError(Ljava/lang/String;)V

    .line 217
    new-instance v4, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const/16 v5, 0x20c

    invoke-direct {v4, v5, p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 218
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array v4, v1, [[Ljava/lang/Object;

    new-array v6, v1, [Ljava/lang/Object;

    const-string v7, "errorCode"

    aput-object v7, v6, v2

    .line 219
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v6, v3

    aput-object v6, v4, v2

    new-array v1, v1, [Ljava/lang/Object;

    const-string v5, "reason"

    aput-object v5, v1, v2

    aput-object p1, v1, v3

    aput-object v1, v4, v3

    invoke-direct {p0, v0, v4}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEventWithPlacement(I[[Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 220
    monitor-exit p0

    return-void

    .line 223
    :cond_3
    :try_start_4
    iget-object v4, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mWaterfall:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v4}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/ironsource/mediationsdk/ProgRvSmash;

    .line 224
    invoke-virtual {v5}, Lcom/ironsource/mediationsdk/ProgRvSmash;->isReadyToShow()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 225
    iput-boolean v3, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mIsShowingVideo:Z

    .line 226
    iget v0, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSessionDepth:I

    invoke-virtual {v5, v3, v0}, Lcom/ironsource/mediationsdk/ProgRvSmash;->reportShowChance(ZI)V

    .line 227
    invoke-direct {p0, v5, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->showVideo(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V

    .line 228
    sget-object p1, Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;->RV_STATE_NOT_LOADED:Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->setState(Lcom/ironsource/mediationsdk/ProgRvManager$RV_MEDIATION_STATE;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 229
    monitor-exit p0

    return-void

    .line 231
    :cond_4
    :try_start_5
    iget v6, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mSessionDepth:I

    invoke-virtual {v5, v2, v6}, Lcom/ironsource/mediationsdk/ProgRvSmash;->reportShowChance(ZI)V

    goto :goto_0

    :cond_5
    const-string p1, "showRewardedVideo(): No ads to show"

    .line 236
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/ProgRvManager;->logApi(Ljava/lang/String;)V

    .line 237
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v4

    const-string v5, "Rewarded Video"

    invoke-static {v5}, Lcom/ironsource/mediationsdk/utils/ErrorBuilder;->buildNoAdsToShowError(Ljava/lang/String;)Lcom/ironsource/mediationsdk/logger/IronSourceError;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array v4, v1, [[Ljava/lang/Object;

    new-array v5, v1, [Ljava/lang/Object;

    const-string v6, "errorCode"

    aput-object v6, v5, v2

    const/16 v6, 0x1fd

    .line 238
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    aput-object v5, v4, v2

    new-array v1, v1, [Ljava/lang/Object;

    const-string v5, "reason"

    aput-object v5, v1, v2

    aput-object p1, v1, v3

    aput-object v1, v4, v3

    invoke-direct {p0, v0, v4}, Lcom/ironsource/mediationsdk/ProgRvManager;->sendMediationEventWithPlacement(I[[Ljava/lang/Object;)V

    .line 239
    iget-object p1, p0, Lcom/ironsource/mediationsdk/ProgRvManager;->mRvLoadTrigger:Lcom/ironsource/mediationsdk/RvLoadTrigger;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/RvLoadTrigger;->showError()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 240
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
