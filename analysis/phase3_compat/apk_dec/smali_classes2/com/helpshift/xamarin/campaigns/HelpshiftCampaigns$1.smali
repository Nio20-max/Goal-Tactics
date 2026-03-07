.class final Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$1;
.super Ljava/lang/Object;
.source "HelpshiftCampaigns.java"

# interfaces
.implements Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns;->setInboxMessageDelegate(Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$xamarinInboxMessageDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;


# direct methods
.method constructor <init>(Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$1;->val$xamarinInboxMessageDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public coverImageDownloaded(Ljava/lang/String;)V
    .locals 1

    .line 199
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$1;->val$xamarinInboxMessageDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;->coverImageDownloaded(Ljava/lang/String;)V

    return-void
.end method

.method public iconImageDownloaded(Ljava/lang/String;)V
    .locals 1

    .line 194
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$1;->val$xamarinInboxMessageDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;->iconImageDownloaded(Ljava/lang/String;)V

    return-void
.end method

.method public inboxMessageAdded(Lcom/helpshift/campaigns/models/InboxMessage;)V
    .locals 3

    .line 69
    new-instance v0, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$1$1;

    invoke-direct {v0, p0, p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$1$1;-><init>(Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$1;Lcom/helpshift/campaigns/models/InboxMessage;)V

    .line 188
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Converting InboxMessage : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " to HelpshiftInboxMessage : "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "Helpshift_XamCampaigns"

    invoke-static {v1, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    iget-object p1, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$1;->val$xamarinInboxMessageDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;

    invoke-interface {p1, v0}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;->inboxMessageAdded(Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;)V

    return-void
.end method

.method public inboxMessageDeleted(Ljava/lang/String;)V
    .locals 1

    .line 204
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$1;->val$xamarinInboxMessageDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;->inboxMessageDeleted(Ljava/lang/String;)V

    return-void
.end method

.method public inboxMessageMarkedAsRead(Ljava/lang/String;)V
    .locals 1

    .line 214
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$1;->val$xamarinInboxMessageDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;->inboxMessageMarkedAsRead(Ljava/lang/String;)V

    return-void
.end method

.method public inboxMessageMarkedAsSeen(Ljava/lang/String;)V
    .locals 1

    .line 209
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$1;->val$xamarinInboxMessageDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;->inboxMessageMarkedAsSeen(Ljava/lang/String;)V

    return-void
.end method
