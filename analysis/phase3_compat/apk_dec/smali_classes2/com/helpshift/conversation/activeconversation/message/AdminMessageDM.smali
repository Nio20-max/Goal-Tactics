.class public Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/MessageDM;
.source "AdminMessageDM.java"


# direct methods
.method protected constructor <init>(Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V
    .locals 8

    .line 8
    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_TEXT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-wide v3, p4

    move-object v5, p6

    invoke-direct/range {v0 .. v7}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ZLcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 9
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->serverId:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V
    .locals 8

    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-wide v3, p4

    move-object v5, p6

    move-object v7, p7

    .line 14
    invoke-direct/range {v0 .. v7}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ZLcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 15
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->serverId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;
    .locals 1

    .line 29
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 5
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 5
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public isUISupportedMessage()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
