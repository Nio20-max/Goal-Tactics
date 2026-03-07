.class public Lcom/helpshift/conversation/pollersync/model/MessagesLookup;
.super Ljava/lang/Object;
.source "MessagesLookup.java"


# instance fields
.field private final lookupByRequestId:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation
.end field

.field private final lookupByServerId:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;",
            "Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;",
            ")V"
        }
    .end annotation

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/helpshift/conversation/pollersync/model/MessagesLookup;->lookupByServerId:Ljava/util/Map;

    .line 26
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/helpshift/conversation/pollersync/model/MessagesLookup;->lookupByRequestId:Ljava/util/Map;

    .line 27
    invoke-direct {p0, p3, p1, p2}, Lcom/helpshift/conversation/pollersync/model/MessagesLookup;->populateLookup(Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;)V

    return-void
.end method

.method private populateLookup(Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 33
    invoke-static {p3}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 38
    :cond_0
    invoke-interface {p1, p2}, Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;->getMessagesLocalIdToPendingRequestIdMap(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/util/Map;

    move-result-object p1

    .line 40
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 41
    iget-object v0, p3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 42
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/model/MessagesLookup;->lookupByServerId:Ljava/util/Map;

    iget-object v1, p3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    :cond_2
    iget-object v0, p3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    if-eqz v0, :cond_1

    .line 46
    iget-object v0, p3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    if-eqz p1, :cond_1

    .line 48
    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 49
    iget-object v1, p0, Lcom/helpshift/conversation/pollersync/model/MessagesLookup;->lookupByRequestId:Ljava/util/Map;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v1, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_3
    return-void
.end method


# virtual methods
.method public find(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 2

    .line 62
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    .line 63
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->createdRequestId:Ljava/lang/String;

    .line 68
    iget-object v1, p0, Lcom/helpshift/conversation/pollersync/model/MessagesLookup;->lookupByServerId:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 69
    iget-object p1, p0, Lcom/helpshift/conversation/pollersync/model/MessagesLookup;->lookupByServerId:Ljava/util/Map;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    goto :goto_0

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/model/MessagesLookup;->lookupByRequestId:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 72
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/model/MessagesLookup;->lookupByRequestId:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method
