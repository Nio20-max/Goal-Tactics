.class public Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;
.super Ljava/lang/Object;
.source "WaterfallLifeCycleHolder.java"


# static fields
.field private static TAG:Ljava/lang/String; = "WaterfallLifeCycleHolder"


# instance fields
.field private currentWaterfallId:Ljava/lang/String;

.field private disableLoadWhileShowSupportNetworks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private previousWaterfallId:Ljava/lang/String;

.field private showingSmash:Lcom/ironsource/mediationsdk/LWSProgRvSmash;

.field private timeToDeleteOldWaterfallAfterAuction:I

.field private timer:Ljava/util/Timer;

.field waterfalls:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/ironsource/mediationsdk/LWSProgRvSmash;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->waterfalls:Ljava/util/concurrent/ConcurrentHashMap;

    const-string v0, ""

    .line 25
    iput-object v0, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->currentWaterfallId:Ljava/lang/String;

    .line 27
    iput-object v0, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->previousWaterfallId:Ljava/lang/String;

    .line 36
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->timer:Ljava/util/Timer;

    .line 39
    iput-object p1, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->disableLoadWhileShowSupportNetworks:Ljava/util/List;

    .line 40
    iput p2, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->timeToDeleteOldWaterfallAfterAuction:I

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 18
    sget-object v0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public areWaterFallsOverMaximum()Z
    .locals 2

    .line 148
    iget-object v0, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->waterfalls:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    const/4 v1, 0x5

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getCurrentWaterfall()Ljava/util/concurrent/CopyOnWriteArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/ironsource/mediationsdk/LWSProgRvSmash;",
            ">;"
        }
    .end annotation

    .line 52
    iget-object v0, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->waterfalls:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->currentWaterfallId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    if-nez v0, :cond_0

    .line 54
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    :cond_0
    return-object v0
.end method

.method public getCurrentWaterfallId()Ljava/lang/String;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->currentWaterfallId:Ljava/lang/String;

    return-object v0
.end method

.method public getNumberOfWaterfalls()I
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->waterfalls:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    return v0
.end method

.method public getShowingSmash()Lcom/ironsource/mediationsdk/LWSProgRvSmash;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->showingSmash:Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    return-object v0
.end method

.method public setShowingSmash(Lcom/ironsource/mediationsdk/LWSProgRvSmash;)V
    .locals 0

    .line 44
    iput-object p1, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->showingSmash:Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    return-void
.end method

.method public shouldAddSmashToWaterfallRequest(Lcom/ironsource/mediationsdk/LWSProgRvSmash;)Z
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p1, :cond_0

    :goto_0
    const/4 v0, 0x1

    goto :goto_1

    .line 86
    :cond_0
    iget-object v2, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->showingSmash:Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    if-nez v2, :cond_1

    goto :goto_1

    .line 89
    :cond_1
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getLoadWhileShowSupportState()Lcom/ironsource/mediationsdk/LoadWhileShowSupportState;

    move-result-object v2

    sget-object v3, Lcom/ironsource/mediationsdk/LoadWhileShowSupportState;->LOAD_WHILE_SHOW_BY_NETWORK:Lcom/ironsource/mediationsdk/LoadWhileShowSupportState;

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->showingSmash:Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    .line 90
    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    .line 94
    :cond_2
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getLoadWhileShowSupportState()Lcom/ironsource/mediationsdk/LoadWhileShowSupportState;

    move-result-object v2

    sget-object v3, Lcom/ironsource/mediationsdk/LoadWhileShowSupportState;->NONE:Lcom/ironsource/mediationsdk/LoadWhileShowSupportState;

    if-eq v2, v3, :cond_3

    iget-object v2, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->disableLoadWhileShowSupportNetworks:Ljava/util/List;

    .line 95
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getNameForReflection()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    iget-object v2, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->showingSmash:Lcom/ironsource/mediationsdk/LWSProgRvSmash;

    .line 96
    invoke-virtual {v2}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getNameForReflection()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getNameForReflection()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_0

    :cond_4
    :goto_1
    if-eqz v0, :cond_5

    if-eqz p1, :cond_5

    .line 102
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v2

    sget-object v3, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->TAG:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/LWSProgRvSmash;->getInstanceName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " does not support load while show and will not be added to the auction request"

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, v3, p1, v1}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    :cond_5
    xor-int/lit8 p1, v0, 0x1

    return p1
.end method

.method public updateWaterFall(Ljava/util/concurrent/CopyOnWriteArrayList;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/ironsource/mediationsdk/LWSProgRvSmash;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 115
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->TAG:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " updating new  waterfall with id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 116
    iget-object v0, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->waterfalls:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    iget-object p1, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->previousWaterfallId:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 118
    iget-object p1, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->previousWaterfallId:Ljava/lang/String;

    .line 121
    iget-object v0, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->timer:Ljava/util/Timer;

    new-instance v1, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder$1;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder$1;-><init>(Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;Ljava/lang/String;)V

    iget p1, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->timeToDeleteOldWaterfallAfterAuction:I

    int-to-long v2, p1

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 138
    :cond_0
    iget-object p1, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->currentWaterfallId:Ljava/lang/String;

    iput-object p1, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->previousWaterfallId:Ljava/lang/String;

    .line 139
    iput-object p2, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->currentWaterfallId:Ljava/lang/String;

    return-void
.end method
