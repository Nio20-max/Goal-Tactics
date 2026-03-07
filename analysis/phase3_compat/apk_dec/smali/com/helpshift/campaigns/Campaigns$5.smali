.class Lcom/helpshift/campaigns/Campaigns$5;
.super Ljava/lang/Object;
.source "Campaigns.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/Campaigns;->_handlePush(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/Campaigns;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/Campaigns;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 538
    iput-object p1, p0, Lcom/helpshift/campaigns/Campaigns$5;->this$0:Lcom/helpshift/campaigns/Campaigns;

    iput-object p2, p0, Lcom/helpshift/campaigns/Campaigns$5;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/helpshift/campaigns/Campaigns$5;->val$intent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 541
    iget-object v0, p0, Lcom/helpshift/campaigns/Campaigns$5;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/helpshift/campaigns/Campaigns$5;->val$intent:Landroid/content/Intent;

    invoke-static {v0, v1}, Lcom/helpshift/campaigns/util/CampaignsNotification;->createNotification(Landroid/content/Context;Landroid/content/Intent;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 543
    iget-object v1, p0, Lcom/helpshift/campaigns/Campaigns$5;->val$intent:Landroid/content/Intent;

    invoke-static {v1}, Lcom/helpshift/campaigns/util/CampaignsNotification;->getCampaignsId(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v1

    .line 544
    invoke-virtual {v0}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    .line 545
    new-instance v2, Lcom/helpshift/notifications/NotificationChannelsManager;

    iget-object v3, p0, Lcom/helpshift/campaigns/Campaigns$5;->val$context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/helpshift/notifications/NotificationChannelsManager;-><init>(Landroid/content/Context;)V

    .line 546
    sget-object v3, Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;->CAMPAIGN:Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;

    invoke-virtual {v2, v0, v3}, Lcom/helpshift/notifications/NotificationChannelsManager;->attachChannelId(Landroid/app/Notification;Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;)Landroid/app/Notification;

    move-result-object v0

    .line 547
    iget-object v2, p0, Lcom/helpshift/campaigns/Campaigns$5;->val$context:Landroid/content/Context;

    invoke-static {v2, v1, v0}, Lcom/helpshift/util/ApplicationUtil;->showNotification(Landroid/content/Context;Ljava/lang/String;Landroid/app/Notification;)V

    :cond_0
    return-void
.end method
