.class public abstract Lcom/helpshift/conversation/activeconversation/ViewableConversation;
.super Ljava/lang/Object;
.source "ViewableConversation.java"

# interfaces
.implements Lcom/helpshift/conversation/activeconversation/ConversationDMListener;
.implements Lcom/helpshift/conversation/activeconversation/LiveUpdateDM$TypingIndicatorListener;
.implements Lcom/helpshift/conversation/loaders/ConversationsLoader$LoadMoreConversationsCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/conversation/activeconversation/ViewableConversation$ConversationType;
    }
.end annotation


# instance fields
.field protected conversationLoader:Lcom/helpshift/conversation/loaders/ConversationsLoader;

.field protected conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

.field private conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

.field protected domain:Lcom/helpshift/common/domain/Domain;

.field private isLoadMoreInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

.field protected liveUpdateDM:Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;

.field protected platform:Lcom/helpshift/common/platform/Platform;

.field private sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

.field protected userDM:Lcom/helpshift/account/domainmodel/UserDM;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/loaders/ConversationsLoader;Lcom/helpshift/conversation/activeconversation/ConversationManager;)V
    .locals 2

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->isLoadMoreInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 63
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->platform:Lcom/helpshift/common/platform/Platform;

    .line 64
    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->domain:Lcom/helpshift/common/domain/Domain;

    .line 65
    iput-object p3, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    .line 66
    iput-object p4, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationLoader:Lcom/helpshift/conversation/loaders/ConversationsLoader;

    .line 67
    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    .line 68
    iput-object p5, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    return-void
.end method

.method private getConversationForLocalId(J)Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 4

    .line 413
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getAllConversations()Ljava/util/List;

    move-result-object v0

    .line 415
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 416
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method


# virtual methods
.method protected buildPaginationCursor(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/conversation/activeconversation/PaginationCursor;
    .locals 5

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 356
    :cond_0
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getCreatedAt()Ljava/lang/String;

    move-result-object v0

    .line 358
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    .line 360
    invoke-static {v1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 p1, 0x0

    .line 361
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getCreatedAt()Ljava/lang/String;

    move-result-object p1

    .line 362
    new-instance v1, Lcom/helpshift/conversation/activeconversation/PaginationCursor;

    invoke-direct {v1, v0, p1}, Lcom/helpshift/conversation/activeconversation/PaginationCursor;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    .line 364
    :cond_1
    iget-boolean v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    if-nez v2, :cond_8

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v2, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->isSynced(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_2

    .line 379
    :cond_2
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v2}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object v2

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-interface {v2, v3, v4}, Lcom/helpshift/conversation/dao/ConversationDAO;->readMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 380
    invoke-virtual {p1}, Lcom/helpshift/common/dao/DAOResult;->isSuccess()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 381
    invoke-virtual {p1}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Ljava/util/List;

    .line 384
    :cond_3
    invoke-static {v1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result p1

    if-eqz p1, :cond_4

    move-object p1, v0

    goto :goto_1

    .line 395
    :cond_4
    invoke-static {v1}, Lcom/helpshift/conversation/ConversationUtil;->sortMessagesBasedOnCreatedAt(Ljava/util/List;)V

    .line 396
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    move v2, p1

    :goto_0
    if-ltz v2, :cond_6

    .line 398
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 399
    iget-boolean v3, v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isFeedbackMessage:Z

    if-nez v3, :cond_5

    if-ge v2, p1, :cond_6

    add-int/lit8 v2, v2, 0x1

    .line 401
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getCreatedAt()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_5
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_6
    const-string p1, ""

    .line 408
    :goto_1
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    move-object p1, v0

    .line 409
    :cond_7
    new-instance v1, Lcom/helpshift/conversation/activeconversation/PaginationCursor;

    invoke-direct {v1, v0, p1}, Lcom/helpshift/conversation/activeconversation/PaginationCursor;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    .line 370
    :cond_8
    :goto_2
    new-instance p1, Lcom/helpshift/conversation/activeconversation/PaginationCursor;

    invoke-direct {p1, v0, v0}, Lcom/helpshift/conversation/activeconversation/PaginationCursor;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method

.method public dispatchPollFailureCallback()V
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    if-eqz v0, :cond_0

    .line 137
    invoke-interface {v0}, Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;->onConversationInboxPollFailure()V

    :cond_0
    return-void
.end method

.method public dispatchPollSuccessCallback()V
    .locals 1

    .line 130
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    if-eqz v0, :cond_0

    .line 131
    invoke-interface {v0}, Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;->onConversationInboxPollSuccess()V

    :cond_0
    return-void
.end method

.method public abstract getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;
.end method

.method public abstract getAllConversations()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;"
        }
    .end annotation
.end method

.method public getConversationVMCallback()Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    return-object v0
.end method

.method public abstract getPaginationCursor()Lcom/helpshift/conversation/activeconversation/PaginationCursor;
.end method

.method public abstract getType()Lcom/helpshift/conversation/activeconversation/ViewableConversation$ConversationType;
.end method

.method public getUIConversations()Ljava/util/List;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/UIConversation;",
            ">;"
        }
    .end annotation

    .line 266
    invoke-virtual/range {p0 .. p0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getAllConversations()Ljava/util/List;

    move-result-object v0

    .line 267
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 268
    invoke-static {v0}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    .line 271
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    .line 273
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 274
    new-instance v15, Lcom/helpshift/conversation/activeconversation/UIConversation;

    iget-object v5, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    .line 275
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-virtual {v4}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getCreatedAt()Ljava/lang/String;

    move-result-object v8

    .line 276
    invoke-virtual {v4}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getEpochCreatedAtTime()J

    move-result-wide v9

    iget-object v11, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->publishId:Ljava/lang/String;

    .line 277
    invoke-virtual {v4}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v12

    iget-object v13, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    iget-boolean v14, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    move-object v4, v15

    move v7, v3

    invoke-direct/range {v4 .. v14}, Lcom/helpshift/conversation/activeconversation/UIConversation;-><init>(JILjava/lang/String;JLjava/lang/String;ZLcom/helpshift/conversation/dto/IssueState;Z)V

    .line 279
    invoke-interface {v1, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method public handleIdempotentPreIssueCreationSuccess()V
    .locals 1

    .line 176
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    if-eqz v0, :cond_0

    .line 177
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->init()V

    .line 178
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    invoke-interface {v0}, Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;->handleIdempotentPreIssueCreationSuccess()V

    :cond_0
    return-void
.end method

.method public hasMoreMessages()Z
    .locals 1

    .line 259
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationLoader:Lcom/helpshift/conversation/loaders/ConversationsLoader;

    invoke-virtual {v0}, Lcom/helpshift/conversation/loaders/ConversationsLoader;->hasMoreMessages()Z

    move-result v0

    return v0
.end method

.method public abstract init()V
.end method

.method public abstract initializeConversationsForUI()V
.end method

.method public isActiveConversationEqual(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 149
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v1

    if-nez v1, :cond_1

    return v0

    :cond_1
    if-ne v1, p1, :cond_2

    const/4 p1, 0x1

    return p1

    .line 159
    :cond_2
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 160
    iget-object v0, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    .line 162
    :cond_3
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 163
    iget-object v0, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    .line 164
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_4
    return v0
.end method

.method public isAgentTyping()Z
    .locals 1

    .line 205
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->liveUpdateDM:Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;->isAgentTyping()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    .line 206
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->shouldEnableTypingIndicator()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isConversationVMAttached()Z
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isVisibleOnUI()Z
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;->isVisibleOnUI()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public loadMoreMessages()V
    .locals 3

    .line 286
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->isLoadMoreInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 288
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationLoader:Lcom/helpshift/conversation/loaders/ConversationsLoader;

    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getPaginationCursor()Lcom/helpshift/conversation/activeconversation/PaginationCursor;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/helpshift/conversation/loaders/ConversationsLoader;->loadMoreConversations(Lcom/helpshift/conversation/activeconversation/PaginationCursor;Lcom/helpshift/conversation/loaders/ConversationsLoader$LoadMoreConversationsCallback;)V

    :cond_0
    return-void
.end method

.method public loading()V
    .locals 2

    .line 342
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->isLoadMoreInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 343
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    if-eqz v0, :cond_0

    .line 344
    invoke-interface {v0}, Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;->onHistoryLoadingStarted()V

    :cond_0
    return-void
.end method

.method public onActionCardMessageClicked(Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V
    .locals 2

    .line 112
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->conversationLocalId:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getConversationForLocalId(J)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->handleClick(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)V

    return-void
.end method

.method public onAdminAttachmentMessageClicked(Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;)V
    .locals 2

    .line 116
    sget-object v0, Lcom/helpshift/conversation/activeconversation/ViewableConversation$1;->$SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType:[I

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 123
    :cond_0
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    .line 124
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    invoke-virtual {p1, v0}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->handleClick(Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;)V

    goto :goto_0

    .line 118
    :cond_1
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;

    .line 120
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    invoke-virtual {p1, v0}, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;->handleClick(Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;)V

    :goto_0
    return-void
.end method

.method public onAgentTypingUpdate(Z)V
    .locals 1

    .line 211
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    if-eqz v0, :cond_0

    .line 212
    invoke-interface {v0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;->onAgentTypingUpdate(Z)V

    :cond_0
    return-void
.end method

.method public onError()V
    .locals 2

    .line 334
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->isLoadMoreInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 335
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    if-eqz v0, :cond_0

    .line 336
    invoke-interface {v0}, Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;->onHistoryLoadingError()V

    :cond_0
    return-void
.end method

.method public onIssueStatusChange(Lcom/helpshift/conversation/dto/IssueState;)V
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    if-eqz v0, :cond_0

    .line 185
    invoke-interface {v0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;->onIssueStatusChange(Lcom/helpshift/conversation/dto/IssueState;)V

    :cond_0
    return-void
.end method

.method public abstract onNewConversationStarted(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
.end method

.method public onScreenshotMessageClicked(Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;)V
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    invoke-virtual {p1, v0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->handleClick(Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;)V

    return-void
.end method

.method public onSuccess(Ljava/util/List;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;Z)V"
        }
    .end annotation

    .line 296
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    if-eqz v0, :cond_0

    .line 297
    invoke-interface {v0}, Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;->onHistoryLoadingSuccess()V

    .line 300
    :cond_0
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 301
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->isLoadMoreInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 304
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    if-eqz p1, :cond_1

    .line 305
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 306
    invoke-interface {p1, v0, p2}, Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;->prependConversations(Ljava/util/List;Z)V

    :cond_1
    return-void

    .line 311
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 312
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 313
    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v3}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    iput-wide v3, v2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    .line 314
    invoke-virtual {p0, v2}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->isActiveConversationEqual(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 316
    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    .line 317
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->shouldEnableMessagesClick(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v3, 0x1

    goto :goto_1

    :cond_3
    const/4 v3, 0x0

    .line 319
    :goto_1
    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v4, v2, v3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->initializeHistoryMessageListForUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    .line 320
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 323
    :cond_4
    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->prependConversations(Ljava/util/List;)V

    .line 325
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    if-eqz p1, :cond_5

    .line 326
    invoke-interface {p1, v0, p2}, Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;->prependConversations(Ljava/util/List;Z)V

    .line 329
    :cond_5
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->isLoadMoreInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method

.method public onUserAttachmentMessageClicked(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V
    .locals 1

    .line 108
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    invoke-virtual {p1, v0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->handleClick(Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;)V

    return-void
.end method

.method public abstract prependConversations(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract registerMessagesObserver(Lcom/helpshift/util/HSListObserver;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/util/HSListObserver<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation
.end method

.method public setConversationVMCallback(Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;)V
    .locals 0

    .line 221
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    .line 222
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->setListener(Lcom/helpshift/conversation/activeconversation/ConversationDMListener;)V

    return-void
.end method

.method public setLiveUpdateDM(Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;)V
    .locals 0

    .line 79
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->liveUpdateDM:Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;

    return-void
.end method

.method public abstract shouldOpen()Z
.end method

.method public startLiveUpdates()V
    .locals 2

    .line 191
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 192
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->liveUpdateDM:Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    .line 193
    invoke-virtual {v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->shouldEnableTypingIndicator()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 194
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->liveUpdateDM:Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-virtual {v1, p0, v0}, Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;->registerListener(Lcom/helpshift/conversation/activeconversation/LiveUpdateDM$TypingIndicatorListener;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public stopLiveUpdates()V
    .locals 1

    .line 199
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->liveUpdateDM:Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;

    if-eqz v0, :cond_0

    .line 200
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/LiveUpdateDM;->unregisterListener()V

    :cond_0
    return-void
.end method

.method public unregisterConversationVMCallback()V
    .locals 2

    const/4 v0, 0x0

    .line 226
    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->conversationVMCallback:Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;

    .line 227
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->setListener(Lcom/helpshift/conversation/activeconversation/ConversationDMListener;)V

    return-void
.end method
