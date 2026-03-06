package com.helpshift.conversation.loaders;

import com.helpshift.conversation.ConversationUtil;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.dao.ConversationDAO;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SingleConversationDBLoader extends ConversationDBLoader {
    private Long conversationLocalId;

    public SingleConversationDBLoader(ConversationDAO conversationDAO, Long l) {
        super(conversationDAO);
        this.conversationLocalId = l;
    }

    @Override // com.helpshift.conversation.loaders.ConversationDBLoader
    public List<Conversation> fetchMessages(String str, String str2, long j) {
        Conversation conversationWithoutMessages = this.conversationDAO.readConversationWithoutMessages(this.conversationLocalId);
        if (conversationWithoutMessages == null) {
            return new ArrayList();
        }
        conversationWithoutMessages.setMessageDMs(filterMessages(str2, j, this.conversationDAO.readMessages(this.conversationLocalId.longValue()).getData()));
        ConversationUtil.sortMessagesBasedOnCreatedAt(conversationWithoutMessages.messageDMs);
        return Collections.singletonList(conversationWithoutMessages);
    }
}
