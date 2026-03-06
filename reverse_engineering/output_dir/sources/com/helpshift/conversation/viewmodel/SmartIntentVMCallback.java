package com.helpshift.conversation.viewmodel;

import com.helpshift.conversation.smartintent.BaseSmartIntentViewState;
import com.helpshift.conversation.smartintent.SmartIntentCollapsedRootViewState;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public interface SmartIntentVMCallback {
    void createPreIssueFromSmartIntentSelection(String str, List<String> list, List<String> list2, String str2);

    void createPreIssueFromSmartIntentSendButton(String str, String str2);

    void hideFakeTypingIndicatorFromSmartIntent();

    void hideReplyFooterFromSmartIntent();

    void hideSmartIntentView();

    void showFakeTypingIndicatorFromSmartIntent();

    void showReplyFooterFromSmartIntent();

    void showSmartIntentReplyValidationFailedError();

    void showSmartIntentUI(SmartIntentCollapsedRootViewState smartIntentCollapsedRootViewState);

    void updateSmartIntentView(BaseSmartIntentViewState baseSmartIntentViewState);
}
