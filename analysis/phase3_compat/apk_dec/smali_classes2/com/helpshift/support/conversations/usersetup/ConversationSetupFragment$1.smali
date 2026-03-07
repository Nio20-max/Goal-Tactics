.class Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment$1;
.super Ljava/lang/Object;
.source "ConversationSetupFragment.java"

# interfaces
.implements Lcom/helpshift/widget/HSObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->addViewStateObservers()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;)V
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment$1;->this$0:Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged(Ljava/lang/Object;)V
    .locals 0

    .line 77
    check-cast p1, Lcom/helpshift/widget/BaseViewState;

    .line 78
    invoke-virtual {p1}, Lcom/helpshift/widget/BaseViewState;->isVisible()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 79
    iget-object p1, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment$1;->this$0:Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;

    invoke-virtual {p1}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->showProgressBar()V

    goto :goto_0

    .line 82
    :cond_0
    iget-object p1, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment$1;->this$0:Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;

    invoke-virtual {p1}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->hideProgressBar()V

    :goto_0
    return-void
.end method
