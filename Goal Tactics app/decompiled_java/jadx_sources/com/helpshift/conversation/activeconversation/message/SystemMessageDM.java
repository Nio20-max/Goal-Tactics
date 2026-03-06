package com.helpshift.conversation.activeconversation.message;

import com.helpshift.conversation.activeconversation.message.Author;

/* JADX INFO: loaded from: classes2.dex */
public class SystemMessageDM extends MessageDM {
    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public boolean isUISupportedMessage() {
        return true;
    }

    SystemMessageDM(String str, String str2, long j, MessageType messageType) {
        super(str, str2, j, new Author("mobile", "", Author.AuthorRole.SYSTEM), false, messageType);
    }

    protected SystemMessageDM(SystemMessageDM systemMessageDM) {
        super(systemMessageDM);
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public SystemMessageDM deepClone() {
        return new SystemMessageDM(this);
    }
}
