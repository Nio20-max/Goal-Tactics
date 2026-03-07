.class public Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;
.super Ljava/lang/Object;
.source "ConversationsDiff.java"


# instance fields
.field public final existingConversations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public final messagesDiffMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Lcom/helpshift/conversation/pollersync/model/MessagesDiff;",
            ">;"
        }
    .end annotation
.end field

.field public final newConversations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public final updatedConversations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;",
            "Ljava/util/Map<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Lcom/helpshift/conversation/pollersync/model/MessagesDiff;",
            ">;)V"
        }
    .end annotation

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;->existingConversations:Ljava/util/List;

    .line 23
    iput-object p2, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;->newConversations:Ljava/util/List;

    .line 24
    iput-object p3, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;->updatedConversations:Ljava/util/List;

    .line 25
    iput-object p4, p0, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;->messagesDiffMap:Ljava/util/Map;

    return-void
.end method
