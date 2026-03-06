package com.helpshift.campaigns.observers;

import com.helpshift.campaigns.models.CampaignDetailModel;

/* JADX INFO: loaded from: classes.dex */
public interface CampaignStorageObserver {
    void campaignCoverImageFilePathUpdated(String str);

    void campaignDeleted(String str);

    void campaignDetailModelAdded(CampaignDetailModel campaignDetailModel);

    void campaignIconImageFilePathUpdated(String str);

    void campaignRead(String str);

    void campaignSeen(String str);
}
