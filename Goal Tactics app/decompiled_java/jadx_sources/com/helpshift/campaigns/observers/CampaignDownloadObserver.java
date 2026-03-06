package com.helpshift.campaigns.observers;

import com.helpshift.campaigns.models.CampaignSyncModel;

/* JADX INFO: loaded from: classes.dex */
public interface CampaignDownloadObserver {
    void campaignDownloadCompleted(CampaignSyncModel campaignSyncModel, String str);

    void campaignDownloadFailed(String str);

    void campaignDownloadStarted(String str);

    void coverImageDownloadCompleted(String str, String str2);

    void coverImageDownloadFailed(String str);

    void iconImageDownloadCompleted(String str, String str2);

    void iconImageDownloadFailed(String str);
}
