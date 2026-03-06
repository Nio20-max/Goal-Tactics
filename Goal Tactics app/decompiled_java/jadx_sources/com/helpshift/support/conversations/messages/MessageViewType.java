package com.helpshift.support.conversations.messages;

import com.facebook.internal.FacebookRequestErrorClassification;
import com.ironsource.mediationsdk.utils.IronSourceConstants;

/* JADX INFO: loaded from: classes2.dex */
public enum MessageViewType {
    USER_TEXT_MESSAGE(10),
    ADMIN_TEXT_MESSAGE(20),
    USER_SCREENSHOT_ATTACHMENT(30),
    ADMIN_ATTACHMENT_IMAGE(40),
    ADMIN_ATTACHMENT_GENERIC(50),
    ADMIN_REQUEST_ATTACHMENT(60),
    REQUESTED_APP_REVIEW(70),
    REQUEST_FOR_REOPEN(80),
    CONFIRMATION_REJECTED(90),
    CONVERSATION_FOOTER(100),
    AGENT_TYPING_FOOTER(110),
    SYSTEM_DATE(120),
    SYSTEM_DIVIDER(130),
    USER_SELECTABLE_OPTION(IronSourceConstants.USING_CACHE_FOR_INIT_EVENT),
    ADMIN_SUGGESTIONS_LIST(IronSourceConstants.REWARDED_VIDEO_DAILY_CAPPED),
    SYSTEM_PUBLISH_ID(160),
    SYSTEM_CONVERSATION_REDACTED_MESSAGE(170),
    HISTORY_LOADING_VIEW(180),
    ADMIN_REDACTED_MESSAGE(FacebookRequestErrorClassification.EC_INVALID_TOKEN),
    USER_REDACTED_MESSAGE(200),
    USER_ATTACHMENT_GENERIC(210),
    ACTION_CARD_MESSAGE(220),
    USER_SMART_INTENT_MESSAGE(230),
    ADMIN_CSAT_MESSAGE(240),
    USER_RSP_CSAT_BOT(250);

    public final int key;

    MessageViewType(int i) {
        this.key = i;
    }

    public static MessageViewType getEnum(int i) {
        for (MessageViewType messageViewType : values()) {
            if (messageViewType.key == i) {
                return messageViewType;
            }
        }
        return null;
    }
}
