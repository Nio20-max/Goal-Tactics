.class public interface abstract Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;
.super Ljava/lang/Object;
.source "HelpshiftSupport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/xamarin/support/HelpshiftSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Delegate"
.end annotation


# virtual methods
.method public abstract authenticationFailed(Lcom/helpshift/xamarin/WrappedHelpshiftUser;I)V
.end method

.method public abstract conversationEnded()V
.end method

.method public abstract didCheckIfConversationActive(Z)V
.end method

.method public abstract didReceiveNotification(I)V
.end method

.method public abstract didReceiveUnreadMessagesCount(I)V
.end method

.method public abstract handleTapOnAttachmentFile(Ljava/lang/String;)V
.end method

.method public abstract newConversationStarted(Ljava/lang/String;)V
.end method

.method public abstract sessionBegan()V
.end method

.method public abstract sessionEnded()V
.end method

.method public abstract userClickOnAction(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract userCompletedCustomerSatisfactionSurvey(ILjava/lang/String;)V
.end method

.method public abstract userRepliedToConversation(Ljava/lang/String;)V
.end method
