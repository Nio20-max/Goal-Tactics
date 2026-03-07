.class public Lcom/helpshift/conversation/activeconversation/model/Conversation;
.super Ljava/lang/Object;
.source "Conversation.java"

# interfaces
.implements Ljava/util/Observer;
.implements Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;
.implements Lcom/helpshift/util/HSCloneable;


# instance fields
.field public acid:Ljava/lang/String;

.field public conversationDMListener:Lcom/helpshift/conversation/activeconversation/ConversationDMListener;

.field public createdAt:Ljava/lang/String;

.field public createdRequestId:Ljava/lang/String;

.field public csatExpiryAt:Ljava/lang/Long;

.field public csatFeedback:Ljava/lang/String;

.field public csatRating:I

.field public csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

.field public enableMessageClickOnResolutionRejected:Z

.field public epochCreatedAtTime:J

.field public isAutoFilledPreIssue:Z

.field public isConversationEndedDelegateSent:Z

.field public isFeedbackBotEnabled:Z

.field public isInBetweenBotExecution:Z

.field public isRedacted:Z

.field public isStartNewConversationClicked:Z

.field public issueType:Ljava/lang/String;

.field public lastUserActivityTime:J

.field public localId:Ljava/lang/Long;

.field public localUUID:Ljava/lang/String;

.field public messageCursor:Ljava/lang/String;

.field public messageDMs:Lcom/helpshift/util/HSObservableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/helpshift/util/HSObservableList<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation
.end field

.field public preConversationServerId:Ljava/lang/String;

.field public publishId:Ljava/lang/String;

.field public resolutionExpiryAt:Ljava/lang/Long;

.field public serverId:Ljava/lang/String;

.field public shouldAllowNewConversationCreation:Z

.field public shouldIncrementMessageCount:Z

.field public smartIntentIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public smartIntentTreeId:Ljava/lang/String;

.field public smartIntentUserQuery:Ljava/lang/String;

.field public state:Lcom/helpshift/conversation/dto/IssueState;

.field public title:Ljava/lang/String;

.field public final unansweredRequestForReopenMessageDMs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;",
            ">;"
        }
    .end annotation
.end field

.field public updatedAt:Ljava/lang/String;

.field public userLocalId:J

.field public wasFullPrivacyEnabledAtCreation:Z


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Lcom/helpshift/util/HSObservableList;

    invoke-direct {v0}, Lcom/helpshift/util/HSObservableList;-><init>()V

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    .line 48
    sget-object v0, Lcom/helpshift/conversation/states/ConversationCSATState;->NONE:Lcom/helpshift/conversation/states/ConversationCSATState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    .line 90
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    .line 91
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    .line 92
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    .line 93
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localUUID:Ljava/lang/String;

    .line 94
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->title:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->title:Ljava/lang/String;

    .line 95
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 96
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    .line 97
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    .line 98
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentIds:Ljava/util/List;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentIds:Ljava/util/List;

    .line 99
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentTreeId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentTreeId:Ljava/lang/String;

    .line 100
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentUserQuery:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentUserQuery:Ljava/lang/String;

    .line 101
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->updatedAt:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->updatedAt:Ljava/lang/String;

    .line 102
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->publishId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->publishId:Ljava/lang/String;

    .line 103
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageCursor:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageCursor:Ljava/lang/String;

    .line 104
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldIncrementMessageCount:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldIncrementMessageCount:Z

    .line 105
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isConversationEndedDelegateSent:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isConversationEndedDelegateSent:Z

    .line 106
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    .line 107
    iget v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatRating:I

    iput v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatRating:I

    .line 108
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatFeedback:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatFeedback:Ljava/lang/String;

    .line 109
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isStartNewConversationClicked:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isStartNewConversationClicked:Z

    .line 110
    iget-wide v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    iput-wide v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    .line 111
    iget-wide v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->lastUserActivityTime:J

    iput-wide v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->lastUserActivityTime:J

    .line 112
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdRequestId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdRequestId:Ljava/lang/String;

    .line 113
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->wasFullPrivacyEnabledAtCreation:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->wasFullPrivacyEnabledAtCreation:Z

    .line 114
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    .line 115
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInBetweenBotExecution:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInBetweenBotExecution:Z

    .line 116
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdAt:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdAt:Ljava/lang/String;

    .line 117
    iget-wide v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->epochCreatedAtTime:J

    iput-wide v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->epochCreatedAtTime:J

    .line 118
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->enableMessageClickOnResolutionRejected:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->enableMessageClickOnResolutionRejected:Z

    .line 119
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->conversationDMListener:Lcom/helpshift/conversation/activeconversation/ConversationDMListener;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->conversationDMListener:Lcom/helpshift/conversation/activeconversation/ConversationDMListener;

    .line 120
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isAutoFilledPreIssue:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isAutoFilledPreIssue:Z

    .line 121
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->unansweredRequestForReopenMessageDMs:Ljava/util/Map;

    .line 122
    invoke-static {v0}, Lcom/helpshift/util/CloneUtil;->deepClone(Ljava/util/Map;)Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->unansweredRequestForReopenMessageDMs:Ljava/util/Map;

    .line 123
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->resolutionExpiryAt:Ljava/lang/Long;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->resolutionExpiryAt:Ljava/lang/Long;

    .line 124
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatExpiryAt:Ljava/lang/Long;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatExpiryAt:Ljava/lang/Long;

    .line 125
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-static {v0}, Lcom/helpshift/util/CloneUtil;->deepClone(Lcom/helpshift/util/HSObservableList;)Lcom/helpshift/util/HSObservableList;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    .line 126
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    .line 127
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldAllowNewConversationCreation:Z

    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldAllowNewConversationCreation:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/helpshift/conversation/dto/IssueState;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Lcom/helpshift/util/HSObservableList;

    invoke-direct {v0}, Lcom/helpshift/util/HSObservableList;-><init>()V

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    .line 48
    sget-object v0, Lcom/helpshift/conversation/states/ConversationCSATState;->NONE:Lcom/helpshift/conversation/states/ConversationCSATState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    .line 77
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->title:Ljava/lang/String;

    .line 78
    iput-object p3, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdAt:Ljava/lang/String;

    .line 79
    iput-wide p4, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->epochCreatedAtTime:J

    .line 80
    iput-object p6, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->updatedAt:Ljava/lang/String;

    .line 81
    iput-object p7, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->publishId:Ljava/lang/String;

    .line 82
    iput-object p8, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageCursor:Ljava/lang/String;

    .line 83
    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 84
    iput-object p9, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    .line 85
    iput-object p10, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    .line 86
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->unansweredRequestForReopenMessageDMs:Ljava/util/Map;

    return-void
.end method

.method private updateStateBasedOnMessages()V
    .locals 3

    .line 191
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    if-eqz v0, :cond_3

    .line 192
    invoke-virtual {v0}, Lcom/helpshift/util/HSObservableList;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 193
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v0}, Lcom/helpshift/util/HSObservableList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    :goto_0
    if-ltz v0, :cond_1

    .line 195
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    .line 196
    invoke-virtual {v1, v0}, Lcom/helpshift/util/HSObservableList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    instance-of v2, v1, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;

    if-nez v2, :cond_0

    instance-of v2, v1, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    if-eqz v2, :cond_1

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 200
    :cond_1
    instance-of v0, v1, Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;

    if-eqz v0, :cond_2

    .line 201
    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    goto :goto_1

    .line 203
    :cond_2
    instance-of v0, v1, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;

    if-eqz v0, :cond_3

    .line 204
    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 1

    .line 234
    new-instance v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;-><init>(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 32
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->deepClone()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    return-object v0
.end method

.method public getAnalyticConversationId()Ljava/lang/String;
    .locals 1

    .line 172
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    return-object v0
.end method

.method public getCreatedAt()Ljava/lang/String;
    .locals 1

    .line 146
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdAt:Ljava/lang/String;

    return-object v0
.end method

.method public getEpochCreatedAtTime()J
    .locals 2

    .line 138
    iget-wide v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->epochCreatedAtTime:J

    return-wide v0
.end method

.method public getIssueId()Ljava/lang/String;
    .locals 1

    .line 162
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    return-object v0
.end method

.method public getPreIssueId()Ljava/lang/String;
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    return-object v0
.end method

.method public isInPreIssueMode()Z
    .locals 2

    .line 157
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    const-string v1, "preissue"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isIssueInProgress()Z
    .locals 1

    .line 210
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    invoke-static {v0}, Lcom/helpshift/conversation/ConversationUtil;->isInProgressState(Lcom/helpshift/conversation/dto/IssueState;)Z

    move-result v0

    return v0
.end method

.method public isLocalPreIssue()Z
    .locals 1

    .line 229
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public registerMessagesObserver()V
    .locals 2

    .line 218
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v0}, Lcom/helpshift/util/HSObservableList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 219
    invoke-virtual {v1, p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->addObserver(Ljava/util/Observer;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setCreatedAt(Ljava/lang/String;)V
    .locals 1

    .line 150
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 151
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdAt:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public setEpochCreatedAtTime(J)V
    .locals 0

    .line 142
    iput-wide p1, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->epochCreatedAtTime:J

    return-void
.end method

.method public setListener(Lcom/helpshift/conversation/activeconversation/ConversationDMListener;)V
    .locals 0

    .line 214
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->conversationDMListener:Lcom/helpshift/conversation/activeconversation/ConversationDMListener;

    return-void
.end method

.method public setLocalId(J)V
    .locals 1

    .line 131
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    .line 132
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {p1}, Lcom/helpshift/util/HSObservableList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 133
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setMessageDMs(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 177
    new-instance v0, Lcom/helpshift/util/HSObservableList;

    invoke-direct {v0, p1}, Lcom/helpshift/util/HSObservableList;-><init>(Ljava/util/List;)V

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    .line 178
    invoke-direct {p0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->updateStateBasedOnMessages()V

    return-void
.end method

.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 1

    .line 183
    instance-of p2, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    if-eqz p2, :cond_0

    .line 184
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 185
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {p2, p1}, Lcom/helpshift/util/HSObservableList;->indexOf(Ljava/lang/Object;)I

    move-result p2

    .line 186
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v0, p2, p1}, Lcom/helpshift/util/HSObservableList;->setAndNotifyObserver(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method
