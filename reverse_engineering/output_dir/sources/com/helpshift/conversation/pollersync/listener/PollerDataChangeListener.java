package com.helpshift.conversation.pollersync.listener;

import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.model.Conversation;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public interface PollerDataChangeListener {
    void onConversationUpdated(Conversation conversation, Conversation conversation2);

    void onMessagesAdded(Conversation conversation, List<MessageDM> list);

    void onMessagesUpdated(List<MessageDM> list, List<MessageDM> list2);
}
