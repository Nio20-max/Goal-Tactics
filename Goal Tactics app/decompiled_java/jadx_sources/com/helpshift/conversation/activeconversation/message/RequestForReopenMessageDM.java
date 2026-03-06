package com.helpshift.conversation.activeconversation.message;

/* JADX INFO: loaded from: classes2.dex */
public class RequestForReopenMessageDM extends MessageDM {
    private boolean isAnswered;

    public RequestForReopenMessageDM(String str, String str2, String str3, long j, Author author) {
        super(str2, str3, j, author, true, MessageType.REQUEST_FOR_REOPEN);
        this.serverId = str;
    }

    protected RequestForReopenMessageDM(RequestForReopenMessageDM requestForReopenMessageDM) {
        super(requestForReopenMessageDM);
        this.isAnswered = requestForReopenMessageDM.isAnswered;
    }

    public boolean isAnswered() {
        return this.isAnswered;
    }

    public void setAnswered(boolean z) {
        this.isAnswered = z;
    }

    public void setAnsweredAndNotify(boolean z) {
        if (this.isAnswered == z) {
            return;
        }
        setAnswered(z);
        notifyUpdated();
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public boolean isUISupportedMessage() {
        return this.isAnswered;
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public RequestForReopenMessageDM deepClone() {
        return new RequestForReopenMessageDM(this);
    }
}
