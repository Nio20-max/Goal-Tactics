.class Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$1;
.super Lcom/helpshift/common/domain/F;
.source "ConversationSetupVM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->handleConversationSetupComplete()V
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

    .line 77
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$1;->this$0:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 2

    .line 80
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$1;->this$0:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-static {v0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->access$000(Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;)Lcom/helpshift/conversation/activeconversation/usersetup/ConversationSetupRenderer;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, "Helpshift_ConvStpVM"

    const-string v1, "Handling setup complete."

    .line 81
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$1;->this$0:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-static {v0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->access$000(Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;)Lcom/helpshift/conversation/activeconversation/usersetup/ConversationSetupRenderer;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/usersetup/ConversationSetupRenderer;->onConversationSetupComplete()V

    :cond_0
    return-void
.end method
