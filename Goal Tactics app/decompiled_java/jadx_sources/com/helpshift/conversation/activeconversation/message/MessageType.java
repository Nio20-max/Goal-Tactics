package com.helpshift.conversation.activeconversation.message;

/* JADX INFO: loaded from: classes2.dex */
public enum MessageType {
    USER_TEXT("mobile_text"),
    ADMIN_TEXT("admin_text"),
    ACCEPTED_APP_REVIEW("accepted_app_review"),
    REQUESTED_APP_REVIEW("request_app_review"),
    FOLLOWUP_ACCEPTED("followup_accepted"),
    FOLLOWUP_REJECTED("followup_rejected"),
    CONFIRMATION_ACCEPTED("confirmation_accepted"),
    CONFIRMATION_REJECTED("confirmation_rejected"),
    SCREENSHOT("screenshot"),
    REQUESTED_SCREENSHOT("request_screenshot"),
    ADMIN_ATTACHMENT("admin_attachment"),
    ADMIN_IMAGE_ATTACHMENT("admin_image_attachment"),
    REQUEST_FOR_REOPEN("request_for_reopen"),
    ADMIN_TEXT_WITH_TEXT_INPUT("admin_text_with_text_input"),
    ADMIN_TEXT_WITH_OPTION_INPUT("admin_text_with_option_input"),
    FAQ_LIST("faq_list"),
    FAQ_LIST_WITH_OPTION_INPUT("faq_list_with_option_input"),
    OPTION_INPUT("option_input"),
    UNSUPPORTED_ADMIN_MESSAGE_WITH_INPUT("unsupported_admin_message_with_input"),
    ADMIN_BOT_CONTROL("admin_bot_control"),
    USER_BOT_CONTROL("user_bot_control"),
    USER_RESP_FOR_TEXT_INPUT("mobile_response_for_text_input"),
    USER_RESP_FOR_OPTION_INPUT("mobile_response_for_option_input"),
    SYSTEM_DATE("system_date"),
    SYSTEM_DIVIDER("system_divider"),
    SYSTEM_PUBLISH_ID("system_publish_id"),
    SYSTEM_CONVERSATION_REDACTED("system_conv_redacted"),
    USER_ATTACHMENT("user_attachment"),
    ADMIN_ACTION_CARD("admin_action_card"),
    USER_SMART_INTENT("user_smart_intent"),
    ADMIN_RESOLUTION_QUESTION_MESSAGE("resolution_msg_with_option_input"),
    ADMIN_CSAT_MESSAGE("csat_feedback_message"),
    USER_RESP_FOR_CSAT("mobile_response_for_csat");

    private String value;

    MessageType(String str) {
        this.value = str;
    }

    public static MessageType fromValue(String str) {
        for (MessageType messageType : values()) {
            if (messageType.getValue().equals(str)) {
                return messageType;
            }
        }
        return null;
    }

    public String getValue() {
        return this.value;
    }
}
