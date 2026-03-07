.class public Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;
.source "ConfirmationRejectedMessageDM.java"


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;I)V
    .locals 9

    .line 30
    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->CONFIRMATION_REJECTED:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-object v5, p5

    move v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ZLcom/helpshift/conversation/activeconversation/message/MessageType;I)V

    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;
    .locals 1

    .line 116
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 26
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 26
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;

    move-result-object v0

    return-object v0
.end method

.method getSendMessageNetwork(Ljava/lang/String;)Lcom/helpshift/common/domain/network/Network;
    .locals 7

    .line 39
    new-instance v1, Lcom/helpshift/common/domain/network/POSTNetwork;

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v1, p1, v0, v2}, Lcom/helpshift/common/domain/network/POSTNetwork;-><init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 40
    new-instance v6, Lcom/helpshift/common/domain/network/IdempotentNetwork;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->getIdempotentPolicy()Lcom/helpshift/common/domain/idempotent/IdempotentPolicy;

    move-result-object v3

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->localId:Ljava/lang/Long;

    .line 41
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move-object v0, v6

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/domain/network/IdempotentNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/idempotent/IdempotentPolicy;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    new-instance p1, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {p1, v6, v0}, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 43
    new-instance v0, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;

    invoke-direct {v0, p1}, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 44
    new-instance p1, Lcom/helpshift/common/domain/network/UserPreConditionsFailedNetwork;

    invoke-direct {p1, v0}, Lcom/helpshift/common/domain/network/UserPreConditionsFailedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 45
    new-instance v0, Lcom/helpshift/common/domain/network/GuardAgainstConversationReOpenExpiryNetwork;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v0, p1, v1}, Lcom/helpshift/common/domain/network/GuardAgainstConversationReOpenExpiryNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 47
    new-instance p1, Lcom/helpshift/common/domain/network/GuardAgainstConversationArchivalNetwork;

    invoke-direct {p1, v0}, Lcom/helpshift/common/domain/network/GuardAgainstConversationArchivalNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 48
    new-instance v0, Lcom/helpshift/common/domain/network/FailedAPICallNetworkDecorator;

    invoke-direct {v0, p1}, Lcom/helpshift/common/domain/network/FailedAPICallNetworkDecorator;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 49
    new-instance p1, Lcom/helpshift/common/domain/network/GuardOKNetwork;

    invoke-direct {p1, v0}, Lcom/helpshift/common/domain/network/GuardOKNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    return-object p1
.end method

.method public isUISupportedMessage()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method makeNetworkRequest(Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/common/platform/network/Response;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/helpshift/common/platform/network/Response;"
        }
    .end annotation

    .line 56
    :try_start_0
    invoke-super {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;->makeNetworkRequest(Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/common/platform/network/Response;

    move-result-object p1
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 64
    iget-object p2, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v0, Lcom/helpshift/common/exception/NetworkException;->CONVERSATION_REOPEN_EXPIRED:Lcom/helpshift/common/exception/NetworkException;

    if-ne p2, v0, :cond_0

    const/4 p2, 0x3

    .line 65
    invoke-virtual {p0, p2}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->updateSyncStatusIntoMemoryAndDB(I)V

    .line 67
    :cond_0
    throw p1
.end method

.method public send(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)V
    .locals 3

    .line 74
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getIssueId()Ljava/lang/String;

    move-result-object v0

    .line 75
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 80
    invoke-static {p1}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->getUserRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Ljava/util/HashMap;

    move-result-object v0

    .line 81
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->body:Ljava/lang/String;

    const-string v2, "body"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "type"

    const-string v2, "ncr"

    .line 82
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "refers"

    const-string v2, ""

    .line 83
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->getIssueSendMessageRoute(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2, v0}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->makeNetworkRequest(Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/common/platform/network/Response;

    move-result-object p2

    .line 87
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getResponseParser()Lcom/helpshift/common/platform/network/ResponseParser;

    move-result-object v0

    .line 88
    iget-object p2, p2, Lcom/helpshift/common/platform/network/Response;->responseString:Ljava/lang/String;

    .line 89
    invoke-interface {v0, p2}, Lcom/helpshift/common/platform/network/ResponseParser;->parseConfirmationRejectedMessageDM(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;

    move-result-object p2

    .line 92
    invoke-virtual {p0, p2}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 93
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->serverId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->serverId:Ljava/lang/String;

    .line 94
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    .line 96
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->notifyUpdated()V

    .line 98
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p2}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p2

    invoke-interface {p2, p0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p2

    .line 101
    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->INVALID_AUTH_TOKEN:Lcom/helpshift/common/exception/NetworkException;

    if-eq v0, v1, :cond_0

    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->AUTH_TOKEN_NOT_PROVIDED:Lcom/helpshift/common/exception/NetworkException;

    if-ne v0, v1, :cond_1

    .line 103
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object v0

    iget-object v1, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    invoke-virtual {v0, p1, v1}, Lcom/helpshift/account/AuthenticationFailureDM;->notifyAuthenticationFailure(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/exception/ExceptionType;)V

    .line 105
    :cond_1
    throw p2

    .line 76
    :cond_2
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "ConfirmationRejectedMessageDM send called with conversation in pre issue mode."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
