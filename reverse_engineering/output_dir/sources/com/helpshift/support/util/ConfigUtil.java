package com.helpshift.support.util;

import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.model.AppInfoModel;
import com.helpshift.support.ApiConfig;
import com.helpshift.support.Support;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class ConfigUtil {
    private static final Map<String, Object> defaultApiConfig = new HashMap();
    private static final Map<String, Object> defaultInstallConfig = new HashMap();

    public static Map<String, Object> getDefaultApiConfig() {
        Map<String, Object> map = defaultApiConfig;
        if (map.size() == 0) {
            map.put(SDKConfigurationDM.ENABLE_CONTACT_US, Support.EnableContactUs.ALWAYS);
            map.put(SDKConfigurationDM.GOTO_CONVERSATION_AFTER_CONTACT_US, false);
            map.put(SDKConfigurationDM.SHOW_SEARCH_ON_NEW_CONVERSATION, false);
            map.put(SDKConfigurationDM.REQUIRE_EMAIL, false);
            map.put(SDKConfigurationDM.HIDE_NAME_AND_EMAIL, false);
            map.put("enableFullPrivacy", false);
            map.put(SDKConfigurationDM.SHOW_CONVERSATION_RESOLUTION_QUESTION_API, false);
            map.put(SDKConfigurationDM.SHOW_CONVERSATION_INFO_SCREEN, false);
            map.put(SDKConfigurationDM.ENABLE_TYPING_INDICATOR, false);
        }
        return map;
    }

    public static Map<String, Object> getDefaultInstallConfig() {
        Map<String, Object> map = defaultInstallConfig;
        if (map.size() == 0) {
            map.put("enableLogging", false);
            map.put("disableHelpshiftBranding", false);
            map.put(SDKConfigurationDM.DISABLE_APP_LAUNCH_EVENT, false);
            map.put(SDKConfigurationDM.ENABLE_IN_APP_NOTIFICATION, true);
            map.put("enableDefaultFallbackLanguage", true);
            map.put(SDKConfigurationDM.DISABLE_ANIMATION, false);
            map.put("font", null);
            map.put(SDKConfigurationDM.SUPPORT_NOTIFICATION_CHANNEL_ID, null);
            map.put("campaignsNotificationChannelId", null);
            map.put(AppInfoModel.SCREEN_ORIENTATION_KEY, -1);
            map.put("manualLifecycleTracking", false);
        }
        return map;
    }

    public static Map<String, Object> validateAndConvertToMap(ApiConfig apiConfig) {
        HashMap map = new HashMap();
        if (apiConfig != null) {
            map.putAll(apiConfig.toMap());
        }
        return map;
    }
}
