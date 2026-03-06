package com.helpshift.conversation.pollersync.listener;

import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.idempotent.PollerSyncDataProvider;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.ConversationUtil;
import com.helpshift.conversation.activeconversation.ConversationManager;
import com.helpshift.conversation.activeconversation.ViewableConversation;
import com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminImageAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.RequestScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.UserAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.UserMessageDM;
import com.helpshift.conversation.activeconversation.message.UserMessageState;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.dto.IssueState;
import com.helpshift.util.HSLogger;
import com.helpshift.util.StringUtils;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class IMPollerDataChangeListener implements PollerDataChangeListener {
    private static final String TAG = "HS_IMPollChangeListener";
    private ConversationManager conversationManager;
    private Domain domain;
    private Platform platform;
    private PollerSyncDataProvider syncDataProvider;

    public IMPollerDataChangeListener(Domain domain, Platform platform, ConversationManager conversationManager, PollerSyncDataProvider pollerSyncDataProvider) {
        this.domain = domain;
        this.platform = platform;
        this.conversationManager = conversationManager;
        this.syncDataProvider = pollerSyncDataProvider;
    }

    @Override // com.helpshift.conversation.pollersync.listener.PollerDataChangeListener
    public void onConversationUpdated(Conversation conversation, Conversation conversation2) {
        HSLogger.d(TAG, "onConversationUpdated called");
        ViewableConversation aliveViewableConversation = getAliveViewableConversation();
        if (aliveViewableConversation == null) {
            HSLogger.d(TAG, "No in-memory conversation found for updates, hence returning!");
            return;
        }
        if (!aliveViewableConversation.isActiveConversationEqual(conversation2)) {
            HSLogger.d(TAG, "Updates received for different conversation than in-memory, hence returning!");
            return;
        }
        String pendingRequestIdForPreissue = this.syncDataProvider.getPendingRequestIdForPreissue();
        if (StringUtils.isEmpty(conversation.preConversationServerId) && pendingRequestIdForPreissue != null && pendingRequestIdForPreissue.equals(conversation2.createdRequestId) && conversation2.isInPreIssueMode()) {
            onPreIssueCreated();
        }
        if (conversation.isInPreIssueMode() && !conversation2.isInPreIssueMode()) {
            onPreIssueToIssueConversion();
        }
        if (conversation.state != conversation2.state) {
            if (conversation2.isInPreIssueMode()) {
                onStateChangedForPreIssue(conversation2);
            } else {
                onStateChangedForIssue(conversation, conversation2);
            }
        }
    }

    @Override // com.helpshift.conversation.pollersync.listener.PollerDataChangeListener
    public void onMessagesUpdated(List<MessageDM> list, List<MessageDM> list2) {
        HSLogger.d(TAG, "onMessagesUpdated called with size: " + list2.size());
        for (MessageDM messageDM : list2) {
            if (messageDM instanceof UserMessageDM) {
                ((UserMessageDM) messageDM).setState(UserMessageState.SENT);
            } else if (messageDM instanceof ScreenshotMessageDM) {
                ((ScreenshotMessageDM) messageDM).setState(UserMessageState.SENT);
            } else if (messageDM instanceof UserAttachmentMessageDM) {
                ((UserAttachmentMessageDM) messageDM).setState(UserAttachmentMessageDM.UserGenericAttachmentState.SENT);
            } else {
                messageDM.notifyUpdated();
            }
        }
    }

    @Override // com.helpshift.conversation.pollersync.listener.PollerDataChangeListener
    public void onMessagesAdded(Conversation conversation, List<MessageDM> list) {
        HSLogger.d(TAG, "onMessagesAdded called with size: " + list.size());
        addDependenciesOnNewMessages(conversation, list);
        ViewableConversation aliveViewableConversation = getAliveViewableConversation();
        if (aliveViewableConversation != null && aliveViewableConversation.isActiveConversationEqual(conversation)) {
            initializeMessagesForActiveConversation(conversation, list);
        } else {
            conversation.messageDMs.addAll(list);
        }
        this.conversationManager.evaluateBotControlMessages(conversation, list);
    }

    private void addDependenciesOnNewMessages(Conversation conversation, List<MessageDM> list) {
        for (MessageDM messageDM : list) {
            messageDM.setDependencies(this.domain, this.platform);
            if (messageDM instanceof UserMessageDM) {
                ((UserMessageDM) messageDM).setState(UserMessageState.SENT);
            } else if (messageDM instanceof ScreenshotMessageDM) {
                ((ScreenshotMessageDM) messageDM).setState(UserMessageState.SENT);
            } else if (messageDM instanceof UserAttachmentMessageDM) {
                ((UserAttachmentMessageDM) messageDM).setState(UserAttachmentMessageDM.UserGenericAttachmentState.SENT);
            }
            messageDM.addObserver(conversation);
        }
    }

    private void initializeMessagesForActiveConversation(Conversation conversation, List<MessageDM> list) {
        ConversationUtil.sortMessagesBasedOnCreatedAt(list);
        conversation.isInBetweenBotExecution = this.conversationManager.evaluateBotExecutionState(list, conversation.isInBetweenBotExecution);
        conversation.messageDMs.addAll(list);
        for (MessageDM messageDM : list) {
            if (messageDM instanceof AdminImageAttachmentMessageDM) {
                ((AdminImageAttachmentMessageDM) messageDM).downloadThumbnailImage(this.platform);
            } else if (messageDM instanceof RequestScreenshotMessageDM) {
                ((RequestScreenshotMessageDM) messageDM).setAttachmentButtonClickable(this.conversationManager.shouldEnableMessagesClick(conversation));
            } else if (messageDM instanceof AdminActionCardMessageDM) {
                ((AdminActionCardMessageDM) messageDM).downloadImage(this.platform);
            }
            this.conversationManager.updateAcceptedRequestForReopenMessageDMs(conversation, messageDM);
        }
    }

    private void onPreIssueToIssueConversion() {
        HSLogger.d(TAG, "Preissue converted to issue");
        ViewableConversation aliveViewableConversation = getAliveViewableConversation();
        if (aliveViewableConversation == null) {
            return;
        }
        aliveViewableConversation.startLiveUpdates();
    }

    private void onStateChangedForPreIssue(Conversation conversation) {
        HSLogger.d(TAG, "State changed for preissue to: " + conversation.state);
        ViewableConversation aliveViewableConversation = getAliveViewableConversation();
        if (aliveViewableConversation == null) {
            return;
        }
        IssueState issueState = conversation.state;
        this.conversationManager.updateMessagesOnIssueStatusUpdate(conversation);
        aliveViewableConversation.onIssueStatusChange(issueState);
    }

    private void onStateChangedForIssue(Conversation conversation, Conversation conversation2) {
        IssueState issueState = conversation.state;
        IssueState issueState2 = conversation2.state;
        HSLogger.d(TAG, "State changed for issue from " + issueState + " to: " + issueState2);
        ViewableConversation aliveViewableConversation = getAliveViewableConversation();
        if (aliveViewableConversation == null) {
            return;
        }
        this.conversationManager.updateMessagesOnIssueStatusUpdate(conversation2);
        boolean z = conversation2.isIssueInProgress() && conversation.isIssueInProgress();
        if ((issueState == IssueState.COMPLETED_ISSUE_CREATED) || !z) {
            aliveViewableConversation.onIssueStatusChange(issueState2);
        }
    }

    private void onPreIssueCreated() {
        HSLogger.d(TAG, "Preissue created from poller response");
        ViewableConversation aliveViewableConversation = getAliveViewableConversation();
        if (aliveViewableConversation == null) {
            return;
        }
        aliveViewableConversation.handleIdempotentPreIssueCreationSuccess();
    }

    private ViewableConversation getAliveViewableConversation() {
        return this.syncDataProvider.getAliveViewableConversation();
    }
}
