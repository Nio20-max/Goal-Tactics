.class Lcom/helpshift/conversation/viewmodel/ConversationalVM$28;
.super Lcom/helpshift/common/domain/F;
.source "ConversationalVM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showReplyFooterFromSmartIntent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/viewmodel/ConversationalVM;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V
    .locals 0

    .line 2395
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM$28;->this$0:Lcom/helpshift/conversation/viewmodel/ConversationalVM;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 2

    .line 2398
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM$28;->this$0:Lcom/helpshift/conversation/viewmodel/ConversationalVM;

    iget-object v0, v0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableReplyBoxViewState;->setVisible(Z)V

    .line 2399
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM$28;->this$0:Lcom/helpshift/conversation/viewmodel/ConversationalVM;

    invoke-static {v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->access$500(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    return-void
.end method
