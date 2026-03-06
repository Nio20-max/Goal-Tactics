package com.helpshift.conversation.activeconversation;

import com.helpshift.conversation.smartintent.BaseSmartIntentViewState;
import com.helpshift.conversation.smartintent.SmartIntentCollapsedRootViewState;

/* JADX INFO: loaded from: classes2.dex */
public interface SmartIntentRenderer {
    void dismissSmartIntentUI(boolean z);

    String getReply();

    void hideReplyValidationFailedError();

    boolean isUIInExpandedMode();

    void setReply(String str);

    void showReplyValidationFailedError();

    void showSmartIntentUI(SmartIntentCollapsedRootViewState smartIntentCollapsedRootViewState);

    void updateClearSearchButton(boolean z);

    void updateReplyButtonViewState(boolean z, boolean z2);

    void updateSmartIntentView(BaseSmartIntentViewState baseSmartIntentViewState);
}
