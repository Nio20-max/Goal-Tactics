.class public Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/MessageDM;
.source "UserMessageDM.java"


# instance fields
.field private state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;


# direct methods
.method protected constructor <init>(Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 41
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V
    .locals 8

    .line 32
    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->USER_TEXT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v7}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ZLcom/helpshift/conversation/activeconversation/message/MessageType;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V
    .locals 8

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-object v5, p5

    move-object v7, p6

    .line 36
    invoke-direct/range {v0 .. v7}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ZLcom/helpshift/conversation/activeconversation/message/MessageType;)V

    return-void
.end method

.method private setStateAsUnsentRetryable()V
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->serverId:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->UNSENT_RETRYABLE:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 27
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;
    .locals 1

    .line 186
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 27
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    move-result-object v0

    return-object v0
.end method

.method protected getData()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 45
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    return-object v0
.end method

.method protected getMessageTypeForRequest()Ljava/lang/String;
    .locals 1

    const-string v0, "txt"

    return-object v0
.end method

.method public getReferredMessageId()Ljava/lang/String;
    .locals 1

    const-string v0, ""

    return-object v0
.end method

.method public getState()Lcom/helpshift/conversation/activeconversation/message/UserMessageState;
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    return-object v0
.end method

.method public isUISupportedMessage()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected parseResponse(Lcom/helpshift/common/platform/network/Response;)Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getResponseParser()Lcom/helpshift/common/platform/network/ResponseParser;

    move-result-object v0

    iget-object p1, p1, Lcom/helpshift/common/platform/network/Response;->responseString:Ljava/lang/String;

    invoke-interface {v0, p1}, Lcom/helpshift/common/platform/network/ResponseParser;->parseReadableUserMessage(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    move-result-object p1

    return-object p1
.end method

.method public send(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)V
    .locals 5

    const-string v0, "type"

    .line 58
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENDING:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    if-eq v1, v2, :cond_6

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    if-eq v1, v2, :cond_6

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->UNSENT_NOT_RETRYABLE:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    if-ne v1, v2, :cond_0

    goto/16 :goto_2

    .line 62
    :cond_0
    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENDING:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {p0, v1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    .line 65
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->isInPreIssueMode()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 66
    invoke-virtual {p0, p2}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->getPreIssueSendMessageRoute(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 69
    :cond_1
    invoke-virtual {p0, p2}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->getIssueSendMessageRoute(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)Ljava/lang/String;

    move-result-object v1

    .line 73
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->getData()Ljava/util/Map;

    move-result-object v2

    .line 74
    invoke-static {p1}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->getUserRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Ljava/util/HashMap;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    const-string v3, "body"

    .line 75
    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->body:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->getMessageTypeForRequest()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "refers"

    .line 77
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->getReferredMessageId()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    new-instance v3, Lcom/helpshift/common/platform/network/RequestData;

    invoke-direct {v3, v2}, Lcom/helpshift/common/platform/network/RequestData;-><init>(Ljava/util/Map;)V

    .line 80
    invoke-virtual {p0, v1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->getSendMessageNetwork(Ljava/lang/String;)Lcom/helpshift/common/domain/network/Network;

    move-result-object v1

    invoke-interface {v1, v3}, Lcom/helpshift/common/domain/network/Network;->makeRequest(Lcom/helpshift/common/platform/network/RequestData;)Lcom/helpshift/common/platform/network/Response;

    move-result-object v1

    .line 82
    invoke-virtual {p0, v1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->parseResponse(Lcom/helpshift/common/platform/network/Response;)Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    move-result-object v1

    .line 83
    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    iput-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    .line 86
    invoke-virtual {p0, v1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 87
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->serverId:Ljava/lang/String;

    iput-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->serverId:Ljava/lang/String;

    .line 90
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v2}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object v2

    invoke-interface {v2, p0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 93
    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iput-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    .line 96
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->notifyUpdated()V

    .line 99
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 101
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getIssueId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "id"

    .line 102
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getIssueId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    const-string v2, "txt"

    .line 104
    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getAnalyticConversationId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "acid"

    .line 108
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getAnalyticConversationId()Ljava/lang/String;

    move-result-object p2

    .line 107
    invoke-interface {v1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    :cond_3
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object p2

    sget-object v0, Lcom/helpshift/analytics/AnalyticsEventType;->MESSAGE_ADDED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {p2, v0, v1}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    .line 113
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object p2

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->body:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->userRepliedToConversation(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 131
    invoke-direct {p0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->setStateAsUnsentRetryable()V

    .line 132
    invoke-static {p1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1

    :catch_1
    move-exception p2

    .line 117
    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->INVALID_AUTH_TOKEN:Lcom/helpshift/common/exception/NetworkException;

    if-eq v0, v1, :cond_4

    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->AUTH_TOKEN_NOT_PROVIDED:Lcom/helpshift/common/exception/NetworkException;

    if-eq v0, v1, :cond_4

    .line 122
    iget-object p1, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v0, Lcom/helpshift/common/exception/NetworkException;->CONVERSATION_ARCHIVED:Lcom/helpshift/common/exception/NetworkException;

    if-eq p1, v0, :cond_5

    iget-object p1, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v0, Lcom/helpshift/common/exception/NetworkException;->USER_PRE_CONDITION_FAILED:Lcom/helpshift/common/exception/NetworkException;

    if-eq p1, v0, :cond_5

    .line 124
    invoke-direct {p0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->setStateAsUnsentRetryable()V

    goto :goto_1

    .line 119
    :cond_4
    invoke-direct {p0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->setStateAsUnsentRetryable()V

    .line 120
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object v0

    iget-object v1, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    invoke-virtual {v0, p1, v1}, Lcom/helpshift/account/AuthenticationFailureDM;->notifyAuthenticationFailure(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/exception/ExceptionType;)V

    .line 126
    :cond_5
    :goto_1
    invoke-static {p2}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1

    :cond_6
    :goto_2
    return-void
.end method

.method public setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V
    .locals 1

    .line 171
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    .line 172
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    if-eq v0, p1, :cond_0

    .line 175
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->notifyUpdated()V

    :cond_0
    return-void
.end method

.method public updateState(Z)V
    .locals 2

    .line 150
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->serverId:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 151
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENDING:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 155
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->UNSENT_RETRYABLE:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    goto :goto_0

    .line 158
    :cond_1
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->UNSENT_NOT_RETRYABLE:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    goto :goto_0

    .line 162
    :cond_2
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    :goto_0
    return-void
.end method
