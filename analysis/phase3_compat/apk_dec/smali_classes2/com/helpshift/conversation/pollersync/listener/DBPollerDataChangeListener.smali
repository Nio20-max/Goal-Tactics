.class public Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;
.super Ljava/lang/Object;
.source "DBPollerDataChangeListener.java"

# interfaces
.implements Lcom/helpshift/conversation/pollersync/listener/PollerDataChangeListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "HS_DBPollChangeListener"


# instance fields
.field private conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

.field private syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;


# direct methods
.method public constructor <init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    .line 40
    iput-object p2, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    return-void
.end method

.method private checkAndUpdateMessageUnreadCount(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 169
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    invoke-interface {v0}, Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 170
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->isVisibleOnUI()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 175
    :cond_0
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 179
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result p1

    const/4 v1, 0x1

    if-eqz p1, :cond_2

    sget-object p1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, p1, :cond_1

    sget-object p1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, p1, :cond_1

    sget-object p1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, p1, :cond_1

    sget-object p1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_EXPIRED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, p1, :cond_2

    .line 184
    :cond_1
    iget-object p1, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p1, p2, v1, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->setShouldIncrementMessageCount(Lcom/helpshift/conversation/activeconversation/model/Conversation;ZZ)V

    goto :goto_0

    .line 186
    :cond_2
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 187
    iget-object p1, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->setShouldIncrementMessageCount(Lcom/helpshift/conversation/activeconversation/model/Conversation;ZZ)V

    :cond_3
    :goto_0
    return-void
.end method

.method private checkToReopenConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;)V
    .locals 8

    .line 194
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    invoke-interface {v0}, Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;->getActiveConversationFromStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 195
    iget-object v1, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    invoke-interface {v1}, Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;->getCurrentConversationViewState()I

    move-result v5

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 199
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v0, 0x1

    move-object v6, v1

    const/4 v7, 0x1

    goto :goto_1

    .line 203
    :cond_0
    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    move-object v6, v0

    goto :goto_0

    :cond_1
    move-object v6, v1

    :goto_0
    const/4 v7, 0x0

    .line 206
    :goto_1
    iget-object v2, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    move-object v3, p1

    move-object v4, p2

    invoke-virtual/range {v2 .. v7}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->checkAndReopen(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;ILjava/lang/String;Z)V

    return-void
.end method

.method private getRfrMessage(Ljava/util/List;)Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)",
            "Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;"
        }
    .end annotation

    .line 114
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    .line 115
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 116
    instance-of v2, v1, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    if-eqz v2, :cond_0

    .line 117
    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    return-object v1

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private onCSATStateChanged(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 128
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    sget-object v1, Lcom/helpshift/conversation/states/ConversationCSATState;->EXPIRED:Lcom/helpshift/conversation/states/ConversationCSATState;

    if-ne v0, v1, :cond_0

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    sget-object v0, Lcom/helpshift/conversation/states/ConversationCSATState;->SUBMITTED_SYNCED:Lcom/helpshift/conversation/states/ConversationCSATState;

    if-eq p1, v0, :cond_0

    .line 130
    iget-object p1, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendCSATExpiryEvent(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    :cond_0
    return-void
.end method

.method private onIssueDirectlyCreatedFromPreIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    const-string v0, "HS_DBPollChangeListener"

    const-string v1, "Preissue creation skipped, issue created directly - idempotent case."

    .line 223
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendConversationPostedEvent(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-void
.end method

.method private onPreIssueCreated(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    const-string v0, "HS_DBPollChangeListener"

    const-string v1, "Preissue created from poller response"

    .line 215
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->handlePreIssueCreationSuccess(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-void
.end method

.method private onStateChanged(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 3

    .line 141
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 142
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "State changed for issue from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " to: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "HS_DBPollChangeListener"

    invoke-static {v2, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->COMPLETED_ISSUE_CREATED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v1, :cond_0

    .line 145
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendConversationPostedEvent(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    goto :goto_0

    .line 147
    :cond_0
    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v1, :cond_2

    .line 148
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    if-nez v0, :cond_1

    .line 151
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendConfirmationAcceptedMessageAndDelegates(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 153
    :cond_1
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->handleConversationEnded(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    goto :goto_0

    .line 155
    :cond_2
    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_EXPIRED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v1, :cond_3

    .line 156
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendResolutionQuestionExpiryEvent(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 157
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->handleConversationEnded(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    goto :goto_0

    .line 159
    :cond_3
    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, v1, :cond_4

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->CLOSED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v1, :cond_5

    .line 160
    :cond_4
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->handleConversationEnded(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 164
    :cond_5
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->checkAndUpdateMessageUnreadCount(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-void
.end method


# virtual methods
.method public onConversationUpdated(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    const-string v0, "HS_DBPollChangeListener"

    const-string v1, "onConversationUpdated called"

    .line 46
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, v1, :cond_0

    .line 48
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->onStateChanged(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 51
    :cond_0
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    if-eq v0, v1, :cond_1

    .line 52
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->onCSATStateChanged(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 55
    :cond_1
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    invoke-interface {v0}, Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;->getPendingRequestIdForPreissue()Ljava/lang/String;

    move-result-object v0

    .line 56
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    if-eqz v0, :cond_3

    iget-object p1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdRequestId:Ljava/lang/String;

    .line 58
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 59
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 60
    invoke-direct {p0, p2}, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->onPreIssueCreated(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    goto :goto_0

    .line 63
    :cond_2
    invoke-direct {p0, p2}, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->onIssueDirectlyCreatedFromPreIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public onMessagesAdded(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 88
    invoke-static {p2}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 91
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onMessagesAdded called with size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HS_DBPollChangeListener"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 94
    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    if-eqz v1, :cond_1

    .line 95
    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    .line 96
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->isAnswered()Z

    move-result p2

    if-nez p2, :cond_2

    .line 97
    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->checkToReopenConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;)V

    goto :goto_0

    .line 105
    :cond_1
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v1, :cond_2

    .line 106
    invoke-direct {p0, p2}, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->getRfrMessage(Ljava/util/List;)Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    move-result-object p2

    if-eqz p2, :cond_2

    .line 107
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->isAnswered()Z

    move-result v0

    if-nez v0, :cond_2

    .line 108
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->checkToReopenConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onMessagesUpdated(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 71
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onMessagesUpdated called with size: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "HS_DBPollChangeListener"

    invoke-static {v0, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 73
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 74
    iget-boolean v1, v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isRedacted:Z

    if-eqz v1, :cond_0

    .line 75
    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;

    if-eqz v1, :cond_1

    .line 76
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 78
    :cond_1
    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    if-eqz v1, :cond_0

    .line 79
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 83
    :cond_2
    iget-object p2, p0, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p2, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->clearRedactedAttachmentsResources(Ljava/util/List;)V

    return-void
.end method
