package com.helpshift.conversation.pollersync.model;

import com.helpshift.conversation.activeconversation.model.Conversation;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationsDiff {
    public final List<Conversation> existingConversations;
    public final Map<Conversation, MessagesDiff> messagesDiffMap;
    public final List<Conversation> newConversations;
    public final List<Conversation> updatedConversations;

    public ConversationsDiff(List<Conversation> list, List<Conversation> list2, List<Conversation> list3, Map<Conversation, MessagesDiff> map) {
        this.existingConversations = list;
        this.newConversations = list2;
        this.updatedConversations = list3;
        this.messagesDiffMap = map;
    }
}
