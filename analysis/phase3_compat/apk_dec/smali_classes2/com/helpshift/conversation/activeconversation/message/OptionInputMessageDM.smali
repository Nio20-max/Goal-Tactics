.class public Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;
.source "OptionInputMessageDM.java"


# instance fields
.field public final input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

.field public final referredMessageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;


# direct methods
.method public constructor <init>(Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;)V
    .locals 7

    .line 22
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->body:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->getCreatedAt()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->getEpochCreatedAtTime()J

    move-result-wide v3

    iget-object v5, p1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v6, Lcom/helpshift/conversation/activeconversation/message/MessageType;->OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 24
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->serverId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->serverId:Ljava/lang/String;

    .line 25
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    .line 26
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->referredMessageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    .line 27
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->conversationLocalId:Ljava/lang/Long;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->conversationLocalId:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;)V
    .locals 7

    .line 31
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;->body:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;->getCreatedAt()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;->getEpochCreatedAtTime()J

    move-result-wide v3

    iget-object v5, p1, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v6, Lcom/helpshift/conversation/activeconversation/message/MessageType;->OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 33
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;->serverId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->serverId:Ljava/lang/String;

    .line 34
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    .line 35
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->referredMessageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    .line 36
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;->conversationLocalId:Ljava/lang/Long;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->conversationLocalId:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;)V
    .locals 7

    .line 13
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->body:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->getCreatedAt()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->getEpochCreatedAtTime()J

    move-result-wide v3

    iget-object v5, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v6, Lcom/helpshift/conversation/activeconversation/message/MessageType;->OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 15
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->serverId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->serverId:Ljava/lang/String;

    .line 16
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    .line 17
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->referredMessageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    .line 18
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->conversationLocalId:Ljava/lang/Long;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->conversationLocalId:Ljava/lang/Long;

    return-void
.end method

.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;)V
    .locals 1

    .line 40
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;)V

    .line 41
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->deepClone()Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    .line 42
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->referredMessageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->referredMessageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    return-void
.end method


# virtual methods
.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 7
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;
    .locals 1

    .line 47
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;
    .locals 1

    .line 7
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 7
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;

    move-result-object v0

    return-object v0
.end method
