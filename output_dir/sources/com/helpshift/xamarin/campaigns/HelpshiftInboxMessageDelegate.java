package com.helpshift.xamarin.campaigns;

import com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage;

/* JADX INFO: loaded from: classes2.dex */
public interface HelpshiftInboxMessageDelegate {
    void coverImageDownloaded(String str);

    void iconImageDownloaded(String str);

    void inboxMessageAdded(HelpshiftInboxMessage helpshiftInboxMessage);

    void inboxMessageDeleted(String str);

    void inboxMessageMarkedAsRead(String str);

    void inboxMessageMarkedAsSeen(String str);
}
