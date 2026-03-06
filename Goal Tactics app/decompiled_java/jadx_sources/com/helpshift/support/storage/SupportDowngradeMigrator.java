package com.helpshift.support.storage;

import com.helpshift.common.platform.AndroidDevice;
import com.helpshift.common.platform.KVStore;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.StringUtils;
import com.helpshift.util.VersionName;

/* JADX INFO: loaded from: classes2.dex */
public class SupportDowngradeMigrator implements SDKMigrator {
    private String deviceId;
    private KVStore kvStore = HelpshiftContext.getPlatform().getKVStore();

    @Override // com.helpshift.support.storage.SDKMigrator
    public void backup(VersionName versionName) {
        this.deviceId = this.kvStore.getString(AndroidDevice.KEY_DEVICE_ID);
    }

    @Override // com.helpshift.support.storage.SDKMigrator
    public void restore() {
        if (StringUtils.isEmpty(this.deviceId)) {
            return;
        }
        this.kvStore.setString(AndroidDevice.KEY_DEVICE_ID, this.deviceId);
    }
}
