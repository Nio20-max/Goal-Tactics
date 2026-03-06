package com.appsflyer.internal;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.PointF;
import android.os.Build;
import android.text.TextUtils;
import com.appsflyer.AFLogger;
import com.appsflyer.AppsFlyerLib;
import com.appsflyer.AppsFlyerProperties;
import com.appsflyer.FirebaseMessagingServiceListener;
import com.appsflyer.internal.an;
import com.facebook.devicerequests.internal.DeviceRequestsHelper;
import com.facebook.internal.ServerProtocol;
import com.helpshift.db.legacy_profile.tables.ProfileTable;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import kotlin.text.Typography;

/* JADX INFO: loaded from: classes.dex */
public final class cd extends cm {
    private static int onAppOpenAttribution = 0;
    private static String onAttributionFailureNative = null;
    private static char onConversionDataFail = 0;
    private static char[] onResponseErrorNative = null;
    private static int onResponseNative = 1;
    private final bv onAppOpenAttributionNative;
    private final SharedPreferences onInstallConversionDataLoadedNative;

    static void AFVersionDeclaration() {
        onResponseErrorNative = new char[]{'b', 'r', 'a', 'n', 'd', 'c', 'e', 'f', 'g'};
        onConversionDataFail = (char) 3;
    }

    static /* synthetic */ void valueOf(cd cdVar) {
        int i = onResponseNative + 47;
        onAppOpenAttribution = i % 128;
        boolean z = i % 2 != 0;
        cdVar.init();
        if (z) {
            Object obj = null;
            super.hashCode();
        }
    }

    static {
        AFVersionDeclaration();
        StringBuilder sb = new StringBuilder("https://%sregister.%s/api/v");
        sb.append(ac.values);
        onAttributionFailureNative = sb.toString();
        int i = onAppOpenAttribution + 3;
        onResponseNative = i % 128;
        if ((i % 2 == 0 ? 'D' : Typography.dollar) != '$') {
            Object obj = null;
            super.hashCode();
        }
    }

    public cd(Context context) {
        StringBuilder sb = new StringBuilder();
        sb.append(String.format(onAttributionFailureNative, AppsFlyerLib.getInstance().getHostPrefix(), ac.AFInAppEventParameterName().getHostName()));
        sb.append(context.getPackageName());
        super(null, sb.toString(), null, null, null, context);
        this.onInstallConversionDataLoadedNative = ac.AFInAppEventType(context);
        this.onAppOpenAttributionNative = ac.AFInAppEventParameterName().values(context);
    }

    public static boolean AFKeystoreWrapper(Context context) {
        if (!AppsFlyerLib.getInstance().isStopped()) {
            try {
                Class.forName("com.google.firebase.messaging.FirebaseMessagingService");
                if ((z.AFKeystoreWrapper(context, new Intent("com.google.firebase.MESSAGING_EVENT", null, context, FirebaseMessagingServiceListener.class)) ? '(' : '9') == '(') {
                    int i = onAppOpenAttribution + 81;
                    onResponseNative = i % 128;
                    int i2 = i % 2;
                    return true;
                }
            } catch (ClassNotFoundException unused) {
            } catch (Throwable th) {
                AFLogger.valueOf("An error occurred while trying to verify manifest declarations: ", th);
            }
            return false;
        }
        int i3 = onResponseNative;
        int i4 = i3 + 53;
        onAppOpenAttribution = i4 % 128;
        int i5 = i4 % 2;
        int i6 = i3 + 15;
        onAppOpenAttribution = i6 % 128;
        int i7 = i6 % 2;
        return false;
    }

    public static boolean AFInAppEventType(SharedPreferences sharedPreferences) {
        int i = onAppOpenAttribution + 9;
        onResponseNative = i % 128;
        if (i % 2 == 0) {
        }
        return sharedPreferences.getBoolean("sentRegisterRequestToAF", false);
    }

    public final void AFInAppEventParameterName(String str) {
        if (str != null) {
            AFLogger.values("Firebase Refreshed Token = ".concat(String.valueOf(str)));
            am amVarOnInstallConversionDataLoadedNative = onInstallConversionDataLoadedNative();
            if (amVarOnInstallConversionDataLoadedNative == null || !str.equals(amVarOnInstallConversionDataLoadedNative.AFInAppEventType)) {
                long jCurrentTimeMillis = System.currentTimeMillis();
                boolean z = ac.AFInAppEventType(this.onInstallConversionDataLoadedNative) && (amVarOnInstallConversionDataLoadedNative == null || jCurrentTimeMillis - amVarOnInstallConversionDataLoadedNative.AFKeystoreWrapper > TimeUnit.SECONDS.toMillis(2L));
                values(new am(str, jCurrentTimeMillis, !z));
                if (z) {
                    AFKeystoreWrapper(str);
                }
            }
        }
    }

    public final void AFKeystoreWrapper() {
        am amVarOnInstallConversionDataLoadedNative = onInstallConversionDataLoadedNative();
        Object obj = null;
        if (amVarOnInstallConversionDataLoadedNative != null) {
            int i = onAppOpenAttribution + 83;
            onResponseNative = i % 128;
            int i2 = i % 2;
            if (amVarOnInstallConversionDataLoadedNative.values()) {
                int i3 = onAppOpenAttribution + 15;
                onResponseNative = i3 % 128;
                if (i3 % 2 == 0) {
                    String str = amVarOnInstallConversionDataLoadedNative.AFInAppEventType;
                    AFLogger.AFInAppEventParameterName("Resending Uninstall token to AF servers: ".concat(String.valueOf(str)));
                    AFKeystoreWrapper(str);
                    super.hashCode();
                } else {
                    String str2 = amVarOnInstallConversionDataLoadedNative.AFInAppEventType;
                    AFLogger.AFInAppEventParameterName("Resending Uninstall token to AF servers: ".concat(String.valueOf(str2)));
                    AFKeystoreWrapper(str2);
                }
            }
        }
        int i4 = onResponseNative + 79;
        onAppOpenAttribution = i4 % 128;
        if ((i4 % 2 != 0 ? (char) 26 : 'P') != 26) {
            return;
        }
        super.hashCode();
    }

    private void init() {
        int i = onAppOpenAttribution + 89;
        onResponseNative = i % 128;
        if (i % 2 != 0) {
            this.onAppOpenAttributionNative.AFInAppEventType("sentRegisterRequestToAF", true);
        } else {
            this.onAppOpenAttributionNative.AFInAppEventType("sentRegisterRequestToAF", false);
        }
        AFLogger.AFInAppEventParameterName("Successfully registered for Uninstall Tracking");
        int i2 = onAppOpenAttribution + 79;
        onResponseNative = i2 % 128;
        int i3 = i2 % 2;
    }

    private am onInstallConversionDataLoadedNative() {
        String string;
        String string2;
        Object obj = null;
        String string3 = this.onInstallConversionDataLoadedNative.getString("afUninstallToken", null);
        long j = this.onInstallConversionDataLoadedNative.getLong("afUninstallToken_received_time", 0L);
        boolean z = this.onInstallConversionDataLoadedNative.getBoolean("afUninstallToken_queued", false);
        this.onAppOpenAttributionNative.AFInAppEventType("afUninstallToken_queued", false);
        if (string3 == null && (string2 = AppsFlyerProperties.getInstance().getString("afUninstallToken")) != null) {
            String[] strArrSplit = string2.split(",");
            string3 = strArrSplit[strArrSplit.length - 1];
        }
        if ((j == 0) && (string = AppsFlyerProperties.getInstance().getString("afUninstallToken")) != null) {
            int i = onResponseNative + 125;
            onAppOpenAttribution = i % 128;
            int i2 = i % 2;
            String[] strArrSplit2 = string.split(",");
            if (strArrSplit2.length >= 2) {
                int i3 = onAppOpenAttribution + 81;
                onResponseNative = i3 % 128;
                int i4 = i3 % 2;
                try {
                    j = Long.parseLong(strArrSplit2[strArrSplit2.length - 2]);
                } catch (NumberFormatException unused) {
                }
            }
        }
        if (string3 == null) {
            return null;
        }
        am amVar = new am(string3, j, z);
        int i5 = onAppOpenAttribution + 35;
        onResponseNative = i5 % 128;
        if (i5 % 2 != 0) {
            return amVar;
        }
        super.hashCode();
        return amVar;
    }

    private void values(am amVar) {
        int i = onResponseNative + 115;
        onAppOpenAttribution = i % 128;
        int i2 = i % 2;
        this.onInstallConversionDataLoadedNative.edit().putString("afUninstallToken", amVar.AFInAppEventType).putLong("afUninstallToken_received_time", amVar.AFKeystoreWrapper).putBoolean("afUninstallToken_queued", amVar.values()).apply();
        int i3 = onAppOpenAttribution + 63;
        onResponseNative = i3 % 128;
        if (i3 % 2 == 0) {
            Object[] objArr = null;
            int length = objArr.length;
        }
    }

    private void AFKeystoreWrapper(String str) {
        int i = onAppOpenAttribution + 101;
        onResponseNative = i % 128;
        int i2 = i % 2;
        Application application = this.AFKeystoreWrapper;
        final ac acVarAFInAppEventParameterName = ac.AFInAppEventParameterName();
        if (acVarAFInAppEventParameterName.AFKeystoreWrapper()) {
            AFLogger.values("CustomerUserId not set, Tracking is disabled", true);
            return;
        }
        String devKey = AppsFlyerProperties.getInstance().getDevKey();
        if ((devKey == null ? '\b' : ')') != ')') {
            AFLogger.AppsFlyer2dXConversionCallback("[registerUninstall] AppsFlyer's SDK cannot send any event without providing DevKey.");
            return;
        }
        PackageManager packageManager = application.getPackageManager();
        try {
            PackageInfo packageInfo = packageManager.getPackageInfo(application.getPackageName(), 0);
            this.AFInAppEventType.put("app_version_code", Integer.toString(packageInfo.versionCode));
            this.AFInAppEventType.put("app_version_name", packageInfo.versionName);
            this.AFInAppEventType.put("app_name", packageManager.getApplicationLabel(packageInfo.applicationInfo).toString());
            this.AFInAppEventType.put("installDate", ac.valueOf(new SimpleDateFormat("yyyy-MM-dd_HHmmssZ", Locale.US), packageInfo.firstInstallTime));
        } catch (Throwable th) {
            AFLogger.valueOf("Exception while collecting application version info.", th);
        }
        ac.AFInAppEventType(application, (Map<String, ? super String>) this.AFInAppEventType);
        String strAFInAppEventType = ac.AFInAppEventType();
        if (strAFInAppEventType != null) {
            this.AFInAppEventType.put("appUserId", strAFInAppEventType);
        }
        try {
            this.AFInAppEventType.put(DeviceRequestsHelper.DEVICE_INFO_MODEL, Build.MODEL);
            this.AFInAppEventType.put(AFKeystoreWrapper((PointF.length(0.0f, 0.0f) > 0.0f ? 1 : (PointF.length(0.0f, 0.0f) == 0.0f ? 0 : -1)) + 5, (byte) (95 - TextUtils.lastIndexOf("", '0')), "\u0001\u0002\u0000\u0005Ä").intern(), Build.BRAND);
        } catch (Throwable th2) {
            AFLogger.valueOf("Exception while collecting device brand and model.", th2);
        }
        if (!(!AppsFlyerProperties.getInstance().getBoolean(AppsFlyerProperties.DEVICE_TRACKING_DISABLED, false))) {
            int i3 = onResponseNative + 77;
            onAppOpenAttribution = i3 % 128;
            if (i3 % 2 != 0) {
                this.AFInAppEventType.put(AppsFlyerProperties.DEVICE_TRACKING_DISABLED, ServerProtocol.DIALOG_RETURN_SCOPES_TRUE);
                int i4 = 93 / 0;
            } else {
                this.AFInAppEventType.put(AppsFlyerProperties.DEVICE_TRACKING_DISABLED, ServerProtocol.DIALOG_RETURN_SCOPES_TRUE);
            }
        }
        g gVarAFInAppEventType = ab.AFInAppEventType(application.getContentResolver());
        if ((gVarAFInAppEventType != null ? '[' : 'Y') == '[') {
            this.AFInAppEventType.put("amazon_aid", gVarAFInAppEventType.values);
            this.AFInAppEventType.put("amazon_aid_limit", String.valueOf(gVarAFInAppEventType.AFKeystoreWrapper));
        }
        String string = AppsFlyerProperties.getInstance().getString("advertiserId");
        if (!(string == null)) {
            int i5 = onAppOpenAttribution + 1;
            onResponseNative = i5 % 128;
            if (i5 % 2 == 0) {
                this.AFInAppEventType.put("advertiserId", string);
                int i6 = 55 / 0;
            } else {
                this.AFInAppEventType.put("advertiserId", string);
            }
        }
        this.AFInAppEventType.put("devkey", devKey);
        this.AFInAppEventType.put(ProfileTable.Columns.COLUMN_UID, af.valueOf(new WeakReference(application)));
        this.AFInAppEventType.put("af_gcm_token", str);
        this.AFInAppEventType.put("launch_counter", Integer.toString(acVarAFInAppEventParameterName.valueOf(this.onInstallConversionDataLoadedNative, false)));
        this.AFInAppEventType.put(ServerProtocol.DIALOG_PARAM_SDK_VERSION, Integer.toString(Build.VERSION.SDK_INT));
        String strAFInAppEventParameterName = acVarAFInAppEventParameterName.AFInAppEventParameterName(application);
        if ((strAFInAppEventParameterName != null ? '?' : (char) 27) != 27) {
            this.AFInAppEventType.put(AppsFlyerProperties.CHANNEL, strAFInAppEventParameterName);
        }
        new Thread(new Runnable() { // from class: com.appsflyer.internal.cd.3
            @Override // java.lang.Runnable
            public final void run() {
                try {
                    cd cdVar = cd.this;
                    cdVar.onConversionDataSuccess = acVarAFInAppEventParameterName.isStopped();
                    HttpURLConnection httpURLConnectionValues = new an.c(cdVar).values();
                    if (httpURLConnectionValues != null) {
                        if (httpURLConnectionValues.getResponseCode() == 200) {
                            cd.valueOf(cd.this);
                        }
                        httpURLConnectionValues.disconnect();
                    }
                } catch (Throwable th3) {
                    AFLogger.valueOf(th3.getMessage(), th3);
                }
            }
        }).start();
    }

    private static String AFKeystoreWrapper(int i, byte b, String str) {
        String str2;
        Object charArray = str;
        if (str != null) {
            charArray = str.toCharArray();
        }
        char[] cArr = (char[]) charArray;
        synchronized (Cdo.AFVersionDeclaration) {
            char[] cArr2 = onResponseErrorNative;
            char c = onConversionDataFail;
            char[] cArr3 = new char[i];
            if (i % 2 != 0) {
                i--;
                cArr3[i] = (char) (cArr[i] - b);
            }
            if (i > 1) {
                Cdo.values = 0;
                while (Cdo.values < i) {
                    Cdo.AFInAppEventType = cArr[Cdo.values];
                    Cdo.valueOf = cArr[Cdo.values + 1];
                    if (Cdo.AFInAppEventType == Cdo.valueOf) {
                        cArr3[Cdo.values] = (char) (Cdo.AFInAppEventType - b);
                        cArr3[Cdo.values + 1] = (char) (Cdo.valueOf - b);
                    } else {
                        Cdo.AFKeystoreWrapper = Cdo.AFInAppEventType / c;
                        Cdo.init = Cdo.AFInAppEventType % c;
                        Cdo.AFInAppEventParameterName = Cdo.valueOf / c;
                        Cdo.getLevel = Cdo.valueOf % c;
                        if (Cdo.init == Cdo.getLevel) {
                            Cdo.AFKeystoreWrapper = ((Cdo.AFKeystoreWrapper + c) - 1) % c;
                            Cdo.AFInAppEventParameterName = ((Cdo.AFInAppEventParameterName + c) - 1) % c;
                            int i2 = (Cdo.AFKeystoreWrapper * c) + Cdo.init;
                            int i3 = (Cdo.AFInAppEventParameterName * c) + Cdo.getLevel;
                            cArr3[Cdo.values] = cArr2[i2];
                            cArr3[Cdo.values + 1] = cArr2[i3];
                        } else if (Cdo.AFKeystoreWrapper == Cdo.AFInAppEventParameterName) {
                            Cdo.init = ((Cdo.init + c) - 1) % c;
                            Cdo.getLevel = ((Cdo.getLevel + c) - 1) % c;
                            int i4 = (Cdo.AFKeystoreWrapper * c) + Cdo.init;
                            int i5 = (Cdo.AFInAppEventParameterName * c) + Cdo.getLevel;
                            cArr3[Cdo.values] = cArr2[i4];
                            cArr3[Cdo.values + 1] = cArr2[i5];
                        } else {
                            int i6 = (Cdo.AFKeystoreWrapper * c) + Cdo.getLevel;
                            int i7 = (Cdo.AFInAppEventParameterName * c) + Cdo.init;
                            cArr3[Cdo.values] = cArr2[i6];
                            cArr3[Cdo.values + 1] = cArr2[i7];
                        }
                    }
                    Cdo.values += 2;
                }
            }
            str2 = new String(cArr3);
        }
        return str2;
    }
}
