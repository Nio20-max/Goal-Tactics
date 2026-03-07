.class public Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;
.super Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;
.source "AdminMessageWithTextInputDM.java"


# instance fields
.field public input:Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

.field public final isMessageEmpty:Z


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;)V
    .locals 1

    .line 24
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;)V

    .line 25
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->isMessageEmpty:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->isMessageEmpty:Z

    .line 26
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->deepClone()Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;IZ)V
    .locals 9

    move-object v8, p0

    .line 18
    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_TEXT_WITH_TEXT_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 19
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    move-object v0, v7

    move-object/from16 v1, p7

    move/from16 v2, p9

    move-object/from16 v3, p10

    move-object/from16 v4, p11

    move-object/from16 v5, p8

    move/from16 v6, p12

    invoke-direct/range {v0 .. v6}, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;-><init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    iput-object v7, v8, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    move/from16 v0, p13

    .line 20
    iput-boolean v0, v8, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->isMessageEmpty:Z

    return-void
.end method


# virtual methods
.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    move-result-object v0

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;
    .locals 1

    .line 46
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    move-result-object v0

    return-object v0
.end method

.method public merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 1

    .line 31
    invoke-super {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 32
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    if-eqz v0, :cond_0

    .line 33
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    .line 34
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    :cond_0
    return-void
.end method

.method public setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V
    .locals 0

    .line 40
    invoke-super {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 41
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    invoke-virtual {p2, p1}, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->setDependencies(Lcom/helpshift/common/domain/Domain;)V

    return-void
.end method
