package com.helpshift.common.platform;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.text.format.DateFormat;
import android.util.DisplayMetrics;
import com.facebook.internal.AnalyticsEvents;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.helpshift.common.dao.BackupDAO;
import com.helpshift.common.domain.network.NetworkConstants;
import com.helpshift.common.platform.Device;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.meta.dto.DeviceDiskSpaceDTO;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.PermissionUtil;
import com.helpshift.util.StringUtils;
import com.ironsource.sdk.constants.Constants;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;
import java.util.UUID;

/* JADX INFO: loaded from: classes2.dex */
public class AndroidDevice implements Device {
    public static final String KEY_DEVICE_ID = "key_support_device_id";
    private static final String KEY_PUSH_TOKEN = "key_push_token";
    private BackupDAO backupDAO;
    private String cacheDeviceId;
    private String cachedPushToken;
    private final Context context;
    private KVStore kvStore;

    @Override // com.helpshift.common.platform.Device
    public String getApiVersion() {
        return NetworkConstants.apiVersion;
    }

    @Override // com.helpshift.common.platform.Device
    public String getPlatformName() {
        return Constants.JAVASCRIPT_INTERFACE_NAME;
    }

    @Override // com.helpshift.common.platform.Device
    public String getSDKVersion() {
        return "7.11.1";
    }

    AndroidDevice(Context context, KVStore kVStore, BackupDAO backupDAO) {
        this.context = context;
        this.kvStore = kVStore;
        this.backupDAO = backupDAO;
    }

    @Override // com.helpshift.common.platform.Device
    public String getOSVersion() {
        return Build.VERSION.RELEASE;
    }

    @Override // com.helpshift.common.platform.Device
    public int getOSVersionNumber() {
        return Build.VERSION.SDK_INT;
    }

    @Override // com.helpshift.common.platform.Device
    public String getAppVersion() {
        return ApplicationUtil.getApplicationVersion(this.context);
    }

    @Override // com.helpshift.common.platform.Device
    public String getAppName() {
        return ApplicationUtil.getApplicationName(this.context);
    }

    @Override // com.helpshift.common.platform.Device
    public String getAppIdentifier() {
        return this.context.getPackageName();
    }

    @Override // com.helpshift.common.platform.Device
    public String getLanguage() {
        return Locale.getDefault().toString();
    }

    @Override // com.helpshift.common.platform.Device
    public String getDeviceModel() {
        return Build.MODEL;
    }

    @Override // com.helpshift.common.platform.Device
    public String getRom() {
        return System.getProperty("os.version") + ":" + Build.FINGERPRINT;
    }

    @Override // com.helpshift.common.platform.Device
    public String getSimCountryIso() {
        TelephonyManager telephonyManager = (TelephonyManager) this.context.getSystemService("phone");
        return telephonyManager == null ? "" : telephonyManager.getSimCountryIso();
    }

    @Override // com.helpshift.common.platform.Device
    public String getTimeStamp() {
        return new SimpleDateFormat(HSDateFormatSpec.STORAGE_TIME_PATTERN, Locale.ENGLISH).format(new Date());
    }

    @Override // com.helpshift.common.platform.Device
    public String getCarrierName() {
        TelephonyManager telephonyManager = (TelephonyManager) this.context.getSystemService("phone");
        return telephonyManager == null ? "" : telephonyManager.getNetworkOperatorName();
    }

    @Override // com.helpshift.common.platform.Device
    public String getNetworkType() {
        NetworkInfo activeNetworkInfo;
        String typeName = null;
        try {
            ConnectivityManager connectivityManager = (ConnectivityManager) this.context.getSystemService("connectivity");
            if (connectivityManager != null && (activeNetworkInfo = connectivityManager.getActiveNetworkInfo()) != null) {
                typeName = activeNetworkInfo.getTypeName();
            }
        } catch (SecurityException unused) {
        }
        return typeName == null ? AnalyticsEvents.PARAMETER_DIALOG_OUTCOME_VALUE_UNKNOWN : typeName;
    }

    @Override // com.helpshift.common.platform.Device
    public String getBatteryStatus() {
        Intent intentRegisterReceiver = this.context.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        if (intentRegisterReceiver == null) {
            return "Not charging";
        }
        int intExtra = intentRegisterReceiver.getIntExtra("status", -1);
        return intExtra == 2 || intExtra == 5 ? "Charging" : "Not charging";
    }

    @Override // com.helpshift.common.platform.Device
    public String getBatteryLevel() {
        if (this.context.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED")) == null) {
            return "";
        }
        return ((int) ((r0.getIntExtra(FirebaseAnalytics.Param.LEVEL, -1) / r0.getIntExtra("scale", -1)) * 100.0f)) + "%";
    }

    @Override // com.helpshift.common.platform.Device
    public DeviceDiskSpaceDTO getDiskSpace() {
        double dRound;
        long jRound;
        StatFs statFs = new StatFs(Environment.getDataDirectory().getPath());
        if (Build.VERSION.SDK_INT >= 18) {
            dRound = Math.round(((statFs.getAvailableBlocksLong() * statFs.getBlockSizeLong()) / 1.073741824E9d) * 100.0d) / 100.0d;
            jRound = Math.round(((statFs.getBlockCountLong() * statFs.getBlockSizeLong()) / 1.073741824E9d) * 100.0d);
        } else {
            dRound = Math.round(((((double) statFs.getAvailableBlocks()) * ((double) statFs.getBlockSize())) / 1.073741824E9d) * 100.0d) / 100.0d;
            jRound = Math.round(((((double) statFs.getBlockCount()) * ((double) statFs.getBlockSize())) / 1.073741824E9d) * 100.0d);
        }
        return new DeviceDiskSpaceDTO((jRound / 100.0d) + " GB", dRound + " GB", null, null);
    }

    /* JADX INFO: renamed from: com.helpshift.common.platform.AndroidDevice$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$common$platform$Device$PermissionType;

        static {
            int[] iArr = new int[Device.PermissionType.values().length];
            $SwitchMap$com$helpshift$common$platform$Device$PermissionType = iArr;
            try {
                iArr[Device.PermissionType.READ_STORAGE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$common$platform$Device$PermissionType[Device.PermissionType.WRITE_STORAGE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }

    @Override // com.helpshift.common.platform.Device
    public Device.PermissionState checkPermission(Device.PermissionType permissionType) {
        int i = AnonymousClass1.$SwitchMap$com$helpshift$common$platform$Device$PermissionType[permissionType.ordinal()];
        if (i == 1) {
            return checkStoragePermissions("android.permission.READ_EXTERNAL_STORAGE");
        }
        if (i != 2) {
            return null;
        }
        return checkStoragePermissions("android.permission.WRITE_EXTERNAL_STORAGE");
    }

    @Override // com.helpshift.common.platform.Device
    public Locale getLocale() {
        Configuration configuration = this.context.getResources().getConfiguration();
        if (Build.VERSION.SDK_INT >= 24) {
            return configuration.getLocales().get(0);
        }
        return configuration.locale;
    }

    @Override // com.helpshift.common.platform.Device
    public void changeLocale(Locale locale) {
        Resources resources = this.context.getResources();
        DisplayMetrics displayMetrics = resources.getDisplayMetrics();
        Configuration configuration = resources.getConfiguration();
        configuration.locale = locale;
        resources.updateConfiguration(configuration, displayMetrics);
    }

    @Override // com.helpshift.common.platform.Device
    public boolean is24HourFormat() {
        return DateFormat.is24HourFormat(this.context);
    }

    @Override // com.helpshift.common.platform.Device
    public String getTimeZoneId() {
        return TimeZone.getDefault().getID();
    }

    @Override // com.helpshift.common.platform.Device
    public long getTimeZoneOffSet() {
        TimeZone timeZone = new GregorianCalendar().getTimeZone();
        return timeZone.getRawOffset() + timeZone.getDSTSavings();
    }

    @Override // com.helpshift.common.platform.Device
    public String getDeviceId() {
        String str = this.cacheDeviceId;
        if (str != null) {
            return str;
        }
        String string = this.kvStore.getString(KEY_DEVICE_ID);
        this.cacheDeviceId = string;
        if (StringUtils.isEmpty(string)) {
            String str2 = (String) this.backupDAO.getValue(KEY_DEVICE_ID);
            this.cacheDeviceId = str2;
            if (!StringUtils.isEmpty(str2)) {
                this.kvStore.setString(KEY_DEVICE_ID, this.cacheDeviceId);
            }
        } else {
            this.backupDAO.storeValue(KEY_DEVICE_ID, this.cacheDeviceId);
        }
        if (StringUtils.isEmpty(this.cacheDeviceId)) {
            String string2 = UUID.randomUUID().toString();
            this.cacheDeviceId = string2;
            this.kvStore.setString(KEY_DEVICE_ID, string2);
            this.backupDAO.storeValue(KEY_DEVICE_ID, this.cacheDeviceId);
        }
        return this.cacheDeviceId;
    }

    @Override // com.helpshift.common.platform.Device
    public String getPushToken() {
        if (this.cachedPushToken == null) {
            this.cachedPushToken = this.kvStore.getString(KEY_PUSH_TOKEN);
        }
        return this.cachedPushToken;
    }

    @Override // com.helpshift.common.platform.Device
    public void setPushToken(String str) {
        this.kvStore.setString(KEY_PUSH_TOKEN, str);
        this.cachedPushToken = str;
    }

    @Override // com.helpshift.common.platform.Device
    public String getAndroidId() {
        try {
            return Settings.Secure.getString(this.context.getContentResolver(), "android_id");
        } catch (Exception e) {
            HSLogger.e("AndroidDevice", "Exception while getting android_id", e);
            return null;
        }
    }

    void updateDeviceIdInBackupDAO() {
        String string = this.kvStore.getString(KEY_DEVICE_ID);
        if (StringUtils.isEmpty(string)) {
            return;
        }
        this.backupDAO.storeValue(KEY_DEVICE_ID, string);
    }

    private Device.PermissionState checkStoragePermissions(String str) {
        int oSVersionNumber = getOSVersionNumber();
        if (oSVersionNumber < 19) {
            return Device.PermissionState.AVAILABLE;
        }
        if (ApplicationUtil.isPermissionGranted(this.context, str)) {
            return Device.PermissionState.AVAILABLE;
        }
        if (oSVersionNumber < 23) {
            return Device.PermissionState.UNAVAILABLE;
        }
        if (PermissionUtil.hasPermissionInManifest(this.context, str)) {
            return Device.PermissionState.REQUESTABLE;
        }
        return Device.PermissionState.UNAVAILABLE;
    }
}
