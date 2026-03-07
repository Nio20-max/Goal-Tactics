.class public Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;
.source "FollowupRejectedMessageDM.java"


# static fields
.field public static final REASON_CONVERSATION_FILING:I = 0x1

.field public static final REASON_MESSAGE_FILING:I = 0x3

.field public static final REASON_OPEN_ISSUE:I = 0x2

.field public static final REASON_OPEN_PRE_ISSUE:I = 0x4


# instance fields
.field public openConversationId:Ljava/lang/String;

.field public reason:I

.field public referredMessageId:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;)V
    .locals 1

    .line 38
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;)V

    .line 39
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->referredMessageId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->referredMessageId:Ljava/lang/String;

    .line 40
    iget v0, p1, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->reason:I

    iput v0, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->reason:I

    .line 41
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->openConversationId:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->openConversationId:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;I)V
    .locals 9

    .line 33
    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->FOLLOWUP_REJECTED:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-object v5, p5

    move/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ZLcom/helpshift/conversation/activeconversation/message/MessageType;I)V

    move-object v1, p6

    .line 34
    iput-object v1, v0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->referredMessageId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;
    .locals 1

    .line 99
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 17
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 17
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;

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

    .line 46
    invoke-super {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 47
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;

    if-eqz v0, :cond_0

    .line 48
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;

    .line 49
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->referredMessageId:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->referredMessageId:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public send(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)V
    .locals 4

    .line 55
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getIssueId()Ljava/lang/String;

    move-result-object v0

    .line 56
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 62
    iget v1, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->reason:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "reason"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->openConversationId:Ljava/lang/String;

    if-eqz v1, :cond_0

    const-string v2, "open_issue_id"

    .line 64
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    :cond_0
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v1}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/helpshift/common/platform/Jsonifier;->jsonify(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 67
    invoke-static {p1}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->getUserRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Ljava/util/HashMap;

    move-result-object v1

    const-string v2, "body"

    const-string v3, "Rejected the follow-up"

    .line 68
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "type"

    const-string v3, "rj"

    .line 69
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->referredMessageId:Ljava/lang/String;

    const-string v3, "refers"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "message_meta"

    .line 71
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->getIssueSendMessageRoute(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2, v1}, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->makeNetworkRequest(Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/common/platform/network/Response;

    move-result-object p2

    .line 75
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getResponseParser()Lcom/helpshift/common/platform/network/ResponseParser;

    move-result-object v0

    .line 76
    iget-object p2, p2, Lcom/helpshift/common/platform/network/Response;->responseString:Ljava/lang/String;

    .line 77
    invoke-interface {v0, p2}, Lcom/helpshift/common/platform/network/ResponseParser;->parseFollowupRejectedMessage(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;

    move-result-object p2

    .line 78
    invoke-virtual {p0, p2}, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 79
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    .line 80
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->serverId:Ljava/lang/String;

    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->serverId:Ljava/lang/String;

    .line 81
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p2}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p2

    invoke-interface {p2, p0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p2

    .line 84
    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->INVALID_AUTH_TOKEN:Lcom/helpshift/common/exception/NetworkException;

    if-eq v0, v1, :cond_1

    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->AUTH_TOKEN_NOT_PROVIDED:Lcom/helpshift/common/exception/NetworkException;

    if-ne v0, v1, :cond_2

    .line 86
    :cond_1
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object v0

    iget-object v1, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    invoke-virtual {v0, p1, v1}, Lcom/helpshift/account/AuthenticationFailureDM;->notifyAuthenticationFailure(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/exception/ExceptionType;)V

    .line 88
    :cond_2
    throw p2

    .line 57
    :cond_3
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "FollowupRejectedMessageDM send called with conversation in pre issue mode."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
