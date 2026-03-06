package com.helpshift.conversation.pollersync;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.idempotent.PollerSyncDataProvider;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.ConversationUtil;
import com.helpshift.conversation.activeconversation.ConversationManager;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.pollersync.exception.PollerSyncException;
import com.helpshift.conversation.pollersync.listener.DBPollerDataChangeListener;
import com.helpshift.conversation.pollersync.listener.IMPollerDataChangeListener;
import com.helpshift.conversation.pollersync.listener.PollerDataChangeListener;
import com.helpshift.conversation.pollersync.model.ConversationsDiff;
import com.helpshift.conversation.pollersync.model.ConversationsLookup;
import com.helpshift.conversation.pollersync.model.MessagesDiff;
import com.helpshift.conversation.pollersync.updater.DBPollerDataUpdater;
import com.helpshift.conversation.pollersync.updater.IMPollerDataUpdater;
import com.helpshift.conversation.pollersync.updater.PollerDataUpdater;
import com.helpshift.conversation.util.predicate.ConversationPredicates;
import com.helpshift.util.CloneUtil;
import com.helpshift.util.Filters;
import com.helpshift.util.ListUtils;
import com.helpshift.util.ValuePair;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class PollerSyncManager {
    private static final String TAG = "HS_PollerSyncManager";
    private ConversationManager conversationManager;
    private PollerDataChangeListener dbDataChangeListener;
    private PollerDataUpdater dbDataUpdater;
    private PollerDataChangeListener imDataChangeListener;
    private PollerDataUpdater imDataUpdater;
    private PollerSyncDataProvider syncDataProvider;

    public PollerSyncManager(Domain domain, Platform platform, UserDM userDM, PollerSyncDataProvider pollerSyncDataProvider, ConversationManager conversationManager) {
        this.conversationManager = conversationManager;
        this.syncDataProvider = pollerSyncDataProvider;
        this.dbDataUpdater = new DBPollerDataUpdater(platform, domain, userDM, pollerSyncDataProvider);
        this.imDataUpdater = new IMPollerDataUpdater(platform, domain, pollerSyncDataProvider);
        this.dbDataChangeListener = new DBPollerDataChangeListener(conversationManager, pollerSyncDataProvider);
        this.imDataChangeListener = new IMPollerDataChangeListener(domain, platform, conversationManager, pollerSyncDataProvider);
    }

    public void sync(List<Conversation> list, boolean z) throws PollerSyncException {
        if (ListUtils.isEmpty(list)) {
            return;
        }
        List<Conversation> listFilterAndSort = filterAndSort(list);
        if (ListUtils.isEmpty(listFilterAndSort)) {
            return;
        }
        Iterator<List<Conversation>> it = divideIntoChunksIfNeeded(listFilterAndSort, z).iterator();
        while (it.hasNext()) {
            syncInternal(it.next());
        }
    }

    private void syncInternal(List<Conversation> list) throws PollerSyncException {
        ConversationsDiff conversationsDiffUpdateData = this.dbDataUpdater.updateData(list);
        dispatchListenerCallbacks(this.dbDataChangeListener, conversationsDiffUpdateData);
        if (this.syncDataProvider.getAliveViewableConversation() != null) {
            List<Conversation> listCreateRemoteConversationsForIMDataUpdater = createRemoteConversationsForIMDataUpdater(conversationsDiffUpdateData);
            if (!ListUtils.isEmpty(listCreateRemoteConversationsForIMDataUpdater)) {
                dispatchListenerCallbacks(this.imDataChangeListener, this.imDataUpdater.updateData(listCreateRemoteConversationsForIMDataUpdater));
            }
        }
        onConversationsSyncComplete(list, conversationsDiffUpdateData);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x003d A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0011 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.util.List<java.util.List<com.helpshift.conversation.activeconversation.model.Conversation>> divideIntoChunksIfNeeded(java.util.List<com.helpshift.conversation.activeconversation.model.Conversation> r7, boolean r8) {
        /*
            r6 = this;
            if (r8 != 0) goto L5a
            java.util.HashSet r8 = new java.util.HashSet
            r8.<init>()
            java.util.HashSet r0 = new java.util.HashSet
            r0.<init>()
            r1 = 0
            java.util.Iterator r2 = r7.iterator()
        L11:
            boolean r3 = r2.hasNext()
            r4 = 1
            if (r3 == 0) goto L4c
            java.lang.Object r3 = r2.next()
            com.helpshift.conversation.activeconversation.model.Conversation r3 = (com.helpshift.conversation.activeconversation.model.Conversation) r3
            java.lang.String r5 = r3.preConversationServerId
            boolean r5 = com.helpshift.util.StringUtils.isEmpty(r5)
            if (r5 != 0) goto L35
            java.lang.String r5 = r3.preConversationServerId
            boolean r5 = r8.contains(r5)
            if (r5 == 0) goto L30
        L2e:
            r1 = 1
            goto L4c
        L30:
            java.lang.String r5 = r3.preConversationServerId
            r8.add(r5)
        L35:
            java.lang.String r5 = r3.serverId
            boolean r5 = com.helpshift.util.StringUtils.isEmpty(r5)
            if (r5 != 0) goto L11
            java.lang.String r5 = r3.serverId
            boolean r5 = r0.contains(r5)
            if (r5 == 0) goto L46
            goto L2e
        L46:
            java.lang.String r3 = r3.serverId
            r0.add(r3)
            goto L11
        L4c:
            if (r1 == 0) goto L5a
            java.lang.String r8 = "HS_PollerSyncManager"
            java.lang.String r0 = "Found duplicate conversations in same response, will chunk the data for processing"
            com.helpshift.util.HSLogger.d(r8, r0)
            java.util.List r7 = com.helpshift.util.ListUtils.unflatten(r7)
            return r7
        L5a:
            java.util.ArrayList r8 = new java.util.ArrayList
            r8.<init>()
            r8.add(r7)
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.conversation.pollersync.PollerSyncManager.divideIntoChunksIfNeeded(java.util.List, boolean):java.util.List");
    }

    private void dispatchListenerCallbacks(PollerDataChangeListener pollerDataChangeListener, ConversationsDiff conversationsDiff) {
        if (pollerDataChangeListener == null || conversationsDiff == null) {
            return;
        }
        List<Conversation> list = conversationsDiff.existingConversations;
        List<Conversation> list2 = conversationsDiff.updatedConversations;
        ConversationsLookup conversationsLookup = new ConversationsLookup(list, this.syncDataProvider);
        for (Conversation conversation : list2) {
            ValuePair<ConversationsLookup.MatchingID, Conversation> valuePairFind = conversationsLookup.find(conversation);
            if (valuePairFind != null) {
                pollerDataChangeListener.onConversationUpdated(valuePairFind.second, conversation);
            }
            MessagesDiff messagesDiff = conversationsDiff.messagesDiffMap.get(conversation);
            if (messagesDiff != null) {
                List<MessageDM> list3 = messagesDiff.newMessages;
                if (!ListUtils.isEmpty(list3)) {
                    pollerDataChangeListener.onMessagesAdded(conversation, list3);
                }
                List<MessageDM> list4 = messagesDiff.updatedMessages;
                if (!ListUtils.isEmpty(list4)) {
                    pollerDataChangeListener.onMessagesUpdated(messagesDiff.existingMessages, list4);
                }
            }
        }
    }

    private List<Conversation> createRemoteConversationsForIMDataUpdater(ConversationsDiff conversationsDiff) {
        ArrayList arrayList = new ArrayList();
        for (Conversation conversation : conversationsDiff.updatedConversations) {
            Conversation conversationDeepClone = conversation.deepClone();
            MessagesDiff messagesDiff = conversationsDiff.messagesDiffMap.get(conversation);
            if (messagesDiff != null) {
                conversationDeepClone.messageDMs.addAll(CloneUtil.deepClone(messagesDiff.updatedMessages));
                conversationDeepClone.messageDMs.addAll(CloneUtil.deepClone(messagesDiff.newMessages));
            }
            arrayList.add(conversationDeepClone);
        }
        return arrayList;
    }

    private List<Conversation> filterAndSort(List<Conversation> list) {
        List<Conversation> listFilter = Filters.filter(list, ConversationPredicates.allMessagesAfterLastMessageInDbPredicate(this.conversationManager));
        ConversationUtil.sortConversationsBasedOnCreatedAt(listFilter);
        return listFilter;
    }

    private void onConversationsSyncComplete(List<Conversation> list, ConversationsDiff conversationsDiff) {
        this.conversationManager.clearRequestIdForPendingCreateConversationCalls(list);
        for (Map.Entry<Conversation, MessagesDiff> entry : conversationsDiff.messagesDiffMap.entrySet()) {
            this.conversationManager.clearRequestIdForPendingSendMessageCalls(entry.getKey(), entry.getValue().updatedMessages);
        }
    }
}
