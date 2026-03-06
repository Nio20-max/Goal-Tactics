package com.helpshift.conversation.activeconversation.message;

/* JADX INFO: loaded from: classes2.dex */
public class AdminBotControlMessageDM extends AdminMessageDM {
    public String actionType;
    public String botInfo;
    public boolean hasNextBot;

    @Override // com.helpshift.conversation.activeconversation.message.AdminMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM
    public boolean isUISupportedMessage() {
        return false;
    }

    public AdminBotControlMessageDM(String str, String str2, String str3, long j, Author author, String str4, String str5) {
        super(str, str2, str3, j, author, MessageType.ADMIN_BOT_CONTROL);
        this.actionType = str4;
        this.botInfo = str5;
    }

    private AdminBotControlMessageDM(AdminBotControlMessageDM adminBotControlMessageDM) {
        super(adminBotControlMessageDM);
        this.actionType = adminBotControlMessageDM.actionType;
        this.botInfo = adminBotControlMessageDM.botInfo;
        this.hasNextBot = adminBotControlMessageDM.hasNextBot;
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof AdminBotControlMessageDM) {
            AdminBotControlMessageDM adminBotControlMessageDM = (AdminBotControlMessageDM) messageDM;
            this.actionType = adminBotControlMessageDM.actionType;
            this.botInfo = adminBotControlMessageDM.botInfo;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.AdminMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public AdminBotControlMessageDM deepClone() {
        return new AdminBotControlMessageDM(this);
    }
}
