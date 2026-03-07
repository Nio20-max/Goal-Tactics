.class Lcom/helpshift/conversation/activeconversation/ConversationManager$14;
.super Lcom/helpshift/common/domain/F;
.source "ConversationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/activeconversation/ConversationManager;->downloadAvatarImage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/activeconversation/ConversationManager;

.field final synthetic val$message:Lcom/helpshift/conversation/activeconversation/message/MessageDM;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 0

    .line 2493
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$14;->this$0:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$14;->val$message:Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 3

    .line 2496
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$14;->this$0:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$14;->this$0:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$14;->val$message:Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    invoke-static {v0, v1, v2}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->downloadAvatarImage(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void
.end method
