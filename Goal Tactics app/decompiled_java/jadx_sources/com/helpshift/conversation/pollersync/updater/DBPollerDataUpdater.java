package com.helpshift.conversation.pollersync.updater;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.dao.DAOResult;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.idempotent.PollerSyncDataProvider;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.ConversationUtil;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.dao.ConversationDAO;
import com.helpshift.conversation.dto.IssueState;
import com.helpshift.conversation.pollersync.exception.PollerSyncException;
import com.helpshift.conversation.pollersync.merger.ConversationDataMerger;
import com.helpshift.conversation.pollersync.merger.MessagesDataMerger;
import com.helpshift.conversation.pollersync.model.ConversationsDiff;
import com.helpshift.conversation.pollersync.model.ConversationsLookup;
import com.helpshift.conversation.states.ConversationCSATState;
import com.helpshift.util.CloneUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import com.helpshift.util.ValuePair;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class DBPollerDataUpdater implements PollerDataUpdater {
    private static final String TAG = "HS_DBPollerDataUpdater";
    private ConversationDAO conversationDAO;
    private ConversationDataMerger conversationDataMerger;
    private MessagesDataMerger messagesDataMerger;
    private Platform platform;
    private PollerSyncDataProvider syncDataProvider;
    private UserDM userDM;

    public DBPollerDataUpdater(Platform platform, Domain domain, UserDM userDM, PollerSyncDataProvider pollerSyncDataProvider) {
        this.platform = platform;
        this.userDM = userDM;
        this.conversationDataMerger = new ConversationDataMerger(platform, domain.getSDKConfigurationDM());
        this.messagesDataMerger = new MessagesDataMerger(pollerSyncDataProvider);
        this.conversationDAO = platform.getConversationDAO();
        this.syncDataProvider = pollerSyncDataProvider;
    }

    @Override // com.helpshift.conversation.pollersync.updater.PollerDataUpdater
    public ConversationsDiff updateData(List<Conversation> list) throws PollerSyncException {
        HSLogger.d(TAG, "Starting with updating the fetched data in DB, conversations size: " + list.size());
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        HashMap map = new HashMap();
        List<Conversation> conversationsWithoutMessagesFromDB = readConversationsWithoutMessagesFromDB();
        ArrayList arrayListDeepClone = CloneUtil.deepClone(conversationsWithoutMessagesFromDB);
        ConversationsLookup conversationsLookup = new ConversationsLookup(conversationsWithoutMessagesFromDB, this.syncDataProvider);
        int i = 0;
        while (i < list.size()) {
            Conversation conversation = list.get(i);
            ValuePair<ConversationsLookup.MatchingID, Conversation> valuePairFind = conversationsLookup.find(conversation);
            if (valuePairFind == null) {
                HSLogger.d(TAG, "Matching conversation not found from DB, processing as new conversation");
                deriveConversationPropertiesForNewConversations(conversation, i == list.size() - 1);
                arrayList.add(conversation);
            } else {
                HSLogger.d(TAG, "Matching conversation found from DB, processing as updated conversation");
                ConversationsLookup.MatchingID matchingID = valuePairFind.first;
                Conversation conversation2 = valuePairFind.second;
                if (matchingID == ConversationsLookup.MatchingID.PREISSUE_REQUEST_ID) {
                    deleteLocalMessagesForPreIssue(conversation2);
                }
                this.conversationDataMerger.mergeProperties(conversation2, conversation);
                if (!ListUtils.isEmpty(conversation.messageDMs)) {
                    map.put(conversation2, this.messagesDataMerger.mergeMessages(conversation2, readMessagesFromDB(conversation2), conversation.messageDMs));
                }
                arrayList2.add(conversation2);
            }
            i++;
        }
        removeConvertedPreIssueConversations(arrayList);
        ConversationsDiff conversationsDiff = new ConversationsDiff(arrayListDeepClone, arrayList, arrayList2, map);
        writeToDB(conversationsDiff);
        return conversationsDiff;
    }

    private void deleteLocalMessagesForPreIssue(Conversation conversation) {
        this.conversationDAO.deleteMessagesForConversation(conversation.localId.longValue());
    }

    private void writeToDB(ConversationsDiff conversationsDiff) throws PollerSyncException {
        HSLogger.d(TAG, "Writing data to DAO, updated conversations size: " + conversationsDiff.updatedConversations.size());
        if (!this.conversationDAO.updateConversations(conversationsDiff.messagesDiffMap, conversationsDiff.updatedConversations)) {
            throw new PollerSyncException("Exception occurred while updating conversations in DB");
        }
        HSLogger.d(TAG, "Writing data to DAO, new conversations size: " + conversationsDiff.newConversations.size());
        if (!this.conversationDAO.insertConversations(conversationsDiff.newConversations)) {
            throw new PollerSyncException("Exception occurred while inserting conversations in DB");
        }
    }

    private List<Conversation> readConversationsWithoutMessagesFromDB() throws PollerSyncException {
        DAOResult<List<Conversation>> conversationsWithoutMessages = this.conversationDAO.readConversationsWithoutMessages(this.userDM.getLocalId().longValue());
        if (!conversationsWithoutMessages.isSuccess()) {
            throw new PollerSyncException("Exception occurred while reading conversations from DB");
        }
        return conversationsWithoutMessages.getData();
    }

    private List<MessageDM> readMessagesFromDB(Conversation conversation) throws PollerSyncException {
        DAOResult<List<MessageDM>> messages = this.conversationDAO.readMessages(conversation.localId.longValue());
        if (!messages.isSuccess()) {
            throw new PollerSyncException("Exception occurred while reading messages from DB");
        }
        return messages.getData();
    }

    void deriveConversationPropertiesForNewConversations(Conversation conversation, boolean z) {
        setUserLocalId(conversation);
        checkAndUpdateLastUserActivityTime(conversation);
        checkAndUpdateStateToClosed(conversation);
        checkAndUpdateStateToResolutionExpired(conversation);
        checkAndUpdateStateToResolutionAccepted(conversation);
        checkAndUpdateStartNewConversationClickedFlag(conversation, z);
        checkAndUpdateCSATStateToExpired(conversation);
    }

    private void checkAndUpdateStateToClosed(Conversation conversation) {
        if (conversation.shouldAllowNewConversationCreation) {
            conversation.state = IssueState.CLOSED;
        }
    }

    private void setUserLocalId(Conversation conversation) {
        conversation.userLocalId = this.userDM.getLocalId().longValue();
    }

    private void checkAndUpdateLastUserActivityTime(Conversation conversation) {
        if (conversation.isInPreIssueMode()) {
            conversation.lastUserActivityTime = System.currentTimeMillis();
        }
    }

    private void checkAndUpdateStateToResolutionAccepted(Conversation conversation) {
        if (conversation.state == IssueState.RESOLUTION_REQUESTED) {
            if (conversation.isInPreIssueMode() || conversation.isRedacted) {
                conversation.state = IssueState.RESOLUTION_ACCEPTED;
            }
        }
    }

    private void checkAndUpdateStateToResolutionExpired(Conversation conversation) {
        if (ConversationUtil.isResolutionQuestionExpired(this.platform, conversation)) {
            conversation.state = IssueState.RESOLUTION_EXPIRED;
        }
    }

    private void checkAndUpdateCSATStateToExpired(Conversation conversation) {
        if (ConversationUtil.isCSATTimerExpired(this.platform, conversation)) {
            conversation.csatState = ConversationCSATState.EXPIRED;
        }
    }

    /* JADX INFO: renamed from: com.helpshift.conversation.pollersync.updater.DBPollerDataUpdater$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$dto$IssueState;

        static {
            int[] iArr = new int[IssueState.values().length];
            $SwitchMap$com$helpshift$conversation$dto$IssueState = iArr;
            try {
                iArr[IssueState.RESOLUTION_ACCEPTED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$dto$IssueState[IssueState.RESOLUTION_REJECTED.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$dto$IssueState[IssueState.RESOLUTION_EXPIRED.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$dto$IssueState[IssueState.REJECTED.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$dto$IssueState[IssueState.ARCHIVED.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$dto$IssueState[IssueState.CLOSED.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
        }
    }

    private void checkAndUpdateStartNewConversationClickedFlag(Conversation conversation, boolean z) {
        boolean z2 = false;
        switch (AnonymousClass1.$SwitchMap$com$helpshift$conversation$dto$IssueState[conversation.state.ordinal()]) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
                if (!z || conversation.isRedacted) {
                    z2 = true;
                }
                break;
        }
        conversation.isStartNewConversationClicked = z2;
    }

    void removeConvertedPreIssueConversations(List<Conversation> list) {
        if (list.size() <= 1) {
            return;
        }
        ArrayList arrayList = new ArrayList(list);
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            Conversation conversation = (Conversation) arrayList.get(size);
            if (!conversation.isInPreIssueMode()) {
                int i = size - 1;
                while (true) {
                    if (i >= 0) {
                        Conversation conversation2 = (Conversation) arrayList.get(i);
                        if (!StringUtils.isEmpty(conversation.preConversationServerId) && conversation.preConversationServerId.equals(conversation2.preConversationServerId) && conversation.serverId.equals(conversation2.serverId)) {
                            conversation.messageDMs.addAll(conversation2.messageDMs);
                            list.remove(conversation2);
                            break;
                        }
                        i--;
                    }
                }
            }
        }
    }
}
