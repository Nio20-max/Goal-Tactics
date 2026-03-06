package com.helpshift.conversation.activeconversation.message;

import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class AdminResolutionMessageWithOptions extends AdminMessageDM {
    public int attachmentCount;
    public OptionInput input;

    public AdminResolutionMessageWithOptions(String str, String str2, String str3, long j, Author author, String str4, boolean z, String str5, String str6, List<OptionInput.Option> list, OptionInput.Type type) {
        super(str, str2, str3, j, author, MessageType.ADMIN_RESOLUTION_QUESTION_MESSAGE);
        this.input = new OptionInput(str4, z, str5, str6, list, type);
    }

    public AdminResolutionMessageWithOptions(AdminResolutionMessageWithOptions adminResolutionMessageWithOptions) {
        super(adminResolutionMessageWithOptions);
        this.input = adminResolutionMessageWithOptions.input.deepClone();
        this.attachmentCount = adminResolutionMessageWithOptions.attachmentCount;
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof AdminMessageWithOptionInputDM) {
            AdminMessageWithOptionInputDM adminMessageWithOptionInputDM = (AdminMessageWithOptionInputDM) messageDM;
            this.input = adminMessageWithOptionInputDM.input;
            this.attachmentCount = adminMessageWithOptionInputDM.attachmentCount;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.AdminMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public AdminResolutionMessageWithOptions deepClone() {
        return new AdminResolutionMessageWithOptions(this);
    }
}
