package com.helpshift.model;

import android.text.TextUtils;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.storage.KeyValueStorage;
import com.helpshift.util.SchemaUtil;
import java.util.HashMap;

/* JADX INFO: loaded from: classes2.dex */
public class AppInfoModel {
    public static final String HELPSHIFT_BRANDING_DISABLE_INSTALL = "disableHelpshiftBranding";
    public static final String SCREEN_ORIENTATION_KEY = "screenOrientation";
    public String apiKey;
    public String campaignsNotificationChannelId;
    public Boolean disableAnimations;
    public Boolean disableHelpshiftBranding;
    public String domainName;
    public Boolean enableInboxPolling;
    private String fontPath;
    public Integer largeNotificationIconId;
    public Boolean muteNotifications;
    public Integer notificationIconId;
    public Integer notificationSoundId;
    public String platformId;
    public Integer screenOrientation;
    private KeyValueStorage storage;

    protected AppInfoModel(KeyValueStorage keyValueStorage) {
        this.storage = keyValueStorage;
        this.apiKey = (String) keyValueStorage.get(SDKConfigurationDM.API_KEY);
        String str = (String) this.storage.get(SDKConfigurationDM.DOMAIN_NAME);
        this.domainName = str;
        if (str != null && !SchemaUtil.validateDomainName(str)) {
            this.domainName = null;
        }
        String str2 = (String) this.storage.get(SDKConfigurationDM.PLATFORM_ID);
        this.platformId = str2;
        if (str2 != null && !SchemaUtil.validatePlatformId(str2)) {
            this.platformId = null;
        }
        this.fontPath = (String) this.storage.get("font");
        this.notificationSoundId = (Integer) this.storage.get("notificationSound");
        this.notificationIconId = (Integer) this.storage.get("notificationIcon");
        this.largeNotificationIconId = (Integer) this.storage.get("largeNotificationIcon");
        this.disableHelpshiftBranding = (Boolean) this.storage.get("disableHelpshiftBranding");
        this.enableInboxPolling = (Boolean) this.storage.get("enableInboxPolling");
        this.muteNotifications = (Boolean) this.storage.get("muteNotifications");
        this.disableAnimations = (Boolean) this.storage.get(SDKConfigurationDM.DISABLE_ANIMATION);
        this.screenOrientation = (Integer) this.storage.get(SCREEN_ORIENTATION_KEY);
        this.campaignsNotificationChannelId = (String) this.storage.get("campaignsNotificationChannelId");
    }

    public String getFontPath() {
        return this.fontPath;
    }

    public void setFontPath(String str) {
        this.fontPath = str;
        this.storage.set("font", str);
    }

    public void setNotificationSoundId(Integer num) {
        this.notificationSoundId = num;
        this.storage.set("notificationSound", num);
    }

    public void setNotificationIconId(Integer num) {
        this.notificationIconId = num;
        this.storage.set("notificationIcon", num);
    }

    public void setScreenOrientation(Integer num) {
        this.screenOrientation = num;
        this.storage.set(SCREEN_ORIENTATION_KEY, num);
    }

    public void setLargeNotificationIconId(Integer num) {
        this.largeNotificationIconId = num;
        this.storage.set("largeNotificationIcon", num);
    }

    public void setDisableHelpshiftBranding(Boolean bool) {
        this.disableHelpshiftBranding = bool;
        this.storage.set("disableHelpshiftBranding", bool);
    }

    public void setEnableInboxPolling(Boolean bool) {
        this.enableInboxPolling = bool;
        this.storage.set("enableInboxPolling", bool);
    }

    public void setDisableAnimations(Boolean bool) {
        this.disableAnimations = bool;
        this.storage.set(SDKConfigurationDM.DISABLE_ANIMATION, bool);
    }

    public void setMuteNotifications(Boolean bool) {
        this.muteNotifications = bool;
        this.storage.set("muteNotifications", bool);
    }

    public void setCampaignsNotificationChannelId(String str) {
        this.campaignsNotificationChannelId = str;
        this.storage.set("campaignsNotificationChannelId", str);
    }

    public void install(String str, String str2, String str3) {
        this.apiKey = str;
        this.domainName = str2;
        this.platformId = str3;
        if (str2 != null && !SchemaUtil.validateDomainName(str2)) {
            this.domainName = null;
        }
        String str4 = this.platformId;
        if (str4 != null && !SchemaUtil.validatePlatformId(str4)) {
            this.platformId = null;
        }
        HashMap map = new HashMap();
        map.put(SDKConfigurationDM.API_KEY, this.apiKey);
        map.put(SDKConfigurationDM.DOMAIN_NAME, this.domainName);
        map.put(SDKConfigurationDM.PLATFORM_ID, this.platformId);
        this.storage.setKeyValues(map);
    }

    public boolean isInstalled() {
        return (TextUtils.isEmpty(this.apiKey) || TextUtils.isEmpty(this.domainName) || TextUtils.isEmpty(this.platformId)) ? false : true;
    }
}
