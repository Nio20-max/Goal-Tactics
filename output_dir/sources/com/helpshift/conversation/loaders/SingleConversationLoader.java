package com.helpshift.conversation.loaders;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.util.ListUtils;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SingleConversationLoader extends ConversationsLoader {
    private Long activeConversationId;
    private boolean isActiveConversationFullyFetched;
    private Platform platform;
    private UserDM userDM;

    public SingleConversationLoader(Platform platform, UserDM userDM, Long l, RemoteConversationLoader remoteConversationLoader, long j) {
        super(platform, new SingleConversationDBLoader(platform.getConversationDAO(), l), remoteConversationLoader, j);
        this.isActiveConversationFullyFetched = false;
        this.platform = platform;
        this.userDM = userDM;
        this.activeConversationId = l;
    }

    @Override // com.helpshift.conversation.loaders.ConversationsLoader
    public boolean hasMoreMessages() {
        if (this.isActiveConversationFullyFetched) {
            return false;
        }
        if (this.conversationDBLoader.hasMoreMessages()) {
            return true;
        }
        List<Conversation> data = this.platform.getConversationDAO().readConversationsWithoutMessages(this.userDM.getLocalId().longValue()).getData();
        if (!ListUtils.isEmpty(data)) {
            long epochCreatedAtTime = 0;
            Iterator<Conversation> it = data.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Conversation next = it.next();
                if (next.localId.equals(this.activeConversationId)) {
                    epochCreatedAtTime = next.getEpochCreatedAtTime();
                    break;
                }
            }
            for (Conversation conversation : data) {
                if (!conversation.localId.equals(this.activeConversationId) && epochCreatedAtTime > conversation.getEpochCreatedAtTime()) {
                    this.isActiveConversationFullyFetched = true;
                    return false;
                }
            }
        }
        return this.remoteConversationLoader.hasMoreMessage();
    }
}
