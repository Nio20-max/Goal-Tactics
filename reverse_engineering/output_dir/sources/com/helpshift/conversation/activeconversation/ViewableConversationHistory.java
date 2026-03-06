package com.helpshift.conversation.activeconversation;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.activeconversation.ViewableConversation;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.loaders.ConversationHistoryLoader;
import com.helpshift.util.HSListObserver;
import com.helpshift.util.ListUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class ViewableConversationHistory extends ViewableConversation {
    private List<Conversation> conversations;

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public boolean shouldOpen() {
        return true;
    }

    public ViewableConversationHistory(Platform platform, Domain domain, UserDM userDM, ConversationHistoryLoader conversationHistoryLoader, ConversationManager conversationManager) {
        super(platform, domain, userDM, conversationHistoryLoader, conversationManager);
        this.conversations = new ArrayList();
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public ViewableConversation.ConversationType getType() {
        return ViewableConversation.ConversationType.HISTORY;
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public synchronized void init() {
        List<Conversation> listFetchInitialConversations = this.conversationLoader.fetchInitialConversations();
        this.conversations = listFetchInitialConversations;
        for (Conversation conversation : listFetchInitialConversations) {
            conversation.userLocalId = this.userDM.getLocalId().longValue();
            this.conversationManager.updateStateBasedOnMessages(conversation);
            Iterator<MessageDM> it = conversation.messageDMs.iterator();
            while (it.hasNext()) {
                it.next().setDependencies(this.domain, this.platform);
            }
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public synchronized Conversation getActiveConversation() {
        return this.conversations.get(r0.size() - 1);
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public synchronized void initializeConversationsForUI() {
        long jLongValue = getActiveConversation().localId.longValue();
        for (Conversation conversation : this.conversations) {
            this.conversationManager.initializeMessagesForUI(conversation, conversation.localId.equals(Long.valueOf(jLongValue)));
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public synchronized void registerMessagesObserver(HSListObserver<MessageDM> hSListObserver) {
        for (Conversation conversation : this.conversations) {
            conversation.messageDMs.setObserver(hSListObserver);
            conversation.registerMessagesObserver();
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public synchronized void onNewConversationStarted(Conversation conversation) {
        conversation.setListener(this);
        this.conversations.add(conversation);
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public synchronized List<Conversation> getAllConversations() {
        return new ArrayList(this.conversations);
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public synchronized void prependConversations(List<Conversation> list) {
        HashMap map = new HashMap();
        for (Conversation conversation : this.conversations) {
            map.put(conversation.localId, conversation);
        }
        int size = list.size();
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < size; i++) {
            Conversation conversation2 = list.get(i);
            Conversation conversation3 = (Conversation) map.get(conversation2.localId);
            if (conversation3 != null) {
                conversation3.messageDMs.prependItems(conversation2.messageDMs);
            } else {
                arrayList.add(conversation2);
            }
        }
        if (!ListUtils.isEmpty(arrayList)) {
            this.conversations.addAll(0, arrayList);
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public synchronized PaginationCursor getPaginationCursor() {
        if (ListUtils.isEmpty(this.conversations)) {
            return null;
        }
        return buildPaginationCursor(this.conversations.get(0));
    }
}
