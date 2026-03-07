.class public interface abstract Lcom/helpshift/support/conversations/messages/MessagesAdapterClickListener;
.super Ljava/lang/Object;
.source "MessagesAdapterClickListener.java"


# virtual methods
.method public abstract downloadAvatarImage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
.end method

.method public abstract handleAdminImageAttachmentMessageClick(Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;)V
.end method

.method public abstract handleGenericAttachmentMessageClick(Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;)V
.end method

.method public abstract handleOptionSelected(Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;Z)V
.end method

.method public abstract handleReplyReviewButtonClick(Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;)V
.end method

.method public abstract launchImagePicker(Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;)V
.end method

.method public abstract onActionCardClicked(Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V
.end method

.method public abstract onAdminMessageLinkClickFailed()V
.end method

.method public abstract onAdminMessageLinkClicked(Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
.end method

.method public abstract onAdminSuggestedQuestionSelected(Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract onCSATSurveyCancelled()V
.end method

.method public abstract onCSATSurveyRequestedFromBot(Ljava/lang/String;)V
.end method

.method public abstract onCSATSurveyStarted()V
.end method

.method public abstract onCSATSurveyStartedFromBot(Ljava/lang/String;)V
.end method

.method public abstract onCSATSurveySubmitted(ILjava/lang/String;)V
.end method

.method public abstract onCreateContextMenu(Landroid/view/ContextMenu;Ljava/lang/String;)V
.end method

.method public abstract onHistoryLoadingRetryClicked()V
.end method

.method public abstract onScreenshotMessageClicked(Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;)V
.end method

.method public abstract onSendFeedbackClick(ILcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V
.end method

.method public abstract onStartNewConversationButtonClick()V
.end method

.method public abstract onStartNewConversationButtonClickFromCSATBot(Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V
.end method

.method public abstract onUserAttachmentMessageClicked(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V
.end method

.method public abstract retryMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
.end method
