.class Lcom/helpshift/campaigns/controllers/AnalyticsEventController$4;
.super Ljava/lang/Object;
.source "AnalyticsEventController.java"

# interfaces
.implements Lcom/helpshift/network/response/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->getRequest()Lcom/helpshift/network/request/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

.field final synthetic val$controller:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/AnalyticsEventController;Lcom/helpshift/campaigns/controllers/AnalyticsEventController;)V
    .locals 0

    .line 183
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$4;->this$0:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$4;->val$controller:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/helpshift/network/errors/NetworkError;Ljava/lang/Integer;)V
    .locals 1

    .line 186
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$4;->val$controller:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    iget-object p2, p2, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->syncController:Lcom/helpshift/controllers/SyncController;

    const-string v0, "data_type_analytics_event"

    invoke-virtual {p2, v0, p1}, Lcom/helpshift/controllers/SyncController;->dataSyncFailed(Ljava/lang/String;Lcom/helpshift/network/errors/NetworkError;)V

    return-void
.end method
