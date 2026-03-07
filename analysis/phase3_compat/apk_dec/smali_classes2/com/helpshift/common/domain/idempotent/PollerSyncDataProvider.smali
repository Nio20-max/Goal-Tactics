.class public interface abstract Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;
.super Ljava/lang/Object;
.source "PollerSyncDataProvider.java"


# virtual methods
.method public abstract getActiveConversationFromStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;
.end method

.method public abstract getAliveViewableConversation()Lcom/helpshift/conversation/activeconversation/ViewableConversation;
.end method

.method public abstract getCurrentConversationViewState()I
.end method

.method public abstract getMessagesLocalIdToPendingRequestIdMap(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/util/Map;
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
.end method

.method public abstract getPendingRequestIdForPreissue()Ljava/lang/String;
.end method
