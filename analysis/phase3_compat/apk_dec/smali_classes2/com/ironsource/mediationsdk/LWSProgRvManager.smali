.class Lcom/ironsource/mediationsdk/LWSProgRvManager;
.super Lcom/ironsource/mediationsdk/BaseProgManager;
.source "LWSProgRvManager.java"

# interfaces
.implements Lcom/ironsource/mediationsdk/LWSRvManagerListener;
.implements Lcom/ironsource/mediationsdk/RvLoadTriggerCallback;
.implements Lcom/ironsource/mediationsdk/AuctionEventListener;
.implements Lcom/ironsource/mediationsdk/IProgRvManager;
.implements Lcom/ironsource/environment/NetworkStateReceiver$NetworkStateReceiverListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;
    }
.end annotation


# instance fields
.field private mAdvancedLoading:Z

.field private mAuctionFailedReason:Ljava/lang/String;

.field private mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

.field private mAuctionHistory:Lcom/ironsource/mediationsdk/AuctionHistory;

.field private mAuctionStartTime:J

.field private mAuctionTrial:I

.field private mCurrentPlacement:Ljava/lang/String;

.field private mGenericNotifications:Lcom/ironsource/mediationsdk/AuctionResponseItem;

.field private mIsAuctionEnabled:Z

.field private mIsShowingVideo:Z

.field private mLastChangedAvailabilityTime:J

.field private mLastReportedAvailabilityState:Ljava/lang/Boolean;

.field private mMaxSmashesToLoad:I

.field private mNetworkStateReceiver:Lcom/ironsource/environment/NetworkStateReceiver;

.field private mRvLoadTrigger:Lcom/ironsource/mediationsdk/RvLoadTrigger;

.field private mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

.field private mSessionDepth:I

.field private mShouldTrackNetworkState:Z

.field private mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

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

.field private final smashes:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/ironsource/mediationsdk/LWSProgRvSmash;",
            ">;"
        }
    .end annotation
.end field

.field private final stateLock:Ljava/lang/Object;

.field private waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/ironsource/mediationsdk/model/RewardedVideoConfigurations;Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;)V
    .locals 17
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

    move-object/from16 v8, p0

    move-object/from16 v0, p5

    .line 139
    invoke-direct {v8, v0}, Lcom/ironsource/mediationsdk/BaseProgManager;-><init>(Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;)V

    const-string v0, ""

    .line 94
    iput-object v0, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionFailedReason:Ljava/lang/String;

    const/4 v9, 0x0

    .line 98
    iput-boolean v9, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mShouldTrackNetworkState:Z

    const/4 v10, 0x1

    .line 107
    iput v10, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mSessionDepth:I

    .line 127
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->stateLock:Ljava/lang/Object;

    .line 140
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v11

    const v1, 0x13da0

    .line 141
    invoke-direct {v8, v1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEventWithoutAuctionId(I)V

    .line 142
    sget-object v1, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_INITIATING:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    invoke-direct {v8, v1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->setState(Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;)V

    const/4 v1, 0x0

    .line 143
    iput-object v1, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mLastReportedAvailabilityState:Ljava/lang/Boolean;

    .line 144
    invoke-virtual/range {p2 .. p2}, Lcom/ironsource/mediationsdk/model/RewardedVideoConfigurations;->getRewardedVideoAdaptersSmartLoadAmount()I

    move-result v1

    iput v1, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mMaxSmashesToLoad:I

    .line 145
    invoke-virtual/range {p2 .. p2}, Lcom/ironsource/mediationsdk/model/RewardedVideoConfigurations;->getRewardedVideoAdvancedLoading()Z

    move-result v1

    iput-boolean v1, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAdvancedLoading:Z

    .line 146
    iput-object v0, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    .line 147
    invoke-virtual/range {p2 .. p2}, Lcom/ironsource/mediationsdk/model/RewardedVideoConfigurations;->getRewardedVideoAuctionSettings()Lcom/ironsource/mediationsdk/utils/AuctionSettings;

    move-result-object v13

    .line 148
    iput-boolean v9, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mIsShowingVideo:Z

    .line 150
    new-instance v0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual/range {p2 .. p2}, Lcom/ironsource/mediationsdk/model/RewardedVideoConfigurations;->getRewardedVideoAuctionSettings()Lcom/ironsource/mediationsdk/utils/AuctionSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/utils/AuctionSettings;->getLoadWhileShowSupportArray()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Lcom/ironsource/mediationsdk/model/RewardedVideoConfigurations;->getRewardedVideoAuctionSettings()Lcom/ironsource/mediationsdk/utils/AuctionSettings;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/utils/AuctionSettings;->getTimeToDeleteOldWaterfallAfterAuction()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;-><init>(Ljava/util/List;I)V

    iput-object v0, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    .line 151
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    .line 152
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    .line 153
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mLastChangedAvailabilityTime:J

    .line 156
    invoke-virtual {v13}, Lcom/ironsource/mediationsdk/utils/AuctionSettings;->getNumOfMaxTrials()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mIsAuctionEnabled:Z

    if-eqz v0, :cond_1

    .line 158
    new-instance v0, Lcom/ironsource/mediationsdk/AuctionHandler;

    const-string v1, "rewardedVideo"

    invoke-direct {v0, v1, v13, v8}, Lcom/ironsource/mediationsdk/AuctionHandler;-><init>(Ljava/lang/String;Lcom/ironsource/mediationsdk/utils/AuctionSettings;Lcom/ironsource/mediationsdk/AuctionEventListener;)V

    iput-object v0, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

    .line 160
    :cond_1
    new-instance v0, Lcom/ironsource/mediationsdk/RvLoadTrigger;

    invoke-direct {v0, v13, v8}, Lcom/ironsource/mediationsdk/RvLoadTrigger;-><init>(Lcom/ironsource/mediationsdk/utils/AuctionSettings;Lcom/ironsource/mediationsdk/RvLoadTriggerCallback;)V

    iput-object v0, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mRvLoadTrigger:Lcom/ironsource/mediationsdk/RvLoadTrigger;

    .line 161
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->smashes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 162
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 166
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_2
    :goto_1
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/ironsource/mediationsdk/model/ProviderSettings;

    .line 167
    invoke-static {}, Lcom/ironsource/mediationsdk/AdapterRepository;->getInstance()Lcom/ironsource/mediationsdk/AdapterRepository;

    move-result-object v0

    invoke-virtual {v3}, Lcom/ironsource/mediationsdk/model/ProviderSettings;->getRewardedVideoSettings()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Lcom/ironsource/mediationsdk/AdapterRepository;->getAdapter(Lcom/ironsource/mediationsdk/model/ProviderSettings;Lorg/json/JSONObject;)Lcom/ironsource/mediationsdk/AbstractAdapter;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 169
    new-instance v7, Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    invoke-virtual/range {p2 .. p2}, Lcom/ironsource/mediationsdk/model/RewardedVideoConfigurations;->getRewardedVideoAdaptersSmartLoadTimeout()I

    move-result v5

    iget v4, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mSessionDepth:I

    move-object v0, v7

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move/from16 v16, v4

    move-object/from16 v4, p0

    move-object/from16 p1, v7

    move/from16 v7, v16

    invoke-direct/range {v0 .. v7}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/mediationsdk/model/ProviderSettings;Lcom/ironsource/mediationsdk/LWSRvManagerListener;ILcom/ironsource/mediationsdk/AbstractAdapter;I)V

    .line 170
    invoke-virtual/range {p1 .. p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v0

    .line 171
    iget-object v1, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->smashes:Ljava/util/concurrent/ConcurrentHashMap;

    move-object/from16 v2, p1

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 175
    :cond_3
    new-instance v0, Lcom/ironsource/mediationsdk/AuctionHistory;

    invoke-virtual {v13}, Lcom/ironsource/mediationsdk/utils/AuctionSettings;->getAuctionSavedHistoryLimit()I

    move-result v1

    invoke-direct {v0, v14, v1}, Lcom/ironsource/mediationsdk/AuctionHistory;-><init>(Ljava/util/List;I)V

    iput-object v0, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionHistory:Lcom/ironsource/mediationsdk/AuctionHistory;

    .line 176
    new-instance v0, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->smashes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {v0, v1}, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;-><init>(Ljava/util/List;)V

    iput-object v0, v8, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    .line 178
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    sub-long/2addr v0, v11

    const v2, 0x13da1

    new-array v3, v10, [[Ljava/lang/Object;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "duration"

    aput-object v5, v4, v9

    .line 179
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v4, v10

    aput-object v4, v3, v9

    invoke-direct {v8, v2, v3}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEventWithoutAuctionId(I[[Ljava/lang/Object;)V

    .line 182
    invoke-virtual {v13}, Lcom/ironsource/mediationsdk/utils/AuctionSettings;->getTimeToWaitBeforeFirstAuctionMs()J

    move-result-wide v0

    invoke-direct {v8, v0, v1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->loadRewardedVideo(J)V

    return-void
.end method

.method static synthetic access$000(Lcom/ironsource/mediationsdk/LWSProgRvManager;)V
    .locals 0

    .line 79
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->makeAuction()V

    return-void
.end method

.method static synthetic access$100(Lcom/ironsource/mediationsdk/LWSProgRvManager;Ljava/lang/String;)V
    .locals 0

    .line 79
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/ironsource/mediationsdk/LWSProgRvManager;)Lcom/ironsource/mediationsdk/AuctionHistory;
    .locals 0

    .line 79
    iget-object p0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionHistory:Lcom/ironsource/mediationsdk/AuctionHistory;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/ironsource/mediationsdk/LWSProgRvManager;)I
    .locals 0

    .line 79
    iget p0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mSessionDepth:I

    return p0
.end method

.method static synthetic access$1200(Lcom/ironsource/mediationsdk/LWSProgRvManager;)Lcom/ironsource/mediationsdk/AuctionHandler;
    .locals 0

    .line 79
    iget-object p0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

    return-object p0
.end method

.method static synthetic access$202(Lcom/ironsource/mediationsdk/LWSProgRvManager;J)J
    .locals 0

    .line 79
    iput-wide p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionStartTime:J

    return-wide p1
.end method

.method static synthetic access$300(Lcom/ironsource/mediationsdk/LWSProgRvManager;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 0

    .line 79
    iget-object p0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->smashes:Ljava/util/concurrent/ConcurrentHashMap;

    return-object p0
.end method

.method static synthetic access$400(Lcom/ironsource/mediationsdk/LWSProgRvManager;)Lcom/ironsource/mediationsdk/utils/SessionCappingManager;
    .locals 0

    .line 79
    iget-object p0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    return-object p0
.end method

.method static synthetic access$500(Lcom/ironsource/mediationsdk/LWSProgRvManager;)Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;
    .locals 0

    .line 79
    iget-object p0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    return-object p0
.end method

.method static synthetic access$600(Lcom/ironsource/mediationsdk/LWSProgRvManager;I[[Ljava/lang/Object;)V
    .locals 0

    .line 79
    invoke-direct {p0, p1, p2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$700(Lcom/ironsource/mediationsdk/LWSProgRvManager;)V
    .locals 0

    .line 79
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->handleLoadFailure()V

    return-void
.end method

.method static synthetic access$800(Lcom/ironsource/mediationsdk/LWSProgRvManager;I)V
    .locals 0

    .line 79
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEventWithoutAuctionId(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/ironsource/mediationsdk/LWSProgRvManager;I[[Ljava/lang/Object;)V
    .locals 0

    .line 79
    invoke-direct {p0, p1, p2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEventWithoutAuctionId(I[[Ljava/lang/Object;)V

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

    .line 680
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 681
    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->smashes:Ljava/util/concurrent/ConcurrentHashMap;

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

    check-cast v2, Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    .line 682
    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->isBidder()Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    invoke-virtual {v3, v2}, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;->isCapped(Lcom/ironsource/mediationsdk/ProgSmash;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v3, v2}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->shouldAddSmashToWaterfallRequest(Lcom/ironsource/mediationsdk/LWSProgRvSmash;)Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_0

    .line 685
    :cond_1
    new-instance v3, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lcom/ironsource/mediationsdk/AuctionResponseItem;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private getAuctionResponseItemAsStringForReporting(Lcom/ironsource/mediationsdk/AuctionResponseItem;)Ljava/lang/String;
    .locals 2

    .line 742
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->smashes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    if-eqz v0, :cond_0

    .line 746
    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceType()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 749
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

    .line 752
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

    .line 811
    sget-object v0, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_NOT_LOADED:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->setState(Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;)V

    .line 812
    iget-boolean v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mIsShowingVideo:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 813
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->reportAvailabilityIfNeeded(Z)V

    .line 815
    :cond_0
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mRvLoadTrigger:Lcom/ironsource/mediationsdk/RvLoadTrigger;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/RvLoadTrigger;->loadError()V

    return-void
.end method

.method private loadRewardedVideo(J)V
    .locals 7

    .line 554
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;->areAllSmashesCapped()Z

    move-result v0

    const-string v1, "reason"

    const-string v2, "errorCode"

    const v3, 0x13c69

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x2

    if-eqz v0, :cond_0

    const-string p1, "all smashes are capped"

    .line 555
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    new-array p2, v6, [[Ljava/lang/Object;

    new-array v0, v6, [Ljava/lang/Object;

    aput-object v2, v0, v5

    const v2, 0x13881

    .line 556
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v4

    aput-object v0, p2, v5

    new-array v0, v6, [Ljava/lang/Object;

    aput-object v1, v0, v5

    aput-object p1, v0, v4

    aput-object v0, p2, v4

    invoke-direct {p0, v3, p2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 557
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->handleLoadFailure()V

    return-void

    .line 561
    :cond_0
    iget-boolean v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mIsAuctionEnabled:Z

    if-eqz v0, :cond_2

    .line 562
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 564
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionHistory:Lcom/ironsource/mediationsdk/AuctionHistory;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, v1}, Lcom/ironsource/mediationsdk/AuctionHistory;->storeWaterfallPerformance(Ljava/util/concurrent/ConcurrentHashMap;)V

    .line 565
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 568
    :cond_1
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    new-instance v1, Lcom/ironsource/mediationsdk/LWSProgRvManager$1;

    invoke-direct {v1, p0}, Lcom/ironsource/mediationsdk/LWSProgRvManager$1;-><init>(Lcom/ironsource/mediationsdk/LWSProgRvManager;)V

    invoke-virtual {v0, v1, p1, p2}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto :goto_0

    :cond_2
    const-string p1, "auction fallback flow starting"

    .line 575
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    .line 578
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->updateWaterfallToNonBidding()V

    .line 582
    iget-object p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfall()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "loadSmashes -  waterfall is empty"

    .line 583
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    new-array p1, v6, [[Ljava/lang/Object;

    new-array p2, v6, [Ljava/lang/Object;

    aput-object v2, p2, v5

    const v0, 0x13884

    .line 584
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, p2, v4

    aput-object p2, p1, v5

    new-array p2, v6, [Ljava/lang/Object;

    aput-object v1, p2, v5

    const-string v0, "waterfall is empty"

    aput-object v0, p2, v4

    aput-object p2, p1, v4

    invoke-direct {p0, v3, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 585
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->handleLoadFailure()V

    return-void

    :cond_3
    const/16 p1, 0x3e8

    .line 590
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEventWithoutAuctionId(I)V

    .line 592
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->loadSmashes()V

    :goto_0
    return-void
.end method

.method private loadSmash(Lcom/ironsource/mediationsdk/LWSProgRvSmash;)V
    .locals 2

    .line 801
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getServerData()Ljava/lang/String;

    move-result-object v0

    .line 802
    invoke-virtual {p1, v0}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->setDynamicDemandSourceIdByServerData(Ljava/lang/String;)V

    .line 803
    invoke-virtual {p1, v0}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->loadVideo(Ljava/lang/String;)V

    return-void
.end method

.method private loadSmashes()V
    .locals 7

    .line 761
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfall()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v0, "loadSmashes -  waterfall is empty"

    .line 762
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    const v0, 0x13c69

    const/4 v2, 0x2

    new-array v3, v2, [[Ljava/lang/Object;

    new-array v4, v2, [Ljava/lang/Object;

    const-string v5, "errorCode"

    aput-object v5, v4, v1

    const v5, 0x13884

    .line 763
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

    invoke-direct {p0, v0, v3}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 764
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->handleLoadFailure()V

    return-void

    .line 768
    :cond_0
    sget-object v0, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_LOADING_SMASHES:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->setState(Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;)V

    const/4 v0, 0x0

    .line 773
    :goto_0
    iget-object v2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfall()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_4

    iget v2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mMaxSmashesToLoad:I

    if-ge v0, v2, :cond_4

    .line 774
    iget-object v2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfall()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    .line 775
    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getIsLoadCandidate()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 777
    iget-boolean v3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAdvancedLoading:Z

    if-eqz v3, :cond_2

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->isBidder()Z

    move-result v3

    if-eqz v3, :cond_2

    if-nez v0, :cond_1

    .line 783
    invoke-direct {p0, v2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->loadSmash(Lcom/ironsource/mediationsdk/LWSProgRvSmash;)V

    goto :goto_1

    .line 786
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Advanced Loading: Won\'t start loading bidder "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " as a non bidder is being loaded"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    goto :goto_1

    .line 792
    :cond_2
    invoke-direct {p0, v2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->loadSmash(Lcom/ironsource/mediationsdk/LWSProgRvSmash;)V

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

    .line 869
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->API:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const/4 v2, 0x3

    invoke-virtual {v0, v1, p1, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private logApi(Ljava/lang/String;)V
    .locals 3

    .line 873
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->API:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p1, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private logErrorInternal(Ljava/lang/String;)V
    .locals 4

    .line 864
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "LWSProgRvManager: "

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

    .line 859
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "LWSProgRvManager: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private logSmashCallback(Lcom/ironsource/mediationsdk/LWSProgRvSmash;Ljava/lang/String;)V
    .locals 3

    .line 853
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " : "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 854
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object p2

    sget-object v0, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->ADAPTER_CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LWSProgRvManager: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private makeAuction()V
    .locals 3

    .line 617
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->stateLock:Ljava/lang/Object;

    monitor-enter v0

    .line 618
    :try_start_0
    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    sget-object v2, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_AUCTION_IN_PROGRESS:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    if-eq v1, v2, :cond_0

    .line 619
    sget-object v1, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_AUCTION_IN_PROGRESS:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    invoke-direct {p0, v1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->setState(Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;)V

    .line 620
    new-instance v1, Lcom/ironsource/mediationsdk/LWSProgRvManager$2;

    invoke-direct {v1, p0}, Lcom/ironsource/mediationsdk/LWSProgRvManager$2;-><init>(Lcom/ironsource/mediationsdk/LWSProgRvManager;)V

    invoke-static {v1}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V

    .line 666
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private reportAvailabilityIfNeeded(Z)V
    .locals 9

    .line 825
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->stateLock:Ljava/lang/Object;

    monitor-enter v0

    .line 826
    :try_start_0
    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mLastReportedAvailabilityState:Ljava/lang/Boolean;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v1, p1, :cond_2

    .line 827
    :cond_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mLastReportedAvailabilityState:Ljava/lang/Boolean;

    .line 828
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mLastChangedAvailabilityTime:J

    sub-long/2addr v1, v3

    .line 829
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mLastChangedAvailabilityTime:J

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz p1, :cond_1

    const/16 v6, 0x457

    new-array v7, v5, [[Ljava/lang/Object;

    new-array v3, v3, [Ljava/lang/Object;

    const-string v8, "duration"

    aput-object v8, v3, v4

    .line 832
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v3, v5

    aput-object v3, v7, v4

    invoke-direct {p0, v6, v7}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    const/16 v6, 0x458

    new-array v7, v5, [[Ljava/lang/Object;

    new-array v3, v3, [Ljava/lang/Object;

    const-string v8, "duration"

    aput-object v8, v3, v4

    .line 834
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v3, v5

    aput-object v3, v7, v4

    invoke-direct {p0, v6, v7}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 836
    :goto_0
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAvailabilityChanged(Z)V

    .line 838
    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private sendMediationEvent(I[[Ljava/lang/Object;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 890
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;ZZ)V

    return-void
.end method

.method private sendMediationEvent(I[[Ljava/lang/Object;ZZ)V
    .locals 5

    .line 902
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "provider"

    const-string v2, "Mediation"

    .line 903
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x2

    .line 905
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "programmatic"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p4, :cond_0

    .line 906
    iget-object p4, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {p4}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfallId()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_0

    .line 907
    iget-object p4, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {p4}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfallId()Ljava/lang/String;

    move-result-object p4

    const-string v1, "auctionId"

    invoke-interface {v0, v1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    if-eqz p3, :cond_1

    .line 910
    iget-object p3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_1

    .line 911
    iget-object p3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    const-string p4, "placement"

    invoke-interface {v0, p4, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 914
    :cond_1
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->shouldAddAuctionParams(I)Z

    move-result p3

    if-eqz p3, :cond_2

    .line 915
    invoke-static {}, Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;->getInstance()Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;

    move-result-object p3

    iget p4, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionTrial:I

    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionFailedReason:Ljava/lang/String;

    invoke-virtual {p3, v0, p4, v1}, Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;->setEventAuctionParams(Ljava/util/Map;ILjava/lang/String;)V

    .line 918
    :cond_2
    iget p3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mSessionDepth:I

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    const-string p4, "sessionDepth"

    invoke-interface {v0, p4, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_3

    .line 922
    :try_start_0
    array-length p3, p2

    const/4 p4, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p3, :cond_3

    aget-object v2, p2, v1

    .line 923
    aget-object v3, v2, p4

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    aget-object v2, v2, v4

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    move-exception p2

    .line 927
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object p3

    sget-object p4, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LWSProgRvManager: RV sendMediationEvent "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v1, 0x3

    invoke-virtual {p3, p4, p2, v1}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 930
    :cond_3
    new-instance p2, Lcom/ironsource/eventsmodule/EventData;

    new-instance p3, Lorg/json/JSONObject;

    invoke-direct {p3, v0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-direct {p2, p1, p3}, Lcom/ironsource/eventsmodule/EventData;-><init>(ILorg/json/JSONObject;)V

    .line 931
    invoke-static {}, Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;->getInstance()Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;->log(Lcom/ironsource/eventsmodule/EventData;)V

    return-void
.end method

.method private sendMediationEventWithPlacement(I)V
    .locals 2

    const/4 v0, 0x0

    .line 894
    check-cast v0, [[Ljava/lang/Object;

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1, v1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;ZZ)V

    return-void
.end method

.method private sendMediationEventWithPlacement(I[[Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x1

    .line 898
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;ZZ)V

    return-void
.end method

.method private sendMediationEventWithoutAuctionId(I)V
    .locals 2

    const/4 v0, 0x0

    .line 886
    check-cast v0, [[Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1, v1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;ZZ)V

    return-void
.end method

.method private sendMediationEventWithoutAuctionId(I[[Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x0

    .line 882
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;ZZ)V

    return-void
.end method

.method private setState(Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;)V
    .locals 2

    .line 820
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "current state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", new state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    .line 821
    iput-object p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

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

    .line 998
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mLastReportedAvailabilityState:Ljava/lang/Boolean;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v2, 0x1

    if-eqz p1, :cond_1

    .line 1002
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->isRewardedVideoAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    if-nez p1, :cond_2

    .line 1006
    iget-object p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mLastReportedAvailabilityState:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2

    :goto_0
    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method private showVideo(Lcom/ironsource/mediationsdk/LWSProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 2

    const-string v0, "showVideo()"

    .line 598
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    .line 601
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    invoke-virtual {v0, p1}, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;->increaseShowCounter(Lcom/ironsource/mediationsdk/ProgSmash;)V

    .line 602
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mSessionCappingManager:Lcom/ironsource/mediationsdk/utils/SessionCappingManager;

    invoke-virtual {v0, p1}, Lcom/ironsource/mediationsdk/utils/SessionCappingManager;->isCapped(Lcom/ironsource/mediationsdk/ProgSmash;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 603
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->setCappedPerSession()V

    .line 604
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " rewarded video is now session capped"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->sendAutomationLog(Ljava/lang/String;)V

    .line 607
    :cond_0
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/model/Placement;->getPlacementName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/mediationsdk/utils/CappingManager;->incrementRvShowCounter(Landroid/content/Context;Ljava/lang/String;)V

    .line 608
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

    .line 609
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEventWithPlacement(I)V

    .line 612
    :cond_1
    invoke-virtual {p1, p2}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->showVideo(Lcom/ironsource/mediationsdk/model/Placement;)V

    return-void
.end method

.method private updateWaterfall(Ljava/util/List;Ljava/lang/String;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ironsource/mediationsdk/AuctionResponseItem;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 694
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 695
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 697
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 700
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 702
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    .line 704
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, v2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->getAuctionResponseItemAsStringForReporting(Lcom/ironsource/mediationsdk/AuctionResponseItem;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 706
    iget-object v4, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->smashes:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getInstanceName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    if-eqz v6, :cond_1

    .line 709
    invoke-static {}, Lcom/ironsource/mediationsdk/AdapterRepository;->getInstance()Lcom/ironsource/mediationsdk/AdapterRepository;

    move-result-object v4

    iget-object v5, v6, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->mAdapterConfig:Lcom/ironsource/mediationsdk/model/AdapterConfig;

    invoke-virtual {v5}, Lcom/ironsource/mediationsdk/model/AdapterConfig;->getProviderSettings()Lcom/ironsource/mediationsdk/model/ProviderSettings;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ironsource/mediationsdk/AdapterRepository;->createAdapter(Lcom/ironsource/mediationsdk/model/ProviderSettings;)Lcom/ironsource/mediationsdk/AbstractAdapter;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 711
    new-instance v4, Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    iget v9, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mSessionDepth:I

    iget v11, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionTrial:I

    iget-object v12, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionFailedReason:Ljava/lang/String;

    move-object v5, v4

    move-object v7, p0

    move-object v10, p2

    invoke-direct/range {v5 .. v12}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;-><init>(Lcom/ironsource/mediationsdk/LWSProgRvSmash;Lcom/ironsource/mediationsdk/LWSRvManagerListener;Lcom/ironsource/mediationsdk/AbstractAdapter;ILjava/lang/String;ILjava/lang/String;)V

    .line 712
    invoke-virtual {v4, v3}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->setIsLoadCandidate(Z)V

    .line 713
    invoke-virtual {v0, v4}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 714
    iget-object v3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 715
    iget-object v3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getInstanceName()Ljava/lang/String;

    move-result-object v2

    sget-object v4, Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;->ISAuctionPerformanceDidntAttemptToLoad:Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;

    invoke-virtual {v3, v2, v4}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 721
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateWaterfall() - could not find matching smash for auction response item "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getInstanceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 725
    :cond_2
    iget-object p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {p1, v0, p2}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->updateWaterFall(Ljava/util/concurrent/CopyOnWriteArrayList;Ljava/lang/String;)V

    .line 726
    iget-object p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->areWaterFallsOverMaximum()Z

    move-result p1

    const/4 p2, 0x2

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    const p1, 0x13da6

    new-array v2, v3, [[Ljava/lang/Object;

    new-array v4, p2, [Ljava/lang/Object;

    const-string v5, "reason"

    aput-object v5, v4, v0

    .line 727
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "waterfalls hold too many with size="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v6}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getNumberOfWaterfalls()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v3

    aput-object v4, v2, v0

    invoke-direct {p0, p1, v2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 731
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateWaterfall() - response waterfall is "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    .line 733
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-nez p1, :cond_4

    const-string p1, "Updated waterfall is empty"

    .line 734
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    :cond_4
    const/16 p1, 0x51f

    new-array v2, v3, [[Ljava/lang/Object;

    new-array p2, p2, [Ljava/lang/Object;

    const-string v4, "ext1"

    aput-object v4, p2, v0

    .line 737
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, p2, v3

    aput-object p2, v2, v0

    invoke-direct {p0, p1, v2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    return-void
.end method

.method private updateWaterfallToNonBidding()V
    .locals 4

    .line 672
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->extractNonBidderProvidersFromWaterfall()Ljava/util/List;

    move-result-object v0

    .line 675
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fallback_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->updateWaterfall(Ljava/util/List;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public isRewardedVideoAvailable()Z
    .locals 3

    .line 262
    iget-boolean v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mShouldTrackNetworkState:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->isNetworkConnected(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    return v1

    .line 266
    :cond_0
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    sget-object v2, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    if-ne v0, v2, :cond_3

    iget-boolean v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mIsShowingVideo:Z

    if-eqz v0, :cond_1

    goto :goto_0

    .line 271
    :cond_1
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfall()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    .line 272
    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->isReadyToShow()Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v0, 0x1

    return v0

    :cond_3
    :goto_0
    return v1
.end method

.method public onAuctionFailed(ILjava/lang/String;ILjava/lang/String;J)V
    .locals 6

    const-string v0, "Auction failed | moving to fallback waterfall"

    .line 524
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    .line 526
    iput p3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionTrial:I

    .line 527
    iput-object p4, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionFailedReason:Ljava/lang/String;

    .line 528
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->updateWaterfallToNonBidding()V

    .line 529
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

    .line 530
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

    invoke-direct {p0, v1, p2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEventWithoutAuctionId(I[[Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const/4 p3, 0x3

    new-array p3, p3, [[Ljava/lang/Object;

    new-array v5, v3, [Ljava/lang/Object;

    aput-object v0, v5, v4

    .line 532
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

    invoke-direct {p0, v1, p3}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEventWithoutAuctionId(I[[Ljava/lang/Object;)V

    .line 535
    :goto_0
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->loadSmashes()V

    return-void
.end method

.method public onAuctionSuccess(Ljava/util/List;Ljava/lang/String;Lcom/ironsource/mediationsdk/AuctionResponseItem;IJ)V
    .locals 1
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

    .line 511
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    .line 512
    iput-object p3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mGenericNotifications:Lcom/ironsource/mediationsdk/AuctionResponseItem;

    .line 514
    iput p4, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionTrial:I

    const-string p3, ""

    .line 515
    iput-object p3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionFailedReason:Ljava/lang/String;

    .line 516
    invoke-direct {p0, p1, p2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->updateWaterfall(Ljava/util/List;Ljava/lang/String;)V

    const/4 p1, 0x1

    new-array p2, p1, [[Ljava/lang/Object;

    const/4 p3, 0x2

    new-array p3, p3, [Ljava/lang/Object;

    const-string p4, "duration"

    const/4 v0, 0x0

    aput-object p4, p3, v0

    .line 517
    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    aput-object p4, p3, p1

    aput-object p3, p2, v0

    const/16 p1, 0x516

    invoke-direct {p0, p1, p2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 518
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->loadSmashes()V

    return-void
.end method

.method public onLoadError(Lcom/ironsource/mediationsdk/LWSProgRvSmash;)V
    .locals 10

    .line 328
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 330
    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->stateLock:Ljava/lang/Object;

    monitor-enter v1

    .line 331
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onLoadError mState="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, p1, v2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/LWSProgRvSmash;Ljava/lang/String;)V

    .line 333
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getAuctionId()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v3}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfallId()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ne v2, v3, :cond_c

    iget-object v2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    sget-object v3, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_AUCTION_IN_PROGRESS:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    if-ne v2, v3, :cond_0

    goto/16 :goto_5

    .line 339
    :cond_0
    iget-object v2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v3

    sget-object v6, Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;->ISAuctionPerformanceFailedToLoad:Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;

    invoke-virtual {v2, v3, v6}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    iget-object v2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    sget-object v3, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_LOADING_SMASHES:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    if-eq v2, v3, :cond_1

    iget-object v2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    sget-object v3, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    if-ne v2, v3, :cond_a

    .line 348
    :cond_1
    iget-object v2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfall()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v6, 0x0

    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    .line 349
    invoke-virtual {v7}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getIsLoadCandidate()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 350
    iget-boolean v8, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAdvancedLoading:Z

    if-eqz v8, :cond_5

    invoke-virtual {v7}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->isBidder()Z

    move-result v8

    if-eqz v8, :cond_5

    if-nez v3, :cond_3

    if-eqz v6, :cond_5

    :cond_3
    if-eqz v3, :cond_4

    const-string p1, "a non bidder is being loaded"

    goto :goto_1

    :cond_4
    const-string p1, "a non bidder was already loaded successfully"

    .line 358
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Advanced Loading: Won\'t start loading bidder "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " as "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    goto :goto_3

    .line 362
    :cond_5
    iget-object v8, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v7}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_2

    .line 364
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 366
    iget-boolean v8, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAdvancedLoading:Z

    if-eqz v8, :cond_8

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->isBidder()Z

    move-result v8

    if-eqz v8, :cond_8

    invoke-virtual {v7}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->isBidder()Z

    move-result v7

    if-nez v7, :cond_8

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    iget v8, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mMaxSmashesToLoad:I

    if-ge v7, v8, :cond_8

    :goto_2
    const/4 v3, 0x1

    goto :goto_0

    .line 378
    :cond_6
    invoke-virtual {v7}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->isLoadingInProgress()Z

    move-result v8

    if-eqz v8, :cond_7

    goto :goto_2

    .line 380
    :cond_7
    invoke-virtual {v7}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->isReadyToShow()Z

    move-result v7

    if-eqz v7, :cond_2

    const/4 v6, 0x1

    goto :goto_0

    .line 385
    :cond_8
    :goto_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    if-nez p1, :cond_a

    if-nez v6, :cond_a

    if-nez v3, :cond_a

    const-string p1, "onLoadError(): No other available smashes"

    .line 386
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    .line 387
    iget-boolean p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mIsShowingVideo:Z

    if-nez p1, :cond_9

    .line 388
    invoke-direct {p0, v5}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->reportAvailabilityIfNeeded(Z)V

    .line 390
    :cond_9
    sget-object p1, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_NOT_LOADED:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->setState(Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;)V

    .line 391
    iget-object p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mRvLoadTrigger:Lcom/ironsource/mediationsdk/RvLoadTrigger;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/RvLoadTrigger;->loadError()V

    .line 394
    :cond_a
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 397
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    .line 398
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->loadSmash(Lcom/ironsource/mediationsdk/LWSProgRvSmash;)V

    goto :goto_4

    :cond_b
    return-void

    .line 335
    :cond_c
    :goto_5
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLoadError was invoked with auctionId:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getAuctionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " and the current id is "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfallId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    const v0, 0x13da3

    const/4 v2, 0x2

    new-array v3, v2, [[Ljava/lang/Object;

    new-array v6, v2, [Ljava/lang/Object;

    const-string v7, "errorCode"

    aput-object v7, v6, v5

    const/4 v7, 0x4

    .line 336
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    aput-object v6, v3, v5

    new-array v2, v2, [Ljava/lang/Object;

    const-string v6, "reason"

    aput-object v6, v2, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "loadError wrong auction ID "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    aput-object v2, v3, v4

    invoke-virtual {p1, v0, v3}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->sendProviderEvent(I[[Ljava/lang/Object;)V

    .line 337
    monitor-exit v1

    return-void

    :catchall_0
    move-exception p1

    .line 394
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public onLoadSuccess(Lcom/ironsource/mediationsdk/LWSProgRvSmash;)V
    .locals 12

    .line 290
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->stateLock:Ljava/lang/Object;

    monitor-enter v0

    .line 291
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLoadSuccess mState="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/LWSProgRvSmash;Ljava/lang/String;)V

    .line 293
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getAuctionId()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfallId()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-ne v1, v2, :cond_4

    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    sget-object v2, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_AUCTION_IN_PROGRESS:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    if-ne v1, v2, :cond_0

    goto/16 :goto_2

    .line 299
    :cond_0
    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v2

    sget-object v6, Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;->ISAuctionPerformanceLoadedSuccessfully:Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;

    invoke-virtual {v1, v2, v6}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    sget-object v2, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_LOADING_SMASHES:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    if-ne v1, v2, :cond_3

    .line 304
    invoke-direct {p0, v5}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->reportAvailabilityIfNeeded(Z)V

    .line 305
    sget-object v1, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    invoke-direct {p0, v1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->setState(Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;)V

    .line 306
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    iget-wide v6, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionStartTime:J

    sub-long/2addr v1, v6

    const/16 v6, 0x3eb

    new-array v7, v5, [[Ljava/lang/Object;

    new-array v8, v4, [Ljava/lang/Object;

    const-string v9, "duration"

    aput-object v9, v8, v3

    .line 307
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v8, v5

    aput-object v8, v7, v3

    invoke-direct {p0, v6, v7}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 309
    iget-boolean v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mIsAuctionEnabled:Z

    if-eqz v1, :cond_3

    .line 310
    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    if-eqz v11, :cond_1

    .line 313
    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceType()I

    move-result v2

    iget-object v3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mGenericNotifications:Lcom/ironsource/mediationsdk/AuctionResponseItem;

    invoke-virtual {v1, v11, v2, v3}, Lcom/ironsource/mediationsdk/AuctionHandler;->reportLoadSuccess(Lcom/ironsource/mediationsdk/AuctionResponseItem;ILcom/ironsource/mediationsdk/AuctionResponseItem;)V

    .line 314
    iget-object v6, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfall()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Ljava/util/concurrent/CopyOnWriteArrayList;

    iget-object v8, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceType()I

    move-result v9

    iget-object v10, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mGenericNotifications:Lcom/ironsource/mediationsdk/AuctionResponseItem;

    invoke-virtual/range {v6 .. v11}, Lcom/ironsource/mediationsdk/AuctionHandler;->reportAuctionLose(Ljava/util/concurrent/CopyOnWriteArrayList;Ljava/util/concurrent/ConcurrentHashMap;ILcom/ironsource/mediationsdk/AuctionResponseItem;Lcom/ironsource/mediationsdk/AuctionResponseItem;)V

    goto :goto_1

    :cond_1
    if-eqz p1, :cond_2

    .line 317
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_2
    const-string v1, "Smash is null"

    .line 318
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onLoadSuccess winner instance "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " missing from waterfall. auctionId: "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getAuctionId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " and the current id is "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfallId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logErrorInternal(Ljava/lang/String;)V

    const p1, 0x13da5

    const/4 v2, 0x3

    new-array v2, v2, [[Ljava/lang/Object;

    new-array v6, v4, [Ljava/lang/Object;

    const-string v7, "errorCode"

    aput-object v7, v6, v3

    const/16 v7, 0x3f2

    .line 319
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v5

    aput-object v6, v2, v3

    new-array v6, v4, [Ljava/lang/Object;

    const-string v7, "reason"

    aput-object v7, v6, v3

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Loaded missing "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v8, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_LOADING_SMASHES:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v5

    aput-object v6, v2, v5

    new-array v6, v4, [Ljava/lang/Object;

    const-string v7, "ext1"

    aput-object v7, v6, v3

    aput-object v1, v6, v5

    aput-object v6, v2, v4

    invoke-direct {p0, p1, v2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 323
    :cond_3
    :goto_1
    monitor-exit v0

    return-void

    .line 295
    :cond_4
    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLoadSuccess was invoked with auctionId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getAuctionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " and the current id is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfallId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    const v1, 0x13da3

    new-array v2, v4, [[Ljava/lang/Object;

    new-array v6, v4, [Ljava/lang/Object;

    const-string v7, "errorCode"

    aput-object v7, v6, v3

    .line 296
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v5

    aput-object v6, v2, v3

    new-array v4, v4, [Ljava/lang/Object;

    const-string v6, "reason"

    aput-object v6, v4, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onLoadSuccess wrong auction ID "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v4, v5

    aput-object v4, v2, v5

    invoke-virtual {p1, v1, v2}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->sendProviderEvent(I[[Ljava/lang/Object;)V

    .line 297
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    .line 323
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onLoadTriggered()V
    .locals 2

    .line 542
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onLoadTriggered: RV load was triggered in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " state"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logInternal(Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    .line 543
    invoke-direct {p0, v0, v1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->loadRewardedVideo(J)V

    return-void
.end method

.method public onNetworkAvailabilityChanged(Z)V
    .locals 4

    .line 948
    iget-boolean v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mShouldTrackNetworkState:Z

    if-nez v0, :cond_0

    return-void

    .line 952
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

    .line 954
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->shouldNotifyNetworkAvailabilityChanged(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 955
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->reportAvailabilityIfNeeded(Z)V

    :cond_1
    return-void
.end method

.method public onRewardedVideoAdClicked(Lcom/ironsource/mediationsdk/LWSProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 1

    const-string v0, "onRewardedVideoAdClicked"

    .line 498
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/LWSProgRvSmash;Ljava/lang/String;)V

    .line 499
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdClicked(Lcom/ironsource/mediationsdk/model/Placement;)V

    return-void
.end method

.method public onRewardedVideoAdClosed(Lcom/ironsource/mediationsdk/LWSProgRvSmash;)V
    .locals 9

    .line 450
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onRewardedVideoAdClosed, mediation state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/LWSProgRvSmash;Ljava/lang/String;)V

    .line 451
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdClosed()V

    const/4 v0, 0x0

    .line 452
    iput-boolean v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mIsShowingVideo:Z

    .line 453
    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    sget-object v2, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    const/4 v3, 0x1

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 454
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v1, :cond_2

    .line 457
    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfall()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    .line 458
    invoke-virtual {v4}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->isLoaded()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 459
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ";"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_2
    const/16 v1, 0x4b3

    new-array v4, v3, [[Ljava/lang/Object;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "ext1"

    aput-object v6, v5, v0

    .line 465
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "otherRVAvailable = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 466
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-lez v7, :cond_3

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "true|"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_3
    const-string v2, "false"

    :goto_2
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v5, v3

    aput-object v5, v4, v0

    .line 465
    invoke-virtual {p1, v1, v4}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->sendProviderEventWithPlacement(I[[Ljava/lang/Object;)V

    .line 468
    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getShowingSmash()Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 469
    iget-object p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->setShowingSmash(Lcom/ironsource/mediationsdk/LWSProgRvSmash;)V

    .line 471
    iget-object p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    sget-object v1, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    if-eq p1, v1, :cond_4

    .line 472
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->reportAvailabilityIfNeeded(Z)V

    :cond_4
    return-void
.end method

.method public onRewardedVideoAdEnded(Lcom/ironsource/mediationsdk/LWSProgRvSmash;)V
    .locals 1

    const-string v0, "onRewardedVideoAdEnded"

    .line 486
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/LWSProgRvSmash;Ljava/lang/String;)V

    .line 487
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdEnded()V

    return-void
.end method

.method public onRewardedVideoAdOpened(Lcom/ironsource/mediationsdk/LWSProgRvSmash;)V
    .locals 8

    .line 404
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v0, p1}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->setShowingSmash(Lcom/ironsource/mediationsdk/LWSProgRvSmash;)V

    .line 405
    iget v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mSessionDepth:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mSessionDepth:I

    const-string v0, "onRewardedVideoAdOpened"

    .line 406
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/LWSProgRvSmash;Ljava/lang/String;)V

    .line 407
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdOpened()V

    .line 409
    iget-boolean v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mIsAuctionEnabled:Z

    if-eqz v0, :cond_2

    .line 410
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallServerData:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    if-eqz v0, :cond_0

    .line 413
    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mAuctionHandler:Lcom/ironsource/mediationsdk/AuctionHandler;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceType()I

    move-result v2

    iget-object v3, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mGenericNotifications:Lcom/ironsource/mediationsdk/AuctionResponseItem;

    iget-object v4, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/ironsource/mediationsdk/AuctionHandler;->reportImpression(Lcom/ironsource/mediationsdk/AuctionResponseItem;ILcom/ironsource/mediationsdk/AuctionResponseItem;Ljava/lang/String;)V

    .line 414
    iget-object v1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p1

    sget-object v2, Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;->ISAuctionPerformanceShowedSuccessfully:Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;

    invoke-virtual {v1, p1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 416
    iget-object p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->reportImpressionDataToPublisher(Lcom/ironsource/mediationsdk/AuctionResponseItem;Ljava/lang/String;)V

    goto :goto_1

    :cond_0
    if-eqz p1, :cond_1

    .line 420
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    const-string p1, "Smash is null"

    .line 421
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

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logErrorInternal(Ljava/lang/String;)V

    const v0, 0x13da5

    const/4 v2, 0x3

    new-array v2, v2, [[Ljava/lang/Object;

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Object;

    const-string v5, "errorCode"

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const/16 v5, 0x3f3

    .line 422
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

    iget-object v7, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

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

    invoke-direct {p0, v0, v2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 428
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mRvLoadTrigger:Lcom/ironsource/mediationsdk/RvLoadTrigger;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/RvLoadTrigger;->showStart()V

    return-void
.end method

.method public onRewardedVideoAdRewarded(Lcom/ironsource/mediationsdk/LWSProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 1

    const-string v0, "onRewardedVideoAdRewarded"

    .line 492
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/LWSProgRvSmash;Ljava/lang/String;)V

    .line 493
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdRewarded(Lcom/ironsource/mediationsdk/model/Placement;)V

    return-void
.end method

.method public onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/LWSProgRvSmash;)V
    .locals 6

    .line 433
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onRewardedVideoAdShowFailed error="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p2, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/LWSProgRvSmash;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 434
    iput-boolean v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mIsShowingVideo:Z

    const/4 v1, 0x2

    new-array v2, v1, [[Ljava/lang/Object;

    new-array v3, v1, [Ljava/lang/Object;

    const-string v4, "errorCode"

    aput-object v4, v3, v0

    .line 436
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    aput-object v3, v2, v0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v3, "reason"

    aput-object v3, v1, v0

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v5

    aput-object v1, v2, v5

    const/16 v1, 0x459

    invoke-direct {p0, v1, v2}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEventWithPlacement(I[[Ljava/lang/Object;)V

    .line 438
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    .line 439
    iget-object p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mWaterfallPerformance:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p2

    sget-object v1, Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;->ISAuctionPerformanceFailedToShow:Lcom/ironsource/mediationsdk/AuctionHistory$ISAuctionPerformance;

    invoke-virtual {p1, p2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 442
    iget-object p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    sget-object p2, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    if-eq p1, p2, :cond_0

    .line 443
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->reportAvailabilityIfNeeded(Z)V

    .line 445
    :cond_0
    iget-object p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mRvLoadTrigger:Lcom/ironsource/mediationsdk/RvLoadTrigger;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/RvLoadTrigger;->showError()V

    return-void
.end method

.method public onRewardedVideoAdStarted(Lcom/ironsource/mediationsdk/LWSProgRvSmash;)V
    .locals 1

    const-string v0, "onRewardedVideoAdStarted"

    .line 480
    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logSmashCallback(Lcom/ironsource/mediationsdk/LWSProgRvSmash;Ljava/lang/String;)V

    .line 481
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdStarted()V

    return-void
.end method

.method public shouldTrackNetworkState(Landroid/content/Context;Z)V
    .locals 4

    .line 969
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "LWSProgRvManager Should Track Network State: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 970
    iput-boolean p2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mShouldTrackNetworkState:Z

    if-eqz p2, :cond_1

    .line 973
    iget-object p2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mNetworkStateReceiver:Lcom/ironsource/environment/NetworkStateReceiver;

    if-nez p2, :cond_0

    .line 974
    new-instance p2, Lcom/ironsource/environment/NetworkStateReceiver;

    invoke-direct {p2, p1, p0}, Lcom/ironsource/environment/NetworkStateReceiver;-><init>(Landroid/content/Context;Lcom/ironsource/environment/NetworkStateReceiver$NetworkStateReceiverListener;)V

    iput-object p2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mNetworkStateReceiver:Lcom/ironsource/environment/NetworkStateReceiver;

    .line 977
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mNetworkStateReceiver:Lcom/ironsource/environment/NetworkStateReceiver;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    goto :goto_0

    .line 979
    :cond_1
    iget-object p2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mNetworkStateReceiver:Lcom/ironsource/environment/NetworkStateReceiver;

    if-eqz p2, :cond_2

    .line 980
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mNetworkStateReceiver:Lcom/ironsource/environment/NetworkStateReceiver;

    invoke-virtual {p1, p2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public showRewardedVideo(Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 9

    .line 191
    iget-object v0, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->stateLock:Ljava/lang/Object;

    monitor-enter v0

    const/16 v1, 0x459

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez p1, :cond_0

    :try_start_0
    const-string p1, "showRewardedVideo error: empty default placement"

    .line 195
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logAPIError(Ljava/lang/String;)V

    .line 196
    new-instance v5, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const/16 v6, 0x3fd

    invoke-direct {v5, v6, p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 197
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v7

    invoke-virtual {v7, v5}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array v5, v2, [[Ljava/lang/Object;

    new-array v7, v2, [Ljava/lang/Object;

    const-string v8, "errorCode"

    aput-object v8, v7, v3

    .line 198
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v7, v4

    aput-object v7, v5, v3

    new-array v2, v2, [Ljava/lang/Object;

    const-string v6, "reason"

    aput-object v6, v2, v3

    aput-object p1, v2, v4

    aput-object v2, v5, v4

    invoke-direct {p0, v1, v5, v3, v4}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEvent(I[[Ljava/lang/Object;ZZ)V

    .line 199
    monitor-exit v0

    return-void

    .line 201
    :cond_0
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/model/Placement;->getPlacementName()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    .line 202
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "showRewardedVideo("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logApi(Ljava/lang/String;)V

    const/16 v5, 0x44c

    .line 203
    invoke-direct {p0, v5}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEventWithPlacement(I)V

    .line 205
    iget-boolean v5, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mIsShowingVideo:Z

    if-eqz v5, :cond_1

    const-string p1, "showRewardedVideo error: can\'t show ad while an ad is already showing"

    .line 207
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logAPIError(Ljava/lang/String;)V

    .line 208
    new-instance v5, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const/16 v6, 0x3fe

    invoke-direct {v5, v6, p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 209
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v7

    invoke-virtual {v7, v5}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array v5, v2, [[Ljava/lang/Object;

    new-array v7, v2, [Ljava/lang/Object;

    const-string v8, "errorCode"

    aput-object v8, v7, v3

    .line 210
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v7, v4

    aput-object v7, v5, v3

    new-array v2, v2, [Ljava/lang/Object;

    const-string v6, "reason"

    aput-object v6, v2, v3

    aput-object p1, v2, v4

    aput-object v2, v5, v4

    invoke-direct {p0, v1, v5}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEventWithPlacement(I[[Ljava/lang/Object;)V

    .line 211
    monitor-exit v0

    return-void

    .line 214
    :cond_1
    iget-object v5, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mState:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    sget-object v6, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    if-eq v5, v6, :cond_2

    const-string p1, "showRewardedVideo error: show called while no ads are available"

    .line 216
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logAPIError(Ljava/lang/String;)V

    .line 217
    new-instance v5, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const/16 v6, 0x3ff

    invoke-direct {v5, v6, p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 218
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v7

    invoke-virtual {v7, v5}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array v5, v2, [[Ljava/lang/Object;

    new-array v7, v2, [Ljava/lang/Object;

    const-string v8, "errorCode"

    aput-object v8, v7, v3

    .line 219
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v7, v4

    aput-object v7, v5, v3

    new-array v2, v2, [Ljava/lang/Object;

    const-string v6, "reason"

    aput-object v6, v2, v3

    aput-object p1, v2, v4

    aput-object v2, v5, v4

    invoke-direct {p0, v1, v5}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEventWithPlacement(I[[Ljava/lang/Object;)V

    .line 220
    monitor-exit v0

    return-void

    .line 223
    :cond_2
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    iget-object v6, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-static {v5, v6}, Lcom/ironsource/mediationsdk/utils/CappingManager;->isRvPlacementCapped(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 224
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "showRewardedVideo error: placement "

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mCurrentPlacement:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " is capped"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 225
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logAPIError(Ljava/lang/String;)V

    .line 226
    new-instance v5, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const/16 v6, 0x20c

    invoke-direct {v5, v6, p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 227
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v7

    invoke-virtual {v7, v5}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array v5, v2, [[Ljava/lang/Object;

    new-array v7, v2, [Ljava/lang/Object;

    const-string v8, "errorCode"

    aput-object v8, v7, v3

    .line 228
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v7, v4

    aput-object v7, v5, v3

    new-array v2, v2, [Ljava/lang/Object;

    const-string v6, "reason"

    aput-object v6, v2, v3

    aput-object p1, v2, v4

    aput-object v2, v5, v4

    invoke-direct {p0, v1, v5}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEventWithPlacement(I[[Ljava/lang/Object;)V

    .line 229
    monitor-exit v0

    return-void

    .line 233
    :cond_3
    iget-object v5, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->waterfallLifeCycleHolder:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    invoke-virtual {v5}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->getCurrentWaterfall()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    .line 234
    invoke-virtual {v6}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->isReadyToShow()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 235
    iput-boolean v4, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mIsShowingVideo:Z

    .line 236
    invoke-virtual {v6, v4}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->reportShowChance(Z)V

    .line 238
    sget-object v5, Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;->RV_STATE_NOT_LOADED:Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;

    invoke-direct {p0, v5}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->setState(Lcom/ironsource/mediationsdk/LWSProgRvManager$RV_MEDIATION_STATE;)V

    goto :goto_1

    .line 241
    :cond_4
    invoke-virtual {v6, v3}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->reportShowChance(Z)V

    goto :goto_0

    :cond_5
    const/4 v6, 0x0

    :goto_1
    if-nez v6, :cond_6

    const-string p1, "showRewardedVideo(): No ads to show"

    .line 246
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->logApi(Ljava/lang/String;)V

    .line 247
    invoke-static {}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->getInstance()Lcom/ironsource/mediationsdk/RVListenerWrapper;

    move-result-object v5

    const-string v6, "Rewarded Video"

    invoke-static {v6}, Lcom/ironsource/mediationsdk/utils/ErrorBuilder;->buildNoAdsToShowError(Ljava/lang/String;)Lcom/ironsource/mediationsdk/logger/IronSourceError;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/ironsource/mediationsdk/RVListenerWrapper;->onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array v5, v2, [[Ljava/lang/Object;

    new-array v6, v2, [Ljava/lang/Object;

    const-string v7, "errorCode"

    aput-object v7, v6, v3

    const/16 v7, 0x1fd

    .line 248
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    aput-object v6, v5, v3

    new-array v2, v2, [Ljava/lang/Object;

    const-string v6, "reason"

    aput-object v6, v2, v3

    aput-object p1, v2, v4

    aput-object v2, v5, v4

    invoke-direct {p0, v1, v5}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->sendMediationEventWithPlacement(I[[Ljava/lang/Object;)V

    .line 249
    iget-object p1, p0, Lcom/ironsource/mediationsdk/LWSProgRvManager;->mRvLoadTrigger:Lcom/ironsource/mediationsdk/RvLoadTrigger;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/RvLoadTrigger;->showError()V

    .line 250
    monitor-exit v0

    return-void

    .line 252
    :cond_6
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v6, :cond_7

    .line 255
    invoke-direct {p0, v6, p1}, Lcom/ironsource/mediationsdk/LWSProgRvManager;->showVideo(Lcom/ironsource/mediationsdk/LWSProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V

    :cond_7
    return-void

    :catchall_0
    move-exception p1

    .line 252
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
