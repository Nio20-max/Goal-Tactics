package com.helpshift.conversation.activeconversation.message;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.domain.network.NetworkDataRequestUtil;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.conversation.activeconversation.ConversationServerInfo;
import com.helpshift.util.StringUtils;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class FollowupRejectedMessageDM extends AutoRetriableMessageDM {
    public static final int REASON_CONVERSATION_FILING = 1;
    public static final int REASON_MESSAGE_FILING = 3;
    public static final int REASON_OPEN_ISSUE = 2;
    public static final int REASON_OPEN_PRE_ISSUE = 4;
    public String openConversationId;
    public int reason;
    public String referredMessageId;

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public boolean isUISupportedMessage() {
        return false;
    }

    public FollowupRejectedMessageDM(String str, String str2, long j, Author author, String str3, int i) {
        super(str, str2, j, author, false, MessageType.FOLLOWUP_REJECTED, i);
        this.referredMessageId = str3;
    }

    private FollowupRejectedMessageDM(FollowupRejectedMessageDM followupRejectedMessageDM) {
        super(followupRejectedMessageDM);
        this.referredMessageId = followupRejectedMessageDM.referredMessageId;
        this.reason = followupRejectedMessageDM.reason;
        this.openConversationId = followupRejectedMessageDM.openConversationId;
    }

    @Override // com.helpshift.conversation.activeconversation.message.AutoRetriableMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof FollowupRejectedMessageDM) {
            this.referredMessageId = ((FollowupRejectedMessageDM) messageDM).referredMessageId;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.AutoRetriableMessageDM
    public void send(UserDM userDM, ConversationServerInfo conversationServerInfo) {
        if (StringUtils.isEmpty(conversationServerInfo.getIssueId())) {
            throw new UnsupportedOperationException("FollowupRejectedMessageDM send called with conversation in pre issue mode.");
        }
        HashMap map = new HashMap();
        map.put(IronSourceConstants.EVENTS_ERROR_REASON, Integer.valueOf(this.reason));
        String str = this.openConversationId;
        if (str != null) {
            map.put("open_issue_id", str);
        }
        String strJsonify = this.platform.getJsonifier().jsonify(map);
        Map<String, String> userRequestData = NetworkDataRequestUtil.getUserRequestData(userDM);
        userRequestData.put("body", "Rejected the follow-up");
        userRequestData.put("type", "rj");
        userRequestData.put("refers", this.referredMessageId);
        userRequestData.put("message_meta", strJsonify);
        try {
            FollowupRejectedMessageDM followupRejectedMessage = this.platform.getResponseParser().parseFollowupRejectedMessage(makeNetworkRequest(getIssueSendMessageRoute(conversationServerInfo), userRequestData).responseString);
            merge(followupRejectedMessage);
            this.author = followupRejectedMessage.author;
            this.serverId = followupRejectedMessage.serverId;
            this.platform.getConversationDAO().insertOrUpdateMessage(this);
        } catch (RootAPIException e) {
            if (e.exceptionType == NetworkException.INVALID_AUTH_TOKEN || e.exceptionType == NetworkException.AUTH_TOKEN_NOT_PROVIDED) {
                this.domain.getAuthenticationFailureDM().notifyAuthenticationFailure(userDM, e.exceptionType);
            }
            throw e;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public FollowupRejectedMessageDM deepClone() {
        return new FollowupRejectedMessageDM(this);
    }
}
