.class public interface abstract Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;
.super Ljava/lang/Object;
.source "SmartIntentVMCallback.java"


# virtual methods
.method public abstract createPreIssueFromSmartIntentSelection(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation
.end method

.method public abstract createPreIssueFromSmartIntentSendButton(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract hideFakeTypingIndicatorFromSmartIntent()V
.end method

.method public abstract hideReplyFooterFromSmartIntent()V
.end method

.method public abstract hideSmartIntentView()V
.end method

.method public abstract showFakeTypingIndicatorFromSmartIntent()V
.end method

.method public abstract showReplyFooterFromSmartIntent()V
.end method

.method public abstract showSmartIntentReplyValidationFailedError()V
.end method

.method public abstract showSmartIntentUI(Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;)V
.end method

.method public abstract updateSmartIntentView(Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;)V
.end method
