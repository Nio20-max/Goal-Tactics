.class public Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;
.super Ljava/lang/Object;
.source "ConversationInboxManagerDM.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "ConvInboxManagerDM"


# instance fields
.field private activeUserAndInboxMapping:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Lcom/helpshift/conversation/domainmodel/ConversationController;",
            ">;"
        }
    .end annotation
.end field

.field private final domain:Lcom/helpshift/common/domain/Domain;

.field private final platform:Lcom/helpshift/common/platform/Platform;

.field private final userManagerDM:Lcom/helpshift/account/domainmodel/UserManagerDM;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/account/domainmodel/UserManagerDM;)V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->activeUserAndInboxMapping:Ljava/util/Map;

    .line 26
    iput-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 27
    iput-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->domain:Lcom/helpshift/common/domain/Domain;

    .line 28
    iput-object p3, p0, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->userManagerDM:Lcom/helpshift/account/domainmodel/UserManagerDM;

    return-void
.end method

.method private buildConversationInboxDM(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/domainmodel/ConversationController;
    .locals 3

    .line 32
    new-instance v0, Lcom/helpshift/conversation/domainmodel/ConversationController;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-direct {v0, v1, v2, p1}, Lcom/helpshift/conversation/domainmodel/ConversationController;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/account/domainmodel/UserDM;)V

    return-object v0
.end method


# virtual methods
.method public declared-synchronized deleteConversations(Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 0

    monitor-enter p0

    .line 67
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->getConversationInboxDM(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/domainmodel/ConversationController;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 69
    invoke-virtual {p1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->deleteAllConversationsData()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getActiveConversationInboxDM()Lcom/helpshift/conversation/domainmodel/ConversationController;
    .locals 4

    monitor-enter p0

    const/4 v0, 0x0

    .line 38
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->userManagerDM:Lcom/helpshift/account/domainmodel/UserManagerDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserManagerDM;->getActiveUser()Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object v1

    .line 39
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->activeUserAndInboxMapping:Ljava/util/Map;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/domainmodel/ConversationController;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 41
    :try_start_1
    invoke-direct {p0, v1}, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->buildConversationInboxDM(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/domainmodel/ConversationController;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    :try_start_2
    invoke-virtual {v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->initialize()V

    .line 43
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->activeUserAndInboxMapping:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 44
    iget-object v2, p0, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->activeUserAndInboxMapping:Ljava/util/Map;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v1

    move-object v0, v2

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v1

    :goto_0
    :try_start_3
    const-string v2, "ConvInboxManagerDM"

    const-string v3, "Exception while setting up active conversation controller"

    .line 48
    invoke-static {v2, v3, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 49
    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->domain:Lcom/helpshift/common/domain/Domain;

    sget-object v2, Lcom/helpshift/common/HSBlockReason;->FETCH_ACTIVE_USER_ERROR:Lcom/helpshift/common/HSBlockReason;

    invoke-virtual {v1, v2}, Lcom/helpshift/common/domain/Domain;->blockPublicAPI(Lcom/helpshift/common/HSBlockReason;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_1
    move-object v2, v0

    .line 52
    :cond_0
    monitor-exit p0

    return-object v2

    :goto_2
    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getConversationInboxDM(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/domainmodel/ConversationController;
    .locals 2

    monitor-enter p0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 57
    monitor-exit p0

    return-object p1

    .line 59
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->activeUserAndInboxMapping:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/domainmodel/ConversationController;

    if-nez v0, :cond_1

    .line 61
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->buildConversationInboxDM(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/domainmodel/ConversationController;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    :cond_1
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized resetPreIssueConversations()V
    .locals 3

    monitor-enter p0

    .line 74
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserManagerDM;->getAllUsers()Ljava/util/List;

    move-result-object v0

    .line 76
    invoke-static {v0}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 77
    monitor-exit p0

    return-void

    .line 80
    :cond_0
    :try_start_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/account/domainmodel/UserDM;

    .line 81
    invoke-virtual {p0, v1}, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->getConversationInboxDM(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/domainmodel/ConversationController;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 83
    invoke-virtual {v2, v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->resetPreIssueConversationsForUser(Lcom/helpshift/account/domainmodel/UserDM;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 86
    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
