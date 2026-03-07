.class public Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/MessageDM;
.source "RequestForReopenMessageDM.java"


# instance fields
.field private isAnswered:Z


# direct methods
.method protected constructor <init>(Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 17
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->isAnswered:Z

    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->isAnswered:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V
    .locals 8

    .line 11
    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->REQUEST_FOR_REOPEN:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-wide v3, p4

    move-object v5, p6

    invoke-direct/range {v0 .. v7}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ZLcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 12
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->serverId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 5
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;
    .locals 1

    .line 44
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 5
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public isAnswered()Z
    .locals 1

    .line 21
    iget-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->isAnswered:Z

    return v0
.end method

.method public isUISupportedMessage()Z
    .locals 1

    .line 39
    iget-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->isAnswered:Z

    return v0
.end method

.method public setAnswered(Z)V
    .locals 0

    .line 25
    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->isAnswered:Z

    return-void
.end method

.method public setAnsweredAndNotify(Z)V
    .locals 1

    .line 30
    iget-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->isAnswered:Z

    if-ne v0, p1, :cond_0

    return-void

    .line 33
    :cond_0
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->setAnswered(Z)V

    .line 34
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->notifyUpdated()V

    return-void
.end method
