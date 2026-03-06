package com.helpshift.conversation.activeconversation.model;

import com.helpshift.util.HSCloneable;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class Action implements HSCloneable {
    public final Map<String, String> actionData;
    public Long actionLocalId;
    public final String actionSHA;
    public final String actionTitle;
    public final ActionType actionType;

    public Action(String str, String str2, ActionType actionType, Map<String, String> map) {
        this.actionSHA = str2;
        this.actionTitle = str;
        this.actionData = map;
        this.actionType = actionType;
    }

    private Action(Action action) {
        this.actionSHA = action.actionSHA;
        this.actionTitle = action.actionTitle;
        this.actionData = new HashMap(action.actionData);
        this.actionType = action.actionType;
        this.actionLocalId = action.actionLocalId;
    }

    @Override // com.helpshift.util.HSCloneable
    public Action deepClone() {
        return new Action(this);
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null || !(obj instanceof Action)) {
            return false;
        }
        return ((Action) obj).actionSHA.equals(this.actionSHA);
    }
}
