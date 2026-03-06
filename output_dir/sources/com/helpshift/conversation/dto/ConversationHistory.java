package com.helpshift.conversation.dto;

import com.helpshift.conversation.activeconversation.model.Conversation;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationHistory {
    public final List<Conversation> conversations;
    public final boolean hasOlderMessages;

    public ConversationHistory(List<Conversation> list, boolean z) {
        this.conversations = list;
        this.hasOlderMessages = z;
    }
}
