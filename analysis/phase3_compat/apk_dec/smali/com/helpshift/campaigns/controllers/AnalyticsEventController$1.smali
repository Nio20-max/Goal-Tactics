.class Lcom/helpshift/campaigns/controllers/AnalyticsEventController$1;
.super Ljava/lang/Object;
.source "AnalyticsEventController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->addEventToStorage(Lcom/helpshift/campaigns/models/AnalyticsEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

.field final synthetic val$newEvent:Lcom/helpshift/campaigns/models/AnalyticsEvent;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/AnalyticsEventController;Lcom/helpshift/campaigns/models/AnalyticsEvent;)V
    .locals 0

    .line 67
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$1;->this$0:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$1;->val$newEvent:Lcom/helpshift/campaigns/models/AnalyticsEvent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 70
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$1;->this$0:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$1;->val$newEvent:Lcom/helpshift/campaigns/models/AnalyticsEvent;

    iget-object v1, v1, Lcom/helpshift/campaigns/models/AnalyticsEvent;->type:Ljava/lang/Integer;

    iget-object v2, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$1;->val$newEvent:Lcom/helpshift/campaigns/models/AnalyticsEvent;

    iget-object v2, v2, Lcom/helpshift/campaigns/models/AnalyticsEvent;->campaignId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->addToRecordedEventsMap(Ljava/lang/Integer;Ljava/lang/String;)V

    .line 71
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$1;->this$0:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->storage:Lcom/helpshift/storage/KeyValueStorage;

    const-string v1, "kAnalyticsEvents"

    invoke-interface {v0, v1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 75
    :cond_0
    iget-object v2, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$1;->val$newEvent:Lcom/helpshift/campaigns/models/AnalyticsEvent;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    iget-object v2, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$1;->this$0:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    iget-object v2, v2, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v2, v1, v0}, Lcom/helpshift/storage/KeyValueStorage;->set(Ljava/lang/String;Ljava/io/Serializable;)Z

    .line 77
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$1;->this$0:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->syncController:Lcom/helpshift/controllers/SyncController;

    const/4 v1, 0x1

    const-string v2, "data_type_analytics_event"

    invoke-virtual {v0, v2, v1}, Lcom/helpshift/controllers/SyncController;->incrementDataChangeCount(Ljava/lang/String;I)V

    return-void
.end method
