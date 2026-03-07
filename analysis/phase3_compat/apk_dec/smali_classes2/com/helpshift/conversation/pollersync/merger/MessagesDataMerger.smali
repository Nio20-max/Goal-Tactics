.class public Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;
.super Ljava/lang/Object;
.source "MessagesDataMerger.java"


# instance fields
.field private syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    return-void
.end method

.method private deriveMessagePropertiesForNewMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 0

    .line 57
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object p1, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    return-void
.end method

.method private mergeProperties(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 0

    .line 61
    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void
.end method


# virtual methods
.method public mergeMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;Ljava/util/List;)Lcom/helpshift/conversation/pollersync/model/MessagesDiff;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)",
            "Lcom/helpshift/conversation/pollersync/model/MessagesDiff;"
        }
    .end annotation

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 34
    invoke-static {p2}, Lcom/helpshift/util/CloneUtil;->deepClone(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v2

    .line 36
    new-instance v3, Lcom/helpshift/conversation/pollersync/model/MessagesLookup;

    iget-object v4, p0, Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    invoke-direct {v3, p1, p2, v4}, Lcom/helpshift/conversation/pollersync/model/MessagesLookup;-><init>(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V

    .line 38
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 39
    invoke-virtual {v3, p3}, Lcom/helpshift/conversation/pollersync/model/MessagesLookup;->find(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object v4

    if-nez v4, :cond_0

    .line 42
    invoke-direct {p0, p1, p3}, Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;->deriveMessagePropertiesForNewMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 43
    invoke-interface {v0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 47
    :cond_0
    invoke-direct {p0, v4, p3}, Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;->mergeProperties(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 48
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 52
    :cond_1
    new-instance p1, Lcom/helpshift/conversation/pollersync/model/MessagesDiff;

    invoke-direct {p1, v2, v0, v1}, Lcom/helpshift/conversation/pollersync/model/MessagesDiff;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-object p1
.end method
