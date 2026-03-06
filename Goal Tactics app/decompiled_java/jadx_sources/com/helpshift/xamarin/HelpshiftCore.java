package com.helpshift.xamarin;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import com.facebook.internal.AnalyticsEvents;
import com.helpshift.All;
import com.helpshift.Core;
import com.helpshift.HelpshiftUser;
import com.helpshift.InstallConfig;
import com.helpshift.campaigns.Campaigns;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.support.Support;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.HSJSONUtils;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.xamarin.util.ConfigParserUtil;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class HelpshiftCore {
    private static final String PLUGIN_VERSION = "3.6.1";
    public static final String TAG = "Helpshift_XamHsCore";

    public static class HSApiProviderIdentifier {
        public static int ALL = 1;
        public static int CAMPAIGNS = 3;
        public static int SUPPORT = 2;

        private HSApiProviderIdentifier() {
        }
    }

    public static void init(int i) {
        Core.ApiProvider campaigns;
        if (i == HSApiProviderIdentifier.ALL) {
            campaigns = All.getInstance();
        } else if (i == HSApiProviderIdentifier.SUPPORT) {
            campaigns = Support.getInstance();
        } else {
            campaigns = i == HSApiProviderIdentifier.CAMPAIGNS ? Campaigns.getInstance() : null;
        }
        if (campaigns == null) {
            throw new IllegalArgumentException("Unknown provider identifier");
        }
        Core.init(campaigns);
    }

    public static void setNameAndEmail(String str, String str2) {
        Core.setNameAndEmail(str, str2);
    }

    public static void install(Application application, String str, String str2, String str3) throws Exception {
        install(application, str, str2, str3, new HashMap());
    }

    public static void install(Application application, String str, String str2, String str3, Map map) throws Exception {
        sanitizeConfigMap(map);
        HashSet hashSet = new HashSet();
        hashSet.add(SDKConfigurationDM.ENABLE_IN_APP_NOTIFICATION);
        hashSet.add("enableDefaultFallbackLanguage");
        hashSet.add("disableHelpshiftBranding");
        hashSet.add("enableLogging");
        hashSet.add(SDKConfigurationDM.DISABLE_ERROR_LOGGING);
        hashSet.add("disableErrorReporting");
        hashSet.add("enableInboxPolling");
        Core.install(application, str, str2, str3, (Map<String, Object>) ConfigParserUtil.replaceWithBoolean(hashSet, map));
    }

    public static void install(Application application, String str, String str2, String str3, HelpshiftInstallConfig helpshiftInstallConfig) throws Exception {
        Core.install(application, str, str2, str3, new InstallConfig.Builder().setEnableInAppNotification(helpshiftInstallConfig.enableInAppNotification).setNotificationIcon(helpshiftInstallConfig.notificationIcon).setLargeNotificationIcon(helpshiftInstallConfig.largeNotificationIcon).setNotificationSound(helpshiftInstallConfig.notificationSound).setEnableDefaultFallbackLanguage(helpshiftInstallConfig.enableDefaultFallbackLanguage).setEnableInboxPolling(helpshiftInstallConfig.enableInboxPolling).setFont(helpshiftInstallConfig.fontPath).setEnableLogging(helpshiftInstallConfig.enableLogging).setScreenOrientation(helpshiftInstallConfig.screenOrientation).setSupportNotificationChannelId(helpshiftInstallConfig.supportNotificationChannelId).setCampaignsNotificationChannelId(helpshiftInstallConfig.campaignsNotificationChannelId).disableErrorReporting(helpshiftInstallConfig.disableErrorReporting).setExtras(buildExtrasMap(helpshiftInstallConfig.extrasJson)).build());
    }

    private static Map<String, Object> buildExtrasMap(String str) {
        HashMap map = new HashMap();
        map.put(SDKConfigurationDM.SDK_TYPE, "xamarin");
        map.put(SDKConfigurationDM.PLUGIN_VERSION, PLUGIN_VERSION);
        try {
            map.putAll(HSJSONUtils.toMap(new JSONObject(str)));
        } catch (JSONException e) {
            Log.d(TAG, "buildExtrasMap", e);
        }
        return map;
    }

    public static void registerDeviceToken(Context context, String str) {
        Core.registerDeviceToken(context, str);
    }

    public static void handlePush(Context context, Intent intent) {
        Core.handlePush(context, intent);
    }

    public static void handlePush(Context context, Bundle bundle) {
        Core.handlePush(context, bundle);
    }

    public static void handlePush(Context context, Map<String, String> map) {
        Core.handlePush(context, map);
    }

    public static void login(String str, String str2, String str3) {
        Core.login(str, str2, str3);
    }

    public static void logout() {
        Core.logout();
    }

    public static void setSDKLanguage(String str) {
        Core.setSDKLanguage(str);
    }

    public static void setTheme(String str) {
        Context applicationContext = HelpshiftContext.getApplicationContext();
        if (applicationContext == null) {
            HSLogger.e(TAG, "setTheme API called before Helpshift install call");
        } else {
            Core.setTheme(str != null ? ApplicationUtil.getResourceIdFromName(applicationContext, str, AnalyticsEvents.PARAMETER_LIKE_VIEW_STYLE, applicationContext.getPackageName()) : 0);
        }
    }

    private static void sanitizeConfigMap(Map map) {
        if (map == null) {
            return;
        }
        map.put(SDKConfigurationDM.SDK_TYPE, "xamarin");
        map.put(SDKConfigurationDM.PLUGIN_VERSION, PLUGIN_VERSION);
    }

    public static void clearAnonymousUser() {
        Core.clearAnonymousUser();
    }

    public static void login(WrappedHelpshiftUser wrappedHelpshiftUser) {
        Core.login(new HelpshiftUser.Builder(wrappedHelpshiftUser.identifier, wrappedHelpshiftUser.email).setName(wrappedHelpshiftUser.name).setAuthToken(wrappedHelpshiftUser.authToken).build());
    }
}
