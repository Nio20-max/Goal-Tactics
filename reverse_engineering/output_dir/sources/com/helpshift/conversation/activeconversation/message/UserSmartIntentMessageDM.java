package com.helpshift.conversation.activeconversation.message;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class UserSmartIntentMessageDM extends UserMessageDM {
    public List<String> intentLabels;

    public UserSmartIntentMessageDM(List<String> list, String str, long j, Author author) {
        super("", str, j, author, MessageType.USER_SMART_INTENT);
        this.intentLabels = list;
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof UserSmartIntentMessageDM) {
            this.intentLabels = ((UserSmartIntentMessageDM) messageDM).intentLabels;
        }
    }

    private UserSmartIntentMessageDM(UserSmartIntentMessageDM userSmartIntentMessageDM) {
        super(userSmartIntentMessageDM);
        this.intentLabels = new ArrayList(userSmartIntentMessageDM.intentLabels);
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public UserSmartIntentMessageDM deepClone() {
        return new UserSmartIntentMessageDM(this);
    }
}
