.class public Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;
.source "AdminBotControlMessageDM.java"


# instance fields
.field public actionType:Ljava/lang/String;

.field public botInfo:Ljava/lang/String;

.field public hasNextBot:Z


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;)V
    .locals 1

    .line 32
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;)V

    .line 33
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->actionType:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->actionType:Ljava/lang/String;

    .line 34
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->botInfo:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->botInfo:Ljava/lang/String;

    .line 35
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->hasNextBot:Z

    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->hasNextBot:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    move-object v8, p0

    .line 26
    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_BOT_CONTROL:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V

    move-object/from16 v0, p7

    .line 27
    iput-object v0, v8, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->actionType:Ljava/lang/String;

    move-object/from16 v0, p8

    .line 28
    iput-object v0, v8, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->botInfo:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;
    .locals 1

    .line 55
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;

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

    .line 40
    invoke-super {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 41
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;

    if-eqz v0, :cond_0

    .line 42
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;

    .line 43
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->actionType:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->actionType:Ljava/lang/String;

    .line 44
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->botInfo:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->botInfo:Ljava/lang/String;

    :cond_0
    return-void
.end method
