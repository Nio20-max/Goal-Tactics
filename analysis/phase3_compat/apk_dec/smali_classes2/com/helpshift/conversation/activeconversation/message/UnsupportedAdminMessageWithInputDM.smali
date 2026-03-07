.class public Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;
.super Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;
.source "UnsupportedAdminMessageWithInputDM.java"


# instance fields
.field public botInfo:Ljava/lang/String;

.field public input:Ljava/lang/String;

.field public type:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;)V
    .locals 1

    .line 39
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;)V

    .line 40
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->type:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->type:Ljava/lang/String;

    .line 41
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->botInfo:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->botInfo:Ljava/lang/String;

    .line 42
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->input:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->input:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    move-object v8, p0

    .line 32
    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->UNSUPPORTED_ADMIN_MESSAGE_WITH_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V

    move-object/from16 v0, p7

    .line 33
    iput-object v0, v8, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->type:Ljava/lang/String;

    move-object/from16 v0, p8

    .line 34
    iput-object v0, v8, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->botInfo:Ljava/lang/String;

    move-object/from16 v0, p9

    .line 35
    iput-object v0, v8, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->input:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;

    move-result-object v0

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;
    .locals 1

    .line 63
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;

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

    .line 47
    invoke-super {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 48
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;

    if-eqz v0, :cond_0

    .line 49
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;

    .line 50
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->type:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->type:Ljava/lang/String;

    .line 51
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->botInfo:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->botInfo:Ljava/lang/String;

    .line 52
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->input:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->input:Ljava/lang/String;

    :cond_0
    return-void
.end method
