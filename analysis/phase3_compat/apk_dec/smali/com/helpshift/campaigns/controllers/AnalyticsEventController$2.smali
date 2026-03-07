.class Lcom/helpshift/campaigns/controllers/AnalyticsEventController$2;
.super Ljava/lang/Object;
.source "AnalyticsEventController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->removeAnalyticsEventsFromStorage([Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

.field final synthetic val$eventIds:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/AnalyticsEventController;[Ljava/lang/String;)V
    .locals 0

    .line 110
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$2;->this$0:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$2;->val$eventIds:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 113
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$2;->this$0:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->storage:Lcom/helpshift/storage/KeyValueStorage;

    const-string v1, "kAnalyticsEvents"

    invoke-interface {v0, v1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 114
    iget-object v2, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$2;->this$0:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    iget-object v2, v2, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v2, v1}, Lcom/helpshift/storage/KeyValueStorage;->removeKey(Ljava/lang/String;)V

    .line 116
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$2;->val$eventIds:[Ljava/lang/String;

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 117
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 118
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/campaigns/models/AnalyticsEvent;

    .line 119
    iget-object v5, v4, Lcom/helpshift/campaigns/models/AnalyticsEvent;->eventId:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 120
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 123
    :cond_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 124
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$2;->this$0:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, v1, v3}, Lcom/helpshift/storage/KeyValueStorage;->set(Ljava/lang/String;Ljava/io/Serializable;)Z

    :cond_2
    return-void
.end method
