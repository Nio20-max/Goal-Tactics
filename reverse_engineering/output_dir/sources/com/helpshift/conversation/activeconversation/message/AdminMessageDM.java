package com.helpshift.conversation.activeconversation.message;

/* JADX INFO: loaded from: classes2.dex */
public class AdminMessageDM extends MessageDM {
    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public boolean isUISupportedMessage() {
        return true;
    }

    public AdminMessageDM(String str, String str2, String str3, long j, Author author) {
        super(str2, str3, j, author, true, MessageType.ADMIN_TEXT);
        this.serverId = str;
    }

    public AdminMessageDM(String str, String str2, String str3, long j, Author author, MessageType messageType) {
        super(str2, str3, j, author, true, messageType);
        this.serverId = str;
    }

    protected AdminMessageDM(AdminMessageDM adminMessageDM) {
        super(adminMessageDM);
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public AdminMessageDM deepClone() {
        return new AdminMessageDM(this);
    }
}
