package com.helpshift.widget;

import com.helpshift.conversation.activeconversation.message.HistoryLoadingState;

/* JADX INFO: loaded from: classes2.dex */
public class HistoryLoadingViewState extends HSBaseObservable {
    protected HistoryLoadingState state = HistoryLoadingState.NONE;

    public HistoryLoadingState getState() {
        return this.state;
    }

    @Override // com.helpshift.widget.HSBaseObservable
    protected void notifyInitialState() {
        notifyChange(this);
    }
}
