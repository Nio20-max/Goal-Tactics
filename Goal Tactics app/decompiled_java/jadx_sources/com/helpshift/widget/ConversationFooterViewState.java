package com.helpshift.widget;

import com.helpshift.conversation.activeconversation.message.ConversationFooterState;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationFooterViewState extends HSBaseObservable {
    protected ConversationFooterState state = ConversationFooterState.NONE;

    public ConversationFooterState getState() {
        return this.state;
    }

    @Override // com.helpshift.widget.HSBaseObservable
    protected void notifyInitialState() {
        notifyChange(this);
    }
}
