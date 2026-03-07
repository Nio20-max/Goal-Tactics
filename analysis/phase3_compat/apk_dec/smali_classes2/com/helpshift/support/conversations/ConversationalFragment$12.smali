.class Lcom/helpshift/support/conversations/ConversationalFragment$12;
.super Ljava/lang/Object;
.source "ConversationalFragment.java"

# interfaces
.implements Lcom/helpshift/widget/HSObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/conversations/ConversationalFragment;->addViewStateObservers()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/conversations/ConversationalFragment;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/ConversationalFragment;)V
    .locals 0

    .line 354
    iput-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragment$12;->this$0:Lcom/helpshift/support/conversations/ConversationalFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged(Ljava/lang/Object;)V
    .locals 2

    .line 357
    check-cast p1, Lcom/helpshift/widget/BaseViewState;

    .line 358
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragment$12;->this$0:Lcom/helpshift/support/conversations/ConversationalFragment;

    iget-object v0, v0, Lcom/helpshift/support/conversations/ConversationalFragment;->renderer:Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;

    invoke-virtual {p1}, Lcom/helpshift/widget/BaseViewState;->isVisible()Z

    move-result v1

    .line 359
    invoke-virtual {p1}, Lcom/helpshift/widget/BaseViewState;->isEnabled()Z

    move-result p1

    .line 358
    invoke-virtual {v0, v1, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->updateSmartIntentReplyButton(ZZ)V

    return-void
.end method
