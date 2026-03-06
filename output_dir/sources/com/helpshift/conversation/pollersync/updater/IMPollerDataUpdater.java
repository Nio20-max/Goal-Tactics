package com.helpshift.conversation.pollersync.updater;

import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.idempotent.PollerSyncDataProvider;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.activeconversation.ViewableConversation;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.pollersync.merger.ConversationDataMerger;
import com.helpshift.conversation.pollersync.merger.MessagesDataMerger;
import com.helpshift.conversation.pollersync.model.ConversationsDiff;
import com.helpshift.conversation.pollersync.model.ConversationsLookup;
import com.helpshift.util.CloneUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.ListUtils;
import com.helpshift.util.ValuePair;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class IMPollerDataUpdater implements PollerDataUpdater {
    private static final String TAG = "HS_IMPollerDataUpdater";
    private ConversationDataMerger conversationDataMerger;
    private MessagesDataMerger messagesDataMerger;
    private PollerSyncDataProvider syncDataProvider;

    public IMPollerDataUpdater(Platform platform, Domain domain, PollerSyncDataProvider pollerSyncDataProvider) {
        this.syncDataProvider = pollerSyncDataProvider;
        this.conversationDataMerger = new ConversationDataMerger(platform, domain.getSDKConfigurationDM());
        this.messagesDataMerger = new MessagesDataMerger(pollerSyncDataProvider);
    }

    @Override // com.helpshift.conversation.pollersync.updater.PollerDataUpdater
    public ConversationsDiff updateData(List<Conversation> list) {
        HSLogger.d(TAG, "Starting with updating the fetched data in-memory, conversations size: " + list.size());
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        HashMap map = new HashMap();
        ViewableConversation aliveViewableConversation = this.syncDataProvider.getAliveViewableConversation();
        if (aliveViewableConversation == null) {
            HSLogger.d(TAG, "In-memory conversation not alive, returning!");
            return null;
        }
        List<Conversation> allConversations = aliveViewableConversation.getAllConversations();
        ArrayList arrayListDeepClone = CloneUtil.deepClone(allConversations);
        ConversationsLookup conversationsLookup = new ConversationsLookup(allConversations, this.syncDataProvider);
        for (Conversation conversation : list) {
            ValuePair<ConversationsLookup.MatchingID, Conversation> valuePairFind = conversationsLookup.find(conversation);
            if (valuePairFind != null) {
                HSLogger.d(TAG, "Matching conversation found in-memory, processing as updated conversation");
                Conversation conversation2 = valuePairFind.second;
                this.conversationDataMerger.mergeProperties(conversation2, conversation);
                if (!ListUtils.isEmpty(conversation.messageDMs)) {
                    map.put(conversation2, this.messagesDataMerger.mergeMessages(conversation2, conversation2.messageDMs, conversation.messageDMs));
                }
                arrayList2.add(conversation2);
            }
        }
        return new ConversationsDiff(arrayListDeepClone, arrayList, arrayList2, map);
    }
}
