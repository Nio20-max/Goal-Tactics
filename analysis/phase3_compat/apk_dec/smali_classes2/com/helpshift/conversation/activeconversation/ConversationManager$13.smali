.class Lcom/helpshift/conversation/activeconversation/ConversationManager$13;
.super Lcom/helpshift/common/domain/F;
.source "ConversationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/activeconversation/ConversationManager;->handleAdminSuggestedQuestionRead(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/activeconversation/ConversationManager;

.field final synthetic val$conversation:Lcom/helpshift/conversation/activeconversation/model/Conversation;

.field final synthetic val$faqMessageDM:Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;

.field final synthetic val$questionPublishId:Ljava/lang/String;

.field final synthetic val$questionServerId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 2160
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$13;->this$0:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$13;->val$faqMessageDM:Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;

    iput-object p3, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$13;->val$conversation:Lcom/helpshift/conversation/activeconversation/model/Conversation;

    iput-object p4, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$13;->val$questionServerId:Ljava/lang/String;

    iput-object p5, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$13;->val$questionPublishId:Ljava/lang/String;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 5

    .line 2163
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$13;->val$faqMessageDM:Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$13;->val$conversation:Lcom/helpshift/conversation/activeconversation/model/Conversation;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$13;->this$0:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iget-object v2, v2, Lcom/helpshift/conversation/activeconversation/ConversationManager;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$13;->val$questionServerId:Ljava/lang/String;

    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$13;->val$questionPublishId:Ljava/lang/String;

    .line 2164
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;->handleSuggestionClick(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
