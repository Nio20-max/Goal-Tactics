package com.helpshift.model;

import android.text.TextUtils;
import com.helpshift.common.dao.BackupDAO;
import com.helpshift.common.platform.Platform;
import com.helpshift.storage.KeyValueStorage;
import java.util.HashMap;
import java.util.HashSet;

/* JADX INFO: loaded from: classes2.dex */
public class SdkInfoModel {
    private static final String CHANGE_SET_ID_PREFIX = "hs__change_set_id:";
    private static final String KEY_DEVICE_ID = "hs-device-id";
    private static final String KEY_SYNCED_USER_ID = "hs-synced-user-id";
    public static final String SDK_LANGUAGE = "sdk-language";
    public static final String SDK_THEME = "sdk-theme";
    private BackupDAO backupStorage;
    private HashMap<String, String> etags;
    private KeyValueStorage storage;

    protected SdkInfoModel(KeyValueStorage keyValueStorage, Platform platform) {
        this.storage = keyValueStorage;
        this.backupStorage = platform.getBackupDAO();
        HashMap<String, String> map = (HashMap) this.storage.get("etags");
        this.etags = map;
        if (map == null) {
            this.etags = new HashMap<>();
        }
        updateBackupStorageWithInternalStorage();
    }

    public void addEtag(String str, String str2) {
        this.etags.put(str2, str);
        this.storage.set("etags", this.etags);
    }

    public String getEtag(String str) {
        return this.etags.get(str);
    }

    public void clearEtag(String str) {
        if (this.etags.containsKey(str)) {
            this.etags.remove(str);
            this.storage.set("etags", this.etags);
        }
    }

    public Float getServerTimeDelta() {
        return (Float) this.storage.get("server-time-delta");
    }

    public void setServerTimeDelta(Float f) {
        this.storage.set("server-time-delta", f);
    }

    public String getCurrentLoggedInId() {
        return (String) this.storage.get("current-logged-in-id");
    }

    public void setCurrentLoggedInId(String str) throws IllegalArgumentException {
        if (str != null) {
            str = str.trim();
        }
        if (!TextUtils.isEmpty(str)) {
            this.storage.set("current-logged-in-id", str);
            return;
        }
        throw new IllegalArgumentException();
    }

    public void addDeviceId(String str) throws IllegalArgumentException {
        if (str != null) {
            str = str.trim();
        }
        if (!TextUtils.isEmpty(str)) {
            this.storage.set(KEY_DEVICE_ID, str);
            this.backupStorage.storeValue(KEY_DEVICE_ID, str);
            return;
        }
        throw new IllegalArgumentException();
    }

    public String getDeviceId() {
        String str = (String) this.storage.get(KEY_DEVICE_ID);
        return str == null ? (String) this.backupStorage.getValue(KEY_DEVICE_ID) : str;
    }

    public Boolean getFirstLaunch() {
        return (Boolean) this.storage.get("hs-first-launch");
    }

    public void setFirstLaunch(Boolean bool) {
        this.storage.set("hs-first-launch", bool);
    }

    public Boolean getOneCampaignFetchSuccessful() {
        return (Boolean) this.storage.get("hs-one-campaign-fetch-successful");
    }

    public void setOneCampaignFetchSuccessful(Boolean bool) {
        this.storage.set("hs-one-campaign-fetch-successful", bool);
    }

    public Boolean getDevicePropertiesSyncImmediately() {
        Boolean bool = (Boolean) this.storage.get("hs-device-properties-sync-immediately");
        if (bool == null) {
            return false;
        }
        return bool;
    }

    public void setDevicePropertiesSyncImmediately(Boolean bool) {
        this.storage.set("hs-device-properties-sync-immediately", bool);
    }

    public String getSdkLanguage() {
        return (String) this.storage.get(SDK_LANGUAGE);
    }

    public void setSdkLanguage(String str) {
        this.storage.set(SDK_LANGUAGE, str);
    }

    public Integer getTheme() {
        return (Integer) this.storage.get(SDK_THEME);
    }

    public void setTheme(int i) {
        this.storage.set(SDK_THEME, Integer.valueOf(i));
    }

    public void setChangeSetId(String str, String str2) {
        this.storage.set(CHANGE_SET_ID_PREFIX + str2, str);
    }

    public String getChangeSetId(String str) {
        return (String) this.storage.get(CHANGE_SET_ID_PREFIX + str);
    }

    public String getUserIdSyncedWithBackend() {
        String str = (String) this.storage.get(KEY_SYNCED_USER_ID);
        return str == null ? (String) this.backupStorage.getValue(KEY_SYNCED_USER_ID) : str;
    }

    public void setUserIdSyncedWithBackend(String str) {
        this.storage.set(KEY_SYNCED_USER_ID, str);
        this.backupStorage.storeValue(KEY_SYNCED_USER_ID, str);
    }

    private void updateBackupStorageWithInternalStorage() {
        String str = (String) this.storage.get(KEY_DEVICE_ID);
        if (str != null) {
            this.backupStorage.storeValue(KEY_DEVICE_ID, str);
        }
        String str2 = (String) this.storage.get(KEY_SYNCED_USER_ID);
        if (str2 != null) {
            this.backupStorage.storeValue(KEY_SYNCED_USER_ID, str2);
        }
    }

    public boolean isDuplicateNotification(String str, String str2) {
        HashMap map = (HashMap) this.storage.get("hs__received_push_campaigns");
        if (map == null) {
            map = new HashMap();
        }
        HashSet hashSet = (HashSet) map.get(str2);
        if (hashSet == null) {
            hashSet = new HashSet();
        }
        if (hashSet.contains(str)) {
            return true;
        }
        hashSet.add(str);
        map.put(str2, hashSet);
        this.storage.set("hs__received_push_campaigns", map);
        return false;
    }
}
