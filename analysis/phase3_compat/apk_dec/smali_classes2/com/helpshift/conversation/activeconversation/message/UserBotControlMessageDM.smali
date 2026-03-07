.class public Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;
.source "UserBotControlMessageDM.java"


# instance fields
.field public actionType:Ljava/lang/String;

.field public botInfo:Ljava/lang/String;

.field public reason:Ljava/lang/String;

.field public refersMessageId:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;)V
    .locals 1

    .line 56
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;)V

    .line 57
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->actionType:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->actionType:Ljava/lang/String;

    .line 58
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->reason:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->reason:Ljava/lang/String;

    .line 59
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->botInfo:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->botInfo:Ljava/lang/String;

    .line 60
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->refersMessageId:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->refersMessageId:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 10

    move-object v9, p0

    .line 48
    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->USER_BOT_CONTROL:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-object v5, p5

    move/from16 v8, p10

    invoke-direct/range {v0 .. v8}, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ZLcom/helpshift/conversation/activeconversation/message/MessageType;I)V

    move-object/from16 v0, p6

    .line 49
    iput-object v0, v9, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->actionType:Ljava/lang/String;

    move-object/from16 v0, p7

    .line 50
    iput-object v0, v9, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->reason:Ljava/lang/String;

    move-object/from16 v0, p8

    .line 51
    iput-object v0, v9, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->botInfo:Ljava/lang/String;

    move-object/from16 v0, p9

    .line 52
    iput-object v0, v9, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->refersMessageId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 26
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;
    .locals 1

    .line 139
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 26
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;

    move-result-object v0

    return-object v0
.end method

.method getSendMessageNetwork(Ljava/lang/String;)Lcom/helpshift/common/domain/network/Network;
    .locals 7

    .line 77
    new-instance v1, Lcom/helpshift/common/domain/network/POSTNetwork;

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v1, p1, v0, v2}, Lcom/helpshift/common/domain/network/POSTNetwork;-><init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 78
    new-instance v6, Lcom/helpshift/common/domain/network/IdempotentNetwork;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->getIdempotentPolicy()Lcom/helpshift/common/domain/idempotent/IdempotentPolicy;

    move-result-object v3

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->localId:Ljava/lang/Long;

    .line 79
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move-object v0, v6

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/domain/network/IdempotentNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/idempotent/IdempotentPolicy;Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    new-instance p1, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {p1, v6, v0}, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 81
    new-instance v0, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;

    invoke-direct {v0, p1}, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 82
    new-instance p1, Lcom/helpshift/common/domain/network/UserPreConditionsFailedNetwork;

    invoke-direct {p1, v0}, Lcom/helpshift/common/domain/network/UserPreConditionsFailedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 83
    new-instance v0, Lcom/helpshift/common/domain/network/GuardAgainstConversationReOpenExpiryNetwork;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v0, p1, v1}, Lcom/helpshift/common/domain/network/GuardAgainstConversationReOpenExpiryNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 85
    new-instance p1, Lcom/helpshift/common/domain/network/GuardAgainstConversationArchivalNetwork;

    invoke-direct {p1, v0}, Lcom/helpshift/common/domain/network/GuardAgainstConversationArchivalNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 86
    new-instance v0, Lcom/helpshift/common/domain/network/FailedAPICallNetworkDecorator;

    invoke-direct {v0, p1}, Lcom/helpshift/common/domain/network/FailedAPICallNetworkDecorator;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 87
    new-instance p1, Lcom/helpshift/common/domain/network/GuardOKNetwork;

    invoke-direct {p1, v0}, Lcom/helpshift/common/domain/network/GuardOKNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    return-object p1
.end method

.method public isUISupportedMessage()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 1

    .line 65
    invoke-super {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 66
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;

    if-eqz v0, :cond_0

    .line 67
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;

    .line 68
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->actionType:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->actionType:Ljava/lang/String;

    .line 69
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->reason:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->reason:Ljava/lang/String;

    .line 70
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->botInfo:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->botInfo:Ljava/lang/String;

    .line 71
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->refersMessageId:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->refersMessageId:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public send(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)V
    .locals 3

    .line 93
    invoke-static {p1}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->getUserRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "origin"

    const-string v2, "mobile"

    .line 94
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->actionType:Ljava/lang/String;

    const-string v2, "type"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->reason:Ljava/lang/String;

    const-string v2, "chatbot_cancelled_reason"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->body:Ljava/lang/String;

    const-string v2, "body"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->botInfo:Ljava/lang/String;

    const-string v2, "chatbot_info"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->refersMessageId:Ljava/lang/String;

    const-string v2, "refers"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->isInPreIssueMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 103
    invoke-virtual {p0, p2}, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->getPreIssueSendMessageRoute(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 106
    :cond_0
    invoke-virtual {p0, p2}, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->getIssueSendMessageRoute(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)Ljava/lang/String;

    move-result-object p2

    .line 111
    :goto_0
    :try_start_0
    invoke-virtual {p0, p2, v0}, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->makeNetworkRequest(Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/common/platform/network/Response;

    move-result-object p1
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p2}, Lcom/helpshift/common/platform/Platform;->getResponseParser()Lcom/helpshift/common/platform/network/ResponseParser;

    move-result-object p2

    .line 122
    iget-object p1, p1, Lcom/helpshift/common/platform/network/Response;->responseString:Ljava/lang/String;

    const/4 v0, 0x0

    .line 123
    invoke-interface {p2, p1, v0}, Lcom/helpshift/common/platform/network/ResponseParser;->parseBotControlMessage(Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;

    .line 125
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 126
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->serverId:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->serverId:Ljava/lang/String;

    .line 129
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p1

    invoke-interface {p1, p0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void

    :catch_0
    move-exception p2

    .line 114
    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->AUTH_TOKEN_NOT_PROVIDED:Lcom/helpshift/common/exception/NetworkException;

    if-eq v0, v1, :cond_1

    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->INVALID_AUTH_TOKEN:Lcom/helpshift/common/exception/NetworkException;

    if-ne v0, v1, :cond_2

    .line 116
    :cond_1
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object v0

    iget-object v1, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    invoke-virtual {v0, p1, v1}, Lcom/helpshift/account/AuthenticationFailureDM;->notifyAuthenticationFailure(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/exception/ExceptionType;)V

    .line 118
    :cond_2
    throw p2
.end method
