package com.helpshift.conversation.activeconversation.model;

import androidx.core.app.NotificationCompat;

/* JADX INFO: loaded from: classes2.dex */
public enum ActionType {
    CALL(NotificationCompat.CATEGORY_CALL),
    LINK("link");

    private String value;

    ActionType(String str) {
        this.value = str;
    }

    public static ActionType fromValue(String str) {
        for (ActionType actionType : values()) {
            if (actionType.getValue().equals(str)) {
                return actionType;
            }
        }
        return null;
    }

    public String getValue() {
        return this.value;
    }
}
