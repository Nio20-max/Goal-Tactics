package com.helpshift.conversation.pollersync.listener;

import com.helpshift.common.domain.idempotent.PollerSyncDataProvider;
import com.helpshift.conversation.activeconversation.ConversationManager;
import com.helpshift.conversation.activeconversation.ViewableConversation;
import com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM;
import com.helpshift.conversation.activeconversation.message.AttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.RequestForReopenMessageDM;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.dto.IssueState;
import com.helpshift.conversation.states.ConversationCSATState;
import com.helpshift.util.HSLogger;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class DBPollerDataChangeListener implements PollerDataChangeListener {
    private static final String TAG = "HS_DBPollChangeListener";
    private ConversationManager conversationManager;
    private PollerSyncDataProvider syncDataProvider;

    public DBPollerDataChangeListener(ConversationManager conversationManager, PollerSyncDataProvider pollerSyncDataProvider) {
        this.conversationManager = conversationManager;
        this.syncDataProvider = pollerSyncDataProvider;
    }

    @Override // com.helpshift.conversation.pollersync.listener.PollerDataChangeListener
    public void onConversationUpdated(Conversation conversation, Conversation conversation2) {
        HSLogger.d(TAG, "onConversationUpdated called");
        if (conversation.state != conversation2.state) {
            onStateChanged(conversation, conversation2);
        }
        if (conversation.csatState != conversation2.csatState) {
            onCSATStateChanged(conversation, conversation2);
        }
        String pendingRequestIdForPreissue = this.syncDataProvider.getPendingRequestIdForPreissue();
        if (StringUtils.isEmpty(conversation.preConversationServerId) && pendingRequestIdForPreissue != null && pendingRequestIdForPreissue.equals(conversation2.createdRequestId)) {
            if (conversation2.isInPreIssueMode()) {
                onPreIssueCreated(conversation2);
            } else {
                onIssueDirectlyCreatedFromPreIssue(conversation2);
            }
        }
    }

    @Override // com.helpshift.conversation.pollersync.listener.PollerDataChangeListener
    public void onMessagesUpdated(List<MessageDM> list, List<MessageDM> list2) {
        HSLogger.d(TAG, "onMessagesUpdated called with size: " + list2.size());
        ArrayList arrayList = new ArrayList();
        for (MessageDM messageDM : list2) {
            if (messageDM.isRedacted) {
                if (messageDM instanceof AttachmentMessageDM) {
                    arrayList.add(messageDM);
                } else if (messageDM instanceof AdminActionCardMessageDM) {
                    arrayList.add(messageDM);
                }
            }
        }
        this.conversationManager.clearRedactedAttachmentsResources(arrayList);
    }

    @Override // com.helpshift.conversation.pollersync.listener.PollerDataChangeListener
    public void onMessagesAdded(Conversation conversation, List<MessageDM> list) {
        RequestForReopenMessageDM rfrMessage;
        if (ListUtils.isEmpty(list)) {
            return;
        }
        HSLogger.d(TAG, "onMessagesAdded called with size: " + list.size());
        MessageDM messageDM = list.get(list.size() + (-1));
        if (messageDM instanceof RequestForReopenMessageDM) {
            RequestForReopenMessageDM requestForReopenMessageDM = (RequestForReopenMessageDM) messageDM;
            if (requestForReopenMessageDM.isAnswered()) {
                return;
            }
            checkToReopenConversation(conversation, requestForReopenMessageDM);
            return;
        }
        if (!conversation.isFeedbackBotEnabled || conversation.state != IssueState.RESOLUTION_REQUESTED || (rfrMessage = getRfrMessage(list)) == null || rfrMessage.isAnswered()) {
            return;
        }
        checkToReopenConversation(conversation, rfrMessage);
    }

    private RequestForReopenMessageDM getRfrMessage(List<MessageDM> list) {
        for (int size = list.size() - 1; size >= 0; size--) {
            MessageDM messageDM = list.get(size);
            if (messageDM instanceof RequestForReopenMessageDM) {
                return (RequestForReopenMessageDM) messageDM;
            }
        }
        return null;
    }

    private void onCSATStateChanged(Conversation conversation, Conversation conversation2) {
        if (conversation2.csatState != ConversationCSATState.EXPIRED || conversation.csatState == ConversationCSATState.SUBMITTED_SYNCED) {
            return;
        }
        this.conversationManager.sendCSATExpiryEvent(conversation2);
    }

    private void onStateChanged(Conversation conversation, Conversation conversation2) {
        IssueState issueState = conversation2.state;
        HSLogger.d(TAG, "State changed for issue from " + conversation.state + " to: " + issueState);
        if (issueState == IssueState.COMPLETED_ISSUE_CREATED) {
            this.conversationManager.sendConversationPostedEvent(conversation2);
        } else if (issueState == IssueState.RESOLUTION_ACCEPTED) {
            if (conversation.isIssueInProgress() && !conversation.isInPreIssueMode()) {
                this.conversationManager.sendConfirmationAcceptedMessageAndDelegates(conversation2);
            }
            this.conversationManager.handleConversationEnded(conversation2);
        } else if (issueState == IssueState.RESOLUTION_EXPIRED) {
            this.conversationManager.sendResolutionQuestionExpiryEvent(conversation2);
            this.conversationManager.handleConversationEnded(conversation2);
        } else if (issueState == IssueState.REJECTED || issueState == IssueState.CLOSED) {
            this.conversationManager.handleConversationEnded(conversation2);
        }
        checkAndUpdateMessageUnreadCount(conversation, conversation2);
    }

    private void checkAndUpdateMessageUnreadCount(Conversation conversation, Conversation conversation2) {
        ViewableConversation aliveViewableConversation = this.syncDataProvider.getAliveViewableConversation();
        if (aliveViewableConversation == null || !aliveViewableConversation.isVisibleOnUI()) {
            IssueState issueState = conversation2.state;
            if (conversation.isIssueInProgress() && (issueState == IssueState.RESOLUTION_REQUESTED || issueState == IssueState.RESOLUTION_ACCEPTED || issueState == IssueState.RESOLUTION_REJECTED || issueState == IssueState.RESOLUTION_EXPIRED)) {
                this.conversationManager.setShouldIncrementMessageCount(conversation2, true, true);
            } else if (conversation2.isIssueInProgress()) {
                this.conversationManager.setShouldIncrementMessageCount(conversation2, false, true);
            }
        }
    }

    private void checkToReopenConversation(Conversation conversation, RequestForReopenMessageDM requestForReopenMessageDM) {
        String str;
        boolean z;
        Conversation activeConversationFromStorage = this.syncDataProvider.getActiveConversationFromStorage();
        int currentConversationViewState = this.syncDataProvider.getCurrentConversationViewState();
        if (activeConversationFromStorage == null) {
            str = null;
        } else if (!activeConversationFromStorage.isInPreIssueMode()) {
            str = activeConversationFromStorage.serverId;
        } else {
            str = null;
            z = true;
            this.conversationManager.checkAndReopen(conversation, requestForReopenMessageDM, currentConversationViewState, str, z);
        }
        z = false;
        this.conversationManager.checkAndReopen(conversation, requestForReopenMessageDM, currentConversationViewState, str, z);
    }

    private void onPreIssueCreated(Conversation conversation) {
        HSLogger.d(TAG, "Preissue created from poller response");
        this.conversationManager.handlePreIssueCreationSuccess(conversation);
    }

    private void onIssueDirectlyCreatedFromPreIssue(Conversation conversation) {
        HSLogger.d(TAG, "Preissue creation skipped, issue created directly - idempotent case.");
        this.conversationManager.sendConversationPostedEvent(conversation);
    }
}
