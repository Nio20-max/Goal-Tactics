.class final Lcom/helpshift/campaigns/util/InAppCampaignsUtil$1;
.super Ljava/lang/Object;
.source "InAppCampaignsUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/util/InAppCampaignsUtil;->removeExpiredCampaigns(Landroid/content/Context;Lcom/helpshift/campaigns/storage/CampaignStorage;Ljava/util/List;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$expiredCampaignIds:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/storage/CampaignStorage;Ljava/util/List;Landroid/content/Context;)V
    .locals 0

    .line 115
    iput-object p1, p0, Lcom/helpshift/campaigns/util/InAppCampaignsUtil$1;->val$campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    iput-object p2, p0, Lcom/helpshift/campaigns/util/InAppCampaignsUtil$1;->val$expiredCampaignIds:Ljava/util/List;

    iput-object p3, p0, Lcom/helpshift/campaigns/util/InAppCampaignsUtil$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 118
    iget-object v0, p0, Lcom/helpshift/campaigns/util/InAppCampaignsUtil$1;->val$campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    iget-object v1, p0, Lcom/helpshift/campaigns/util/InAppCampaignsUtil$1;->val$expiredCampaignIds:Ljava/util/List;

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/String;

    invoke-interface {v1, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/helpshift/campaigns/storage/CampaignStorage;->deleteCampaigns([Ljava/lang/String;)V

    .line 119
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->analyticsEventController:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    .line 120
    iget-object v1, p0, Lcom/helpshift/campaigns/util/InAppCampaignsUtil$1;->val$expiredCampaignIds:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 121
    iget-object v4, p0, Lcom/helpshift/campaigns/util/InAppCampaignsUtil$1;->val$context:Landroid/content/Context;

    invoke-static {v4, v3}, Lcom/helpshift/util/ApplicationUtil;->cancelNotification(Landroid/content/Context;Ljava/lang/String;)V

    .line 122
    sget-object v4, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->DELETE_EXPIRED_MESSAGE:Ljava/lang/Integer;

    .line 124
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 122
    invoke-virtual {v0, v4, v3, v5}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->recordAnalyticsEvent(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;)V

    goto :goto_0

    :cond_0
    return-void
.end method
