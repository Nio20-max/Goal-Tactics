package com.helpshift.support.conversations.messages;

import android.view.ContextMenu;
import com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminCSATMessageWithOptions;
import com.helpshift.conversation.activeconversation.message.AdminImageAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.FAQListMessageDM;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.OptionInputMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestAppReviewMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.UserAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;

/* JADX INFO: loaded from: classes2.dex */
public interface MessagesAdapterClickListener {
    void downloadAvatarImage(MessageDM messageDM);

    void handleAdminImageAttachmentMessageClick(AdminImageAttachmentMessageDM adminImageAttachmentMessageDM);

    void handleGenericAttachmentMessageClick(AdminAttachmentMessageDM adminAttachmentMessageDM);

    void handleOptionSelected(OptionInputMessageDM optionInputMessageDM, OptionInput.Option option, boolean z);

    void handleReplyReviewButtonClick(RequestAppReviewMessageDM requestAppReviewMessageDM);

    void launchImagePicker(RequestScreenshotMessageDM requestScreenshotMessageDM);

    void onActionCardClicked(AdminActionCardMessageDM adminActionCardMessageDM);

    void onAdminMessageLinkClickFailed();

    void onAdminMessageLinkClicked(String str, MessageDM messageDM);

    void onAdminSuggestedQuestionSelected(FAQListMessageDM fAQListMessageDM, String str, String str2);

    void onCSATSurveyCancelled();

    void onCSATSurveyRequestedFromBot(String str);

    void onCSATSurveyStarted();

    void onCSATSurveyStartedFromBot(String str);

    void onCSATSurveySubmitted(int i, String str);

    void onCreateContextMenu(ContextMenu contextMenu, String str);

    void onHistoryLoadingRetryClicked();

    void onScreenshotMessageClicked(ScreenshotMessageDM screenshotMessageDM);

    void onSendFeedbackClick(int i, AdminCSATMessageWithOptions adminCSATMessageWithOptions);

    void onStartNewConversationButtonClick();

    void onStartNewConversationButtonClickFromCSATBot(AdminCSATMessageWithOptions adminCSATMessageWithOptions);

    void onUserAttachmentMessageClicked(UserAttachmentMessageDM userAttachmentMessageDM);

    void retryMessage(MessageDM messageDM);
}
