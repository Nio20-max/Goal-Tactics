package com.helpshift.conversation.activeconversation.message;

import com.helpshift.common.domain.Domain;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.activeconversation.message.input.TextInput;

/* JADX INFO: loaded from: classes2.dex */
public class AdminMessageWithTextInputDM extends AdminMessageDM {
    public TextInput input;
    public final boolean isMessageEmpty;

    public AdminMessageWithTextInputDM(String str, String str2, String str3, long j, Author author, String str4, String str5, boolean z, String str6, String str7, int i, boolean z2) {
        super(str, str2, str3, j, author, MessageType.ADMIN_TEXT_WITH_TEXT_INPUT);
        this.input = new TextInput(str4, z, str6, str7, str5, i);
        this.isMessageEmpty = z2;
    }

    private AdminMessageWithTextInputDM(AdminMessageWithTextInputDM adminMessageWithTextInputDM) {
        super(adminMessageWithTextInputDM);
        this.isMessageEmpty = adminMessageWithTextInputDM.isMessageEmpty;
        this.input = adminMessageWithTextInputDM.input.deepClone();
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof AdminMessageWithTextInputDM) {
            this.input = ((AdminMessageWithTextInputDM) messageDM).input;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public void setDependencies(Domain domain, Platform platform) {
        super.setDependencies(domain, platform);
        this.input.setDependencies(domain);
    }

    @Override // com.helpshift.conversation.activeconversation.message.AdminMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public AdminMessageWithTextInputDM deepClone() {
        return new AdminMessageWithTextInputDM(this);
    }
}
