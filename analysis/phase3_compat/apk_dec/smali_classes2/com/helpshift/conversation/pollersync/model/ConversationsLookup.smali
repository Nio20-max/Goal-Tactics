.class public Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;
.super Ljava/lang/Object;
.source "ConversationsLookup.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;
    }
.end annotation


# instance fields
.field private final lookupByIssueId:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field private final lookupByPreIssueId:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field private lookupByPreIssueRequestId:Lcom/helpshift/util/ValuePair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/helpshift/util/ValuePair<",
            "Ljava/lang/String;",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field private pollerSyncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;",
            "Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;",
            ")V"
        }
    .end annotation

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->lookupByPreIssueId:Ljava/util/Map;

    .line 33
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->lookupByIssueId:Ljava/util/Map;

    .line 34
    iput-object p2, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->pollerSyncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    .line 35
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->populateLookup(Ljava/util/List;)V

    return-void
.end method

.method private populateLookup(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 39
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 43
    :cond_0
    invoke-static {p1}, Lcom/helpshift/conversation/ConversationUtil;->sortConversationsBasedOnCreatedAt(Ljava/util/List;)V

    .line 44
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 46
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 47
    iget-object v2, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->lookupByIssueId:Ljava/util/Map;

    iget-object v3, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 49
    :cond_2
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 50
    iget-object v2, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->lookupByPreIssueId:Ljava/util/Map;

    iget-object v3, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 53
    :cond_3
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->pollerSyncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    invoke-interface {v0}, Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;->getPendingRequestIdForPreissue()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 57
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 58
    new-instance v1, Lcom/helpshift/util/ValuePair;

    invoke-direct {v1, v0, p1}, Lcom/helpshift/util/ValuePair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->lookupByPreIssueRequestId:Lcom/helpshift/util/ValuePair;

    :cond_4
    return-void
.end method


# virtual methods
.method public find(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/util/ValuePair;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ")",
            "Lcom/helpshift/util/ValuePair<",
            "Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;"
        }
    .end annotation

    .line 70
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    .line 71
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    .line 72
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdRequestId:Ljava/lang/String;

    .line 77
    iget-object v2, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->lookupByIssueId:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 78
    iget-object p1, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->lookupByIssueId:Ljava/util/Map;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 79
    new-instance v0, Lcom/helpshift/util/ValuePair;

    sget-object v1, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;->SERVER_ID:Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    invoke-direct {v0, v1, p1}, Lcom/helpshift/util/ValuePair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->lookupByPreIssueId:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 82
    iget-object p1, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->lookupByPreIssueId:Ljava/util/Map;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 83
    new-instance v0, Lcom/helpshift/util/ValuePair;

    sget-object v1, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;->PREISSUE_ID:Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    invoke-direct {v0, v1, p1}, Lcom/helpshift/util/ValuePair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0

    .line 85
    :cond_1
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->lookupByPreIssueRequestId:Lcom/helpshift/util/ValuePair;

    if-eqz v0, :cond_2

    iget-object v0, v0, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 87
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 88
    iget-object p1, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->lookupByPreIssueRequestId:Lcom/helpshift/util/ValuePair;

    iget-object p1, p1, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 89
    new-instance v0, Lcom/helpshift/util/ValuePair;

    sget-object v1, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;->PREISSUE_REQUEST_ID:Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    invoke-direct {v0, v1, p1}, Lcom/helpshift/util/ValuePair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method
