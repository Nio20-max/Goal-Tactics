package com.helpshift.conversation.dto;

import com.helpshift.conversation.activeconversation.model.Conversation;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationInbox {
    public final List<Conversation> conversations;
    public final String cursor;
    public final Boolean hasOlderMessages;
    public final boolean issueExists;

    public ConversationInbox(String str, List<Conversation> list, boolean z, Boolean bool) {
        this.cursor = str;
        this.conversations = list;
        this.issueExists = z;
        this.hasOlderMessages = bool;
    }
}
