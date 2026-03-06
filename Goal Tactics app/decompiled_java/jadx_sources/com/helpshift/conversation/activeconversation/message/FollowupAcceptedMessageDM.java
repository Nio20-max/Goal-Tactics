package com.helpshift.conversation.activeconversation.message;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.domain.network.NetworkDataRequestUtil;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.conversation.activeconversation.ConversationServerInfo;
import com.helpshift.util.StringUtils;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class FollowupAcceptedMessageDM extends AutoRetriableMessageDM {
    public String referredMessageId;

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public boolean isUISupportedMessage() {
        return false;
    }

    public FollowupAcceptedMessageDM(String str, String str2, long j, Author author, String str3, int i) {
        super(str, str2, j, author, false, MessageType.FOLLOWUP_ACCEPTED, i);
        this.referredMessageId = str3;
    }

    private FollowupAcceptedMessageDM(FollowupAcceptedMessageDM followupAcceptedMessageDM) {
        super(followupAcceptedMessageDM);
        this.referredMessageId = followupAcceptedMessageDM.referredMessageId;
    }

    @Override // com.helpshift.conversation.activeconversation.message.AutoRetriableMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof FollowupAcceptedMessageDM) {
            this.referredMessageId = ((FollowupAcceptedMessageDM) messageDM).referredMessageId;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.AutoRetriableMessageDM
    public void send(UserDM userDM, ConversationServerInfo conversationServerInfo) {
        if (StringUtils.isEmpty(conversationServerInfo.getIssueId())) {
            throw new UnsupportedOperationException("FollowupAcceptedMessageDM send called with conversation in pre issue mode.");
        }
        Map<String, String> userRequestData = NetworkDataRequestUtil.getUserRequestData(userDM);
        userRequestData.put("body", "Accepted the follow-up");
        userRequestData.put("type", "ra");
        userRequestData.put("refers", this.referredMessageId);
        try {
            FollowupAcceptedMessageDM followupAcceptedMessage = this.platform.getResponseParser().parseFollowupAcceptedMessage(makeNetworkRequest(getIssueSendMessageRoute(conversationServerInfo), userRequestData).responseString);
            merge(followupAcceptedMessage);
            this.author = followupAcceptedMessage.author;
            this.serverId = followupAcceptedMessage.serverId;
            this.platform.getConversationDAO().insertOrUpdateMessage(this);
        } catch (RootAPIException e) {
            if (e.exceptionType == NetworkException.INVALID_AUTH_TOKEN || e.exceptionType == NetworkException.AUTH_TOKEN_NOT_PROVIDED) {
                this.domain.getAuthenticationFailureDM().notifyAuthenticationFailure(userDM, e.exceptionType);
            }
            throw e;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public FollowupAcceptedMessageDM deepClone() {
        return new FollowupAcceptedMessageDM(this);
    }
}
