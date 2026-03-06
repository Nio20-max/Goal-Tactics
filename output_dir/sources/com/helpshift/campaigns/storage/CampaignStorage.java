package com.helpshift.campaigns.storage;

import com.helpshift.campaigns.models.CampaignDetailModel;
import com.helpshift.campaigns.observers.CampaignStorageObserver;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface CampaignStorage {
    void addCampaign(CampaignDetailModel campaignDetailModel);

    void addObserver(CampaignStorageObserver campaignStorageObserver);

    void deleteCampaign(String str);

    void deleteCampaigns(String[] strArr);

    List<CampaignDetailModel> getAllCampaigns(String str);

    List<CampaignDetailModel> getAllCampaigns(boolean z, String str);

    CampaignDetailModel getCampaign(String str);

    void markCampaignAsRead(String str);

    void markCampaignAsSeen(String str);

    void removeObserver(CampaignStorageObserver campaignStorageObserver);

    void updateCampaignWIthCoverImageFilePath(String str, String str2);

    void updateCampaignWithIconImageFilePath(String str, String str2);
}
