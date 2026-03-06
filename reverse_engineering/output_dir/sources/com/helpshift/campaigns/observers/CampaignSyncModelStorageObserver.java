package com.helpshift.campaigns.observers;

import com.helpshift.campaigns.models.CampaignSyncModel;

/* JADX INFO: loaded from: classes.dex */
public interface CampaignSyncModelStorageObserver {
    void campaignAdded(CampaignSyncModel campaignSyncModel);

    void campaignSynced(String str);
}
