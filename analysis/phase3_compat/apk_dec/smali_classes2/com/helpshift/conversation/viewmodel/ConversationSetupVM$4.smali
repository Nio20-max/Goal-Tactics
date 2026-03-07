.class Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$4;
.super Lcom/helpshift/common/domain/F;
.source "ConversationSetupVM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->onAuthenticationFailure()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;)V
    .locals 0

    .line 133
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$4;->this$0:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$4;->this$0:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-static {v0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->access$000(Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;)Lcom/helpshift/conversation/activeconversation/usersetup/ConversationSetupRenderer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 137
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$4;->this$0:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-static {v0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->access$000(Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;)Lcom/helpshift/conversation/activeconversation/usersetup/ConversationSetupRenderer;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/usersetup/ConversationSetupRenderer;->onAuthenticationFailure()V

    :cond_0
    return-void
.end method
