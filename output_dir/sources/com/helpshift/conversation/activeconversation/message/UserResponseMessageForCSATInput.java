package com.helpshift.conversation.activeconversation.message;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.platform.network.Response;
import com.helpshift.conversation.activeconversation.ConversationServerInfo;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class UserResponseMessageForCSATInput extends UserMessageDM {
    public String botInfo;
    public boolean isNewConversationStarted;
    public int messageSyncState;
    public String optionData;
    public int rating;
    private String referredMessageId;
    public final MessageType referredMessageType;

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM
    protected String getMessageTypeForRequest() {
        return "rsp_txt_csat_msg_with_option_input";
    }

    public UserResponseMessageForCSATInput(String str, String str2, long j, Author author, int i, boolean z, String str3, String str4, String str5, int i2) {
        super(str, str2, j, author, MessageType.USER_RESP_FOR_CSAT);
        this.referredMessageType = MessageType.ADMIN_CSAT_MESSAGE;
        this.botInfo = str3;
        this.optionData = str4;
        this.referredMessageId = str5;
        this.isNewConversationStarted = z;
        this.rating = i;
        this.messageSyncState = i2;
    }

    public UserResponseMessageForCSATInput(UserResponseMessageForCSATInput userResponseMessageForCSATInput) {
        super(userResponseMessageForCSATInput);
        this.referredMessageType = MessageType.ADMIN_CSAT_MESSAGE;
        this.botInfo = userResponseMessageForCSATInput.botInfo;
        this.optionData = userResponseMessageForCSATInput.optionData;
        this.referredMessageId = userResponseMessageForCSATInput.referredMessageId;
        this.isNewConversationStarted = userResponseMessageForCSATInput.isNewConversationStarted;
        this.rating = userResponseMessageForCSATInput.rating;
        this.messageSyncState = userResponseMessageForCSATInput.messageSyncState;
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof UserResponseMessageForCSATInput) {
            UserResponseMessageForCSATInput userResponseMessageForCSATInput = (UserResponseMessageForCSATInput) messageDM;
            this.botInfo = userResponseMessageForCSATInput.botInfo;
            this.optionData = userResponseMessageForCSATInput.optionData;
            this.referredMessageId = userResponseMessageForCSATInput.referredMessageId;
            this.isNewConversationStarted = userResponseMessageForCSATInput.isNewConversationStarted;
            this.rating = userResponseMessageForCSATInput.rating;
            this.messageSyncState = userResponseMessageForCSATInput.messageSyncState;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM
    protected Map<String, String> getData() {
        HashMap map = new HashMap();
        map.put("chatbot_info", this.botInfo);
        map.put("new_conv_started", String.valueOf(this.isNewConversationStarted));
        if (!this.isNewConversationStarted) {
            map.put("rating_data", this.optionData);
        }
        return map;
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM
    public void send(UserDM userDM, ConversationServerInfo conversationServerInfo) {
        super.send(userDM, conversationServerInfo);
        this.messageSyncState = 2;
        this.platform.getConversationDAO().insertOrUpdateMessage(this);
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM
    public String getReferredMessageId() {
        return this.referredMessageId;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM
    public UserResponseMessageForCSATInput parseResponse(Response response) {
        return this.platform.getResponseParser().parseResponseMessageForCSATInput(response.responseString);
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public UserResponseMessageForCSATInput deepClone() {
        return new UserResponseMessageForCSATInput(this);
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM
    public boolean isUISupportedMessage() {
        return !this.isNewConversationStarted;
    }
}
