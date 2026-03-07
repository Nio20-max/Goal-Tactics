.class Lcom/helpshift/conversation/domainmodel/ConversationController$PollerSyncDataProviderImpl;
.super Ljava/lang/Object;
.source "ConversationController.java"

# interfaces
.implements Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/conversation/domainmodel/ConversationController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PollerSyncDataProviderImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/domainmodel/ConversationController;


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/domainmodel/ConversationController;)V
    .locals 0

    .line 876
    iput-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController$PollerSyncDataProviderImpl;->this$0:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/helpshift/conversation/domainmodel/ConversationController;Lcom/helpshift/conversation/domainmodel/ConversationController$1;)V
    .locals 0

    .line 876
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/domainmodel/ConversationController$PollerSyncDataProviderImpl;-><init>(Lcom/helpshift/conversation/domainmodel/ConversationController;)V

    return-void
.end method


# virtual methods
.method public getActiveConversationFromStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 1

    .line 902
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController$PollerSyncDataProviderImpl;->this$0:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getActiveConversationFromStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    return-object v0
.end method

.method public getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;
    .locals 1

    .line 897
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController$PollerSyncDataProviderImpl;->this$0:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-static {v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->access$200(Lcom/helpshift/conversation/domainmodel/ConversationController;)Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentConversationViewState()I
    .locals 1

    .line 892
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController$PollerSyncDataProviderImpl;->this$0:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-static {v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->access$100(Lcom/helpshift/conversation/domainmodel/ConversationController;)I

    move-result v0

    return v0
.end method

.method public getMessagesLocalIdToPendingRequestIdMap(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 887
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController$PollerSyncDataProviderImpl;->this$0:Lcom/helpshift/conversation/domainmodel/ConversationController;

    iget-object v0, v0, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->getMessagesLocalIdToPendingRequestIdMap(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method public getPendingRequestIdForPreissue()Ljava/lang/String;
    .locals 3

    .line 880
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController$PollerSyncDataProviderImpl;->this$0:Lcom/helpshift/conversation/domainmodel/ConversationController;

    iget-object v0, v0, Lcom/helpshift/conversation/domainmodel/ConversationController;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getNetworkRequestDAO()Lcom/helpshift/common/platform/network/NetworkRequestDAO;

    move-result-object v0

    const-string v1, "/preissues/"

    const-string v2, "preissue_default_unique_key"

    invoke-interface {v0, v1, v2}, Lcom/helpshift/common/platform/network/NetworkRequestDAO;->getPendingRequestId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
