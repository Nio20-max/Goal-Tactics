.class Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$11;
.super Ljava/lang/Object;
.source "ConversationalFragmentRenderer.java"

# interfaces
.implements Lcom/helpshift/support/widget/AttachmentTypeOptionPicker$OnAttachmentTypeOptionClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showAttachmentPicker(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V
    .locals 0

    .line 793
    iput-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$11;->this$0:Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public launchAttachmentPicker(I)V
    .locals 1

    .line 796
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$11;->this$0:Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;

    iget-object v0, v0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->conversationalFragmentRouter:Lcom/helpshift/support/conversations/ConversationalFragmentRouter;

    invoke-interface {v0, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRouter;->launchAttachmentPicker(I)V

    return-void
.end method
