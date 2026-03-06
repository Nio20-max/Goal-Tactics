package com.helpshift.campaigns.observers;

/* JADX INFO: loaded from: classes.dex */
public interface CampaignListObserver {
    void campaignAdded();

    void campaignIconImageDownloaded();

    void campaignMarkedAsSeen();

    void searchResultsUpdated();
}
