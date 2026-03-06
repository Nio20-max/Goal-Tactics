package com.helpshift.conversation;

import com.helpshift.common.domain.F;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.conversation.activeconversation.ConversationManager;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.domainmodel.ConversationController;
import com.helpshift.util.HSLogger;
import com.helpshift.util.StringUtils;
import java.lang.ref.WeakReference;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class CreatePreIssueDM extends F {
    private static final String TAG = "Helpshift_CrtePreIsue";
    private final Conversation conversation;
    private final ConversationController conversationController;
    private final ConversationManager conversationManager;
    private final String greetingMessage;
    private List<String> intentLabels;
    private WeakReference<ConversationController.StartNewConversationListener> listener;
    private final String userMessage;

    public CreatePreIssueDM(ConversationController conversationController, ConversationManager conversationManager, Conversation conversation, ConversationController.StartNewConversationListener startNewConversationListener, String str, String str2, List<String> list) {
        this.conversationController = conversationController;
        this.conversationManager = conversationManager;
        this.conversation = conversation;
        this.listener = new WeakReference<>(startNewConversationListener);
        this.greetingMessage = str;
        this.userMessage = str2;
        this.intentLabels = list;
    }

    @Override // com.helpshift.common.domain.F
    public void f() {
        try {
            if (this.conversationManager.isSynced(this.conversation)) {
                return;
            }
            HSLogger.d(TAG, "Filing preissue with backend.");
            this.conversationController.createPreIssueNetwork(this.conversation, this.greetingMessage, this.userMessage, this.intentLabels);
            this.conversationController.conversationManager.updateLastUserActivityTime(this.conversation, System.currentTimeMillis());
            ConversationController.StartNewConversationListener startNewConversationListener = this.listener.get();
            if (startNewConversationListener != null) {
                startNewConversationListener.onCreateConversationSuccess(this.conversation.localId.longValue());
            }
        } catch (RootAPIException e) {
            HSLogger.e(TAG, "Error filing a pre-issue", e);
            ConversationController.StartNewConversationListener startNewConversationListener2 = this.listener.get();
            if (startNewConversationListener2 == null || !StringUtils.isEmpty(this.conversation.getPreIssueId())) {
                return;
            }
            startNewConversationListener2.onCreateConversationFailure(e);
        }
    }

    public void setListener(ConversationController.StartNewConversationListener startNewConversationListener) {
        this.listener = new WeakReference<>(startNewConversationListener);
    }
}
