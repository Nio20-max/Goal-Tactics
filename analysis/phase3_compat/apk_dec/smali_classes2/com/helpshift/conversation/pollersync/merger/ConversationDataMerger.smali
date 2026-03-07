.class public Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;
.super Ljava/lang/Object;
.source "ConversationDataMerger.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "HS_PollConvDataMerger"


# instance fields
.field private platform:Lcom/helpshift/common/platform/Platform;

.field private sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;->platform:Lcom/helpshift/common/platform/Platform;

    .line 31
    iput-object p2, p0, Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    return-void
.end method

.method private canMergeConversationProperties(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    const-string v0, "issue"

    .line 55
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "preissue"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "HS_PollConvDataMerger"

    const-string p2, "Not merging conversation data since remote type is preissue and local type is issue"

    .line 56
    invoke-static {p1, p2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method private mergeCommonConversationProperties(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    const-string v0, "HS_PollConvDataMerger"

    const-string v1, "Merging conversation properties"

    .line 64
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    .line 66
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    .line 67
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    .line 68
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->title:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->title:Ljava/lang/String;

    .line 69
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->publishId:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->publishId:Ljava/lang/String;

    .line 70
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdAt:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdAt:Ljava/lang/String;

    .line 71
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getEpochCreatedAtTime()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->epochCreatedAtTime:J

    .line 72
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->updatedAt:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->updatedAt:Ljava/lang/String;

    .line 73
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldIncrementMessageCount:Z

    iput-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldIncrementMessageCount:Z

    .line 74
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldAllowNewConversationCreation:Z

    iput-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldAllowNewConversationCreation:Z

    .line 75
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    iput-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    .line 76
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageCursor:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 77
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageCursor:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageCursor:Ljava/lang/String;

    .line 79
    :cond_0
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdRequestId:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 81
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdRequestId:Ljava/lang/String;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdRequestId:Ljava/lang/String;

    .line 84
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;->getIssueStateToUpdate(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/conversation/dto/IssueState;

    move-result-object p2

    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    return-void
.end method

.method private mergeIssueUniqueProperties(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 89
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    iput-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    .line 90
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->resolutionExpiryAt:Ljava/lang/Long;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->resolutionExpiryAt:Ljava/lang/Long;

    .line 91
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatExpiryAt:Ljava/lang/Long;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatExpiryAt:Ljava/lang/Long;

    .line 93
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    sget-object v1, Lcom/helpshift/conversation/states/ConversationCSATState;->SUBMITTED_SYNCED:Lcom/helpshift/conversation/states/ConversationCSATState;

    if-ne v0, v1, :cond_0

    .line 94
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    goto :goto_0

    .line 96
    :cond_0
    iget-object p2, p0, Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {p2, p1}, Lcom/helpshift/conversation/ConversationUtil;->isCSATTimerExpired(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 98
    sget-object p2, Lcom/helpshift/conversation/states/ConversationCSATState;->EXPIRED:Lcom/helpshift/conversation/states/ConversationCSATState;

    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public getIssueStateToUpdate(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/conversation/dto/IssueState;
    .locals 4

    .line 104
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 105
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 106
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    .line 110
    iget-boolean v2, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldAllowNewConversationCreation:Z

    if-eqz v2, :cond_0

    .line 111
    sget-object p1, Lcom/helpshift/conversation/dto/IssueState;->CLOSED:Lcom/helpshift/conversation/dto/IssueState;

    return-object p1

    .line 116
    :cond_0
    iget-boolean v2, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    const-string v3, "preissue"

    if-eqz v2, :cond_2

    .line 117
    sget-object p1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, p1, :cond_1

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 118
    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    :cond_1
    return-object v0

    .line 125
    :cond_2
    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v2, :cond_8

    .line 126
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 129
    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    goto :goto_1

    .line 132
    :cond_3
    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq p1, v1, :cond_7

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_EXPIRED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p1, v1, :cond_4

    goto :goto_0

    .line 138
    :cond_4
    iget-object v1, p0, Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v1, p2}, Lcom/helpshift/conversation/ConversationUtil;->isResolutionQuestionExpired(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result p2

    if-eqz p2, :cond_5

    .line 140
    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_EXPIRED:Lcom/helpshift/conversation/dto/IssueState;

    goto :goto_1

    .line 142
    :cond_5
    sget-object p2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p1, p2, :cond_6

    goto :goto_0

    .line 146
    :cond_6
    iget-object p2, p0, Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {p2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->shouldShowConversationResolutionQuestion()Z

    move-result p2

    if-nez p2, :cond_8

    .line 148
    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    goto :goto_1

    :cond_7
    :goto_0
    move-object v0, p1

    .line 152
    :cond_8
    :goto_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Updating conversation state from "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " to: "

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "HS_PollConvDataMerger"

    invoke-static {p2, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public mergeProperties(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 42
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;->canMergeConversationProperties(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 44
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;->mergeCommonConversationProperties(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 45
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 46
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;->mergeIssueUniqueProperties(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    :cond_0
    return-void
.end method
