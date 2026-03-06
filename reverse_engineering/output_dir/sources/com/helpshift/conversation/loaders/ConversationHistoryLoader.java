package com.helpshift.conversation.loaders;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.platform.Platform;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationHistoryLoader extends ConversationsLoader {
    public ConversationHistoryLoader(Platform platform, UserDM userDM, RemoteConversationLoader remoteConversationLoader, long j) {
        super(platform, new ConversationHistoryDBLoader(userDM, platform.getConversationDAO()), remoteConversationLoader, j);
    }

    @Override // com.helpshift.conversation.loaders.ConversationsLoader
    public boolean hasMoreMessages() {
        return this.conversationDBLoader.hasMoreMessages() || this.remoteConversationLoader.hasMoreMessage();
    }
}
