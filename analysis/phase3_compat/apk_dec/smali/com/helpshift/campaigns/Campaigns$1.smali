.class final Lcom/helpshift/campaigns/Campaigns$1;
.super Ljava/lang/Object;
.source "Campaigns.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/Campaigns;->showInbox(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 0

    .line 220
    iput-object p1, p0, Lcom/helpshift/campaigns/Campaigns$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    const-string v0, "Helpshift_Campaigns"

    const-string v1, "Show Inbox"

    .line 223
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/helpshift/campaigns/Campaigns$1;->val$activity:Landroid/app/Activity;

    const-class v2, Lcom/helpshift/campaigns/activities/ParentActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 225
    iget-object v1, p0, Lcom/helpshift/campaigns/Campaigns$1;->val$activity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/helpshift/util/ActivityUtil;->isFullScreen(Landroid/app/Activity;)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "showInFullScreen"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string v1, "launch_source"

    const/4 v2, 0x2

    .line 226
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 227
    iget-object v1, p0, Lcom/helpshift/campaigns/Campaigns$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 228
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/DeviceController;->resetPoller()V

    return-void
.end method
