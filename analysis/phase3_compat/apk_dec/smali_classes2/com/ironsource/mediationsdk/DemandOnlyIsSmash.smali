.class public Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;
.super Lcom/ironsource/mediationsdk/DemandOnlySmash;
.source "DemandOnlyIsSmash.java"

# interfaces
.implements Lcom/ironsource/mediationsdk/sdk/InterstitialSmashListener;


# instance fields
.field private mListener:Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;

.field private mLoadStartTime:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/mediationsdk/model/ProviderSettings;Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;ILcom/ironsource/mediationsdk/AbstractAdapter;)V
    .locals 2

    .line 27
    new-instance v0, Lcom/ironsource/mediationsdk/model/AdapterConfig;

    invoke-virtual {p3}, Lcom/ironsource/mediationsdk/model/ProviderSettings;->getInterstitialSettings()Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, p3, v1}, Lcom/ironsource/mediationsdk/model/AdapterConfig;-><init>(Lcom/ironsource/mediationsdk/model/ProviderSettings;Lorg/json/JSONObject;)V

    invoke-direct {p0, v0, p6}, Lcom/ironsource/mediationsdk/DemandOnlySmash;-><init>(Lcom/ironsource/mediationsdk/model/AdapterConfig;Lcom/ironsource/mediationsdk/AbstractAdapter;)V

    .line 28
    iput-object p4, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mListener:Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;

    .line 29
    iput p5, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mLoadTimeoutSecs:I

    .line 30
    iget-object p3, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mAdapter:Lcom/ironsource/mediationsdk/AbstractAdapter;

    iget-object p4, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mAdUnitSettings:Lorg/json/JSONObject;

    invoke-virtual {p3, p1, p2, p4, p0}, Lcom/ironsource/mediationsdk/AbstractAdapter;->initInterstitial(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lcom/ironsource/mediationsdk/sdk/InterstitialSmashListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;Ljava/lang/String;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->logInternal(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;)J
    .locals 2

    .line 19
    iget-wide v0, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mLoadStartTime:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;)Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;
    .locals 0

    .line 19
    iget-object p0, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mListener:Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;

    return-object p0
.end method

.method private logAdapterCallback(Ljava/lang/String;)V
    .locals 3

    .line 189
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DemandOnlyInterstitialSmash "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mAdapterConfig:Lcom/ironsource/mediationsdk/model/AdapterConfig;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/model/AdapterConfig;->getProviderName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 190
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->ADAPTER_CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private logInternal(Ljava/lang/String;)V
    .locals 3

    .line 196
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DemandOnlyInterstitialSmash "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mAdapterConfig:Lcom/ironsource/mediationsdk/model/AdapterConfig;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/model/AdapterConfig;->getProviderName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 197
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private startLoadTimer()V
    .locals 1

    const-string v0, "start timer"

    .line 84
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->logInternal(Ljava/lang/String;)V

    .line 85
    new-instance v0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash$1;

    invoke-direct {v0, p0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash$1;-><init>(Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;)V

    invoke-virtual {p0, v0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->startTimer(Ljava/util/TimerTask;)V

    return-void
.end method


# virtual methods
.method public isInterstitialReady()Z
    .locals 2

    .line 77
    iget-object v0, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mAdapter:Lcom/ironsource/mediationsdk/AbstractAdapter;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mAdUnitSettings:Lorg/json/JSONObject;

    invoke-virtual {v0, v1}, Lcom/ironsource/mediationsdk/AbstractAdapter;->isInterstitialReady(Lorg/json/JSONObject;)Z

    move-result v0

    return v0
.end method

.method public loadInterstitial(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "loadInterstitial state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->getStateString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->logInternal(Ljava/lang/String;)V

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    .line 37
    sget-object v1, Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;->NOT_LOADED:Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;->LOADED:Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;->LOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    invoke-virtual {p0, v0, v1}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->compareAndSetState([Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;)Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    move-result-object v0

    .line 39
    sget-object v1, Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;->NOT_LOADED:Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    if-eq v0, v1, :cond_2

    sget-object v1, Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;->LOADED:Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 50
    :cond_0
    sget-object p1, Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;->LOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    const-wide/16 p2, 0x0

    const/16 v1, 0x41a

    if-ne v0, p1, :cond_1

    .line 51
    new-instance p1, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const-string v0, "load already in progress"

    invoke-direct {p1, v1, v0}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 52
    iget-object v0, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mListener:Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;

    invoke-interface {v0, p1, p0, p2, p3}, Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;->onInterstitialAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;J)V

    goto :goto_1

    .line 55
    :cond_1
    new-instance p1, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const-string v0, "cannot load because show is in progress"

    invoke-direct {p1, v1, v0}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 56
    iget-object v0, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mListener:Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;

    invoke-interface {v0, p1, p0, p2, p3}, Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;->onInterstitialAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;J)V

    goto :goto_1

    .line 40
    :cond_2
    :goto_0
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mLoadStartTime:J

    .line 41
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->startLoadTimer()V

    .line 42
    invoke-virtual {p0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->isBidder()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 43
    iput-object p2, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mAuctionId:Ljava/lang/String;

    .line 44
    iput-object p3, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mBUrl:Ljava/util/List;

    .line 45
    iget-object p2, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mAdapter:Lcom/ironsource/mediationsdk/AbstractAdapter;

    iget-object p3, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mAdUnitSettings:Lorg/json/JSONObject;

    invoke-virtual {p2, p3, p0, p1}, Lcom/ironsource/mediationsdk/AbstractAdapter;->loadInterstitialForBidding(Lorg/json/JSONObject;Lcom/ironsource/mediationsdk/sdk/InterstitialSmashListener;Ljava/lang/String;)V

    goto :goto_1

    .line 48
    :cond_3
    iget-object p1, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mAdapter:Lcom/ironsource/mediationsdk/AbstractAdapter;

    iget-object p2, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mAdUnitSettings:Lorg/json/JSONObject;

    invoke-virtual {p1, p2, p0}, Lcom/ironsource/mediationsdk/AbstractAdapter;->loadInterstitial(Lorg/json/JSONObject;Lcom/ironsource/mediationsdk/sdk/InterstitialSmashListener;)V

    :goto_1
    return-void
.end method

.method public onInterstitialAdClicked()V
    .locals 1

    const-string v0, "onInterstitialAdClicked"

    .line 174
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->logAdapterCallback(Ljava/lang/String;)V

    .line 175
    iget-object v0, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mListener:Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;

    invoke-interface {v0, p0}, Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;->onInterstitialAdClicked(Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;)V

    return-void
.end method

.method public onInterstitialAdClosed()V
    .locals 1

    .line 149
    sget-object v0, Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;->NOT_LOADED:Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    invoke-virtual {p0, v0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->setState(Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;)V

    const-string v0, "onInterstitialAdClosed"

    .line 150
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->logAdapterCallback(Ljava/lang/String;)V

    .line 151
    iget-object v0, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mListener:Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;

    invoke-interface {v0, p0}, Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;->onInterstitialAdClosed(Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;)V

    return-void
.end method

.method public onInterstitialAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
    .locals 4

    .line 128
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onInterstitialAdLoadFailed error="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->getStateString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->logAdapterCallback(Ljava/lang/String;)V

    .line 129
    invoke-virtual {p0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->stopTimer()V

    .line 131
    sget-object v0, Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;->LOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    sget-object v1, Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;->NOT_LOADED:Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    invoke-virtual {p0, v0, v1}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->compareAndSetState(Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mLoadStartTime:J

    sub-long/2addr v0, v2

    .line 133
    iget-object v2, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mListener:Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;

    invoke-interface {v2, p1, p0, v0, v1}, Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;->onInterstitialAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;J)V

    :cond_0
    return-void
.end method

.method public onInterstitialAdOpened()V
    .locals 1

    const-string v0, "onInterstitialAdOpened"

    .line 141
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->logAdapterCallback(Ljava/lang/String;)V

    .line 142
    iget-object v0, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mListener:Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;

    invoke-interface {v0, p0}, Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;->onInterstitialAdOpened(Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;)V

    return-void
.end method

.method public onInterstitialAdReady()V
    .locals 4

    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onInterstitialAdReady state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->getStateString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->logAdapterCallback(Ljava/lang/String;)V

    .line 116
    invoke-virtual {p0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->stopTimer()V

    .line 118
    sget-object v0, Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;->LOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    sget-object v1, Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;->LOADED:Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    invoke-virtual {p0, v0, v1}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->compareAndSetState(Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 119
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mLoadStartTime:J

    sub-long/2addr v0, v2

    .line 120
    iget-object v2, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mListener:Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;

    invoke-interface {v2, p0, v0, v1}, Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;->onInterstitialAdReady(Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;J)V

    :cond_0
    return-void
.end method

.method public onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
    .locals 2

    .line 165
    sget-object v0, Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;->NOT_LOADED:Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    invoke-virtual {p0, v0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->setState(Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;)V

    .line 166
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onInterstitialAdShowFailed error="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->logAdapterCallback(Ljava/lang/String;)V

    .line 167
    iget-object v0, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mListener:Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;

    invoke-interface {v0, p1, p0}, Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;->onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;)V

    return-void
.end method

.method public onInterstitialAdShowSucceeded()V
    .locals 0

    return-void
.end method

.method public onInterstitialAdVisible()V
    .locals 1

    const-string v0, "onInterstitialAdVisible"

    .line 182
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->logAdapterCallback(Ljava/lang/String;)V

    .line 183
    iget-object v0, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mListener:Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;

    invoke-interface {v0, p0}, Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;->onInterstitialAdVisible(Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;)V

    return-void
.end method

.method public onInterstitialInitFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
    .locals 0

    return-void
.end method

.method public onInterstitialInitSuccess()V
    .locals 0

    return-void
.end method

.method public showInterstitial()V
    .locals 3

    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "showInterstitial state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->getStateString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->logInternal(Ljava/lang/String;)V

    .line 66
    sget-object v0, Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;->LOADED:Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    sget-object v1, Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;->SHOW_IN_PROGRESS:Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;

    invoke-virtual {p0, v0, v1}, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->compareAndSetState(Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;Lcom/ironsource/mediationsdk/DemandOnlySmash$SMASH_STATE;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mAdapter:Lcom/ironsource/mediationsdk/AbstractAdapter;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mAdUnitSettings:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, p0}, Lcom/ironsource/mediationsdk/AbstractAdapter;->showInterstitial(Lorg/json/JSONObject;Lcom/ironsource/mediationsdk/sdk/InterstitialSmashListener;)V

    goto :goto_0

    .line 69
    :cond_0
    new-instance v0, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const/16 v1, 0x41b

    const-string v2, "load must be called before show"

    invoke-direct {v0, v1, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    .line 70
    iget-object v1, p0, Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;->mListener:Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;

    invoke-interface {v1, v0, p0}, Lcom/ironsource/mediationsdk/sdk/DemandOnlyIsManagerListener;->onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/DemandOnlyIsSmash;)V

    :goto_0
    return-void
.end method
