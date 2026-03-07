.class Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3$1;
.super Ljava/lang/Object;
.source "AnalyticsEventController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3;->onResponse(Lorg/json/JSONArray;Ljava/lang/Integer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3;)V
    .locals 0

    .line 173
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3$1;->this$1:Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 176
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3$1;->this$1:Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3;->val$controller:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3$1;->this$1:Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3;

    iget-object v1, v1, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3;->val$eventIdsArray:[Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->removeAnalyticsEventsFromStorage([Ljava/lang/String;)V

    .line 177
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3$1;->this$1:Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3;->val$controller:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->syncController:Lcom/helpshift/controllers/SyncController;

    const-string v1, "data_type_analytics_event"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/controllers/SyncController;->dataSynced(Ljava/lang/String;Z)V

    return-void
.end method
