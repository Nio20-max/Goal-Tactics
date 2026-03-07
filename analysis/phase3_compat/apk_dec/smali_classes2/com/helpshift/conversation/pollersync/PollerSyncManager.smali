.class public Lcom/helpshift/conversation/pollersync/PollerSyncManager;
.super Ljava/lang/Object;
.source "PollerSyncManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "HS_PollerSyncManager"


# instance fields
.field private conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

.field private dbDataChangeListener:Lcom/helpshift/conversation/pollersync/listener/PollerDataChangeListener;

.field private dbDataUpdater:Lcom/helpshift/conversation/pollersync/updater/PollerDataUpdater;

.field private imDataChangeListener:Lcom/helpshift/conversation/pollersync/listener/PollerDataChangeListener;

.field private imDataUpdater:Lcom/helpshift/conversation/pollersync/updater/PollerDataUpdater;

.field private syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;Lcom/helpshift/conversation/activeconversation/ConversationManager;)V
    .locals 1

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p5, p0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    .line 57
    iput-object p4, p0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    .line 58
    new-instance v0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;

    invoke-direct {v0, p2, p1, p3, p4}, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V

    iput-object v0, p0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->dbDataUpdater:Lcom/helpshift/conversation/pollersync/updater/PollerDataUpdater;

    .line 59
    new-instance p3, Lcom/helpshift/conversation/pollersync/updater/IMPollerDataUpdater;

    invoke-direct {p3, p2, p1, p4}, Lcom/helpshift/conversation/pollersync/updater/IMPollerDataUpdater;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V

    iput-object p3, p0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->imDataUpdater:Lcom/helpshift/conversation/pollersync/updater/PollerDataUpdater;

    .line 60
    new-instance p3, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;

    invoke-direct {p3, p5, p4}, Lcom/helpshift/conversation/pollersync/listener/DBPollerDataChangeListener;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V

    iput-object p3, p0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->dbDataChangeListener:Lcom/helpshift/conversation/pollersync/listener/PollerDataChangeListener;

    .line 62
    new-instance p3, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;

    invoke-direct {p3, p1, p2, p5, p4}, Lcom/helpshift/conversation/pollersync/listener/IMPollerDataChangeListener;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V

    iput-object p3, p0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->imDataChangeListener:Lcom/helpshift/conversation/pollersync/listener/PollerDataChangeListener;

    return-void
.end method

.method private createRemoteConversationsForIMDataUpdater(Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;"
        }
    .end annotation

    .line 214
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 216
    iget-object v1, p1, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;->updatedConversations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 217
    invoke-virtual {v2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->deepClone()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v3

    .line 219
    iget-object v4, p1, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;->messagesDiffMap:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/pollersync/model/MessagesDiff;

    if-eqz v2, :cond_0

    .line 221
    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    iget-object v5, v2, Lcom/helpshift/conversation/pollersync/model/MessagesDiff;->updatedMessages:Ljava/util/List;

    invoke-static {v5}, Lcom/helpshift/util/CloneUtil;->deepClone(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/helpshift/util/HSObservableList;->addAll(Ljava/util/Collection;)Z

    .line 222
    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    iget-object v2, v2, Lcom/helpshift/conversation/pollersync/model/MessagesDiff;->newMessages:Ljava/util/List;

    invoke-static {v2}, Lcom/helpshift/util/CloneUtil;->deepClone(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v4, v2}, Lcom/helpshift/util/HSObservableList;->addAll(Ljava/util/Collection;)Z

    .line 224
    :cond_0
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private dispatchListenerCallbacks(Lcom/helpshift/conversation/pollersync/listener/PollerDataChangeListener;Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;)V
    .locals 6

    if-eqz p1, :cond_4

    if-nez p2, :cond_0

    goto :goto_1

    .line 169
    :cond_0
    iget-object v0, p2, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;->existingConversations:Ljava/util/List;

    .line 170
    iget-object v1, p2, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;->updatedConversations:Ljava/util/List;

    .line 172
    new-instance v2, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;

    iget-object v3, p0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    invoke-direct {v2, v0, v3}, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;-><init>(Ljava/util/List;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V

    .line 176
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 178
    invoke-virtual {v2, v1}, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->find(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/util/ValuePair;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 185
    iget-object v3, v3, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 186
    invoke-interface {p1, v3, v1}, Lcom/helpshift/conversation/pollersync/listener/PollerDataChangeListener;->onConversationUpdated(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 190
    :cond_2
    iget-object v3, p2, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;->messagesDiffMap:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/pollersync/model/MessagesDiff;

    if-eqz v3, :cond_1

    .line 192
    iget-object v4, v3, Lcom/helpshift/conversation/pollersync/model/MessagesDiff;->newMessages:Ljava/util/List;

    .line 193
    invoke-static {v4}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 194
    invoke-interface {p1, v1, v4}, Lcom/helpshift/conversation/pollersync/listener/PollerDataChangeListener;->onMessagesAdded(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;)V

    .line 197
    :cond_3
    iget-object v1, v3, Lcom/helpshift/conversation/pollersync/model/MessagesDiff;->updatedMessages:Ljava/util/List;

    .line 198
    invoke-static {v1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 199
    iget-object v3, v3, Lcom/helpshift/conversation/pollersync/model/MessagesDiff;->existingMessages:Ljava/util/List;

    .line 200
    invoke-interface {p1, v3, v1}, Lcom/helpshift/conversation/pollersync/listener/PollerDataChangeListener;->onMessagesUpdated(Ljava/util/List;Ljava/util/List;)V

    goto :goto_0

    :cond_4
    :goto_1
    return-void
.end method

.method private divideIntoChunksIfNeeded(Ljava/util/List;Z)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;Z)",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;>;"
        }
    .end annotation

    if-nez p2, :cond_5

    .line 130
    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    .line 131
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    const/4 v1, 0x0

    .line 134
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 135
    iget-object v5, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-static {v5}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 136
    iget-object v5, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-interface {p2, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    :goto_1
    const/4 v1, 0x1

    goto :goto_2

    .line 140
    :cond_1
    iget-object v5, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-interface {p2, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 143
    :cond_2
    iget-object v5, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-static {v5}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 144
    iget-object v5, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-interface {v0, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    goto :goto_1

    .line 148
    :cond_3
    iget-object v3, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_4
    :goto_2
    if-eqz v1, :cond_5

    const-string p2, "HS_PollerSyncManager"

    const-string v0, "Found duplicate conversations in same response, will chunk the data for processing"

    .line 153
    invoke-static {p2, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->unflatten(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 158
    :cond_5
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 159
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p2
.end method

.method private filterAndSort(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;"
        }
    .end annotation

    .line 237
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    .line 238
    invoke-static {v0}, Lcom/helpshift/conversation/util/predicate/ConversationPredicates;->allMessagesAfterLastMessageInDbPredicate(Lcom/helpshift/conversation/activeconversation/ConversationManager;)Lcom/helpshift/util/Predicate;

    move-result-object v0

    .line 239
    invoke-static {p1, v0}, Lcom/helpshift/util/Filters;->filter(Ljava/util/List;Lcom/helpshift/util/Predicate;)Ljava/util/List;

    move-result-object p1

    .line 244
    invoke-static {p1}, Lcom/helpshift/conversation/ConversationUtil;->sortConversationsBasedOnCreatedAt(Ljava/util/List;)V

    return-object p1
.end method

.method private onConversationsSyncComplete(Ljava/util/List;Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;",
            "Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;",
            ")V"
        }
    .end annotation

    .line 256
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->clearRequestIdForPendingCreateConversationCalls(Ljava/util/List;)V

    .line 259
    iget-object p1, p2, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;->messagesDiffMap:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map$Entry;

    .line 260
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 261
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/helpshift/conversation/pollersync/model/MessagesDiff;

    .line 262
    iget-object v1, p0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iget-object p2, p2, Lcom/helpshift/conversation/pollersync/model/MessagesDiff;->updatedMessages:Ljava/util/List;

    invoke-virtual {v1, v0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->clearRequestIdForPendingSendMessageCalls(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private syncInternal(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;
        }
    .end annotation

    .line 94
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->dbDataUpdater:Lcom/helpshift/conversation/pollersync/updater/PollerDataUpdater;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/pollersync/updater/PollerDataUpdater;->updateData(Ljava/util/List;)Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;

    move-result-object v0

    .line 95
    iget-object v1, p0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->dbDataChangeListener:Lcom/helpshift/conversation/pollersync/listener/PollerDataChangeListener;

    invoke-direct {p0, v1, v0}, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->dispatchListenerCallbacks(Lcom/helpshift/conversation/pollersync/listener/PollerDataChangeListener;Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;)V

    .line 98
    iget-object v1, p0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    invoke-interface {v1}, Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 101
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->createRemoteConversationsForIMDataUpdater(Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;)Ljava/util/List;

    move-result-object v1

    .line 102
    invoke-static {v1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 103
    iget-object v2, p0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->imDataUpdater:Lcom/helpshift/conversation/pollersync/updater/PollerDataUpdater;

    invoke-interface {v2, v1}, Lcom/helpshift/conversation/pollersync/updater/PollerDataUpdater;->updateData(Ljava/util/List;)Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;

    move-result-object v1

    .line 104
    iget-object v2, p0, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->imDataChangeListener:Lcom/helpshift/conversation/pollersync/listener/PollerDataChangeListener;

    invoke-direct {p0, v2, v1}, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->dispatchListenerCallbacks(Lcom/helpshift/conversation/pollersync/listener/PollerDataChangeListener;Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;)V

    .line 108
    :cond_0
    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->onConversationsSyncComplete(Ljava/util/List;Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;)V

    return-void
.end method


# virtual methods
.method public sync(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;
        }
    .end annotation

    .line 76
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 80
    :cond_0
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->filterAndSort(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    .line 81
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 85
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->divideIntoChunksIfNeeded(Ljava/util/List;Z)Ljava/util/List;

    move-result-object p1

    .line 88
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 89
    invoke-direct {p0, p2}, Lcom/helpshift/conversation/pollersync/PollerSyncManager;->syncInternal(Ljava/util/List;)V

    goto :goto_0

    :cond_2
    return-void
.end method
