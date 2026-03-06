package com.helpshift.conversation.viewmodel;

import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.dto.IssueState;
import com.helpshift.util.HSListObserver;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public interface ConversationVMCallback extends HSListObserver<MessageDM> {
    void handleIdempotentPreIssueCreationSuccess();

    void handlePreIssueCreationSuccess();

    boolean isMessageBoxVisible();

    boolean isVisibleOnUI();

    void launchAttachment(String str, String str2);

    void launchScreenshotAttachment(String str, String str2);

    void onAgentTypingUpdate(boolean z);

    void onConversationInboxPollFailure();

    void onConversationInboxPollSuccess();

    void onHistoryLoadingError();

    void onHistoryLoadingStarted();

    void onHistoryLoadingSuccess();

    void onIssueStatusChange(IssueState issueState);

    void prependConversations(List<Conversation> list, boolean z);
}
