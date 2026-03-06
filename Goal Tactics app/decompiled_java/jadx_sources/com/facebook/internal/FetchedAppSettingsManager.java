package com.facebook.internal;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import com.facebook.FacebookSdk;
import com.facebook.GraphRequest;
import com.facebook.appevents.codeless.internal.UnityReflection;
import com.facebook.appevents.internal.AutomaticAnalyticsLogger;
import com.facebook.appevents.internal.Constants;
import com.facebook.internal.FetchedAppSettings;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: FetchedAppSettingsManager.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000l\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0010 \n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\n\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001:\u0002BCB\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0010\u0010.\u001a\u00020/2\u0006\u00100\u001a\u00020$H\u0007J\u0010\u00101\u001a\u0002022\u0006\u00103\u001a\u00020\u0004H\u0002J\u0014\u00104\u001a\u0004\u0018\u00010!2\b\u00103\u001a\u0004\u0018\u00010\u0004H\u0007J\b\u00105\u001a\u00020/H\u0007J\u001d\u00106\u001a\u00020!2\u0006\u00103\u001a\u00020\u00042\u0006\u00107\u001a\u000202H\u0000¢\u0006\u0002\b8J*\u00109\u001a\u001a\u0012\u0004\u0012\u00020\u0004\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020;0 0:2\b\u0010<\u001a\u0004\u0018\u000102H\u0002J\b\u0010=\u001a\u00020/H\u0002J\u001a\u0010>\u001a\u0004\u0018\u00010!2\u0006\u00103\u001a\u00020\u00042\u0006\u0010?\u001a\u00020&H\u0007J\u0010\u0010@\u001a\u00020/2\u0006\u0010A\u001a\u00020&H\u0007R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u0014\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00040\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0015X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0015X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0015X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u0015X\u0082T¢\u0006\u0002\n\u0000R\u001a\u0010\u001f\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020!0 X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\"\u001a\b\u0012\u0004\u0012\u00020$0#X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010%\u001a\u00020&X\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u0010'\u001a\u0010\u0012\f\u0012\n **\u0004\u0018\u00010)0)0(X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010+\u001a\u00020&X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010,\u001a\u0004\u0018\u00010-X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006D"}, d2 = {"Lcom/facebook/internal/FetchedAppSettingsManager;", "", "()V", "APPLICATION_FIELDS", "", "APP_SETTINGS_PREFS_KEY_FORMAT", "APP_SETTINGS_PREFS_STORE", "APP_SETTING_ANDROID_SDK_ERROR_CATEGORIES", "APP_SETTING_APP_EVENTS_AAM_RULE", "APP_SETTING_APP_EVENTS_EVENT_BINDINGS", "APP_SETTING_APP_EVENTS_FEATURE_BITMASK", "APP_SETTING_APP_EVENTS_SESSION_TIMEOUT", "APP_SETTING_DIALOG_CONFIGS", "APP_SETTING_FIELDS", "", "APP_SETTING_NUX_CONTENT", "APP_SETTING_NUX_ENABLED", "APP_SETTING_RESTRICTIVE_EVENT_FILTER_FIELD", "APP_SETTING_SMART_LOGIN_OPTIONS", "APP_SETTING_SUPPORTS_IMPLICIT_SDK_LOGGING", "AUTOMATIC_LOGGING_ENABLED_BITMASK_FIELD", "", "CODELESS_EVENTS_ENABLED_BITMASK_FIELD", "IAP_AUTOMATIC_LOGGING_ENABLED_BITMASK_FIELD", "MONITOR_ENABLED_BITMASK_FIELD", "SDK_UPDATE_MESSAGE", "SMART_LOGIN_BOOKMARK_ICON_URL", "SMART_LOGIN_MENU_ICON_URL", "SUGGESTED_EVENTS_SETTING", "TAG", "TRACK_UNINSTALL_ENABLED_BITMASK_FIELD", "fetchedAppSettings", "", "Lcom/facebook/internal/FetchedAppSettings;", "fetchedAppSettingsCallbacks", "Ljava/util/concurrent/ConcurrentLinkedQueue;", "Lcom/facebook/internal/FetchedAppSettingsManager$FetchedAppSettingsCallback;", "isUnityInit", "", "loadingState", "Ljava/util/concurrent/atomic/AtomicReference;", "Lcom/facebook/internal/FetchedAppSettingsManager$FetchAppSettingState;", "kotlin.jvm.PlatformType", "printedSDKUpdatedMessage", "unityEventBindings", "Lorg/json/JSONArray;", "getAppSettingsAsync", "", "callback", "getAppSettingsQueryResponse", "Lorg/json/JSONObject;", "applicationId", "getAppSettingsWithoutQuery", "loadAppSettingsAsync", "parseAppSettingsFromJSON", "settingsJSON", "parseAppSettingsFromJSON$facebook_core_release", "parseDialogConfigurations", "", "Lcom/facebook/internal/FetchedAppSettings$DialogFeatureConfig;", "dialogConfigResponse", "pollCallbacks", "queryAppSettings", "forceRequery", "setIsUnityInit", "flag", "FetchAppSettingState", "FetchedAppSettingsCallback", "facebook-core_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
public final class FetchedAppSettingsManager {
    private static final String APPLICATION_FIELDS = "fields";
    private static final String APP_SETTINGS_PREFS_KEY_FORMAT = "com.facebook.internal.APP_SETTINGS.%s";
    private static final String APP_SETTINGS_PREFS_STORE = "com.facebook.internal.preferences.APP_SETTINGS";
    private static final String APP_SETTING_ANDROID_SDK_ERROR_CATEGORIES = "android_sdk_error_categories";
    private static final String APP_SETTING_APP_EVENTS_AAM_RULE = "aam_rules";
    private static final String APP_SETTING_APP_EVENTS_EVENT_BINDINGS = "auto_event_mapping_android";
    private static final String APP_SETTING_APP_EVENTS_FEATURE_BITMASK = "app_events_feature_bitmask";
    private static final String APP_SETTING_APP_EVENTS_SESSION_TIMEOUT = "app_events_session_timeout";
    private static final String APP_SETTING_DIALOG_CONFIGS = "android_dialog_configs";
    private static final List<String> APP_SETTING_FIELDS;
    private static final String APP_SETTING_NUX_CONTENT = "gdpv4_nux_content";
    private static final String APP_SETTING_NUX_ENABLED = "gdpv4_nux_enabled";
    private static final String APP_SETTING_RESTRICTIVE_EVENT_FILTER_FIELD = "restrictive_data_filter_params";
    private static final String APP_SETTING_SMART_LOGIN_OPTIONS = "seamless_login";
    private static final String APP_SETTING_SUPPORTS_IMPLICIT_SDK_LOGGING = "supports_implicit_sdk_logging";
    private static final int AUTOMATIC_LOGGING_ENABLED_BITMASK_FIELD = 8;
    private static final int CODELESS_EVENTS_ENABLED_BITMASK_FIELD = 32;
    private static final int IAP_AUTOMATIC_LOGGING_ENABLED_BITMASK_FIELD = 16;
    public static final FetchedAppSettingsManager INSTANCE = new FetchedAppSettingsManager();
    private static final int MONITOR_ENABLED_BITMASK_FIELD = 16384;
    private static final String SDK_UPDATE_MESSAGE = "sdk_update_message";
    private static final String SMART_LOGIN_BOOKMARK_ICON_URL = "smart_login_bookmark_icon_url";
    private static final String SMART_LOGIN_MENU_ICON_URL = "smart_login_menu_icon_url";
    private static final String SUGGESTED_EVENTS_SETTING = "suggested_events_setting";
    private static final String TAG;
    private static final int TRACK_UNINSTALL_ENABLED_BITMASK_FIELD = 256;
    private static final Map<String, FetchedAppSettings> fetchedAppSettings;
    private static final ConcurrentLinkedQueue<FetchedAppSettingsCallback> fetchedAppSettingsCallbacks;
    private static boolean isUnityInit;
    private static final AtomicReference<FetchAppSettingState> loadingState;
    private static boolean printedSDKUpdatedMessage;
    private static JSONArray unityEventBindings;

    /* JADX INFO: compiled from: FetchedAppSettingsManager.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\bf\u0018\u00002\u00020\u0001J\b\u0010\u0002\u001a\u00020\u0003H&J\u0012\u0010\u0004\u001a\u00020\u00032\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006H&¨\u0006\u0007"}, d2 = {"Lcom/facebook/internal/FetchedAppSettingsManager$FetchedAppSettingsCallback;", "", "onError", "", "onSuccess", "fetchedAppSettings", "Lcom/facebook/internal/FetchedAppSettings;", "facebook-core_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
    public interface FetchedAppSettingsCallback {
        void onError();

        void onSuccess(FetchedAppSettings fetchedAppSettings);
    }

    private FetchedAppSettingsManager() {
    }

    static {
        String simpleName = FetchedAppSettingsManager.class.getSimpleName();
        Intrinsics.checkNotNullExpressionValue(simpleName, "FetchedAppSettingsManager::class.java.simpleName");
        TAG = simpleName;
        APP_SETTING_FIELDS = CollectionsKt.listOf((Object[]) new String[]{APP_SETTING_SUPPORTS_IMPLICIT_SDK_LOGGING, APP_SETTING_NUX_CONTENT, APP_SETTING_NUX_ENABLED, APP_SETTING_DIALOG_CONFIGS, APP_SETTING_ANDROID_SDK_ERROR_CATEGORIES, APP_SETTING_APP_EVENTS_SESSION_TIMEOUT, APP_SETTING_APP_EVENTS_FEATURE_BITMASK, APP_SETTING_APP_EVENTS_EVENT_BINDINGS, APP_SETTING_SMART_LOGIN_OPTIONS, SMART_LOGIN_BOOKMARK_ICON_URL, SMART_LOGIN_MENU_ICON_URL, APP_SETTING_RESTRICTIVE_EVENT_FILTER_FIELD, APP_SETTING_APP_EVENTS_AAM_RULE, SUGGESTED_EVENTS_SETTING});
        fetchedAppSettings = new ConcurrentHashMap();
        loadingState = new AtomicReference<>(FetchAppSettingState.NOT_LOADED);
        fetchedAppSettingsCallbacks = new ConcurrentLinkedQueue<>();
    }

    @JvmStatic
    public static final void loadAppSettingsAsync() {
        FacebookSdk facebookSdk = FacebookSdk.INSTANCE;
        final Context applicationContext = FacebookSdk.getApplicationContext();
        FacebookSdk facebookSdk2 = FacebookSdk.INSTANCE;
        final String applicationId = FacebookSdk.getApplicationId();
        Utility utility = Utility.INSTANCE;
        if (Utility.isNullOrEmpty(applicationId)) {
            loadingState.set(FetchAppSettingState.ERROR);
            INSTANCE.pollCallbacks();
            return;
        }
        if (fetchedAppSettings.containsKey(applicationId)) {
            loadingState.set(FetchAppSettingState.SUCCESS);
            INSTANCE.pollCallbacks();
            return;
        }
        AtomicReference<FetchAppSettingState> atomicReference = loadingState;
        if (!(atomicReference.compareAndSet(FetchAppSettingState.NOT_LOADED, FetchAppSettingState.LOADING) || atomicReference.compareAndSet(FetchAppSettingState.ERROR, FetchAppSettingState.LOADING))) {
            INSTANCE.pollCallbacks();
            return;
        }
        StringCompanionObject stringCompanionObject = StringCompanionObject.INSTANCE;
        final String str = String.format(APP_SETTINGS_PREFS_KEY_FORMAT, Arrays.copyOf(new Object[]{applicationId}, 1));
        Intrinsics.checkNotNullExpressionValue(str, "java.lang.String.format(format, *args)");
        FacebookSdk facebookSdk3 = FacebookSdk.INSTANCE;
        FacebookSdk.getExecutor().execute(new Runnable() { // from class: com.facebook.internal.-$$Lambda$FetchedAppSettingsManager$0Zs5KScD9YcdRdfqSQiSgW_MgdQ
            @Override // java.lang.Runnable
            public final void run() {
                FetchedAppSettingsManager.m124loadAppSettingsAsync$lambda0(applicationContext, str, applicationId);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX INFO: renamed from: loadAppSettingsAsync$lambda-0, reason: not valid java name */
    public static final void m124loadAppSettingsAsync$lambda0(Context context, String settingsKey, String applicationId) {
        JSONObject jSONObject;
        Intrinsics.checkNotNullParameter(context, "$context");
        Intrinsics.checkNotNullParameter(settingsKey, "$settingsKey");
        Intrinsics.checkNotNullParameter(applicationId, "$applicationId");
        SharedPreferences sharedPreferences = context.getSharedPreferences(APP_SETTINGS_PREFS_STORE, 0);
        FetchedAppSettings appSettingsFromJSON$facebook_core_release = null;
        String string = sharedPreferences.getString(settingsKey, null);
        Utility utility = Utility.INSTANCE;
        if (!Utility.isNullOrEmpty(string)) {
            if (string == null) {
                throw new IllegalStateException("Required value was null.".toString());
            }
            try {
                jSONObject = new JSONObject(string);
            } catch (JSONException e) {
                Utility utility2 = Utility.INSTANCE;
                Utility.logd(Utility.LOG_TAG, e);
                jSONObject = null;
            }
            if (jSONObject != null) {
                appSettingsFromJSON$facebook_core_release = INSTANCE.parseAppSettingsFromJSON$facebook_core_release(applicationId, jSONObject);
            }
        }
        FetchedAppSettingsManager fetchedAppSettingsManager = INSTANCE;
        JSONObject appSettingsQueryResponse = fetchedAppSettingsManager.getAppSettingsQueryResponse(applicationId);
        if (appSettingsQueryResponse != null) {
            fetchedAppSettingsManager.parseAppSettingsFromJSON$facebook_core_release(applicationId, appSettingsQueryResponse);
            sharedPreferences.edit().putString(settingsKey, appSettingsQueryResponse.toString()).apply();
        }
        if (appSettingsFromJSON$facebook_core_release != null) {
            String sdkUpdateMessage = appSettingsFromJSON$facebook_core_release.getSdkUpdateMessage();
            if (!printedSDKUpdatedMessage && sdkUpdateMessage != null && sdkUpdateMessage.length() > 0) {
                printedSDKUpdatedMessage = true;
                Log.w(TAG, sdkUpdateMessage);
            }
        }
        FetchedAppGateKeepersManager fetchedAppGateKeepersManager = FetchedAppGateKeepersManager.INSTANCE;
        FetchedAppGateKeepersManager.queryAppGateKeepers(applicationId, true);
        AutomaticAnalyticsLogger automaticAnalyticsLogger = AutomaticAnalyticsLogger.INSTANCE;
        AutomaticAnalyticsLogger.logActivateAppEvent();
        loadingState.set(fetchedAppSettings.containsKey(applicationId) ? FetchAppSettingState.SUCCESS : FetchAppSettingState.ERROR);
        fetchedAppSettingsManager.pollCallbacks();
    }

    @JvmStatic
    public static final FetchedAppSettings getAppSettingsWithoutQuery(String applicationId) {
        if (applicationId != null) {
            return fetchedAppSettings.get(applicationId);
        }
        return null;
    }

    @JvmStatic
    public static final void getAppSettingsAsync(FetchedAppSettingsCallback callback) {
        Intrinsics.checkNotNullParameter(callback, "callback");
        fetchedAppSettingsCallbacks.add(callback);
        loadAppSettingsAsync();
    }

    private final synchronized void pollCallbacks() {
        FetchAppSettingState fetchAppSettingState = loadingState.get();
        if (FetchAppSettingState.NOT_LOADED != fetchAppSettingState && FetchAppSettingState.LOADING != fetchAppSettingState) {
            FacebookSdk facebookSdk = FacebookSdk.INSTANCE;
            final FetchedAppSettings fetchedAppSettings2 = fetchedAppSettings.get(FacebookSdk.getApplicationId());
            Handler handler = new Handler(Looper.getMainLooper());
            if (FetchAppSettingState.ERROR == fetchAppSettingState) {
                while (true) {
                    ConcurrentLinkedQueue<FetchedAppSettingsCallback> concurrentLinkedQueue = fetchedAppSettingsCallbacks;
                    if (concurrentLinkedQueue.isEmpty()) {
                        return;
                    }
                    final FetchedAppSettingsCallback fetchedAppSettingsCallbackPoll = concurrentLinkedQueue.poll();
                    handler.post(new Runnable() { // from class: com.facebook.internal.-$$Lambda$FetchedAppSettingsManager$SdN-yzD6wmkGxbxRQr4yZ1VBUyM
                        @Override // java.lang.Runnable
                        public final void run() {
                            fetchedAppSettingsCallbackPoll.onError();
                        }
                    });
                }
            } else {
                while (true) {
                    ConcurrentLinkedQueue<FetchedAppSettingsCallback> concurrentLinkedQueue2 = fetchedAppSettingsCallbacks;
                    if (concurrentLinkedQueue2.isEmpty()) {
                        return;
                    }
                    final FetchedAppSettingsCallback fetchedAppSettingsCallbackPoll2 = concurrentLinkedQueue2.poll();
                    handler.post(new Runnable() { // from class: com.facebook.internal.-$$Lambda$FetchedAppSettingsManager$gDG3bwHKkV3rj1I204j2AfURiQI
                        @Override // java.lang.Runnable
                        public final void run() {
                            fetchedAppSettingsCallbackPoll2.onSuccess(fetchedAppSettings2);
                        }
                    });
                }
            }
        }
    }

    @JvmStatic
    public static final FetchedAppSettings queryAppSettings(String applicationId, boolean forceRequery) {
        Intrinsics.checkNotNullParameter(applicationId, "applicationId");
        if (!forceRequery) {
            Map<String, FetchedAppSettings> map = fetchedAppSettings;
            if (map.containsKey(applicationId)) {
                return map.get(applicationId);
            }
        }
        FetchedAppSettingsManager fetchedAppSettingsManager = INSTANCE;
        JSONObject appSettingsQueryResponse = fetchedAppSettingsManager.getAppSettingsQueryResponse(applicationId);
        if (appSettingsQueryResponse == null) {
            return null;
        }
        FetchedAppSettings appSettingsFromJSON$facebook_core_release = fetchedAppSettingsManager.parseAppSettingsFromJSON$facebook_core_release(applicationId, appSettingsQueryResponse);
        FacebookSdk facebookSdk = FacebookSdk.INSTANCE;
        if (Intrinsics.areEqual(applicationId, FacebookSdk.getApplicationId())) {
            loadingState.set(FetchAppSettingState.SUCCESS);
            fetchedAppSettingsManager.pollCallbacks();
        }
        return appSettingsFromJSON$facebook_core_release;
    }

    public final FetchedAppSettings parseAppSettingsFromJSON$facebook_core_release(String applicationId, JSONObject settingsJSON) {
        Intrinsics.checkNotNullParameter(applicationId, "applicationId");
        Intrinsics.checkNotNullParameter(settingsJSON, "settingsJSON");
        FacebookRequestErrorClassification facebookRequestErrorClassificationCreateFromJSON = FacebookRequestErrorClassification.INSTANCE.createFromJSON(settingsJSON.optJSONArray(APP_SETTING_ANDROID_SDK_ERROR_CATEGORIES));
        if (facebookRequestErrorClassificationCreateFromJSON == null) {
            facebookRequestErrorClassificationCreateFromJSON = FacebookRequestErrorClassification.INSTANCE.getDefaultErrorClassification();
        }
        FacebookRequestErrorClassification facebookRequestErrorClassification = facebookRequestErrorClassificationCreateFromJSON;
        int iOptInt = settingsJSON.optInt(APP_SETTING_APP_EVENTS_FEATURE_BITMASK, 0);
        boolean z = (iOptInt & 8) != 0;
        boolean z2 = (iOptInt & 16) != 0;
        boolean z3 = (iOptInt & 32) != 0;
        boolean z4 = (iOptInt & 256) != 0;
        boolean z5 = (iOptInt & 16384) != 0;
        JSONArray jSONArrayOptJSONArray = settingsJSON.optJSONArray(APP_SETTING_APP_EVENTS_EVENT_BINDINGS);
        unityEventBindings = jSONArrayOptJSONArray;
        if (jSONArrayOptJSONArray != null) {
            InternalSettings internalSettings = InternalSettings.INSTANCE;
            if (InternalSettings.isUnityApp()) {
                UnityReflection unityReflection = UnityReflection.INSTANCE;
                UnityReflection.sendEventMapping(jSONArrayOptJSONArray == null ? null : jSONArrayOptJSONArray.toString());
            }
        }
        boolean zOptBoolean = settingsJSON.optBoolean(APP_SETTING_SUPPORTS_IMPLICIT_SDK_LOGGING, false);
        String strOptString = settingsJSON.optString(APP_SETTING_NUX_CONTENT, "");
        Intrinsics.checkNotNullExpressionValue(strOptString, "settingsJSON.optString(APP_SETTING_NUX_CONTENT, \"\")");
        boolean zOptBoolean2 = settingsJSON.optBoolean(APP_SETTING_NUX_ENABLED, false);
        Constants constants = Constants.INSTANCE;
        int iOptInt2 = settingsJSON.optInt(APP_SETTING_APP_EVENTS_SESSION_TIMEOUT, Constants.getDefaultAppEventsSessionTimeoutInSeconds());
        EnumSet<SmartLoginOption> options = SmartLoginOption.INSTANCE.parseOptions(settingsJSON.optLong(APP_SETTING_SMART_LOGIN_OPTIONS));
        Map<String, Map<String, FetchedAppSettings.DialogFeatureConfig>> dialogConfigurations = parseDialogConfigurations(settingsJSON.optJSONObject(APP_SETTING_DIALOG_CONFIGS));
        String strOptString2 = settingsJSON.optString(SMART_LOGIN_BOOKMARK_ICON_URL);
        Intrinsics.checkNotNullExpressionValue(strOptString2, "settingsJSON.optString(SMART_LOGIN_BOOKMARK_ICON_URL)");
        String strOptString3 = settingsJSON.optString(SMART_LOGIN_MENU_ICON_URL);
        Intrinsics.checkNotNullExpressionValue(strOptString3, "settingsJSON.optString(SMART_LOGIN_MENU_ICON_URL)");
        String strOptString4 = settingsJSON.optString(SDK_UPDATE_MESSAGE);
        Intrinsics.checkNotNullExpressionValue(strOptString4, "settingsJSON.optString(SDK_UPDATE_MESSAGE)");
        FetchedAppSettings fetchedAppSettings2 = new FetchedAppSettings(zOptBoolean, strOptString, zOptBoolean2, iOptInt2, options, dialogConfigurations, z, facebookRequestErrorClassification, strOptString2, strOptString3, z2, z3, jSONArrayOptJSONArray, strOptString4, z4, z5, settingsJSON.optString(APP_SETTING_APP_EVENTS_AAM_RULE), settingsJSON.optString(SUGGESTED_EVENTS_SETTING), settingsJSON.optString(APP_SETTING_RESTRICTIVE_EVENT_FILTER_FIELD));
        fetchedAppSettings.put(applicationId, fetchedAppSettings2);
        return fetchedAppSettings2;
    }

    @JvmStatic
    public static final void setIsUnityInit(boolean flag) {
        isUnityInit = flag;
        if (unityEventBindings == null || !flag) {
            return;
        }
        UnityReflection unityReflection = UnityReflection.INSTANCE;
        UnityReflection.sendEventMapping(String.valueOf(unityEventBindings));
    }

    private final JSONObject getAppSettingsQueryResponse(String applicationId) {
        Bundle bundle = new Bundle();
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(APP_SETTING_FIELDS);
        bundle.putString("fields", TextUtils.join(",", arrayList));
        GraphRequest graphRequestNewGraphPathRequest = GraphRequest.INSTANCE.newGraphPathRequest(null, "app", null);
        graphRequestNewGraphPathRequest.setForceApplicationRequest(true);
        graphRequestNewGraphPathRequest.setParameters(bundle);
        JSONObject jsonObject = graphRequestNewGraphPathRequest.executeAndWait().getJsonObject();
        return jsonObject == null ? new JSONObject() : jsonObject;
    }

    private final Map<String, Map<String, FetchedAppSettings.DialogFeatureConfig>> parseDialogConfigurations(JSONObject dialogConfigResponse) {
        JSONArray jSONArrayOptJSONArray;
        HashMap map = new HashMap();
        if (dialogConfigResponse != null && (jSONArrayOptJSONArray = dialogConfigResponse.optJSONArray("data")) != null) {
            int i = 0;
            int length = jSONArrayOptJSONArray.length();
            if (length > 0) {
                while (true) {
                    int i2 = i + 1;
                    FetchedAppSettings.DialogFeatureConfig.Companion companion = FetchedAppSettings.DialogFeatureConfig.INSTANCE;
                    JSONObject jSONObjectOptJSONObject = jSONArrayOptJSONArray.optJSONObject(i);
                    Intrinsics.checkNotNullExpressionValue(jSONObjectOptJSONObject, "dialogConfigData.optJSONObject(i)");
                    FetchedAppSettings.DialogFeatureConfig dialogConfig = companion.parseDialogConfig(jSONObjectOptJSONObject);
                    if (dialogConfig != null) {
                        String dialogName = dialogConfig.getDialogName();
                        HashMap map2 = (Map) map.get(dialogName);
                        if (map2 == null) {
                            map2 = new HashMap();
                            map.put(dialogName, map2);
                        }
                        map2.put(dialogConfig.getFeatureName(), dialogConfig);
                    }
                    if (i2 >= length) {
                        break;
                    }
                    i = i2;
                }
            }
        }
        return map;
    }

    /* JADX INFO: compiled from: FetchedAppSettingsManager.kt */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0006\b\u0080\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006¨\u0006\u0007"}, d2 = {"Lcom/facebook/internal/FetchedAppSettingsManager$FetchAppSettingState;", "", "(Ljava/lang/String;I)V", "NOT_LOADED", "LOADING", "SUCCESS", "ERROR", "facebook-core_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
    public enum FetchAppSettingState {
        NOT_LOADED,
        LOADING,
        SUCCESS,
        ERROR;

        /* JADX INFO: renamed from: values, reason: to resolve conflict with enum method */
        public static FetchAppSettingState[] valuesCustom() {
            FetchAppSettingState[] fetchAppSettingStateArrValuesCustom = values();
            return (FetchAppSettingState[]) Arrays.copyOf(fetchAppSettingStateArrValuesCustom, fetchAppSettingStateArrValuesCustom.length);
        }
    }
}
