package com.appsflyer.internal;

import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.PointF;
import android.net.TrafficStats;
import android.os.Build;
import android.os.Process;
import android.text.TextUtils;
import android.view.ViewConfiguration;
import androidx.core.internal.view.SupportMenu;
import com.appsflyer.AFLogger;
import com.appsflyer.AppsFlyerProperties;
import com.facebook.devicerequests.internal.DeviceRequestsHelper;
import com.facebook.internal.ServerProtocol;
import com.helpshift.common.domain.network.NetworkConstants;
import com.helpshift.util.AttachmentConstants;
import com.ironsource.sdk.constants.Events;
import com.ironsource.sdk.precache.DownloadManager;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.net.ssl.HttpsURLConnection;
import org.json.JSONException;

/* JADX INFO: loaded from: classes.dex */
public abstract class an implements Runnable {
    protected static String AFInAppEventType = null;
    private static String AFKeystoreWrapper = null;
    private static int AFLogger$LogLevel = 0;
    private static long init = 0;
    private static char onAppOpenAttributionNative = 0;
    private static int onAttributionFailureNative = 1;
    private static int onInstallConversionDataLoadedNative;
    public String AFInAppEventParameterName;
    private final Context getLevel;
    public final String valueOf;
    private final ac values;
    public final String AppsFlyer2dXConversionCallback = UUID.randomUUID().toString();
    public final Map<String, Object> AFVersionDeclaration = AFInAppEventParameterName();

    static void AFKeystoreWrapper() {
        init = 5852232774877074978L;
        onAppOpenAttributionNative = (char) 0;
        AFLogger$LogLevel = 0;
    }

    protected abstract void AFInAppEventParameterName(HttpsURLConnection httpsURLConnection) throws JSONException, IOException;

    protected abstract void valueOf();

    protected abstract void valueOf(String str);

    protected abstract String values();

    static {
        AFKeystoreWrapper();
        AFKeystoreWrapper = "v2";
        StringBuilder sb = new StringBuilder("https://%sonelink.%s/shortlink-sdk/");
        sb.append(AFKeystoreWrapper);
        AFInAppEventType = sb.toString();
        int i = onAttributionFailureNative + 25;
        onInstallConversionDataLoadedNative = i % 128;
        int i2 = i % 2;
    }

    public an(ac acVar, Context context, String str) {
        this.values = acVar;
        this.getLevel = context;
        this.valueOf = str;
    }

    @Override // java.lang.Runnable
    public void run() {
        int i = onAttributionFailureNative + 23;
        onInstallConversionDataLoadedNative = i % 128;
        char c2 = i % 2 != 0 ? '4' : '\n';
        AFInAppEventType();
        if (c2 != '\n') {
            int i2 = 65 / 0;
        }
        int i3 = onAttributionFailureNative + 125;
        onInstallConversionDataLoadedNative = i3 % 128;
        if (i3 % 2 != 0) {
            Object obj = null;
            super.hashCode();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void AFInAppEventType() {
        String strAFInAppEventParameterName;
        Throwable th;
        int responseCode;
        String string = "";
        String strValues = values();
        AFLogger.AFKeystoreWrapper("oneLinkUrl: ".concat(String.valueOf(strValues)));
        try {
            HttpsURLConnection httpsURLConnection = (HttpsURLConnection) new URL(strValues).openConnection();
            httpsURLConnection.setRequestProperty("content-type", Events.APP_JSON);
            httpsURLConnection.setReadTimeout(3000);
            httpsURLConnection.setConnectTimeout(3000);
            httpsURLConnection.setRequestMethod(this.valueOf);
            AFInAppEventParameterName(httpsURLConnection);
            responseCode = httpsURLConnection.getResponseCode();
            strAFInAppEventParameterName = ac.AFInAppEventParameterName(httpsURLConnection);
        } catch (Throwable th2) {
            strAFInAppEventParameterName = "";
            th = th2;
        }
        try {
            if ((responseCode == 200 ? 'Q' : 'K') == 'K') {
                StringBuilder sb = new StringBuilder("Response code = ");
                sb.append(responseCode);
                sb.append(" content = ");
                sb.append(strAFInAppEventParameterName);
                string = sb.toString();
                strValues = strValues;
            } else {
                int i = onAttributionFailureNative + 43;
                onInstallConversionDataLoadedNative = i % 128;
                if (i % 2 != 0) {
                    AFLogger.values("Status 200 ok");
                    Object[] objArr = null;
                    strValues = objArr.length;
                } else {
                    AFLogger.values("Status 200 ok");
                    strValues = strValues;
                }
            }
        } catch (Throwable th3) {
            th = th3;
            AFLogger.valueOf("Error while calling ".concat(String.valueOf(strValues)), th);
            StringBuilder sb2 = new StringBuilder("Error while calling ");
            sb2.append(strValues);
            sb2.append(" stacktrace: ");
            sb2.append(th.toString());
            string = sb2.toString();
        }
        if ((TextUtils.isEmpty(string) ? (char) 4 : (char) 26) == 26) {
            AFLogger.AppsFlyer2dXConversionCallback("Connection error: ".concat(String.valueOf(string)));
            valueOf();
            return;
        }
        int i2 = onAttributionFailureNative + 77;
        onInstallConversionDataLoadedNative = i2 % 128;
        int i3 = i2 % 2;
        AFLogger.values("Connection call succeeded: ".concat(String.valueOf(strAFInAppEventParameterName)));
        valueOf(strAFInAppEventParameterName);
    }

    public static class c implements Runnable {
        private final cm AFKeystoreWrapper;

        public c() {
        }

        public c(cm cmVar) {
            this.AFKeystoreWrapper = cmVar;
        }

        public HttpURLConnection values() {
            HttpURLConnection httpURLConnection;
            URL url;
            int responseCode;
            String strAFInAppEventParameterName = "";
            String str = this.AFKeystoreWrapper.onDeepLinkingNative;
            String string = n.AFInAppEventType(this.AFKeystoreWrapper.values()).toString();
            boolean zAFLogger$LogLevel = this.AFKeystoreWrapper.AFLogger$LogLevel();
            boolean zAppsFlyer2dXConversionCallback = this.AFKeystoreWrapper.AppsFlyer2dXConversionCallback();
            boolean level = this.AFKeystoreWrapper.getLevel();
            boolean zAFInAppEventType = this.AFKeystoreWrapper.AFInAppEventType();
            byte[] bytes = string.getBytes();
            HttpURLConnection httpURLConnection2 = null;
            if (zAFLogger$LogLevel) {
                return null;
            }
            boolean z = false;
            try {
                url = new URL(str);
                if (level) {
                    ak.AFInAppEventType().AFInAppEventType(url.toString(), string);
                    int length = string.getBytes(DownloadManager.UTF8_CHARSET).length;
                    StringBuilder sb = new StringBuilder("call = ");
                    sb.append(url);
                    sb.append("; size = ");
                    sb.append(length);
                    sb.append(" byte");
                    sb.append(length > 1 ? "s" : "");
                    sb.append("; body = ");
                    sb.append(string);
                    ai.AFKeystoreWrapper(sb.toString());
                }
                TrafficStats.setThreadStatsTag("AppsFlyer".hashCode());
                httpURLConnection = (HttpURLConnection) url.openConnection();
            } catch (Throwable th) {
                th = th;
            }
            try {
                httpURLConnection.setReadTimeout(NetworkConstants.UPLOAD_CONNECT_TIMEOUT);
                httpURLConnection.setConnectTimeout(NetworkConstants.UPLOAD_CONNECT_TIMEOUT);
                httpURLConnection.setRequestMethod("POST");
                httpURLConnection.setDoInput(true);
                httpURLConnection.setDoOutput(true);
                httpURLConnection.setRequestProperty("Content-Type", zAFInAppEventType ? AttachmentConstants.UNKNOWN_FILE_MIME : Events.APP_JSON);
                OutputStream outputStream = httpURLConnection.getOutputStream();
                if (zAFInAppEventType) {
                    try {
                        try {
                            bytes = (byte[]) ((Class) e.AFInAppEventParameterName(24 - (ViewConfiguration.getTapTimeout() >> 16), 23 - Process.getGidForName(""), (char) (ViewConfiguration.getPressedStateDuration() >> 16))).getDeclaredMethod("values", byte[].class).invoke(((Class) e.AFInAppEventParameterName((ViewConfiguration.getKeyRepeatDelay() >> 16) + 24, (ViewConfiguration.getScrollDefaultDelay() >> 16) + 24, (char) (PointF.length(0.0f, 0.0f) > 0.0f ? 1 : (PointF.length(0.0f, 0.0f) == 0.0f ? 0 : -1)))).getMethod("AFInAppEventParameterName", String.class).invoke(null, this.AFKeystoreWrapper.AFVersionDeclaration), bytes);
                        } catch (Throwable th2) {
                            Throwable cause = th2.getCause();
                            if (cause != null) {
                                throw cause;
                            }
                            throw th2;
                        }
                    } catch (Throwable th3) {
                        Throwable cause2 = th3.getCause();
                        if (cause2 != null) {
                            throw cause2;
                        }
                        throw th3;
                    }
                }
                outputStream.write(bytes);
                outputStream.close();
                httpURLConnection.connect();
                responseCode = httpURLConnection.getResponseCode();
                if (zAppsFlyer2dXConversionCallback) {
                    ac.AFInAppEventParameterName();
                    strAFInAppEventParameterName = ac.AFInAppEventParameterName(httpURLConnection);
                }
                if (level) {
                    ak.AFInAppEventType().values(url.toString(), responseCode, strAFInAppEventParameterName);
                }
            } catch (Throwable th4) {
                th = th4;
                httpURLConnection2 = httpURLConnection;
                AFLogger.valueOf("Error while calling ".concat(String.valueOf(str)), th);
                httpURLConnection = httpURLConnection2;
            }
            if (responseCode == 200) {
                AFLogger.values("Status 200 ok");
            } else {
                z = true;
            }
            StringBuilder sb2 = new StringBuilder("Connection ");
            sb2.append(z ? "error" : "call succeeded");
            sb2.append(": ");
            sb2.append(strAFInAppEventParameterName);
            AFLogger.values(sb2.toString());
            return httpURLConnection;
        }

        @Override // java.lang.Runnable
        public void run() {
            HttpURLConnection httpURLConnectionValues = values();
            if (httpURLConnectionValues != null) {
                httpURLConnectionValues.disconnect();
            }
        }
    }

    protected final void AFKeystoreWrapper(HttpsURLConnection httpsURLConnection, String... strArr) {
        ArrayList arrayList = new ArrayList(Arrays.asList(strArr));
        arrayList.add(1, AFKeystoreWrapper);
        String strAFInAppEventParameterName = ag.AFInAppEventParameterName((String[]) arrayList.toArray(new String[0]));
        StringBuilder sb = new StringBuilder();
        sb.append(AppsFlyerProperties.getInstance().getDevKey());
        sb.append(this.AppsFlyer2dXConversionCallback);
        sb.append(AFKeystoreWrapper);
        httpsURLConnection.setRequestProperty(AFKeystoreWrapper("ዺ力\ufffb쬣\ua83bጵ삸瑃뜂ᣫ\ud9f4\uef35", "뾎숵\udf77⒗", "嘢쥲亳儷", (-1) - TextUtils.indexOf((CharSequence) "", '0', 0), (char) ((-1) - TextUtils.lastIndexOf("", '0', 0, 0))).intern(), ag.valueOf(strAFInAppEventParameterName, sb.toString()));
        int i = onInstallConversionDataLoadedNative + 41;
        onAttributionFailureNative = i % 128;
        int i2 = i % 2;
    }

    private Map<String, Object> AFInAppEventParameterName() {
        HashMap map = new HashMap();
        map.put("build_number", "6.5.4");
        map.put("counter", Integer.valueOf(this.values.valueOf(ac.AFInAppEventType(this.getLevel), false)));
        map.put(DeviceRequestsHelper.DEVICE_INFO_MODEL, Build.MODEL);
        map.put(AFKeystoreWrapper("粞Რ䥕穷작", "\ue724\uecbcẨ⋾", "嘢쥲亳儷", (-1460880153) - TextUtils.indexOf("", ""), (char) ((ViewConfiguration.getWindowTouchSlop() >> 8) + 65054)).intern(), Build.BRAND);
        map.put(ServerProtocol.DIALOG_PARAM_SDK_VERSION, Integer.toString(Build.VERSION.SDK_INT));
        try {
            map.put("app_version_name", this.getLevel.getPackageManager().getPackageInfo(this.getLevel.getPackageName(), 0).versionName);
            int i = onInstallConversionDataLoadedNative + 95;
            onAttributionFailureNative = i % 128;
            int i2 = i % 2;
        } catch (PackageManager.NameNotFoundException unused) {
        }
        map.put("app_id", this.getLevel.getPackageName());
        map.put("platformextension", new al().AFInAppEventType());
        int i3 = onAttributionFailureNative + 69;
        onInstallConversionDataLoadedNative = i3 % 128;
        int i4 = i3 % 2;
        return map;
    }

    private static String AFKeystoreWrapper(String str, String str2, String str3, int i, char c2) {
        String str4;
        Object charArray = str3;
        if (str3 != null) {
            charArray = str3.toCharArray();
        }
        char[] cArr = (char[]) charArray;
        Object charArray2 = str2;
        if (str2 != null) {
            charArray2 = str2.toCharArray();
        }
        char[] cArr2 = (char[]) charArray2;
        Object charArray3 = str;
        if (str != null) {
            charArray3 = str.toCharArray();
        }
        char[] cArr3 = (char[]) charArray3;
        synchronized (dp.valueOf) {
            char[] cArr4 = (char[]) cArr2.clone();
            char[] cArr5 = (char[]) cArr.clone();
            cArr4[0] = (char) (c2 ^ cArr4[0]);
            cArr5[2] = (char) (cArr5[2] + ((char) i));
            int length = cArr3.length;
            char[] cArr6 = new char[length];
            dp.AFInAppEventParameterName = 0;
            while (dp.AFInAppEventParameterName < length) {
                int i2 = (dp.AFInAppEventParameterName + 2) % 4;
                int i3 = (dp.AFInAppEventParameterName + 3) % 4;
                dp.AFInAppEventType = (char) (((cArr4[dp.AFInAppEventParameterName % 4] * 32718) + cArr5[i2]) % SupportMenu.USER_MASK);
                cArr5[i3] = (char) (((cArr4[i3] * 32718) + cArr5[i2]) / SupportMenu.USER_MASK);
                cArr4[i3] = dp.AFInAppEventType;
                cArr6[dp.AFInAppEventParameterName] = (char) (((((long) (cArr4[i3] ^ cArr3[dp.AFInAppEventParameterName])) ^ init) ^ ((long) AFLogger$LogLevel)) ^ ((long) onAppOpenAttributionNative));
                dp.AFInAppEventParameterName++;
            }
            str4 = new String(cArr6);
        }
        return str4;
    }
}
