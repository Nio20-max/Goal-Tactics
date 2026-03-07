.class public Lcom/helpshift/campaigns/activities/NotificationActivity;
.super Landroid/app/Activity;
.source "NotificationActivity.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_NotifAct"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 8

    .line 21
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const-string p1, "Helpshift_NotifAct"

    const-string v0, "Campaign notification clicked"

    .line 23
    invoke-static {p1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    invoke-virtual {p0}, Lcom/helpshift/campaigns/activities/NotificationActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "action"

    .line 25
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "0"

    .line 30
    :cond_0
    invoke-static {v0}, Lcom/helpshift/enums/ACTION_TYPE;->getEnum(Ljava/lang/String;)Lcom/helpshift/enums/ACTION_TYPE;

    move-result-object v0

    const-string v1, "data"

    .line 32
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "campaignId"

    .line 33
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "foregroundStatus"

    const/4 v5, 0x1

    .line 34
    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    .line 37
    invoke-static {p0, v3, v5}, Lcom/helpshift/util/ApplicationUtil;->cancelNotification(Landroid/content/Context;Ljava/lang/String;I)V

    .line 39
    sget-object v6, Lcom/helpshift/enums/ACTION_TYPE;->SHOW_INBOX:Lcom/helpshift/enums/ACTION_TYPE;

    if-eq v0, v6, :cond_1

    .line 40
    sget-object v6, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->DEFAULT:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const-string/jumbo v7, "type"

    invoke-virtual {p1, v7, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    .line 41
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v6

    iget-object v6, v6, Lcom/helpshift/campaigns/controllers/ControllerFactory;->analyticsEventController:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v6, p1, v3, v7}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->recordAnalyticsEvent(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;)V

    :cond_1
    if-eqz v4, :cond_4

    .line 45
    sget-object p1, Lcom/helpshift/campaigns/activities/NotificationActivity$1;->$SwitchMap$com$helpshift$enums$ACTION_TYPE:[I

    invoke-virtual {v0}, Lcom/helpshift/enums/ACTION_TYPE;->ordinal()I

    move-result v4

    aget p1, p1, v4

    if-eq p1, v5, :cond_2

    .line 59
    invoke-static {}, Lcom/helpshift/CoreInternal;->getActionExecutor()Lcom/helpshift/executors/ActionExecutor;

    move-result-object p1

    invoke-interface {p1, p0, v0, v1}, Lcom/helpshift/executors/ActionExecutor;->executeAction(Landroid/app/Activity;Lcom/helpshift/enums/ACTION_TYPE;Ljava/lang/String;)V

    goto :goto_0

    .line 47
    :cond_2
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object p1

    iget-object p1, p1, Lcom/helpshift/campaigns/controllers/ControllerFactory;->inboxApi:Lcom/helpshift/campaigns/Inbox;

    if-eqz p1, :cond_3

    .line 48
    invoke-virtual {p1}, Lcom/helpshift/campaigns/Inbox;->getInboxPushNotificationDelegate()Lcom/helpshift/campaigns/delegates/InboxPushNotificationDelegate;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 49
    invoke-virtual {p1}, Lcom/helpshift/campaigns/Inbox;->getInboxPushNotificationDelegate()Lcom/helpshift/campaigns/delegates/InboxPushNotificationDelegate;

    move-result-object p1

    invoke-interface {p1, v3}, Lcom/helpshift/campaigns/delegates/InboxPushNotificationDelegate;->onInboxMessagePushNotificationClicked(Ljava/lang/String;)V

    goto :goto_0

    .line 52
    :cond_3
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/helpshift/campaigns/activities/ParentActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v0, "launch_source"

    .line 53
    invoke-virtual {p1, v0, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 54
    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 55
    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/activities/NotificationActivity;->startActivity(Landroid/content/Intent;)V

    .line 63
    :cond_4
    :goto_0
    invoke-virtual {p0}, Lcom/helpshift/campaigns/activities/NotificationActivity;->finish()V

    return-void
.end method
