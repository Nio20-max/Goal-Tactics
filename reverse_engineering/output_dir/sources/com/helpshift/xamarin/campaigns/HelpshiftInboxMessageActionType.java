package com.helpshift.xamarin.campaigns;

/* JADX INFO: loaded from: classes2.dex */
public enum HelpshiftInboxMessageActionType {
    UNKNOWN(0),
    OPEN_DEEP_LINK(1),
    SHOW_FAQS(2),
    SHOW_FAQ_SECTION(3),
    SHOW_CONVERSATION(4),
    SHOW_SINGLE_FAQ(5),
    SHOW_ALERT_TO_RATE_APP(6);

    private final int value;

    HelpshiftInboxMessageActionType(int i) {
        this.value = i;
    }

    public int getValue() {
        return this.value;
    }
}
