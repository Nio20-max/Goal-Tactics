.class Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder$1;
.super Ljava/util/TimerTask;
.source "WaterfallLifeCycleHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->updateWaterFall(Ljava/util/concurrent/CopyOnWriteArrayList;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

.field final synthetic val$waterFallIdToDelete:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;Ljava/lang/String;)V
    .locals 0

    .line 121
    iput-object p1, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder$1;->this$0:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    iput-object p2, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder$1;->val$waterFallIdToDelete:Ljava/lang/String;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 125
    :try_start_0
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->access$000()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " removing waterfall with id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder$1;->val$waterFallIdToDelete:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " from memory"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V

    .line 126
    iget-object v0, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder$1;->this$0:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    iget-object v0, v0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->waterfalls:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder$1;->val$waterFallIdToDelete:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    invoke-static {}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->getLogger()Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->access$000()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " waterfall size is currently "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder$1;->this$0:Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;

    iget-object v4, v4, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder;->waterfalls:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/logger/IronSourceLoggerManager;->log(Lcom/ironsource/mediationsdk/logger/IronSourceLogger$IronSourceTag;Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    invoke-virtual {p0}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder$1;->cancel()Z

    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/ironsource/mediationsdk/WaterfallLifeCycleHolder$1;->cancel()Z

    .line 131
    throw v0
.end method
