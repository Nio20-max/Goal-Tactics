.class final Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$2;
.super Ljava/lang/Object;
.source "HelpshiftInbox.java"

# interfaces
.implements Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/xamarin/campaigns/HelpshiftInbox;->setInboxMessageDelegate(Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;)V
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

    .line 76
    iput-object p1, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$2;->val$xamarinInboxMessageDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public coverImageDownloaded(Ljava/lang/String;)V
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$2;->val$xamarinInboxMessageDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;->coverImageDownloaded(Ljava/lang/String;)V

    return-void
.end method

.method public iconImageDownloaded(Ljava/lang/String;)V
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$2;->val$xamarinInboxMessageDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;->iconImageDownloaded(Ljava/lang/String;)V

    return-void
.end method

.method public inboxMessageAdded(Lcom/helpshift/campaigns/models/InboxMessage;)V
    .locals 1

    .line 80
    invoke-static {p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox;->access$000(Lcom/helpshift/campaigns/models/InboxMessage;)Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;

    move-result-object p1

    .line 81
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$2;->val$xamarinInboxMessageDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;->inboxMessageAdded(Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;)V

    return-void
.end method

.method public inboxMessageDeleted(Ljava/lang/String;)V
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$2;->val$xamarinInboxMessageDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;->inboxMessageDeleted(Ljava/lang/String;)V

    return-void
.end method

.method public inboxMessageMarkedAsRead(Ljava/lang/String;)V
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$2;->val$xamarinInboxMessageDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;->inboxMessageMarkedAsRead(Ljava/lang/String;)V

    return-void
.end method

.method public inboxMessageMarkedAsSeen(Ljava/lang/String;)V
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$2;->val$xamarinInboxMessageDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;->inboxMessageMarkedAsSeen(Ljava/lang/String;)V

    return-void
.end method
