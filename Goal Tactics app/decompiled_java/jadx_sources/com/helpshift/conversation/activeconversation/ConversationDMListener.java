package com.helpshift.conversation.activeconversation;

import com.helpshift.conversation.dto.IssueState;

/* JADX INFO: loaded from: classes2.dex */
public interface ConversationDMListener {
    void onIssueStatusChange(IssueState issueState);
}
