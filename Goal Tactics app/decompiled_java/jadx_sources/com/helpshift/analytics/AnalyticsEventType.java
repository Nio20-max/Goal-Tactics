package com.helpshift.analytics;

import com.helpshift.campaigns.models.PropertyValue;
import com.helpshift.campaigns.util.constants.ModelKeys;

/* JADX INFO: loaded from: classes.dex */
public enum AnalyticsEventType {
    APP_START("a"),
    LIBRARY_OPENED("o"),
    LIBRARY_OPENED_DECOMP("d"),
    SUPPORT_LAUNCH("l"),
    PERFORMED_SEARCH("s"),
    BROWSED_FAQ_LIST(PropertyValue.ValueTypes.BOOLEAN),
    READ_FAQ("f"),
    MARKED_HELPFUL("h"),
    MARKED_UNHELPFUL("u"),
    REPORTED_ISSUE("i"),
    CONVERSATION_POSTED(AnalyticsEventKey.PROTOCOL),
    REVIEWED_APP(AnalyticsEventKey.SMART_INTENT_SEARCH_RANK),
    OPEN_ISSUE(ModelKeys.KEY_ACTION_MODEL_ACTION_TEXT_COLOR),
    OPEN_INBOX("x"),
    LIBRARY_QUIT("q"),
    MESSAGE_ADDED(ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_BODY),
    RESOLUTION_ACCEPTED("y"),
    RESOLUTION_REJECTED("n"),
    START_CSAT_RATING("sr"),
    CANCEL_CSAT_RATING("cr"),
    LINK_VIA_FAQ("fl"),
    TICKET_AVOIDED("ta"),
    TICKET_AVOIDANCE_FAILED("taf"),
    DYNAMIC_FORM_OPEN("dfo"),
    ADMIN_MESSAGE_DEEPLINK_CLICKED("ml"),
    DYNAMIC_FORM_CLOSE("dfc"),
    SMART_INTENT_TREE_SHOWN("its"),
    SMART_INTENT_SELECTION("sis"),
    SMART_INTENT_DESELECTION("sid"),
    SMART_INTENT_SEARCH_INTENT("sisr"),
    ACTION_CARD_CLICKED("acl"),
    TIMER_EXPIRED("te"),
    CSAT_SUBMITTED("cbc"),
    CSAT_REQUESTED("cbr");

    public final String key;

    AnalyticsEventType(String str) {
        this.key = str;
    }
}
