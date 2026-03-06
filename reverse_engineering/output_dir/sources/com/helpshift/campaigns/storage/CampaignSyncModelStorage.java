package com.helpshift.campaigns.storage;

import com.helpshift.campaigns.models.CampaignSyncModel;
import com.helpshift.campaigns.observers.CampaignSyncModelStorageObserver;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface CampaignSyncModelStorage {
    void addCampaign(CampaignSyncModel campaignSyncModel, String str);

    void addObserver(CampaignSyncModelStorageObserver campaignSyncModelStorageObserver);

    void cleanUpSyncingModels(String str);

    void destroyStorage(String str);

    List<CampaignSyncModel> getAllUnsyncedCampaigns(String str);

    CampaignSyncModel getCampaign(String str, String str2);

    void markCampaignAsSynced(String str, String str2);

    void markCampaignAsSyncing(String str, String str2);

    void markCampaignAsUnSynced(String str, String str2);

    void removeObserver(CampaignSyncModelStorageObserver campaignSyncModelStorageObserver);
}
