package com.helpshift.widget;

/* JADX INFO: loaded from: classes2.dex */
public class ReplyFieldViewState extends HSBaseObservable {
    protected boolean isEnabled;
    protected String replyText = "";

    protected ReplyFieldViewState() {
    }

    public String getReplyText() {
        return this.replyText;
    }

    @Override // com.helpshift.widget.HSBaseObservable
    protected void notifyInitialState() {
        notifyChange(this);
    }
}
