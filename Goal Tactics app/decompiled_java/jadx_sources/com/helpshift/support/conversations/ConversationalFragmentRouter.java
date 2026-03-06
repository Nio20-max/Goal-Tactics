package com.helpshift.support.conversations;

import com.helpshift.conversation.viewmodel.OptionUIModel;
import com.helpshift.support.conversations.messages.MessagesAdapterClickListener;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public interface ConversationalFragmentRouter extends MessagesAdapterClickListener {
    void handleOptionSelectedForPicker(OptionUIModel optionUIModel, boolean z);

    void launchAttachmentPicker(int i);

    void onAddAttachmentButtonClick();

    void onAuthenticationFailure();

    void onListPickerSearchQueryChange(String str);

    void onSendButtonClick();

    void onSkipClick();

    void onTextChanged(CharSequence charSequence, int i, int i2, int i3);

    void openFreshConversationScreen(Map<String, Boolean> map);

    void resetToolbarImportanceForAccessibility();

    void setToolbarImportanceForAccessibility(int i);
}
