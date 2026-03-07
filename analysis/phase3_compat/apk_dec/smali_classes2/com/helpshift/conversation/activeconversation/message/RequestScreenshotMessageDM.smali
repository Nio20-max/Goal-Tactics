.class public Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/MessageDM;
.source "RequestScreenshotMessageDM.java"


# instance fields
.field public isAnswered:Z

.field private isAttachmentButtonClickable:Z

.field private isImageWhiteListed:Ljava/lang/Boolean;


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;)V
    .locals 1

    .line 22
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 23
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isAnswered:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isAnswered:Z

    .line 24
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isAttachmentButtonClickable:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isAttachmentButtonClickable:Z

    .line 25
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isImageWhiteListed:Ljava/lang/Boolean;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isImageWhiteListed:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Z)V
    .locals 8

    .line 15
    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->REQUESTED_SCREENSHOT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-wide v3, p4

    move-object v5, p6

    invoke-direct/range {v0 .. v7}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ZLcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 16
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->serverId:Ljava/lang/String;

    .line 17
    iput-boolean p7, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isAnswered:Z

    const/4 p1, 0x1

    .line 18
    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isAttachmentButtonClickable:Z

    return-void
.end method


# virtual methods
.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 7
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;
    .locals 1

    .line 68
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 7
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public isAttachmentAllowed()Z
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isImageWhiteListed:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 35
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->isImageWhiteListed()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isImageWhiteListed:Ljava/lang/Boolean;

    .line 38
    :cond_0
    iget-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isAnswered:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isImageWhiteListed:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isAttachmentButtonClickable()Z
    .locals 1

    .line 29
    iget-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isAnswered:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isAttachmentButtonClickable:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isUISupportedMessage()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 1

    .line 54
    invoke-super {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 55
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    if-eqz v0, :cond_0

    .line 56
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    .line 57
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isAnswered:Z

    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isAnswered:Z

    :cond_0
    return-void
.end method

.method public setAttachmentButtonClickable(Z)V
    .locals 0

    .line 42
    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isAttachmentButtonClickable:Z

    .line 43
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->notifyUpdated()V

    return-void
.end method

.method public setIsAnswered(Lcom/helpshift/common/platform/Platform;Z)V
    .locals 0

    .line 47
    iput-boolean p2, p0, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isAnswered:Z

    .line 48
    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p1

    invoke-interface {p1, p0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 49
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->notifyUpdated()V

    return-void
.end method
