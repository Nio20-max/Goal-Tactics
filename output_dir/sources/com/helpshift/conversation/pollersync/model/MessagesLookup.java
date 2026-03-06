package com.helpshift.conversation.pollersync.model;

import com.helpshift.common.domain.idempotent.PollerSyncDataProvider;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class MessagesLookup {
    private final Map<String, MessageDM> lookupByServerId = new HashMap();
    private final Map<String, MessageDM> lookupByRequestId = new HashMap();

    public MessagesLookup(Conversation conversation, List<MessageDM> list, PollerSyncDataProvider pollerSyncDataProvider) {
        populateLookup(pollerSyncDataProvider, conversation, list);
    }

    private void populateLookup(PollerSyncDataProvider pollerSyncDataProvider, Conversation conversation, List<MessageDM> list) {
        if (ListUtils.isEmpty(list)) {
            return;
        }
        Map<String, String> messagesLocalIdToPendingRequestIdMap = pollerSyncDataProvider.getMessagesLocalIdToPendingRequestIdMap(conversation);
        for (MessageDM messageDM : list) {
            if (!StringUtils.isEmpty(messageDM.serverId)) {
                this.lookupByServerId.put(messageDM.serverId, messageDM);
            }
            if (messageDM.localId != null) {
                String strValueOf = String.valueOf(messageDM.localId);
                if (messagesLocalIdToPendingRequestIdMap != null && messagesLocalIdToPendingRequestIdMap.containsKey(strValueOf)) {
                    this.lookupByRequestId.put(messagesLocalIdToPendingRequestIdMap.get(strValueOf), messageDM);
                }
            }
        }
    }

    public MessageDM find(MessageDM messageDM) {
        String str = messageDM.serverId;
        String str2 = messageDM.createdRequestId;
        if (this.lookupByServerId.containsKey(str)) {
            return this.lookupByServerId.get(str);
        }
        if (this.lookupByRequestId.containsKey(str2)) {
            return this.lookupByRequestId.get(str2);
        }
        return null;
    }
}
