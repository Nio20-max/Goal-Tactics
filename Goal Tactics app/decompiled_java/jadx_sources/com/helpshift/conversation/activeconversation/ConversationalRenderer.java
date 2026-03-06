package com.helpshift.conversation.activeconversation;

import com.helpshift.common.exception.ExceptionType;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.input.Input;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import com.helpshift.conversation.smartintent.BaseSmartIntentViewState;
import com.helpshift.conversation.smartintent.SmartIntentCollapsedRootViewState;
import com.helpshift.conversation.viewmodel.OptionUIModel;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public interface ConversationalRenderer {
    void appendMessages(int i, int i2);

    void destroy();

    void disableSendReplyButton();

    void enableSendReplyButton();

    String getReply();

    String getSmartIntentUserQuery();

    boolean handleBackPressedForListPicker();

    void hideAgentTypingIndicator();

    void hideKeyboard();

    void hideListPicker(boolean z);

    void hideNetworkErrorFooter();

    void hidePickerClearButton();

    void hideReplyValidationFailedError();

    void hideSendReplyUI();

    void hideSkipButton();

    void hideSmartIntentReplyValidationFailedError();

    void hideSmartIntentView();

    void initializeMessages(List<MessageDM> list);

    boolean isReplyBoxVisible();

    void launchAttachment(String str, String str2);

    void launchScreenshotAttachment(String str, String str2);

    void notifyRefreshList();

    void onAuthenticationFailure();

    void onFocusChanged(boolean z);

    void openActionLink(String str);

    void openAppReviewStore(String str);

    void openFreshConversationScreen(Map<String, Boolean> map);

    void removeMessages(int i, int i2);

    void requestReplyFieldFocus();

    void scrollToBottom();

    void setReply(String str);

    void setReplyboxListeners();

    void showAgentTypingIndicator();

    void showAttachmentPicker(List<Integer> list);

    void showCSATSubmittedView();

    void showEmptyListPickerView();

    void showErrorView(ExceptionType exceptionType);

    void showKeyboard();

    void showListPicker(List<OptionUIModel> list, String str, boolean z, String str2);

    void showNetworkErrorFooter(int i);

    void showOptionInput(OptionInput optionInput);

    void showPickerClearButton();

    void showReplyValidationFailedError(int i);

    void showSkipButton();

    void showSmartIntentReplyValidationFailedError();

    void showSmartIntentView(SmartIntentCollapsedRootViewState smartIntentCollapsedRootViewState);

    void updateConversationResolutionQuestionUI(boolean z);

    void updateImageAttachmentButtonView(boolean z);

    void updateListPickerOptions(List<OptionUIModel> list);

    void updateMessages(int i, int i2);

    void updateSendReplyButton(boolean z);

    void updateSendReplyUI(boolean z, Input input);

    void updateSmartIntentView(BaseSmartIntentViewState baseSmartIntentViewState);
}
