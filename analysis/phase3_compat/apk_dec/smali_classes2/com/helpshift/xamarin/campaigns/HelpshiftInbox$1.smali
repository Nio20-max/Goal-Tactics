.class final Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$1;
.super Ljava/lang/Object;
.source "HelpshiftInbox.java"

# interfaces
.implements Lcom/helpshift/campaigns/delegates/InboxPushNotificationDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/xamarin/campaigns/HelpshiftInbox;->setInboxNotificationDelegate(Lcom/helpshift/xamarin/campaigns/HelpshiftInboxNotificationDelegate;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$inboxNotificationDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxNotificationDelegate;


# direct methods
.method constructor <init>(Lcom/helpshift/xamarin/campaigns/HelpshiftInboxNotificationDelegate;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$1;->val$inboxNotificationDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxNotificationDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInboxMessagePushNotificationClicked(Ljava/lang/String;)V
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$1;->val$inboxNotificationDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxNotificationDelegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxNotificationDelegate;->onInboxMessagePushNotificationClicked(Ljava/lang/String;)V

    return-void
.end method
