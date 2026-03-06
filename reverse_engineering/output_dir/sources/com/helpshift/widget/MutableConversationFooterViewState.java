package com.helpshift.widget;

import com.helpshift.conversation.activeconversation.message.ConversationFooterState;

/* JADX INFO: loaded from: classes2.dex */
public class MutableConversationFooterViewState extends ConversationFooterViewState {
    public void setState(ConversationFooterState conversationFooterState) {
        if (this.state != conversationFooterState) {
            this.state = conversationFooterState;
            notifyChange(this);
        }
    }
}
