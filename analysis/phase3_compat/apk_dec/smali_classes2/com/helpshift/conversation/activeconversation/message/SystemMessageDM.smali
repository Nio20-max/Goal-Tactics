.class public Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/MessageDM;
.source "SystemMessageDM.java"


# direct methods
.method protected constructor <init>(Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/MessageType;)V
    .locals 8

    .line 10
    new-instance v5, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->SYSTEM:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v1, "mobile"

    const-string v2, ""

    invoke-direct {v5, v1, v2, v0}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ZLcom/helpshift/conversation/activeconversation/message/MessageType;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 7
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;
    .locals 1

    .line 26
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 7
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public isUISupportedMessage()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
