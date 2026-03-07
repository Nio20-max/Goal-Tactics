.class Lcom/helpshift/conversation/activeconversation/ConversationManager$15;
.super Lcom/helpshift/common/domain/F;
.source "ConversationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendCSATBotResponse(Lcom/helpshift/conversation/activeconversation/model/Conversation;IZLcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/activeconversation/ConversationManager;

.field final synthetic val$conversation:Lcom/helpshift/conversation/activeconversation/model/Conversation;

.field final synthetic val$response:Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 0

    .line 2545
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$15;->this$0:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$15;->val$response:Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    iput-object p3, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$15;->val$conversation:Lcom/helpshift/conversation/activeconversation/model/Conversation;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 3

    .line 2548
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$15;->val$response:Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$15;->this$0:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/ConversationManager;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$15;->val$conversation:Lcom/helpshift/conversation/activeconversation/model/Conversation;

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->send(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)V

    return-void
.end method
