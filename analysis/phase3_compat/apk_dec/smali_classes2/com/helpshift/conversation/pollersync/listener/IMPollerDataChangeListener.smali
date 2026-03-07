.class public Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;
.super Ljava/lang/Object;
.source "IMPollerDataChangeListener.java"

# interfaces
.implements Lcom/helpshift/conversation/pollersync/listener/PollerDataChangeListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "HS_IMPollChangeListener"


# instance fields
.field private conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

.field private domain:Lcom/helpshift/common/domain/Domain;

.field private platform:Lcom/helpshift/common/platform/Platform;

.field private syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->domain:Lcom/helpshift/common/domain/Domain;

    .line 41
    iput-object p2, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->platform:Lcom/helpshift/common/platform/Platform;

    .line 42
    iput-object p3, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    .line 43
    iput-object p4, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    return-void
.end method

.method private addDependenciesOnNewMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 129
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 130
    iget-object v1, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v2, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 140
    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    if-eqz v1, :cond_0

    .line 141
    move-object v1, v0

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {v1, v2}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    goto :goto_1

    .line 143
    :cond_0
    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    if-eqz v1, :cond_1

    .line 144
    move-object v1, v0

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {v1, v2}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    goto :goto_1

    .line 146
    :cond_1
    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    if-eqz v1, :cond_2

    .line 147
    move-object v1, v0

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {v1, v2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    .line 151
    :cond_2
    :goto_1
    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->addObserver(Ljava/util/Observer;)V

    goto :goto_0

    :cond_3
    return-void
.end method

.method private getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;
    .locals 1

    .line 260
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    invoke-interface {v0}, Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v0

    return-object v0
.end method

.method private initializeMessagesForActiveConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 157
    invoke-static {p2}, Lcom/helpshift/conversation/ConversationUtil;->sortMessagesBasedOnCreatedAt(Ljava/util/List;)V

    .line 158
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iget-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInBetweenBotExecution:Z

    .line 159
    invoke-virtual {v0, p2, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->evaluateBotExecutionState(Ljava/util/List;Z)Z

    move-result v0

    iput-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInBetweenBotExecution:Z

    .line 162
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v0, p2}, Lcom/helpshift/util/HSObservableList;->addAll(Ljava/util/Collection;)Z

    .line 166
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 168
    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;

    if-eqz v1, :cond_0

    .line 169
    move-object v1, v0

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;

    iget-object v2, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v1, v2}, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;->downloadThumbnailImage(Lcom/helpshift/common/platform/Platform;)V

    goto :goto_1

    .line 171
    :cond_0
    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    if-eqz v1, :cond_1

    .line 174
    iget-object v1, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->shouldEnableMessagesClick(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v1

    .line 175
    move-object v2, v0

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    invoke-virtual {v2, v1}, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->setAttachmentButtonClickable(Z)V

    goto :goto_1

    .line 177
    :cond_1
    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    if-eqz v1, :cond_2

    .line 178
    move-object v1, v0

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    iget-object v2, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v1, v2}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->downloadImage(Lcom/helpshift/common/platform/Platform;)V

    .line 180
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateAcceptedRequestForReopenMessageDMs(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    goto :goto_0

    :cond_3
    return-void
.end method

.method private onPreIssueCreated()V
    .locals 2

    const-string v0, "HS_IMPollChangeListener"

    const-string v1, "Preissue created from poller response"

    .line 251
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    invoke-direct {p0}, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 256
    :cond_0
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->handleIdempotentPreIssueCreationSuccess()V

    return-void
.end method

.method private onPreIssueToIssueConversion()V
    .locals 2

    const-string v0, "HS_IMPollChangeListener"

    const-string v1, "Preissue converted to issue"

    .line 188
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    invoke-direct {p0}, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 193
    :cond_0
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->startLiveUpdates()V

    return-void
.end method

.method private onStateChangedForIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 5

    .line 222
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 223
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 225
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "State changed for issue from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " to: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "HS_IMPollChangeListener"

    invoke-static {v3, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    invoke-direct {p0}, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v2

    if-nez v2, :cond_0

    return-void

    .line 231
    :cond_0
    iget-object v3, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v3, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessagesOnIssueStatusUpdate(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 235
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result p2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz p2, :cond_1

    .line 236
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 238
    :goto_0
    sget-object p2, Lcom/helpshift/conversation/dto/IssueState;->COMPLETED_ISSUE_CREATED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, p2, :cond_2

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    :goto_1
    if-nez v3, :cond_3

    if-nez p1, :cond_4

    .line 242
    :cond_3
    invoke-virtual {v2, v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->onIssueStatusChange(Lcom/helpshift/conversation/dto/IssueState;)V

    :cond_4
    return-void
.end method

.method private onStateChangedForPreIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 3

    .line 202
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "State changed for preissue to: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HS_IMPollChangeListener"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    invoke-direct {p0}, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 208
    :cond_0
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 209
    iget-object v2, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v2, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessagesOnIssueStatusUpdate(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 211
    invoke-virtual {v0, v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->onIssueStatusChange(Lcom/helpshift/conversation/dto/IssueState;)V

    return-void
.end method


# virtual methods
.method public onConversationUpdated(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    const-string v0, "HS_IMPollChangeListener"

    const-string v1, "onConversationUpdated called"

    .line 49
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    invoke-direct {p0}, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v1

    if-nez v1, :cond_0

    const-string p1, "No in-memory conversation found for updates, hence returning!"

    .line 52
    invoke-static {v0, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 56
    :cond_0
    invoke-virtual {v1, p2}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->isActiveConversationEqual(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string p1, "Updates received for different conversation than in-memory, hence returning!"

    .line 60
    invoke-static {v0, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 64
    :cond_1
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    invoke-interface {v0}, Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;->getPendingRequestIdForPreissue()Ljava/lang/String;

    move-result-object v0

    .line 65
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdRequestId:Ljava/lang/String;

    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 68
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 69
    invoke-direct {p0}, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->onPreIssueCreated()V

    .line 72
    :cond_2
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    if-nez v0, :cond_3

    .line 73
    invoke-direct {p0}, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->onPreIssueToIssueConversion()V

    .line 76
    :cond_3
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, v1, :cond_5

    .line 77
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 78
    invoke-direct {p0, p2}, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->onStateChangedForPreIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    goto :goto_0

    .line 81
    :cond_4
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->onStateChangedForIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    :cond_5
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

    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onMessagesAdded called with size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HS_IMPollChangeListener"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->addDependenciesOnNewMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;)V

    .line 114
    invoke-direct {p0}, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 116
    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->isActiveConversationEqual(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->initializeMessagesForActiveConversation(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;)V

    goto :goto_0

    .line 122
    :cond_0
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v0, p2}, Lcom/helpshift/util/HSObservableList;->addAll(Ljava/util/Collection;)Z

    .line 124
    :goto_0
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->evaluateBotControlMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/Collection;)V

    return-void
.end method

.method public onMessagesUpdated(Ljava/util/List;Ljava/util/List;)V
    .locals 1
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

    .line 88
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onMessagesUpdated called with size: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "HS_IMPollChangeListener"

    invoke-static {v0, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 92
    instance-of v0, p2, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    if-eqz v0, :cond_0

    .line 93
    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {p2, v0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    goto :goto_0

    .line 95
    :cond_0
    instance-of v0, p2, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    if-eqz v0, :cond_1

    .line 96
    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {p2, v0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    goto :goto_0

    .line 98
    :cond_1
    instance-of v0, p2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    if-eqz v0, :cond_2

    .line 99
    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {p2, v0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    goto :goto_0

    .line 103
    :cond_2
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->notifyUpdated()V

    goto :goto_0

    :cond_3
    return-void
.end method
