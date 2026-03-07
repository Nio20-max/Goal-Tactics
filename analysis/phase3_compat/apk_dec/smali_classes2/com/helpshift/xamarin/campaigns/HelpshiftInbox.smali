.class public Lcom/helpshift/xamarin/campaigns/HelpshiftInbox;
.super Ljava/lang/Object;
.source "HelpshiftInbox.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_XamInbox"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/campaigns/models/InboxMessage;)Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;
    .locals 0

    .line 21
    invoke-static {p0}, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox;->convertToXamarinInboxMessage(Lcom/helpshift/campaigns/models/InboxMessage;)Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;

    move-result-object p0

    return-object p0
.end method

.method public static cleanUp()V
    .locals 1

    .line 25
    invoke-static {}, Lcom/helpshift/campaigns/Inbox;->getInstance()Lcom/helpshift/campaigns/Inbox;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/campaigns/Inbox;->deallocate()V

    return-void
.end method

.method private static convertToXamarinInboxMessage(Lcom/helpshift/campaigns/models/InboxMessage;)Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;
    .locals 1

    .line 115
    new-instance v0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;

    invoke-direct {v0, p0}, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;-><init>(Lcom/helpshift/campaigns/models/InboxMessage;)V

    return-object v0
.end method

.method public static deleteInboxMessage(Ljava/lang/String;)V
    .locals 1

    .line 60
    invoke-static {}, Lcom/helpshift/campaigns/Inbox;->getInstance()Lcom/helpshift/campaigns/Inbox;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/helpshift/campaigns/Inbox;->deleteInboxMessage(Ljava/lang/String;)V

    return-void
.end method

.method public static getAllInboxMessages()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;",
            ">;"
        }
    .end annotation

    .line 29
    invoke-static {}, Lcom/helpshift/campaigns/Inbox;->getInstance()Lcom/helpshift/campaigns/Inbox;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/campaigns/Inbox;->getAllInboxMessages()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 31
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 35
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 36
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/models/InboxMessage;

    .line 37
    invoke-static {v2}, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox;->convertToXamarinInboxMessage(Lcom/helpshift/campaigns/models/InboxMessage;)Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;

    move-result-object v2

    .line 38
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const-string v0, "Helpshift_XamInbox"

    const-string v2, "getAllInboxMessages : converted InboxMessage(s) to HelpshiftInboxMessage(s)"

    .line 40
    invoke-static {v0, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_2
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getInboxMessageForId(Ljava/lang/String;)Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;
    .locals 2

    .line 45
    invoke-static {}, Lcom/helpshift/campaigns/Inbox;->getInstance()Lcom/helpshift/campaigns/Inbox;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/helpshift/campaigns/Inbox;->getInboxMessage(Ljava/lang/String;)Lcom/helpshift/campaigns/models/InboxMessage;

    move-result-object p0

    .line 46
    invoke-static {p0}, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox;->convertToXamarinInboxMessage(Lcom/helpshift/campaigns/models/InboxMessage;)Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;

    move-result-object p0

    const-string v0, "Helpshift_XamInbox"

    const-string v1, "getInboxMessageForId : converted InboxMessage to HelpshiftInboxMessage"

    .line 47
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public static markInboxMessageAsRead(Ljava/lang/String;)V
    .locals 1

    .line 52
    invoke-static {}, Lcom/helpshift/campaigns/Inbox;->getInstance()Lcom/helpshift/campaigns/Inbox;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/helpshift/campaigns/Inbox;->markInboxMessageAsRead(Ljava/lang/String;)V

    return-void
.end method

.method public static markInboxMessageAsSeen(Ljava/lang/String;)V
    .locals 1

    .line 56
    invoke-static {}, Lcom/helpshift/campaigns/Inbox;->getInstance()Lcom/helpshift/campaigns/Inbox;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/helpshift/campaigns/Inbox;->markInboxMessageAsSeen(Ljava/lang/String;)V

    return-void
.end method

.method public static setInboxMessageDelegate(Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;)V
    .locals 3

    .line 76
    new-instance v0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$2;

    invoke-direct {v0, p0}, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$2;-><init>(Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;)V

    .line 109
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInboxMessageDelegate : register InboxMessageDelegate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " for delegating calls to HelpshiftInboxMessageDelegate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "Helpshift_XamInbox"

    invoke-static {v1, p0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    invoke-static {}, Lcom/helpshift/campaigns/Inbox;->getInstance()Lcom/helpshift/campaigns/Inbox;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/helpshift/campaigns/Inbox;->setInboxMessageDelegate(Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;)V

    return-void
.end method

.method public static setInboxNotificationDelegate(Lcom/helpshift/xamarin/campaigns/HelpshiftInboxNotificationDelegate;)V
    .locals 3

    .line 64
    new-instance v0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$1;

    invoke-direct {v0, p0}, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$1;-><init>(Lcom/helpshift/xamarin/campaigns/HelpshiftInboxNotificationDelegate;)V

    .line 70
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInboxNotificationDelegate : register InboxPushNotificationDelegate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " for delegating calls to HelpshiftInboxNotificationDelegate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "Helpshift_XamInbox"

    invoke-static {v1, p0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    invoke-static {}, Lcom/helpshift/campaigns/Inbox;->getInstance()Lcom/helpshift/campaigns/Inbox;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/helpshift/campaigns/Inbox;->setInboxPushNotificationDelegate(Lcom/helpshift/campaigns/delegates/InboxPushNotificationDelegate;)V

    return-void
.end method
