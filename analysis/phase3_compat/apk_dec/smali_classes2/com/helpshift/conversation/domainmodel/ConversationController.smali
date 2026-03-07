.class public Lcom/helpshift/conversation/domainmodel/ConversationController;
.super Ljava/lang/Object;
.source "ConversationController.java"

# interfaces
.implements Lcom/helpshift/common/AutoRetriableDM;
.implements Lcom/helpshift/account/domainmodel/IUserSyncExecutor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/conversation/domainmodel/ConversationController$CreateConversationStateHolder;,
        Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;,
        Lcom/helpshift/conversation/domainmodel/ConversationController$PollerSyncDataProviderImpl;
    }
.end annotation


# static fields
.field private static final ACTIVE_ISSUE_NOTIFICATION_COUNT_TIMEOUT:J = 0xea60L

.field public static final CREATE_ISSUE_ROUTE:Ljava/lang/String; = "/issues/"

.field public static final CREATE_ISSUE_UNIQUE_MAPPING_KEY:Ljava/lang/String; = "issue_default_unique_key"

.field public static final CREATE_PRE_ISSUE_ROUTE:Ljava/lang/String; = "/preissues/"

.field public static final CREATE_PRE_ISSUE_UNIQUE_MAPPING_KEY:Ljava/lang/String; = "preissue_default_unique_key"

.field private static final INACTIVE_ISSUES_NOTIFICATION_COUNT_TIMEOUT:J = 0x493e0L

.field private static final LAST_NOTIFCOUNT_FETCH_KEY:Ljava/lang/String; = "lastNotifCountFetchTime"

.field private static final MAX_POLL_SYNC_EXCEPTION_COUNT:I = 0xa

.field public static final MESSAGES_PAGE_SIZE:J = 0x64L

.field private static final TAG:Ljava/lang/String; = "Helpshift_ConvInboxDM"

.field static final fetchConversationUpdatesLock:Ljava/lang/Object;


# instance fields
.field private aliveViewableConversation:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/helpshift/conversation/activeconversation/ViewableConversation;",
            ">;"
        }
    .end annotation
.end field

.field final conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

.field private final conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

.field private final conversationInboxPoller:Lcom/helpshift/conversation/ConversationInboxPoller;

.field public final conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

.field private conversationViewState:I

.field final domain:Lcom/helpshift/common/domain/Domain;

.field private final faqSearchDM:Lcom/helpshift/faq/domainmodel/FAQSearchDM;

.field public fetchConversationUpdatesListenerReference:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcom/helpshift/util/FetchDataFromThread<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private inAppNotificationMessageCountMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field inProgressPreIssueCreators:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Long;",
            "Lcom/helpshift/common/domain/One;",
            ">;"
        }
    .end annotation
.end field

.field private isCreateConversationInProgress:Z

.field private final kvStore:Lcom/helpshift/common/platform/KVStore;

.field private final liveUpdateDM:Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;

.field final platform:Lcom/helpshift/common/platform/Platform;

.field private pollSyncExceptionCount:I

.field private pollerSyncManager:Lcom/helpshift/conversation/pollersync/PollerSyncManager;

.field private remoteConversationLoader:Lcom/helpshift/conversation/loaders/RemoteConversationLoader;

.field private final sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

.field private shouldDropCustomMetadata:Z

.field private startNewConversationListenerRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;",
            ">;"
        }
    .end annotation
.end field

.field private userCanReadMessages:Z

.field final userDM:Lcom/helpshift/account/domainmodel/UserDM;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 118
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/helpshift/conversation/domainmodel/ConversationController;->fetchConversationUpdatesLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 8

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 135
    iput-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->fetchConversationUpdatesListenerReference:Ljava/util/concurrent/atomic/AtomicReference;

    .line 139
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->inProgressPreIssueCreators:Ljava/util/HashMap;

    const/4 v1, -0x1

    .line 144
    iput v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationViewState:I

    .line 148
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->inAppNotificationMessageCountMap:Ljava/util/Map;

    .line 153
    iput-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    .line 154
    iput-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    .line 155
    iput-object p3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    .line 156
    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getConversationInboxDAO()Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    .line 157
    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    .line 158
    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getKVStore()Lcom/helpshift/common/platform/KVStore;

    move-result-object v2

    iput-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->kvStore:Lcom/helpshift/common/platform/KVStore;

    .line 159
    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getFAQSearchDM()Lcom/helpshift/faq/domainmodel/FAQSearchDM;

    move-result-object v2

    iput-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->faqSearchDM:Lcom/helpshift/faq/domainmodel/FAQSearchDM;

    .line 160
    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v2

    iput-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    .line 161
    new-instance v3, Lcom/helpshift/conversation/ConversationInboxPoller;

    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getPoller()Lcom/helpshift/common/domain/Poller;

    move-result-object v4

    invoke-direct {v3, p3, v2, v4, v1}, Lcom/helpshift/conversation/ConversationInboxPoller;-><init>(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;Lcom/helpshift/common/domain/Poller;Lcom/helpshift/conversation/dao/ConversationDAO;)V

    iput-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxPoller:Lcom/helpshift/conversation/ConversationInboxPoller;

    .line 162
    new-instance v1, Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;

    invoke-direct {v1, p2, p1}, Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    iput-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->liveUpdateDM:Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;

    .line 163
    new-instance v7, Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-direct {v7, p1, p2, p3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/account/domainmodel/UserDM;)V

    iput-object v7, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    .line 164
    new-instance v1, Lcom/helpshift/conversation/loaders/RemoteConversationLoader;

    invoke-direct {v1, p1, p2, p3, v7}, Lcom/helpshift/conversation/loaders/RemoteConversationLoader;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationManager;)V

    iput-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->remoteConversationLoader:Lcom/helpshift/conversation/loaders/RemoteConversationLoader;

    .line 165
    new-instance v6, Lcom/helpshift/conversation/domainmodel/ConversationController$PollerSyncDataProviderImpl;

    invoke-direct {v6, p0, v0}, Lcom/helpshift/conversation/domainmodel/ConversationController$PollerSyncDataProviderImpl;-><init>(Lcom/helpshift/conversation/domainmodel/ConversationController;Lcom/helpshift/conversation/domainmodel/ConversationController$1;)V

    .line 166
    new-instance v0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;

    move-object v2, v0

    move-object v3, p2

    move-object v4, p1

    move-object v5, p3

    invoke-direct/range {v2 .. v7}, Lcom/helpshift/conversation/pollersync/PollerSyncManager;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;Lcom/helpshift/conversation/activeconversation/ConversationManager;)V

    iput-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->pollerSyncManager:Lcom/helpshift/conversation/pollersync/PollerSyncManager;

    return-void
.end method

.method static synthetic access$100(Lcom/helpshift/conversation/domainmodel/ConversationController;)I
    .locals 0

    .line 97
    iget p0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationViewState:I

    return p0
.end method

.method static synthetic access$200(Lcom/helpshift/conversation/domainmodel/ConversationController;)Lcom/helpshift/conversation/activeconversation/ViewableConversation;
    .locals 0

    .line 97
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/helpshift/conversation/domainmodel/ConversationController;Ljava/lang/Long;)Lcom/helpshift/conversation/activeconversation/ViewableConversation;
    .locals 0

    .line 97
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getAliveViewableConversation(Ljava/lang/Long;)Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object p0

    return-object p0
.end method

.method private buildForwardPollerNetwork()Lcom/helpshift/common/domain/network/Network;
    .locals 4

    .line 774
    new-instance v0, Lcom/helpshift/common/domain/network/POSTNetwork;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    const-string v3, "/conversations/updates/"

    invoke-direct {v0, v3, v1, v2}, Lcom/helpshift/common/domain/network/POSTNetwork;-><init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 775
    new-instance v1, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;

    invoke-direct {v1, v0}, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 776
    new-instance v0, Lcom/helpshift/common/domain/network/FailedAPICallNetworkDecorator;

    invoke-direct {v0, v1}, Lcom/helpshift/common/domain/network/FailedAPICallNetworkDecorator;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 777
    new-instance v1, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;

    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v1, v0, v2}, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 778
    new-instance v0, Lcom/helpshift/common/domain/network/GuardOKNetwork;

    invoke-direct {v0, v1}, Lcom/helpshift/common/domain/network/GuardOKNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    return-object v0
.end method

.method private buildForwardPollerRequestData(Ljava/lang/String;)Lcom/helpshift/common/platform/network/RequestData;
    .locals 2

    .line 783
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {v0}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->getUserRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Ljava/util/HashMap;

    move-result-object v0

    .line 785
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "cursor"

    .line 786
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 789
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getLastViewableSyncedConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 792
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 793
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    const-string v1, "issue_id"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 795
    :cond_1
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 796
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    const-string v1, "preissue_id"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 799
    :cond_2
    :goto_0
    iget-boolean p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userCanReadMessages:Z

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    const-string v1, "ucrm"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 800
    new-instance p1, Lcom/helpshift/common/platform/network/RequestData;

    invoke-direct {p1, v0}, Lcom/helpshift/common/platform/network/RequestData;-><init>(Ljava/util/Map;)V

    return-object p1
.end method

.method private canShowNotificationForConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z
    .locals 6

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 1007
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    .line 1008
    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iget-wide v3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    cmp-long v5, v1, v3

    if-nez v5, :cond_3

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    .line 1009
    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 1013
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1014
    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->isVisibleOnUI()Z

    move-result v2

    if-eqz v2, :cond_1

    return v0

    :cond_1
    const/4 v0, 0x1

    if-nez v1, :cond_2

    .line 1024
    invoke-virtual {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getActiveConversationFromStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v1

    goto :goto_0

    .line 1027
    :cond_2
    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v1

    :goto_0
    if-eqz v1, :cond_3

    .line 1033
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    iget-object v0, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :cond_3
    :goto_1
    return v0
.end method

.method private checkAndGenerateNotification()V
    .locals 3

    .line 935
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getActiveConversationFromUIOrStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 936
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->shouldShowInAppNotification(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 937
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    .line 938
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getMessageCountForShowingInAppNotification(Lcom/helpshift/conversation/activeconversation/model/Conversation;)I

    move-result v1

    .line 939
    invoke-direct {p0, v0, v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->showInAppNotification(Lcom/helpshift/conversation/activeconversation/model/Conversation;I)V

    :cond_0
    return-void
.end method

.method private checkAndTryToUploadImage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V
    .locals 2

    if-eqz p2, :cond_0

    .line 423
    iget-object v0, p2, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->filePath:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 425
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, p1, p2, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendAttachment(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/AttachmentPickerFile;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 432
    :catch_0
    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->saveImageAttachmentDraft(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    :cond_0
    return-void
.end method

.method private clearInAppNotificationCountCache()V
    .locals 1

    .line 970
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->inAppNotificationMessageCountMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method private createPreIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;",
            ")V"
        }
    .end annotation

    .line 527
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->inProgressPreIssueCreators:Ljava/util/HashMap;

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/common/domain/One;

    if-eqz v0, :cond_0

    .line 531
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Pre issue creation already in progress: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Helpshift_ConvInboxDM"

    invoke-static {p2, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 532
    invoke-virtual {v0}, Lcom/helpshift/common/domain/One;->getF()Lcom/helpshift/common/domain/F;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/CreatePreIssueDM;

    .line 533
    invoke-virtual {p1, p5}, Lcom/helpshift/conversation/CreatePreIssueDM;->setListener(Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;)V

    return-void

    .line 538
    :cond_0
    new-instance v8, Lcom/helpshift/conversation/CreatePreIssueDM;

    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    move-object v0, v8

    move-object v1, p0

    move-object v3, p1

    move-object v4, p5

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/helpshift/conversation/CreatePreIssueDM;-><init>(Lcom/helpshift/conversation/domainmodel/ConversationController;Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 545
    new-instance p2, Lcom/helpshift/common/domain/One;

    invoke-direct {p2, v8}, Lcom/helpshift/common/domain/One;-><init>(Lcom/helpshift/common/domain/F;)V

    .line 546
    iget-object p3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->inProgressPreIssueCreators:Ljava/util/HashMap;

    iget-object p4, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {p3, p4, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 548
    iget-object p3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance p4, Lcom/helpshift/conversation/domainmodel/ConversationController$2;

    invoke-direct {p4, p0, p2, p1}, Lcom/helpshift/conversation/domainmodel/ConversationController$2;-><init>(Lcom/helpshift/conversation/domainmodel/ConversationController;Lcom/helpshift/common/domain/One;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    invoke-virtual {p3, p4}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method private deleteConversationsAndMessages()V
    .locals 6

    .line 198
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 200
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {v2, v0, v1}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationsWithoutMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v2

    .line 201
    invoke-virtual {v2}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 202
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 203
    iget-object v4, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v4}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iput-wide v4, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    .line 204
    iget-object v4, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v4, v3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->deleteCachedAttachmentFiles(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    goto :goto_0

    .line 207
    :cond_0
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {v2, v0, v1}, Lcom/helpshift/conversation/dao/ConversationDAO;->deleteConversations(J)V

    return-void
.end method

.method private fetchConversationHistory()V
    .locals 2

    .line 1648
    sget-object v0, Lcom/helpshift/conversation/domainmodel/ConversationController;->fetchConversationUpdatesLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1649
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->remoteConversationLoader:Lcom/helpshift/conversation/loaders/RemoteConversationLoader;

    invoke-virtual {v1}, Lcom/helpshift/conversation/loaders/RemoteConversationLoader;->loadMoreMessages()Z

    .line 1650
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private fetchConversationUpdatesInternal(Ljava/lang/String;Z)Lcom/helpshift/conversation/dto/ConversationInbox;
    .locals 4

    .line 806
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->buildForwardPollerNetwork()Lcom/helpshift/common/domain/network/Network;

    move-result-object v0

    .line 807
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->buildForwardPollerRequestData(Ljava/lang/String;)Lcom/helpshift/common/platform/network/RequestData;

    move-result-object p1

    .line 809
    :try_start_0
    invoke-interface {v0, p1}, Lcom/helpshift/common/domain/network/Network;->makeRequest(Lcom/helpshift/common/platform/network/RequestData;)Lcom/helpshift/common/platform/network/Response;

    move-result-object v0

    .line 810
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v1}, Lcom/helpshift/common/platform/Platform;->getResponseParser()Lcom/helpshift/common/platform/network/ResponseParser;

    move-result-object v1

    .line 811
    iget-object v0, v0, Lcom/helpshift/common/platform/network/Response;->responseString:Ljava/lang/String;

    invoke-interface {v1, v0}, Lcom/helpshift/common/platform/network/ResponseParser;->parseConversationInbox(Ljava/lang/String;)Lcom/helpshift/conversation/dto/ConversationInbox;

    move-result-object v0
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_1

    .line 827
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v1}, Lcom/helpshift/common/domain/Domain;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object v1

    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-boolean v3, v0, Lcom/helpshift/conversation/dto/ConversationInbox;->issueExists:Z

    invoke-virtual {v1, v2, v3}, Lcom/helpshift/account/domainmodel/UserManagerDM;->updateIssueExists(Lcom/helpshift/account/domainmodel/UserDM;Z)V

    .line 830
    iget-object p1, p1, Lcom/helpshift/common/platform/network/RequestData;->body:Ljava/util/Map;

    const-string v1, "cursor"

    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, v0, Lcom/helpshift/conversation/dto/ConversationInbox;->hasOlderMessages:Ljava/lang/Boolean;

    if-eqz p1, :cond_0

    .line 832
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iget-object v3, v0, Lcom/helpshift/conversation/dto/ConversationInbox;->hasOlderMessages:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-interface {p1, v1, v2, v3}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->saveHasOlderMessages(JZ)V

    .line 837
    :cond_0
    :try_start_1
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->pollerSyncManager:Lcom/helpshift/conversation/pollersync/PollerSyncManager;

    iget-object v1, v0, Lcom/helpshift/conversation/dto/ConversationInbox;->conversations:Ljava/util/List;

    invoke-virtual {p1, v1, p2}, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->sync(Ljava/util/List;Z)V

    .line 839
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 841
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->dispatchPollSuccessCallback()V

    .line 845
    :cond_1
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->isPushTokenSynced()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v1, "enableInAppNotification"

    invoke-virtual {p1, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 846
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->checkAndGenerateNotification()V

    .line 848
    :cond_2
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->sendUnreadCountUpdate()V

    .line 852
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iget-object v3, v0, Lcom/helpshift/conversation/dto/ConversationInbox;->cursor:Ljava/lang/String;

    invoke-interface {p1, v1, v2, v3}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->saveConversationInboxTimestamp(JLjava/lang/String;)V

    const/4 p1, 0x0

    .line 853
    iput p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->pollSyncExceptionCount:I
    :try_end_1
    .catch Lcom/helpshift/conversation/pollersync/exception/PollerSyncException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 856
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Caught poller sync exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", Not updating cursor."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Helpshift_ConvInboxDM"

    invoke-static {v2, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 857
    iget v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->pollSyncExceptionCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->pollSyncExceptionCount:I

    if-nez p2, :cond_4

    const/16 p2, 0xa

    if-lt v1, p2, :cond_4

    const-string p2, "Max poller sync exception limit reached, stopping poller"

    .line 862
    invoke-static {v2, p2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 863
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object p2

    if-eqz p2, :cond_3

    .line 865
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->dispatchPollFailureCallback()V

    .line 869
    :cond_3
    sget-object p2, Lcom/helpshift/common/exception/PollerException;->SYNC_FAILURE_MAX_LIMIT_REACHED:Lcom/helpshift/common/exception/PollerException;

    invoke-static {p1, p2}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1

    :cond_4
    :goto_0
    return-object v0

    :catch_1
    move-exception p1

    .line 814
    iget-object p2, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v0, Lcom/helpshift/common/exception/NetworkException;->INVALID_AUTH_TOKEN:Lcom/helpshift/common/exception/NetworkException;

    if-eq p2, v0, :cond_5

    iget-object p2, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v0, Lcom/helpshift/common/exception/NetworkException;->AUTH_TOKEN_NOT_PROVIDED:Lcom/helpshift/common/exception/NetworkException;

    if-eq p2, v0, :cond_5

    .line 818
    iget-object p2, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    instance-of p2, p2, Lcom/helpshift/common/exception/NetworkException;

    if-eqz p2, :cond_6

    .line 819
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object p2

    if-eqz p2, :cond_6

    .line 820
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->isVisibleOnUI()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 821
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->dispatchPollFailureCallback()V

    goto :goto_1

    .line 816
    :cond_5
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object p2

    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v1, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    invoke-virtual {p2, v0, v1}, Lcom/helpshift/account/AuthenticationFailureDM;->notifyAuthenticationFailure(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/exception/ExceptionType;)V

    .line 824
    :cond_6
    :goto_1
    throw p1
.end method

.method private getActiveConversationFromUIOrStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 3

    .line 1471
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1473
    invoke-virtual {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getActiveConversationFromStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1477
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    return-object v0

    .line 1481
    :cond_1
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    return-object v0
.end method

.method private getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;
    .locals 1

    .line 927
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->aliveViewableConversation:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 931
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->aliveViewableConversation:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    return-object v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private getAliveViewableConversation(Ljava/lang/Long;)Lcom/helpshift/conversation/activeconversation/ViewableConversation;
    .locals 3

    .line 1119
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->aliveViewableConversation:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1123
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->aliveViewableConversation:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    .line 1124
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {p1, v2}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return-object v0

    :cond_1
    :goto_0
    return-object v1
.end method

.method private getCampaignDID()Ljava/lang/String;
    .locals 1

    .line 748
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getCampaignModuleAPIs()Lcom/helpshift/providers/ICampaignsModuleAPIs;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 753
    :cond_0
    invoke-interface {v0}, Lcom/helpshift/providers/ICampaignsModuleAPIs;->getDeviceIdentifier()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getCampaignUID()Ljava/lang/String;
    .locals 1

    .line 739
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getCampaignModuleAPIs()Lcom/helpshift/providers/ICampaignsModuleAPIs;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 744
    :cond_0
    invoke-interface {v0}, Lcom/helpshift/providers/ICampaignsModuleAPIs;->getUserIdentifier()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getInAppNotificationCountCache(Ljava/lang/String;)I
    .locals 1

    .line 958
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->inAppNotificationMessageCountMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-nez p1, :cond_0

    const/4 p1, -0x1

    return p1

    .line 962
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method private getLastViewableSyncedConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 2

    .line 1493
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1500
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 1501
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->isSynced(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1506
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getLastViewableSyncedConversationFromStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    goto :goto_0

    .line 1510
    :cond_1
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getLastViewableSyncedConversationFromStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private getLastViewableSyncedConversationFromStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 4

    .line 1528
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationsWithoutMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v0

    .line 1529
    invoke-virtual {v0}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1530
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 1535
    :cond_0
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-static {v1}, Lcom/helpshift/conversation/util/predicate/ConversationPredicates;->newSyncedConversationPredicate(Lcom/helpshift/conversation/activeconversation/ConversationManager;)Lcom/helpshift/util/Predicate;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/util/Filters;->filter(Ljava/util/List;Lcom/helpshift/util/Predicate;)Ljava/util/List;

    move-result-object v0

    .line 1536
    invoke-static {}, Lcom/helpshift/conversation/util/predicate/ConversationPredicates;->newInProgressConversationPredicate()Lcom/helpshift/util/Predicate;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/util/Filters;->filter(Ljava/util/List;Lcom/helpshift/util/Predicate;)Ljava/util/List;

    move-result-object v1

    .line 1538
    invoke-static {v0}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_1

    return-object v2

    .line 1541
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1542
    invoke-static {v0}, Lcom/helpshift/conversation/ConversationUtil;->getLastConversationBasedOnCreatedAt(Ljava/util/Collection;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    goto :goto_0

    .line 1545
    :cond_2
    invoke-static {v1}, Lcom/helpshift/conversation/ConversationUtil;->getLastConversationBasedOnCreatedAt(Ljava/util/Collection;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private getMessageCountForShowingInAppNotification(Lcom/helpshift/conversation/activeconversation/model/Conversation;)I
    .locals 2

    .line 1000
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getInAppNotificationCountCache(Ljava/lang/String;)I

    move-result v0

    .line 1001
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->getUnSeenMessageCount(Lcom/helpshift/conversation/activeconversation/model/Conversation;)I

    move-result p1

    const/4 v1, 0x0

    if-lez p1, :cond_0

    if-eq p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    return p1
.end method

.method private getPoller()Lcom/helpshift/common/domain/Poller;
    .locals 3

    .line 211
    new-instance v0, Lcom/helpshift/common/domain/Poller;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v2, Lcom/helpshift/conversation/domainmodel/ConversationController$1;

    invoke-direct {v2, p0}, Lcom/helpshift/conversation/domainmodel/ConversationController$1;-><init>(Lcom/helpshift/conversation/domainmodel/ConversationController;)V

    invoke-direct {v0, v1, v2}, Lcom/helpshift/common/domain/Poller;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/domain/F;)V

    return-object v0
.end method

.method private isAtLeastOneConversationNonActionable(Ljava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;)Z"
        }
    .end annotation

    .line 1694
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 1698
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 1699
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v2}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    .line 1700
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_2
    return v1
.end method

.method private isMessageBoxVisibleInConversationResolutionRejectedState(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/ViewableConversation;)Z
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 1273
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq p1, v1, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    .line 1280
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getConversationVMCallback()Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 1282
    invoke-interface {p1}, Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;->isMessageBoxVisible()Z

    move-result p1

    return p1

    .line 1287
    :cond_1
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {p2}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {p1, v1, v2}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->getPersistMessageBox(J)Z

    move-result p1

    .line 1288
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {p2, v1, v2}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->getUserReplyDraft(J)Ljava/lang/String;

    move-result-object p2

    if-nez p1, :cond_2

    .line 1289
    invoke-static {p2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_3

    :cond_2
    const/4 v0, 0x1

    :cond_3
    :goto_0
    return v0
.end method

.method private declared-synchronized removeInMemoryConversation()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    .line 384
    :try_start_0
    iput-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->aliveViewableConversation:Ljava/lang/ref/WeakReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 385
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private retryCallsForConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V
    .locals 2

    .line 239
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    .line 241
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->canAutoRetryMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 242
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->retryMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    .line 244
    :cond_0
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    sget-object v0, Lcom/helpshift/conversation/states/ConversationCSATState;->SUBMITTED_NOT_SYNCED:Lcom/helpshift/conversation/states/ConversationCSATState;

    if-ne p2, v0, :cond_2

    .line 246
    :try_start_0
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p2, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendCSATSurveyInternal(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 250
    iget-object p2, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v0, Lcom/helpshift/common/exception/NetworkException;->NON_RETRIABLE:Lcom/helpshift/common/exception/NetworkException;

    if-ne p2, v0, :cond_1

    goto :goto_0

    .line 251
    :cond_1
    throw p1

    :cond_2
    :goto_0
    return-void
.end method

.method private sendUnreadCountUpdate()V
    .locals 3

    .line 907
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->fetchConversationUpdatesListenerReference:Ljava/util/concurrent/atomic/AtomicReference;

    if-eqz v0, :cond_0

    .line 909
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/util/FetchDataFromThread;

    if-eqz v0, :cond_0

    .line 911
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v2, Lcom/helpshift/conversation/domainmodel/ConversationController$3;

    invoke-direct {v2, p0, v0}, Lcom/helpshift/conversation/domainmodel/ConversationController$3;-><init>(Lcom/helpshift/conversation/domainmodel/ConversationController;Lcom/helpshift/util/FetchDataFromThread;)V

    invoke-virtual {v1, v2}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    :cond_0
    return-void
.end method

.method private declared-synchronized setAliveConversation(Lcom/helpshift/conversation/activeconversation/ViewableConversation;)V
    .locals 1

    monitor-enter p0

    .line 380
    :try_start_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->aliveViewableConversation:Ljava/lang/ref/WeakReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 381
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private shouldShowInAppNotification(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z
    .locals 2

    .line 984
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v1, "enableInAppNotification"

    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 986
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->canShowNotificationForConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private showInAppNotification(Lcom/helpshift/conversation/activeconversation/model/Conversation;I)V
    .locals 6

    if-lez p2, :cond_0

    .line 945
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    .line 946
    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getDevice()Lcom/helpshift/common/platform/Device;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/common/platform/Device;->getAppName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    move-object v0, p0

    move v3, p2

    .line 945
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/conversation/domainmodel/ConversationController;->showNotificationOnUI(Ljava/lang/Long;Ljava/lang/String;ILjava/lang/String;Z)V

    .line 947
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/domainmodel/ConversationController;->updateInAppNotificationCountCache(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method private showNotificationOnUI(Ljava/lang/Long;Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 9

    if-lez p3, :cond_0

    .line 1044
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v8, Lcom/helpshift/conversation/domainmodel/ConversationController$4;

    move-object v1, v8

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    move v7, p5

    invoke-direct/range {v1 .. v7}, Lcom/helpshift/conversation/domainmodel/ConversationController$4;-><init>(Lcom/helpshift/conversation/domainmodel/ConversationController;Ljava/lang/Long;Ljava/lang/String;ILjava/lang/String;Z)V

    invoke-virtual {v0, v8}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    :cond_0
    return-void
.end method

.method private updateInAppNotificationCountCache(Ljava/lang/String;I)V
    .locals 1

    .line 966
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->inAppNotificationMessageCountMap:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public checkAndDropCustomMeta(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 0

    .line 417
    iget-boolean p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->shouldDropCustomMetadata:Z

    if-eqz p1, :cond_0

    .line 418
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->dropCustomMetaData()V

    :cond_0
    return-void
.end method

.method public clearNotification(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 1393
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/domainmodel/ConversationController$5;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/domainmodel/ConversationController$5;-><init>(Lcom/helpshift/conversation/domainmodel/ConversationController;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    .line 1399
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->clearInAppNotificationCountCache()V

    return-void
.end method

.method public clearPushNotifications()V
    .locals 3

    .line 1366
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    .line 1367
    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationsWithoutMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v0

    .line 1368
    invoke-virtual {v0}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1369
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 1370
    invoke-virtual {p0, v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->clearNotification(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public createConversation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 7

    .line 437
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0, v1}, Lcom/helpshift/account/domainmodel/UserManagerDM;->registerUserWithServer(Lcom/helpshift/account/domainmodel/UserDM;)V

    .line 439
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {v0}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->getUserRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Ljava/util/HashMap;

    move-result-object v0

    .line 440
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v1}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object v1

    invoke-static {p3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p3

    invoke-interface {v1, p3}, Lcom/helpshift/common/platform/Jsonifier;->jsonify(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object p3

    .line 441
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    const-string v1, "user_provided_emails"

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "user_provided_name"

    .line 442
    invoke-interface {v0, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "body"

    .line 443
    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 444
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getCampaignUID()Ljava/lang/String;

    move-result-object p1

    const-string p2, "cuid"

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 445
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getCampaignDID()Ljava/lang/String;

    move-result-object p1

    const-string p2, "cdid"

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getLocaleProviderDM()Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;->getDefaultLanguage()Ljava/lang/String;

    move-result-object p1

    const-string p2, "device_language"

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getLocaleProviderDM()Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;->getSDKLanguage()Ljava/lang/String;

    move-result-object p1

    .line 448
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_0

    const-string p2, "developer_set_language"

    .line 449
    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 451
    :cond_0
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getMetaDataDM()Lcom/helpshift/meta/MetaDataDM;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/meta/MetaDataDM;->getMetaInfo()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "meta"

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 452
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string p2, "fullPrivacy"

    invoke-virtual {p1, p2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    .line 455
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getCustomIssueFieldDM()Lcom/helpshift/cif/CustomIssueFieldDM;

    move-result-object p2

    invoke-virtual {p2}, Lcom/helpshift/cif/CustomIssueFieldDM;->getCustomIssueFieldData()Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 457
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    const-string p3, "custom_fields"

    invoke-interface {v0, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 461
    :cond_1
    new-instance v2, Lcom/helpshift/common/domain/network/POSTNetwork;

    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object p3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    const-string v1, "/issues/"

    invoke-direct {v2, v1, p2, p3}, Lcom/helpshift/common/domain/network/POSTNetwork;-><init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 462
    new-instance v4, Lcom/helpshift/common/domain/idempotent/SuccessOrNonRetriableStatusCodeIdempotentPolicy;

    invoke-direct {v4}, Lcom/helpshift/common/domain/idempotent/SuccessOrNonRetriableStatusCodeIdempotentPolicy;-><init>()V

    .line 463
    new-instance p2, Lcom/helpshift/common/domain/network/IdempotentNetwork;

    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    const-string v5, "/issues/"

    const-string v6, "issue_default_unique_key"

    move-object v1, p2

    invoke-direct/range {v1 .. v6}, Lcom/helpshift/common/domain/network/IdempotentNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/idempotent/IdempotentPolicy;Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    new-instance p3, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;

    invoke-direct {p3, p2}, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 468
    new-instance p2, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {p2, p3, v1}, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 469
    new-instance p3, Lcom/helpshift/common/domain/network/MetaCorrectedNetwork;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {p3, p2, v1}, Lcom/helpshift/common/domain/network/MetaCorrectedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 470
    new-instance p2, Lcom/helpshift/common/domain/network/GuardOKNetwork;

    invoke-direct {p2, p3}, Lcom/helpshift/common/domain/network/GuardOKNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 474
    :try_start_0
    new-instance p3, Lcom/helpshift/common/platform/network/RequestData;

    invoke-direct {p3, v0}, Lcom/helpshift/common/platform/network/RequestData;-><init>(Ljava/util/Map;)V

    .line 475
    invoke-interface {p2, p3}, Lcom/helpshift/common/domain/network/Network;->makeRequest(Lcom/helpshift/common/platform/network/RequestData;)Lcom/helpshift/common/platform/network/Response;

    move-result-object p2

    .line 476
    iget-object p3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    .line 477
    invoke-interface {p3}, Lcom/helpshift/common/platform/Platform;->getResponseParser()Lcom/helpshift/common/platform/network/ResponseParser;

    move-result-object p3

    iget-object p2, p2, Lcom/helpshift/common/platform/network/Response;->responseString:Ljava/lang/String;

    invoke-interface {p3, p2}, Lcom/helpshift/common/platform/network/ResponseParser;->parseReadableConversation(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p2

    .line 478
    iput-boolean p1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->wasFullPrivacyEnabledAtCreation:Z

    .line 479
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    .line 481
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object p3, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-interface {p1, p3}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationWithoutMessages(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p1

    if-nez p1, :cond_2

    .line 484
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {p1, p2}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 487
    :cond_2
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object p1

    iget-object p3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    const/4 v0, 0x1

    invoke-virtual {p1, p3, v0}, Lcom/helpshift/account/domainmodel/UserManagerDM;->updateIssueExists(Lcom/helpshift/account/domainmodel/UserDM;Z)V

    .line 489
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserManagerDM;->sendPushToken()V

    .line 490
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxPoller:Lcom/helpshift/conversation/ConversationInboxPoller;

    invoke-virtual {p1, v0}, Lcom/helpshift/conversation/ConversationInboxPoller;->startAppPoller(Z)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p2

    :catch_0
    move-exception p1

    .line 494
    iget-object p2, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object p3, Lcom/helpshift/common/exception/NetworkException;->INVALID_AUTH_TOKEN:Lcom/helpshift/common/exception/NetworkException;

    if-eq p2, p3, :cond_3

    iget-object p2, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object p3, Lcom/helpshift/common/exception/NetworkException;->AUTH_TOKEN_NOT_PROVIDED:Lcom/helpshift/common/exception/NetworkException;

    if-ne p2, p3, :cond_4

    .line 496
    :cond_3
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object p2

    iget-object p3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v0, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    invoke-virtual {p2, p3, v0}, Lcom/helpshift/account/AuthenticationFailureDM;->notifyAuthenticationFailure(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/exception/ExceptionType;)V

    .line 498
    :cond_4
    throw p1
.end method

.method public createLocalPreIssueConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 15

    .line 1212
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object v0

    .line 1213
    iget-object v1, v0, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    .line 1214
    iget-object v0, v0, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    .line 1215
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v12

    .line 1216
    new-instance v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    sget-object v4, Lcom/helpshift/conversation/dto/IssueState;->NEW:Lcom/helpshift/conversation/dto/IssueState;

    const-string v3, "Pre Issue Conversation"

    const/4 v9, 0x0

    const/4 v10, 0x0

    const-string v11, "preissue"

    move-object v2, v0

    move-object v5, v1

    move-wide v6, v13

    move-object v8, v1

    invoke-direct/range {v2 .. v12}, Lcom/helpshift/conversation/activeconversation/model/Conversation;-><init>(Ljava/lang/String;Lcom/helpshift/conversation/dto/IssueState;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1225
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v2}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    .line 1226
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->lastUserActivityTime:J

    .line 1227
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {v2, v0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertPreIssueConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 1229
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v3, "conversationGreetingMessage"

    invoke-virtual {v2, v3}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1230
    invoke-static {v4}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1231
    new-instance v8, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->SYSTEM:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v3, ""

    invoke-direct {v8, v3, v3, v2}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    .line 1232
    new-instance v9, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;

    const/4 v3, 0x0

    move-object v2, v9

    move-object v5, v1

    move-wide v6, v13

    invoke-direct/range {v2 .. v8}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V

    .line 1237
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object v1, v9, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->conversationLocalId:Ljava/lang/Long;

    const/4 v1, 0x1

    .line 1238
    iput v1, v9, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->deliveryState:I

    .line 1239
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v9, v1, v2}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 1241
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {v1, v9}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 1243
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v1, v9}, Lcom/helpshift/util/HSObservableList;->add(Ljava/lang/Object;)Z

    :cond_0
    return-object v0
.end method

.method public createPreIssueNetwork(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 581
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {v0}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->getUserRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Ljava/util/HashMap;

    move-result-object v0

    .line 582
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getName()Ljava/lang/String;

    move-result-object v1

    .line 583
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v2}, Lcom/helpshift/account/domainmodel/UserDM;->getEmail()Ljava/lang/String;

    move-result-object v2

    .line 584
    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "name"

    .line 585
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 588
    :cond_0
    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "email"

    .line 589
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 592
    :cond_1
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getCampaignUID()Ljava/lang/String;

    move-result-object v1

    const-string v2, "cuid"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 593
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getCampaignDID()Ljava/lang/String;

    move-result-object v1

    const-string v2, "cdid"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 594
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v1}, Lcom/helpshift/common/domain/Domain;->getLocaleProviderDM()Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;

    move-result-object v1

    invoke-virtual {v1}, Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;->getDefaultLanguage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "device_language"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 595
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v1}, Lcom/helpshift/common/domain/Domain;->getLocaleProviderDM()Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;

    move-result-object v1

    invoke-virtual {v1}, Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;->getSDKLanguage()Ljava/lang/String;

    move-result-object v1

    .line 596
    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "developer_set_language"

    .line 597
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 600
    :cond_2
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v1}, Lcom/helpshift/common/domain/Domain;->getMetaDataDM()Lcom/helpshift/meta/MetaDataDM;

    move-result-object v1

    invoke-virtual {v1}, Lcom/helpshift/meta/MetaDataDM;->getMetaInfo()Ljava/lang/Object;

    move-result-object v1

    .line 601
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "meta"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 602
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v2, "fullPrivacy"

    invoke-virtual {v1, v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 605
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v2}, Lcom/helpshift/common/domain/Domain;->getCustomIssueFieldDM()Lcom/helpshift/cif/CustomIssueFieldDM;

    move-result-object v2

    invoke-virtual {v2}, Lcom/helpshift/cif/CustomIssueFieldDM;->getCustomIssueFieldData()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 607
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "custom_fields"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 610
    :cond_3
    invoke-static {p2}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "greeting"

    .line 611
    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 614
    :cond_4
    invoke-static {p3}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_5

    const-string p2, "user_message"

    .line 615
    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 618
    :cond_5
    iget-boolean p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isAutoFilledPreIssue:Z

    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p2

    const-string v2, "is_prefilled"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 620
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    invoke-static {p2}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_6

    .line 621
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    const-string v2, "acid"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 625
    :cond_6
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentTreeId:Ljava/lang/String;

    invoke-static {p2}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_7

    .line 626
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentTreeId:Ljava/lang/String;

    const-string v2, "tree_id"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 628
    :cond_7
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentUserQuery:Ljava/lang/String;

    invoke-static {p2}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_8

    .line 629
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentUserQuery:Ljava/lang/String;

    const-string v2, "st"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 631
    :cond_8
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentIds:Ljava/util/List;

    invoke-static {p2}, Lcom/helpshift/util/ListUtils;->isNotEmpty(Ljava/util/List;)Z

    move-result p2

    if-eqz p2, :cond_9

    .line 632
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p2}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object p2

    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentIds:Ljava/util/List;

    .line 633
    invoke-interface {p2, v2}, Lcom/helpshift/common/platform/Jsonifier;->jsonifyListToJsonArray(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p2

    .line 634
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v2, "intent"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 637
    :cond_9
    invoke-static {p4}, Lcom/helpshift/util/ListUtils;->isNotEmpty(Ljava/util/List;)Z

    move-result p2

    if-eqz p2, :cond_a

    .line 638
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p2}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object p2

    invoke-interface {p2, p4}, Lcom/helpshift/common/platform/Jsonifier;->jsonifyListToJsonArray(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p2

    .line 639
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v2, "intent_labels"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 643
    :cond_a
    new-instance v4, Lcom/helpshift/common/domain/network/POSTNetwork;

    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    const-string v3, "/preissues/"

    invoke-direct {v4, v3, p2, v2}, Lcom/helpshift/common/domain/network/POSTNetwork;-><init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 644
    new-instance v6, Lcom/helpshift/common/domain/idempotent/SuccessOrNonRetriableStatusCodeIdempotentPolicy;

    invoke-direct {v6}, Lcom/helpshift/common/domain/idempotent/SuccessOrNonRetriableStatusCodeIdempotentPolicy;-><init>()V

    .line 645
    new-instance p2, Lcom/helpshift/common/domain/network/IdempotentNetwork;

    iget-object v5, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    const-string v7, "/preissues/"

    const-string v8, "preissue_default_unique_key"

    move-object v3, p2

    invoke-direct/range {v3 .. v8}, Lcom/helpshift/common/domain/network/IdempotentNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/idempotent/IdempotentPolicy;Ljava/lang/String;Ljava/lang/String;)V

    .line 649
    new-instance v2, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;

    invoke-direct {v2, p2}, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 650
    new-instance p2, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;

    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {p2, v2, v3}, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 651
    new-instance v2, Lcom/helpshift/common/domain/network/MetaCorrectedNetwork;

    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v2, p2, v3}, Lcom/helpshift/common/domain/network/MetaCorrectedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 652
    new-instance p2, Lcom/helpshift/common/domain/network/GuardOKNetwork;

    invoke-direct {p2, v2}, Lcom/helpshift/common/domain/network/GuardOKNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 655
    new-instance v2, Lcom/helpshift/common/platform/network/RequestData;

    invoke-direct {v2, v0}, Lcom/helpshift/common/platform/network/RequestData;-><init>(Ljava/util/Map;)V

    .line 658
    :try_start_0
    invoke-interface {p2, v2}, Lcom/helpshift/common/domain/network/Network;->makeRequest(Lcom/helpshift/common/platform/network/RequestData;)Lcom/helpshift/common/platform/network/Response;

    move-result-object p2

    .line 659
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getResponseParser()Lcom/helpshift/common/platform/network/ResponseParser;

    move-result-object v0

    iget-object p2, p2, Lcom/helpshift/common/platform/network/Response;->responseString:Ljava/lang/String;

    invoke-interface {v0, p2}, Lcom/helpshift/common/platform/network/ResponseParser;->parseReadableConversation(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p2

    .line 662
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    if-nez v0, :cond_b

    .line 663
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    .line 667
    :cond_b
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    .line 668
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->title:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->title:Ljava/lang/String;

    .line 669
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getCreatedAt()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->setCreatedAt(Ljava/lang/String;)V

    .line 670
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getEpochCreatedAtTime()J

    move-result-wide v2

    invoke-virtual {p1, v2, v3}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->setEpochCreatedAtTime(J)V

    .line 671
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->updatedAt:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->updatedAt:Ljava/lang/String;

    .line 672
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->publishId:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->publishId:Ljava/lang/String;

    .line 673
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 674
    iput-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->wasFullPrivacyEnabledAtCreation:Z

    .line 675
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    .line 676
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    .line 679
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentIds:Ljava/util/List;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentIds:Ljava/util/List;

    .line 682
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->deleteMessagesForConversation(J)Z

    .line 683
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    .line 688
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v0}, Lcom/helpshift/util/HSObservableList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_c
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 689
    iget-object v3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object v3, v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 690
    instance-of v3, v1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;

    if-eqz v3, :cond_d

    .line 691
    iput v2, v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->deliveryState:I

    goto :goto_0

    .line 693
    :cond_d
    instance-of v2, v1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    if-eqz v2, :cond_c

    const/4 v2, 0x2

    .line 694
    iput v2, v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->deliveryState:I

    goto :goto_0

    .line 698
    :cond_e
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    .line 701
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/account/domainmodel/UserManagerDM;->updateIssueExists(Lcom/helpshift/account/domainmodel/UserDM;Z)V

    .line 703
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserManagerDM;->sendPushToken()V

    .line 705
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->updateConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    const-string v0, ""

    .line 710
    invoke-static {p4}, Lcom/helpshift/util/ListUtils;->isNotEmpty(Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_f

    const-string p3, ","

    .line 711
    invoke-static {p4, p3}, Lcom/helpshift/util/ListUtils;->serializeWithDelimiter(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    goto :goto_1

    .line 713
    :cond_f
    invoke-static {p3}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_10

    goto :goto_1

    :cond_10
    move-object p3, v0

    .line 716
    :goto_1
    iget-object p4, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p4}, Lcom/helpshift/common/domain/Domain;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->newConversationStarted(Ljava/lang/String;)V

    const-string p3, "issue"

    .line 718
    iget-object p4, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_11

    const-string p1, "Helpshift_ConvInboxDM"

    const-string p3, "Preissue creation skipped, issue created directly."

    .line 719
    invoke-static {p1, p3}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 722
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendConversationPostedEvent(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    goto :goto_2

    .line 725
    :cond_11
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p2, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendMessageAddedEventOnPreissueCreation(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    return-void

    :catch_0
    move-exception p1

    .line 730
    iget-object p2, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object p3, Lcom/helpshift/common/exception/NetworkException;->INVALID_AUTH_TOKEN:Lcom/helpshift/common/exception/NetworkException;

    if-eq p2, p3, :cond_12

    iget-object p2, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object p3, Lcom/helpshift/common/exception/NetworkException;->AUTH_TOKEN_NOT_PROVIDED:Lcom/helpshift/common/exception/NetworkException;

    if-ne p2, p3, :cond_13

    .line 732
    :cond_12
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object p2

    iget-object p3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object p4, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    invoke-virtual {p2, p3, p4}, Lcom/helpshift/account/AuthenticationFailureDM;->notifyAuthenticationFailure(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/exception/ExceptionType;)V

    .line 734
    :cond_13
    throw p1
.end method

.method public createPreIssueViaConversationalFlow(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;)V
    .locals 6

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    .line 511
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/conversation/domainmodel/ConversationController;->createPreIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;)V

    return-void
.end method

.method public createPreIssueViaSmartIntent(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;",
            ")V"
        }
    .end annotation

    .line 505
    invoke-direct/range {p0 .. p5}, Lcom/helpshift/conversation/domainmodel/ConversationController;->createPreIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;)V

    return-void
.end method

.method deleteAllConversationsData()V
    .locals 3

    .line 191
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->deleteConversationsAndMessages()V

    .line 192
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 194
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    invoke-interface {v2, v0, v1}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->deleteUserData(J)V

    return-void
.end method

.method public deleteCachedFilesForResolvedConversations()V
    .locals 2

    .line 1552
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/domainmodel/ConversationController$6;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/domainmodel/ConversationController$6;-><init>(Lcom/helpshift/conversation/domainmodel/ConversationController;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public executeUserSync()V
    .locals 5

    .line 1661
    invoke-virtual {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->fetchInitialConversationUpdates()Lcom/helpshift/conversation/dto/ConversationInbox;

    .line 1664
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationsWithoutMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v0

    .line 1665
    invoke-virtual {v0}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1667
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->isAtLeastOneConversationNonActionable(Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x3

    const/4 v2, 0x0

    .line 1677
    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->remoteConversationLoader:Lcom/helpshift/conversation/loaders/RemoteConversationLoader;

    invoke-virtual {v3}, Lcom/helpshift/conversation/loaders/RemoteConversationLoader;->hasMoreMessage()Z

    move-result v3

    .line 1678
    :goto_0
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->isAtLeastOneConversationNonActionable(Ljava/util/List;)Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz v3, :cond_1

    if-ge v2, v1, :cond_1

    .line 1682
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->fetchConversationHistory()V

    .line 1684
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v3}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-interface {v0, v3, v4}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationsWithoutMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v0

    .line 1685
    invoke-virtual {v0}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1687
    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->remoteConversationLoader:Lcom/helpshift/conversation/loaders/RemoteConversationLoader;

    invoke-virtual {v3}, Lcom/helpshift/conversation/loaders/RemoteConversationLoader;->hasMoreMessage()Z

    move-result v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public fetchConversationUpdates()Lcom/helpshift/conversation/dto/ConversationInbox;
    .locals 4

    .line 761
    sget-object v0, Lcom/helpshift/conversation/domainmodel/ConversationController;->fetchConversationUpdatesLock:Ljava/lang/Object;

    monitor-enter v0

    .line 762
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v2}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->getConversationInboxTimestamp(J)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 763
    invoke-direct {p0, v1, v2}, Lcom/helpshift/conversation/domainmodel/ConversationController;->fetchConversationUpdatesInternal(Ljava/lang/String;Z)Lcom/helpshift/conversation/dto/ConversationInbox;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 764
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public fetchConversationsAndGetNotificationCount()Lcom/helpshift/util/ValuePair;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/helpshift/util/ValuePair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1427
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    const/4 v1, 0x1

    .line 1428
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v0, :cond_6

    .line 1427
    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->issueExists()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 1431
    :cond_0
    iget-boolean v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userCanReadMessages:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 1432
    new-instance v0, Lcom/helpshift/util/ValuePair;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Lcom/helpshift/util/ValuePair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0

    .line 1435
    :cond_1
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v3}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-interface {v0, v3, v4}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationsWithoutMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v0

    .line 1436
    invoke-virtual {v0}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1438
    invoke-static {v0}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1439
    new-instance v0, Lcom/helpshift/util/ValuePair;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Lcom/helpshift/util/ValuePair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0

    .line 1442
    :cond_2
    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->kvStore:Lcom/helpshift/common/platform/KVStore;

    const-wide/16 v4, 0x0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const-string v5, "lastNotifCountFetchTime"

    invoke-interface {v3, v5, v4}, Lcom/helpshift/common/platform/KVStore;->getLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 1445
    invoke-static {v0}, Lcom/helpshift/conversation/ConversationUtil;->shouldPollActivelyForConversations(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-wide/32 v6, 0xea60

    goto :goto_0

    :cond_3
    const-wide/32 v6, 0x493e0

    .line 1448
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v3

    cmp-long v0, v8, v6

    if-gez v0, :cond_4

    .line 1450
    invoke-virtual {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getNotificationCountSync()I

    move-result v0

    .line 1451
    new-instance v2, Lcom/helpshift/util/ValuePair;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {v2, v0, v1}, Lcom/helpshift/util/ValuePair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v2

    .line 1455
    :cond_4
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->kvStore:Lcom/helpshift/common/platform/KVStore;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v5, v1}, Lcom/helpshift/common/platform/KVStore;->setLong(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1457
    invoke-virtual {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->fetchConversationUpdates()Lcom/helpshift/conversation/dto/ConversationInbox;

    .line 1459
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getActiveConversationFromUIOrStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 1461
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->getUnSeenMessageCount(Lcom/helpshift/conversation/activeconversation/model/Conversation;)I

    move-result v0

    goto :goto_1

    :cond_5
    const/4 v0, 0x0

    .line 1463
    :goto_1
    new-instance v1, Lcom/helpshift/util/ValuePair;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/helpshift/util/ValuePair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1

    .line 1428
    :cond_6
    :goto_2
    new-instance v0, Lcom/helpshift/util/ValuePair;

    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Lcom/helpshift/util/ValuePair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method public fetchInitialConversationUpdates()Lcom/helpshift/conversation/dto/ConversationInbox;
    .locals 3

    .line 768
    sget-object v0, Lcom/helpshift/conversation/domainmodel/ConversationController;->fetchConversationUpdatesLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 769
    :try_start_0
    invoke-direct {p0, v1, v2}, Lcom/helpshift/conversation/domainmodel/ConversationController;->fetchConversationUpdatesInternal(Ljava/lang/String;Z)Lcom/helpshift/conversation/dto/ConversationInbox;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 770
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getActiveConversationFromStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 5

    .line 1160
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v1, "disableInAppConversation"

    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1161
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationsWithoutMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v0

    .line 1162
    invoke-virtual {v0}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1163
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1164
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 1165
    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v3}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    iput-wide v3, v2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    .line 1166
    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v3, v2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->shouldOpen(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1167
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1170
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 1171
    invoke-static {v1}, Lcom/helpshift/conversation/ConversationUtil;->getLastConversationBasedOnCreatedAt(Ljava/util/Collection;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    return-object v0
.end method

.method public getActiveConversationOrPreIssue()Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 3

    .line 1151
    invoke-virtual {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getActiveConversationFromStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1152
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v2, "conversationalIssueFiling"

    invoke-virtual {v1, v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1153
    invoke-virtual {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->createLocalPreIssueConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getConversationArchivalPrefillText()Ljava/lang/String;
    .locals 3

    .line 266
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->getConversationArchivalPrefillText(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getConversationDetail()Lcom/helpshift/conversation/dto/ConversationDetailDTO;
    .locals 3

    .line 262
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->getDescriptionDetail(J)Lcom/helpshift/conversation/dto/ConversationDetailDTO;

    move-result-object v0

    return-object v0
.end method

.method public getConversationInboxPoller()Lcom/helpshift/conversation/ConversationInboxPoller;
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxPoller:Lcom/helpshift/conversation/ConversationInboxPoller;

    return-object v0
.end method

.method public getConversationManager()Lcom/helpshift/conversation/activeconversation/ConversationManager;
    .locals 1

    .line 174
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 3

    .line 293
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->getEmail(J)Ljava/lang/String;

    move-result-object v0

    .line 294
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 295
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->getEmail()Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getFAQSearchResults(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1

    .line 325
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->faqSearchDM:Lcom/helpshift/faq/domainmodel/FAQSearchDM;

    invoke-interface {v0, p1}, Lcom/helpshift/faq/domainmodel/FAQSearchDM;->getSearchResults(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1
.end method

.method public getImageAttachmentDraft()Lcom/helpshift/conversation/dto/AttachmentPickerFile;
    .locals 3

    .line 313
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->getImageAttachment(J)Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    move-result-object v0

    return-object v0
.end method

.method public getLastConversationsRedactionTime()Ljava/lang/Long;
    .locals 3

    .line 309
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->getLastConversationsRedactionTime(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 3

    .line 285
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->getName(J)Ljava/lang/String;

    move-result-object v0

    .line 286
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 287
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->getName()Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getNotificationCountSync()I
    .locals 4

    .line 1404
    iget-boolean v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userCanReadMessages:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 1408
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getActiveConversationFromUIOrStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    if-nez v0, :cond_1

    return v1

    .line 1414
    :cond_1
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v2, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->getUnSeenMessageCount(Lcom/helpshift/conversation/activeconversation/model/Conversation;)I

    move-result v2

    .line 1417
    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    invoke-interface {v3, v0}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->getPushNotificationData(Ljava/lang/String;)Lcom/helpshift/conversation/dao/PushNotificationData;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 1419
    iget v1, v0, Lcom/helpshift/conversation/dao/PushNotificationData;->count:I

    .line 1422
    :cond_2
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public getOldestConversationCreatedAtTime()Ljava/lang/Long;
    .locals 3

    .line 1715
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->getOldestConversationCreatedAtTime(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public getOpenConversationWithMessages()Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 6

    .line 1183
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationsWithoutMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v0

    .line 1184
    invoke-virtual {v0}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1185
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1186
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    return-object v3

    .line 1189
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 1190
    iget-object v4, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v4}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iput-wide v4, v2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    .line 1191
    invoke-virtual {v2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1192
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1195
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    return-object v3

    .line 1199
    :cond_3
    invoke-static {v1}, Lcom/helpshift/conversation/ConversationUtil;->getLastConversationBasedOnCreatedAt(Ljava/util/Collection;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 1200
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/helpshift/conversation/dao/ConversationDAO;->readMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v1

    .line 1201
    invoke-virtual {v1}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->setMessageDMs(Ljava/util/List;)V

    return-object v0
.end method

.method public getUserReplyText()Ljava/lang/String;
    .locals 3

    .line 321
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->getUserReplyDraft(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getViewableConversation(ZLjava/lang/Long;)Lcom/helpshift/conversation/activeconversation/ViewableConversation;
    .locals 8

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 1068
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 1072
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getType()Lcom/helpshift/conversation/activeconversation/ViewableConversation$ConversationType;

    move-result-object p2

    sget-object v1, Lcom/helpshift/conversation/activeconversation/ViewableConversation$ConversationType;->SINGLE:Lcom/helpshift/conversation/activeconversation/ViewableConversation$ConversationType;

    if-ne p2, v1, :cond_0

    .line 1073
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->removeInMemoryConversation()V

    goto :goto_0

    :cond_0
    move-object v0, p1

    :goto_0
    if-nez v0, :cond_3

    .line 1078
    new-instance p1, Lcom/helpshift/conversation/loaders/ConversationHistoryLoader;

    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v4, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->remoteConversationLoader:Lcom/helpshift/conversation/loaders/RemoteConversationLoader;

    const-wide/16 v5, 0x64

    move-object v1, p1

    invoke-direct/range {v1 .. v6}, Lcom/helpshift/conversation/loaders/ConversationHistoryLoader;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/loaders/RemoteConversationLoader;J)V

    .line 1080
    new-instance v0, Lcom/helpshift/conversation/activeconversation/ViewableConversationHistory;

    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v4, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v6, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    move-object v1, v0

    move-object v5, p1

    invoke-direct/range {v1 .. v6}, Lcom/helpshift/conversation/activeconversation/ViewableConversationHistory;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/loaders/ConversationHistoryLoader;Lcom/helpshift/conversation/activeconversation/ConversationManager;)V

    .line 1081
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->init()V

    .line 1082
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getAllConversations()Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 1084
    invoke-virtual {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->createLocalPreIssueConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p1

    .line 1085
    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->onNewConversationStarted(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    goto :goto_2

    .line 1090
    :cond_1
    invoke-direct {p0, p2}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getAliveViewableConversation(Ljava/lang/Long;)Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 1094
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getType()Lcom/helpshift/conversation/activeconversation/ViewableConversation$ConversationType;

    move-result-object v1

    sget-object v2, Lcom/helpshift/conversation/activeconversation/ViewableConversation$ConversationType;->HISTORY:Lcom/helpshift/conversation/activeconversation/ViewableConversation$ConversationType;

    if-ne v1, v2, :cond_2

    .line 1095
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->removeInMemoryConversation()V

    goto :goto_1

    :cond_2
    move-object v0, p1

    :goto_1
    if-nez v0, :cond_3

    .line 1100
    new-instance p1, Lcom/helpshift/conversation/loaders/SingleConversationLoader;

    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v5, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->remoteConversationLoader:Lcom/helpshift/conversation/loaders/RemoteConversationLoader;

    const-wide/16 v6, 0x64

    move-object v1, p1

    move-object v4, p2

    invoke-direct/range {v1 .. v7}, Lcom/helpshift/conversation/loaders/SingleConversationLoader;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/Long;Lcom/helpshift/conversation/loaders/RemoteConversationLoader;J)V

    .line 1103
    new-instance v0, Lcom/helpshift/conversation/activeconversation/ViewableSingleConversation;

    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v4, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v6, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    move-object v1, v0

    move-object v5, p1

    invoke-direct/range {v1 .. v6}, Lcom/helpshift/conversation/activeconversation/ViewableSingleConversation;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/loaders/SingleConversationLoader;Lcom/helpshift/conversation/activeconversation/ConversationManager;)V

    .line 1104
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->init()V

    .line 1107
    :cond_3
    :goto_2
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->liveUpdateDM:Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->setLiveUpdateDM(Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;)V

    .line 1108
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->setAliveConversation(Lcom/helpshift/conversation/activeconversation/ViewableConversation;)V

    return-object v0
.end method

.method public handlePushNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    const-string v0, "issue"

    .line 1308
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1309
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {p1, p2}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationWithoutMessages(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string v0, "preissue"

    .line 1311
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1312
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {p1, p2}, Lcom/helpshift/conversation/dao/ConversationDAO;->readPreConversationWithoutMessages(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p1

    :goto_0
    if-nez p1, :cond_1

    return-void

    .line 1326
    :cond_1
    invoke-static {p3}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 1327
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p2}, Lcom/helpshift/common/platform/Platform;->getDevice()Lcom/helpshift/common/platform/Device;

    move-result-object p2

    invoke-interface {p2}, Lcom/helpshift/common/platform/Device;->getAppName()Ljava/lang/String;

    move-result-object p3

    :cond_2
    move-object v4, p3

    .line 1330
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object p3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    .line 1331
    invoke-interface {p2, p3}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->getPushNotificationData(Ljava/lang/String;)Lcom/helpshift/conversation/dao/PushNotificationData;

    move-result-object p2

    const/4 p3, 0x1

    if-nez p2, :cond_3

    move-object p2, v4

    const/4 v3, 0x1

    goto :goto_1

    .line 1339
    :cond_3
    iget v0, p2, Lcom/helpshift/conversation/dao/PushNotificationData;->count:I

    add-int/2addr v0, p3

    .line 1340
    iget-object p2, p2, Lcom/helpshift/conversation/dao/PushNotificationData;->title:Ljava/lang/String;

    move v3, v0

    .line 1344
    :goto_1
    iget-object p3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    new-instance v1, Lcom/helpshift/conversation/dao/PushNotificationData;

    invoke-direct {v1, v3, p2}, Lcom/helpshift/conversation/dao/PushNotificationData;-><init>(ILjava/lang/String;)V

    invoke-interface {p3, v0, v1}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->setPushNotificationData(Ljava/lang/String;Lcom/helpshift/conversation/dao/PushNotificationData;)V

    if-lez v3, :cond_4

    .line 1348
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->canShowNotificationForConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 1349
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/helpshift/conversation/domainmodel/ConversationController;->showNotificationOnUI(Ljava/lang/Long;Ljava/lang/String;ILjava/lang/String;Z)V

    .line 1356
    :cond_4
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->sendUnreadCountUpdate()V

    return-void

    .line 1315
    :cond_5
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Cannot handle push for unknown issue type. "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Helpshift_ConvInboxDM"

    invoke-static {p2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public initialize()V
    .locals 2

    .line 178
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAutoRetryFailedEventDM()Lcom/helpshift/common/AutoRetryFailedEventDM;

    move-result-object v0

    sget-object v1, Lcom/helpshift/common/AutoRetryFailedEventDM$EventType;->CONVERSATION:Lcom/helpshift/common/AutoRetryFailedEventDM$EventType;

    invoke-virtual {v0, v1, p0}, Lcom/helpshift/common/AutoRetryFailedEventDM;->register(Lcom/helpshift/common/AutoRetryFailedEventDM$EventType;Lcom/helpshift/common/AutoRetriableDM;)V

    .line 180
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->getSyncState()Lcom/helpshift/account/domainmodel/UserSyncStatus;

    move-result-object v0

    sget-object v1, Lcom/helpshift/account/domainmodel/UserSyncStatus;->COMPLETED:Lcom/helpshift/account/domainmodel/UserSyncStatus;

    if-ne v0, v1, :cond_0

    .line 181
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getConversationInboxPoller()Lcom/helpshift/conversation/ConversationInboxPoller;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/account/domainmodel/UserDM;->addObserver(Ljava/util/Observer;)V

    :cond_0
    return-void
.end method

.method public isActiveConversationActionable()Z
    .locals 3

    .line 1251
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1254
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_1

    .line 1258
    invoke-virtual {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getActiveConversationFromStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v1

    .line 1265
    :cond_1
    invoke-direct {p0, v1, v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->isMessageBoxVisibleInConversationResolutionRejectedState(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/ViewableConversation;)Z

    move-result v0

    .line 1267
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    .line 1268
    invoke-virtual {v2, v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->isConversationActionable(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)Z

    move-result v0

    return v0
.end method

.method public isCreateConversationInProgress()Z
    .locals 1

    .line 757
    iget-boolean v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->isCreateConversationInProgress:Z

    return v0
.end method

.method public isPreissueCreationInProgress(J)Z
    .locals 1

    .line 568
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->inProgressPreIssueCreators:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public redactConversations()V
    .locals 4

    .line 1723
    sget-object v0, Lcom/helpshift/conversation/domainmodel/ConversationController;->fetchConversationUpdatesLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1725
    :try_start_0
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->deleteConversationsAndMessages()V

    .line 1727
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->aliveViewableConversation:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    .line 1728
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->clear()V

    .line 1731
    :cond_0
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v2}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->resetDataAfterConversationsDeletion(J)V

    .line 1732
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public registerStartNewConversationListener(Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;)V
    .locals 1

    .line 337
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->startNewConversationListenerRef:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public resetLastNotificationCountFetchTime()V
    .locals 3

    .line 1467
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->kvStore:Lcom/helpshift/common/platform/KVStore;

    const-wide/16 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "lastNotifCountFetchTime"

    invoke-interface {v0, v2, v1}, Lcom/helpshift/common/platform/KVStore;->setLong(Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method resetPreIssueConversationsForUser(Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 9

    const-string v0, "Helpshift_ConvInboxDM"

    const-string v1, "Starting preissues reset."

    .line 1569
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1570
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationsWithoutMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v1

    .line 1571
    invoke-virtual {v1}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_5

    .line 1573
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_0

    goto/16 :goto_1

    .line 1578
    :cond_0
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getPreissueResetInterval()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    mul-long v2, v2, v4

    .line 1579
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 1582
    invoke-virtual {v4}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v5

    if-nez v5, :cond_2

    goto :goto_0

    .line 1587
    :cond_2
    iget-wide v5, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->lastUserActivityTime:J

    .line 1588
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v7, v5

    cmp-long v5, v7, v2

    if-ltz v5, :cond_1

    .line 1590
    iget-object v5, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-static {v5}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    iget-object v5, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-static {v5}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1592
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Deleting offline preissue : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1593
    iget-object v5, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v4, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-interface {v5, v6, v7}, Lcom/helpshift/conversation/dao/ConversationDAO;->deleteConversation(J)V

    .line 1594
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->removeInMemoryConversation()V

    goto :goto_0

    .line 1598
    :cond_3
    invoke-virtual {v4}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result v5

    if-nez v5, :cond_4

    iget-object v5, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v6, Lcom/helpshift/conversation/dto/IssueState;->UNKNOWN:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v5, v6, :cond_1

    .line 1600
    :cond_4
    invoke-virtual {p0, v4}, Lcom/helpshift/conversation/domainmodel/ConversationController;->clearNotification(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 1601
    iget-object v5, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v6, Lcom/helpshift/conversation/domainmodel/ConversationController$7;

    invoke-direct {v6, p0, v4, p1}, Lcom/helpshift/conversation/domainmodel/ConversationController$7;-><init>(Lcom/helpshift/conversation/domainmodel/ConversationController;Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/account/domainmodel/UserDM;)V

    invoke-virtual {v5, v6}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    goto :goto_0

    :cond_5
    :goto_1
    return-void
.end method

.method public resetPushNotificationCount(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 1361
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->setPushNotificationData(Ljava/lang/String;Lcom/helpshift/conversation/dao/PushNotificationData;)V

    .line 1362
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->didReceiveNotification(I)V

    return-void
.end method

.method public saveDescriptionDetail(Ljava/lang/String;I)V
    .locals 6

    .line 270
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    new-instance v3, Lcom/helpshift/conversation/dto/ConversationDetailDTO;

    .line 272
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    invoke-direct {v3, p1, v4, v5, p2}, Lcom/helpshift/conversation/dto/ConversationDetailDTO;-><init>(Ljava/lang/String;JI)V

    .line 270
    invoke-interface {v0, v1, v2, v3}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->saveDescriptionDetail(JLcom/helpshift/conversation/dto/ConversationDetailDTO;)V

    return-void
.end method

.method public saveEmail(Ljava/lang/String;)V
    .locals 3

    .line 281
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2, p1}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->saveEmail(JLjava/lang/String;)V

    return-void
.end method

.method public saveImageAttachmentDraft(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V
    .locals 3

    .line 301
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2, p1}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->saveImageAttachment(JLcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    return-void
.end method

.method public saveLastConversationsRedactionTime(J)V
    .locals 3

    .line 305
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2, p1, p2}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->saveLastConversationsRedactionTime(JJ)V

    return-void
.end method

.method public saveName(Ljava/lang/String;)V
    .locals 3

    .line 277
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2, p1}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->saveName(JLjava/lang/String;)V

    return-void
.end method

.method public saveUserReplyText(Ljava/lang/String;)V
    .locals 3

    .line 317
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2, p1}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->saveUserReplyDraft(JLjava/lang/String;)V

    return-void
.end method

.method public sendFailedApiCalls(Lcom/helpshift/common/AutoRetryFailedEventDM$EventType;)V
    .locals 2

    .line 221
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    .line 222
    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-interface {p1, v0, v1}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationsWithoutMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object p1

    .line 223
    invoke-virtual {p1}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 224
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 226
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-direct {p0, v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getAliveViewableConversation(Ljava/lang/Long;)Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 229
    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->retryCallsForConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 233
    invoke-direct {p0, v0, v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->retryCallsForConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public setConversationViewState(I)V
    .locals 0

    .line 1301
    iput p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationViewState:I

    return-void
.end method

.method public setPersistMessageBox(Z)V
    .locals 3

    .line 1297
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2, p1}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->savePersistMessageBox(JZ)V

    return-void
.end method

.method public setShouldDropCustomMetadata(Z)V
    .locals 0

    .line 333
    iput-boolean p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->shouldDropCustomMetadata:Z

    return-void
.end method

.method public setUserCanReadMessages(Z)V
    .locals 0

    .line 258
    iput-boolean p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userCanReadMessages:Z

    return-void
.end method

.method public shouldOpenConversationFromNotification(J)Z
    .locals 2

    .line 1131
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getAliveViewableConversation(Ljava/lang/Long;)Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1132
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v1

    if-nez v1, :cond_1

    .line 1133
    :cond_0
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v1, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationWithoutMessages(Ljava/lang/Long;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 1136
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {p2}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    .line 1137
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p2, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->shouldOpen(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result p1

    return p1

    :cond_1
    if-eqz v0, :cond_2

    .line 1141
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->shouldOpen()Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public shouldPersistMessageBox()Z
    .locals 3

    .line 1293
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->getPersistMessageBox(J)Z

    move-result v0

    return v0
.end method

.method public showPushNotifications()V
    .locals 10

    .line 1375
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    .line 1376
    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationsWithoutMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v0

    .line 1377
    invoke-virtual {v0}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1378
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 1379
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object v3, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    .line 1380
    invoke-interface {v2, v3}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->getPushNotificationData(Ljava/lang/String;)Lcom/helpshift/conversation/dao/PushNotificationData;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1381
    iget v3, v2, Lcom/helpshift/conversation/dao/PushNotificationData;->count:I

    if-lez v3, :cond_0

    .line 1382
    iget-object v5, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    .line 1383
    iget-object v6, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    iget v7, v2, Lcom/helpshift/conversation/dao/PushNotificationData;->count:I

    iget-object v8, v2, Lcom/helpshift/conversation/dao/PushNotificationData;->title:Ljava/lang/String;

    const/4 v9, 0x0

    move-object v4, p0

    invoke-direct/range {v4 .. v9}, Lcom/helpshift/conversation/domainmodel/ConversationController;->showNotificationOnUI(Ljava/lang/Long;Ljava/lang/String;ILjava/lang/String;Z)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public startNewConversation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V
    .locals 7

    .line 349
    new-instance v6, Lcom/helpshift/conversation/domainmodel/ConversationController$CreateConversationStateHolder;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/helpshift/conversation/domainmodel/ConversationController$CreateConversationStateHolder;-><init>(Lcom/helpshift/conversation/domainmodel/ConversationController;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    .line 353
    iget-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v6}, Lcom/helpshift/conversation/domainmodel/ConversationController$CreateConversationStateHolder;->getStartNewConversationInternalF()Lcom/helpshift/common/domain/F;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method startNewConversationInternal(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V
    .locals 7

    const/4 v0, 0x1

    .line 358
    iput-boolean v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->isCreateConversationInProgress:Z

    .line 359
    invoke-virtual {p0, p1, p2, p3}, Lcom/helpshift/conversation/domainmodel/ConversationController;->tryToStartNewConversation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p1

    .line 360
    new-instance p2, Lcom/helpshift/conversation/loaders/SingleConversationLoader;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iget-object v4, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->remoteConversationLoader:Lcom/helpshift/conversation/loaders/RemoteConversationLoader;

    const-wide/16 v5, 0x64

    move-object v0, p2

    invoke-direct/range {v0 .. v6}, Lcom/helpshift/conversation/loaders/SingleConversationLoader;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/Long;Lcom/helpshift/conversation/loaders/RemoteConversationLoader;J)V

    .line 365
    new-instance p3, Lcom/helpshift/conversation/activeconversation/ViewableSingleConversation;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v5, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    move-object v0, p3

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/helpshift/conversation/activeconversation/ViewableSingleConversation;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/loaders/SingleConversationLoader;Lcom/helpshift/conversation/activeconversation/ConversationManager;)V

    .line 367
    invoke-virtual {p3}, Lcom/helpshift/conversation/activeconversation/ViewableSingleConversation;->init()V

    .line 368
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->liveUpdateDM:Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;

    invoke-virtual {p3, p2}, Lcom/helpshift/conversation/activeconversation/ViewableSingleConversation;->setLiveUpdateDM(Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;)V

    .line 369
    invoke-direct {p0, p3}, Lcom/helpshift/conversation/domainmodel/ConversationController;->setAliveConversation(Lcom/helpshift/conversation/activeconversation/ViewableConversation;)V

    .line 371
    invoke-virtual {p3}, Lcom/helpshift/conversation/activeconversation/ViewableSingleConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p2

    invoke-direct {p0, p2, p4}, Lcom/helpshift/conversation/domainmodel/ConversationController;->checkAndTryToUploadImage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    const/4 p2, 0x0

    .line 373
    iput-boolean p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->isCreateConversationInProgress:Z

    .line 374
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->startNewConversationListenerRef:Ljava/lang/ref/WeakReference;

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 375
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->startNewConversationListenerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p3

    invoke-interface {p2, p3, p4}, Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;->onCreateConversationSuccess(J)V

    :cond_0
    return-void
.end method

.method public triggerFAQSearchIndexing()V
    .locals 1

    .line 329
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->faqSearchDM:Lcom/helpshift/faq/domainmodel/FAQSearchDM;

    invoke-interface {v0}, Lcom/helpshift/faq/domainmodel/FAQSearchDM;->startFAQSearchIndexing()V

    return-void
.end method

.method public tryToStartNewConversation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 5

    const/4 v0, 0x0

    .line 391
    :try_start_0
    sget-object v1, Lcom/helpshift/conversation/domainmodel/ConversationController;->fetchConversationUpdatesLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 394
    :try_start_1
    invoke-virtual {p0, p1, p2, p3}, Lcom/helpshift/conversation/domainmodel/ConversationController;->createConversation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v2

    .line 395
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    const-string v1, ""

    .line 396
    invoke-virtual {p0, v1, v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->saveDescriptionDetail(Ljava/lang/String;I)V

    .line 397
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->shouldCreateConversationAnonymously()Z

    move-result v1

    if-nez v1, :cond_0

    .line 398
    invoke-virtual {p0, p2}, Lcom/helpshift/conversation/domainmodel/ConversationController;->saveName(Ljava/lang/String;)V

    .line 399
    invoke-virtual {p0, p3}, Lcom/helpshift/conversation/domainmodel/ConversationController;->saveEmail(Ljava/lang/String;)V

    .line 401
    :cond_0
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationInboxDAO:Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    iget-object p3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {p3}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    const/4 p3, 0x0

    invoke-interface {p2, v3, v4, p3}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->saveConversationArchivalPrefillText(JLjava/lang/String;)V

    .line 402
    invoke-virtual {p0, v2}, Lcom/helpshift/conversation/domainmodel/ConversationController;->checkAndDropCustomMeta(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 403
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p2, v2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendConversationPostedEvent(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 404
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->newConversationStarted(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return-object v2

    :catchall_0
    move-exception p1

    .line 395
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw p1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception p1

    .line 408
    iput-boolean v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->isCreateConversationInProgress:Z

    .line 409
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->startNewConversationListenerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 410
    iget-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->startNewConversationListenerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;

    invoke-interface {p2, p1}, Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;->onCreateConversationFailure(Ljava/lang/Exception;)V

    .line 412
    :cond_1
    throw p1
.end method

.method public unregisterStartNewConversationListener(Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;)V
    .locals 1

    .line 341
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->startNewConversationListenerRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    .line 342
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_0

    .line 343
    new-instance p1, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->startNewConversationListenerRef:Ljava/lang/ref/WeakReference;

    :cond_0
    return-void
.end method

.method public updateActiveConversationExpiryProperties()V
    .locals 2

    .line 1736
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getActiveConversationFromUIOrStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1738
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateConversationExpiryProperties(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    :cond_0
    return-void
.end method
