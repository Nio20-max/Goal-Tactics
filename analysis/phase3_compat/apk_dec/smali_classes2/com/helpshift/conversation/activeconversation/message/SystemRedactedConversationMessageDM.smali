.class public Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;
.source "SystemRedactedConversationMessageDM.java"


# instance fields
.field public contiguousRedactedConversationsCount:I


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;)V

    .line 17
    iget p1, p1, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;->contiguousRedactedConversationsCount:I

    iput p1, p0, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;->contiguousRedactedConversationsCount:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JI)V
    .locals 6

    .line 11
    sget-object v5, Lcom/helpshift/conversation/activeconversation/message/MessageType;->SYSTEM_CONVERSATION_REDACTED:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const-string v1, ""

    move-object v0, p0

    move-object v2, p1

    move-wide v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 12
    iput p4, p0, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;->contiguousRedactedConversationsCount:I

    return-void
.end method


# virtual methods
.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;
    .locals 1

    .line 22
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;

    move-result-object v0

    return-object v0
.end method
