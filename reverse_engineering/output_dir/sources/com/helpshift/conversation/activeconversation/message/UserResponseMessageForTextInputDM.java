package com.helpshift.conversation.activeconversation.message;

import com.facebook.login.LoginLogger;
import com.helpshift.common.platform.network.Response;
import com.helpshift.common.util.HSDateFormatSpec;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class UserResponseMessageForTextInputDM extends UserMessageDM {
    public String botInfo;
    public long dateInMillis;
    public final boolean isMessageEmpty;
    public int keyboard;
    private String referredMessageId;
    public boolean skipped;
    public String timeZoneId;

    public UserResponseMessageForTextInputDM(String str, String str2, long j, Author author, int i, String str3, boolean z, String str4, boolean z2) {
        super(str, str2, j, author, MessageType.USER_RESP_FOR_TEXT_INPUT);
        this.keyboard = i;
        this.botInfo = str3;
        this.skipped = z;
        this.referredMessageId = str4;
        this.isMessageEmpty = z2;
    }

    public UserResponseMessageForTextInputDM(String str, String str2, long j, Author author, AdminMessageWithTextInputDM adminMessageWithTextInputDM, boolean z) {
        super(str, str2, j, author, MessageType.USER_RESP_FOR_TEXT_INPUT);
        this.keyboard = adminMessageWithTextInputDM.input.keyboard;
        this.botInfo = adminMessageWithTextInputDM.input.botInfo;
        this.skipped = z;
        this.referredMessageId = adminMessageWithTextInputDM.serverId;
        this.isMessageEmpty = adminMessageWithTextInputDM.isMessageEmpty;
    }

    private UserResponseMessageForTextInputDM(UserResponseMessageForTextInputDM userResponseMessageForTextInputDM) {
        super(userResponseMessageForTextInputDM);
        this.isMessageEmpty = userResponseMessageForTextInputDM.isMessageEmpty;
        this.keyboard = userResponseMessageForTextInputDM.keyboard;
        this.botInfo = userResponseMessageForTextInputDM.botInfo;
        this.skipped = userResponseMessageForTextInputDM.skipped;
        this.dateInMillis = userResponseMessageForTextInputDM.dateInMillis;
        this.timeZoneId = userResponseMessageForTextInputDM.timeZoneId;
        this.referredMessageId = userResponseMessageForTextInputDM.referredMessageId;
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof UserResponseMessageForTextInputDM) {
            UserResponseMessageForTextInputDM userResponseMessageForTextInputDM = (UserResponseMessageForTextInputDM) messageDM;
            this.keyboard = userResponseMessageForTextInputDM.keyboard;
            this.botInfo = userResponseMessageForTextInputDM.botInfo;
            this.skipped = userResponseMessageForTextInputDM.skipped;
            this.referredMessageId = userResponseMessageForTextInputDM.referredMessageId;
            this.dateInMillis = userResponseMessageForTextInputDM.dateInMillis;
            this.timeZoneId = userResponseMessageForTextInputDM.timeZoneId;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM
    protected String getMessageTypeForRequest() {
        int i = this.keyboard;
        return i != 1 ? i != 2 ? i != 3 ? i != 4 ? super.getMessageTypeForRequest() : "rsp_txt_msg_with_dt_input" : "rsp_txt_msg_with_numeric_input" : "rsp_txt_msg_with_email_input" : this.isMessageEmpty ? "rsp_empty_msg_with_txt_input" : "rsp_txt_msg_with_txt_input";
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM
    public String getReferredMessageId() {
        return this.referredMessageId;
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM
    protected Map<String, String> getData() throws ParseException {
        HashMap map = new HashMap();
        map.put("chatbot_info", this.botInfo);
        map.put(LoginLogger.EVENT_PARAM_METHOD_RESULT_SKIPPED, String.valueOf(this.skipped));
        if (this.keyboard == 4 && !this.skipped) {
            Date date = HSDateFormatSpec.getDateFormatter(HSDateFormatSpec.DISPLAY_DATE_PATTERN, this.domain.getLocaleProviderDM().getCurrentLocale()).parse(this.body.trim());
            HashMap map2 = new HashMap();
            this.dateInMillis = date.getTime();
            this.timeZoneId = this.platform.getDevice().getTimeZoneId();
            map2.put("dt", Long.valueOf(this.dateInMillis));
            map2.put("timezone", this.timeZoneId);
            map.put("message_meta", this.platform.getJsonifier().jsonify(map2));
        }
        return map;
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM
    protected UserMessageDM parseResponse(Response response) {
        return this.platform.getResponseParser().parseResponseMessageForTextInput(response.responseString);
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public UserResponseMessageForTextInputDM deepClone() {
        return new UserResponseMessageForTextInputDM(this);
    }
}
