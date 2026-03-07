.class public interface abstract Lcom/helpshift/conversation/pollersync/updater/PollerDataUpdater;
.super Ljava/lang/Object;
.source "PollerDataUpdater.java"


# virtual methods
.method public abstract updateData(Ljava/util/List;)Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;)",
            "Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;
        }
    .end annotation
.end method
