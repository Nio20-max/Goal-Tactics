package com.helpshift.conversation.activeconversation.message;

import com.facebook.login.LoginLogger;
import com.helpshift.common.platform.network.Response;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class UserResponseMessageForOptionInput extends UserMessageDM {
    public String botInfo;
    public String optionData;
    private String referredMessageId;
    public MessageType referredMessageType;
    public boolean skipped;

    public UserResponseMessageForOptionInput(String str, String str2, long j, Author author, String str3, boolean z, String str4, String str5, MessageType messageType) {
        super(str, str2, j, author, MessageType.USER_RESP_FOR_OPTION_INPUT);
        this.botInfo = str3;
        this.skipped = z;
        this.optionData = str4;
        this.referredMessageId = str5;
        this.referredMessageType = messageType;
    }

    public UserResponseMessageForOptionInput(String str, String str2, long j, Author author, OptionInputMessageDM optionInputMessageDM, boolean z) {
        super(str, str2, j, author, MessageType.USER_RESP_FOR_OPTION_INPUT);
        this.botInfo = optionInputMessageDM.input.botInfo;
        this.skipped = z;
        this.optionData = getSelectedOptionData(optionInputMessageDM.input.options);
        this.referredMessageId = optionInputMessageDM.serverId;
        this.referredMessageType = optionInputMessageDM.referredMessageType;
    }

    public UserResponseMessageForOptionInput(UserResponseMessageForOptionInput userResponseMessageForOptionInput) {
        super(userResponseMessageForOptionInput);
        this.botInfo = userResponseMessageForOptionInput.botInfo;
        this.skipped = userResponseMessageForOptionInput.skipped;
        this.optionData = userResponseMessageForOptionInput.optionData;
        this.referredMessageType = userResponseMessageForOptionInput.referredMessageType;
        this.referredMessageId = userResponseMessageForOptionInput.referredMessageId;
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof UserResponseMessageForOptionInput) {
            UserResponseMessageForOptionInput userResponseMessageForOptionInput = (UserResponseMessageForOptionInput) messageDM;
            this.botInfo = userResponseMessageForOptionInput.botInfo;
            this.skipped = userResponseMessageForOptionInput.skipped;
            this.optionData = userResponseMessageForOptionInput.optionData;
            this.referredMessageId = userResponseMessageForOptionInput.referredMessageId;
            this.referredMessageType = userResponseMessageForOptionInput.referredMessageType;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM
    protected Map<String, String> getData() {
        HashMap map = new HashMap();
        map.put("chatbot_info", this.botInfo);
        map.put(LoginLogger.EVENT_PARAM_METHOD_RESULT_SKIPPED, String.valueOf(this.skipped));
        if (!this.skipped) {
            map.put("option_data", this.optionData);
        }
        if (this.referredMessageType == MessageType.FAQ_LIST_WITH_OPTION_INPUT) {
            List arrayList = new ArrayList();
            Object serializable = this.platform.getKVStore().getSerializable(FAQListMessageWithOptionInputDM.KEY_SUGGESTIONS_READ_FAQ_PREFIX + this.referredMessageId);
            if (serializable instanceof ArrayList) {
                arrayList = (List) serializable;
            }
            map.put("read_faqs", this.platform.getJsonifier().jsonifyListToJsonArray(arrayList).toString());
        }
        return map;
    }

    /* JADX INFO: renamed from: com.helpshift.conversation.activeconversation.message.UserResponseMessageForOptionInput$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType;

        static {
            int[] iArr = new int[MessageType.values().length];
            $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType = iArr;
            try {
                iArr[MessageType.ADMIN_TEXT_WITH_OPTION_INPUT.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[MessageType.FAQ_LIST_WITH_OPTION_INPUT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[MessageType.ADMIN_RESOLUTION_QUESTION_MESSAGE.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM
    protected String getMessageTypeForRequest() {
        int i = AnonymousClass1.$SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType[this.referredMessageType.ordinal()];
        return i != 1 ? i != 2 ? i != 3 ? super.getMessageTypeForRequest() : "rsp_txt_resolution_msg_with_option_input" : "rsp_faq_list_msg_with_option_input" : "rsp_txt_msg_with_option_input";
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM
    public String getReferredMessageId() {
        return this.referredMessageId;
    }

    private String getSelectedOptionData(List<OptionInput.Option> list) {
        for (OptionInput.Option option : list) {
            if (option.title.equals(this.body)) {
                return option.jsonData;
            }
        }
        return "{}";
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM
    protected UserMessageDM parseResponse(Response response) {
        return this.platform.getResponseParser().parseResponseMessageForOptionInput(response.responseString);
    }

    @Override // com.helpshift.conversation.activeconversation.message.UserMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public UserResponseMessageForOptionInput deepClone() {
        return new UserResponseMessageForOptionInput(this);
    }
}
