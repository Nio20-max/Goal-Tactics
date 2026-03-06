package com.helpshift.enums;

/* JADX INFO: loaded from: classes2.dex */
public enum ACTION_TYPE {
    OPEN_DEEP_LINK(1),
    SHOW_FAQS(2),
    SHOW_FAQ_SECTION(3),
    SHOW_CONVERSATION(4),
    SHOW_SINGLE_FAQ(5),
    SHOW_ALERT_TO_RATE_APP(6),
    LAUNCH_APP(7),
    SHOW_INBOX(8);

    private final int val;

    ACTION_TYPE(int i) {
        this.val = i;
    }

    public static ACTION_TYPE getEnum(String str) {
        try {
            return getEnum(Integer.parseInt(str));
        } catch (Exception unused) {
            return LAUNCH_APP;
        }
    }

    public static ACTION_TYPE getEnum(int i) {
        for (ACTION_TYPE action_type : values()) {
            if (i == action_type.val) {
                return action_type;
            }
        }
        return LAUNCH_APP;
    }
}
