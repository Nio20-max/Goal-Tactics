.class public Lcom/helpshift/conversation/pollersync/updater/IMPollerDataUpdater;
.super Ljava/lang/Object;
.source "IMPollerDataUpdater.java"

# interfaces
.implements Lcom/helpshift/conversation/pollersync/updater/PollerDataUpdater;


# static fields
.field private static final TAG:Ljava/lang/String; = "HS_IMPollerDataUpdater"


# instance fields
.field private conversationDataMerger:Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;

.field private messagesDataMerger:Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;

.field private syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V
    .locals 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p3, p0, Lcom/helpshift/conversation/pollersync/updater/IMPollerDataUpdater;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    .line 39
    new-instance v0, Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;

    .line 40
    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object p2

    invoke-direct {v0, p1, p2}, Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;)V

    iput-object v0, p0, Lcom/helpshift/conversation/pollersync/updater/IMPollerDataUpdater;->conversationDataMerger:Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;

    .line 41
    new-instance p1, Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;

    invoke-direct {p1, p3}, Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;-><init>(Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V

    iput-object p1, p0, Lcom/helpshift/conversation/pollersync/updater/IMPollerDataUpdater;->messagesDataMerger:Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;

    return-void
.end method


# virtual methods
.method public updateData(Ljava/util/List;)Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;)",
            "Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;"
        }
    .end annotation

    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Starting with updating the fetched data in-memory, conversations size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HS_IMPollerDataUpdater"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 48
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 49
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 51
    iget-object v4, p0, Lcom/helpshift/conversation/pollersync/updater/IMPollerDataUpdater;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    invoke-interface {v4}, Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;->getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v4

    if-nez v4, :cond_0

    const-string p1, "In-memory conversation not alive, returning!"

    .line 53
    invoke-static {v1, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1

    .line 57
    :cond_0
    invoke-virtual {v4}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getAllConversations()Ljava/util/List;

    move-result-object v4

    .line 58
    invoke-static {v4}, Lcom/helpshift/util/CloneUtil;->deepClone(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v5

    .line 59
    new-instance v6, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;

    iget-object v7, p0, Lcom/helpshift/conversation/pollersync/updater/IMPollerDataUpdater;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    invoke-direct {v6, v4, v7}, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;-><init>(Ljava/util/List;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V

    .line 62
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 64
    invoke-virtual {v6, v4}, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->find(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/util/ValuePair;

    move-result-object v7

    if-eqz v7, :cond_1

    const-string v8, "Matching conversation found in-memory, processing as updated conversation"

    .line 67
    invoke-static {v1, v8}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    iget-object v7, v7, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v7, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 69
    iget-object v8, p0, Lcom/helpshift/conversation/pollersync/updater/IMPollerDataUpdater;->conversationDataMerger:Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;

    invoke-virtual {v8, v7, v4}, Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;->mergeProperties(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 70
    iget-object v8, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-static {v8}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 71
    iget-object v8, p0, Lcom/helpshift/conversation/pollersync/updater/IMPollerDataUpdater;->messagesDataMerger:Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;

    iget-object v9, v7, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    iget-object v4, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v8, v7, v9, v4}, Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;->mergeMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;Ljava/util/List;)Lcom/helpshift/conversation/pollersync/model/MessagesDiff;

    move-result-object v4

    .line 74
    invoke-interface {v3, v7, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    :cond_2
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 80
    :cond_3
    new-instance p1, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;

    invoke-direct {p1, v5, v0, v2, v3}, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/Map;)V

    return-object p1
.end method
