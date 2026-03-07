.class Lcom/helpshift/conversation/viewmodel/ConversationalVM$32;
.super Lcom/helpshift/common/domain/F;
.source "ConversationalVM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/viewmodel/ConversationalVM;->onStartNewConversationButtonClickFromCSATBot(Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/viewmodel/ConversationalVM;

.field final synthetic val$adminCSATMessageWithOptions:Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V
    .locals 0

    .line 2597
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM$32;->this$0:Lcom/helpshift/conversation/viewmodel/ConversationalVM;

    iput-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM$32;->val$adminCSATMessageWithOptions:Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 5

    .line 2601
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM$32;->this$0:Lcom/helpshift/conversation/viewmodel/ConversationalVM;

    iget-object v0, v0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM$32;->this$0:Lcom/helpshift/conversation/viewmodel/ConversationalVM;

    iget-object v1, v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM$32;->val$adminCSATMessageWithOptions:Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendCSATBotResponse(Lcom/helpshift/conversation/activeconversation/model/Conversation;IZLcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v0, "Helpshift_ConvsatnlVM"

    const-string v1, "Error sending csat response"

    .line 2605
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
