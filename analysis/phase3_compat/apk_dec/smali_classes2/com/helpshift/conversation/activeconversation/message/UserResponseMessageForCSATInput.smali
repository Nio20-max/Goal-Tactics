.class public Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;
.super Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;
.source "UserResponseMessageForCSATInput.java"


# instance fields
.field public botInfo:Ljava/lang/String;

.field public isNewConversationStarted:Z

.field public messageSyncState:I

.field public optionData:Ljava/lang/String;

.field public rating:I

.field private referredMessageId:Ljava/lang/String;

.field public final referredMessageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;


# direct methods
.method public constructor <init>(Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;)V
    .locals 1

    .line 40
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;)V

    .line 18
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_CSAT_MESSAGE:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->referredMessageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    .line 41
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->botInfo:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->botInfo:Ljava/lang/String;

    .line 42
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->optionData:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->optionData:Ljava/lang/String;

    .line 43
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->referredMessageId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->referredMessageId:Ljava/lang/String;

    .line 44
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->isNewConversationStarted:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->isNewConversationStarted:Z

    .line 45
    iget v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->rating:I

    iput v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->rating:I

    .line 46
    iget p1, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->messageSyncState:I

    iput p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->messageSyncState:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;IZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 8

    move-object v7, p0

    .line 30
    sget-object v6, Lcom/helpshift/conversation/activeconversation/message/MessageType;->USER_RESP_FOR_CSAT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 18
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_CSAT_MESSAGE:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    iput-object v0, v7, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->referredMessageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    move-object/from16 v0, p8

    .line 31
    iput-object v0, v7, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->botInfo:Ljava/lang/String;

    move-object/from16 v0, p9

    .line 32
    iput-object v0, v7, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->optionData:Ljava/lang/String;

    move-object/from16 v0, p10

    .line 33
    iput-object v0, v7, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->referredMessageId:Ljava/lang/String;

    move v0, p7

    .line 34
    iput-boolean v0, v7, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->isNewConversationStarted:Z

    move v0, p6

    .line 35
    iput v0, v7, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->rating:I

    move/from16 v0, p11

    .line 36
    iput v0, v7, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->messageSyncState:I

    return-void
.end method


# virtual methods
.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->deepClone()Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->deepClone()Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    move-result-object v0

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;
    .locals 1

    .line 101
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;-><init>(Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->deepClone()Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    move-result-object v0

    return-object v0
.end method

.method protected getData()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 66
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 67
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->botInfo:Ljava/lang/String;

    const-string v2, "chatbot_info"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    iget-boolean v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->isNewConversationStarted:Z

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    const-string v2, "new_conv_started"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    iget-boolean v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->isNewConversationStarted:Z

    if-nez v1, :cond_0

    .line 71
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->optionData:Ljava/lang/String;

    const-string v2, "rating_data"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method protected getMessageTypeForRequest()Ljava/lang/String;
    .locals 1

    const-string v0, "rsp_txt_csat_msg_with_option_input"

    return-object v0
.end method

.method public getReferredMessageId()Ljava/lang/String;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->referredMessageId:Ljava/lang/String;

    return-object v0
.end method

.method public isUISupportedMessage()Z
    .locals 1

    .line 106
    iget-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->isNewConversationStarted:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 1

    .line 51
    invoke-super {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 52
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    if-eqz v0, :cond_0

    .line 54
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    .line 55
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->botInfo:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->botInfo:Ljava/lang/String;

    .line 56
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->optionData:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->optionData:Ljava/lang/String;

    .line 57
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->referredMessageId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->referredMessageId:Ljava/lang/String;

    .line 58
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->isNewConversationStarted:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->isNewConversationStarted:Z

    .line 59
    iget v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->rating:I

    iput v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->rating:I

    .line 60
    iget p1, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->messageSyncState:I

    iput p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->messageSyncState:I

    :cond_0
    return-void
.end method

.method protected bridge synthetic parseResponse(Lcom/helpshift/common/platform/network/Response;)Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;
    .locals 0

    .line 14
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->parseResponse(Lcom/helpshift/common/platform/network/Response;)Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    move-result-object p1

    return-object p1
.end method

.method protected parseResponse(Lcom/helpshift/common/platform/network/Response;)Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getResponseParser()Lcom/helpshift/common/platform/network/ResponseParser;

    move-result-object v0

    .line 96
    iget-object p1, p1, Lcom/helpshift/common/platform/network/Response;->responseString:Ljava/lang/String;

    invoke-interface {v0, p1}, Lcom/helpshift/common/platform/network/ResponseParser;->parseResponseMessageForCSATInput(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    move-result-object p1

    return-object p1
.end method

.method public send(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)V
    .locals 0

    .line 78
    invoke-super {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->send(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)V

    const/4 p1, 0x2

    .line 79
    iput p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->messageSyncState:I

    .line 80
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p1

    invoke-interface {p1, p0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void
.end method
