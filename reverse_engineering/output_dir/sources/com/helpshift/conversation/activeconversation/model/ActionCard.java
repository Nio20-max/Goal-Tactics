package com.helpshift.conversation.activeconversation.model;

import com.helpshift.util.HSCloneable;

/* JADX INFO: loaded from: classes2.dex */
public class ActionCard implements HSCloneable {
    public final Action action;
    public Long actionCardLocalId;
    public String filePath;
    public final String imageUrl;
    public final boolean isSecure;
    public final String title;

    public ActionCard(String str, String str2, boolean z, Action action) {
        this.title = str;
        this.imageUrl = str2;
        this.isSecure = z;
        this.action = action;
    }

    private ActionCard(ActionCard actionCard) {
        this.title = actionCard.title;
        this.imageUrl = actionCard.imageUrl;
        this.filePath = actionCard.filePath;
        this.isSecure = actionCard.isSecure;
        this.action = actionCard.action.deepClone();
        this.actionCardLocalId = actionCard.actionCardLocalId;
    }

    @Override // com.helpshift.util.HSCloneable
    public ActionCard deepClone() {
        return new ActionCard(this);
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null || !(obj instanceof ActionCard)) {
            return false;
        }
        return ((ActionCard) obj).action.equals(this.action);
    }
}
