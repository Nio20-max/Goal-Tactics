package com.helpshift.campaigns.delegates;

import com.helpshift.campaigns.models.InboxMessage;

/* JADX INFO: loaded from: classes.dex */
public interface InboxMessageDelegate {
    void coverImageDownloaded(String str);

    void iconImageDownloaded(String str);

    void inboxMessageAdded(InboxMessage inboxMessage);

    void inboxMessageDeleted(String str);

    void inboxMessageMarkedAsRead(String str);

    void inboxMessageMarkedAsSeen(String str);
}
