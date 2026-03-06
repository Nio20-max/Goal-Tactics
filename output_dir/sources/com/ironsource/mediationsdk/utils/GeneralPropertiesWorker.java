package com.ironsource.mediationsdk.utils;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.support.v4.media.session.PlaybackStateCompat;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.ironsource.environment.ApplicationContext;
import com.ironsource.environment.DeviceStatus;
import com.ironsource.environment.TokenConstants;
import com.ironsource.mediationsdk.IronSourceObject;
import com.ironsource.mediationsdk.config.ConfigFile;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.sdk.GeneralProperties;
import com.ironsource.sdk.constants.Constants;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

/* JADX INFO: loaded from: classes2.dex */
public class GeneralPropertiesWorker implements Runnable {
    private static final int MAX_MINUTES_OFFSET = 840;
    private static final int MINUTES_OFFSET_STEP = 15;
    private static final int MIN_MINUTES_OFFSET = -720;
    public static final String SDK_VERSION = "sdkVersion";
    private Context mContext;
    private final String TAG = getClass().getSimpleName();
    private final String BUNDLE_ID = "bundleId";
    private final String ADVERTISING_ID = TokenConstants.ADVERTISING_ID;
    private final String ADVERTISING_ID_IS_LIMIT_TRACKING = "isLimitAdTrackingEnabled";
    private final String APPLICATION_KEY = "appKey";
    private final String DEVICE_OS = TokenConstants.DEVICE_OS;
    private final String ANDROID_OS_VERSION = "osVersion";
    private final String CONNECTION_TYPE = "connectionType";
    private final String LANGUAGE = "language";
    private final String DEVICE_OEM = "deviceOEM";
    private final String DEVICE_MODEL = "deviceModel";
    private final String MOBILE_CARRIER = "mobileCarrier";
    private final String EXTERNAL_FREE_MEMORY = "externalFreeMemory";
    private final String INTERNAL_FREE_MEMORY = "internalFreeMemory";
    private final String BATTERY_LEVEL = "battery";
    private final String GMT_MINUTES_OFFSET = "gmtMinutesOffset";
    private final String PUBLISHER_APP_VERSION = "appVersion";
    private final String KEY_SESSION_ID = TokenConstants.SESSION_ID;
    private final String KEY_PLUGIN_TYPE = "pluginType";
    private final String KEY_PLUGIN_VERSION = SDKConfigurationDM.PLUGIN_VERSION;
    private final String KEY_PLUGIN_FW_VERSION = "plugin_fw_v";
    private final String KEY_IS_ROOT = "jb";
    private final String ADVERTISING_ID_TYPE = "advertisingIdType";
    private final String MEDIATION_TYPE = "mt";

    private String getDeviceOS() {
        return Constants.JAVASCRIPT_INTERFACE_NAME;
    }

    private GeneralPropertiesWorker() {
    }

    public GeneralPropertiesWorker(Context context) {
        this.mContext = context.getApplicationContext();
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            GeneralProperties.getProperties().putKeys(collectInformation());
            IronSourceUtils.saveGeneralProperties(this.mContext, GeneralProperties.getProperties().toJSON());
        } catch (Exception e) {
            IronSourceLoggerManager.getLogger().logException(IronSourceLogger.IronSourceTag.NATIVE, "Thread name = " + getClass().getSimpleName(), e);
        }
    }

    private Map<String, Object> collectInformation() {
        String orGenerateOnceUniqueIdentifier;
        String[] advertisingIdInfo;
        String str = "";
        HashMap map = new HashMap();
        map.put(TokenConstants.SESSION_ID, IronSourceUtils.getSessionId());
        String bundleId = getBundleId();
        if (!TextUtils.isEmpty(bundleId)) {
            map.put("bundleId", bundleId);
            String publisherApplicationVersion = ApplicationContext.getPublisherApplicationVersion(this.mContext, bundleId);
            if (!TextUtils.isEmpty(publisherApplicationVersion)) {
                map.put("appVersion", publisherApplicationVersion);
            }
        }
        map.put("appKey", getApplicationKey());
        boolean zBooleanValue = false;
        try {
            advertisingIdInfo = DeviceStatus.getAdvertisingIdInfo(this.mContext);
        } catch (Exception unused) {
        }
        if (advertisingIdInfo == null || advertisingIdInfo.length != 2) {
            orGenerateOnceUniqueIdentifier = "";
        } else {
            orGenerateOnceUniqueIdentifier = !TextUtils.isEmpty(advertisingIdInfo[0]) ? advertisingIdInfo[0] : "";
            try {
                zBooleanValue = Boolean.valueOf(advertisingIdInfo[1]).booleanValue();
            } catch (Exception unused2) {
            }
        }
        if (TextUtils.isEmpty(orGenerateOnceUniqueIdentifier)) {
            orGenerateOnceUniqueIdentifier = DeviceStatus.getOrGenerateOnceUniqueIdentifier(this.mContext);
            if (!TextUtils.isEmpty(orGenerateOnceUniqueIdentifier)) {
                str = IronSourceConstants.TYPE_UUID;
            }
        } else {
            str = IronSourceConstants.TYPE_GAID;
        }
        if (!TextUtils.isEmpty(orGenerateOnceUniqueIdentifier)) {
            map.put(TokenConstants.ADVERTISING_ID, orGenerateOnceUniqueIdentifier);
            map.put("advertisingIdType", str);
            map.put("isLimitAdTrackingEnabled", Boolean.valueOf(zBooleanValue));
        }
        map.put(TokenConstants.DEVICE_OS, getDeviceOS());
        if (!TextUtils.isEmpty(getAndroidVersion())) {
            map.put("osVersion", getAndroidVersion());
        }
        String connectionType = IronSourceUtils.getConnectionType(this.mContext);
        if (!TextUtils.isEmpty(connectionType)) {
            map.put("connectionType", connectionType);
        }
        map.put(SDK_VERSION, getSDKVersion());
        String language = getLanguage();
        if (!TextUtils.isEmpty(language)) {
            map.put("language", language);
        }
        String deviceOEM = getDeviceOEM();
        if (!TextUtils.isEmpty(deviceOEM)) {
            map.put("deviceOEM", deviceOEM);
        }
        String deviceModel = getDeviceModel();
        if (!TextUtils.isEmpty(deviceModel)) {
            map.put("deviceModel", deviceModel);
        }
        String mobileCarrier = getMobileCarrier();
        if (!TextUtils.isEmpty(mobileCarrier)) {
            map.put("mobileCarrier", mobileCarrier);
        }
        map.put("internalFreeMemory", Long.valueOf(getInternalStorageFreeSize()));
        map.put("externalFreeMemory", Long.valueOf(getExternalStorageFreeSize()));
        map.put("battery", Integer.valueOf(getBatteryLevel()));
        int gmtMinutesOffset = getGmtMinutesOffset();
        if (validateGmtMinutesOffset(gmtMinutesOffset)) {
            map.put("gmtMinutesOffset", Integer.valueOf(gmtMinutesOffset));
        }
        String pluginType = getPluginType();
        if (!TextUtils.isEmpty(pluginType)) {
            map.put("pluginType", pluginType);
        }
        String pluginVersion = getPluginVersion();
        if (!TextUtils.isEmpty(pluginVersion)) {
            map.put(SDKConfigurationDM.PLUGIN_VERSION, pluginVersion);
        }
        String pluginFrameworkVersion = getPluginFrameworkVersion();
        if (!TextUtils.isEmpty(pluginFrameworkVersion)) {
            map.put("plugin_fw_v", pluginFrameworkVersion);
        }
        String strValueOf = String.valueOf(DeviceStatus.isRootedDevice());
        if (!TextUtils.isEmpty(strValueOf)) {
            map.put("jb", strValueOf);
        }
        String mediationType = getMediationType();
        if (!TextUtils.isEmpty(mediationType)) {
            map.put("mt", mediationType);
        }
        return map;
    }

    private String getPluginType() {
        try {
            return ConfigFile.getConfigFile().getPluginType();
        } catch (Exception e) {
            IronSourceLoggerManager.getLogger().logException(IronSourceLogger.IronSourceTag.NATIVE, "getPluginType()", e);
            return "";
        }
    }

    private String getPluginVersion() {
        try {
            return ConfigFile.getConfigFile().getPluginVersion();
        } catch (Exception e) {
            IronSourceLoggerManager.getLogger().logException(IronSourceLogger.IronSourceTag.NATIVE, "getPluginVersion()", e);
            return "";
        }
    }

    private String getPluginFrameworkVersion() {
        try {
            return ConfigFile.getConfigFile().getPluginFrameworkVersion();
        } catch (Exception e) {
            IronSourceLoggerManager.getLogger().logException(IronSourceLogger.IronSourceTag.NATIVE, "getPluginFrameworkVersion()", e);
            return "";
        }
    }

    private String getBundleId() {
        try {
            return this.mContext.getPackageName();
        } catch (Exception unused) {
            return "";
        }
    }

    private String getApplicationKey() {
        return IronSourceObject.getInstance().getIronSourceAppKey();
    }

    private String getAndroidVersion() {
        try {
            String str = Build.VERSION.RELEASE;
            return "" + Build.VERSION.SDK_INT + "(" + str + ")";
        } catch (Exception unused) {
            return "";
        }
    }

    private String getSDKVersion() {
        return IronSourceUtils.getSDKVersion();
    }

    private String getLanguage() {
        try {
            return Locale.getDefault().getLanguage();
        } catch (Exception unused) {
            return "";
        }
    }

    private String getDeviceOEM() {
        try {
            return Build.MANUFACTURER;
        } catch (Exception unused) {
            return "";
        }
    }

    private String getDeviceModel() {
        try {
            return Build.MODEL;
        } catch (Exception unused) {
            return "";
        }
    }

    private String getMobileCarrier() {
        try {
            TelephonyManager telephonyManager = (TelephonyManager) this.mContext.getSystemService("phone");
            if (telephonyManager == null) {
                return "";
            }
            String networkOperatorName = telephonyManager.getNetworkOperatorName();
            return !networkOperatorName.equals("") ? networkOperatorName : "";
        } catch (Exception e) {
            IronSourceLoggerManager.getLogger().logException(IronSourceLogger.IronSourceTag.NATIVE, this.TAG + ":getMobileCarrier()", e);
            return "";
        }
    }

    private boolean isExternalStorageAbvailable() {
        try {
            return Environment.getExternalStorageState().equals("mounted");
        } catch (Exception unused) {
            return false;
        }
    }

    private long getInternalStorageFreeSize() {
        try {
            StatFs statFs = new StatFs(Environment.getDataDirectory().getPath());
            return (((long) statFs.getAvailableBlocks()) * ((long) statFs.getBlockSize())) / PlaybackStateCompat.ACTION_SET_CAPTIONING_ENABLED;
        } catch (Exception unused) {
            return -1L;
        }
    }

    private long getExternalStorageFreeSize() {
        if (!isExternalStorageAbvailable()) {
            return -1L;
        }
        StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
        return (((long) statFs.getAvailableBlocks()) * ((long) statFs.getBlockSize())) / PlaybackStateCompat.ACTION_SET_CAPTIONING_ENABLED;
    }

    private int getBatteryLevel() {
        try {
            Intent intentRegisterReceiver = this.mContext.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
            int intExtra = intentRegisterReceiver != null ? intentRegisterReceiver.getIntExtra(FirebaseAnalytics.Param.LEVEL, -1) : 0;
            int intExtra2 = intentRegisterReceiver != null ? intentRegisterReceiver.getIntExtra("scale", -1) : 0;
            if (intExtra == -1 || intExtra2 == -1) {
                return -1;
            }
            return (int) ((intExtra / intExtra2) * 100.0f);
        } catch (Exception e) {
            IronSourceLoggerManager.getLogger().logException(IronSourceLogger.IronSourceTag.NATIVE, this.TAG + ":getBatteryLevel()", e);
            return -1;
        }
    }

    private int getGmtMinutesOffset() {
        try {
            TimeZone timeZone = TimeZone.getDefault();
            return Math.round(((timeZone.getOffset(GregorianCalendar.getInstance(timeZone).getTimeInMillis()) / 1000) / 60) / 15) * 15;
        } catch (Exception e) {
            IronSourceLoggerManager.getLogger().logException(IronSourceLogger.IronSourceTag.NATIVE, this.TAG + ":getGmtMinutesOffset()", e);
            return 0;
        }
    }

    private boolean validateGmtMinutesOffset(int i) {
        return i <= MAX_MINUTES_OFFSET && i >= MIN_MINUTES_OFFSET && i % 15 == 0;
    }

    private String getMediationType() {
        return IronSourceObject.getInstance().getMediationType();
    }
}
