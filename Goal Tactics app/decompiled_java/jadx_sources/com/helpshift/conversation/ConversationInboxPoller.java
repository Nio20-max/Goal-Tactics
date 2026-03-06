package com.helpshift.conversation;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.app.AppLifeCycleStateHolder;
import com.helpshift.common.domain.PollFunction;
import com.helpshift.common.domain.Poller;
import com.helpshift.common.domain.PollingInterval;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.dao.ConversationDAO;
import com.helpshift.conversation.dto.IssueState;
import com.helpshift.util.HSLogger;
import com.helpshift.util.ListUtils;
import java.util.List;
import java.util.Observable;
import java.util.Observer;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationInboxPoller implements Observer {
    private static final long INITIAL_DELAY = 3000;
    private static final String TAG = "Helpshift_ConvPoller";
    private final ConversationDAO conversationDAO;
    private PollingInterval currentPollingInterval;
    private PollFunction.PollFunctionListener pollFunctionListener = new PollFunction.PollFunctionListener() { // from class: com.helpshift.conversation.ConversationInboxPoller.1
        @Override // com.helpshift.common.domain.PollFunction.PollFunctionListener
        public void onPollingStoppedViaBackoffStrategy() {
            HSLogger.d(ConversationInboxPoller.TAG, "Poll stopped via backoff, resetting currentPollingInterval");
            ConversationInboxPoller.this.stop();
        }
    };
    public final Poller poller;
    private final SDKConfigurationDM sdkConfigurationDM;
    private final UserDM userDM;

    public ConversationInboxPoller(UserDM userDM, SDKConfigurationDM sDKConfigurationDM, Poller poller, ConversationDAO conversationDAO) {
        this.userDM = userDM;
        this.sdkConfigurationDM = sDKConfigurationDM;
        this.poller = poller;
        this.conversationDAO = conversationDAO;
    }

    private boolean shouldStartSDKPoller() {
        return AppLifeCycleStateHolder.isAppInForeground() && this.userDM.issueExists() && !this.userDM.isPushTokenSynced() && !this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.DISABLE_IN_APP_CONVERSATION);
    }

    public void startAppPoller(boolean z) {
        if (!shouldStartSDKPoller()) {
            stop();
            return;
        }
        List<Conversation> data = this.conversationDAO.readConversationsWithoutMessages(this.userDM.getLocalId().longValue()).getData();
        if (ListUtils.isEmpty(data) || ConversationUtil.getLastConversationBasedOnCreatedAt(data).state == IssueState.REJECTED) {
            HSLogger.d(TAG, "Stopped listening for conversation updates : no issues or latest is rejected.");
            stop();
            return;
        }
        PollingInterval pollingInterval = !ConversationUtil.shouldPollActivelyForConversations(data) ? PollingInterval.PASSIVE : PollingInterval.CONSERVATIVE;
        if (this.currentPollingInterval == pollingInterval) {
            return;
        }
        stop();
        this.currentPollingInterval = pollingInterval;
        HSLogger.d(TAG, "Listening for conversation updates : " + this.currentPollingInterval);
        this.poller.start(pollingInterval, z ? INITIAL_DELAY : 0L, this.pollFunctionListener);
    }

    public void startChatPoller() {
        if (!AppLifeCycleStateHolder.isAppInForeground()) {
            stop();
        } else {
            if (this.currentPollingInterval == PollingInterval.AGGRESSIVE) {
                return;
            }
            stop();
            this.currentPollingInterval = PollingInterval.AGGRESSIVE;
            HSLogger.d(TAG, "Listening for in-chat conversation updates");
            this.poller.start(PollingInterval.AGGRESSIVE, 0L, this.pollFunctionListener);
        }
    }

    public void stop() {
        HSLogger.d(TAG, "Stopped listening for conversation updates : " + this.currentPollingInterval);
        this.poller.stop();
        this.currentPollingInterval = null;
    }

    @Override // java.util.Observer
    public void update(Observable observable, Object obj) {
        refreshPoller(true);
    }

    public void refreshPoller(boolean z) {
        if (!AppLifeCycleStateHolder.isAppInForeground() || !this.userDM.isActiveUser()) {
            stop();
        } else if (this.currentPollingInterval == PollingInterval.AGGRESSIVE) {
            startChatPoller();
        } else {
            startAppPoller(z);
        }
    }
}
