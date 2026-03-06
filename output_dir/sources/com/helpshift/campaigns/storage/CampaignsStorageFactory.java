package com.helpshift.campaigns.storage;

import com.helpshift.constants.SwitchUserKeys;
import com.helpshift.controllers.DataSyncCoordinatorImpl;
import com.helpshift.controllers.SyncController;
import com.helpshift.model.AppInfoModel;
import com.helpshift.model.SdkInfoModel;
import com.helpshift.storage.CachedKeyValueStorage;
import com.helpshift.storage.KeyValueStorage;
import com.helpshift.storage.StorageFactory;
import com.helpshift.util.concurrent.DispatchQueue;
import com.helpshift.util.constants.KeyValueStorageKeys;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class CampaignsStorageFactory {
    public final CampaignStorage campaignStorage;
    public final CampaignSyncModelStorage campaignSyncModelStorage;
    public final KeyValueStorage keyValueStorage;
    public final PropertyStorage propertyStorage;
    public final SessionStorage sessionStorage;

    CampaignsStorageFactory() {
        CachedKeyValueStorage cachedKeyValueStorage = new CachedKeyValueStorage(StorageFactory.getInstance().keyValueStorage, getCacheWhitelistKeys());
        this.keyValueStorage = cachedKeyValueStorage;
        this.propertyStorage = new PropertyDbStorage();
        this.sessionStorage = new SessionDbStorage();
        this.campaignStorage = new CampaignDbStorage();
        this.campaignSyncModelStorage = new CampaignSyncModelDbStorage(cachedKeyValueStorage, new DispatchQueue(false));
    }

    public static CampaignsStorageFactory getInstance() {
        return LazyHolder.INSTANCE;
    }

    private Set<String> getCacheWhitelistKeys() {
        return new HashSet(Arrays.asList(DataSyncCoordinatorImpl.FIRST_DEVICE_SYNC_COMPLETE_KEY, KeyValueStorageKeys.CAMPAIGNS_IMAGE_URL_RETRY_COUNTS, SdkInfoModel.SDK_LANGUAGE, SdkInfoModel.SDK_THEME, "disableHelpshiftBranding", AppInfoModel.SCREEN_ORIENTATION_KEY, SyncController.DataTypes.DEVICE, SyncController.DataTypes.USER, SyncController.DataTypes.SESSION, SyncController.DataTypes.SWITCH_USER, SyncController.DataTypes.ANALYTICS_EVENT, SwitchUserKeys.CURRENT_USER, SwitchUserKeys.PREV_USER));
    }

    private static final class LazyHolder {
        static final CampaignsStorageFactory INSTANCE = new CampaignsStorageFactory();

        private LazyHolder() {
        }
    }
}
