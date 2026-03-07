.class public Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;
.super Ljava/lang/Object;
.source "ListenersWrapper.java"

# interfaces
.implements Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;
.implements Lcom/ironsource/mediationsdk/sdk/InterstitialListener;
.implements Lcom/ironsource/mediationsdk/sdk/InternalOfferwallListener;
.implements Lcom/ironsource/mediationsdk/sdk/SegmentListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$CallbackHandlerThread;
    }
.end annotation


# instance fields
.field private mCallbackHandlerThread:Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$CallbackHandlerThread;

.field private mInterstitialListener:Lcom/ironsource/mediationsdk/sdk/InterstitialListener;

.field private mInterstitialPlacement:Lcom/ironsource/mediationsdk/model/InterstitialPlacement;

.field private mLastChangedAvailabilityTime:J

.field private mOfferwallListener:Lcom/ironsource/mediationsdk/sdk/OfferwallListener;

.field private mRewardedVideoListener:Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;

.field private mRvPlacementName:Ljava/lang/String;

.field private mSegementListener:Lcom/ironsource/mediationsdk/sdk/SegmentListener;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 38
    iput-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mInterstitialPlacement:Lcom/ironsource/mediationsdk/model/InterstitialPlacement;

    .line 39
    iput-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mRvPlacementName:Ljava/lang/String;

    .line 40
    new-instance v1, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$CallbackHandlerThread;

    invoke-direct {v1, p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$CallbackHandlerThread;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$1;)V

    iput-object v1, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mCallbackHandlerThread:Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$CallbackHandlerThread;

    .line 41
    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$CallbackHandlerThread;->start()V

    .line 42
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mLastChangedAvailabilityTime:J

    return-void
.end method

.method static synthetic access$100(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;)Lcom/ironsource/mediationsdk/sdk/SegmentListener;
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mSegementListener:Lcom/ironsource/mediationsdk/sdk/SegmentListener;

    return-object p0
.end method

.method static synthetic access$200(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;)Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mRewardedVideoListener:Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;

    return-object p0
.end method

.method static synthetic access$300(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;)Lcom/ironsource/mediationsdk/sdk/InterstitialListener;
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mInterstitialListener:Lcom/ironsource/mediationsdk/sdk/InterstitialListener;

    return-object p0
.end method

.method static synthetic access$400(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;)Lcom/ironsource/mediationsdk/sdk/OfferwallListener;
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mOfferwallListener:Lcom/ironsource/mediationsdk/sdk/OfferwallListener;

    return-object p0
.end method

.method private canSendCallback(Ljava/lang/Object;)Z
    .locals 0

    if-eqz p1, :cond_0

    .line 55
    iget-object p1, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mCallbackHandlerThread:Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$CallbackHandlerThread;

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private sendCallback(Ljava/lang/Runnable;)V
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mCallbackHandlerThread:Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$CallbackHandlerThread;

    if-nez v0, :cond_0

    return-void

    .line 62
    :cond_0
    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$CallbackHandlerThread;->getCallbackHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 64
    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    return-void
.end method


# virtual methods
.method public onGetOfferwallCreditsFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
    .locals 4

    .line 402
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onGetOfferwallCreditsFailed("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 404
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mOfferwallListener:Lcom/ironsource/mediationsdk/sdk/OfferwallListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 405
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$19;

    invoke-direct {v0, p0, p1}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$19;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onInterstitialAdClicked()V
    .locals 4

    .line 331
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const-string v2, "onInterstitialAdClicked()"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 333
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mInterstitialListener:Lcom/ironsource/mediationsdk/sdk/InterstitialListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 334
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$15;

    invoke-direct {v0, p0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$15;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onInterstitialAdClosed()V
    .locals 4

    .line 345
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const-string v2, "onInterstitialAdClosed()"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 347
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mInterstitialListener:Lcom/ironsource/mediationsdk/sdk/InterstitialListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 348
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$16;

    invoke-direct {v0, p0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$16;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onInterstitialAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
    .locals 4

    .line 258
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onInterstitialAdLoadFailed("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 260
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mInterstitialListener:Lcom/ironsource/mediationsdk/sdk/InterstitialListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 261
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$11;

    invoke-direct {v0, p0, p1}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$11;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onInterstitialAdOpened()V
    .locals 4

    .line 272
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const-string v2, "onInterstitialAdOpened()"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 274
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mInterstitialListener:Lcom/ironsource/mediationsdk/sdk/InterstitialListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 275
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$12;

    invoke-direct {v0, p0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$12;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onInterstitialAdReady()V
    .locals 4

    .line 244
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const-string v2, "onInterstitialAdReady()"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 246
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mInterstitialListener:Lcom/ironsource/mediationsdk/sdk/InterstitialListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 247
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$10;

    invoke-direct {v0, p0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$10;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
    .locals 4

    .line 300
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onInterstitialAdShowFailed("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    const/4 v0, 0x0

    .line 302
    invoke-static {v0}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->getMediationAdditionalData(Z)Lorg/json/JSONObject;

    move-result-object v0

    :try_start_0
    const-string v1, "errorCode"

    .line 304
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorCode()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 306
    iget-object v1, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mInterstitialPlacement:Lcom/ironsource/mediationsdk/model/InterstitialPlacement;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/model/InterstitialPlacement;->getPlacementName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "placement"

    .line 307
    iget-object v2, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mInterstitialPlacement:Lcom/ironsource/mediationsdk/model/InterstitialPlacement;

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/model/InterstitialPlacement;->getPlacementName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 310
    :cond_0
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    const-string v1, "reason"

    .line 311
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 314
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 316
    :cond_1
    :goto_0
    new-instance v1, Lcom/ironsource/eventsmodule/EventData;

    const/16 v2, 0x83f

    invoke-direct {v1, v2, v0}, Lcom/ironsource/eventsmodule/EventData;-><init>(ILorg/json/JSONObject;)V

    .line 317
    invoke-static {}, Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;->getInstance()Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;->log(Lcom/ironsource/eventsmodule/EventData;)V

    .line 319
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mInterstitialListener:Lcom/ironsource/mediationsdk/sdk/InterstitialListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 320
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$14;

    invoke-direct {v0, p0, p1}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$14;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_2
    return-void
.end method

.method public onInterstitialAdShowSucceeded()V
    .locals 4

    .line 286
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const-string v2, "onInterstitialAdShowSucceeded()"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 288
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mInterstitialListener:Lcom/ironsource/mediationsdk/sdk/InterstitialListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 289
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$13;

    invoke-direct {v0, p0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$13;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onOfferwallAdCredited(IIZ)Z
    .locals 5

    .line 390
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mOfferwallListener:Lcom/ironsource/mediationsdk/sdk/OfferwallListener;

    if-eqz v0, :cond_0

    .line 391
    invoke-interface {v0, p1, p2, p3}, Lcom/ironsource/mediationsdk/sdk/OfferwallListener;->onOfferwallAdCredited(IIZ)Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 393
    :goto_0
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v1

    sget-object v2, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onOfferwallAdCredited(credits:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", totalCredits:"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", totalCreditsFlag:"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, "):"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {v1, v2, p1, p2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return v0
.end method

.method public onOfferwallAvailable(Z)V
    .locals 1

    const/4 v0, 0x0

    .line 430
    invoke-virtual {p0, p1, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->onOfferwallAvailable(ZLcom/ironsource/mediationsdk/logger/IronSourceError;)V

    return-void
.end method

.method public onOfferwallAvailable(ZLcom/ironsource/mediationsdk/logger/IronSourceError;)V
    .locals 4

    .line 435
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onOfferwallAvailable(isAvailable: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    if-eqz p2, :cond_0

    .line 437
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", error: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 439
    :cond_0
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v1

    sget-object v2, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    const/4 v0, 0x0

    .line 441
    invoke-static {v0}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->getMediationAdditionalData(Z)Lorg/json/JSONObject;

    move-result-object v0

    :try_start_0
    const-string v1, "status"

    .line 443
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz p2, :cond_1

    const-string v1, "errorCode"

    .line 445
    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorCode()I

    move-result p2

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 448
    invoke-virtual {p2}, Lorg/json/JSONException;->printStackTrace()V

    .line 450
    :cond_1
    :goto_0
    new-instance p2, Lcom/ironsource/eventsmodule/EventData;

    const/16 v1, 0x12e

    invoke-direct {p2, v1, v0}, Lcom/ironsource/eventsmodule/EventData;-><init>(ILorg/json/JSONObject;)V

    .line 451
    invoke-static {}, Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;->getInstance()Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;->log(Lcom/ironsource/eventsmodule/EventData;)V

    .line 453
    iget-object p2, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mOfferwallListener:Lcom/ironsource/mediationsdk/sdk/OfferwallListener;

    invoke-direct {p0, p2}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 454
    new-instance p2, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$21;

    invoke-direct {p2, p0, p1}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$21;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;Z)V

    invoke-direct {p0, p2}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_2
    return-void
.end method

.method public onOfferwallClosed()V
    .locals 4

    .line 416
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const-string v2, "onOfferwallClosed()"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 418
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mOfferwallListener:Lcom/ironsource/mediationsdk/sdk/OfferwallListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 419
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$20;

    invoke-direct {v0, p0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$20;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onOfferwallOpened()V
    .locals 4

    .line 360
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const-string v2, "onOfferwallOpened()"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 362
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mOfferwallListener:Lcom/ironsource/mediationsdk/sdk/OfferwallListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 363
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$17;

    invoke-direct {v0, p0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$17;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onOfferwallShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
    .locals 4

    .line 374
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onOfferwallShowFailed("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 376
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mOfferwallListener:Lcom/ironsource/mediationsdk/sdk/OfferwallListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 377
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$18;

    invoke-direct {v0, p0, p1}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$18;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onRewardedVideoAdClicked(Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 4

    .line 201
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onRewardedVideoAdClicked("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/model/Placement;->getPlacementName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 203
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mRewardedVideoListener:Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 204
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$8;

    invoke-direct {v0, p0, p1}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$8;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;Lcom/ironsource/mediationsdk/model/Placement;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onRewardedVideoAdClosed()V
    .locals 4

    .line 118
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const-string v2, "onRewardedVideoAdClosed()"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 120
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mRewardedVideoListener:Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 121
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$3;

    invoke-direct {v0, p0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$3;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onRewardedVideoAdEnded()V
    .locals 4

    .line 173
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const-string v2, "onRewardedVideoAdEnded()"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 175
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mRewardedVideoListener:Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 176
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$6;

    invoke-direct {v0, p0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$6;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onRewardedVideoAdOpened()V
    .locals 4

    .line 104
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const-string v2, "onRewardedVideoAdOpened()"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 106
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mRewardedVideoListener:Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 107
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$2;

    invoke-direct {v0, p0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$2;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onRewardedVideoAdRewarded(Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 4

    .line 187
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onRewardedVideoAdRewarded("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/model/Placement;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 189
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mRewardedVideoListener:Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 190
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$7;

    invoke-direct {v0, p0, p1}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$7;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;Lcom/ironsource/mediationsdk/model/Placement;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
    .locals 4

    .line 215
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onRewardedVideoAdShowFailed("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    const/4 v0, 0x0

    .line 217
    invoke-static {v0}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->getMediationAdditionalData(Z)Lorg/json/JSONObject;

    move-result-object v0

    :try_start_0
    const-string v1, "errorCode"

    .line 219
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorCode()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "reason"

    .line 220
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 221
    iget-object v1, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mRvPlacementName:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "placement"

    .line 222
    iget-object v2, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mRvPlacementName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 225
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 228
    :cond_0
    :goto_0
    new-instance v1, Lcom/ironsource/eventsmodule/EventData;

    const/16 v2, 0x459

    invoke-direct {v1, v2, v0}, Lcom/ironsource/eventsmodule/EventData;-><init>(ILorg/json/JSONObject;)V

    .line 229
    invoke-static {}, Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;->getInstance()Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;->log(Lcom/ironsource/eventsmodule/EventData;)V

    .line 231
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mRewardedVideoListener:Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 232
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$9;

    invoke-direct {v0, p0, p1}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$9;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method

.method public onRewardedVideoAdStarted()V
    .locals 4

    .line 159
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const-string v2, "onRewardedVideoAdStarted()"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 161
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mRewardedVideoListener:Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 162
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$5;

    invoke-direct {v0, p0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$5;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onRewardedVideoAvailabilityChanged(Z)V
    .locals 4

    .line 132
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onRewardedVideoAvailabilityChanged(available:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 134
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mLastChangedAvailabilityTime:J

    sub-long/2addr v0, v2

    .line 135
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mLastChangedAvailabilityTime:J

    const/4 v2, 0x0

    .line 137
    invoke-static {v2}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->getMediationAdditionalData(Z)Lorg/json/JSONObject;

    move-result-object v2

    :try_start_0
    const-string v3, "duration"

    .line 139
    invoke-virtual {v2, v3, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 141
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 144
    :goto_0
    new-instance v0, Lcom/ironsource/eventsmodule/EventData;

    if-eqz p1, :cond_0

    const/16 v1, 0x457

    goto :goto_1

    :cond_0
    const/16 v1, 0x458

    :goto_1
    invoke-direct {v0, v1, v2}, Lcom/ironsource/eventsmodule/EventData;-><init>(ILorg/json/JSONObject;)V

    .line 145
    invoke-static {}, Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;->getInstance()Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/ironsource/mediationsdk/events/RewardedVideoEventsManager;->log(Lcom/ironsource/eventsmodule/EventData;)V

    .line 147
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mRewardedVideoListener:Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 148
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$4;

    invoke-direct {v0, p0, p1}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$4;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;Z)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method

.method public onSegmentReceived(Ljava/lang/String;)V
    .locals 4

    .line 87
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onSegmentReceived("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 89
    iget-object v0, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mSegementListener:Lcom/ironsource/mediationsdk/sdk/SegmentListener;

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->canSendCallback(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    new-instance v0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$1;

    invoke-direct {v0, p0, p1}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper$1;-><init>(Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->sendCallback(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public setInterstitialListener(Lcom/ironsource/mediationsdk/sdk/InterstitialListener;)V
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mInterstitialListener:Lcom/ironsource/mediationsdk/sdk/InterstitialListener;

    return-void
.end method

.method public setInterstitialPlacement(Lcom/ironsource/mediationsdk/model/InterstitialPlacement;)V
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mInterstitialPlacement:Lcom/ironsource/mediationsdk/model/InterstitialPlacement;

    return-void
.end method

.method public setOfferwallListener(Lcom/ironsource/mediationsdk/sdk/OfferwallListener;)V
    .locals 0

    .line 78
    iput-object p1, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mOfferwallListener:Lcom/ironsource/mediationsdk/sdk/OfferwallListener;

    return-void
.end method

.method public setRewardedVideoListener(Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;)V
    .locals 0

    .line 69
    iput-object p1, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mRewardedVideoListener:Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;

    return-void
.end method

.method public setRvPlacement(Ljava/lang/String;)V
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mRvPlacementName:Ljava/lang/String;

    return-void
.end method

.method public setSegmentListener(Lcom/ironsource/mediationsdk/sdk/SegmentListener;)V
    .locals 0

    .line 82
    iput-object p1, p0, Lcom/ironsource/mediationsdk/sdk/ListenersWrapper;->mSegementListener:Lcom/ironsource/mediationsdk/sdk/SegmentListener;

    return-void
.end method
