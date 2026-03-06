package com.helpshift.conversation.pollersync.model;

import com.helpshift.conversation.activeconversation.message.MessageDM;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class MessagesDiff {
    public final List<MessageDM> existingMessages;
    public final List<MessageDM> newMessages;
    public final List<MessageDM> updatedMessages;

    public MessagesDiff(List<MessageDM> list, List<MessageDM> list2, List<MessageDM> list3) {
        this.existingMessages = list;
        this.newMessages = list2;
        this.updatedMessages = list3;
    }
}
