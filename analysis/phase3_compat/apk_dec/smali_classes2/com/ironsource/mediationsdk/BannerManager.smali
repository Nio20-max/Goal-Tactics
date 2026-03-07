.class public Lcom/ironsource/mediationsdk/BannerManager;
.super Ljava/lang/Object;
.source "BannerManager.java"

# interfaces
.implements Lcom/ironsource/mediationsdk/sdk/BannerManagerListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;
    }
.end annotation


# instance fields
.field private mActiveSmash:Lcom/ironsource/mediationsdk/BannerSmash;

.field private mAppKey:Ljava/lang/String;

.field private mCurrentPlacement:Lcom/ironsource/mediationsdk/model/BannerPlacement;

.field mDidImplementOnPause:Ljava/util/concurrent/atomic/AtomicBoolean;

.field mDidImplementOnResume:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mIronsourceBanner:Lcom/ironsource/mediationsdk/IronSourceBannerLayout;

.field private mIsInForeground:Ljava/lang/Boolean;

.field private mLoggerManager:Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

.field private mReloadInterval:J

.field private mReloadTimer:Ljava/util/Timer;

.field private final mSmashArray:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/ironsource/mediationsdk/BannerSmash;",
            ">;"
        }
    .end annotation
.end field

.field private mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

.field private mUserId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;JII)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ironsource/mediationsdk/model/ProviderSettings;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "JII)V"
        }
    .end annotation

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mSmashArray:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 56
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    iput-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mLoggerManager:Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    .line 57
    sget-object v0, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->NOT_INITIATED:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    iput-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    const/4 v0, 0x1

    .line 58
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIsInForeground:Ljava/lang/Boolean;

    .line 59
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mDidImplementOnPause:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 60
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mDidImplementOnResume:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 62
    iput-object p2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mAppKey:Ljava/lang/String;

    .line 63
    iput-object p3, p0, Lcom/ironsource/mediationsdk/BannerManager;->mUserId:Ljava/lang/String;

    int-to-long p2, p6

    .line 64
    iput-wide p2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mReloadInterval:J

    .line 65
    invoke-static {}, Lcom/ironsource/mediationsdk/BannerCallbackThrottler;->getInstance()Lcom/ironsource/mediationsdk/BannerCallbackThrottler;

    move-result-object p2

    invoke-virtual {p2, p7}, Lcom/ironsource/mediationsdk/BannerCallbackThrottler;->setDelayLoadFailureNotificationInSeconds(I)V

    const/4 p2, 0x0

    .line 67
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p3

    if-ge p2, p3, :cond_1

    .line 68
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    move-object v2, p3

    check-cast v2, Lcom/ironsource/mediationsdk/model/ProviderSettings;

    .line 69
    invoke-static {}, Lcom/ironsource/mediationsdk/AdapterRepository;->getInstance()Lcom/ironsource/mediationsdk/AdapterRepository;

    move-result-object p3

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/model/ProviderSettings;->getBannerSettings()Lorg/json/JSONObject;

    move-result-object p6

    invoke-virtual {p3, v2, p6}, Lcom/ironsource/mediationsdk/AdapterRepository;->getAdapter(Lcom/ironsource/mediationsdk/model/ProviderSettings;Lorg/json/JSONObject;)Lcom/ironsource/mediationsdk/AbstractAdapter;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 71
    invoke-static {}, Lcom/ironsource/mediationsdk/AdaptersCompatibilityHandler;->getInstance()Lcom/ironsource/mediationsdk/AdaptersCompatibilityHandler;

    move-result-object p3

    invoke-virtual {p3, v3}, Lcom/ironsource/mediationsdk/AdaptersCompatibilityHandler;->isBannerAdapterCompatible(Lcom/ironsource/mediationsdk/AbstractAdapter;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 72
    new-instance p3, Lcom/ironsource/mediationsdk/BannerSmash;

    add-int/lit8 v6, p2, 0x1

    move-object v0, p3

    move-object v1, p0

    move-wide v4, p4

    invoke-direct/range {v0 .. v6}, Lcom/ironsource/mediationsdk/BannerSmash;-><init>(Lcom/ironsource/mediationsdk/sdk/BannerManagerListener;Lcom/ironsource/mediationsdk/model/ProviderSettings;Lcom/ironsource/mediationsdk/AbstractAdapter;JI)V

    .line 73
    iget-object p6, p0, Lcom/ironsource/mediationsdk/BannerManager;->mSmashArray:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p6, p3}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 75
    :cond_0
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/model/ProviderSettings;->getProviderInstanceName()Ljava/lang/String;

    move-result-object p6

    invoke-virtual {p3, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p6, " can\'t load adapter or wrong version"

    invoke-virtual {p3, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0, p3}, Lcom/ironsource/mediationsdk/BannerManager;->debugLog(Ljava/lang/String;)V

    :goto_1
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 79
    iput-object p1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mCurrentPlacement:Lcom/ironsource/mediationsdk/model/BannerPlacement;

    .line 80
    sget-object p1, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->READY_TO_LOAD:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->setState(Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;)V

    return-void
.end method

.method static synthetic access$000(Lcom/ironsource/mediationsdk/BannerManager;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->onReloadTimer()V

    return-void
.end method

.method private addEventSizeFields(Lorg/json/JSONObject;Lcom/ironsource/mediationsdk/ISBannerSize;)V
    .locals 7

    const/4 v0, 0x3

    .line 398
    :try_start_0
    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/ISBannerSize;->getDescription()Ljava/lang/String;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, 0x4

    const/4 v5, 0x2

    const/4 v6, 0x1

    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v3, "CUSTOM"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :sswitch_1
    const-string v3, "BANNER"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :sswitch_2
    const-string v3, "SMART"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v2, 0x3

    goto :goto_0

    :sswitch_3
    const-string v3, "LARGE"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :sswitch_4
    const-string v3, "RECTANGLE"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_0

    const/4 v2, 0x2

    :cond_0
    :goto_0
    const-string v1, "bannerAdSize"

    if-eqz v2, :cond_5

    if-eq v2, v6, :cond_4

    if-eq v2, v5, :cond_3

    if-eq v2, v0, :cond_2

    if-eq v2, v4, :cond_1

    goto :goto_1

    :cond_1
    const/4 v2, 0x6

    .line 416
    :try_start_1
    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "custom_banner_size"

    .line 417
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/ISBannerSize;->getWidth()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/ISBannerSize;->getHeight()I

    move-result p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    :cond_2
    const/4 p2, 0x5

    .line 412
    invoke-virtual {p1, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_1

    .line 408
    :cond_3
    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_1

    .line 404
    :cond_4
    invoke-virtual {p1, v1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_1

    .line 400
    :cond_5
    invoke-virtual {p1, v1, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 421
    iget-object p2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mLoggerManager:Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendProviderEvent "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v1, p1, v0}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    :goto_1
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x171242b1 -> :sswitch_4
        0x44dc31b -> :sswitch_3
        0x4b59da9 -> :sswitch_2
        0x7458732c -> :sswitch_1
        0x77297f71 -> :sswitch_0
    .end sparse-switch
.end method

.method private bindView(Lcom/ironsource/mediationsdk/BannerSmash;Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 0

    .line 184
    iput-object p1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mActiveSmash:Lcom/ironsource/mediationsdk/BannerSmash;

    .line 185
    iget-object p1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIronsourceBanner:Lcom/ironsource/mediationsdk/IronSourceBannerLayout;

    invoke-virtual {p1, p2, p3}, Lcom/ironsource/mediationsdk/IronSourceBannerLayout;->addViewWithFrameLayoutParams(Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;)V

    return-void
.end method

.method private callbackLog(Ljava/lang/String;Lcom/ironsource/mediationsdk/BannerSmash;)V
    .locals 4

    .line 179
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mLoggerManager:Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->ADAPTER_CALLBACK:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BannerManager "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/BannerSmash;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {v0, v1, p1, p2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private canSendBannerCallbacks()Z
    .locals 1

    .line 361
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIronsourceBanner:Lcom/ironsource/mediationsdk/IronSourceBannerLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/IronSourceBannerLayout;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private debugLog(Ljava/lang/String;)V
    .locals 4

    .line 170
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mLoggerManager:Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BannerManager "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private errorLog(Ljava/lang/String;)V
    .locals 4

    .line 166
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mLoggerManager:Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BannerManager "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x3

    invoke-virtual {v0, v1, p1, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    return-void
.end method

.method private loadNextSmash()Z
    .locals 4

    .line 456
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mSmashArray:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ironsource/mediationsdk/BannerSmash;

    .line 457
    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/BannerSmash;->isReadyToLoad()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mActiveSmash:Lcom/ironsource/mediationsdk/BannerSmash;

    if-eq v2, v1, :cond_0

    .line 458
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    sget-object v2, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->FIRST_LOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    if-ne v0, v2, :cond_1

    const/16 v0, 0xbba

    .line 459
    invoke-direct {p0, v0, v1}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;)V

    goto :goto_0

    :cond_1
    const/16 v0, 0xbc4

    .line 462
    invoke-direct {p0, v0, v1}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;)V

    .line 464
    :goto_0
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIronsourceBanner:Lcom/ironsource/mediationsdk/IronSourceBannerLayout;

    iget-object v2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mAppKey:Ljava/lang/String;

    iget-object v3, p0, Lcom/ironsource/mediationsdk/BannerManager;->mUserId:Ljava/lang/String;

    invoke-virtual {v1, v0, v2, v3}, Lcom/ironsource/mediationsdk/BannerSmash;->loadBanner(Lcom/ironsource/mediationsdk/IronSourceBannerLayout;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0

    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method private onReloadTimer()V
    .locals 6

    .line 505
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    sget-object v1, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->RELOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    if-eq v0, v1, :cond_0

    .line 506
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onReloadTimer wrong state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/BannerManager;->debugLog(Ljava/lang/String;)V

    return-void

    .line 510
    :cond_0
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIsInForeground:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0xbc3

    .line 511
    invoke-direct {p0, v0}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I)V

    const/16 v0, 0xbc4

    .line 512
    iget-object v1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mActiveSmash:Lcom/ironsource/mediationsdk/BannerSmash;

    invoke-direct {p0, v0, v1}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;)V

    .line 513
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mActiveSmash:Lcom/ironsource/mediationsdk/BannerSmash;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/BannerSmash;->reloadBanner()V

    goto :goto_0

    :cond_1
    const/16 v0, 0xc80

    const/4 v1, 0x1

    new-array v2, v1, [[Ljava/lang/Object;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "errorCode"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/16 v4, 0x266

    .line 515
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v1

    aput-object v3, v2, v5

    invoke-direct {p0, v0, v2}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 516
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->startReloadTimer()V

    :goto_0
    return-void
.end method

.method private resetIteration()V
    .locals 3

    .line 450
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mSmashArray:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ironsource/mediationsdk/BannerSmash;

    const/4 v2, 0x1

    .line 451
    invoke-virtual {v1, v2}, Lcom/ironsource/mediationsdk/BannerSmash;->setReadyToLoad(Z)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private sendMediationEvent(I)V
    .locals 1

    const/4 v0, 0x0

    .line 365
    check-cast v0, [[Ljava/lang/Object;

    invoke-direct {p0, p1, v0}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    return-void
.end method

.method private sendMediationEvent(I[[Ljava/lang/Object;)V
    .locals 7

    const/4 v0, 0x0

    .line 369
    invoke-static {v0}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->getMediationAdditionalData(Z)Lorg/json/JSONObject;

    move-result-object v1

    .line 372
    :try_start_0
    iget-object v2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIronsourceBanner:Lcom/ironsource/mediationsdk/IronSourceBannerLayout;

    if-eqz v2, :cond_0

    .line 373
    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/IronSourceBannerLayout;->getSize()Lcom/ironsource/mediationsdk/ISBannerSize;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/ironsource/mediationsdk/BannerManager;->addEventSizeFields(Lorg/json/JSONObject;Lcom/ironsource/mediationsdk/ISBannerSize;)V

    .line 375
    :cond_0
    iget-object v2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mCurrentPlacement:Lcom/ironsource/mediationsdk/model/BannerPlacement;

    if-eqz v2, :cond_1

    const-string v3, "placement"

    .line 376
    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/model/BannerPlacement;->getPlacementName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    if-eqz p2, :cond_2

    .line 380
    array-length v2, p2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, p2, v3

    .line 381
    aget-object v5, v4, v0

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    aget-object v4, v4, v6

    invoke-virtual {v1, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    move-exception p2

    .line 385
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mLoggerManager:Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    sget-object v2, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sendMediationEvent "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v3, 0x3

    invoke-virtual {v0, v2, p2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 388
    :cond_2
    new-instance p2, Lcom/ironsource/eventsmodule/EventData;

    invoke-direct {p2, p1, v1}, Lcom/ironsource/eventsmodule/EventData;-><init>(ILorg/json/JSONObject;)V

    .line 389
    invoke-static {}, Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;->getInstance()Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;->log(Lcom/ironsource/eventsmodule/EventData;)V

    return-void
.end method

.method private sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;)V
    .locals 1

    const/4 v0, 0x0

    .line 393
    check-cast v0, [[Ljava/lang/Object;

    invoke-direct {p0, p1, p2, v0}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;[[Ljava/lang/Object;)V

    return-void
.end method

.method private sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;[[Ljava/lang/Object;)V
    .locals 6

    .line 426
    invoke-static {p2}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->getProviderAdditionalData(Lcom/ironsource/mediationsdk/BannerSmash;)Lorg/json/JSONObject;

    move-result-object p2

    .line 429
    :try_start_0
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIronsourceBanner:Lcom/ironsource/mediationsdk/IronSourceBannerLayout;

    if-eqz v0, :cond_0

    .line 430
    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/IronSourceBannerLayout;->getSize()Lcom/ironsource/mediationsdk/ISBannerSize;

    move-result-object v0

    invoke-direct {p0, p2, v0}, Lcom/ironsource/mediationsdk/BannerManager;->addEventSizeFields(Lorg/json/JSONObject;Lcom/ironsource/mediationsdk/ISBannerSize;)V

    .line 432
    :cond_0
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mCurrentPlacement:Lcom/ironsource/mediationsdk/model/BannerPlacement;

    if-eqz v0, :cond_1

    const-string v1, "placement"

    .line 433
    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/model/BannerPlacement;->getPlacementName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    if-eqz p3, :cond_2

    .line 437
    array-length v0, p3

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    aget-object v3, p3, v2

    .line 438
    aget-object v4, v3, v1

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    aget-object v3, v3, v5

    invoke-virtual {p2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    move-exception p3

    .line 442
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mLoggerManager:Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendProviderEvent "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p3}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const/4 v2, 0x3

    invoke-virtual {v0, v1, p3, v2}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 445
    :cond_2
    new-instance p3, Lcom/ironsource/eventsmodule/EventData;

    invoke-direct {p3, p1, p2}, Lcom/ironsource/eventsmodule/EventData;-><init>(ILorg/json/JSONObject;)V

    .line 446
    invoke-static {}, Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;->getInstance()Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/ironsource/mediationsdk/events/InterstitialEventsManager;->log(Lcom/ironsource/eventsmodule/EventData;)V

    return-void
.end method

.method private setState(Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;)V
    .locals 2

    .line 174
    iput-object p1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    .line 175
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->debugLog(Ljava/lang/String;)V

    return-void
.end method

.method private startReloadTimer()V
    .locals 6

    .line 481
    :try_start_0
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->stopReloadTimer()V

    .line 483
    iget-wide v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mReloadInterval:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 484
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mReloadTimer:Ljava/util/Timer;

    .line 485
    new-instance v1, Lcom/ironsource/mediationsdk/BannerManager$1;

    invoke-direct {v1, p0}, Lcom/ironsource/mediationsdk/BannerManager$1;-><init>(Lcom/ironsource/mediationsdk/BannerManager;)V

    iget-wide v2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mReloadInterval:J

    const-wide/16 v4, 0x3e8

    mul-long v2, v2, v4

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 493
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method private stopReloadTimer()V
    .locals 1

    .line 498
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mReloadTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 499
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    const/4 v0, 0x0

    .line 500
    iput-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mReloadTimer:Ljava/util/Timer;

    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized destroyBanner(Lcom/ironsource/mediationsdk/IronSourceBannerLayout;)V
    .locals 10

    monitor-enter p0

    const/4 v0, 0x3

    if-nez p1, :cond_0

    .line 135
    :try_start_0
    iget-object p1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mLoggerManager:Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->API:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const-string v2, "destroyBanner banner cannot be null"

    invoke-virtual {p1, v1, v2, v0}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 136
    monitor-exit p0

    return-void

    .line 139
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/IronSourceBannerLayout;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 140
    iget-object p1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mLoggerManager:Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->API:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const-string v2, "Banner is already destroyed and can\'t be used anymore. Please create a new one using IronSource.createBanner API"

    invoke-virtual {p1, v1, v2, v0}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 141
    monitor-exit p0

    return-void

    .line 146
    :cond_1
    :try_start_2
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/SessionDepthManager;->getInstance()Lcom/ironsource/mediationsdk/utils/SessionDepthManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/ironsource/mediationsdk/utils/SessionDepthManager;->getSessionDepth(I)I

    move-result v1

    const/16 v2, 0xc1c

    const/4 v3, 0x1

    new-array v4, v3, [[Ljava/lang/Object;

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/Object;

    const-string v7, "sessionDepth"

    const/4 v8, 0x0

    aput-object v7, v6, v8

    .line 147
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v3

    aput-object v6, v4, v8

    invoke-direct {p0, v2, v4}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 148
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->stopReloadTimer()V

    .line 150
    iget-object v2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mActiveSmash:Lcom/ironsource/mediationsdk/BannerSmash;

    const/4 v4, 0x0

    if-eqz v2, :cond_2

    const/16 v6, 0xce9

    new-array v7, v3, [[Ljava/lang/Object;

    new-array v5, v5, [Ljava/lang/Object;

    const-string v9, "sessionDepth"

    aput-object v9, v5, v8

    .line 151
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v5, v3

    aput-object v5, v7, v8

    invoke-direct {p0, v6, v2, v7}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;[[Ljava/lang/Object;)V

    .line 152
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/SessionDepthManager;->getInstance()Lcom/ironsource/mediationsdk/utils/SessionDepthManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/ironsource/mediationsdk/utils/SessionDepthManager;->increaseSessionDepth(I)V

    .line 154
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mActiveSmash:Lcom/ironsource/mediationsdk/BannerSmash;

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/BannerSmash;->destroyBanner()V

    .line 155
    iput-object v4, p0, Lcom/ironsource/mediationsdk/BannerManager;->mActiveSmash:Lcom/ironsource/mediationsdk/BannerSmash;

    .line 158
    :cond_2
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/IronSourceBannerLayout;->destroyBanner()V

    .line 159
    iput-object v4, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIronsourceBanner:Lcom/ironsource/mediationsdk/IronSourceBannerLayout;

    .line 160
    iput-object v4, p0, Lcom/ironsource/mediationsdk/BannerManager;->mCurrentPlacement:Lcom/ironsource/mediationsdk/model/BannerPlacement;

    .line 162
    sget-object p1, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->READY_TO_LOAD:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->setState(Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 163
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized loadBanner(Lcom/ironsource/mediationsdk/IronSourceBannerLayout;Lcom/ironsource/mediationsdk/model/BannerPlacement;)V
    .locals 8

    monitor-enter p0

    const/16 v0, 0xc27

    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz p1, :cond_8

    .line 87
    :try_start_0
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/IronSourceBannerLayout;->isDestroyed()Z

    move-result v5

    if-eqz v5, :cond_0

    goto/16 :goto_4

    :cond_0
    if-eqz p2, :cond_6

    .line 94
    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/model/BannerPlacement;->getPlacementName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto/16 :goto_2

    .line 101
    :cond_1
    iget-object v5, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    sget-object v6, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->READY_TO_LOAD:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    if-ne v5, v6, :cond_5

    invoke-static {}, Lcom/ironsource/mediationsdk/BannerCallbackThrottler;->getInstance()Lcom/ironsource/mediationsdk/BannerCallbackThrottler;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ironsource/mediationsdk/BannerCallbackThrottler;->hasPendingInvocation()Z

    move-result v5

    if-eqz v5, :cond_2

    goto/16 :goto_1

    .line 106
    :cond_2
    sget-object v1, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->FIRST_LOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    invoke-direct {p0, v1}, Lcom/ironsource/mediationsdk/BannerManager;->setState(Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;)V

    .line 107
    iput-object p1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIronsourceBanner:Lcom/ironsource/mediationsdk/IronSourceBannerLayout;

    .line 108
    iput-object p2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mCurrentPlacement:Lcom/ironsource/mediationsdk/model/BannerPlacement;

    const/16 v1, 0xbb9

    .line 109
    invoke-direct {p0, v1}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I)V

    .line 111
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getCurrentActiveActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/model/BannerPlacement;->getPlacementName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Lcom/ironsource/mediationsdk/utils/CappingManager;->isBnPlacementCapped(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 112
    invoke-static {}, Lcom/ironsource/mediationsdk/BannerCallbackThrottler;->getInstance()Lcom/ironsource/mediationsdk/BannerCallbackThrottler;

    move-result-object v1

    new-instance v5, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "placement "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/model/BannerPlacement;->getPlacementName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " is capped"

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/16 v6, 0x25c

    invoke-direct {v5, v6, p2}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    invoke-virtual {v1, p1, v5}, Lcom/ironsource/mediationsdk/BannerCallbackThrottler;->sendBannerAdLoadFailed(Lcom/ironsource/mediationsdk/IronSourceBannerLayout;Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array p2, v4, [[Ljava/lang/Object;

    new-array v1, v2, [Ljava/lang/Object;

    const-string v5, "errorCode"

    aput-object v5, v1, v3

    .line 113
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v4

    aput-object v1, p2, v3

    invoke-direct {p0, v0, p2}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 114
    sget-object p2, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->READY_TO_LOAD:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    invoke-direct {p0, p2}, Lcom/ironsource/mediationsdk/BannerManager;->setState(Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    monitor-exit p0

    return-void

    .line 118
    :cond_3
    :try_start_1
    iget-object p2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mSmashArray:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ironsource/mediationsdk/BannerSmash;

    .line 119
    invoke-virtual {v1, v4}, Lcom/ironsource/mediationsdk/BannerSmash;->setReadyToLoad(Z)V

    goto :goto_0

    .line 122
    :cond_4
    iget-object p2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mSmashArray:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p2, v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/ironsource/mediationsdk/BannerSmash;

    const/16 v1, 0xbba

    .line 123
    invoke-direct {p0, v1, p2}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;)V

    .line 124
    iget-object v1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mAppKey:Ljava/lang/String;

    iget-object v5, p0, Lcom/ironsource/mediationsdk/BannerManager;->mUserId:Ljava/lang/String;

    invoke-virtual {p2, p1, v1, v5}, Lcom/ironsource/mediationsdk/BannerSmash;->loadBanner(Lcom/ironsource/mediationsdk/IronSourceBannerLayout;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_6

    .line 102
    :cond_5
    :goto_1
    iget-object p2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mLoggerManager:Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    sget-object v5, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->API:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    const-string v6, "A banner is already loaded"

    invoke-virtual {p2, v5, v6, v1}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    monitor-exit p0

    return-void

    :cond_6
    :goto_2
    :try_start_2
    const-string v5, "can\'t load banner - %s"

    new-array v6, v4, [Ljava/lang/Object;

    if-nez p2, :cond_7

    const-string p2, "placement is null"

    goto :goto_3

    :cond_7
    const-string p2, "placement name is empty"

    :goto_3
    aput-object p2, v6, v3

    .line 95
    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 96
    iget-object v5, p0, Lcom/ironsource/mediationsdk/BannerManager;->mLoggerManager:Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    sget-object v6, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->API:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    invoke-virtual {v5, v6, p2, v1}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 97
    monitor-exit p0

    return-void

    :cond_8
    :goto_4
    :try_start_3
    const-string p2, "can\'t load banner - %s"

    new-array v5, v4, [Ljava/lang/Object;

    if-nez p1, :cond_9

    const-string v6, "banner is null"

    goto :goto_5

    :cond_9
    const-string v6, "banner is destroyed"

    :goto_5
    aput-object v6, v5, v3

    .line 88
    invoke-static {p2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 89
    iget-object v5, p0, Lcom/ironsource/mediationsdk/BannerManager;->mLoggerManager:Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    sget-object v6, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->API:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    invoke-virtual {v5, v6, p2, v1}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 90
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    goto :goto_7

    :catch_0
    move-exception p2

    .line 127
    :try_start_4
    invoke-static {}, Lcom/ironsource/mediationsdk/BannerCallbackThrottler;->getInstance()Lcom/ironsource/mediationsdk/BannerCallbackThrottler;

    move-result-object v1

    new-instance v5, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "loadBanner() failed "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x25d

    invoke-direct {v5, v7, v6}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    invoke-virtual {v1, p1, v5}, Lcom/ironsource/mediationsdk/BannerCallbackThrottler;->sendBannerAdLoadFailed(Lcom/ironsource/mediationsdk/IronSourceBannerLayout;Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    new-array p1, v2, [[Ljava/lang/Object;

    new-array v1, v2, [Ljava/lang/Object;

    const-string v5, "errorCode"

    aput-object v5, v1, v3

    .line 128
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v4

    aput-object v1, p1, v3

    new-array v1, v2, [Ljava/lang/Object;

    const-string v2, "reason"

    aput-object v2, v1, v3

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    aput-object p2, v1, v4

    aput-object v1, p1, v4

    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 129
    sget-object p1, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->READY_TO_LOAD:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->setState(Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 131
    :goto_6
    monitor-exit p0

    return-void

    :goto_7
    monitor-exit p0

    throw p1
.end method

.method public onBannerAdClicked(Lcom/ironsource/mediationsdk/BannerSmash;)V
    .locals 5

    const-string v0, "onBannerAdClicked"

    .line 294
    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->callbackLog(Ljava/lang/String;Lcom/ironsource/mediationsdk/BannerSmash;)V

    const/4 v0, 0x0

    .line 296
    check-cast v0, [[Ljava/lang/Object;

    .line 299
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->canSendBannerCallbacks()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 300
    iget-object v1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIronsourceBanner:Lcom/ironsource/mediationsdk/IronSourceBannerLayout;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/IronSourceBannerLayout;->sendBannerAdClicked()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    new-array v1, v0, [[Ljava/lang/Object;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "reason"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "banner is destroyed"

    aput-object v3, v2, v0

    aput-object v2, v1, v4

    move-object v0, v1

    :goto_0
    const/16 v1, 0xc28

    .line 305
    invoke-direct {p0, v1, v0}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    const/16 v1, 0xbc0

    .line 306
    invoke-direct {p0, v1, p1, v0}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;[[Ljava/lang/Object;)V

    return-void
.end method

.method public onBannerAdLeftApplication(Lcom/ironsource/mediationsdk/BannerSmash;)V
    .locals 5

    const-string v0, "onBannerAdLeftApplication"

    .line 345
    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->callbackLog(Ljava/lang/String;Lcom/ironsource/mediationsdk/BannerSmash;)V

    const/4 v0, 0x0

    .line 347
    check-cast v0, [[Ljava/lang/Object;

    .line 350
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->canSendBannerCallbacks()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 351
    iget-object v1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIronsourceBanner:Lcom/ironsource/mediationsdk/IronSourceBannerLayout;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/IronSourceBannerLayout;->sendBannerAdLeftApplication()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    new-array v1, v0, [[Ljava/lang/Object;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "reason"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "banner is destroyed"

    aput-object v3, v2, v0

    aput-object v2, v1, v4

    move-object v0, v1

    :goto_0
    const/16 v1, 0xc2b

    .line 356
    invoke-direct {p0, v1, v0}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    const/16 v1, 0xce8

    .line 357
    invoke-direct {p0, v1, p1, v0}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;[[Ljava/lang/Object;)V

    return-void
.end method

.method public onBannerAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/BannerSmash;Z)V
    .locals 7

    .line 218
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onBannerAdLoadFailed "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/ironsource/mediationsdk/BannerManager;->callbackLog(Ljava/lang/String;Lcom/ironsource/mediationsdk/BannerSmash;)V

    .line 219
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    sget-object v2, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->FIRST_LOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    sget-object v2, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->LOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    if-eq v0, v2, :cond_0

    .line 220
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/BannerSmash;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " wrong state="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->debugLog(Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v0, "errorCode"

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz p3, :cond_1

    const/16 p1, 0xcea

    .line 225
    invoke-direct {p0, p1, p2}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;)V

    goto :goto_0

    :cond_1
    const/16 p3, 0xce4

    new-array v4, v1, [[Ljava/lang/Object;

    new-array v5, v1, [Ljava/lang/Object;

    aput-object v0, v5, v3

    .line 228
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorCode()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    aput-object v5, v4, v3

    new-array v5, v1, [Ljava/lang/Object;

    const-string v6, "reason"

    aput-object v6, v5, v3

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v5, v2

    aput-object v5, v4, v2

    invoke-direct {p0, p3, p2, v4}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;[[Ljava/lang/Object;)V

    .line 231
    :goto_0
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->loadNextSmash()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    .line 235
    :cond_2
    iget-object p1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    sget-object p2, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->FIRST_LOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    if-ne p1, p2, :cond_3

    .line 236
    invoke-static {}, Lcom/ironsource/mediationsdk/BannerCallbackThrottler;->getInstance()Lcom/ironsource/mediationsdk/BannerCallbackThrottler;

    move-result-object p1

    iget-object p2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIronsourceBanner:Lcom/ironsource/mediationsdk/IronSourceBannerLayout;

    new-instance p3, Lcom/ironsource/mediationsdk/logger/IronSourceError;

    const/16 v4, 0x25e

    const-string v5, "No ads to show"

    invoke-direct {p3, v4, v5}, Lcom/ironsource/mediationsdk/logger/IronSourceError;-><init>(ILjava/lang/String;)V

    invoke-virtual {p1, p2, p3}, Lcom/ironsource/mediationsdk/BannerCallbackThrottler;->sendBannerAdLoadFailed(Lcom/ironsource/mediationsdk/IronSourceBannerLayout;Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    const/16 p1, 0xc27

    new-array p2, v2, [[Ljava/lang/Object;

    new-array p3, v1, [Ljava/lang/Object;

    aput-object v0, p3, v3

    .line 237
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, p3, v2

    aput-object p3, p2, v3

    invoke-direct {p0, p1, p2}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    .line 238
    sget-object p1, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->READY_TO_LOAD:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->setState(Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;)V

    goto :goto_1

    :cond_3
    const/16 p1, 0xc81

    .line 240
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I)V

    .line 241
    sget-object p1, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->RELOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->setState(Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;)V

    .line 242
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->startReloadTimer()V

    :goto_1
    return-void
.end method

.method public onBannerAdLoaded(Lcom/ironsource/mediationsdk/BannerSmash;Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 2

    const-string v0, "onBannerAdLoaded"

    .line 190
    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->callbackLog(Ljava/lang/String;Lcom/ironsource/mediationsdk/BannerSmash;)V

    .line 192
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    sget-object v1, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->FIRST_LOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    if-ne v0, v1, :cond_2

    const/16 v0, 0xbbd

    .line 193
    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;)V

    .line 194
    invoke-direct {p0, p1, p2, p3}, Lcom/ironsource/mediationsdk/BannerManager;->bindView(Lcom/ironsource/mediationsdk/BannerSmash;Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;)V

    .line 195
    iget-object p2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mCurrentPlacement:Lcom/ironsource/mediationsdk/model/BannerPlacement;

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/model/BannerPlacement;->getPlacementName()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    const-string p2, ""

    .line 196
    :goto_0
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object p3

    invoke-virtual {p3}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getCurrentActiveActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-static {p3, p2}, Lcom/ironsource/mediationsdk/utils/CappingManager;->incrementBnShowCounter(Landroid/content/Context;Ljava/lang/String;)V

    .line 198
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object p3

    invoke-virtual {p3}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getCurrentActiveActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-static {p3, p2}, Lcom/ironsource/mediationsdk/utils/CappingManager;->isBnPlacementCapped(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    const/16 p2, 0xd48

    .line 199
    invoke-direct {p0, p2}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I)V

    .line 202
    :cond_1
    iget-object p2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIronsourceBanner:Lcom/ironsource/mediationsdk/IronSourceBannerLayout;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/BannerSmash;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/ironsource/mediationsdk/IronSourceBannerLayout;->sendBannerAdLoaded(Ljava/lang/String;)V

    const/16 p1, 0xc26

    .line 203
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I)V

    .line 205
    sget-object p1, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->RELOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->setState(Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;)V

    .line 206
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->startReloadTimer()V

    goto :goto_1

    .line 208
    :cond_2
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    sget-object v1, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->LOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    if-ne v0, v1, :cond_3

    const/16 v0, 0xbc7

    .line 209
    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;)V

    .line 210
    invoke-direct {p0, p1, p2, p3}, Lcom/ironsource/mediationsdk/BannerManager;->bindView(Lcom/ironsource/mediationsdk/BannerSmash;Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;)V

    .line 211
    sget-object p1, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->RELOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->setState(Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;)V

    .line 212
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->startReloadTimer()V

    :cond_3
    :goto_1
    return-void
.end method

.method public onBannerAdReloadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/BannerSmash;Z)V
    .locals 6

    .line 268
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onBannerAdReloadFailed "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/ironsource/mediationsdk/BannerManager;->callbackLog(Ljava/lang/String;Lcom/ironsource/mediationsdk/BannerSmash;)V

    .line 269
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    sget-object v2, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->RELOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    if-eq v0, v2, :cond_0

    .line 270
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/BannerSmash;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " wrong state="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    invoke-virtual {p2}, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->debugLog(Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x1

    if-eqz p3, :cond_1

    const/16 p1, 0xceb

    .line 275
    invoke-direct {p0, p1, p2}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;)V

    goto :goto_0

    :cond_1
    const/16 p3, 0xce5

    const/4 v1, 0x2

    new-array v2, v1, [[Ljava/lang/Object;

    new-array v3, v1, [Ljava/lang/Object;

    const-string v4, "errorCode"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 278
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v0

    aput-object v3, v2, v5

    new-array v1, v1, [Ljava/lang/Object;

    const-string v3, "reason"

    aput-object v3, v1, v5

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/logger/IronSourceError;->getErrorMessage()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v0

    aput-object v1, v2, v0

    invoke-direct {p0, p3, p2, v2}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;[[Ljava/lang/Object;)V

    .line 281
    :goto_0
    iget-object p1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mSmashArray:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result p1

    if-ne p1, v0, :cond_2

    const/16 p1, 0xc81

    .line 282
    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I)V

    .line 283
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->startReloadTimer()V

    return-void

    .line 287
    :cond_2
    sget-object p1, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->LOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->setState(Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;)V

    .line 288
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->resetIteration()V

    .line 289
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->loadNextSmash()Z

    return-void
.end method

.method public onBannerAdReloaded(Lcom/ironsource/mediationsdk/BannerSmash;Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;Z)V
    .locals 2

    const-string v0, "onBannerAdReloaded"

    .line 248
    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->callbackLog(Ljava/lang/String;Lcom/ironsource/mediationsdk/BannerSmash;)V

    .line 250
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    sget-object v1, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->RELOAD_IN_PROGRESS:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    if-eq v0, v1, :cond_0

    .line 251
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "onBannerAdReloaded "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/BannerSmash;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " wrong state="

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mState:Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/BannerManager$BANNER_STATE;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->debugLog(Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v0, "bannerReloadSucceeded"

    .line 255
    invoke-static {v0}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->sendAutomationLog(Ljava/lang/String;)V

    const/16 v0, 0xbc7

    .line 256
    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;)V

    .line 258
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "bindView = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->callbackLog(Ljava/lang/String;Lcom/ironsource/mediationsdk/BannerSmash;)V

    if-eqz p4, :cond_1

    .line 260
    invoke-direct {p0, p1, p2, p3}, Lcom/ironsource/mediationsdk/BannerManager;->bindView(Lcom/ironsource/mediationsdk/BannerSmash;Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;)V

    .line 263
    :cond_1
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->startReloadTimer()V

    return-void
.end method

.method public onBannerAdScreenDismissed(Lcom/ironsource/mediationsdk/BannerSmash;)V
    .locals 5

    const-string v0, "onBannerAdScreenDismissed"

    .line 311
    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->callbackLog(Ljava/lang/String;Lcom/ironsource/mediationsdk/BannerSmash;)V

    const/4 v0, 0x0

    .line 313
    check-cast v0, [[Ljava/lang/Object;

    .line 316
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->canSendBannerCallbacks()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 317
    iget-object v1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIronsourceBanner:Lcom/ironsource/mediationsdk/IronSourceBannerLayout;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/IronSourceBannerLayout;->sendBannerAdScreenDismissed()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    new-array v1, v0, [[Ljava/lang/Object;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "reason"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "banner is destroyed"

    aput-object v3, v2, v0

    aput-object v2, v1, v4

    move-object v0, v1

    :goto_0
    const/16 v1, 0xc2a

    .line 322
    invoke-direct {p0, v1, v0}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    const/16 v1, 0xce7

    .line 323
    invoke-direct {p0, v1, p1, v0}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;[[Ljava/lang/Object;)V

    return-void
.end method

.method public onBannerAdScreenPresented(Lcom/ironsource/mediationsdk/BannerSmash;)V
    .locals 5

    const-string v0, "onBannerAdScreenPresented"

    .line 328
    invoke-direct {p0, v0, p1}, Lcom/ironsource/mediationsdk/BannerManager;->callbackLog(Ljava/lang/String;Lcom/ironsource/mediationsdk/BannerSmash;)V

    const/4 v0, 0x0

    .line 330
    check-cast v0, [[Ljava/lang/Object;

    .line 333
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/BannerManager;->canSendBannerCallbacks()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 334
    iget-object v1, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIronsourceBanner:Lcom/ironsource/mediationsdk/IronSourceBannerLayout;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/IronSourceBannerLayout;->sendBannerAdScreenPresented()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    new-array v1, v0, [[Ljava/lang/Object;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "reason"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "banner is destroyed"

    aput-object v3, v2, v0

    aput-object v2, v1, v4

    move-object v0, v1

    :goto_0
    const/16 v1, 0xc29

    .line 339
    invoke-direct {p0, v1, v0}, Lcom/ironsource/mediationsdk/BannerManager;->sendMediationEvent(I[[Ljava/lang/Object;)V

    const/16 v1, 0xce6

    .line 340
    invoke-direct {p0, v1, p1, v0}, Lcom/ironsource/mediationsdk/BannerManager;->sendProviderEvent(ILcom/ironsource/mediationsdk/BannerSmash;[[Ljava/lang/Object;)V

    return-void
.end method

.method public onPause()V
    .locals 1

    const/4 v0, 0x0

    .line 472
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIsInForeground:Ljava/lang/Boolean;

    return-void
.end method

.method public onResume()V
    .locals 1

    const/4 v0, 0x1

    .line 476
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/ironsource/mediationsdk/BannerManager;->mIsInForeground:Ljava/lang/Boolean;

    return-void
.end method
