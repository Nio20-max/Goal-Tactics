.class public Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;
.source "FollowupAcceptedMessageDM.java"


# instance fields
.field public referredMessageId:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;)V

    .line 28
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->referredMessageId:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->referredMessageId:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;I)V
    .locals 9

    .line 22
    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->FOLLOWUP_ACCEPTED:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-object v5, p5

    move/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ZLcom/helpshift/conversation/activeconversation/message/MessageType;I)V

    move-object v1, p6

    .line 23
    iput-object v1, v0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->referredMessageId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;
    .locals 1

    .line 79
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public isUISupportedMessage()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 1

    .line 33
    invoke-super {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 34
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;

    if-eqz v0, :cond_0

    .line 35
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;

    .line 36
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->referredMessageId:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->referredMessageId:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public send(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)V
    .locals 3

    .line 43
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getIssueId()Ljava/lang/String;

    move-result-object v0

    .line 44
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 49
    invoke-static {p1}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->getUserRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "body"

    const-string v2, "Accepted the follow-up"

    .line 50
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "type"

    const-string v2, "ra"

    .line 51
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->referredMessageId:Ljava/lang/String;

    const-string v2, "refers"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->getIssueSendMessageRoute(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2, v0}, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->makeNetworkRequest(Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/common/platform/network/Response;

    move-result-object p2

    .line 55
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getResponseParser()Lcom/helpshift/common/platform/network/ResponseParser;

    move-result-object v0

    .line 56
    iget-object p2, p2, Lcom/helpshift/common/platform/network/Response;->responseString:Ljava/lang/String;

    .line 57
    invoke-interface {v0, p2}, Lcom/helpshift/common/platform/network/ResponseParser;->parseFollowupAcceptedMessage(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;

    move-result-object p2

    .line 58
    invoke-virtual {p0, p2}, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 59
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    .line 60
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->serverId:Ljava/lang/String;

    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->serverId:Ljava/lang/String;

    .line 61
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p2}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p2

    invoke-interface {p2, p0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p2

    .line 64
    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->INVALID_AUTH_TOKEN:Lcom/helpshift/common/exception/NetworkException;

    if-eq v0, v1, :cond_0

    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->AUTH_TOKEN_NOT_PROVIDED:Lcom/helpshift/common/exception/NetworkException;

    if-ne v0, v1, :cond_1

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object v0

    iget-object v1, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    invoke-virtual {v0, p1, v1}, Lcom/helpshift/account/AuthenticationFailureDM;->notifyAuthenticationFailure(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/exception/ExceptionType;)V

    .line 68
    :cond_1
    throw p2

    .line 45
    :cond_2
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "FollowupAcceptedMessageDM send called with conversation in pre issue mode."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
