package com.helpshift.conversation.pollersync.model;

import com.helpshift.common.domain.idempotent.PollerSyncDataProvider;
import com.helpshift.conversation.ConversationUtil;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import com.helpshift.util.ValuePair;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationsLookup {
    private ValuePair<String, Conversation> lookupByPreIssueRequestId;
    private PollerSyncDataProvider pollerSyncDataProvider;
    private final Map<String, Conversation> lookupByPreIssueId = new HashMap();
    private final Map<String, Conversation> lookupByIssueId = new HashMap();

    public enum MatchingID {
        SERVER_ID,
        PREISSUE_ID,
        PREISSUE_REQUEST_ID
    }

    public ConversationsLookup(List<Conversation> list, PollerSyncDataProvider pollerSyncDataProvider) {
        this.pollerSyncDataProvider = pollerSyncDataProvider;
        populateLookup(list);
    }

    private void populateLookup(List<Conversation> list) {
        if (ListUtils.isEmpty(list)) {
            return;
        }
        ConversationUtil.sortConversationsBasedOnCreatedAt(list);
        for (Conversation conversation : list) {
            if (!StringUtils.isEmpty(conversation.serverId)) {
                this.lookupByIssueId.put(conversation.serverId, conversation);
            } else if (!StringUtils.isEmpty(conversation.preConversationServerId)) {
                this.lookupByPreIssueId.put(conversation.preConversationServerId, conversation);
            }
        }
        String pendingRequestIdForPreissue = this.pollerSyncDataProvider.getPendingRequestIdForPreissue();
        if (pendingRequestIdForPreissue != null) {
            this.lookupByPreIssueRequestId = new ValuePair<>(pendingRequestIdForPreissue, list.get(list.size() - 1));
        }
    }

    public ValuePair<MatchingID, Conversation> find(Conversation conversation) {
        ValuePair<String, Conversation> valuePair;
        String str = conversation.serverId;
        String str2 = conversation.preConversationServerId;
        String str3 = conversation.createdRequestId;
        if (this.lookupByIssueId.containsKey(str)) {
            return new ValuePair<>(MatchingID.SERVER_ID, this.lookupByIssueId.get(str));
        }
        if (this.lookupByPreIssueId.containsKey(str2)) {
            return new ValuePair<>(MatchingID.PREISSUE_ID, this.lookupByPreIssueId.get(str2));
        }
        if (StringUtils.isEmpty(str3) || (valuePair = this.lookupByPreIssueRequestId) == null || !valuePair.first.equals(str3)) {
            return null;
        }
        return new ValuePair<>(MatchingID.PREISSUE_REQUEST_ID, this.lookupByPreIssueRequestId.second);
    }
}
