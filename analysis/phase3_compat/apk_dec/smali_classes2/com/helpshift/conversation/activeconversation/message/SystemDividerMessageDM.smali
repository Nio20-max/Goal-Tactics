.class public Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;
.source "SystemDividerMessageDM.java"


# instance fields
.field public final showDividerText:Z


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;)V

    .line 14
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;->showDividerText:Z

    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;->showDividerText:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JZ)V
    .locals 6

    .line 8
    sget-object v5, Lcom/helpshift/conversation/activeconversation/message/MessageType;->SYSTEM_DIVIDER:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const-string v1, ""

    move-object v0, p0

    move-object v2, p1

    move-wide v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 9
    iput-boolean p4, p0, Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;->showDividerText:Z

    return-void
.end method


# virtual methods
.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;
    .locals 1

    .line 19
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 3
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;

    move-result-object v0

    return-object v0
.end method
