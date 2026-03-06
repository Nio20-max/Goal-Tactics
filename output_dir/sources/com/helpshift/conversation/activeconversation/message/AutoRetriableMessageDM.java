package com.helpshift.conversation.activeconversation.message;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.domain.network.AuthenticationFailureNetwork;
import com.helpshift.common.domain.network.FailedAPICallNetworkDecorator;
import com.helpshift.common.domain.network.GuardAgainstConversationArchivalNetwork;
import com.helpshift.common.domain.network.GuardOKNetwork;
import com.helpshift.common.domain.network.IdempotentNetwork;
import com.helpshift.common.domain.network.Network;
import com.helpshift.common.domain.network.POSTNetwork;
import com.helpshift.common.domain.network.TSCorrectedNetwork;
import com.helpshift.common.domain.network.UserPreConditionsFailedNetwork;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.common.platform.network.Response;
import com.helpshift.conversation.activeconversation.ConversationServerInfo;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public abstract class AutoRetriableMessageDM extends MessageDM {
    private int syncStatus;

    public abstract void send(UserDM userDM, ConversationServerInfo conversationServerInfo);

    AutoRetriableMessageDM(String str, String str2, long j, Author author, boolean z, MessageType messageType, int i) {
        super(str, str2, j, author, z, messageType);
        this.syncStatus = i;
    }

    protected AutoRetriableMessageDM(AutoRetriableMessageDM autoRetriableMessageDM) {
        super(autoRetriableMessageDM);
        this.syncStatus = autoRetriableMessageDM.syncStatus;
    }

    protected void updateSyncStatusIntoMemoryAndDB(int i) {
        if (this.syncStatus == i) {
            return;
        }
        this.syncStatus = i;
        this.platform.getConversationDAO().insertOrUpdateMessage(this);
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof AutoRetriableMessageDM) {
            this.syncStatus = ((AutoRetriableMessageDM) messageDM).syncStatus;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    Network getSendMessageNetwork(String str) {
        return new GuardOKNetwork(new FailedAPICallNetworkDecorator(new GuardAgainstConversationArchivalNetwork(new UserPreConditionsFailedNetwork(new AuthenticationFailureNetwork(new TSCorrectedNetwork(new IdempotentNetwork(new POSTNetwork(str, this.domain, this.platform), this.platform, getIdempotentPolicy(), str, String.valueOf(this.localId)), this.platform))))));
    }

    public int getSyncStatus() {
        return this.syncStatus;
    }

    Response makeNetworkRequest(String str, Map<String, String> map) {
        try {
            return getSendMessageNetwork(str).makeRequest(new RequestData(map));
        } catch (RootAPIException e) {
            if (e.exceptionType == NetworkException.NON_RETRIABLE || e.exceptionType == NetworkException.USER_PRE_CONDITION_FAILED) {
                updateSyncStatusIntoMemoryAndDB(3);
            } else {
                updateSyncStatusIntoMemoryAndDB(1);
            }
            throw e;
        }
    }

    public boolean isRetriable() {
        return this.syncStatus == 1;
    }
}
