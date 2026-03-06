package com.ironsource.mediationsdk;

import android.content.Context;
import android.os.Build;
import android.text.TextUtils;
import com.ironsource.environment.ApplicationContext;
import com.ironsource.environment.DeviceStatus;
import com.ironsource.environment.StringUtils;
import com.ironsource.environment.TokenConstants;
import com.ironsource.mediationsdk.config.ConfigFile;
import com.ironsource.mediationsdk.logger.IronLog;
import com.ironsource.mediationsdk.utils.ContextProvider;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import com.ironsource.mediationsdk.utils.SessionDepthManager;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
class TokenDataService {
    private static TokenDataService mInstance;
    private JSONObject tokenData = new JSONObject();

    public static synchronized TokenDataService getInstance() {
        if (mInstance == null) {
            mInstance = new TokenDataService();
        }
        return mInstance;
    }

    private TokenDataService() {
    }

    JSONObject getTokenData() {
        collectDataFromDevice();
        return this.tokenData;
    }

    synchronized void add(String str, Object obj) {
        try {
            this.tokenData.put(str, obj);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateTokenData(JSONObject jSONObject) {
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            add(next, jSONObject.opt(next));
        }
    }

    private void collectDataFromDevice() {
        updateTokenData(fetchPermanentData());
        updateTokenData(fetchMutableData());
    }

    void collectAdvertisingData() {
        try {
            new Thread(new Runnable() { // from class: com.ironsource.mediationsdk.TokenDataService.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        TokenDataService tokenDataService = TokenDataService.this;
                        tokenDataService.updateTokenData(tokenDataService.fetchAdvertisingId());
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }).start();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public JSONObject fetchAdvertisingId() {
        String orGenerateOnceUniqueIdentifier;
        String str = "";
        JSONObject jSONObject = new JSONObject();
        Context applicationContext = ContextProvider.getInstance().getApplicationContext();
        if (applicationContext != null) {
            boolean zBooleanValue = false;
            try {
                String[] advertisingIdInfo = DeviceStatus.getAdvertisingIdInfo(applicationContext);
                if (advertisingIdInfo == null || advertisingIdInfo.length != 2) {
                    orGenerateOnceUniqueIdentifier = "";
                } else {
                    orGenerateOnceUniqueIdentifier = !TextUtils.isEmpty(advertisingIdInfo[0]) ? advertisingIdInfo[0] : "";
                    try {
                        zBooleanValue = Boolean.valueOf(advertisingIdInfo[1]).booleanValue();
                    } catch (Exception e) {
                        e = e;
                        IronLog.INTERNAL.error("got the following error " + e.getMessage());
                    }
                }
            } catch (Exception e2) {
                e = e2;
                orGenerateOnceUniqueIdentifier = "";
            }
            if (TextUtils.isEmpty(orGenerateOnceUniqueIdentifier)) {
                orGenerateOnceUniqueIdentifier = DeviceStatus.getOrGenerateOnceUniqueIdentifier(applicationContext);
                if (!TextUtils.isEmpty(orGenerateOnceUniqueIdentifier)) {
                    str = IronSourceConstants.TYPE_UUID;
                }
            } else {
                str = IronSourceConstants.TYPE_GAID;
            }
            try {
                jSONObject.put(TokenConstants.MINIMIZED_ADVERTISING_ID, orGenerateOnceUniqueIdentifier);
                jSONObject.put(TokenConstants.MINIMIZED_ADVERTISING_ID_TYPE, str);
                jSONObject.put(TokenConstants.MINIMIZED_IS_LIMITED_AD_TRACKING, zBooleanValue);
            } catch (Exception e3) {
                e3.printStackTrace();
            }
        }
        return jSONObject;
    }

    JSONObject fetchMutableData() {
        JSONObject jSONObject = new JSONObject();
        Context applicationContext = ContextProvider.getInstance().getApplicationContext();
        int displayWidth = DeviceStatus.getDisplayWidth();
        int displayHeight = DeviceStatus.getDisplayHeight();
        float deviceDensity = DeviceStatus.getDeviceDensity();
        if (applicationContext != null) {
            try {
                ConcurrentHashMap<String, List<String>> metaData = AdapterRepository.getInstance().getMetaData();
                JSONObject jSONObject2 = new JSONObject();
                for (Map.Entry<String, List<String>> entry : metaData.entrySet()) {
                    jSONObject2.put(entry.getKey(), entry.getValue());
                }
                Boolean consent = IronSourceObject.getInstance().getConsent();
                if (consent != null) {
                    jSONObject.put("consent", consent.booleanValue());
                }
                jSONObject.put(TokenConstants.MINIMIZED_CONNECTION_TYPE, IronSourceUtils.getConnectionType(applicationContext));
                jSONObject.put(TokenConstants.DEVICE_VOLUME_MINIMIZED, DeviceStatus.getSystemVolumePercent(applicationContext));
                jSONObject.put(TokenConstants.MINIMIZED_IS_ROOT_DEVICE, DeviceStatus.isRootedDevice());
                jSONObject.put(TokenConstants.MINIMIZED_BATTERY_LEVEL, DeviceStatus.getBatteryLevel(applicationContext));
                jSONObject.put(TokenConstants.MINIMIZED_DISK_FREE_SIZE, DeviceStatus.getAvailableInternalMemorySizeInMegaBytes());
                jSONObject.put(TokenConstants.MINIMIZED_META_DATA, jSONObject2);
                jSONObject.put(TokenConstants.MINIMIZED_CLIENT_TIMESTAMP, new Date().getTime());
                jSONObject.put(TokenConstants.MINIMIZED_DEVICE_WIDTH, displayWidth);
                jSONObject.put(TokenConstants.MINIMIZED_DEVICE_HEIGHT, displayHeight);
                jSONObject.put(TokenConstants.DEVICE_SCREEN_SCALE_MINIMIZED, String.valueOf(deviceDensity));
                jSONObject.put(TokenConstants.MINIMIZED_SESSION_DEPTH_IS, SessionDepthManager.getInstance().getSessionDepth(2));
                jSONObject.put(TokenConstants.MINIMIZED_SESSION_DEPTH_RV, SessionDepthManager.getInstance().getSessionDepth(1));
            } catch (JSONException e) {
                IronLog.INTERNAL.error("got the following error " + e.getMessage());
                e.printStackTrace();
            }
        }
        return jSONObject;
    }

    JSONObject fetchPermanentData() {
        JSONObject jSONObject = new JSONObject();
        Context applicationContext = ContextProvider.getInstance().getApplicationContext();
        if (applicationContext != null) {
            try {
                String language = applicationContext.getResources().getConfiguration().locale.getLanguage();
                if (!TextUtils.isEmpty(language)) {
                    jSONObject.put(TokenConstants.MINIMIZED_DEVICE_LANGUAGE, StringUtils.toUpperCase(language));
                }
                String pluginType = ConfigFile.getConfigFile().getPluginType();
                if (!TextUtils.isEmpty(pluginType)) {
                    jSONObject.put(TokenConstants.MINIMIZED_SDK_PLUGIN_TYPE, pluginType);
                }
                String androidOsVersion = DeviceStatus.getAndroidOsVersion();
                if (androidOsVersion != null) {
                    jSONObject.put(TokenConstants.MINIMIZED_DEVICE_OS_VERSION_FULL, androidOsVersion);
                    jSONObject.put(TokenConstants.MINIMIZED_DEVICE_OS_VERSION, androidOsVersion.replaceAll("[^0-9/.]", ""));
                }
                jSONObject.put(TokenConstants.MINIMIZED_SESSION_ID, IronSourceUtils.getSessionId());
                jSONObject.put("appKey", IronSourceObject.getInstance().getIronSourceAppKey());
                jSONObject.put(TokenConstants.MINIMIZED_MOBILE_CARRIER, DeviceStatus.getMobileCarrier(applicationContext));
                jSONObject.put(TokenConstants.MINIMIZED_MEDIATION_SDK_VERSION, IronSourceUtils.getSDKVersion());
                jSONObject.put(TokenConstants.MINIMIZED_DEVICE_MODEL, Build.MODEL);
                jSONObject.put(TokenConstants.MINIMIZED_DEVICE_OS, "android");
                jSONObject.put(TokenConstants.MINIMIZED_DEVICE_MAKE, Build.MANUFACTURER);
                jSONObject.put(TokenConstants.MINIMIZED_DEVICE_API_LEVEL, String.valueOf(Build.VERSION.SDK_INT));
                jSONObject.put(TokenConstants.MINIMIZED_BUNDLE_ID, applicationContext.getPackageName());
                jSONObject.put(TokenConstants.MINIMIZED_APPLICATION_VERSION, ApplicationContext.getPublisherApplicationVersion(applicationContext, applicationContext.getPackageName()));
                jSONObject.put(TokenConstants.MINIMIZED_APPLICATION_USER_ID, IronSourceObject.getInstance().getIronSourceUserId());
            } catch (JSONException e) {
                IronLog.INTERNAL.error("got the following error " + e.getMessage());
                e.printStackTrace();
            }
        }
        return jSONObject;
    }
}
