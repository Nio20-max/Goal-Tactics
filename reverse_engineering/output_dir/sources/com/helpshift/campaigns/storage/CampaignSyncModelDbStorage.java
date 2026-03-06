package com.helpshift.campaigns.storage;

import android.text.TextUtils;
import com.helpshift.campaigns.models.CampaignSyncModel;
import com.helpshift.campaigns.observers.CampaignSyncModelStorageObserver;
import com.helpshift.storage.KeyValueStorage;
import com.helpshift.util.concurrent.DispatchQueue;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;

/* JADX INFO: loaded from: classes.dex */
public class CampaignSyncModelDbStorage implements CampaignSyncModelStorage {
    private static final String SYNC_MODEL_KEY_PREFIX = "kCampaignSyncModels";
    ConcurrentLinkedQueue<CampaignSyncModelStorageObserver> observers = new ConcurrentLinkedQueue<>();
    KeyValueStorage storage;
    private DispatchQueue workerQueue;

    public CampaignSyncModelDbStorage(KeyValueStorage keyValueStorage, DispatchQueue dispatchQueue) {
        this.storage = keyValueStorage;
        this.workerQueue = dispatchQueue;
    }

    @Override // com.helpshift.campaigns.storage.CampaignSyncModelStorage
    public void destroyStorage(String str) {
        this.storage.removeKey(SYNC_MODEL_KEY_PREFIX + str);
    }

    @Override // com.helpshift.campaigns.storage.CampaignSyncModelStorage
    public void addCampaign(final CampaignSyncModel campaignSyncModel, final String str) {
        if (campaignSyncModel == null || TextUtils.isEmpty(campaignSyncModel.campaignId) || TextUtils.isEmpty(campaignSyncModel.creativeUrl) || TextUtils.isEmpty(str)) {
            return;
        }
        this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.storage.CampaignSyncModelDbStorage.1
            @Override // java.lang.Runnable
            public void run() {
                HashMap map = (HashMap) CampaignSyncModelDbStorage.this.storage.get(CampaignSyncModelDbStorage.SYNC_MODEL_KEY_PREFIX + str);
                if (map == null) {
                    map = new HashMap();
                }
                map.put(campaignSyncModel.campaignId, campaignSyncModel);
                CampaignSyncModelDbStorage.this.storage.set(CampaignSyncModelDbStorage.SYNC_MODEL_KEY_PREFIX + str, map);
                Iterator<CampaignSyncModelStorageObserver> it = CampaignSyncModelDbStorage.this.observers.iterator();
                while (it.hasNext()) {
                    it.next().campaignAdded(campaignSyncModel);
                }
            }
        });
    }

    @Override // com.helpshift.campaigns.storage.CampaignSyncModelStorage
    public void markCampaignAsSynced(final String str, final String str2) {
        this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.storage.CampaignSyncModelDbStorage.2
            @Override // java.lang.Runnable
            public void run() {
                HashMap map = (HashMap) CampaignSyncModelDbStorage.this.storage.get(CampaignSyncModelDbStorage.SYNC_MODEL_KEY_PREFIX + str2);
                if (map != null) {
                    map.remove(str);
                    CampaignSyncModelDbStorage.this.storage.set(CampaignSyncModelDbStorage.SYNC_MODEL_KEY_PREFIX + str2, map);
                    Iterator<CampaignSyncModelStorageObserver> it = CampaignSyncModelDbStorage.this.observers.iterator();
                    while (it.hasNext()) {
                        it.next().campaignSynced(str);
                    }
                }
            }
        });
    }

    @Override // com.helpshift.campaigns.storage.CampaignSyncModelStorage
    public void markCampaignAsSyncing(final String str, final String str2) {
        this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.storage.CampaignSyncModelDbStorage.3
            @Override // java.lang.Runnable
            public void run() {
                HashMap map = (HashMap) CampaignSyncModelDbStorage.this.storage.get(CampaignSyncModelDbStorage.SYNC_MODEL_KEY_PREFIX + str2);
                if (map != null) {
                    CampaignSyncModel campaignSyncModel = (CampaignSyncModel) map.get(str);
                    if (campaignSyncModel != null) {
                        campaignSyncModel.setIsSyncing(true);
                    }
                    map.put(str, campaignSyncModel);
                    CampaignSyncModelDbStorage.this.storage.set(CampaignSyncModelDbStorage.SYNC_MODEL_KEY_PREFIX + str2, map);
                }
            }
        });
    }

    @Override // com.helpshift.campaigns.storage.CampaignSyncModelStorage
    public void markCampaignAsUnSynced(final String str, final String str2) {
        this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.storage.CampaignSyncModelDbStorage.4
            @Override // java.lang.Runnable
            public void run() {
                HashMap map = (HashMap) CampaignSyncModelDbStorage.this.storage.get(CampaignSyncModelDbStorage.SYNC_MODEL_KEY_PREFIX + str2);
                if (map != null) {
                    CampaignSyncModel campaignSyncModel = (CampaignSyncModel) map.get(str);
                    if (campaignSyncModel != null) {
                        campaignSyncModel.setIsSyncing(false);
                    }
                    map.put(str, campaignSyncModel);
                    CampaignSyncModelDbStorage.this.storage.set(CampaignSyncModelDbStorage.SYNC_MODEL_KEY_PREFIX + str2, map);
                }
            }
        });
    }

    @Override // com.helpshift.campaigns.storage.CampaignSyncModelStorage
    public List<CampaignSyncModel> getAllUnsyncedCampaigns(String str) {
        HashMap map = (HashMap) this.storage.get(SYNC_MODEL_KEY_PREFIX + str);
        ArrayList arrayList = new ArrayList();
        if (map != null) {
            Iterator it = map.keySet().iterator();
            while (it.hasNext()) {
                CampaignSyncModel campaignSyncModel = (CampaignSyncModel) map.get((String) it.next());
                if (campaignSyncModel != null && !campaignSyncModel.isSyncing()) {
                    arrayList.add(campaignSyncModel);
                }
            }
        }
        return arrayList;
    }

    @Override // com.helpshift.campaigns.storage.CampaignSyncModelStorage
    public CampaignSyncModel getCampaign(String str, String str2) {
        HashMap map = (HashMap) this.storage.get(SYNC_MODEL_KEY_PREFIX + str2);
        if (map != null) {
            return (CampaignSyncModel) map.get(str);
        }
        return null;
    }

    @Override // com.helpshift.campaigns.storage.CampaignSyncModelStorage
    public void addObserver(CampaignSyncModelStorageObserver campaignSyncModelStorageObserver) {
        if (campaignSyncModelStorageObserver != null) {
            this.observers.add(campaignSyncModelStorageObserver);
        }
    }

    @Override // com.helpshift.campaigns.storage.CampaignSyncModelStorage
    public void removeObserver(CampaignSyncModelStorageObserver campaignSyncModelStorageObserver) {
        this.observers.remove(campaignSyncModelStorageObserver);
    }

    @Override // com.helpshift.campaigns.storage.CampaignSyncModelStorage
    public void cleanUpSyncingModels(final String str) {
        this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.storage.CampaignSyncModelDbStorage.5
            @Override // java.lang.Runnable
            public void run() {
                HashMap map = (HashMap) CampaignSyncModelDbStorage.this.storage.get(CampaignSyncModelDbStorage.SYNC_MODEL_KEY_PREFIX + str);
                HashMap map2 = new HashMap();
                if (map != null) {
                    for (String str2 : map.keySet()) {
                        CampaignSyncModel campaignSyncModel = (CampaignSyncModel) map.get(str2);
                        if (campaignSyncModel.isSyncing()) {
                            campaignSyncModel.setIsSyncing(false);
                        }
                        map2.put(str2, campaignSyncModel);
                    }
                }
                CampaignSyncModelDbStorage.this.storage.set(CampaignSyncModelDbStorage.SYNC_MODEL_KEY_PREFIX + str, map2);
            }
        });
    }
}
