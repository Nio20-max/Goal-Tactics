package com.helpshift.campaigns.delegates;

import com.helpshift.campaigns.Campaigns;

/* JADX INFO: loaded from: classes.dex */
public class CampaignsDelegateRouter {
    private static Campaigns.Delegate delegate;

    public static void setDelegate(Campaigns.Delegate delegate2) {
        delegate = delegate2;
    }

    public static void sessionBegan() {
        Campaigns.Delegate delegate2 = delegate;
        if (delegate2 != null) {
            delegate2.sessionBegan();
        }
    }

    public static void sessionEnded() {
        Campaigns.Delegate delegate2 = delegate;
        if (delegate2 != null) {
            delegate2.sessionEnded();
        }
    }
}
