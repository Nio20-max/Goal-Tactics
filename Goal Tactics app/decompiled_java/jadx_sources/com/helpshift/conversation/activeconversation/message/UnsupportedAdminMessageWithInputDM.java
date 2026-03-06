package com.helpshift.conversation.activeconversation.message;

/* JADX INFO: loaded from: classes2.dex */
public class UnsupportedAdminMessageWithInputDM extends AdminMessageDM {
    public String botInfo;
    public String input;
    public String type;

    @Override // com.helpshift.conversation.activeconversation.message.AdminMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM
    public boolean isUISupportedMessage() {
        return false;
    }

    public UnsupportedAdminMessageWithInputDM(String str, String str2, String str3, long j, Author author, String str4, String str5, String str6) {
        super(str, str2, str3, j, author, MessageType.UNSUPPORTED_ADMIN_MESSAGE_WITH_INPUT);
        this.type = str4;
        this.botInfo = str5;
        this.input = str6;
    }

    private UnsupportedAdminMessageWithInputDM(UnsupportedAdminMessageWithInputDM unsupportedAdminMessageWithInputDM) {
        super(unsupportedAdminMessageWithInputDM);
        this.type = unsupportedAdminMessageWithInputDM.type;
        this.botInfo = unsupportedAdminMessageWithInputDM.botInfo;
        this.input = unsupportedAdminMessageWithInputDM.input;
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof UnsupportedAdminMessageWithInputDM) {
            UnsupportedAdminMessageWithInputDM unsupportedAdminMessageWithInputDM = (UnsupportedAdminMessageWithInputDM) messageDM;
            this.type = unsupportedAdminMessageWithInputDM.type;
            this.botInfo = unsupportedAdminMessageWithInputDM.botInfo;
            this.input = unsupportedAdminMessageWithInputDM.input;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.AdminMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public UnsupportedAdminMessageWithInputDM deepClone() {
        return new UnsupportedAdminMessageWithInputDM(this);
    }
}
