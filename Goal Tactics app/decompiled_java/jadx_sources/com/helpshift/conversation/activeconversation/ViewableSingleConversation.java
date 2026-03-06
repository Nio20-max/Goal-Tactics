package com.helpshift.conversation.activeconversation;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.activeconversation.ViewableConversation;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.loaders.SingleConversationLoader;
import com.helpshift.util.HSListObserver;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class ViewableSingleConversation extends ViewableConversation {
    private Conversation conversation;

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public void onNewConversationStarted(Conversation conversation) {
    }

    public ViewableSingleConversation(Platform platform, Domain domain, UserDM userDM, SingleConversationLoader singleConversationLoader, ConversationManager conversationManager) {
        super(platform, domain, userDM, singleConversationLoader, conversationManager);
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public ViewableConversation.ConversationType getType() {
        return ViewableConversation.ConversationType.SINGLE;
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public synchronized void init() {
        Conversation conversation = this.conversationLoader.fetchInitialConversations().get(0);
        this.conversation = conversation;
        conversation.userLocalId = this.userDM.getLocalId().longValue();
        Iterator<MessageDM> it = this.conversation.messageDMs.iterator();
        while (it.hasNext()) {
            it.next().setDependencies(this.domain, this.platform);
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public boolean shouldOpen() {
        return this.conversationManager.shouldOpen(this.conversation);
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public Conversation getActiveConversation() {
        return this.conversation;
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public void initializeConversationsForUI() {
        this.conversationManager.initializeMessagesForUI(this.conversation, true);
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public void registerMessagesObserver(HSListObserver<MessageDM> hSListObserver) {
        this.conversation.messageDMs.setObserver(hSListObserver);
        this.conversation.registerMessagesObserver();
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public List<Conversation> getAllConversations() {
        return Collections.singletonList(this.conversation);
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public void prependConversations(List<Conversation> list) {
        int size = list.size();
        for (int i = 0; i < size; i++) {
            Conversation conversation = list.get(i);
            if (this.conversation.localId.equals(conversation.localId)) {
                this.conversation.messageDMs.prependItems(conversation.messageDMs);
            }
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ViewableConversation
    public PaginationCursor getPaginationCursor() {
        return buildPaginationCursor(this.conversation);
    }
}
