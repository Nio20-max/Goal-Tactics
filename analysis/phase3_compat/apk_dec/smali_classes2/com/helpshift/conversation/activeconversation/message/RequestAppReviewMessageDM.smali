.class public Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/MessageDM;
.source "RequestAppReviewMessageDM.java"


# instance fields
.field public isAnswered:Z

.field public isReviewButtonClickable:Z


# direct methods
.method public constructor <init>(Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;)V
    .locals 1

    .line 30
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 31
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->isAnswered:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->isAnswered:Z

    .line 32
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->isReviewButtonClickable:Z

    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->isReviewButtonClickable:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Z)V
    .locals 8

    .line 23
    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->REQUESTED_APP_REVIEW:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-wide v3, p4

    move-object v5, p6

    invoke-direct/range {v0 .. v7}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ZLcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 24
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->serverId:Ljava/lang/String;

    .line 25
    iput-boolean p7, p0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->isAnswered:Z

    const/4 p1, 0x1

    .line 26
    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->isReviewButtonClickable:Z

    return-void
.end method


# virtual methods
.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;
    .locals 1

    .line 98
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public handleAcceptedReviewSuccess(Lcom/helpshift/common/platform/Platform;)V
    .locals 1

    const/4 v0, 0x0

    .line 73
    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->isReviewButtonClickable:Z

    const/4 v0, 0x1

    .line 76
    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->isAnswered:Z

    .line 77
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->notifyUpdated()V

    .line 79
    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p1

    invoke-interface {p1, p0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void
.end method

.method public handleRequestReviewClick(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;
    .locals 10

    .line 42
    iget-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->isAnswered:Z

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    const/4 v0, 0x0

    .line 46
    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->setIsReviewButtonClickable(Z)V

    .line 48
    invoke-static {p2}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object v0

    .line 49
    iget-object v1, v0, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    .line 50
    iget-object v0, v0, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 51
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->SYSTEM:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v1, "mobile"

    const-string v2, ""

    invoke-direct {v7, v1, v2, v0}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    .line 52
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;

    iget-object v8, p0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->serverId:Ljava/lang/String;

    const/4 v9, 0x1

    const-string v3, "Accepted review request"

    move-object v2, v0

    invoke-direct/range {v2 .. v9}, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;I)V

    .line 55
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->conversationLocalId:Ljava/lang/Long;

    iput-object v1, v0, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 56
    invoke-virtual {v0, p1, p2}, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 58
    invoke-interface {p2}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p2

    invoke-interface {p2, v0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 61
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string v1, "type"

    const-string v2, "conversation"

    .line 62
    invoke-interface {p2, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object v1

    sget-object v2, Lcom/helpshift/analytics/AnalyticsEventType;->REVIEWED_APP:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {v1, v2, p2}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    .line 66
    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object p1

    const-string p2, "User reviewed the app"

    invoke-virtual {p1, p2}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->userRepliedToConversation(Ljava/lang/String;)V

    return-object v0
.end method

.method public isUISupportedMessage()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 1

    .line 84
    invoke-super {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 85
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;

    if-eqz v0, :cond_0

    .line 86
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;

    .line 87
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->isAnswered:Z

    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->isAnswered:Z

    :cond_0
    return-void
.end method

.method public setIsReviewButtonClickable(Z)V
    .locals 0

    .line 36
    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->isReviewButtonClickable:Z

    .line 37
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->notifyUpdated()V

    return-void
.end method
