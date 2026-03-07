.class public Lcom/helpshift/campaigns/poller/CampaignsPoller;
.super Lcom/helpshift/poller/Poller;
.source "CampaignsPoller.java"


# instance fields
.field private final failureBackoff:Lcom/helpshift/common/poller/HttpBackoff;

.field private final successBackoff:Lcom/helpshift/common/poller/HttpBackoff;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Callable;)V
    .locals 3

    .line 22
    new-instance v0, Lcom/helpshift/common/domain/HSThreadFactory;

    const-string v1, "cmpoll-a"

    invoke-direct {v0, v1}, Lcom/helpshift/common/domain/HSThreadFactory;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/helpshift/common/domain/HSThreadFactory;

    const-string v2, "cmpoll-b"

    invoke-direct {v1, v2}, Lcom/helpshift/common/domain/HSThreadFactory;-><init>(Ljava/lang/String;)V

    .line 23
    invoke-static {v1}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    .line 22
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/poller/Poller;-><init>(Ljava/util/concurrent/Callable;Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ScheduledExecutorService;)V

    .line 24
    new-instance p1, Lcom/helpshift/common/poller/HttpBackoff$Builder;

    invoke-direct {p1}, Lcom/helpshift/common/poller/HttpBackoff$Builder;-><init>()V

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x3

    .line 25
    invoke-static {v1, v2, v0}, Lcom/helpshift/common/poller/Delay;->of(JLjava/util/concurrent/TimeUnit;)Lcom/helpshift/common/poller/Delay;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->setBaseInterval(Lcom/helpshift/common/poller/Delay;)Lcom/helpshift/common/poller/HttpBackoff$Builder;

    move-result-object p1

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    .line 26
    invoke-static {v1, v2, v0}, Lcom/helpshift/common/poller/Delay;->of(JLjava/util/concurrent/TimeUnit;)Lcom/helpshift/common/poller/Delay;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->setMaxInterval(Lcom/helpshift/common/poller/Delay;)Lcom/helpshift/common/poller/HttpBackoff$Builder;

    move-result-object p1

    const/4 v0, 0x0

    .line 27
    invoke-virtual {p1, v0}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->setRandomness(F)Lcom/helpshift/common/poller/HttpBackoff$Builder;

    move-result-object p1

    const/high16 v0, 0x3f800000    # 1.0f

    .line 28
    invoke-virtual {p1, v0}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->setMultiplier(F)Lcom/helpshift/common/poller/HttpBackoff$Builder;

    move-result-object p1

    .line 29
    invoke-virtual {p1}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->build()Lcom/helpshift/common/poller/HttpBackoff;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/poller/CampaignsPoller;->successBackoff:Lcom/helpshift/common/poller/HttpBackoff;

    .line 30
    new-instance p1, Lcom/helpshift/common/poller/HttpBackoff$Builder;

    invoke-direct {p1}, Lcom/helpshift/common/poller/HttpBackoff$Builder;-><init>()V

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x5

    .line 31
    invoke-static {v1, v2, v0}, Lcom/helpshift/common/poller/Delay;->of(JLjava/util/concurrent/TimeUnit;)Lcom/helpshift/common/poller/Delay;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->setBaseInterval(Lcom/helpshift/common/poller/Delay;)Lcom/helpshift/common/poller/HttpBackoff$Builder;

    move-result-object p1

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0xa

    .line 32
    invoke-static {v1, v2, v0}, Lcom/helpshift/common/poller/Delay;->of(JLjava/util/concurrent/TimeUnit;)Lcom/helpshift/common/poller/Delay;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->setMaxInterval(Lcom/helpshift/common/poller/Delay;)Lcom/helpshift/common/poller/HttpBackoff$Builder;

    move-result-object p1

    sget-object v0, Lcom/helpshift/common/poller/HttpBackoff$RetryPolicy;->FAILURE:Lcom/helpshift/common/poller/HttpBackoff$RetryPolicy;

    .line 33
    invoke-virtual {p1, v0}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->setRetryPolicy(Lcom/helpshift/common/poller/HttpBackoff$RetryPolicy;)Lcom/helpshift/common/poller/HttpBackoff$Builder;

    move-result-object p1

    .line 34
    invoke-virtual {p1}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->build()Lcom/helpshift/common/poller/HttpBackoff;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/poller/CampaignsPoller;->failureBackoff:Lcom/helpshift/common/poller/HttpBackoff;

    return-void
.end method


# virtual methods
.method public getFailDelay(Ljava/lang/Exception;)Lcom/helpshift/common/poller/Delay;
    .locals 5

    .line 52
    iget-object v0, p0, Lcom/helpshift/campaigns/poller/CampaignsPoller;->successBackoff:Lcom/helpshift/common/poller/HttpBackoff;

    invoke-virtual {v0}, Lcom/helpshift/common/poller/HttpBackoff;->reset()V

    .line 56
    instance-of v0, p1, Lcom/helpshift/network/errors/NetworkError;

    const-wide/16 v1, -0x64

    if-eqz v0, :cond_0

    .line 57
    check-cast p1, Lcom/helpshift/network/errors/NetworkError;

    invoke-virtual {p1}, Lcom/helpshift/network/errors/NetworkError;->getReason()Ljava/lang/Integer;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 59
    iget-object v0, p0, Lcom/helpshift/campaigns/poller/CampaignsPoller;->failureBackoff:Lcom/helpshift/common/poller/HttpBackoff;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/helpshift/common/poller/HttpBackoff;->nextIntervalMillis(I)J

    move-result-wide v3

    goto :goto_0

    :cond_0
    move-wide v3, v1

    :goto_0
    cmp-long p1, v3, v1

    if-eqz p1, :cond_1

    .line 63
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v3, v4, p1}, Lcom/helpshift/common/poller/Delay;->of(JLjava/util/concurrent/TimeUnit;)Lcom/helpshift/common/poller/Delay;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getSuccessDelay(Ljava/lang/Object;)Lcom/helpshift/common/poller/Delay;
    .locals 4

    .line 40
    iget-object p1, p0, Lcom/helpshift/campaigns/poller/CampaignsPoller;->failureBackoff:Lcom/helpshift/common/poller/HttpBackoff;

    invoke-virtual {p1}, Lcom/helpshift/common/poller/HttpBackoff;->reset()V

    .line 42
    iget-object p1, p0, Lcom/helpshift/campaigns/poller/CampaignsPoller;->successBackoff:Lcom/helpshift/common/poller/HttpBackoff;

    const/16 v0, 0xc8

    invoke-virtual {p1, v0}, Lcom/helpshift/common/poller/HttpBackoff;->nextIntervalMillis(I)J

    move-result-wide v0

    const-wide/16 v2, -0x64

    cmp-long p1, v0, v2

    if-eqz p1, :cond_0

    .line 44
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v0, v1, p1}, Lcom/helpshift/common/poller/Delay;->of(JLjava/util/concurrent/TimeUnit;)Lcom/helpshift/common/poller/Delay;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
