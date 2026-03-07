.class public Lcom/helpshift/campaigns/Inbox;
.super Ljava/lang/Object;
.source "Inbox.java"

# interfaces
.implements Lcom/helpshift/campaigns/observers/CampaignStorageObserver;


# static fields
.field private static instance:Lcom/helpshift/campaigns/Inbox;


# instance fields
.field private campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

.field private inboxPushNotificationDelegate:Lcom/helpshift/campaigns/delegates/InboxPushNotificationDelegate;

.field private messageDelegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

.field private messages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/InboxMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    iput-object v0, p0, Lcom/helpshift/campaigns/Inbox;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    .line 32
    invoke-direct {p0}, Lcom/helpshift/campaigns/Inbox;->getAllActiveCampaigns()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messages:Ljava/util/List;

    .line 33
    iget-object v0, p0, Lcom/helpshift/campaigns/Inbox;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v0, p0}, Lcom/helpshift/campaigns/storage/CampaignStorage;->addObserver(Lcom/helpshift/campaigns/observers/CampaignStorageObserver;)V

    .line 34
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iput-object p0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->inboxApi:Lcom/helpshift/campaigns/Inbox;

    return-void
.end method

.method private static destroy()V
    .locals 1

    const/4 v0, 0x0

    .line 312
    sput-object v0, Lcom/helpshift/campaigns/Inbox;->instance:Lcom/helpshift/campaigns/Inbox;

    return-void
.end method

.method private getAllActiveCampaigns()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/InboxMessage;",
            ">;"
        }
    .end annotation

    .line 56
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/campaigns/Inbox;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    .line 58
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    .line 55
    invoke-static {v0, v1, v2}, Lcom/helpshift/campaigns/util/InAppCampaignsUtil;->cleanAndGetActiveCampaigns(Landroid/content/Context;Lcom/helpshift/campaigns/storage/CampaignStorage;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 59
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v1
.end method

.method public static declared-synchronized getInstance()Lcom/helpshift/campaigns/Inbox;
    .locals 2

    const-class v0, Lcom/helpshift/campaigns/Inbox;

    monitor-enter v0

    .line 46
    :try_start_0
    sget-object v1, Lcom/helpshift/campaigns/Inbox;->instance:Lcom/helpshift/campaigns/Inbox;

    if-nez v1, :cond_0

    .line 47
    new-instance v1, Lcom/helpshift/campaigns/Inbox;

    invoke-direct {v1}, Lcom/helpshift/campaigns/Inbox;-><init>()V

    sput-object v1, Lcom/helpshift/campaigns/Inbox;->instance:Lcom/helpshift/campaigns/Inbox;

    .line 50
    :cond_0
    sget-object v1, Lcom/helpshift/campaigns/Inbox;->instance:Lcom/helpshift/campaigns/Inbox;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public campaignCoverImageFilePathUpdated(Ljava/lang/String;)V
    .locals 1

    .line 255
    invoke-direct {p0}, Lcom/helpshift/campaigns/Inbox;->getAllActiveCampaigns()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messages:Ljava/util/List;

    .line 257
    iget-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messageDelegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    if-eqz v0, :cond_0

    .line 258
    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;->coverImageDownloaded(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public campaignDeleted(Ljava/lang/String;)V
    .locals 1

    .line 267
    invoke-direct {p0}, Lcom/helpshift/campaigns/Inbox;->getAllActiveCampaigns()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messages:Ljava/util/List;

    .line 269
    iget-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messageDelegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    if-eqz v0, :cond_0

    .line 270
    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;->inboxMessageDeleted(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public campaignDetailModelAdded(Lcom/helpshift/campaigns/models/CampaignDetailModel;)V
    .locals 1

    .line 232
    invoke-direct {p0}, Lcom/helpshift/campaigns/Inbox;->getAllActiveCampaigns()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messages:Ljava/util/List;

    .line 233
    iget-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messageDelegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    if-eqz v0, :cond_0

    .line 234
    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;->inboxMessageAdded(Lcom/helpshift/campaigns/models/InboxMessage;)V

    :cond_0
    return-void
.end method

.method public campaignIconImageFilePathUpdated(Ljava/lang/String;)V
    .locals 1

    .line 243
    invoke-direct {p0}, Lcom/helpshift/campaigns/Inbox;->getAllActiveCampaigns()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messages:Ljava/util/List;

    .line 245
    iget-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messageDelegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    if-eqz v0, :cond_0

    .line 246
    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;->iconImageDownloaded(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public campaignRead(Ljava/lang/String;)V
    .locals 1

    .line 279
    invoke-direct {p0}, Lcom/helpshift/campaigns/Inbox;->getAllActiveCampaigns()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messages:Ljava/util/List;

    .line 281
    iget-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messageDelegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    if-eqz v0, :cond_0

    .line 282
    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;->inboxMessageMarkedAsRead(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public campaignSeen(Ljava/lang/String;)V
    .locals 1

    .line 291
    invoke-direct {p0}, Lcom/helpshift/campaigns/Inbox;->getAllActiveCampaigns()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messages:Ljava/util/List;

    .line 293
    iget-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messageDelegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    if-eqz v0, :cond_0

    .line 294
    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;->inboxMessageMarkedAsSeen(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public deallocate()V
    .locals 2

    .line 306
    iget-object v0, p0, Lcom/helpshift/campaigns/Inbox;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v0, p0}, Lcom/helpshift/campaigns/storage/CampaignStorage;->removeObserver(Lcom/helpshift/campaigns/observers/CampaignStorageObserver;)V

    .line 307
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->inboxApi:Lcom/helpshift/campaigns/Inbox;

    .line 308
    invoke-static {}, Lcom/helpshift/campaigns/Inbox;->destroy()V

    return-void
.end method

.method public deleteInboxMessage(Ljava/lang/String;)V
    .locals 4

    .line 164
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messages:Ljava/util/List;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 169
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/models/InboxMessage;

    .line 170
    move-object v3, v2

    check-cast v3, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    .line 171
    invoke-virtual {v3}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v1, v2

    :cond_2
    if-eqz v1, :cond_3

    .line 178
    iget-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messages:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 179
    iget-object v0, p0, Lcom/helpshift/campaigns/Inbox;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/storage/CampaignStorage;->deleteCampaign(Ljava/lang/String;)V

    .line 180
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->analyticsEventController:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    sget-object v1, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->MARK_AS_DELETE:Ljava/lang/Integer;

    const/4 v2, 0x0

    .line 183
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 181
    invoke-virtual {v0, v1, p1, v2}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->recordAnalyticsEvent(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public getAllInboxMessages()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/InboxMessage;",
            ">;"
        }
    .end annotation

    .line 71
    invoke-direct {p0}, Lcom/helpshift/campaigns/Inbox;->getAllActiveCampaigns()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messages:Ljava/util/List;

    return-object v0
.end method

.method public getInboxMessage(Ljava/lang/String;)Lcom/helpshift/campaigns/models/InboxMessage;
    .locals 5

    .line 85
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messages:Ljava/util/List;

    if-nez v0, :cond_0

    goto :goto_0

    .line 90
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/models/InboxMessage;

    .line 91
    move-object v3, v2

    check-cast v3, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    .line 92
    invoke-virtual {v3}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 93
    invoke-virtual {v3}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->isExpired()Z

    move-result v3

    if-nez v3, :cond_1

    move-object v1, v2

    :cond_2
    :goto_0
    return-object v1
.end method

.method public getInboxPushNotificationDelegate()Lcom/helpshift/campaigns/delegates/InboxPushNotificationDelegate;
    .locals 1

    .line 207
    iget-object v0, p0, Lcom/helpshift/campaigns/Inbox;->inboxPushNotificationDelegate:Lcom/helpshift/campaigns/delegates/InboxPushNotificationDelegate;

    return-object v0
.end method

.method public markInboxMessageAsRead(Ljava/lang/String;)V
    .locals 4

    .line 111
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messages:Ljava/util/List;

    if-nez v0, :cond_0

    goto :goto_1

    .line 115
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/models/InboxMessage;

    .line 116
    check-cast v1, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    .line 117
    invoke-virtual {v1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    .line 118
    invoke-virtual {v1, v2}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->setReadStatus(Z)V

    .line 119
    iget-object v1, p0, Lcom/helpshift/campaigns/Inbox;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v1, p1}, Lcom/helpshift/campaigns/storage/CampaignStorage;->markCampaignAsRead(Ljava/lang/String;)V

    .line 120
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/controllers/ControllerFactory;->analyticsEventController:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    sget-object v2, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->MARK_AS_READ:Ljava/lang/Integer;

    const/4 v3, 0x0

    .line 123
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 121
    invoke-virtual {v1, v2, p1, v3}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->recordAnalyticsEvent(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;)V

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public markInboxMessageAsSeen(Ljava/lang/String;)V
    .locals 4

    .line 137
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/helpshift/campaigns/Inbox;->messages:Ljava/util/List;

    if-nez v0, :cond_0

    goto :goto_1

    .line 141
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/models/InboxMessage;

    .line 142
    check-cast v1, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    .line 143
    invoke-virtual {v1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 144
    invoke-virtual {v1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->isExpired()Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x1

    .line 145
    invoke-virtual {v1, v2}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->setSeenStatus(Z)V

    .line 146
    iget-object v1, p0, Lcom/helpshift/campaigns/Inbox;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    invoke-interface {v1, p1}, Lcom/helpshift/campaigns/storage/CampaignStorage;->markCampaignAsSeen(Ljava/lang/String;)V

    .line 147
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/controllers/ControllerFactory;->analyticsEventController:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    sget-object v2, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->VIEW:Ljava/lang/Integer;

    const/4 v3, 0x0

    .line 150
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 148
    invoke-virtual {v1, v2, p1, v3}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->recordAnalyticsEvent(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;)V

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public setInboxMessageDelegate(Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 199
    iput-object p1, p0, Lcom/helpshift/campaigns/Inbox;->messageDelegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    :cond_0
    return-void
.end method

.method public setInboxPushNotificationDelegate(Lcom/helpshift/campaigns/delegates/InboxPushNotificationDelegate;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 223
    iput-object p1, p0, Lcom/helpshift/campaigns/Inbox;->inboxPushNotificationDelegate:Lcom/helpshift/campaigns/delegates/InboxPushNotificationDelegate;

    :cond_0
    return-void
.end method
