.class public Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;
.source "UserSmartIntentMessageDM.java"


# instance fields
.field public intentLabels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;)V
    .locals 1

    .line 27
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;)V

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->intentLabels:Ljava/util/List;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->intentLabels:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "J",
            "Lcom/helpshift/conversation/activeconversation/message/Author;",
            ")V"
        }
    .end annotation

    .line 13
    sget-object v6, Lcom/helpshift/conversation/activeconversation/message/MessageType;->USER_SMART_INTENT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const-string v1, ""

    move-object v0, p0

    move-object v2, p2

    move-wide v3, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 14
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->intentLabels:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;
    .locals 1

    .line 33
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 1

    .line 19
    invoke-super {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 20
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;

    if-eqz v0, :cond_0

    .line 21
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;

    .line 22
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->intentLabels:Ljava/util/List;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->intentLabels:Ljava/util/List;

    :cond_0
    return-void
.end method
