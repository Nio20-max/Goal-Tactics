package com.appsflyer.internal;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.location.Location;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Base64;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.WindowManager;
import android.widget.ExpandableListView;
import com.appsflyer.AFInAppEventParameterName;
import com.appsflyer.AFInAppEventType;
import com.appsflyer.AFKeystoreWrapper;
import com.appsflyer.AFLogger;
import com.appsflyer.AFVersionDeclaration;
import com.appsflyer.AppsFlyerConversionListener;
import com.appsflyer.AppsFlyerInAppPurchaseValidatorListener;
import com.appsflyer.AppsFlyerLib;
import com.appsflyer.AppsFlyerProperties;
import com.appsflyer.attribution.AppsFlyerRequestListener;
import com.appsflyer.attribution.RequestError;
import com.appsflyer.deeplink.DeepLinkListener;
import com.appsflyer.deeplink.DeepLinkResult;
import com.appsflyer.internal.a;
import com.appsflyer.internal.ah;
import com.appsflyer.internal.an;
import com.appsflyer.internal.aq;
import com.appsflyer.internal.d;
import com.appsflyer.internal.dd;
import com.appsflyer.internal.l;
import com.appsflyer.internal.u;
import com.appsflyer.internal.v;
import com.facebook.internal.ServerProtocol;
import com.facebook.share.internal.ShareConstants;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.helpshift.analytics.AnalyticsEventKey;
import com.helpshift.campaigns.util.constants.ModelKeys;
import com.helpshift.db.legacy_profile.tables.ProfileTable;
import com.ironsource.sdk.constants.Constants;
import com.ironsource.sdk.constants.Events;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.ref.WeakReference;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.net.HttpURLConnection;
import java.net.NetworkInterface;
import java.security.KeyStoreException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.TimeZone;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import kotlin.text.Typography;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class ac extends AppsFlyerLib {
    static AppsFlyerInAppPurchaseValidatorListener AFInAppEventParameterName = null;
    public static final String AFInAppEventType;
    public static AppsFlyerConversionListener AFKeystoreWrapper = null;
    private static String AFLogger$LogLevel = null;
    private static long enableLocationCollection = 0;
    private static String onAppOpenAttributionNative = null;
    private static String onAttributionFailureNative = null;
    private static ac onConversionDataFail = null;
    private static String onDeepLinkingNative = null;
    private static final String onInstallConversionDataLoadedNative;
    private static String onInstallConversionFailureNative = null;
    private static String onResponseErrorNative = null;
    private static int setCustomerIdAndLogSession = 1;
    static final String valueOf;
    public static final String values;
    private static int waitForCustomerUserId;
    long AFVersionDeclaration;
    String AppsFlyer2dXConversionCallback;
    private boolean AppsFlyerInAppPurchaseValidatorListener;
    private boolean AppsFlyerLib;
    public y getLevel;
    private SharedPreferences getSdkVersion;
    String init;
    private String onDeepLinking;
    private String onPause;
    private Map<Long, String> onResponse;
    private dc setAndroidIdData;
    private final bf setCustomerUserId;
    private az setImeiData;
    private Application stop;
    private Map<String, Object> updateServerUninstallToken;
    private long onAppOpenAttribution = -1;
    private long onResponseNative = -1;
    private long onConversionDataSuccess = TimeUnit.SECONDS.toMillis(5);
    private boolean onResponseError = false;

    @Deprecated
    private ScheduledExecutorService onAttributionFailure = null;
    private boolean AppsFlyerConversionListener = false;
    private final al onValidateInAppFailure = new al();
    private boolean onValidateInApp = false;
    private boolean getInstance = false;
    private boolean setDebugLog = false;
    private final Executor setOaidData = Executors.newSingleThreadExecutor();

    static void AFVersionDeclaration() {
        enableLocationCollection = -8666534478441341805L;
    }

    static /* synthetic */ Application AFInAppEventParameterName(ac acVar) {
        int i = setCustomerIdAndLogSession + 39;
        int i2 = i % 128;
        waitForCustomerUserId = i2;
        int i3 = i % 2;
        Application application = acVar.stop;
        int i4 = i2 + 27;
        setCustomerIdAndLogSession = i4 % 128;
        if (i4 % 2 != 0) {
            return application;
        }
        int i5 = 86 / 0;
        return application;
    }

    static /* synthetic */ ScheduledExecutorService AFInAppEventParameterName(ac acVar, ScheduledExecutorService scheduledExecutorService) {
        int i = setCustomerIdAndLogSession + 117;
        int i2 = i % 128;
        waitForCustomerUserId = i2;
        int i3 = i % 2;
        acVar.onAttributionFailure = scheduledExecutorService;
        int i4 = i2 + 77;
        setCustomerIdAndLogSession = i4 % 128;
        int i5 = i4 % 2;
        return scheduledExecutorService;
    }

    static /* synthetic */ void AFInAppEventParameterName(ac acVar, i iVar) {
        int i = waitForCustomerUserId + 93;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        acVar.valueOf(iVar);
        int i3 = setCustomerIdAndLogSession + 99;
        waitForCustomerUserId = i3 % 128;
        if (i3 % 2 == 0) {
            return;
        }
        Object[] objArr = null;
        int length = objArr.length;
    }

    static /* synthetic */ boolean AFInAppEventParameterName(ac acVar, i iVar, SharedPreferences sharedPreferences) {
        int i = waitForCustomerUserId + 67;
        setCustomerIdAndLogSession = i % 128;
        boolean z = i % 2 == 0;
        boolean zValueOf = acVar.valueOf(iVar, sharedPreferences);
        if (z) {
            Object obj = null;
            super.hashCode();
        }
        return zValueOf;
    }

    static /* synthetic */ void AFInAppEventType(ac acVar, i iVar) throws Throwable {
        int i = setCustomerIdAndLogSession + 35;
        waitForCustomerUserId = i % 128;
        boolean z = i % 2 != 0;
        acVar.AFInAppEventParameterName(iVar);
        if (!z) {
            return;
        }
        Object[] objArr = null;
        int length = objArr.length;
    }

    static /* synthetic */ boolean AFInAppEventType(ac acVar) {
        int i = waitForCustomerUserId + 65;
        setCustomerIdAndLogSession = i % 128;
        boolean z = i % 2 != 0;
        boolean z2 = acVar.onResponseError;
        if (!z) {
            Object obj = null;
            super.hashCode();
        }
        return z2;
    }

    static /* synthetic */ Map AFKeystoreWrapper(ac acVar) {
        int i = waitForCustomerUserId + 113;
        int i2 = i % 128;
        setCustomerIdAndLogSession = i2;
        int i3 = i % 2;
        Map<String, Object> map = acVar.updateServerUninstallToken;
        int i4 = i2 + 87;
        waitForCustomerUserId = i4 % 128;
        if (i4 % 2 == 0) {
            return map;
        }
        Object obj = null;
        super.hashCode();
        return map;
    }

    static /* synthetic */ ScheduledExecutorService getLevel(ac acVar) {
        int i = waitForCustomerUserId;
        int i2 = i + 47;
        setCustomerIdAndLogSession = i2 % 128;
        int i3 = i2 % 2;
        ScheduledExecutorService scheduledExecutorService = acVar.onAttributionFailure;
        int i4 = i + 69;
        setCustomerIdAndLogSession = i4 % 128;
        int i5 = i4 % 2;
        return scheduledExecutorService;
    }

    static /* synthetic */ dc valueOf(ac acVar) {
        int i = setCustomerIdAndLogSession + 13;
        int i2 = i % 128;
        waitForCustomerUserId = i2;
        int i3 = i % 2;
        dc dcVar = acVar.setAndroidIdData;
        int i4 = i2 + 121;
        setCustomerIdAndLogSession = i4 % 128;
        if ((i4 % 2 == 0 ? '(' : (char) 31) != '(') {
            return dcVar;
        }
        int i5 = 28 / 0;
        return dcVar;
    }

    static /* synthetic */ bf values(ac acVar) {
        int i = setCustomerIdAndLogSession;
        int i2 = i + 103;
        waitForCustomerUserId = i2 % 128;
        int i3 = i2 % 2;
        bf bfVar = acVar.setCustomerUserId;
        int i4 = i + 45;
        waitForCustomerUserId = i4 % 128;
        if (!(i4 % 2 != 0)) {
            return bfVar;
        }
        Object obj = null;
        super.hashCode();
        return bfVar;
    }

    static /* synthetic */ boolean values(ac acVar, boolean z) {
        int i = setCustomerIdAndLogSession + 29;
        waitForCustomerUserId = i % 128;
        boolean z2 = i % 2 != 0;
        acVar.onResponseError = z;
        if (z2) {
            Object[] objArr = null;
            int length = objArr.length;
        }
        return z;
    }

    static {
        AFVersionDeclaration();
        valueOf = "170";
        String strSubstring = "6.5.4".substring(0, "6.5.4".lastIndexOf(values("Ჽ", View.MeasureSpec.makeMeasureSpec(0, 0) + 28643).intern()));
        AFInAppEventType = strSubstring;
        AFLogger$LogLevel = "https://%sstats.%s/stats";
        StringBuilder sb = new StringBuilder();
        sb.append(strSubstring);
        sb.append("/androidevent?buildnumber=6.5.4&app_id=");
        values = sb.toString();
        StringBuilder sb2 = new StringBuilder("https://%sadrevenue.%s/api/v");
        sb2.append(strSubstring);
        sb2.append("/android?buildnumber=6.5.4&app_id=");
        onInstallConversionFailureNative = sb2.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(strSubstring);
        sb3.append("/androidevent?app_id=");
        String string = sb3.toString();
        onInstallConversionDataLoadedNative = string;
        StringBuilder sb4 = new StringBuilder("https://%sconversions.%s/api/v");
        sb4.append(string);
        onDeepLinkingNative = sb4.toString();
        StringBuilder sb5 = new StringBuilder("https://%slaunches.%s/api/v");
        sb5.append(string);
        onAppOpenAttributionNative = sb5.toString();
        StringBuilder sb6 = new StringBuilder("https://%sinapps.%s/api/v");
        sb6.append(string);
        onAttributionFailureNative = sb6.toString();
        StringBuilder sb7 = new StringBuilder("https://%sattr.%s/api/v");
        sb7.append(string);
        onResponseErrorNative = sb7.toString();
        AFInAppEventParameterName = null;
        AFKeystoreWrapper = null;
        onConversionDataFail = new ac();
        int i = setCustomerIdAndLogSession + 29;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
    }

    public final bg values() {
        int i = setCustomerIdAndLogSession;
        int i2 = i + 11;
        waitForCustomerUserId = i2 % 128;
        int i3 = i2 % 2;
        bf bfVar = this.setCustomerUserId;
        int i4 = i + 15;
        waitForCustomerUserId = i4 % 128;
        int i5 = i4 % 2;
        return bfVar;
    }

    public ac() {
        AFVersionDeclaration.init();
        this.setCustomerUserId = new bf();
    }

    public static ac AFInAppEventParameterName() {
        int i = setCustomerIdAndLogSession + 103;
        int i2 = i % 128;
        waitForCustomerUserId = i2;
        int i3 = i % 2;
        ac acVar = onConversionDataFail;
        int i4 = i2 + 47;
        setCustomerIdAndLogSession = i4 % 128;
        int i5 = i4 % 2;
        return acVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0026, code lost:
    
        if (r0 != false) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0033, code lost:
    
        if (r5.toString().isEmpty() != false) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x004c, code lost:
    
        if (r4 != null) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x004e, code lost:
    
        r5 = new java.lang.StringBuilder("Context is \"");
        r5.append(r4);
        r5.append("\"");
        com.appsflyer.internal.ao.AFInAppEventType(r5.toString(), com.appsflyer.deeplink.DeepLinkResult.Error.NETWORK);
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0064, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0065, code lost:
    
        com.appsflyer.internal.f.valueOf().AFInAppEventType(r4, new java.util.HashMap(), android.net.Uri.parse(r5.toString()));
        r4 = com.appsflyer.internal.ac.waitForCustomerUserId + 121;
        com.appsflyer.internal.ac.setCustomerIdAndLogSession = r4 % 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0084, code lost:
    
        if ((r4 % 2) != 0) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0086, code lost:
    
        r4 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0088, code lost:
    
        r4 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0089, code lost:
    
        if (r4 == true) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x008b, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x008c, code lost:
    
        r4 = r1.length;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x008d, code lost:
    
        return;
     */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.appsflyer.AppsFlyerLib
    @java.lang.Deprecated
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void performOnAppAttribution(android.content.Context r4, java.net.URI r5) {
        /*
            r3 = this;
            r0 = 63
            if (r5 == 0) goto L7
            r1 = 63
            goto L9
        L7:
            r1 = 45
        L9:
            java.lang.String r2 = "\""
            if (r1 == r0) goto Le
            goto L35
        Le:
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 49
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
            r1 = 0
            if (r0 == 0) goto L2b
            java.lang.String r0 = r5.toString()
            boolean r0 = r0.isEmpty()
            super.hashCode()     // Catch: java.lang.Throwable -> L29
            if (r0 == 0) goto L4c
            goto L35
        L29:
            r4 = move-exception
            throw r4
        L2b:
            java.lang.String r0 = r5.toString()
            boolean r0 = r0.isEmpty()
            if (r0 == 0) goto L4c
        L35:
            java.lang.StringBuilder r4 = new java.lang.StringBuilder
            java.lang.String r0 = "Link is \""
            r4.<init>(r0)
            r4.append(r5)
            r4.append(r2)
            java.lang.String r4 = r4.toString()
            com.appsflyer.deeplink.DeepLinkResult$Error r5 = com.appsflyer.deeplink.DeepLinkResult.Error.NETWORK
            com.appsflyer.internal.ao.AFInAppEventType(r4, r5)
            return
        L4c:
            if (r4 != 0) goto L65
            java.lang.StringBuilder r5 = new java.lang.StringBuilder
            java.lang.String r0 = "Context is \""
            r5.<init>(r0)
            r5.append(r4)
            r5.append(r2)
            java.lang.String r4 = r5.toString()
            com.appsflyer.deeplink.DeepLinkResult$Error r5 = com.appsflyer.deeplink.DeepLinkResult.Error.NETWORK
            com.appsflyer.internal.ao.AFInAppEventType(r4, r5)
            return
        L65:
            com.appsflyer.internal.f r0 = com.appsflyer.internal.f.valueOf()
            java.util.HashMap r2 = new java.util.HashMap
            r2.<init>()
            java.lang.String r5 = r5.toString()
            android.net.Uri r5 = android.net.Uri.parse(r5)
            r0.AFInAppEventType(r4, r2, r5)
            int r4 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r4 = r4 + 121
            int r5 = r4 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r5
            int r4 = r4 % 2
            r5 = 1
            if (r4 != 0) goto L88
            r4 = 1
            goto L89
        L88:
            r4 = 0
        L89:
            if (r4 == r5) goto L8c
            return
        L8c:
            int r4 = r1.length     // Catch: java.lang.Throwable -> L8e
            return
        L8e:
            r4 = move-exception
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.performOnAppAttribution(android.content.Context, java.net.URI):void");
    }

    @Override // com.appsflyer.AppsFlyerLib
    @Deprecated
    public final void setSharingFilter(String... strArr) {
        int i = waitForCustomerUserId + 1;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        setSharingFilterForPartners(strArr);
        int i3 = waitForCustomerUserId + 47;
        setCustomerIdAndLogSession = i3 % 128;
        int i4 = i3 % 2;
    }

    @Override // com.appsflyer.AppsFlyerLib
    @Deprecated
    public final void setSharingFilterForAllPartners() {
        int i = setCustomerIdAndLogSession + 107;
        waitForCustomerUserId = i % 128;
        if ((i % 2 != 0 ? '9' : ' ') != '9') {
            setSharingFilterForPartners("all");
        } else {
            String[] strArr = new String[0];
            strArr[0] = "all";
            setSharingFilterForPartners(strArr);
        }
        int i2 = waitForCustomerUserId + 5;
        setCustomerIdAndLogSession = i2 % 128;
        if (!(i2 % 2 != 0)) {
            int i3 = 32 / 0;
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setSharingFilterForPartners(String... strArr) {
        this.getLevel = new y(strArr);
        int i = setCustomerIdAndLogSession + 3;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void appendParametersToDeepLinkingURL(String str, Map<String, String> map) {
        int i = waitForCustomerUserId + 75;
        setCustomerIdAndLogSession = i % 128;
        if (i % 2 == 0) {
            f fVarValueOf = f.valueOf();
            fVarValueOf.AFVersionDeclaration = str;
            fVarValueOf.getLevel = map;
            int i2 = 9 / 0;
            return;
        }
        f fVarValueOf2 = f.valueOf();
        fVarValueOf2.AFVersionDeclaration = str;
        fVarValueOf2.getLevel = map;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void subscribeForDeepLink(DeepLinkListener deepLinkListener) {
        int i = waitForCustomerUserId + 61;
        setCustomerIdAndLogSession = i % 128;
        if (!(i % 2 != 0)) {
            subscribeForDeepLink(deepLinkListener, TimeUnit.SECONDS.toMillis(3L));
            int i2 = 88 / 0;
        } else {
            subscribeForDeepLink(deepLinkListener, TimeUnit.SECONDS.toMillis(3L));
        }
        int i3 = waitForCustomerUserId + 91;
        setCustomerIdAndLogSession = i3 % 128;
        int i4 = i3 % 2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.appsflyer.AppsFlyerLib
    public final void subscribeForDeepLink(DeepLinkListener deepLinkListener, long j) {
        int i = setCustomerIdAndLogSession + 17;
        waitForCustomerUserId = i % 128;
        Object obj = null;
        Object[] objArr = 0;
        if (!(i % 2 != 0)) {
            f.valueOf().values = deepLinkListener;
            ar.onInstallConversionDataLoadedNative = j;
        } else {
            f.valueOf().values = deepLinkListener;
            ar.onInstallConversionDataLoadedNative = j;
            super.hashCode();
        }
        int i2 = setCustomerIdAndLogSession + 21;
        waitForCustomerUserId = i2 % 128;
        if (i2 % 2 != 0) {
            int length = (objArr == true ? 1 : 0).length;
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void addPushNotificationDeepLinkPath(String... strArr) {
        int i = waitForCustomerUserId + 57;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        List<String> listAsList = Arrays.asList(strArr);
        List<List<String>> list = f.valueOf().init;
        if ((!list.contains(listAsList) ? (char) 20 : (char) 28) == 20) {
            list.add(listAsList);
        }
        int i3 = waitForCustomerUserId + 111;
        setCustomerIdAndLogSession = i3 % 128;
        if (!(i3 % 2 != 0)) {
            int i4 = 53 / 0;
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setPartnerData(String str, Map<String, Object> map) {
        String strConcat;
        if (this.setImeiData == null) {
            this.setImeiData = new az();
        }
        az azVar = this.setImeiData;
        if (str != null) {
            if (!str.isEmpty()) {
                if ((map != null ? 'I' : 'J') == 'J' || map.isEmpty()) {
                    if ((azVar.values.remove(str) == null ? '\f' : (char) 0) != '\f') {
                        strConcat = "Cleared partner data for ".concat(String.valueOf(str));
                        int i = setCustomerIdAndLogSession + 35;
                        waitForCustomerUserId = i % 128;
                        int i2 = i % 2;
                    } else {
                        int i3 = setCustomerIdAndLogSession + 5;
                        waitForCustomerUserId = i3 % 128;
                        int i4 = i3 % 2;
                        strConcat = "Partner data is missing or `null`";
                    }
                    AFLogger.AppsFlyer2dXConversionCallback(strConcat);
                    return;
                }
                StringBuilder sb = new StringBuilder("Setting partner data for ");
                sb.append(str);
                sb.append(": ");
                sb.append(map);
                AFLogger.AFInAppEventParameterName(sb.toString());
                int length = new JSONObject(map).toString().length();
                if (length > 1000) {
                    AFLogger.AppsFlyer2dXConversionCallback("Partner data 1000 characters limit exceeded");
                    HashMap map2 = new HashMap();
                    map2.put("error", "limit exceeded: ".concat(String.valueOf(length)));
                    azVar.valueOf.put(str, map2);
                    return;
                }
                azVar.values.put(str, map);
                azVar.valueOf.remove(str);
                return;
            }
        }
        AFLogger.AppsFlyer2dXConversionCallback("Partner ID is missing or `null`");
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setDisableAdvertisingIdentifiers(boolean z) {
        boolean z2;
        AFLogger.AFInAppEventParameterName("setDisableAdvertisingIdentifiers: ".concat(String.valueOf(z)));
        if ((!z ? 'Q' : (char) 6) != 'Q') {
            z2 = false;
            int i = setCustomerIdAndLogSession + 101;
            waitForCustomerUserId = i % 128;
            int i2 = i % 2;
        } else {
            int i3 = setCustomerIdAndLogSession + 103;
            waitForCustomerUserId = i3 % 128;
            int i4 = i3 % 2;
            z2 = true;
        }
        ab.AFInAppEventType = Boolean.valueOf(z2);
        AppsFlyerProperties.getInstance().remove("advertiserIdEnabled");
        AppsFlyerProperties.getInstance().remove("advertiserId");
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void AFKeystoreWrapper(Context context, Intent intent) {
        if ((intent.getStringExtra("appsflyer_preinstall") != null ? '5' : 'D') != 'D') {
            AFInAppEventType(intent.getStringExtra("appsflyer_preinstall"));
        }
        AFLogger.values("****** onReceive called *******");
        AppsFlyerProperties.getInstance();
        String stringExtra = intent.getStringExtra("referrer");
        AFLogger.values("Play store referrer: ".concat(String.valueOf(stringExtra)));
        Object[] objArr = null;
        Object[] objArr2 = 0;
        if (stringExtra != null) {
            valueOf(context, "referrer", stringExtra);
            AppsFlyerProperties appsFlyerProperties = AppsFlyerProperties.getInstance();
            appsFlyerProperties.set("AF_REFERRER", stringExtra);
            appsFlyerProperties.valueOf = stringExtra;
            if (AppsFlyerProperties.getInstance().values()) {
                int i = waitForCustomerUserId + 79;
                setCustomerIdAndLogSession = i % 128;
                if (i % 2 == 0) {
                    AFLogger.values("onReceive: isLaunchCalled");
                    AFInAppEventParameterName(context, ch.onReceive);
                    AFInAppEventType(context, stringExtra);
                    super.hashCode();
                } else {
                    AFLogger.values("onReceive: isLaunchCalled");
                    AFInAppEventParameterName(context, ch.onReceive);
                    AFInAppEventType(context, stringExtra);
                }
            }
        }
        int i2 = setCustomerIdAndLogSession + 9;
        waitForCustomerUserId = i2 % 128;
        if (i2 % 2 != 0) {
            int length = objArr.length;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x00c1 A[Catch: JSONException -> 0x00e8, TRY_LEAVE, TryCatch #1 {JSONException -> 0x00e8, blocks: (B:18:0x0059, B:19:0x0065, B:21:0x006b, B:29:0x008e, B:40:0x00c1, B:35:0x00a6), top: B:57:0x0059 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void valueOf(org.json.JSONObject r15) {
        /*
            Method dump skipped, instruction units count: 245
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.valueOf(org.json.JSONObject):void");
    }

    public final void valueOf(Context context, String str) {
        JSONArray jSONArray;
        JSONArray jSONArray2;
        JSONObject jSONObject;
        AFLogger.AFInAppEventParameterName("received a new (extra) referrer: ".concat(String.valueOf(str)));
        try {
            long jCurrentTimeMillis = System.currentTimeMillis();
            Object[] objArr = null;
            String string = AFInAppEventType(context).getString("extraReferrers", null);
            if (string == null) {
                jSONObject = new JSONObject();
                jSONArray2 = new JSONArray();
            } else {
                JSONObject jSONObject2 = new JSONObject(string);
                if (jSONObject2.has(str)) {
                    jSONArray = new JSONArray((String) jSONObject2.get(str));
                } else {
                    jSONArray = new JSONArray();
                }
                jSONArray2 = jSONArray;
                jSONObject = jSONObject2;
            }
            if (jSONArray2.length() < 5) {
                jSONArray2.put(jCurrentTimeMillis);
            }
            if (!(((long) jSONObject.length()) < 4)) {
                int i = waitForCustomerUserId + 61;
                setCustomerIdAndLogSession = i % 128;
                if ((i % 2 == 0 ? 'U' : '`') != 'U') {
                    valueOf(jSONObject);
                } else {
                    valueOf(jSONObject);
                    int length = objArr.length;
                }
            }
            jSONObject.put(str, jSONArray2.toString());
            valueOf(context, "extraReferrers", jSONObject.toString());
            int i2 = waitForCustomerUserId + 105;
            setCustomerIdAndLogSession = i2 % 128;
            if ((i2 % 2 == 0 ? (char) 24 : '\n') != '\n') {
                int i3 = 47 / 0;
            }
        } catch (JSONException unused) {
        } catch (Throwable th) {
            StringBuilder sb = new StringBuilder("Couldn't save referrer - ");
            sb.append(str);
            sb.append(": ");
            AFLogger.valueOf(sb.toString(), th);
        }
    }

    private static void AFInAppEventType(SharedPreferences.Editor editor) {
        int i = setCustomerIdAndLogSession + 123;
        waitForCustomerUserId = i % 128;
        char c = i % 2 != 0 ? '*' : 'C';
        editor.apply();
        if (c != 'C') {
            Object obj = null;
            super.hashCode();
        }
        int i2 = setCustomerIdAndLogSession + 31;
        waitForCustomerUserId = i2 % 128;
        if (i2 % 2 != 0) {
            int i3 = 17 / 0;
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void stop(boolean z, Context context) {
        this.getInstance = z;
        try {
            File file = new File(values().AFVersionDeclaration().AFKeystoreWrapper.values.getFilesDir(), "AFRequestCache");
            int i = 0;
            if (!(file.exists())) {
                int i2 = waitForCustomerUserId + 7;
                setCustomerIdAndLogSession = i2 % 128;
                if ((i2 % 2 == 0 ? '!' : 'N') != 'N') {
                    file.mkdir();
                    int i3 = 36 / 0;
                } else {
                    file.mkdir();
                }
            } else {
                File[] fileArrListFiles = file.listFiles();
                if (fileArrListFiles != null) {
                    int length = fileArrListFiles.length;
                    while (i < length) {
                        File file2 = fileArrListFiles[i];
                        StringBuilder sb = new StringBuilder("CACHE: Found cached request");
                        sb.append(file2.getName());
                        AFLogger.values(sb.toString());
                        StringBuilder sb2 = new StringBuilder("CACHE: Deleting ");
                        sb2.append(file2.getName());
                        sb2.append(" from cache");
                        AFLogger.values(sb2.toString());
                        file2.delete();
                        i++;
                        int i4 = waitForCustomerUserId + 23;
                        setCustomerIdAndLogSession = i4 % 128;
                        int i5 = i4 % 2;
                    }
                }
            }
        } catch (Exception e2) {
            AFLogger.valueOf("CACHE: Could not cache request", e2);
        }
        if (this.getInstance) {
            int i6 = waitForCustomerUserId + 21;
            setCustomerIdAndLogSession = i6 % 128;
            int i7 = i6 % 2;
            values(context, "is_stop_tracking_used");
            int i8 = waitForCustomerUserId + 69;
            setCustomerIdAndLogSession = i8 % 128;
            int i9 = i8 % 2;
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final String getSdkVersion() {
        ak.AFInAppEventType().AFKeystoreWrapper("getSdkVersion", new String[0]);
        StringBuilder sb = new StringBuilder("version: 6.5.4 (build ");
        sb.append(valueOf);
        sb.append(")");
        String string = sb.toString();
        int i = waitForCustomerUserId + 9;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        return string;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void onPause(Context context) {
        int i = setCustomerIdAndLogSession + 65;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        if ((ah.AFInAppEventParameterName != null ? '?' : '2') != '?') {
            return;
        }
        int i3 = setCustomerIdAndLogSession + 109;
        waitForCustomerUserId = i3 % 128;
        if (i3 % 2 == 0) {
            ah.AFInAppEventParameterName.valueOf(context);
        } else {
            ah.AFInAppEventParameterName.valueOf(context);
            int i4 = 13 / 0;
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void updateServerUninstallToken(Context context, String str) {
        new cd(context).AFInAppEventParameterName(str);
        int i = setCustomerIdAndLogSession + 27;
        waitForCustomerUserId = i % 128;
        if ((i % 2 != 0 ? ')' : '\b') != '\b') {
            Object obj = null;
            super.hashCode();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0027  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x002a  */
    @Override // com.appsflyer.AppsFlyerLib
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void setDebugLog(boolean r3) {
        /*
            r2 = this;
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 105
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
            r1 = 63
            if (r0 != 0) goto L11
            r0 = 63
            goto L13
        L11:
            r0 = 60
        L13:
            if (r0 == r1) goto L18
            if (r3 == 0) goto L27
            goto L2a
        L18:
            r0 = 0
            super.hashCode()     // Catch: java.lang.Throwable -> L3a
            r0 = 80
            if (r3 == 0) goto L23
            r3 = 80
            goto L25
        L23:
            r3 = 28
        L25:
            if (r3 == r0) goto L2a
        L27:
            com.appsflyer.AFLogger$LogLevel r3 = com.appsflyer.AFLogger.LogLevel.NONE
            goto L2c
        L2a:
            com.appsflyer.AFLogger$LogLevel r3 = com.appsflyer.AFLogger.LogLevel.DEBUG
        L2c:
            r2.setLogLevel(r3)
            int r3 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r3 = r3 + 31
            int r0 = r3 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r0
            int r3 = r3 % 2
            return
        L3a:
            r3 = move-exception
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.setDebugLog(boolean):void");
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setImeiData(String str) {
        int i = setCustomerIdAndLogSession + 107;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        ak.AFInAppEventType().AFKeystoreWrapper("setImeiData", str);
        this.AppsFlyer2dXConversionCallback = str;
        int i3 = setCustomerIdAndLogSession + 39;
        waitForCustomerUserId = i3 % 128;
        if (i3 % 2 == 0) {
            return;
        }
        Object obj = null;
        super.hashCode();
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setOaidData(String str) {
        int i = waitForCustomerUserId + 11;
        setCustomerIdAndLogSession = i % 128;
        if ((i % 2 == 0 ? 'Q' : ']') != ']') {
            ak akVarAFInAppEventType = ak.AFInAppEventType();
            String[] strArr = new String[1];
            strArr[1] = str;
            akVarAFInAppEventType.AFKeystoreWrapper("setOaidData", strArr);
        } else {
            ak.AFInAppEventType().AFKeystoreWrapper("setOaidData", str);
        }
        ab.AFInAppEventParameterName = str;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setAndroidIdData(String str) {
        int i = setCustomerIdAndLogSession + 107;
        waitForCustomerUserId = i % 128;
        if ((i % 2 != 0 ? '[' : ':') != ':') {
            ak akVarAFInAppEventType = ak.AFInAppEventType();
            String[] strArr = new String[1];
            strArr[1] = str;
            akVarAFInAppEventType.AFKeystoreWrapper("setAndroidIdData", strArr);
        } else {
            ak.AFInAppEventType().AFKeystoreWrapper("setAndroidIdData", str);
        }
        this.init = str;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final AppsFlyerLib enableLocationCollection(boolean z) {
        int i = waitForCustomerUserId + 19;
        setCustomerIdAndLogSession = i % 128;
        if (!(i % 2 != 0)) {
            this.AppsFlyerConversionListener = z;
            int i2 = 73 / 0;
        } else {
            this.AppsFlyerConversionListener = z;
        }
        return this;
    }

    public static void valueOf(Context context, String str, String str2) {
        int i = waitForCustomerUserId + 65;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        SharedPreferences.Editor editorEdit = AFInAppEventType(context).edit();
        editorEdit.putString(str, str2);
        AFInAppEventType(editorEdit);
        int i3 = waitForCustomerUserId + 125;
        setCustomerIdAndLogSession = i3 % 128;
        if (!(i3 % 2 != 0)) {
            Object[] objArr = null;
            int length = objArr.length;
        }
    }

    public static void values(Context context, String str) {
        SharedPreferences.Editor editorEdit;
        int i = setCustomerIdAndLogSession + 7;
        waitForCustomerUserId = i % 128;
        if (!(i % 2 == 0)) {
            editorEdit = AFInAppEventType(context).edit();
            editorEdit.putBoolean(str, false);
        } else {
            editorEdit = AFInAppEventType(context).edit();
            editorEdit.putBoolean(str, true);
        }
        AFInAppEventType(editorEdit);
        int i2 = setCustomerIdAndLogSession + 93;
        waitForCustomerUserId = i2 % 128;
        int i3 = i2 % 2;
    }

    private static void valueOf(Context context, String str, int i) {
        int i2 = setCustomerIdAndLogSession + 45;
        waitForCustomerUserId = i2 % 128;
        if ((i2 % 2 != 0 ? (char) 25 : (char) 5) != 25) {
            SharedPreferences.Editor editorEdit = AFInAppEventType(context).edit();
            editorEdit.putInt(str, i);
            AFInAppEventType(editorEdit);
        } else {
            SharedPreferences.Editor editorEdit2 = AFInAppEventType(context).edit();
            editorEdit2.putInt(str, i);
            AFInAppEventType(editorEdit2);
            int i3 = 41 / 0;
        }
    }

    public final void AFInAppEventType(Context context, String str, long j) {
        int i = setCustomerIdAndLogSession + 97;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        AFInAppEventParameterName(AFInAppEventType(context), str, j);
        int i3 = setCustomerIdAndLogSession + 75;
        waitForCustomerUserId = i3 % 128;
        int i4 = i3 % 2;
    }

    private static void AFInAppEventParameterName(SharedPreferences sharedPreferences, String str, long j) {
        int i = setCustomerIdAndLogSession + 121;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        editorEdit.putLong(str, j);
        AFInAppEventType(editorEdit);
        int i3 = setCustomerIdAndLogSession + 45;
        waitForCustomerUserId = i3 % 128;
        int i4 = i3 % 2;
    }

    private static void values(String str, String str2) {
        int i = waitForCustomerUserId + 35;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        AppsFlyerProperties.getInstance().set(str, str2);
        int i3 = waitForCustomerUserId + 15;
        setCustomerIdAndLogSession = i3 % 128;
        if (i3 % 2 != 0) {
            return;
        }
        Object obj = null;
        super.hashCode();
    }

    private static void values(String str, boolean z) {
        int i = setCustomerIdAndLogSession + 3;
        waitForCustomerUserId = i % 128;
        if (i % 2 == 0) {
            AppsFlyerProperties.getInstance().set(str, z);
            return;
        }
        AppsFlyerProperties.getInstance().set(str, z);
        Object[] objArr = null;
        int length = objArr.length;
    }

    private static String AFInAppEventParameterName(String str) {
        String string;
        int i = waitForCustomerUserId + 61;
        setCustomerIdAndLogSession = i % 128;
        if ((i % 2 == 0 ? ';' : '`') != ';') {
            string = AppsFlyerProperties.getInstance().getString(str);
        } else {
            string = AppsFlyerProperties.getInstance().getString(str);
            int i2 = 31 / 0;
        }
        int i3 = setCustomerIdAndLogSession + 43;
        waitForCustomerUserId = i3 % 128;
        int i4 = i3 % 2;
        return string;
    }

    private static boolean AFKeystoreWrapper(String str, boolean z) {
        int i = setCustomerIdAndLogSession + 11;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        boolean z2 = AppsFlyerProperties.getInstance().getBoolean(str, z);
        int i3 = waitForCustomerUserId + 39;
        setCustomerIdAndLogSession = i3 % 128;
        int i4 = i3 % 2;
        return z2;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0027  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean AFKeystoreWrapper() {
        /*
            r5 = this;
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 101
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
            r1 = 1
            r2 = 0
            java.lang.String r3 = "waitForCustomerId"
            r4 = 45
            if (r0 == 0) goto L1a
            boolean r0 = AFKeystoreWrapper(r3, r1)
            if (r0 == 0) goto L4d
            goto L27
        L1a:
            boolean r0 = AFKeystoreWrapper(r3, r2)
            if (r0 == 0) goto L23
            r0 = 72
            goto L25
        L23:
            r0 = 45
        L25:
            if (r0 == r4) goto L4d
        L27:
            java.lang.String r0 = AFInAppEventType()
            if (r0 != 0) goto L4d
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r2 = r0 + 11
            int r3 = r2 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r3
            int r2 = r2 % 2
            int r0 = r0 + 63
            int r2 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r2
            int r0 = r0 % 2
            r2 = 30
            if (r0 == 0) goto L45
            r4 = 30
        L45:
            if (r4 == r2) goto L48
            return r1
        L48:
            r0 = 0
            int r0 = r0.length     // Catch: java.lang.Throwable -> L4b
            return r1
        L4b:
            r0 = move-exception
            throw r0
        L4d:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.AFKeystoreWrapper():boolean");
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void waitForCustomerUserId(boolean z) {
        int i = setCustomerIdAndLogSession + 1;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        AFLogger.values("initAfterCustomerUserID: ".concat(String.valueOf(z)), true);
        values(AppsFlyerProperties.AF_WAITFOR_CUSTOMERID, z);
        int i3 = setCustomerIdAndLogSession + 119;
        waitForCustomerUserId = i3 % 128;
        int i4 = i3 % 2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x001a, code lost:
    
        if (r0 != false) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0023, code lost:
    
        if (AFKeystoreWrapper() != false) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0025, code lost:
    
        setCustomerUserId(r9);
        r0 = new java.lang.StringBuilder("CustomerUserId set: ");
        r0.append(r9);
        r0.append(" - Initializing AppsFlyer Tacking");
        com.appsflyer.AFLogger.values(r0.toString(), true);
        r9 = com.appsflyer.AppsFlyerProperties.getInstance().getReferrer(r10);
        AFInAppEventParameterName(r10, com.appsflyer.internal.ch.setCustomerIdAndLogSession);
        r3 = com.appsflyer.AppsFlyerProperties.getInstance().getDevKey();
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0055, code lost:
    
        if (r9 != null) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0057, code lost:
    
        r9 = com.appsflyer.internal.ac.waitForCustomerUserId + 23;
        com.appsflyer.internal.ac.setCustomerIdAndLogSession = r9 % 128;
        r9 = r9 % 2;
        r9 = "";
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0064, code lost:
    
        r0 = com.appsflyer.internal.ac.waitForCustomerUserId + 79;
        com.appsflyer.internal.ac.setCustomerIdAndLogSession = r0 % 128;
        r0 = r0 % 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x006e, code lost:
    
        r6 = r9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0072, code lost:
    
        if ((r10 instanceof android.app.Activity) == false) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0074, code lost:
    
        r9 = ')';
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0077, code lost:
    
        r9 = 5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0078, code lost:
    
        if (r9 == 5) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x007a, code lost:
    
        r9 = com.appsflyer.internal.ac.waitForCustomerUserId + 5;
        com.appsflyer.internal.ac.setCustomerIdAndLogSession = r9 % 128;
        r9 = r9 % 2;
        ((android.app.Activity) r10).getIntent();
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0089, code lost:
    
        AFInAppEventParameterName(r10, r3, null, null, r6, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x008f, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0090, code lost:
    
        setCustomerUserId(r9);
        com.appsflyer.AFLogger.values("waitForCustomerUserId is false; setting CustomerUserID: ".concat(java.lang.String.valueOf(r9)), true);
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x00a1, code lost:
    
        return;
     */
    @Override // com.appsflyer.AppsFlyerLib
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void setCustomerIdAndLogSession(java.lang.String r9, android.content.Context r10) {
        /*
            r8 = this;
            if (r10 == 0) goto La1
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 95
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
            r1 = 1
            if (r0 != 0) goto L11
            r0 = 0
            goto L12
        L11:
            r0 = 1
        L12:
            if (r0 == r1) goto L1f
            boolean r0 = r8.AFKeystoreWrapper()
            r2 = 0
            int r2 = r2.length     // Catch: java.lang.Throwable -> L1d
            if (r0 == 0) goto L90
            goto L25
        L1d:
            r9 = move-exception
            throw r9
        L1f:
            boolean r0 = r8.AFKeystoreWrapper()
            if (r0 == 0) goto L90
        L25:
            r8.setCustomerUserId(r9)
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            java.lang.String r2 = "CustomerUserId set: "
            r0.<init>(r2)
            r0.append(r9)
            java.lang.String r9 = " - Initializing AppsFlyer Tacking"
            r0.append(r9)
            java.lang.String r9 = r0.toString()
            com.appsflyer.AFLogger.values(r9, r1)
            com.appsflyer.AppsFlyerProperties r9 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r9 = r9.getReferrer(r10)
            com.appsflyer.internal.ch r0 = com.appsflyer.internal.ch.setCustomerIdAndLogSession
            r8.AFInAppEventParameterName(r10, r0)
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r3 = r0.getDevKey()
            r4 = 0
            r5 = 0
            if (r9 != 0) goto L64
            int r9 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r9 = r9 + 23
            int r0 = r9 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r0
            int r9 = r9 % 2
            java.lang.String r9 = ""
            goto L6e
        L64:
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 79
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
        L6e:
            r6 = r9
            boolean r9 = r10 instanceof android.app.Activity
            r0 = 5
            if (r9 == 0) goto L77
            r9 = 41
            goto L78
        L77:
            r9 = 5
        L78:
            if (r9 == r0) goto L89
            int r9 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r9 = r9 + r0
            int r0 = r9 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r0
            int r9 = r9 % 2
            r9 = r10
            android.app.Activity r9 = (android.app.Activity) r9
            r9.getIntent()
        L89:
            r7 = 0
            r1 = r8
            r2 = r10
            r1.AFInAppEventParameterName(r2, r3, r4, r5, r6, r7)
            return
        L90:
            r8.setCustomerUserId(r9)
            java.lang.String r9 = java.lang.String.valueOf(r9)
            java.lang.String r10 = "waitForCustomerUserId is false; setting CustomerUserID: "
            java.lang.String r9 = r10.concat(r9)
            com.appsflyer.AFLogger.values(r9, r1)
        La1:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.setCustomerIdAndLogSession(java.lang.String, android.content.Context):void");
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final String getOutOfStore(Context context) {
        String string = AppsFlyerProperties.getInstance().getString("api_store_value");
        if (string == null) {
            String strAFKeystoreWrapper = AFKeystoreWrapper(context, "AF_STORE");
            if (!(strAFKeystoreWrapper != null)) {
                AFLogger.values("No out-of-store value set");
                return null;
            }
            int i = setCustomerIdAndLogSession + 121;
            int i2 = i % 128;
            waitForCustomerUserId = i2;
            int i3 = i % 2;
            int i4 = i2 + 27;
            setCustomerIdAndLogSession = i4 % 128;
            int i5 = i4 % 2;
            return strAFKeystoreWrapper;
        }
        int i6 = setCustomerIdAndLogSession + 49;
        waitForCustomerUserId = i6 % 128;
        if ((i6 % 2 != 0 ? '-' : '5') == '5') {
            return string;
        }
        int i7 = 46 / 0;
        return string;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setOutOfStore(String str) {
        if (str == null) {
            AFLogger.valueOf("Cannot set setOutOfStore with null");
            return;
        }
        int i = waitForCustomerUserId + 71;
        setCustomerIdAndLogSession = i % 128;
        if (i % 2 == 0) {
        }
        String lowerCase = str.toLowerCase();
        AppsFlyerProperties.getInstance().set("api_store_value", lowerCase);
        AFLogger.values("Store API set with value: ".concat(String.valueOf(lowerCase)), true);
        int i2 = setCustomerIdAndLogSession + 103;
        waitForCustomerUserId = i2 % 128;
        if ((i2 % 2 != 0 ? '.' : 'L') != 'L') {
            int i3 = 60 / 0;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x006f  */
    @Override // com.appsflyer.AppsFlyerLib
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void setAppInviteOneLink(java.lang.String r8) {
        /*
            r7 = this;
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 45
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
            r1 = 62
            if (r0 == 0) goto L11
            r0 = 62
            goto L13
        L11:
            r0 = 75
        L13:
            java.lang.String r2 = "oneLinkSlug"
            java.lang.String r3 = "setAppInviteOneLink = "
            r4 = 0
            r5 = 1
            java.lang.String r6 = "setAppInviteOneLink"
            if (r0 == r1) goto L3f
            com.appsflyer.internal.ak r0 = com.appsflyer.internal.ak.AFInAppEventType()
            java.lang.String[] r1 = new java.lang.String[r5]
            r1[r4] = r8
            r0.AFKeystoreWrapper(r6, r1)
            java.lang.String r0 = java.lang.String.valueOf(r8)
            java.lang.String r0 = r3.concat(r0)
            com.appsflyer.AFLogger.values(r0)
            r0 = 93
            if (r8 == 0) goto L3a
            r1 = 65
            goto L3c
        L3a:
            r1 = 93
        L3c:
            if (r1 == r0) goto L6f
            goto L57
        L3f:
            com.appsflyer.internal.ak r0 = com.appsflyer.internal.ak.AFInAppEventType()
            java.lang.String[] r1 = new java.lang.String[r5]
            r1[r4] = r8
            r0.AFKeystoreWrapper(r6, r1)
            java.lang.String r0 = java.lang.String.valueOf(r8)
            java.lang.String r0 = r3.concat(r0)
            com.appsflyer.AFLogger.values(r0)
            if (r8 == 0) goto L6f
        L57:
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r0 = r0.getString(r2)
            boolean r0 = r8.equals(r0)
            r1 = 55
            if (r0 != 0) goto L6a
            r0 = 55
            goto L6c
        L6a:
            r0 = 63
        L6c:
            if (r0 == r1) goto L6f
            goto L94
        L6f:
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r1 = "onelinkDomain"
            r0.remove(r1)
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r1 = "onelinkVersion"
            r0.remove(r1)
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r1 = "onelinkScheme"
            r0.remove(r1)
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 79
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
        L94:
            values(r2, r8)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.setAppInviteOneLink(java.lang.String):void");
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setAdditionalData(Map<String, Object> map) {
        int i = setCustomerIdAndLogSession + 31;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        if (map != null) {
            ak.AFInAppEventType().AFKeystoreWrapper("setAdditionalData", map.toString());
            AppsFlyerProperties.getInstance().setCustomData(new JSONObject(map).toString());
            int i3 = setCustomerIdAndLogSession + 3;
            waitForCustomerUserId = i3 % 128;
            int i4 = i3 % 2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0063  */
    @Override // com.appsflyer.AppsFlyerLib
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void sendPushNotificationData(android.app.Activity r17) {
        /*
            Method dump skipped, instruction units count: 496
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.sendPushNotificationData(android.app.Activity):void");
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setUserEmails(String... strArr) {
        int i = setCustomerIdAndLogSession + 35;
        waitForCustomerUserId = i % 128;
        if ((i % 2 != 0 ? 'B' : '[') != '[') {
            ak.AFInAppEventType().AFKeystoreWrapper("setUserEmails", strArr);
            setUserEmails(AppsFlyerProperties.EmailsCryptType.NONE, strArr);
            int i2 = 55 / 0;
        } else {
            ak.AFInAppEventType().AFKeystoreWrapper("setUserEmails", strArr);
            setUserEmails(AppsFlyerProperties.EmailsCryptType.NONE, strArr);
        }
        int i3 = setCustomerIdAndLogSession + 77;
        waitForCustomerUserId = i3 % 128;
        if ((i3 % 2 != 0 ? (char) 1 : '2') != 1) {
            return;
        }
        Object obj = null;
        super.hashCode();
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setUserEmails(AppsFlyerProperties.EmailsCryptType emailsCryptType, String... strArr) {
        ArrayList arrayList = new ArrayList(strArr.length + 1);
        arrayList.add(emailsCryptType.toString());
        arrayList.addAll(Arrays.asList(strArr));
        ak.AFInAppEventType().AFKeystoreWrapper("setUserEmails", (String[]) arrayList.toArray(new String[strArr.length + 1]));
        AppsFlyerProperties.getInstance().set(AppsFlyerProperties.EMAIL_CRYPT_TYPE, emailsCryptType.getValue());
        HashMap map = new HashMap();
        String str = null;
        ArrayList arrayList2 = new ArrayList();
        int length = strArr.length;
        int i = 0;
        while (true) {
            if (!(i >= length)) {
                int i2 = setCustomerIdAndLogSession + 57;
                waitForCustomerUserId = i2 % 128;
                int i3 = i2 % 2;
                String str2 = strArr[i];
                if (AnonymousClass9.values[emailsCryptType.ordinal()] != 2) {
                    arrayList2.add(ag.AFInAppEventParameterName(str2));
                    str = "sha256_el_arr";
                } else {
                    arrayList2.add(str2);
                    str = "plain_el_arr";
                }
                i++;
                int i4 = waitForCustomerUserId + 85;
                setCustomerIdAndLogSession = i4 % 128;
                int i5 = i4 % 2;
            } else {
                map.put(str, arrayList2);
                AppsFlyerProperties.getInstance().setUserEmails(new JSONObject(map).toString());
                return;
            }
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setCollectAndroidID(boolean z) {
        int i = waitForCustomerUserId + 67;
        setCustomerIdAndLogSession = i % 128;
        if (i % 2 != 0) {
            ak.AFInAppEventType().AFKeystoreWrapper("setCollectAndroidID", String.valueOf(z));
        } else {
            ak akVarAFInAppEventType = ak.AFInAppEventType();
            String[] strArr = new String[1];
            strArr[1] = String.valueOf(z);
            akVarAFInAppEventType.AFKeystoreWrapper("setCollectAndroidID", strArr);
        }
        values(AppsFlyerProperties.COLLECT_ANDROID_ID, Boolean.toString(z));
        values(AppsFlyerProperties.COLLECT_ANDROID_ID_FORCE_BY_USER, Boolean.toString(z));
        int i2 = setCustomerIdAndLogSession + 11;
        waitForCustomerUserId = i2 % 128;
        if (i2 % 2 == 0) {
            return;
        }
        Object[] objArr = null;
        int length = objArr.length;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setCollectIMEI(boolean z) {
        int i = setCustomerIdAndLogSession + 109;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        ak.AFInAppEventType().AFKeystoreWrapper("setCollectIMEI", String.valueOf(z));
        values(AppsFlyerProperties.COLLECT_IMEI, Boolean.toString(z));
        values(AppsFlyerProperties.COLLECT_IMEI_FORCE_BY_USER, Boolean.toString(z));
        int i3 = setCustomerIdAndLogSession + 91;
        waitForCustomerUserId = i3 % 128;
        int i4 = i3 % 2;
    }

    @Override // com.appsflyer.AppsFlyerLib
    @Deprecated
    public final void setCollectOaid(boolean z) {
        int i = waitForCustomerUserId + 65;
        setCustomerIdAndLogSession = i % 128;
        if ((i % 2 == 0 ? Typography.dollar : '9') != '9') {
            ak.AFInAppEventType().AFKeystoreWrapper("setCollectOaid", String.valueOf(z));
        } else {
            ak.AFInAppEventType().AFKeystoreWrapper("setCollectOaid", String.valueOf(z));
        }
        values(AppsFlyerProperties.COLLECT_OAID, Boolean.toString(z));
        int i2 = setCustomerIdAndLogSession + 21;
        waitForCustomerUserId = i2 % 128;
        if ((i2 % 2 != 0 ? Events.EQUAL : 'I') != 'I') {
            int i3 = 91 / 0;
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setResolveDeepLinkURLs(String... strArr) {
        int i = waitForCustomerUserId + 55;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        AFLogger.AFInAppEventParameterName(String.format("setResolveDeepLinkURLs %s", Arrays.toString(strArr)));
        f.AFKeystoreWrapper = strArr;
        int i3 = waitForCustomerUserId + 33;
        setCustomerIdAndLogSession = i3 % 128;
        int i4 = i3 % 2;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setOneLinkCustomDomain(String... strArr) {
        int i = waitForCustomerUserId + 5;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        AFLogger.AFInAppEventParameterName(String.format("setOneLinkCustomDomain %s", Arrays.toString(strArr)));
        f.AFLogger$LogLevel = strArr;
        int i3 = setCustomerIdAndLogSession + 89;
        waitForCustomerUserId = i3 % 128;
        int i4 = i3 % 2;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final AppsFlyerLib init(String str, AppsFlyerConversionListener appsFlyerConversionListener, Context context) {
        int i = setCustomerIdAndLogSession + 13;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        if ((this.AppsFlyerInAppPurchaseValidatorListener ? '.' : 'a') != 'a') {
            return this;
        }
        this.AppsFlyerInAppPurchaseValidatorListener = true;
        AppsFlyerProperties.getInstance().setDevKey(str);
        ai.AFInAppEventType(str);
        Object obj = null;
        if (context != null) {
            int i3 = waitForCustomerUserId + 113;
            setCustomerIdAndLogSession = i3 % 128;
            int i4 = i3 % 2;
            this.stop = (Application) context.getApplicationContext();
            bf bfVar = this.setCustomerUserId;
            if (context != null) {
                be beVar = bfVar.AFKeystoreWrapper;
                if (context != null) {
                    beVar.values = context.getApplicationContext();
                    int i5 = setCustomerIdAndLogSession + 87;
                    waitForCustomerUserId = i5 % 128;
                    int i6 = i5 % 2;
                }
            }
            values().getLevel().AFInAppEventType = System.currentTimeMillis();
            values().values().values(null);
            de deVarAFLogger$LogLevel = values().AFLogger$LogLevel();
            final cx cxVar = new cx(new Runnable() { // from class: com.appsflyer.internal.ac.1
                @Override // java.lang.Runnable
                public final void run() {
                    if (k.values == null) {
                        k.values = new k();
                    }
                    ac.valueOf(k.values.AFKeystoreWrapper(), new Runnable() { // from class: com.appsflyer.internal.ac.1.5
                        @Override // java.lang.Runnable
                        public final void run() {
                            try {
                                ci ciVar = new ci();
                                Application applicationAFInAppEventParameterName = ac.AFInAppEventParameterName(ac.this);
                                if (applicationAFInAppEventParameterName != null) {
                                    ciVar.AFKeystoreWrapper = (Application) applicationAFInAppEventParameterName.getApplicationContext();
                                }
                                if (ac.AFInAppEventParameterName(ac.this, ciVar, ac.AFInAppEventType(ac.AFInAppEventParameterName(ac.this)))) {
                                    ac.AFInAppEventParameterName(ac.this, ciVar);
                                }
                            } catch (Throwable th) {
                                AFLogger.valueOf(th.getMessage(), th);
                            }
                        }
                    }, 0L, TimeUnit.MILLISECONDS);
                }
            });
            Runnable runnable = new Runnable() { // from class: com.appsflyer.internal.ac.2
                @Override // java.lang.Runnable
                public final void run() {
                    SharedPreferences sharedPreferencesAFInAppEventType = ac.AFInAppEventType(ac.AFInAppEventParameterName(ac.this));
                    int iValueOf = ac.this.valueOf(sharedPreferencesAFInAppEventType, false);
                    boolean z = sharedPreferencesAFInAppEventType.getBoolean(AppsFlyerProperties.NEW_REFERRER_SENT, false);
                    boolean z2 = cxVar.AFInAppEventParameterName == dd.d.NOT_STARTED;
                    if (iValueOf == 1) {
                        if (z2 || z) {
                            ac acVar = ac.this;
                            ci ciVar = new ci();
                            Application applicationAFInAppEventParameterName = ac.AFInAppEventParameterName(ac.this);
                            if (applicationAFInAppEventParameterName != null) {
                                ciVar.AFKeystoreWrapper = (Application) applicationAFInAppEventParameterName.getApplicationContext();
                            }
                            ac.AFInAppEventParameterName(acVar, ciVar);
                        }
                    }
                }
            };
            deVarAFLogger$LogLevel.AFKeystoreWrapper(cxVar);
            deVarAFLogger$LogLevel.AFKeystoreWrapper(new cy(runnable));
            deVarAFLogger$LogLevel.AFKeystoreWrapper(new df(runnable));
            dd[] ddVarArrAFInAppEventType = deVarAFLogger$LogLevel.AFInAppEventType();
            int length = ddVarArrAFInAppEventType.length;
            int i7 = 0;
            while (true) {
                if ((i7 < length ? '9' : 'a') != '9') {
                    break;
                }
                int i8 = setCustomerIdAndLogSession + 19;
                waitForCustomerUserId = i8 % 128;
                if (!(i8 % 2 == 0)) {
                    ddVarArrAFInAppEventType[i7].AFInAppEventParameterName(this.stop);
                    i7 += 46;
                } else {
                    ddVarArrAFInAppEventType[i7].AFInAppEventParameterName(this.stop);
                    i7++;
                }
            }
            this.setCustomerUserId.init().values();
            ay.AFInAppEventParameterName = this.stop;
            if ((valueOf(AFInAppEventType(context), false) == 0 ? (char) 14 : '\t') != '\t' && Build.VERSION.SDK_INT >= 29) {
                dc dcVar = new dc(context);
                this.setAndroidIdData = dcVar;
                new Thread(dcVar.AFInAppEventParameterName).start();
            }
        } else {
            AFLogger.AppsFlyer2dXConversionCallback("context is null, Google Install Referrer will be not initialized");
        }
        ak akVarAFInAppEventType = ak.AFInAppEventType();
        String[] strArr = new String[2];
        strArr[0] = str;
        strArr[1] = !(appsFlyerConversionListener != null) ? "null" : "conversionDataListener";
        akVarAFInAppEventType.AFKeystoreWrapper("init", strArr);
        AFLogger.AFInAppEventType(String.format("Initializing AppsFlyer SDK: (v%s.%s)", "6.5.4", valueOf));
        AFKeystoreWrapper = appsFlyerConversionListener;
        int i9 = waitForCustomerUserId + 7;
        setCustomerIdAndLogSession = i9 % 128;
        if (i9 % 2 != 0) {
            return this;
        }
        super.hashCode();
        return this;
    }

    private void valueOf(Context context) {
        this.updateServerUninstallToken = new HashMap();
        final long jCurrentTimeMillis = System.currentTimeMillis();
        final l.d dVar = new l.d() { // from class: com.appsflyer.internal.ac.3
            @Override // com.appsflyer.internal.l.d
            public final void valueOf(String str, String str2, String str3) {
                if (str != null) {
                    AFLogger.values("Facebook Deferred AppLink data received: ".concat(String.valueOf(str)));
                    ac.AFKeystoreWrapper(ac.this).put("link", str);
                    if (str2 != null) {
                        ac.AFKeystoreWrapper(ac.this).put("target_url", str2);
                    }
                    if (str3 != null) {
                        HashMap map = new HashMap();
                        HashMap map2 = new HashMap();
                        map2.put(ShareConstants.PROMO_CODE, str3);
                        map.put(ShareConstants.DEEPLINK_CONTEXT, map2);
                        ac.AFKeystoreWrapper(ac.this).put("extras", map);
                    }
                } else {
                    ac.AFKeystoreWrapper(ac.this).put("link", "");
                }
                ac.AFKeystoreWrapper(ac.this).put("ttr", String.valueOf(System.currentTimeMillis() - jCurrentTimeMillis));
            }

            @Override // com.appsflyer.internal.l.d
            public final void values(String str) {
                ac.AFKeystoreWrapper(ac.this).put("error", str);
            }
        };
        try {
            Class.forName("com.facebook.FacebookSdk").getMethod("sdkInitialize", Context.class).invoke(null, context);
            final Class<?> cls = Class.forName("com.facebook.applinks.AppLinkData");
            Class<?> cls2 = Class.forName("com.facebook.applinks.AppLinkData$CompletionHandler");
            Method method = cls.getMethod("fetchDeferredAppLinkData", Context.class, String.class, cls2);
            Object objNewProxyInstance = Proxy.newProxyInstance(cls2.getClassLoader(), new Class[]{cls2}, new InvocationHandler() { // from class: com.appsflyer.internal.l.5
                private /* synthetic */ Class valueOf;
                private /* synthetic */ d values;

                AnonymousClass5(final Class cls3, final d dVar2) {
                    cls = cls3;
                    dVar = dVar2;
                }

                @Override // java.lang.reflect.InvocationHandler
                public final Object invoke(Object obj, Method method2, Object[] objArr) throws Throwable {
                    String string;
                    String string2;
                    String string3;
                    Bundle bundle;
                    if (method2.getName().equals("onDeferredAppLinkDataFetched")) {
                        if (objArr[0] != null) {
                            Bundle bundle2 = (Bundle) Bundle.class.cast(cls.getMethod("getArgumentBundle", new Class[0]).invoke(cls.cast(objArr[0]), new Object[0]));
                            if (bundle2 != null) {
                                string2 = bundle2.getString("com.facebook.platform.APPLINK_NATIVE_URL");
                                string3 = bundle2.getString("target_url");
                                Bundle bundle3 = bundle2.getBundle("extras");
                                string = (bundle3 == null || (bundle = bundle3.getBundle(ShareConstants.DEEPLINK_CONTEXT)) == null) ? null : bundle.getString(ShareConstants.PROMO_CODE);
                            } else {
                                string = null;
                                string2 = null;
                                string3 = null;
                            }
                            d dVar2 = dVar;
                            if (dVar2 != null) {
                                dVar2.valueOf(string2, string3, string);
                            }
                        } else {
                            d dVar3 = dVar;
                            if (dVar3 != null) {
                                dVar3.valueOf(null, null, null);
                            }
                        }
                        return null;
                    }
                    d dVar4 = dVar;
                    if (dVar4 != null) {
                        dVar4.values("onDeferredAppLinkDataFetched invocation failed");
                    }
                    return null;
                }
            });
            String string = context.getString(context.getResources().getIdentifier("facebook_app_id", "string", context.getPackageName()));
            if ((TextUtils.isEmpty(string) ? (char) 11 : (char) 6) != 11) {
                method.invoke(null, context, string, objNewProxyInstance);
                return;
            }
            int i = setCustomerIdAndLogSession + 119;
            waitForCustomerUserId = i % 128;
            int i2 = i % 2;
            dVar2.values("Facebook app id not defined in resources");
            int i3 = setCustomerIdAndLogSession + 87;
            waitForCustomerUserId = i3 % 128;
            int i4 = i3 % 2;
        } catch (ClassNotFoundException e2) {
            dVar2.values(e2.toString());
        } catch (IllegalAccessException e3) {
            dVar2.values(e3.toString());
        } catch (NoSuchMethodException e4) {
            dVar2.values(e4.toString());
        } catch (InvocationTargetException e5) {
            dVar2.values(e5.toString());
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void enableFacebookDeferredApplinks(boolean z) {
        int i = setCustomerIdAndLogSession;
        int i2 = i + 85;
        waitForCustomerUserId = i2 % 128;
        int i3 = i2 % 2;
        this.setDebugLog = z;
        int i4 = i + 111;
        waitForCustomerUserId = i4 % 128;
        if ((i4 % 2 != 0 ? (char) 6 : '@') != 6) {
            return;
        }
        int i5 = 73 / 0;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void start(Context context) {
        int i = waitForCustomerUserId + 117;
        setCustomerIdAndLogSession = i % 128;
        char c = i % 2 == 0 ? 'P' : (char) 4;
        Object obj = null;
        start(context, null);
        if (c == 'P') {
            super.hashCode();
        }
        int i2 = setCustomerIdAndLogSession + 35;
        waitForCustomerUserId = i2 % 128;
        if ((i2 % 2 != 0 ? 'N' : (char) 23) != 23) {
            super.hashCode();
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void start(Context context, String str) {
        int i = waitForCustomerUserId + 75;
        setCustomerIdAndLogSession = i % 128;
        boolean z = i % 2 != 0;
        start(context, str, null);
        if (!z) {
            int i2 = 95 / 0;
        }
        int i3 = setCustomerIdAndLogSession + 79;
        waitForCustomerUserId = i3 % 128;
        int i4 = i3 % 2;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void start(Context context, final String str, final AppsFlyerRequestListener appsFlyerRequestListener) {
        if (ah.AFInAppEventParameterName != null) {
            return;
        }
        if (!this.AppsFlyerInAppPurchaseValidatorListener) {
            AFLogger.AppsFlyer2dXConversionCallback("ERROR: AppsFlyer SDK is not initialized! The API call 'start()' must be called after the 'init(String, AppsFlyerConversionListener)' API method, which should be called on the Application's onCreate.");
            if (str == null) {
                if (appsFlyerRequestListener != null) {
                    appsFlyerRequestListener.onError(RequestError.NO_DEV_KEY, ba.AFInAppEventParameterName);
                    return;
                }
                return;
            }
        }
        bf bfVar = this.setCustomerUserId;
        if (context != null) {
            be beVar = bfVar.AFKeystoreWrapper;
            if (context != null) {
                int i = waitForCustomerUserId + 125;
                setCustomerIdAndLogSession = i % 128;
                int i2 = i % 2;
                beVar.values = context.getApplicationContext();
            }
        }
        final cl level = values().getLevel();
        level.valueOf(n.AFInAppEventParameterName(context));
        this.stop = (Application) context.getApplicationContext();
        ak.AFInAppEventType().AFKeystoreWrapper("start", str);
        String str2 = valueOf;
        AFLogger.values(String.format("Starting AppsFlyer: (v%s.%s)", "6.5.4", str2));
        StringBuilder sb = new StringBuilder("Build Number: ");
        sb.append(str2);
        AFLogger.values(sb.toString());
        AppsFlyerProperties.getInstance().loadProperties(this.stop.getApplicationContext());
        Object obj = null;
        if (!TextUtils.isEmpty(str)) {
            AppsFlyerProperties.getInstance().setDevKey(str);
            ai.AFInAppEventType(str);
        } else if (TextUtils.isEmpty(AppsFlyerProperties.getInstance().getDevKey())) {
            int i3 = setCustomerIdAndLogSession + 33;
            waitForCustomerUserId = i3 % 128;
            int i4 = i3 % 2;
            AFLogger.AppsFlyer2dXConversionCallback("ERROR: AppsFlyer SDK is not initialized! You must provide AppsFlyer Dev-Key either in the 'init' API method (should be called on Application's onCreate),or in the start() API (should be called on Activity's onCreate).");
            if (!(appsFlyerRequestListener != null)) {
                return;
            }
            int i5 = waitForCustomerUserId + 35;
            setCustomerIdAndLogSession = i5 % 128;
            if (i5 % 2 != 0) {
                appsFlyerRequestListener.onError(RequestError.NO_DEV_KEY, ba.AFInAppEventParameterName);
                return;
            } else {
                appsFlyerRequestListener.onError(RequestError.NO_DEV_KEY, ba.AFInAppEventParameterName);
                super.hashCode();
                return;
            }
        }
        values().values().values(null);
        AppsFlyer2dXConversionCallback(this.stop.getBaseContext());
        if (this.setDebugLog) {
            valueOf(this.stop.getApplicationContext());
        }
        ah.AFKeystoreWrapper(context, new ah.e() { // from class: com.appsflyer.internal.ac.5
            @Override // com.appsflyer.internal.ah.e
            public final void valueOf(Activity activity) {
                level.AFKeystoreWrapper();
                ac.this.values().values().values(null);
                int iValueOf = ac.this.valueOf(ac.AFInAppEventType(activity), false);
                AFLogger.values("onBecameForeground");
                if (iValueOf < 2) {
                    w wVarAFKeystoreWrapper = w.AFKeystoreWrapper(activity);
                    wVarAFKeystoreWrapper.AFKeystoreWrapper.post(wVarAFKeystoreWrapper.getLevel);
                    wVarAFKeystoreWrapper.AFKeystoreWrapper.post(wVarAFKeystoreWrapper.AFInAppEventParameterName);
                }
                cp cpVar = new cp();
                f.valueOf().valueOf(cpVar.values(), level, activity.getIntent(), ac.this.values().AFInAppEventParameterName(), activity.getApplication());
                ac acVar = ac.this;
                if (activity != null) {
                    cpVar.AFKeystoreWrapper = (Application) activity.getApplicationContext();
                }
                cpVar.AFVersionDeclaration = str;
                cpVar.AFInAppEventParameterName = appsFlyerRequestListener;
                acVar.AFKeystoreWrapper(cpVar, activity);
            }

            @Override // com.appsflyer.internal.ah.e
            public final void valueOf(Context context2) {
                AFLogger.values("onBecameBackground");
                cl clVar = level;
                long jCurrentTimeMillis = System.currentTimeMillis();
                if (clVar.AppsFlyer2dXConversionCallback != 0) {
                    long j = jCurrentTimeMillis - clVar.AppsFlyer2dXConversionCallback;
                    if (j > 0 && j < 1000) {
                        j = 1000;
                    }
                    clVar.onDeepLinkingNative = TimeUnit.MILLISECONDS.toSeconds(j);
                    clVar.valueOf.AFKeystoreWrapper("prev_session_dur", clVar.onDeepLinkingNative);
                } else {
                    AFLogger.values("Metrics: fg ts is missing");
                }
                AFLogger.values("callStatsBackground background call");
                ac.this.AFInAppEventParameterName(new WeakReference<>(context2));
                ak akVarAFInAppEventType = ak.AFInAppEventType();
                if (akVarAFInAppEventType.AFVersionDeclaration()) {
                    akVarAFInAppEventType.AFInAppEventParameterName();
                    if (context2 != null && !AppsFlyerLib.getInstance().isStopped()) {
                        akVarAFInAppEventType.AFInAppEventType(context2.getPackageName(), context2.getPackageManager());
                    }
                    akVarAFInAppEventType.values();
                } else {
                    AFLogger.AFInAppEventParameterName("RD status is OFF");
                }
                if (k.values == null) {
                    k.values = new k();
                }
                k kVar = k.values;
                try {
                    k.valueOf(kVar.AFKeystoreWrapper);
                    if (kVar.AFInAppEventParameterName instanceof ThreadPoolExecutor) {
                        k.valueOf((ThreadPoolExecutor) kVar.AFInAppEventParameterName);
                    }
                } catch (Throwable th) {
                    AFLogger.valueOf("failed to stop Executors", th);
                }
                w wVarAFKeystoreWrapper = w.AFKeystoreWrapper(context2);
                wVarAFKeystoreWrapper.AFKeystoreWrapper.post(wVarAFKeystoreWrapper.getLevel);
            }
        }, this.setOaidData);
        int i6 = waitForCustomerUserId + 115;
        setCustomerIdAndLogSession = i6 % 128;
        if ((i6 % 2 == 0 ? 'F' : (char) 22) != 'F') {
            return;
        }
        int i7 = 6 / 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0059 A[Catch: Exception -> 0x0079, TryCatch #1 {Exception -> 0x0079, blocks: (B:8:0x0016, B:16:0x0046, B:18:0x0059, B:20:0x005f, B:14:0x0033), top: B:36:0x0014 }] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x005f A[Catch: Exception -> 0x0079, TRY_LEAVE, TryCatch #1 {Exception -> 0x0079, blocks: (B:8:0x0016, B:16:0x0046, B:18:0x0059, B:20:0x005f, B:14:0x0033), top: B:36:0x0014 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void AppsFlyer2dXConversionCallback(android.content.Context r5) {
        /*
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 79
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
            r1 = 1
            r2 = 0
            if (r0 != 0) goto L10
            r0 = 1
            goto L11
        L10:
            r0 = 0
        L11:
            r3 = 32768(0x8000, float:4.5918E-41)
            if (r0 == 0) goto L33
            android.content.pm.PackageManager r0 = r5.getPackageManager()     // Catch: java.lang.Exception -> L79
            java.lang.String r4 = r5.getPackageName()     // Catch: java.lang.Exception -> L79
            android.content.pm.PackageInfo r0 = r0.getPackageInfo(r4, r2)     // Catch: java.lang.Exception -> L79
            android.content.pm.ApplicationInfo r0 = r0.applicationInfo     // Catch: java.lang.Exception -> L79
            int r0 = r0.flags     // Catch: java.lang.Exception -> L79
            r0 = r0 & r3
            r3 = 98
            if (r0 == 0) goto L2e
            r0 = 75
            goto L30
        L2e:
            r0 = 98
        L30:
            if (r0 == r3) goto L64
            goto L46
        L33:
            android.content.pm.PackageManager r0 = r5.getPackageManager()     // Catch: java.lang.Exception -> L79
            java.lang.String r4 = r5.getPackageName()     // Catch: java.lang.Exception -> L79
            android.content.pm.PackageInfo r0 = r0.getPackageInfo(r4, r2)     // Catch: java.lang.Exception -> L79
            android.content.pm.ApplicationInfo r0 = r0.applicationInfo     // Catch: java.lang.Exception -> L79
            int r0 = r0.flags     // Catch: java.lang.Exception -> L79
            r0 = r0 & r3
            if (r0 == 0) goto L64
        L46:
            android.content.res.Resources r0 = r5.getResources()     // Catch: java.lang.Exception -> L79
            java.lang.String r3 = "appsflyer_backup_rules"
            java.lang.String r4 = "xml"
            java.lang.String r5 = r5.getPackageName()     // Catch: java.lang.Exception -> L79
            int r5 = r0.getIdentifier(r3, r4, r5)     // Catch: java.lang.Exception -> L79
            if (r5 == 0) goto L5f
            java.lang.String r5 = "appsflyer_backup_rules.xml detected, using AppsFlyer defined backup rules for AppsFlyer SDK data"
            com.appsflyer.AFLogger.values(r5, r1)     // Catch: java.lang.Exception -> L79
            return
        L5f:
            java.lang.String r5 = "'allowBackup' is set to true; appsflyer_backup_rules.xml not detected.\nAppsFlyer shared preferences should be excluded from auto backup by adding: <exclude domain=\"sharedpref\" path=\"appsflyer-data\"/> to the Application's <full-backup-content> rules"
            com.appsflyer.AFLogger.valueOf(r5)     // Catch: java.lang.Exception -> L79
        L64:
            int r5 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r5 = r5 + 13
            int r0 = r5 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r0
            int r5 = r5 % 2
            if (r5 != 0) goto L71
            r1 = 0
        L71:
            if (r1 == 0) goto L74
            return
        L74:
            r5 = 0
            int r5 = r5.length     // Catch: java.lang.Throwable -> L77
            return
        L77:
            r5 = move-exception
            throw r5
        L79:
            r5 = move-exception
            java.lang.String r5 = java.lang.String.valueOf(r5)
            java.lang.String r0 = "checkBackupRules Exception: "
            java.lang.String r5 = r0.concat(r5)
            com.appsflyer.AFLogger.AFKeystoreWrapper(r5)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.AppsFlyer2dXConversionCallback(android.content.Context):void");
    }

    private static void getLevel(Context context) {
        int i;
        if (z.valueOf()) {
            i = 23;
            AFLogger.AFKeystoreWrapper("OPPO device found");
        } else {
            i = 18;
        }
        if (Build.VERSION.SDK_INT >= i && !AFKeystoreWrapper(AppsFlyerProperties.DISABLE_KEYSTORE, true)) {
            StringBuilder sb = new StringBuilder("OS SDK is=");
            sb.append(Build.VERSION.SDK_INT);
            sb.append("; use KeyStore");
            AFLogger.AFKeystoreWrapper(sb.toString());
            AFKeystoreWrapper aFKeystoreWrapper = new AFKeystoreWrapper(context);
            if (!aFKeystoreWrapper.AFKeystoreWrapper()) {
                aFKeystoreWrapper.values = af.valueOf(new WeakReference(context));
                aFKeystoreWrapper.AFInAppEventType = 0;
                aFKeystoreWrapper.AFKeystoreWrapper(aFKeystoreWrapper.valueOf());
            } else {
                String strValueOf = aFKeystoreWrapper.valueOf();
                synchronized (aFKeystoreWrapper.AFInAppEventParameterName) {
                    aFKeystoreWrapper.AFInAppEventType++;
                    AFLogger.values("Deleting key with alias: ".concat(String.valueOf(strValueOf)));
                    try {
                        synchronized (aFKeystoreWrapper.AFInAppEventParameterName) {
                            aFKeystoreWrapper.valueOf.deleteEntry(strValueOf);
                        }
                    } catch (KeyStoreException e2) {
                        StringBuilder sb2 = new StringBuilder("Exception ");
                        sb2.append(e2.getMessage());
                        sb2.append(" occurred");
                        AFLogger.valueOf(sb2.toString(), e2);
                    }
                }
                aFKeystoreWrapper.AFKeystoreWrapper(aFKeystoreWrapper.valueOf());
            }
            values("KSAppsFlyerId", aFKeystoreWrapper.values());
            values("KSAppsFlyerRICounter", String.valueOf(aFKeystoreWrapper.AFInAppEventType()));
            return;
        }
        StringBuilder sb3 = new StringBuilder("OS SDK is=");
        sb3.append(Build.VERSION.SDK_INT);
        sb3.append("; no KeyStore usage");
        AFLogger.AFKeystoreWrapper(sb3.toString());
    }

    public static String AFInAppEventType() {
        int i = waitForCustomerUserId + 15;
        setCustomerIdAndLogSession = i % 128;
        if ((i % 2 == 0 ? (char) 21 : '6') == '6') {
            return AFInAppEventParameterName(AppsFlyerProperties.APP_USER_ID);
        }
        int i2 = 55 / 0;
        return AFInAppEventParameterName(AppsFlyerProperties.APP_USER_ID);
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setCustomerUserId(String str) {
        int i = waitForCustomerUserId + 51;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        ak.AFInAppEventType().AFKeystoreWrapper("setCustomerUserId", str);
        AFLogger.values("setCustomerUserId = ".concat(String.valueOf(str)));
        values(AppsFlyerProperties.APP_USER_ID, str);
        values(AppsFlyerProperties.AF_WAITFOR_CUSTOMERID, false);
        int i3 = setCustomerIdAndLogSession + 77;
        waitForCustomerUserId = i3 % 128;
        int i4 = i3 % 2;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setPhoneNumber(String str) {
        int i = waitForCustomerUserId + 107;
        setCustomerIdAndLogSession = i % 128;
        boolean z = i % 2 == 0;
        this.onPause = ag.AFInAppEventParameterName(str);
        if (z) {
            Object obj = null;
            super.hashCode();
        }
        int i2 = waitForCustomerUserId + 107;
        setCustomerIdAndLogSession = i2 % 128;
        int i3 = i2 % 2;
    }

    private static String init() {
        int i = waitForCustomerUserId + 71;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        String strAFInAppEventParameterName = AFInAppEventParameterName(AppsFlyerProperties.APP_ID);
        int i3 = setCustomerIdAndLogSession + 107;
        waitForCustomerUserId = i3 % 128;
        if ((i3 % 2 != 0 ? 'A' : 'W') == 'W') {
            return strAFInAppEventParameterName;
        }
        Object[] objArr = null;
        int length = objArr.length;
        return strAFInAppEventParameterName;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setAppId(String str) {
        int i = waitForCustomerUserId + 49;
        setCustomerIdAndLogSession = i % 128;
        if ((i % 2 == 0 ? (char) 29 : 'A') != 'A') {
            ak.AFInAppEventType().AFKeystoreWrapper("setAppId", str);
        } else {
            ak.AFInAppEventType().AFKeystoreWrapper("setAppId", str);
        }
        values(AppsFlyerProperties.APP_ID, str);
        int i2 = setCustomerIdAndLogSession + 31;
        waitForCustomerUserId = i2 % 128;
        if ((i2 % 2 != 0 ? '`' : '@') != '@') {
            int i3 = 82 / 0;
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setExtension(String str) {
        int i = waitForCustomerUserId + 87;
        setCustomerIdAndLogSession = i % 128;
        if (!(i % 2 != 0)) {
            ak.AFInAppEventType().AFKeystoreWrapper("setExtension", str);
        } else {
            ak.AFInAppEventType().AFKeystoreWrapper("setExtension", str);
        }
        AppsFlyerProperties.getInstance().set(AppsFlyerProperties.EXTENSION, str);
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setIsUpdate(boolean z) {
        int i = setCustomerIdAndLogSession + 77;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        ak.AFInAppEventType().AFKeystoreWrapper("setIsUpdate", String.valueOf(z));
        AppsFlyerProperties.getInstance().set(AppsFlyerProperties.IS_UPDATE, z);
        int i3 = setCustomerIdAndLogSession + 3;
        waitForCustomerUserId = i3 % 128;
        if ((i3 % 2 != 0 ? (char) 23 : (char) 11) != 23) {
            return;
        }
        int i4 = 85 / 0;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setCurrencyCode(String str) {
        int i = setCustomerIdAndLogSession + 29;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        ak.AFInAppEventType().AFKeystoreWrapper("setCurrencyCode", str);
        AppsFlyerProperties.getInstance().set(AppsFlyerProperties.CURRENCY_CODE, str);
        int i3 = setCustomerIdAndLogSession + 35;
        waitForCustomerUserId = i3 % 128;
        if ((i3 % 2 != 0 ? 'S' : (char) 17) != 17) {
            Object[] objArr = null;
            int length = objArr.length;
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void logLocation(Context context, double d2, double d3) {
        ak.AFInAppEventType().AFKeystoreWrapper("logLocation", String.valueOf(d2), String.valueOf(d3));
        HashMap map = new HashMap();
        map.put(AFInAppEventParameterName.LONGTITUDE, Double.toString(d3));
        map.put(AFInAppEventParameterName.LATITUDE, Double.toString(d2));
        AFInAppEventParameterName(context, AFInAppEventType.LOCATION_COORDINATES, map);
        int i = setCustomerIdAndLogSession + 65;
        waitForCustomerUserId = i % 128;
        if (!(i % 2 == 0)) {
            Object obj = null;
            super.hashCode();
        }
    }

    final void AFInAppEventParameterName(WeakReference<Context> weakReference) {
        if (weakReference.get() == null) {
            return;
        }
        AFLogger.values("app went to background");
        SharedPreferences sharedPreferencesAFInAppEventType = AFInAppEventType(weakReference.get());
        AppsFlyerProperties.getInstance().saveProperties(sharedPreferencesAFInAppEventType);
        long j = values().getLevel().onDeepLinkingNative;
        HashMap map = new HashMap();
        String devKey = AppsFlyerProperties.getInstance().getDevKey();
        if (devKey == null) {
            AFLogger.AppsFlyer2dXConversionCallback("[callStats] AppsFlyer's SDK cannot send any event without providing DevKey.");
            return;
        }
        String strAFInAppEventParameterName = AFInAppEventParameterName("KSAppsFlyerId");
        if ((AppsFlyerProperties.getInstance().getBoolean(AppsFlyerProperties.DEVICE_TRACKING_DISABLED, false) ? 'Y' : '2') == 'Y') {
            map.put(AppsFlyerProperties.DEVICE_TRACKING_DISABLED, ServerProtocol.DIALOG_RETURN_SCOPES_TRUE);
        }
        g gVarAFInAppEventType = ab.AFInAppEventType(weakReference.get().getContentResolver());
        if ((gVarAFInAppEventType != null ? '_' : '-') == '_') {
            int i = setCustomerIdAndLogSession + 5;
            waitForCustomerUserId = i % 128;
            int i2 = i % 2;
            map.put("amazon_aid", gVarAFInAppEventType.values);
            map.put("amazon_aid_limit", String.valueOf(gVarAFInAppEventType.AFKeystoreWrapper));
            int i3 = setCustomerIdAndLogSession + 51;
            waitForCustomerUserId = i3 % 128;
            int i4 = i3 % 2;
        }
        String string = AppsFlyerProperties.getInstance().getString("advertiserId");
        if (!(string == null)) {
            int i5 = waitForCustomerUserId + 41;
            setCustomerIdAndLogSession = i5 % 128;
            if (i5 % 2 == 0) {
                map.put("advertiserId", string);
                Object obj = null;
                super.hashCode();
            } else {
                map.put("advertiserId", string);
            }
            int i6 = setCustomerIdAndLogSession + 1;
            waitForCustomerUserId = i6 % 128;
            int i7 = i6 % 2;
        }
        map.put("app_id", weakReference.get().getPackageName());
        map.put("devkey", devKey);
        map.put(ProfileTable.Columns.COLUMN_UID, af.valueOf(weakReference));
        map.put("time_in_app", String.valueOf(j));
        map.put("statType", "user_closed_app");
        map.put("platform", Constants.JAVASCRIPT_INTERFACE_NAME);
        map.put("launch_counter", Integer.toString(valueOf(sharedPreferencesAFInAppEventType, false)));
        map.put(AppsFlyerProperties.CHANNEL, AFInAppEventParameterName(weakReference.get()));
        if ((strAFInAppEventParameterName != null ? 'A' : (char) 31) == 31) {
            strAFInAppEventParameterName = "";
        }
        map.put("originalAppsflyerId", strAFInAppEventParameterName);
        if (!this.onValidateInApp) {
            AFLogger.AFInAppEventParameterName("Stats call is disabled, ignore ...");
            return;
        }
        try {
            AFLogger.AFInAppEventParameterName("Running callStats task");
            cv cvVar = new cv();
            cvVar.onConversionDataSuccess = isStopped();
            new Thread(new an.c((cm) cvVar.AFInAppEventParameterName(map).AFInAppEventType(String.format(AFLogger$LogLevel, AppsFlyerLib.getInstance().getHostPrefix(), AFInAppEventParameterName().getHostName())))).start();
        } catch (Throwable th) {
            AFLogger.valueOf("Could not send callStats request", th);
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void logSession(Context context) {
        int i = waitForCustomerUserId + 51;
        setCustomerIdAndLogSession = i % 128;
        if (!(i % 2 != 0)) {
            ak.AFInAppEventType().AFKeystoreWrapper("logSession", new String[1]);
        } else {
            ak.AFInAppEventType().AFKeystoreWrapper("logSession", new String[0]);
        }
        ak.AFInAppEventType().getLevel();
        AFInAppEventParameterName(context, ch.logSession);
        AFInAppEventParameterName(context, (String) null, (Map<String, Object>) null);
    }

    private void AFInAppEventParameterName(Context context, ch chVar) {
        int i = setCustomerIdAndLogSession + 95;
        int i2 = i % 128;
        waitForCustomerUserId = i2;
        int i3 = i % 2;
        bf bfVar = this.setCustomerUserId;
        if (context != null) {
            int i4 = i2 + 19;
            setCustomerIdAndLogSession = i4 % 128;
            int i5 = i4 % 2;
            be beVar = bfVar.AFKeystoreWrapper;
            if (context != null) {
                beVar.values = context.getApplicationContext();
            }
        }
        cl level = values().getLevel();
        cj cjVarAFInAppEventParameterName = n.AFInAppEventParameterName(context);
        if ((level.AFInAppEventType() ? '8' : 'A') != 'A') {
            level.AFInAppEventParameterName.put("api_name", chVar.toString());
            level.valueOf(cjVarAFInAppEventParameterName);
            int i6 = waitForCustomerUserId + 123;
            setCustomerIdAndLogSession = i6 % 128;
            int i7 = i6 % 2;
        }
        level.AFKeystoreWrapper();
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void logEvent(Context context, String str, Map<String, Object> map) {
        int i = setCustomerIdAndLogSession + 69;
        waitForCustomerUserId = i % 128;
        boolean z = i % 2 != 0;
        Object[] objArr = null;
        logEvent(context, str, map, null);
        if (z) {
            int i2 = 16 / 0;
        }
        int i3 = setCustomerIdAndLogSession + 61;
        waitForCustomerUserId = i3 % 128;
        if ((i3 % 2 != 0 ? 'U' : (char) 26) != 'U') {
            return;
        }
        int length = objArr.length;
    }

    private void AFInAppEventParameterName(Context context, String str, Map<String, Object> map) {
        co coVar = new co();
        Activity activity = null;
        if (context != null) {
            int i = waitForCustomerUserId + 119;
            setCustomerIdAndLogSession = i % 128;
            if (i % 2 == 0) {
                coVar.AFKeystoreWrapper = (Application) context.getApplicationContext();
                super.hashCode();
            } else {
                coVar.AFKeystoreWrapper = (Application) context.getApplicationContext();
            }
        }
        coVar.getLevel = str;
        coVar.values = map;
        if (!(context instanceof Activity)) {
            int i2 = waitForCustomerUserId + 35;
            setCustomerIdAndLogSession = i2 % 128;
            int i3 = i2 % 2;
        } else {
            int i4 = setCustomerIdAndLogSession + 73;
            waitForCustomerUserId = i4 % 128;
            if (i4 % 2 != 0) {
                Activity activity2 = (Activity) context;
                super.hashCode();
                activity = activity2;
            } else {
                activity = (Activity) context;
            }
        }
        AFKeystoreWrapper(coVar, activity);
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void anonymizeUser(boolean z) {
        int i = setCustomerIdAndLogSession + 117;
        waitForCustomerUserId = i % 128;
        if (i % 2 != 0) {
            ak akVarAFInAppEventType = ak.AFInAppEventType();
            String[] strArr = new String[1];
            strArr[1] = String.valueOf(z);
            akVarAFInAppEventType.AFKeystoreWrapper("anonymizeUser", strArr);
        } else {
            ak.AFInAppEventType().AFKeystoreWrapper("anonymizeUser", String.valueOf(z));
        }
        AppsFlyerProperties.getInstance().set(AppsFlyerProperties.DEVICE_TRACKING_DISABLED, z);
        int i2 = waitForCustomerUserId + 75;
        setCustomerIdAndLogSession = i2 % 128;
        if (!(i2 % 2 != 0)) {
            Object[] objArr = null;
            int length = objArr.length;
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void registerConversionListener(Context context, AppsFlyerConversionListener appsFlyerConversionListener) {
        int i = setCustomerIdAndLogSession + 39;
        waitForCustomerUserId = i % 128;
        if ((i % 2 != 0 ? (char) 26 : (char) 17) != 26) {
            ak.AFInAppEventType().AFKeystoreWrapper("registerConversionListener", new String[0]);
        } else {
            ak.AFInAppEventType().AFKeystoreWrapper("registerConversionListener", new String[0]);
        }
        values(appsFlyerConversionListener);
        int i2 = waitForCustomerUserId + 73;
        setCustomerIdAndLogSession = i2 % 128;
        int i3 = i2 % 2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0019, code lost:
    
        if (r4 == null) goto L14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x001b, code lost:
    
        r0 = r0 + 91;
        com.appsflyer.internal.ac.waitForCustomerUserId = r0 % 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0025, code lost:
    
        if ((r0 % 2) == 0) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0027, code lost:
    
        r0 = '1';
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x002a, code lost:
    
        r0 = '-';
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x002c, code lost:
    
        if (r0 == '-') goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x002e, code lost:
    
        super.hashCode();
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0031, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0034, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0035, code lost:
    
        com.appsflyer.internal.ac.AFKeystoreWrapper = r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0037, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x0014, code lost:
    
        if (r4 == null) goto L14;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void values(com.appsflyer.AppsFlyerConversionListener r4) {
        /*
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r1 = r0 + 61
            int r2 = r1 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r2
            int r1 = r1 % 2
            r2 = 1
            if (r1 == 0) goto Lf
            r1 = 0
            goto L10
        Lf:
            r1 = 1
        L10:
            r3 = 0
            if (r1 == r2) goto L19
            int r1 = r3.length     // Catch: java.lang.Throwable -> L17
            if (r4 != 0) goto L35
            goto L1b
        L17:
            r4 = move-exception
            throw r4
        L19:
            if (r4 != 0) goto L35
        L1b:
            int r0 = r0 + 91
            int r4 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r4
            int r0 = r0 % 2
            r4 = 45
            if (r0 == 0) goto L2a
            r0 = 49
            goto L2c
        L2a:
            r0 = 45
        L2c:
            if (r0 == r4) goto L34
            super.hashCode()     // Catch: java.lang.Throwable -> L32
            return
        L32:
            r4 = move-exception
            throw r4
        L34:
            return
        L35:
            com.appsflyer.internal.ac.AFKeystoreWrapper = r4
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.values(com.appsflyer.AppsFlyerConversionListener):void");
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void unregisterConversionListener() {
        int i = setCustomerIdAndLogSession + 105;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        ak.AFInAppEventType().AFKeystoreWrapper("unregisterConversionListener", new String[0]);
        AFKeystoreWrapper = null;
        int i3 = waitForCustomerUserId + 111;
        setCustomerIdAndLogSession = i3 % 128;
        int i4 = i3 % 2;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void registerValidatorListener(Context context, AppsFlyerInAppPurchaseValidatorListener appsFlyerInAppPurchaseValidatorListener) {
        int i = waitForCustomerUserId + 97;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        ak.AFInAppEventType().AFKeystoreWrapper("registerValidatorListener", new String[0]);
        AFLogger.AFInAppEventParameterName("registerValidatorListener called");
        if ((appsFlyerInAppPurchaseValidatorListener == null ? (char) 7 : '\n') == 7) {
            int i3 = waitForCustomerUserId + 67;
            setCustomerIdAndLogSession = i3 % 128;
            char c = i3 % 2 == 0 ? 'O' : 'D';
            AFLogger.AFInAppEventParameterName("registerValidatorListener null listener");
            if (c != 'O') {
                return;
            }
            int i4 = 69 / 0;
            return;
        }
        AFInAppEventParameterName = appsFlyerInAppPurchaseValidatorListener;
    }

    public static String valueOf(SimpleDateFormat simpleDateFormat, long j) {
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        String str = simpleDateFormat.format(new Date(j));
        int i = setCustomerIdAndLogSession + 19;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        return str;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x002a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void AFInAppEventParameterName(android.content.Context r4, java.lang.String r5, java.lang.String r6, java.util.Map<java.lang.String, java.lang.Object> r7, java.lang.String r8, java.lang.String r9) {
        /*
            r3 = this;
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r1 = r0 + 105
            int r2 = r1 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r2
            int r1 = r1 % 2
            if (r6 == 0) goto Le
            r1 = 1
            goto Lf
        Le:
            r1 = 0
        Lf:
            if (r1 == 0) goto L2a
            int r0 = r0 + 57
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
            java.lang.String r0 = r6.trim()
            boolean r0 = r0.isEmpty()
            if (r0 == 0) goto L24
            goto L2a
        L24:
            com.appsflyer.internal.co r0 = new com.appsflyer.internal.co
            r0.<init>()
            goto L2f
        L2a:
            com.appsflyer.internal.cp r0 = new com.appsflyer.internal.cp
            r0.<init>()
        L2f:
            r1 = 95
            if (r4 == 0) goto L36
            r2 = 9
            goto L38
        L36:
            r2 = 95
        L38:
            if (r2 == r1) goto L42
            android.content.Context r4 = r4.getApplicationContext()
            android.app.Application r4 = (android.app.Application) r4
            r0.AFKeystoreWrapper = r4
        L42:
            r0.getLevel = r6
            r0.AFVersionDeclaration = r5
            r0.values = r7
            r0.AppsFlyer2dXConversionCallback = r8
            r0.valueOf = r9
            r3.values(r0)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.AFInAppEventParameterName(android.content.Context, java.lang.String, java.lang.String, java.util.Map, java.lang.String, java.lang.String):void");
    }

    private boolean getLevel() {
        String str;
        if (this.onAppOpenAttribution > 0) {
            long jCurrentTimeMillis = System.currentTimeMillis() - this.onAppOpenAttribution;
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.SSS Z", Locale.US);
            String strValueOf = valueOf(simpleDateFormat, this.onAppOpenAttribution);
            String strValueOf2 = valueOf(simpleDateFormat, this.onResponseNative);
            if (jCurrentTimeMillis < this.onConversionDataSuccess) {
                int i = setCustomerIdAndLogSession + 115;
                waitForCustomerUserId = i % 128;
                int i2 = i % 2;
                if (!(isStopped())) {
                    AFLogger.values(String.format(Locale.US, "Last Launch attempt: %s;\nLast successful Launch event: %s;\nThis launch is blocked: %s ms < %s ms", strValueOf, strValueOf2, Long.valueOf(jCurrentTimeMillis), Long.valueOf(this.onConversionDataSuccess)));
                    return true;
                }
            }
            if (!isStopped()) {
                int i3 = setCustomerIdAndLogSession + 21;
                waitForCustomerUserId = i3 % 128;
                if ((i3 % 2 != 0 ? 'U' : 'S') != 'S') {
                    Locale locale = Locale.US;
                    Object[] objArr = new Object[2];
                    objArr[1] = strValueOf;
                    objArr[0] = strValueOf2;
                    objArr[5] = Long.valueOf(jCurrentTimeMillis);
                    str = String.format(locale, "Last Launch attempt: %s;\nLast successful Launch event: %s;\nSending launch (+%s ms)", objArr);
                } else {
                    str = String.format(Locale.US, "Last Launch attempt: %s;\nLast successful Launch event: %s;\nSending launch (+%s ms)", strValueOf, strValueOf2, Long.valueOf(jCurrentTimeMillis));
                }
                AFLogger.values(str);
            }
        } else {
            if ((!isStopped() ? (char) 24 : '.') != '.') {
                int i4 = waitForCustomerUserId + 125;
                setCustomerIdAndLogSession = i4 % 128;
                if (i4 % 2 == 0) {
                    AFLogger.values("Sending first launch for this session!");
                    Object[] objArr2 = null;
                    int length = objArr2.length;
                } else {
                    AFLogger.values("Sending first launch for this session!");
                }
            }
        }
        return false;
    }

    private void AFInAppEventType(Context context, String str) {
        cq cqVar = new cq();
        byte b2 = 0;
        if (context != null) {
            int i = waitForCustomerUserId + 109;
            setCustomerIdAndLogSession = i % 128;
            int i2 = i % 2;
            cqVar.AFKeystoreWrapper = (Application) context.getApplicationContext();
        }
        cqVar.AppsFlyer2dXConversionCallback = str;
        if ((str != null) && str.length() > 5) {
            int i3 = waitForCustomerUserId + 23;
            setCustomerIdAndLogSession = i3 % 128;
            int i4 = i3 % 2;
            if (valueOf(cqVar, AFInAppEventType(context))) {
                if (k.values == null) {
                    k.values = new k();
                }
                valueOf(k.values.AFKeystoreWrapper(), new b(this, cqVar, b2), 5L, TimeUnit.MILLISECONDS);
                int i5 = waitForCustomerUserId + 63;
                setCustomerIdAndLogSession = i5 % 128;
                int i6 = i5 % 2;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x0054, code lost:
    
        if (r5 != false) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0062, code lost:
    
        if ((r5 ? 'R' : 'W') != 'W') goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x0077, code lost:
    
        return false;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:19:0x003d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private boolean valueOf(com.appsflyer.internal.i r5, android.content.SharedPreferences r6) {
        /*
            r4 = this;
            r0 = 0
            int r1 = r4.valueOf(r6, r0)
            r2 = 1
            if (r1 != r2) goto La
            r3 = 1
            goto Lb
        La:
            r3 = 0
        Lb:
            if (r3 == 0) goto L1d
            boolean r5 = r5 instanceof com.appsflyer.internal.ci
            if (r5 != 0) goto L1d
            int r5 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r5 = r5 + 17
            int r3 = r5 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r3
            int r5 = r5 % 2
            r5 = 1
            goto L1e
        L1d:
            r5 = 0
        L1e:
            java.lang.String r3 = "newGPReferrerSent"
            boolean r6 = r6.getBoolean(r3, r0)
            if (r6 != 0) goto L3d
            r6 = 42
            if (r1 != r2) goto L2d
            r1 = 96
            goto L2f
        L2d:
            r1 = 42
        L2f:
            if (r1 == r6) goto L3d
            int r6 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r6 = r6 + 115
            int r1 = r6 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r6 = r6 % 2
            r6 = 1
            goto L3e
        L3d:
            r6 = 0
        L3e:
            if (r6 != 0) goto L42
            r6 = 0
            goto L43
        L42:
            r6 = 1
        L43:
            r1 = 0
            if (r6 == 0) goto L47
            goto L64
        L47:
            int r6 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r6 = r6 + 15
            int r3 = r6 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r3
            int r6 = r6 % 2
            if (r6 != 0) goto L59
            int r6 = r1.length     // Catch: java.lang.Throwable -> L57
            if (r5 == 0) goto L77
            goto L64
        L57:
            r5 = move-exception
            throw r5
        L59:
            r6 = 87
            if (r5 == 0) goto L60
            r5 = 82
            goto L62
        L60:
            r5 = 87
        L62:
            if (r5 == r6) goto L77
        L64:
            int r5 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r5 = r5 + 45
            int r6 = r5 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r6
            int r5 = r5 % 2
            if (r5 != 0) goto L76
            super.hashCode()     // Catch: java.lang.Throwable -> L74
            return r2
        L74:
            r5 = move-exception
            throw r5
        L76:
            return r2
        L77:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.valueOf(com.appsflyer.internal.i, android.content.SharedPreferences):boolean");
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x003a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void AFInAppEventParameterName(java.util.Map<java.lang.String, java.lang.Object> r6) {
        /*
            r5 = this;
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            r1 = 79
            int r0 = r0 + r1
            int r2 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r2
            int r0 = r0 % 2
            java.lang.String r2 = "collectAndroidIdForceByUser"
            r3 = 1
            r4 = 0
            if (r0 != 0) goto L1c
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            boolean r0 = r0.getBoolean(r2, r4)
            if (r0 != 0) goto L3a
            goto L2b
        L1c:
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            boolean r0 = r0.getBoolean(r2, r4)
            if (r0 != 0) goto L28
            r0 = 0
            goto L29
        L28:
            r0 = 1
        L29:
            if (r0 == r3) goto L3a
        L2b:
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r2 = "collectIMEIForceByUser"
            boolean r0 = r0.getBoolean(r2, r4)
            if (r0 == 0) goto L38
            goto L3a
        L38:
            r0 = 0
            goto L3b
        L3a:
            r0 = 1
        L3b:
            if (r0 != 0) goto Lb8
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 85
            int r2 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r2
            int r0 = r0 % 2
            java.lang.String r0 = "advertiserId"
            java.lang.Object r0 = r6.get(r0)
            if (r0 == 0) goto Lb8
            java.lang.String r0 = r5.init     // Catch: java.lang.Exception -> Lb2
            boolean r0 = android.text.TextUtils.isEmpty(r0)     // Catch: java.lang.Exception -> Lb2
            r2 = 21
            if (r0 == 0) goto L5c
            r0 = 21
            goto L5e
        L5c:
            r0 = 38
        L5e:
            if (r0 == r2) goto L61
            goto L78
        L61:
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + r2
            int r2 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r2
            int r0 = r0 % 2
            java.lang.String r0 = "android_id"
            java.lang.Object r0 = r6.remove(r0)     // Catch: java.lang.Exception -> Lb2
            if (r0 == 0) goto L78
            java.lang.String r0 = "validateGaidAndIMEI :: removing: android_id"
            com.appsflyer.AFLogger.values(r0)     // Catch: java.lang.Exception -> Lb2
        L78:
            java.lang.String r0 = r5.AppsFlyer2dXConversionCallback     // Catch: java.lang.Exception -> Lb2
            boolean r0 = android.text.TextUtils.isEmpty(r0)     // Catch: java.lang.Exception -> Lb2
            if (r0 == 0) goto Lb1
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 29
            int r2 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r2
            int r0 = r0 % 2
            r2 = 66
            if (r0 != 0) goto L90
            r1 = 66
        L90:
            java.lang.String r0 = "imei"
            if (r1 == r2) goto L9e
            java.lang.Object r6 = r6.remove(r0)     // Catch: java.lang.Exception -> Lb2
            if (r6 == 0) goto L9b
            r3 = 0
        L9b:
            if (r3 == 0) goto La8
            goto Lb1
        L9e:
            java.lang.Object r6 = r6.remove(r0)     // Catch: java.lang.Exception -> Lb2
            r0 = 0
            super.hashCode()     // Catch: java.lang.Throwable -> Laf java.lang.Exception -> Lb2
            if (r6 == 0) goto Lb1
        La8:
            java.lang.String r6 = "validateGaidAndIMEI :: removing: imei"
            com.appsflyer.AFLogger.values(r6)     // Catch: java.lang.Exception -> Lb2
            goto Lb1
        Laf:
            r6 = move-exception
            throw r6
        Lb1:
            return
        Lb2:
            r6 = move-exception
            java.lang.String r0 = "failed to remove IMEI or AndroidID key from params; "
            com.appsflyer.AFLogger.valueOf(r0, r6)
        Lb8:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.AFInAppEventParameterName(java.util.Map):void");
    }

    private boolean AFLogger$LogLevel() {
        int i = setCustomerIdAndLogSession + 25;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        Map<String, Object> map = this.updateServerUninstallToken;
        if ((map != null ? '9' : 'X') != 'X') {
            if (!(map.isEmpty())) {
                int i3 = setCustomerIdAndLogSession + 1;
                waitForCustomerUserId = i3 % 128;
                int i4 = i3 % 2;
                return true;
            }
        }
        int i5 = waitForCustomerUserId + 85;
        setCustomerIdAndLogSession = i5 % 128;
        int i6 = i5 % 2;
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:19:0x003e A[PHI: r0
      0x003e: PHI (r0v6 com.appsflyer.internal.ap) = (r0v5 com.appsflyer.internal.ap), (r0v11 com.appsflyer.internal.ap) binds: [B:17:0x003b, B:9:0x0021] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void valueOf(java.util.Map<java.lang.String, java.lang.Object> r7) {
        /*
            r6 = this;
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 85
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
            r1 = 1
            r2 = 0
            r3 = 0
            if (r0 == 0) goto L26
            com.appsflyer.internal.bg r0 = r6.values()
            com.appsflyer.internal.by r0 = r0.values()
            com.appsflyer.internal.ap r0 = r0.AFKeystoreWrapper()
            int r4 = r3.length     // Catch: java.lang.Throwable -> L24
            if (r0 == 0) goto L20
            r4 = 1
            goto L21
        L20:
            r4 = 0
        L21:
            if (r4 == 0) goto L47
            goto L3e
        L24:
            r7 = move-exception
            throw r7
        L26:
            com.appsflyer.internal.bg r0 = r6.values()
            com.appsflyer.internal.by r0 = r0.values()
            com.appsflyer.internal.ap r0 = r0.AFKeystoreWrapper()
            r4 = 70
            if (r0 == 0) goto L39
            r5 = 70
            goto L3b
        L39:
            r5 = 16
        L3b:
            if (r5 == r4) goto L3e
            goto L47
        L3e:
            java.util.Map r0 = r0.AFKeystoreWrapper()
            java.lang.String r4 = "rc"
            r7.put(r4, r0)
        L47:
            int r7 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r7 = r7 + 79
            int r0 = r7 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r0
            int r7 = r7 % 2
            if (r7 != 0) goto L54
            goto L55
        L54:
            r1 = 0
        L55:
            if (r1 == 0) goto L5d
            super.hashCode()     // Catch: java.lang.Throwable -> L5b
            return
        L5b:
            r7 = move-exception
            throw r7
        L5d:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.valueOf(java.util.Map):void");
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x001d, code lost:
    
        if (r0 != false) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x002f, code lost:
    
        if ((r3.containsKey("meta") ? 25 : ']') != 25) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0031, code lost:
    
        r0 = new java.util.HashMap();
        r3.put("meta", r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x003a, code lost:
    
        r0 = (java.util.Map) r3.get("meta");
        r3 = com.appsflyer.internal.ac.waitForCustomerUserId + 29;
        com.appsflyer.internal.ac.setCustomerIdAndLogSession = r3 % 128;
        r3 = r3 % 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x004b, code lost:
    
        return r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:?, code lost:
    
        return r0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.Map<java.lang.String, java.lang.Object> AFInAppEventType(java.util.Map<java.lang.String, java.lang.Object> r3) {
        /*
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 23
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
            r1 = 43
            if (r0 != 0) goto L11
            r0 = 72
            goto L13
        L11:
            r0 = 43
        L13:
            java.lang.String r2 = "meta"
            if (r0 == r1) goto L22
            boolean r0 = r3.containsKey(r2)
            r1 = 0
            int r1 = r1.length     // Catch: java.lang.Throwable -> L20
            if (r0 == 0) goto L31
            goto L3a
        L20:
            r3 = move-exception
            throw r3
        L22:
            boolean r0 = r3.containsKey(r2)
            r1 = 25
            if (r0 == 0) goto L2d
            r0 = 25
            goto L2f
        L2d:
            r0 = 93
        L2f:
            if (r0 == r1) goto L3a
        L31:
            java.util.HashMap r0 = new java.util.HashMap
            r0.<init>()
            r3.put(r2, r0)
            goto L4b
        L3a:
            java.lang.Object r3 = r3.get(r2)
            r0 = r3
            java.util.Map r0 = (java.util.Map) r0
            int r3 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r3 = r3 + 29
            int r1 = r3 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r3 = r3 % 2
        L4b:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.AFInAppEventType(java.util.Map):java.util.Map");
    }

    public static boolean AFInAppEventType(SharedPreferences sharedPreferences) {
        int i = waitForCustomerUserId + 89;
        setCustomerIdAndLogSession = i % 128;
        boolean z = i % 2 != 0;
        Object obj = null;
        boolean z2 = Boolean.parseBoolean(sharedPreferences.getString("sentSuccessfully", null));
        if (!z) {
            super.hashCode();
        }
        int i2 = waitForCustomerUserId + 3;
        setCustomerIdAndLogSession = i2 % 128;
        if (i2 % 2 != 0) {
            return z2;
        }
        int i3 = 42 / 0;
        return z2;
    }

    private static void values(Context context, Map<String, Object> map) {
        int i = waitForCustomerUserId + 71;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        WindowManager windowManager = (WindowManager) context.getSystemService("window");
        if (!(windowManager == null)) {
            int i3 = waitForCustomerUserId + 63;
            setCustomerIdAndLogSession = i3 % 128;
            int i4 = i3 % 2;
            int rotation = windowManager.getDefaultDisplay().getRotation();
            map.put("sc_o", rotation != 0 ? rotation != 1 ? rotation != 2 ? rotation != 3 ? "" : "lr" : "pr" : "l" : AnalyticsEventKey.PROTOCOL);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x008b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void AFInAppEventParameterName(android.content.Context r6, boolean r7, java.util.Map<java.lang.String, java.lang.Object> r8, int r9) {
        /*
            r5 = this;
            java.util.HashMap r0 = new java.util.HashMap
            r0.<init>()
            java.lang.String r1 = "ro.product.cpu.abi"
            java.lang.String r1 = values(r1)
            java.lang.String r2 = "cpu_abi"
            r0.put(r2, r1)
            java.lang.String r1 = "ro.product.cpu.abi2"
            java.lang.String r1 = values(r1)
            java.lang.String r2 = "cpu_abi2"
            r0.put(r2, r1)
            java.lang.String r1 = "os.arch"
            java.lang.String r1 = values(r1)
            java.lang.String r2 = "arch"
            r0.put(r2, r1)
            java.lang.String r1 = "ro.build.display.id"
            java.lang.String r1 = values(r1)
            java.lang.String r2 = "build_display_id"
            r0.put(r2, r1)
            if (r7 == 0) goto L35
            r7 = 0
            goto L36
        L35:
            r7 = 1
        L36:
            if (r7 == 0) goto L39
            goto L96
        L39:
            int r7 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r7 = r7 + 79
            int r1 = r7 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            r1 = 2
            int r7 = r7 % r1
            r2 = 52
            if (r7 != 0) goto L4a
            r7 = 52
            goto L4c
        L4a:
            r7 = 55
        L4c:
            r3 = 0
            if (r7 == r2) goto L54
            boolean r7 = r5.AppsFlyerConversionListener
            if (r7 == 0) goto L86
            goto L59
        L54:
            boolean r7 = r5.AppsFlyerConversionListener
            int r2 = r3.length     // Catch: java.lang.Throwable -> La5
            if (r7 == 0) goto L86
        L59:
            java.util.Map r7 = AFLogger$LogLevel(r6)
            boolean r2 = r7.isEmpty()
            r4 = 50
            if (r2 != 0) goto L68
            r2 = 50
            goto L6a
        L68:
            r2 = 38
        L6a:
            if (r2 == r4) goto L6d
            goto L86
        L6d:
            int r2 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r2 = r2 + 45
            int r4 = r2 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r4
            int r2 = r2 % r1
            java.lang.String r4 = "loc"
            if (r2 == 0) goto L83
            r0.put(r4, r7)
            super.hashCode()     // Catch: java.lang.Throwable -> L81
            goto L86
        L81:
            r6 = move-exception
            throw r6
        L83:
            r0.put(r4, r7)
        L86:
            AFKeystoreWrapper(r6, r0)
            if (r9 > r1) goto L96
            com.appsflyer.internal.w r7 = com.appsflyer.internal.w.AFKeystoreWrapper(r6)
            java.util.Map r7 = r7.AFKeystoreWrapper()
            r0.putAll(r7)
        L96:
            java.util.Map r6 = com.appsflyer.internal.y.AFInAppEventType(r6)
            java.lang.String r7 = "dim"
            r0.put(r7, r6)
            java.lang.String r6 = "deviceData"
            r8.put(r6, r0)
            return
        La5:
            r6 = move-exception
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.AFInAppEventParameterName(android.content.Context, boolean, java.util.Map, int):void");
    }

    public static void AFInAppEventType(Context context, Map<String, ? super String> map) {
        int i = waitForCustomerUserId + 15;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        u uVar = u.d.valueOf;
        u.a aVarAFInAppEventType = u.AFInAppEventType(context);
        map.put("network", aVarAFInAppEventType.AFKeystoreWrapper);
        if (aVarAFInAppEventType.values != null) {
            int i3 = waitForCustomerUserId + 103;
            setCustomerIdAndLogSession = i3 % 128;
            if ((i3 % 2 == 0 ? '*' : (char) 24) != 24) {
                map.put("operator", aVarAFInAppEventType.values);
                int i4 = 66 / 0;
            } else {
                map.put("operator", aVarAFInAppEventType.values);
            }
        }
        if ((aVarAFInAppEventType.AFInAppEventType != null ? (char) 14 : (char) 20) != 14) {
            return;
        }
        int i5 = setCustomerIdAndLogSession + 1;
        waitForCustomerUserId = i5 % 128;
        if (i5 % 2 == 0) {
            map.put("carrier", aVarAFInAppEventType.AFInAppEventType);
        } else {
            map.put("carrier", aVarAFInAppEventType.AFInAppEventType);
            Object obj = null;
            super.hashCode();
        }
        int i6 = waitForCustomerUserId + 43;
        setCustomerIdAndLogSession = i6 % 128;
        int i7 = i6 % 2;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x003e A[PHI: r0 r2
      0x003e: PHI (r0v5 java.lang.String) = (r0v4 java.lang.String), (r0v12 java.lang.String) binds: [B:13:0x003c, B:6:0x0024] A[DONT_GENERATE, DONT_INLINE]
      0x003e: PHI (r2v2 java.lang.String) = (r2v1 java.lang.String), (r2v4 java.lang.String) binds: [B:13:0x003c, B:6:0x0024] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void values(java.util.Map<java.lang.String, java.lang.Object> r4) {
        /*
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 121
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
            r1 = 0
            java.lang.String r2 = "onelinkVersion"
            java.lang.String r3 = "oneLinkSlug"
            if (r0 == 0) goto L29
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r0 = r0.getString(r3)
            com.appsflyer.AppsFlyerProperties r3 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r2 = r3.getString(r2)
            r3 = 68
            int r3 = r3 / r1
            if (r0 == 0) goto L43
            goto L3e
        L27:
            r4 = move-exception
            throw r4
        L29:
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r0 = r0.getString(r3)
            com.appsflyer.AppsFlyerProperties r3 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r2 = r3.getString(r2)
            if (r0 == 0) goto L3c
            r1 = 1
        L3c:
            if (r1 == 0) goto L43
        L3e:
            java.lang.String r1 = "onelink_id"
            r4.put(r1, r0)
        L43:
            r0 = 15
            if (r2 == 0) goto L4a
            r1 = 15
            goto L4c
        L4a:
            r1 = 69
        L4c:
            if (r1 == r0) goto L4f
            goto L5e
        L4f:
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 53
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
            java.lang.String r0 = "onelink_ver"
            r4.put(r0, r2)
        L5e:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.values(java.util.Map):void");
    }

    private static String AFInAppEventParameterName(Activity activity) {
        String string = null;
        if (activity != null) {
            int i = setCustomerIdAndLogSession + 119;
            waitForCustomerUserId = i % 128;
            int i2 = i % 2;
            Intent intent = activity.getIntent();
            if (intent != null) {
                try {
                    Bundle extras = intent.getExtras();
                    if ((extras != null ? (char) 24 : '`') != '`') {
                        string = extras.getString("af");
                        if ((string != null ? (char) 28 : '@') == 28) {
                            int i3 = setCustomerIdAndLogSession + 119;
                            waitForCustomerUserId = i3 % 128;
                            int i4 = i3 % 2;
                            AFLogger.values("Push Notification received af payload = ".concat(String.valueOf(string)));
                            extras.remove("af");
                            activity.setIntent(intent.putExtras(extras));
                        }
                    }
                } catch (Throwable th) {
                    AFLogger.valueOf(th.getMessage(), th);
                }
            }
        }
        return string;
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x010c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected final void AFInAppEventType(android.content.Context r10, java.util.Map<java.lang.String, java.lang.Object> r11, android.net.Uri r12) {
        /*
            Method dump skipped, instruction units count: 299
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.AFInAppEventType(android.content.Context, java.util.Map, android.net.Uri):void");
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x003d, code lost:
    
        if ((r10.contains("access_token") ? 22 : 18) != 22) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0047, code lost:
    
        if (r10.contains("access_token") != false) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0049, code lost:
    
        r1 = AFKeystoreWrapper(r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0051, code lost:
    
        if (r1.length() != 0) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0053, code lost:
    
        r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession + 95;
        com.appsflyer.internal.ac.waitForCustomerUserId = r0 % 128;
        r0 = r0 % 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x005d, code lost:
    
        return r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x005e, code lost:
    
        r3 = new java.util.ArrayList();
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0069, code lost:
    
        if (r1.contains(com.ironsource.sdk.constants.Constants.RequestParameters.AMPERSAND) == false) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x006b, code lost:
    
        r3 = new java.util.ArrayList(java.util.Arrays.asList(r1.split(com.ironsource.sdk.constants.Constants.RequestParameters.AMPERSAND)));
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x0079, code lost:
    
        r3.add(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x007c, code lost:
    
        r5 = new java.lang.StringBuilder();
        r3 = r3.iterator();
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0089, code lost:
    
        if (r3.hasNext() == false) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x008b, code lost:
    
        r6 = com.appsflyer.internal.ac.setCustomerIdAndLogSession + 3;
        com.appsflyer.internal.ac.waitForCustomerUserId = r6 % 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0097, code lost:
    
        if ((r6 % 2) == 0) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0099, code lost:
    
        r6 = '/';
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x009c, code lost:
    
        r6 = '#';
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x009e, code lost:
    
        if (r6 == '#') goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00a0, code lost:
    
        r6 = (java.lang.String) r3.next();
        r7 = r6.contains("access_token");
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00aa, code lost:
    
        r8 = r0.length;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00ab, code lost:
    
        if (r7 == false) goto L85;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00b0, code lost:
    
        r6 = (java.lang.String) r3.next();
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00ba, code lost:
    
        if (r6.contains("access_token") == false) goto L86;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00bc, code lost:
    
        r3.remove();
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x00c4, code lost:
    
        if (r5.length() == 0) goto L56;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x00c6, code lost:
    
        r5.append(com.ironsource.sdk.constants.Constants.RequestParameters.AMPERSAND);
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x00d2, code lost:
    
        if (r6.startsWith("?") != false) goto L59;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x00d4, code lost:
    
        r8 = 'a';
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x00d7, code lost:
    
        r8 = ':';
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x00d9, code lost:
    
        if (r8 == 'a') goto L62;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x00dc, code lost:
    
        r5.append("?");
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x00df, code lost:
    
        r5.append(r6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x00eb, code lost:
    
        return r10.replace(r1, r5.toString());
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.lang.String valueOf(java.lang.String r10) {
        /*
            Method dump skipped, instruction units count: 256
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.valueOf(java.lang.String):java.lang.String");
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0024, code lost:
    
        if ((r0 == -1 ? 25 : 'L') != 25) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0032, code lost:
    
        if ((r0 == -1) != false) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0034, code lost:
    
        r3 = com.appsflyer.internal.ac.waitForCustomerUserId + 19;
        com.appsflyer.internal.ac.setCustomerIdAndLogSession = r3 % 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x003e, code lost:
    
        if ((r3 % 2) != 0) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0040, code lost:
    
        r3 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0041, code lost:
    
        r3 = r3.length;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0045, code lost:
    
        return "";
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0048, code lost:
    
        r3 = r3.substring(r0);
        r0 = com.appsflyer.internal.ac.waitForCustomerUserId + 59;
        com.appsflyer.internal.ac.setCustomerIdAndLogSession = r0 % 128;
        r0 = r0 % 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0056, code lost:
    
        return r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:?, code lost:
    
        return "";
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.lang.String AFKeystoreWrapper(java.lang.String r3) {
        /*
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 101
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
            r1 = 39
            if (r0 != 0) goto L10
            r0 = 4
            goto L12
        L10:
            r0 = 39
        L12:
            r2 = -1
            if (r0 == r1) goto L27
            r0 = 31
            int r0 = r3.indexOf(r0)
            r1 = 25
            if (r0 != r2) goto L22
            r2 = 25
            goto L24
        L22:
            r2 = 76
        L24:
            if (r2 == r1) goto L34
            goto L48
        L27:
            r0 = 63
            int r0 = r3.indexOf(r0)
            if (r0 != r2) goto L31
            r1 = 1
            goto L32
        L31:
            r1 = 0
        L32:
            if (r1 == 0) goto L48
        L34:
            int r3 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r3 = r3 + 19
            int r0 = r3 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r0
            int r3 = r3 % 2
            if (r3 != 0) goto L45
            r3 = 0
            int r3 = r3.length     // Catch: java.lang.Throwable -> L43
            goto L45
        L43:
            r3 = move-exception
            throw r3
        L45:
            java.lang.String r3 = ""
            return r3
        L48:
            java.lang.String r3 = r3.substring(r0)
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 59
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.AFKeystoreWrapper(java.lang.String):java.lang.String");
    }

    private aq.a AFKeystoreWrapper(final Map<String, String> map) {
        aq.a aVar = new aq.a() { // from class: com.appsflyer.internal.ac.6
            @Override // com.appsflyer.internal.aq.a
            public final void valueOf(Map<String, String> map2) {
                for (String str : map2.keySet()) {
                    map.put(str, map2.get(str));
                }
                ao.AFInAppEventType((Map<String, String>) map);
            }

            @Override // com.appsflyer.internal.aq.a
            public final void AFKeystoreWrapper(String str) {
                ao.AFInAppEventType(str, DeepLinkResult.Error.NETWORK);
            }
        };
        int i = setCustomerIdAndLogSession + 31;
        waitForCustomerUserId = i % 128;
        if ((i % 2 != 0 ? 'C' : (char) 31) == 31) {
            return aVar;
        }
        Object obj = null;
        super.hashCode();
        return aVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x003a A[Catch: Exception -> 0x0076, PHI: r0 r1 r7
      0x003a: PHI (r0v6 android.content.SharedPreferences$Editor) = (r0v5 android.content.SharedPreferences$Editor), (r0v8 android.content.SharedPreferences$Editor) binds: [B:17:0x0038, B:11:0x0027] A[DONT_GENERATE, DONT_INLINE]
      0x003a: PHI (r1v3 java.lang.String) = (r1v2 java.lang.String), (r1v4 java.lang.String) binds: [B:17:0x0038, B:11:0x0027] A[DONT_GENERATE, DONT_INLINE]
      0x003a: PHI (r7v3 android.content.SharedPreferences) = (r7v2 android.content.SharedPreferences), (r7v15 android.content.SharedPreferences) binds: [B:17:0x0038, B:11:0x0027] A[DONT_GENERATE, DONT_INLINE], TryCatch #2 {Exception -> 0x0076, blocks: (B:9:0x0022, B:10:0x0026, B:19:0x0050, B:18:0x003a, B:16:0x0034), top: B:38:0x0018 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void valueOf(android.content.Context r7, java.util.Map<java.lang.String, java.lang.Object> r8, java.lang.String r9) {
        /*
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 61
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
            r1 = 19
            if (r0 != 0) goto L11
            r0 = 48
            goto L13
        L11:
            r0 = 19
        L13:
            java.lang.String r2 = "prev_event_timestamp"
            r3 = 0
            java.lang.String r4 = "prev_event_name"
            if (r0 == r1) goto L2c
            android.content.SharedPreferences r7 = AFInAppEventType(r7)
            android.content.SharedPreferences$Editor r0 = r7.edit()
            java.lang.String r1 = r7.getString(r4, r3)     // Catch: java.lang.Exception -> L76
            int r3 = r3.length     // Catch: java.lang.Throwable -> L2a java.lang.Exception -> L76
            if (r1 == 0) goto L50
            goto L3a
        L2a:
            r7 = move-exception
            throw r7
        L2c:
            android.content.SharedPreferences r7 = AFInAppEventType(r7)
            android.content.SharedPreferences$Editor r0 = r7.edit()
            java.lang.String r1 = r7.getString(r4, r3)     // Catch: java.lang.Exception -> L76
            if (r1 == 0) goto L50
        L3a:
            org.json.JSONObject r3 = new org.json.JSONObject     // Catch: java.lang.Exception -> L76
            r3.<init>()     // Catch: java.lang.Exception -> L76
            r5 = -1
            long r5 = r7.getLong(r2, r5)     // Catch: java.lang.Exception -> L76
            r3.put(r2, r5)     // Catch: java.lang.Exception -> L76
            r3.put(r4, r1)     // Catch: java.lang.Exception -> L76
            java.lang.String r7 = "prev_event"
            r8.put(r7, r3)     // Catch: java.lang.Exception -> L76
        L50:
            r0.putString(r4, r9)     // Catch: java.lang.Exception -> L76
            long r7 = java.lang.System.currentTimeMillis()     // Catch: java.lang.Exception -> L76
            r0.putLong(r2, r7)     // Catch: java.lang.Exception -> L76
            AFInAppEventType(r0)     // Catch: java.lang.Exception -> L76
            int r7 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r7 = r7 + 113
            int r8 = r7 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r8
            int r7 = r7 % 2
            r8 = 0
            if (r7 == 0) goto L6c
            r7 = 0
            goto L6d
        L6c:
            r7 = 1
        L6d:
            if (r7 == 0) goto L70
            return
        L70:
            r7 = 88
            int r7 = r7 / r8
            return
        L74:
            r7 = move-exception
            throw r7
        L76:
            r7 = move-exception
            java.lang.String r8 = "Error while processing previous event."
            com.appsflyer.AFLogger.valueOf(r8, r7)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.valueOf(android.content.Context, java.util.Map, java.lang.String):void");
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x0034, code lost:
    
        if (com.google.android.gms.common.GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(r4) == 0) goto L18;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static boolean init(android.content.Context r4) {
        /*
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 53
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
            r1 = 87
            if (r0 == 0) goto L11
            r0 = 77
            goto L13
        L11:
            r0 = 87
        L13:
            r2 = 1
            r3 = 0
            if (r0 == r1) goto L2c
            com.google.android.gms.common.GoogleApiAvailability r0 = com.google.android.gms.common.GoogleApiAvailability.getInstance()     // Catch: java.lang.Throwable -> L2a
            int r0 = r0.isGooglePlayServicesAvailable(r4)     // Catch: java.lang.Throwable -> L2a
            r1 = 16
            int r1 = r1 / r3
            if (r0 != 0) goto L26
            r0 = 1
            goto L27
        L26:
            r0 = 0
        L27:
            if (r0 == r2) goto L36
            goto L4d
        L2a:
            r0 = move-exception
            goto L48
        L2c:
            com.google.android.gms.common.GoogleApiAvailability r0 = com.google.android.gms.common.GoogleApiAvailability.getInstance()     // Catch: java.lang.Throwable -> L2a
            int r0 = r0.isGooglePlayServicesAvailable(r4)     // Catch: java.lang.Throwable -> L2a
            if (r0 != 0) goto L4d
        L36:
            int r4 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r4 = r4 + 39
            int r0 = r4 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r0
            int r4 = r4 % 2
            if (r4 != 0) goto L47
            r4 = 0
            int r4 = r4.length     // Catch: java.lang.Throwable -> L45
            return r2
        L45:
            r4 = move-exception
            throw r4
        L47:
            return r2
        L48:
            java.lang.String r1 = "WARNING:  Google play services is unavailable. "
            com.appsflyer.AFLogger.valueOf(r1, r0)
        L4d:
            android.content.pm.PackageManager r4 = r4.getPackageManager()     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L57
            java.lang.String r0 = "com.google.android.gms"
            r4.getPackageInfo(r0, r3)     // Catch: android.content.pm.PackageManager.NameNotFoundException -> L57
            return r2
        L57:
            r4 = move-exception
            java.lang.String r0 = "WARNING:  Google Play Services is unavailable. "
            com.appsflyer.AFLogger.valueOf(r0, r4)
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.init(android.content.Context):boolean");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:127:0x007e A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0041  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0115  */
    /* JADX WARN: Type inference failed for: r7v0 */
    /* JADX WARN: Type inference failed for: r7v1 */
    /* JADX WARN: Type inference failed for: r7v3 */
    /* JADX WARN: Type inference failed for: r7v4 */
    /* JADX WARN: Type inference failed for: r7v5 */
    /* JADX WARN: Type inference failed for: r7v6 */
    /* JADX WARN: Type inference failed for: r7v7 */
    /* JADX WARN: Type inference failed for: r7v8 */
    /* JADX WARN: Type inference failed for: r7v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void valueOf(android.content.Context r14, java.util.Map<java.lang.String, java.lang.Object> r15) {
        /*
            Method dump skipped, instruction units count: 499
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.valueOf(android.content.Context, java.util.Map):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x003d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static boolean AFVersionDeclaration(android.content.Context r4) {
        /*
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r1 = "collectAndroidIdForceByUser"
            r2 = 0
            boolean r0 = r0.getBoolean(r1, r2)
            r1 = 60
            if (r0 != 0) goto L12
            r0 = 81
            goto L14
        L12:
            r0 = 60
        L14:
            r3 = 1
            if (r0 == r1) goto L3d
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 41
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
            java.lang.String r1 = "collectIMEIForceByUser"
            if (r0 != 0) goto L30
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            boolean r0 = r0.getBoolean(r1, r3)
            if (r0 == 0) goto L3b
            goto L3d
        L30:
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            boolean r0 = r0.getBoolean(r1, r2)
            if (r0 == 0) goto L3b
            goto L3d
        L3b:
            r0 = 0
            goto L48
        L3d:
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 5
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
            r0 = 1
        L48:
            r1 = 31
            if (r0 != 0) goto L4f
            r0 = 9
            goto L51
        L4f:
            r0 = 31
        L51:
            if (r0 == r1) goto L5b
            boolean r4 = init(r4)
            if (r4 != 0) goto L5a
            goto L5b
        L5a:
            return r2
        L5b:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.AFVersionDeclaration(android.content.Context):boolean");
    }

    public static boolean AFKeystoreWrapper(Context context) {
        if ((!AFInAppEventType(context).contains("appsFlyerCount") ? Typography.greater : '/') != '>') {
            int i = setCustomerIdAndLogSession + 73;
            waitForCustomerUserId = i % 128;
            int i2 = i % 2;
            return false;
        }
        int i3 = setCustomerIdAndLogSession + 13;
        waitForCustomerUserId = i3 % 128;
        int i4 = i3 % 2;
        return true;
    }

    private String onInstallConversionDataLoadedNative(Context context) {
        int i = setCustomerIdAndLogSession + 85;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        SharedPreferences sharedPreferencesAFInAppEventType = AFInAppEventType(context);
        String strOnDeepLinkingNative = null;
        if ((sharedPreferencesAFInAppEventType.contains("INSTALL_STORE") ? '_' : (char) 22) == '_') {
            String string = sharedPreferencesAFInAppEventType.getString("INSTALL_STORE", null);
            int i3 = waitForCustomerUserId + 5;
            setCustomerIdAndLogSession = i3 % 128;
            int i4 = i3 % 2;
            return string;
        }
        if (AFKeystoreWrapper(context)) {
            strOnDeepLinkingNative = onDeepLinkingNative(context);
        } else {
            int i5 = waitForCustomerUserId + 93;
            setCustomerIdAndLogSession = i5 % 128;
            int i6 = i5 % 2;
        }
        valueOf(context, "INSTALL_STORE", strOnDeepLinkingNative);
        return strOnDeepLinkingNative;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private String onDeepLinkingNative(Context context) {
        String string = AppsFlyerProperties.getInstance().getString("api_store_value");
        if (string == null) {
            String strAFKeystoreWrapper = AFKeystoreWrapper(context, "AF_STORE");
            int i = waitForCustomerUserId + 121;
            setCustomerIdAndLogSession = i % 128;
            int i2 = i % 2;
            return strAFKeystoreWrapper;
        }
        int i3 = waitForCustomerUserId + 35;
        int i4 = i3 % 128;
        setCustomerIdAndLogSession = i4;
        Object[] objArr = null;
        Object[] objArr2 = 0;
        if (i3 % 2 == 0) {
            int length = objArr.length;
        }
        int i5 = i4 + 91;
        waitForCustomerUserId = i5 % 128;
        if ((i5 % 2 != 0 ? Typography.greater : (char) 25) != '>') {
            return string;
        }
        int length2 = (objArr2 == true ? 1 : 0).length;
        return string;
    }

    private static String values(String str) {
        Object objInvoke;
        int i = waitForCustomerUserId + 93;
        setCustomerIdAndLogSession = i % 128;
        String str2 = null;
        try {
            if (i % 2 == 0) {
                Class<?> cls = Class.forName("android.os.SystemProperties");
                Class<?>[] clsArr = new Class[1];
                clsArr[1] = String.class;
                Method method = cls.getMethod("get", clsArr);
                Object[] objArr = new Object[0];
                objArr[1] = str;
                objInvoke = method.invoke(null, objArr);
            } else {
                objInvoke = Class.forName("android.os.SystemProperties").getMethod("get", String.class).invoke(null, str);
            }
            str2 = (String) objInvoke;
        } catch (Throwable th) {
            AFLogger.valueOf(th.getMessage(), th);
        }
        int i2 = waitForCustomerUserId + 35;
        setCustomerIdAndLogSession = i2 % 128;
        int i3 = i2 % 2;
        return str2;
    }

    private String AFKeystoreWrapper(Context context, String str) {
        int i = waitForCustomerUserId;
        int i2 = i + 115;
        int i3 = i2 % 128;
        setCustomerIdAndLogSession = i3;
        int i4 = i2 % 2;
        if (context != null) {
            bf bfVar = this.setCustomerUserId;
            if (context != null) {
                int i5 = i + 29;
                setCustomerIdAndLogSession = i5 % 128;
                int i6 = i5 % 2;
                be beVar = bfVar.AFKeystoreWrapper;
                if (context != null) {
                    beVar.values = context.getApplicationContext();
                }
            }
            return values().AFInAppEventType().AFInAppEventParameterName(str);
        }
        int i7 = i3 + 91;
        int i8 = i7 % 128;
        waitForCustomerUserId = i8;
        int i9 = i7 % 2;
        int i10 = i8 + 7;
        setCustomerIdAndLogSession = i10 % 128;
        Object[] objArr = null;
        if ((i10 % 2 == 0 ? (char) 4 : (char) 27) == 27) {
            return null;
        }
        int length = objArr.length;
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.appsflyer.AppsFlyerLib
    public final void setPreinstallAttribution(String str, String str2, String str3) {
        AFLogger.AFInAppEventParameterName("setPreinstallAttribution API called");
        JSONObject jSONObject = new JSONObject();
        Object[] objArr = null;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        try {
            if ((str != null ? (char) 3 : 'B') != 'B') {
                int i = setCustomerIdAndLogSession + 23;
                waitForCustomerUserId = i % 128;
                if ((i % 2 != 0 ? (char) 7 : 'E') != 7) {
                    jSONObject.put("pid", str);
                } else {
                    jSONObject.put("pid", str);
                    int length = (objArr2 == true ? 1 : 0).length;
                }
            }
            if (str2 != null) {
                int i2 = waitForCustomerUserId + 73;
                setCustomerIdAndLogSession = i2 % 128;
                if (i2 % 2 == 0) {
                    jSONObject.put(ModelKeys.KEY_ACTION_MODEL_ACTION_TEXT_COLOR, str2);
                    int length2 = (objArr3 == true ? 1 : 0).length;
                } else {
                    jSONObject.put(ModelKeys.KEY_ACTION_MODEL_ACTION_TEXT_COLOR, str2);
                }
            }
            if (str3 != null) {
                int i3 = setCustomerIdAndLogSession + 71;
                waitForCustomerUserId = i3 % 128;
                if (i3 % 2 != 0) {
                    jSONObject.put("af_siteid", str3);
                    int length3 = objArr.length;
                } else {
                    jSONObject.put("af_siteid", str3);
                }
            }
        } catch (JSONException e2) {
            AFLogger.valueOf(e2.getMessage(), e2);
        }
        if (!(jSONObject.has("pid"))) {
            AFLogger.AppsFlyer2dXConversionCallback("Cannot set preinstall attribution data without a media source");
            return;
        }
        int i4 = setCustomerIdAndLogSession + 25;
        waitForCustomerUserId = i4 % 128;
        int i5 = i4 % 2;
        values("preInstallName", jSONObject.toString());
    }

    private static void AFInAppEventType(String str) {
        try {
            if ((new JSONObject(str).has("pid") ? 'I' : 'A') != 'I') {
                AFLogger.AppsFlyer2dXConversionCallback("Cannot set preinstall attribution data without a media source");
                int i = setCustomerIdAndLogSession + 87;
                waitForCustomerUserId = i % 128;
                int i2 = i % 2;
                return;
            }
            int i3 = waitForCustomerUserId + 103;
            setCustomerIdAndLogSession = i3 % 128;
            if ((i3 % 2 == 0 ? 'X' : Typography.amp) != 'X') {
                values("preInstallName", str);
            } else {
                values("preInstallName", str);
                Object obj = null;
                super.hashCode();
            }
            int i4 = waitForCustomerUserId + 55;
            setCustomerIdAndLogSession = i4 % 128;
            int i5 = i4 % 2;
        } catch (JSONException e2) {
            AFLogger.valueOf("Error parsing JSON for preinstall", e2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0031  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.lang.String onInstallConversionFailureNative(android.content.Context r5) {
        /*
            r4 = this;
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 17
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
            java.lang.String r1 = "ro.appsflyer.preinstall.path"
            r2 = 0
            if (r0 != 0) goto L23
            java.lang.String r0 = values(r1)
            java.io.File r0 = AFLogger$LogLevel(r0)
            boolean r1 = AFInAppEventType(r0)
            super.hashCode()     // Catch: java.lang.Throwable -> L21
            if (r1 == 0) goto L3b
            goto L31
        L21:
            r5 = move-exception
            throw r5
        L23:
            java.lang.String r0 = values(r1)
            java.io.File r0 = AFLogger$LogLevel(r0)
            boolean r1 = AFInAppEventType(r0)
            if (r1 == 0) goto L3b
        L31:
            java.lang.String r0 = "AF_PRE_INSTALL_PATH"
            java.lang.String r0 = r4.AFKeystoreWrapper(r5, r0)
            java.io.File r0 = AFLogger$LogLevel(r0)
        L3b:
            boolean r1 = AFInAppEventType(r0)
            if (r1 == 0) goto L43
            r1 = 0
            goto L44
        L43:
            r1 = 1
        L44:
            if (r1 == 0) goto L47
            goto L6c
        L47:
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 51
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
            r1 = 49
            if (r0 == 0) goto L58
            r0 = 68
            goto L5a
        L58:
            r0 = 49
        L5a:
            java.lang.String r3 = "/data/local/tmp/pre_install.appsflyer"
            if (r0 == r1) goto L68
            java.io.File r0 = AFLogger$LogLevel(r3)
            super.hashCode()     // Catch: java.lang.Throwable -> L66
            goto L6c
        L66:
            r5 = move-exception
            throw r5
        L68:
            java.io.File r0 = AFLogger$LogLevel(r3)
        L6c:
            boolean r1 = AFInAppEventType(r0)
            if (r1 == 0) goto L78
            java.lang.String r0 = "/etc/pre_install.appsflyer"
            java.io.File r0 = AFLogger$LogLevel(r0)
        L78:
            boolean r1 = AFInAppEventType(r0)
            r3 = 81
            if (r1 == 0) goto L83
            r1 = 24
            goto L85
        L83:
            r1 = 81
        L85:
            if (r1 == r3) goto L9a
            int r5 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r5 = r5 + 47
            int r0 = r5 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r0
            int r5 = r5 % 2
            if (r5 != 0) goto L99
            super.hashCode()     // Catch: java.lang.Throwable -> L97
            goto L99
        L97:
            r5 = move-exception
            throw r5
        L99:
            return r2
        L9a:
            java.lang.String r5 = r5.getPackageName()
            java.lang.String r5 = values(r0, r5)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.onInstallConversionFailureNative(android.content.Context):java.lang.String");
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:26:0x0053 -> B:41:0x0080). Please report as a decompilation issue!!! */
    private static String values(File file, String str) {
        FileReader fileReader;
        try {
            try {
                try {
                    Properties properties = new Properties();
                    fileReader = new FileReader(file);
                    try {
                        properties.load(fileReader);
                        AFLogger.values("Found PreInstall property!");
                        String property = properties.getProperty(str);
                        try {
                            fileReader.close();
                            int i = waitForCustomerUserId + 95;
                            setCustomerIdAndLogSession = i % 128;
                            int i2 = i % 2;
                        } catch (Throwable th) {
                            AFLogger.valueOf(th.getMessage(), th);
                        }
                        int i3 = setCustomerIdAndLogSession + 61;
                        waitForCustomerUserId = i3 % 128;
                        if (i3 % 2 == 0) {
                            return property;
                        }
                        int i4 = 89 / 0;
                        return property;
                    } catch (FileNotFoundException unused) {
                        StringBuilder sb = new StringBuilder("PreInstall file wasn't found: ");
                        sb.append(file.getAbsolutePath());
                        AFLogger.AFInAppEventParameterName(sb.toString());
                        if (fileReader != null) {
                            fileReader.close();
                            int i5 = waitForCustomerUserId + 113;
                            setCustomerIdAndLogSession = i5 % 128;
                            int i6 = i5 % 2;
                        }
                        return null;
                    } catch (Throwable th2) {
                        th = th2;
                        AFLogger.valueOf(th.getMessage(), th);
                        if (fileReader != null) {
                            fileReader.close();
                        }
                        return null;
                    }
                } catch (Throwable th3) {
                    if (fileReader != null) {
                        try {
                            fileReader.close();
                        } catch (Throwable th4) {
                            AFLogger.valueOf(th4.getMessage(), th4);
                        }
                    }
                    throw th3;
                }
            } catch (FileNotFoundException unused2) {
                fileReader = null;
            } catch (Throwable th5) {
                th = th5;
                fileReader = null;
            }
        } catch (Throwable th6) {
            AFLogger.valueOf(th6.getMessage(), th6);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static boolean AFInAppEventType(java.io.File r3) {
        /*
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 73
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
            r1 = 1
            r2 = 0
            if (r0 != 0) goto L1a
            r0 = 0
            int r0 = r0.length     // Catch: java.lang.Throwable -> L18
            if (r3 == 0) goto L14
            r0 = 0
            goto L15
        L14:
            r0 = 1
        L15:
            if (r0 == 0) goto L1c
            goto L3a
        L18:
            r3 = move-exception
            throw r3
        L1a:
            if (r3 == 0) goto L3a
        L1c:
            boolean r3 = r3.exists()
            if (r3 != 0) goto L23
            goto L3a
        L23:
            int r3 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r3 = r3 + 53
            int r0 = r3 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r0
            int r3 = r3 % 2
            if (r3 == 0) goto L30
            goto L31
        L30:
            r1 = 0
        L31:
            if (r1 == 0) goto L39
            r3 = 49
            int r3 = r3 / r2
            return r2
        L37:
            r3 = move-exception
            throw r3
        L39:
            return r2
        L3a:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.AFInAppEventType(java.io.File):boolean");
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0030 A[Catch: all -> 0x001d, TRY_LEAVE, TryCatch #0 {all -> 0x001d, blocks: (B:5:0x0010, B:17:0x0026, B:19:0x0030), top: B:35:0x0010 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.io.File AFLogger$LogLevel(java.lang.String r4) {
        /*
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 115
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
            r1 = 1
            r2 = 0
            if (r0 == 0) goto L1f
            r0 = 93
            int r0 = r0 / r2
            r0 = 79
            if (r4 == 0) goto L18
            r3 = 47
            goto L1a
        L18:
            r3 = 79
        L1a:
            if (r3 == r0) goto L59
            goto L26
        L1d:
            r4 = move-exception
            goto L51
        L1f:
            if (r4 == 0) goto L23
            r0 = 1
            goto L24
        L23:
            r0 = 0
        L24:
            if (r0 == 0) goto L59
        L26:
            java.lang.String r0 = r4.trim()     // Catch: java.lang.Throwable -> L1d
            int r0 = r0.length()     // Catch: java.lang.Throwable -> L1d
            if (r0 <= 0) goto L59
            java.io.File r0 = new java.io.File     // Catch: java.lang.Throwable -> L1d
            java.lang.String r4 = r4.trim()     // Catch: java.lang.Throwable -> L1d
            r0.<init>(r4)     // Catch: java.lang.Throwable -> L1d
            int r4 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r4 = r4 + 37
            int r3 = r4 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r3
            int r4 = r4 % 2
            if (r4 == 0) goto L47
            r4 = 1
            goto L48
        L47:
            r4 = 0
        L48:
            if (r4 == r1) goto L4b
            return r0
        L4b:
            r4 = 40
            int r4 = r4 / r2
            return r0
        L4f:
            r4 = move-exception
            throw r4
        L51:
            java.lang.String r0 = r4.getMessage()
            com.appsflyer.AFLogger.valueOf(r0, r4)
            goto L63
        L59:
            int r4 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r4 = r4 + 5
            int r0 = r4 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r0
            int r4 = r4 % 2
        L63:
            r4 = 0
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 105
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.AFLogger$LogLevel(java.lang.String):java.io.File");
    }

    private String onAttributionFailureNative(Context context) {
        SharedPreferences sharedPreferencesAFInAppEventType = AFInAppEventType(context);
        String strAFInAppEventParameterName = AFInAppEventParameterName("preInstallName");
        if (strAFInAppEventParameterName == null) {
            Object[] objArr = null;
            if ((sharedPreferencesAFInAppEventType.contains("preInstallName") ? (char) 20 : 'B') == 20) {
                strAFInAppEventParameterName = sharedPreferencesAFInAppEventType.getString("preInstallName", null);
            } else {
                if (AFKeystoreWrapper(context)) {
                    strAFInAppEventParameterName = onInstallConversionFailureNative(context);
                    if ((strAFInAppEventParameterName != null ? (char) 7 : 'Z') != 7) {
                        strAFInAppEventParameterName = AFKeystoreWrapper(context, "AF_PRE_INSTALL_NAME");
                        int i = waitForCustomerUserId + 57;
                        setCustomerIdAndLogSession = i % 128;
                        int i2 = i % 2;
                    }
                }
                if (strAFInAppEventParameterName != null) {
                    int i3 = waitForCustomerUserId + 3;
                    setCustomerIdAndLogSession = i3 % 128;
                    char c = i3 % 2 == 0 ? '7' : '.';
                    valueOf(context, "preInstallName", strAFInAppEventParameterName);
                    if (c == '7') {
                        int length = objArr.length;
                    }
                }
            }
            if (strAFInAppEventParameterName != null) {
                values("preInstallName", strAFInAppEventParameterName);
            }
            return strAFInAppEventParameterName;
        }
        int i4 = setCustomerIdAndLogSession + 65;
        waitForCustomerUserId = i4 % 128;
        int i5 = i4 % 2;
        return strAFInAppEventParameterName;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0028  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void onAppOpenAttributionNative(android.content.Context r8) {
        /*
            r7 = this;
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 81
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
            r1 = 87
            if (r0 == 0) goto L11
            r0 = 87
            goto L13
        L11:
            r0 = 13
        L13:
            r2 = 1
            r3 = 0
            if (r0 == r1) goto L1c
            boolean r0 = r7.onResponseError
            if (r0 != 0) goto L73
            goto L28
        L1c:
            boolean r0 = r7.onResponseError
            r1 = 67
            int r1 = r1 / r3
            if (r0 != 0) goto L25
            r0 = 1
            goto L26
        L25:
            r0 = 0
        L26:
            if (r0 == 0) goto L73
        L28:
            long r0 = java.lang.System.currentTimeMillis()
            long r4 = r7.AFVersionDeclaration
            long r0 = r0 - r4
            r4 = 15000(0x3a98, double:7.411E-320)
            int r6 = (r0 > r4 ? 1 : (r0 == r4 ? 0 : -1))
            if (r6 >= 0) goto L36
            goto L73
        L36:
            java.util.concurrent.ScheduledExecutorService r0 = r7.onAttributionFailure
            if (r0 == 0) goto L51
            int r8 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r8 = r8 + 61
            int r0 = r8 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r0
            int r8 = r8 % 2
            if (r8 == 0) goto L47
            r2 = 0
        L47:
            if (r2 == 0) goto L4a
            return
        L4a:
            r8 = 0
            super.hashCode()     // Catch: java.lang.Throwable -> L4f
            return
        L4f:
            r8 = move-exception
            throw r8
        L51:
            com.appsflyer.internal.k r0 = com.appsflyer.internal.k.values
            if (r0 != 0) goto L5c
            com.appsflyer.internal.k r0 = new com.appsflyer.internal.k
            r0.<init>()
            com.appsflyer.internal.k.values = r0
        L5c:
            com.appsflyer.internal.k r0 = com.appsflyer.internal.k.values
            java.util.concurrent.ScheduledThreadPoolExecutor r0 = r0.AFKeystoreWrapper()
            r7.onAttributionFailure = r0
            com.appsflyer.internal.ac$e r0 = new com.appsflyer.internal.ac$e
            r0.<init>(r8)
            java.util.concurrent.ScheduledExecutorService r8 = r7.onAttributionFailure
            r1 = 1
            java.util.concurrent.TimeUnit r3 = java.util.concurrent.TimeUnit.SECONDS
            valueOf(r8, r0, r1, r3)
            return
        L73:
            int r8 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r8 = r8 + 55
            int r0 = r8 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r0
            int r8 = r8 % 2
            if (r8 != 0) goto L81
            r8 = 0
            goto L82
        L81:
            r8 = 1
        L82:
            if (r8 == r2) goto L8a
            r8 = 94
            int r8 = r8 / r3
            return
        L88:
            r8 = move-exception
            throw r8
        L8a:
            return
        L8b:
            r8 = move-exception
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.onAppOpenAttributionNative(android.content.Context):void");
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x0043, code lost:
    
        if (r0.equals("") != false) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0056, code lost:
    
        if ((r0.equals("") ? 'M' : 5) != 'M') goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0059, code lost:
    
        r0 = com.appsflyer.internal.ac.waitForCustomerUserId + 113;
        com.appsflyer.internal.ac.setCustomerIdAndLogSession = r0 % 128;
        r0 = r0 % 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0064, code lost:
    
        return null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String AFInAppEventParameterName(android.content.Context r4) {
        /*
            r3 = this;
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 83
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r1 = "channel"
            java.lang.String r0 = r0.getString(r1)
            if (r0 != 0) goto L1c
            java.lang.String r0 = "CHANNEL"
            java.lang.String r0 = r3.AFKeystoreWrapper(r4, r0)
        L1c:
            r4 = 86
            if (r0 == 0) goto L23
            r1 = 86
            goto L25
        L23:
            r1 = 41
        L25:
            if (r1 == r4) goto L28
            goto L58
        L28:
            int r4 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r4 = r4 + 107
            int r1 = r4 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r4 = r4 % 2
            r1 = 47
            if (r4 != 0) goto L39
            r4 = 47
            goto L3b
        L39:
            r4 = 56
        L3b:
            java.lang.String r2 = ""
            if (r4 == r1) goto L46
            boolean r4 = r0.equals(r2)
            if (r4 == 0) goto L58
            goto L59
        L46:
            boolean r4 = r0.equals(r2)
            r1 = 26
            int r1 = r1 / 0
            r1 = 77
            if (r4 == 0) goto L55
            r4 = 77
            goto L56
        L55:
            r4 = 5
        L56:
            if (r4 == r1) goto L59
        L58:
            return r0
        L59:
            r4 = 0
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 113
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
            return r4
        L65:
            r4 = move-exception
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.AFInAppEventParameterName(android.content.Context):java.lang.String");
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final boolean isPreInstalledApp(Context context) {
        try {
            if (((context.getPackageManager().getApplicationInfo(context.getPackageName(), 0).flags & 1) != 0 ? '[' : '\\') == '[') {
                int i = setCustomerIdAndLogSession + 97;
                waitForCustomerUserId = i % 128;
                return (i % 2 != 0 ? 'P' : '1') != 'P';
            }
        } catch (PackageManager.NameNotFoundException e2) {
            AFLogger.valueOf("Could not check if app is pre installed", e2);
        }
        int i2 = waitForCustomerUserId + 109;
        setCustomerIdAndLogSession = i2 % 128;
        int i3 = i2 % 2;
        return false;
    }

    public final String AFInAppEventParameterName(Context context, String str) {
        SharedPreferences sharedPreferencesAFInAppEventType = AFInAppEventType(context);
        if (!(sharedPreferencesAFInAppEventType.contains("CACHED_CHANNEL"))) {
            valueOf(context, "CACHED_CHANNEL", str);
            return str;
        }
        int i = waitForCustomerUserId + 101;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        String string = sharedPreferencesAFInAppEventType.getString("CACHED_CHANNEL", null);
        int i3 = waitForCustomerUserId + 15;
        setCustomerIdAndLogSession = i3 % 128;
        int i4 = i3 % 2;
        return string;
    }

    private String AFInAppEventType(SimpleDateFormat simpleDateFormat, Context context) {
        String str;
        String string = AFInAppEventType(context).getString("appsFlyerFirstInstall", null);
        if ((string == null ? ')' : (char) 18) != 18) {
            if (AFKeystoreWrapper(context)) {
                AFLogger.AFInAppEventParameterName("AppsFlyer: first launch detected");
                str = simpleDateFormat.format(new Date());
                int i = setCustomerIdAndLogSession + 25;
                waitForCustomerUserId = i % 128;
                int i2 = i % 2;
            } else {
                str = "";
            }
            string = str;
            valueOf(context, "appsFlyerFirstInstall", string);
            int i3 = waitForCustomerUserId + 113;
            setCustomerIdAndLogSession = i3 % 128;
            int i4 = i3 % 2;
        }
        AFLogger.values("AppsFlyer: first launch date: ".concat(String.valueOf(string)));
        return string;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final String getAttributionId(Context context) {
        try {
            String strAFInAppEventParameterName = new ae(context).AFInAppEventParameterName();
            int i = waitForCustomerUserId + 19;
            setCustomerIdAndLogSession = i % 128;
            int i2 = i % 2;
            return strAFInAppEventParameterName;
        } catch (Throwable th) {
            AFLogger.valueOf("Could not collect facebook attribution id. ", th);
            return null;
        }
    }

    public static synchronized SharedPreferences AFInAppEventType(Context context) {
        int i = setCustomerIdAndLogSession + 79;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        if (AFInAppEventParameterName().getSdkVersion == null) {
            int i3 = waitForCustomerUserId + 25;
            setCustomerIdAndLogSession = i3 % 128;
            int i4 = i3 % 2;
            AFInAppEventParameterName().getSdkVersion = context.getApplicationContext().getSharedPreferences("appsflyer-data", 0);
            int i5 = setCustomerIdAndLogSession + 7;
            waitForCustomerUserId = i5 % 128;
            int i6 = i5 % 2;
        }
        return AFInAppEventParameterName().getSdkVersion;
    }

    public final bv values(Context context) {
        bf bfVar = this.setCustomerUserId;
        if (context != null) {
            be beVar = bfVar.AFKeystoreWrapper;
            if (context != null) {
                beVar.values = context.getApplicationContext();
            }
        }
        Context context2 = this.setCustomerUserId.AFKeystoreWrapper.values;
        if (context2 != null) {
            return new bc(AFInAppEventType(context2));
        }
        throw new IllegalStateException("Context must be set via setContext method before calling this dependency.");
    }

    public final int valueOf(SharedPreferences sharedPreferences, boolean z) {
        int i = waitForCustomerUserId + 3;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        int iValueOf = valueOf(sharedPreferences, "appsFlyerCount", z);
        int i3 = waitForCustomerUserId + 119;
        setCustomerIdAndLogSession = i3 % 128;
        if ((i3 % 2 == 0 ? 'A' : '2') == '2') {
            return iValueOf;
        }
        int i4 = 84 / 0;
        return iValueOf;
    }

    private int AFKeystoreWrapper(SharedPreferences sharedPreferences, boolean z) {
        int i = setCustomerIdAndLogSession + 117;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        int iValueOf = valueOf(sharedPreferences, "appsFlyerInAppEventCount", z);
        int i3 = setCustomerIdAndLogSession + 5;
        waitForCustomerUserId = i3 % 128;
        int i4 = i3 % 2;
        return iValueOf;
    }

    private int valueOf(SharedPreferences sharedPreferences) {
        int i = setCustomerIdAndLogSession + 3;
        waitForCustomerUserId = i % 128;
        int iValueOf = (i % 2 != 0 ? '6' : (char) 11) != 11 ? valueOf(sharedPreferences, "appsFlyerAdRevenueCount", false) : valueOf(sharedPreferences, "appsFlyerAdRevenueCount", true);
        int i2 = setCustomerIdAndLogSession + 117;
        waitForCustomerUserId = i2 % 128;
        if (i2 % 2 == 0) {
            return iValueOf;
        }
        int i3 = 85 / 0;
        return iValueOf;
    }

    private static int valueOf(SharedPreferences sharedPreferences, String str, boolean z) {
        int i = waitForCustomerUserId + 87;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        int i3 = sharedPreferences.getInt(str, 0);
        if (z) {
            i3++;
            SharedPreferences.Editor editorEdit = sharedPreferences.edit();
            editorEdit.putInt(str, i3);
            AFInAppEventType(editorEdit);
            int i4 = setCustomerIdAndLogSession + 43;
            waitForCustomerUserId = i4 % 128;
            int i5 = i4 % 2;
        }
        if (ak.AFInAppEventType().AFVersionDeclaration()) {
            ak.AFInAppEventType().values(String.valueOf(i3));
        }
        return i3;
    }

    private long onAppOpenAttribution(Context context) {
        int i = setCustomerIdAndLogSession + 51;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        long j = AFInAppEventType(context).getLong("AppsFlyerTimePassedSincePrevLaunch", 0L);
        long jCurrentTimeMillis = System.currentTimeMillis();
        AFInAppEventType(context, "AppsFlyerTimePassedSincePrevLaunch", jCurrentTimeMillis);
        if ((j > 0 ? (char) 24 : (char) 0) == 0) {
            return -1L;
        }
        long j2 = jCurrentTimeMillis - j;
        int i3 = waitForCustomerUserId + 33;
        setCustomerIdAndLogSession = i3 % 128;
        return (i3 % 2 == 0 ? '%' : (char) 31) != '%' ? j2 / 1000 : j2 - 1000;
    }

    private void AFInAppEventParameterName(i iVar) throws Throwable {
        String strEncodeToString;
        StringBuilder sb = new StringBuilder("url: ");
        sb.append(iVar.onDeepLinkingNative);
        AFLogger.values(sb.toString());
        if (iVar.init != null) {
            strEncodeToString = Base64.encodeToString(iVar.AFInAppEventParameterName(), 2);
            AFLogger.values("cached data: ".concat(String.valueOf(strEncodeToString)));
        } else {
            strEncodeToString = new JSONObject(iVar.values()).toString();
            String strReplaceAll = strEncodeToString.replaceAll("\\p{C}", "*Non-printing character*");
            if (strReplaceAll.equals(strEncodeToString) ? false : true) {
                int i = waitForCustomerUserId + 65;
                setCustomerIdAndLogSession = i % 128;
                int i2 = i % 2;
                AFLogger.AppsFlyer2dXConversionCallback("Payload contains non-printing characters");
                strEncodeToString = strReplaceAll;
            }
            ai.AFKeystoreWrapper("data: ".concat(String.valueOf(strEncodeToString)));
            int i3 = setCustomerIdAndLogSession + 47;
            waitForCustomerUserId = i3 % 128;
            int i4 = i3 % 2;
        }
        ak.AFInAppEventType().AFInAppEventType(iVar.onDeepLinkingNative, strEncodeToString);
        try {
            init(iVar);
        } catch (IOException e2) {
            AFLogger.valueOf("Exception in sendRequestToServer. ", e2);
            if (AppsFlyerProperties.getInstance().getBoolean(AppsFlyerProperties.USE_HTTP_FALLBACK, false)) {
                init(iVar.AFInAppEventType(iVar.onDeepLinkingNative.replace("https:", "http:")));
                return;
            }
            StringBuilder sb2 = new StringBuilder("failed to send request to server. ");
            sb2.append(e2.getLocalizedMessage());
            AFLogger.values(sb2.toString());
            throw e2;
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void validateAndLogInAppPurchase(Context context, String str, String str2, String str3, String str4, String str5, Map<String, String> map) {
        ak akVarAFInAppEventType = ak.AFInAppEventType();
        String[] strArr = new String[6];
        strArr[0] = str;
        strArr[1] = str2;
        strArr[2] = str3;
        strArr[3] = str4;
        strArr[4] = str5;
        strArr[5] = map == null ? "" : map.toString();
        akVarAFInAppEventType.AFKeystoreWrapper("validateAndTrackInAppPurchase", strArr);
        if (!isStopped()) {
            StringBuilder sb = new StringBuilder("Validate in app called with parameters: ");
            sb.append(str3);
            sb.append(" ");
            sb.append(str4);
            sb.append(" ");
            sb.append(str5);
            AFLogger.values(sb.toString());
        }
        if (str == null || str4 == null || str2 == null || str5 == null || str3 == null) {
            AppsFlyerInAppPurchaseValidatorListener appsFlyerInAppPurchaseValidatorListener = AFInAppEventParameterName;
            if (appsFlyerInAppPurchaseValidatorListener != null) {
                appsFlyerInAppPurchaseValidatorListener.onValidateInAppFailure("Please provide purchase parameters");
                return;
            }
            return;
        }
        Context applicationContext = context.getApplicationContext();
        String devKey = AppsFlyerProperties.getInstance().getDevKey();
        if (context instanceof Activity) {
            ((Activity) context).getIntent();
        }
        new Thread(new ad(applicationContext, devKey, str, str2, str3, str4, str5, map)).start();
    }

    public static void valueOf(ScheduledExecutorService scheduledExecutorService, Runnable runnable, long j, TimeUnit timeUnit) {
        if (scheduledExecutorService != null) {
            try {
                if (!scheduledExecutorService.isShutdown()) {
                    int i = setCustomerIdAndLogSession + 87;
                    waitForCustomerUserId = i % 128;
                    int i2 = i % 2;
                    if (!(scheduledExecutorService.isTerminated())) {
                        int i3 = setCustomerIdAndLogSession + 25;
                        waitForCustomerUserId = i3 % 128;
                        int i4 = i3 % 2;
                        scheduledExecutorService.schedule(runnable, j, timeUnit);
                        return;
                    }
                }
            } catch (RejectedExecutionException e2) {
                AFLogger.valueOf("scheduleJob failed with RejectedExecutionException Exception", e2);
                return;
            } catch (Throwable th) {
                AFLogger.valueOf("scheduleJob failed with Exception", th);
                return;
            }
        }
        AFLogger.AppsFlyer2dXConversionCallback("scheduler is null, shut downed or terminated");
        int i5 = setCustomerIdAndLogSession + 45;
        waitForCustomerUserId = i5 % 128;
        int i6 = i5 % 2;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final boolean isStopped() {
        int i = waitForCustomerUserId + 59;
        int i2 = i % 128;
        setCustomerIdAndLogSession = i2;
        int i3 = i % 2;
        boolean z = this.getInstance;
        int i4 = i2 + 123;
        waitForCustomerUserId = i4 % 128;
        if ((i4 % 2 != 0 ? 'D' : '0') == '0') {
            return z;
        }
        Object[] objArr = null;
        int length = objArr.length;
        return z;
    }

    public static String AFInAppEventParameterName(HttpURLConnection httpURLConnection) {
        InputStreamReader inputStreamReader;
        Object obj;
        StringBuilder sb = new StringBuilder();
        BufferedReader bufferedReader = null;
        try {
            try {
                InputStream errorStream = httpURLConnection.getErrorStream();
                if (errorStream == null) {
                    errorStream = httpURLConnection.getInputStream();
                }
                inputStreamReader = new InputStreamReader(errorStream);
                try {
                    BufferedReader bufferedReader2 = new BufferedReader(inputStreamReader);
                    boolean z = false;
                    while (true) {
                        try {
                            String line = bufferedReader2.readLine();
                            if (line == null) {
                                break;
                            }
                            int i = waitForCustomerUserId;
                            int i2 = i + 27;
                            setCustomerIdAndLogSession = i2 % 128;
                            int i3 = i2 % 2;
                            if (z) {
                                int i4 = i + 115;
                                setCustomerIdAndLogSession = i4 % 128;
                                int i5 = i4 % 2;
                                obj = '\n';
                            } else {
                                obj = "";
                            }
                            sb.append(obj);
                            sb.append(line);
                            z = true;
                        } catch (Throwable th) {
                            th = th;
                            bufferedReader = bufferedReader2;
                            try {
                                StringBuilder sb2 = new StringBuilder("Could not read connection response from: ");
                                sb2.append(httpURLConnection.getURL().toString());
                                AFLogger.valueOf(sb2.toString(), th);
                                if (bufferedReader != null) {
                                    bufferedReader.close();
                                }
                                if (!(inputStreamReader == null)) {
                                    inputStreamReader.close();
                                    int i6 = setCustomerIdAndLogSession + 23;
                                    waitForCustomerUserId = i6 % 128;
                                    int i7 = i6 % 2;
                                }
                            } catch (Throwable th2) {
                                if (bufferedReader != null) {
                                    try {
                                        bufferedReader.close();
                                    } catch (Throwable th3) {
                                        AFLogger.values(th3);
                                        throw th2;
                                    }
                                }
                                if (inputStreamReader == null) {
                                    z = false;
                                }
                                if (z) {
                                    inputStreamReader.close();
                                }
                                int i8 = setCustomerIdAndLogSession + 111;
                                waitForCustomerUserId = i8 % 128;
                                int i9 = i8 % 2;
                                throw th2;
                            }
                        }
                    }
                    bufferedReader2.close();
                    inputStreamReader.close();
                } catch (Throwable th4) {
                    th = th4;
                }
            } catch (Throwable th5) {
                th = th5;
                inputStreamReader = null;
            }
        } catch (Throwable th6) {
            AFLogger.values(th6);
        }
        String string = sb.toString();
        try {
            new JSONObject(string);
            return string;
        } catch (JSONException unused) {
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("string_response", string);
                return jSONObject.toString();
            } catch (JSONException unused2) {
                return new JSONObject().toString();
            }
        }
    }

    private static float onResponseNative(Context context) {
        int intExtra;
        int intExtra2;
        float f = 1.0f;
        try {
            Intent intentRegisterReceiver = context.getApplicationContext().registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
            intExtra = intentRegisterReceiver.getIntExtra(FirebaseAnalytics.Param.LEVEL, -1);
            intExtra2 = intentRegisterReceiver.getIntExtra("scale", -1);
        } catch (Throwable th) {
            AFLogger.valueOf(th.getMessage(), th);
        }
        if (intExtra == -1) {
            return 50.0f;
        }
        int i = waitForCustomerUserId + 83;
        int i2 = i % 128;
        setCustomerIdAndLogSession = i2;
        int i3 = i % 2;
        if (!(intExtra2 != -1)) {
            return 50.0f;
        }
        f = (intExtra / intExtra2) * 100.0f;
        int i4 = i2 + 93;
        waitForCustomerUserId = i4 % 128;
        int i5 = i4 % 2;
        int i6 = setCustomerIdAndLogSession + 117;
        waitForCustomerUserId = i6 % 128;
        int i7 = i6 % 2;
        return f;
    }

    private static boolean onConversionDataSuccess(Context context) {
        if (context != null) {
            if (Build.VERSION.SDK_INT >= 23) {
                try {
                    ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
                    Network[] allNetworks = connectivityManager.getAllNetworks();
                    int length = allNetworks.length;
                    int i = 0;
                    while (true) {
                        if (!(i >= length)) {
                            NetworkCapabilities networkCapabilities = connectivityManager.getNetworkCapabilities(allNetworks[i]);
                            if ((networkCapabilities.hasTransport(4) ? '\n' : 'Q') != 'Q') {
                                int i2 = waitForCustomerUserId + 19;
                                setCustomerIdAndLogSession = i2 % 128;
                                int i3 = i2 % 2;
                                if ((!networkCapabilities.hasCapability(15) ? (char) 14 : ':') != ':') {
                                    int i4 = waitForCustomerUserId + 87;
                                    setCustomerIdAndLogSession = i4 % 128;
                                    if (i4 % 2 != 0) {
                                        return true;
                                    }
                                    Object obj = null;
                                    super.hashCode();
                                    return true;
                                }
                            }
                            i++;
                        } else {
                            int i5 = waitForCustomerUserId + 59;
                            setCustomerIdAndLogSession = i5 % 128;
                            int i6 = i5 % 2;
                            return false;
                        }
                    }
                } catch (Exception e2) {
                    AFLogger.valueOf("Failed collecting ivc data", e2);
                }
            } else if (Build.VERSION.SDK_INT >= 16) {
                ArrayList arrayList = new ArrayList();
                try {
                    for (NetworkInterface networkInterface : Collections.list(NetworkInterface.getNetworkInterfaces())) {
                        if (networkInterface.isUp()) {
                            arrayList.add(networkInterface.getName());
                        }
                    }
                    return arrayList.contains("tun0");
                } catch (Exception e3) {
                    AFLogger.valueOf("Failed collecting ivc data", e3);
                }
            }
        }
        return false;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setHost(String str, String str2) {
        int i = setCustomerIdAndLogSession + 43;
        waitForCustomerUserId = i % 128;
        int i2 = i % 2;
        if ((str != null ? 'W' : '0') == 'W') {
            values("custom_host_prefix", str);
        }
        if (!(str2 == null)) {
            int i3 = setCustomerIdAndLogSession + 3;
            waitForCustomerUserId = i3 % 128;
            int i4 = i3 % 2;
            if (!str2.isEmpty()) {
                values("custom_host", str2);
                return;
            }
        }
        AFLogger.AppsFlyer2dXConversionCallback("hostName cannot be null or empty");
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final String getHostName() {
        int i = waitForCustomerUserId + 93;
        setCustomerIdAndLogSession = i % 128;
        int i2 = i % 2;
        String strAFInAppEventParameterName = AFInAppEventParameterName("custom_host");
        if (!(strAFInAppEventParameterName != null)) {
            return "appsflyer.com";
        }
        int i3 = waitForCustomerUserId + 3;
        int i4 = i3 % 128;
        setCustomerIdAndLogSession = i4;
        int i5 = i3 % 2;
        int i6 = i4 + 41;
        waitForCustomerUserId = i6 % 128;
        if ((i6 % 2 != 0 ? 'Y' : '4') != 'Y') {
            return strAFInAppEventParameterName;
        }
        int i7 = 76 / 0;
        return strAFInAppEventParameterName;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final String getHostPrefix() {
        String strAFInAppEventParameterName;
        int i = waitForCustomerUserId + 95;
        setCustomerIdAndLogSession = i % 128;
        if (i % 2 == 0) {
            strAFInAppEventParameterName = AFInAppEventParameterName("custom_host_prefix");
            Object[] objArr = null;
            int length = objArr.length;
            if ((strAFInAppEventParameterName != null ? (char) 15 : '2') != 15) {
                return "";
            }
        } else {
            strAFInAppEventParameterName = AFInAppEventParameterName("custom_host_prefix");
            if ((strAFInAppEventParameterName != null ? (char) 1 : (char) 26) != 1) {
                return "";
            }
        }
        int i2 = setCustomerIdAndLogSession + 119;
        waitForCustomerUserId = i2 % 128;
        int i3 = i2 % 2;
        return strAFInAppEventParameterName;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void setMinTimeBetweenSessions(int i) {
        int i2 = setCustomerIdAndLogSession + 19;
        waitForCustomerUserId = i2 % 128;
        if (!(i2 % 2 == 0)) {
            this.onConversionDataSuccess = TimeUnit.SECONDS.toMillis(i);
            int i3 = 88 / 0;
        } else {
            this.onConversionDataSuccess = TimeUnit.SECONDS.toMillis(i);
        }
        int i4 = setCustomerIdAndLogSession + 83;
        waitForCustomerUserId = i4 % 128;
        if (i4 % 2 != 0) {
            Object[] objArr = null;
            int length = objArr.length;
        }
    }

    public final dd[] valueOf() {
        dd[] ddVarArrAFInAppEventType;
        int i = setCustomerIdAndLogSession + 45;
        waitForCustomerUserId = i % 128;
        if ((i % 2 != 0 ? (char) 26 : '2') != 26) {
            ddVarArrAFInAppEventType = values().AFLogger$LogLevel().AFInAppEventType();
        } else {
            ddVarArrAFInAppEventType = values().AFLogger$LogLevel().AFInAppEventType();
            Object[] objArr = null;
            int length = objArr.length;
        }
        int i2 = waitForCustomerUserId + 27;
        setCustomerIdAndLogSession = i2 % 128;
        int i3 = i2 % 2;
        return ddVarArrAFInAppEventType;
    }

    class b implements Runnable {
        private final i values;

        /* synthetic */ b(ac acVar, i iVar, byte b) {
            this(iVar);
        }

        private b(i iVar) {
            this.values = iVar;
        }

        @Override // java.lang.Runnable
        public final void run() {
            ac.AFInAppEventParameterName(ac.this, this.values);
        }
    }

    class d implements Runnable {
        private final i AFInAppEventType;

        /* synthetic */ d(ac acVar, i iVar, byte b) {
            this(iVar);
        }

        private d(i iVar) {
            this.AFInAppEventType = iVar;
        }

        @Override // java.lang.Runnable
        public final void run() {
            IOException iOException;
            String str;
            boolean zValueOf = this.AFInAppEventType.valueOf();
            if (!ac.this.isStopped()) {
                Map<String, Object> mapValues = this.AFInAppEventType.values();
                String str2 = this.AFInAppEventType.onDeepLinkingNative;
                int i = this.AFInAppEventType.onInstallConversionFailureNative;
                Application application = this.AFInAppEventType.AFKeystoreWrapper;
                byte[] bArr = new byte[0];
                if (zValueOf && i <= 2) {
                    ArrayList arrayList = new ArrayList();
                    for (dd ddVar : ac.this.valueOf()) {
                        boolean z = ddVar instanceof cx;
                        int i2 = AnonymousClass9.AFKeystoreWrapper[ddVar.AFInAppEventParameterName.ordinal()];
                        if (i2 == 1) {
                            if (z) {
                                mapValues.put("rfr", ((cx) ddVar).valueOf);
                                ac.AFInAppEventType(application).edit().putBoolean(AppsFlyerProperties.NEW_REFERRER_SENT, true).apply();
                            }
                            arrayList.add(ddVar.AFInAppEventType);
                        } else if (i2 == 2 && i == 2 && !z) {
                            HashMap map = new HashMap();
                            map.put("source", ddVar.AFKeystoreWrapper);
                            map.put("response", "TIMEOUT");
                            map.putAll(new da());
                            arrayList.add(map);
                        }
                    }
                    if (!arrayList.isEmpty()) {
                        mapValues.put("referrers", arrayList);
                    }
                    if (ac.AFKeystoreWrapper(ac.this) != null) {
                        mapValues.put("fb_ddl", ac.AFKeystoreWrapper(ac.this));
                    }
                    if (ac.valueOf(ac.this) != null) {
                        if (ac.valueOf(ac.this).AFKeystoreWrapper()) {
                            List<String> listValues = ac.valueOf(ac.this).values();
                            if (listValues != null && !listValues.isEmpty()) {
                                mapValues.put("preload_id", listValues);
                            }
                        } else {
                            mapValues.put("preload_id", Collections.singletonList("timeout"));
                        }
                    }
                }
                if (!(this.AFInAppEventType instanceof ck)) {
                    ca caVarInit = ac.values(ac.this).init();
                    mapValues.putAll(new d.C0008d(mapValues, caVarInit.AFInAppEventType.values));
                    mapValues.putAll(caVarInit.AFInAppEventParameterName());
                }
                try {
                    try {
                        if (this.AFInAppEventType instanceof ck) {
                            str = (String) mapValues.get("af_key");
                        } else {
                            str = (String) mapValues.get("appsflyerKey");
                        }
                        this.AFInAppEventType.AFVersionDeclaration = str;
                        synchronized (mapValues) {
                            try {
                                try {
                                    byte[] bArr2 = (byte[]) ((Class) com.appsflyer.internal.e.AFInAppEventParameterName((ViewConfiguration.getDoubleTapTimeout() >> 16) + 24, KeyEvent.getDeadChar(0, 0) + 48, (char) ((SystemClock.uptimeMillis() > 0L ? 1 : (SystemClock.uptimeMillis() == 0L ? 0 : -1)) + 14196))).getMethod("AFInAppEventType", i.class, String.class).invoke(null, this.AFInAppEventType, str);
                                    try {
                                        try {
                                            ac acVar = ac.this;
                                            i iVar = this.AFInAppEventType;
                                            iVar.AFLogger$LogLevel = bArr2;
                                            ac.AFInAppEventType(acVar, iVar);
                                            return;
                                        } catch (IOException e) {
                                            iOException = e;
                                            bArr = bArr2;
                                            AFLogger.valueOf("Exception while sending request to server. ", iOException);
                                            if (bArr != null && application != null && !str2.contains("&isCachedRequest=true&timeincache=")) {
                                                ac.this.values().AFVersionDeclaration().AFInAppEventParameterName(new n(str2, bArr, "6.5.4"));
                                                AFLogger.valueOf(iOException.getMessage(), iOException);
                                            }
                                            AppsFlyerRequestListener appsFlyerRequestListener = this.AFInAppEventType.AFInAppEventParameterName;
                                            if (appsFlyerRequestListener != null) {
                                                appsFlyerRequestListener.onError(RequestError.NETWORK_FAILURE, iOException.getMessage());
                                            }
                                            ac acVar2 = ac.this;
                                            i iVar2 = this.AFInAppEventType;
                                            cg.AFInAppEventType(acVar2, iVar2, iVar2.AFVersionDeclaration, application, ac.AFInAppEventType(application), null, iOException);
                                            return;
                                        }
                                    } catch (Throwable th) {
                                        th = th;
                                        bArr = bArr2;
                                        throw th;
                                    }
                                } catch (Throwable th2) {
                                    Throwable cause = th2.getCause();
                                    if (cause == null) {
                                        throw th2;
                                    }
                                    throw cause;
                                }
                            } catch (Throwable th3) {
                                th = th3;
                            }
                        }
                        throw th;
                    } catch (Throwable th4) {
                        AFLogger.AFInAppEventParameterName(th4.getMessage(), th4);
                        AppsFlyerRequestListener appsFlyerRequestListener2 = this.AFInAppEventType.AFInAppEventParameterName;
                        if (appsFlyerRequestListener2 != null) {
                            appsFlyerRequestListener2.onError(RequestError.NETWORK_FAILURE, th4.getMessage());
                        }
                    }
                } catch (IOException e2) {
                    iOException = e2;
                }
            } else {
                AppsFlyerRequestListener appsFlyerRequestListener3 = this.AFInAppEventType.AFInAppEventParameterName;
                if (appsFlyerRequestListener3 != null) {
                    appsFlyerRequestListener3.onError(RequestError.STOP_TRACKING, ba.values);
                }
            }
        }
    }

    /* JADX INFO: renamed from: com.appsflyer.internal.ac$9, reason: invalid class name */
    static /* synthetic */ class AnonymousClass9 {
        static final /* synthetic */ int[] AFKeystoreWrapper;
        static final /* synthetic */ int[] values;

        static {
            int[] iArr = new int[dd.d.values().length];
            AFKeystoreWrapper = iArr;
            try {
                iArr[dd.d.FINISHED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                AFKeystoreWrapper[dd.d.STARTED.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            int[] iArr2 = new int[AppsFlyerProperties.EmailsCryptType.values().length];
            values = iArr2;
            try {
                iArr2[AppsFlyerProperties.EmailsCryptType.SHA256.ordinal()] = 1;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                values[AppsFlyerProperties.EmailsCryptType.NONE.ordinal()] = 2;
            } catch (NoSuchFieldError unused4) {
            }
        }
    }

    class e implements Runnable {
        private final Application AFKeystoreWrapper;

        public e(Context context) {
            this.AFKeystoreWrapper = (Application) context.getApplicationContext();
        }

        @Override // java.lang.Runnable
        public final void run() {
            if (ac.AFInAppEventType(ac.this)) {
                return;
            }
            ac.this.AFVersionDeclaration = System.currentTimeMillis();
            ac.values(ac.this, true);
            try {
                try {
                    String devKey = AppsFlyerProperties.getInstance().getDevKey();
                    for (n nVar : ac.this.values().AFVersionDeclaration().AFInAppEventType()) {
                        StringBuilder sb = new StringBuilder("resending request: ");
                        sb.append(nVar.valueOf);
                        AFLogger.values(sb.toString());
                        try {
                            long jCurrentTimeMillis = System.currentTimeMillis();
                            long j = Long.parseLong(nVar.AFInAppEventParameterName, 10);
                            ac acVar = ac.this;
                            cn cnVar = new cn();
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append(nVar.valueOf);
                            sb2.append("&isCachedRequest=true&timeincache=");
                            sb2.append((jCurrentTimeMillis - j) / 1000);
                            i iVarAFInAppEventType = cnVar.AFInAppEventType(sb2.toString());
                            iVarAFInAppEventType.AFLogger$LogLevel = nVar.AFInAppEventParameterName();
                            iVarAFInAppEventType.AFVersionDeclaration = devKey;
                            Application application = this.AFKeystoreWrapper;
                            if (application != null) {
                                iVarAFInAppEventType.AFKeystoreWrapper = (Application) application.getApplicationContext();
                            }
                            iVarAFInAppEventType.init = nVar.AFInAppEventParameterName;
                            ac.AFInAppEventType(acVar, iVarAFInAppEventType);
                        } catch (Exception e) {
                            AFLogger.valueOf("Failed to resend cached request", e);
                        }
                    }
                } catch (Exception e2) {
                    AFLogger.valueOf("failed to check cache. ", e2);
                }
                ac.values(ac.this, false);
                ac.getLevel(ac.this).shutdown();
                ac.AFInAppEventParameterName(ac.this, (ScheduledExecutorService) null);
            } catch (Throwable th) {
                ac.values(ac.this, false);
                throw th;
            }
        }
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void performOnDeepLinking(final Intent intent, Context context) {
        int i = setCustomerIdAndLogSession;
        int i2 = i + 33;
        waitForCustomerUserId = i2 % 128;
        int i3 = i2 % 2;
        if (intent == null) {
            int i4 = i + 65;
            waitForCustomerUserId = i4 % 128;
            int i5 = i4 % 2;
            ao.AFInAppEventType("performOnDeepLinking was called with null intent", DeepLinkResult.Error.DEVELOPER_ERROR);
            return;
        }
        if (context == null) {
            int i6 = i + 95;
            waitForCustomerUserId = i6 % 128;
            int i7 = i6 % 2;
            ao.AFInAppEventType("performOnDeepLinking was called with null context", DeepLinkResult.Error.DEVELOPER_ERROR);
            return;
        }
        final Context applicationContext = context.getApplicationContext();
        bf bfVar = this.setCustomerUserId;
        if ((applicationContext != null ? (char) 3 : 'J') != 'J') {
            int i8 = waitForCustomerUserId + 113;
            setCustomerIdAndLogSession = i8 % 128;
            int i9 = i8 % 2;
            be beVar = bfVar.AFKeystoreWrapper;
            if (!(applicationContext == null)) {
                int i10 = setCustomerIdAndLogSession + 67;
                waitForCustomerUserId = i10 % 128;
                if (i10 % 2 != 0) {
                    beVar.values = applicationContext.getApplicationContext();
                    int i11 = 59 / 0;
                } else {
                    beVar.values = applicationContext.getApplicationContext();
                }
                int i12 = waitForCustomerUserId + 5;
                setCustomerIdAndLogSession = i12 % 128;
                int i13 = i12 % 2;
            }
        }
        final cl level = values().getLevel();
        this.setOaidData.execute(new Runnable() { // from class: com.appsflyer.internal.ac.4
            @Override // java.lang.Runnable
            public final void run() {
                f.valueOf();
                Intent intent2 = intent;
                Context context2 = applicationContext;
                cl clVar = level;
                Context context3 = ac.values(ac.this).AFKeystoreWrapper.values;
                if (context3 != null) {
                    bc bcVar = new bc(ac.AFInAppEventType(context3));
                    Uri uriAFKeystoreWrapper = f.AFKeystoreWrapper(intent2);
                    boolean z = (uriAFKeystoreWrapper == null || uriAFKeystoreWrapper.toString().isEmpty()) ? false : true;
                    if (ac.AFInAppEventType(context2).getBoolean("ddl_sent", false) && !z) {
                        ao.AFInAppEventType("No direct deep link", null);
                        return;
                    } else {
                        f.valueOf().valueOf(new HashMap(), clVar, intent2, bcVar, context2);
                        return;
                    }
                }
                throw new IllegalStateException("Context must be set via setContext method before calling this dependency.");
            }
        });
        int i14 = waitForCustomerUserId + 1;
        setCustomerIdAndLogSession = i14 % 128;
        int i15 = i14 % 2;
    }

    @Override // com.appsflyer.AppsFlyerLib
    public final void logEvent(Context context, String str, Map<String, Object> map, AppsFlyerRequestListener appsFlyerRequestListener) {
        HashMap map2 = map == null ? null : new HashMap(map);
        bf bfVar = this.setCustomerUserId;
        if (context != null) {
            be beVar = bfVar.AFKeystoreWrapper;
            if (context != null) {
                beVar.values = context.getApplicationContext();
            }
        }
        co coVar = new co();
        if (context != null) {
            coVar.AFKeystoreWrapper = (Application) context.getApplicationContext();
        }
        coVar.getLevel = str;
        coVar.AFInAppEventParameterName = appsFlyerRequestListener;
        if (map2 != null && map2.containsKey(AFInAppEventParameterName.TOUCH_OBJ)) {
            HashMap map3 = new HashMap();
            Object obj = map2.get(AFInAppEventParameterName.TOUCH_OBJ);
            if (obj instanceof MotionEvent) {
                MotionEvent motionEvent = (MotionEvent) obj;
                HashMap map4 = new HashMap();
                map4.put("x", Float.valueOf(motionEvent.getX()));
                map4.put("y", Float.valueOf(motionEvent.getY()));
                map3.put("loc", map4);
                map3.put("pf", Float.valueOf(motionEvent.getPressure()));
                map3.put("rad", Float.valueOf(motionEvent.getTouchMajor() / 2.0f));
            } else {
                map3.put("error", "Parsing failed due to invalid input in 'af_touch_obj'.");
                AFLogger.valueOf("Parsing failed due to invalid input in 'af_touch_obj'.");
            }
            Map<String, ?> mapSingletonMap = Collections.singletonMap("tch_data", map3);
            map2.remove(AFInAppEventParameterName.TOUCH_OBJ);
            coVar.AFInAppEventParameterName(mapSingletonMap);
        }
        coVar.values = map2;
        ak akVarAppsFlyer2dXConversionCallback = values().AppsFlyer2dXConversionCallback();
        String[] strArr = new String[2];
        strArr[0] = str;
        strArr[1] = new JSONObject(coVar.values == null ? new HashMap() : coVar.values).toString();
        akVarAppsFlyer2dXConversionCallback.AFKeystoreWrapper("logEvent", strArr);
        if (str != null) {
            w.AFKeystoreWrapper(context).AFInAppEventType();
        } else {
            AFInAppEventParameterName(context, ch.logEvent);
        }
        AFKeystoreWrapper(coVar, context instanceof Activity ? (Activity) context : null);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0024 A[PHI: r0
      0x0024: PHI (r0v5 com.appsflyer.internal.bf) = (r0v3 com.appsflyer.internal.bf), (r0v9 com.appsflyer.internal.bf) binds: [B:15:0x0022, B:10:0x001b] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0048 A[PHI: r0
      0x0048: PHI (r0v7 com.appsflyer.internal.be) = (r0v6 com.appsflyer.internal.be), (r0v8 com.appsflyer.internal.be) binds: [B:30:0x0045, B:22:0x0035] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.appsflyer.AppsFlyerLib
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void sendAdRevenue(android.content.Context r6, java.util.Map<java.lang.String, java.lang.Object> r7) {
        /*
            r5 = this;
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 35
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
            r2 = 0
            if (r0 != 0) goto L20
            com.appsflyer.internal.bf r0 = r5.setCustomerUserId
            r3 = 18
            int r3 = r3 / r2
            r3 = 96
            if (r6 == 0) goto L19
            r4 = 96
            goto L1b
        L19:
            r4 = 82
        L1b:
            if (r4 == r3) goto L24
            goto L4e
        L1e:
            r6 = move-exception
            throw r6
        L20:
            com.appsflyer.internal.bf r0 = r5.setCustomerUserId
            if (r6 == 0) goto L4e
        L24:
            int r1 = r1 + 65
            int r3 = r1 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r3
            int r1 = r1 % 2
            if (r1 == 0) goto L2f
            r2 = 1
        L2f:
            if (r2 == 0) goto L3a
            com.appsflyer.internal.be r0 = r0.AFKeystoreWrapper
            r1 = 0
            int r1 = r1.length     // Catch: java.lang.Throwable -> L38
            if (r6 == 0) goto L4e
            goto L48
        L38:
            r6 = move-exception
            throw r6
        L3a:
            com.appsflyer.internal.be r0 = r0.AFKeystoreWrapper
            r1 = 43
            if (r6 == 0) goto L43
            r2 = 43
            goto L45
        L43:
            r2 = 22
        L45:
            if (r2 == r1) goto L48
            goto L4e
        L48:
            android.content.Context r1 = r6.getApplicationContext()
            r0.values = r1
        L4e:
            com.appsflyer.internal.ck r0 = new com.appsflyer.internal.ck
            r0.<init>()
            if (r6 == 0) goto L67
            int r1 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r1 = r1 + 29
            int r2 = r1 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r2
            int r1 = r1 % 2
            android.content.Context r6 = r6.getApplicationContext()
            android.app.Application r6 = (android.app.Application) r6
            r0.AFKeystoreWrapper = r6
        L67:
            r0.values = r7
            r5.AFKeystoreWrapper(r0)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.sendAdRevenue(android.content.Context, java.util.Map):void");
    }

    private void AFKeystoreWrapper(i iVar) {
        Application application = iVar.AFKeystoreWrapper;
        String str = String.format(onInstallConversionFailureNative, AppsFlyerLib.getInstance().getHostPrefix(), AFInAppEventParameterName().getHostName());
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(application.getPackageName());
        String string = sb.toString();
        SharedPreferences sharedPreferencesAFInAppEventType = AFInAppEventType(application);
        int iValueOf = valueOf(sharedPreferencesAFInAppEventType, false);
        int iValueOf2 = valueOf(sharedPreferencesAFInAppEventType);
        HashMap map = new HashMap();
        map.put("ad_network", iVar.values);
        map.put("adrevenue_counter", Integer.valueOf(iValueOf2));
        String devKey = AppsFlyerProperties.getInstance().getDevKey();
        map.put("af_key", devKey);
        map.put("launch_counter", Integer.valueOf(iValueOf));
        map.put(values("ᳲ洀Ｆ䤸\udb2e┷띈œ鍏ᵯ潬磻", 29172 - (ExpandableListView.getPackedPositionForChild(0, 0) > 0L ? 1 : (ExpandableListView.getPackedPositionForChild(0, 0) == 0L ? 0 : -1))).intern(), Long.toString(new Date().getTime()));
        map.put(ProfileTable.Columns.COLUMN_UID, af.valueOf(new WeakReference(application)));
        String string2 = AppsFlyerProperties.getInstance().getString("advertiserId");
        String string3 = AppsFlyerProperties.getInstance().getString("advertiserIdEnabled");
        if (!(string3 == null)) {
            int i = waitForCustomerUserId + 115;
            setCustomerIdAndLogSession = i % 128;
            int i2 = i % 2;
            map.put("advertiserIdEnabled", string3);
        }
        if (string2 != null) {
            map.put("advertiserId", string2);
        }
        valueOf(application, map);
        map.put("device", Build.DEVICE);
        values(application, map);
        try {
            PackageInfo packageInfo = application.getPackageManager().getPackageInfo(application.getPackageName(), 0);
            map.put("app_version_code", Integer.toString(packageInfo.versionCode));
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd_HHmmssZ", Locale.US);
            map.put("install_date", valueOf(simpleDateFormat, packageInfo.firstInstallTime));
            String string4 = sharedPreferencesAFInAppEventType.getString("appsFlyerFirstInstall", null);
            if (!(string4 != null)) {
                int i3 = setCustomerIdAndLogSession + 119;
                waitForCustomerUserId = i3 % 128;
                int i4 = i3 % 2;
                string4 = AFInAppEventType(simpleDateFormat, application);
            }
            map.put("first_launch_date", string4);
        } catch (Throwable th) {
            AFLogger.valueOf("AdRevenue - Exception while collecting app version data ", th);
        }
        i iVarValueOf = iVar.AFInAppEventType(string).AFInAppEventParameterName(map).valueOf(iValueOf);
        iVarValueOf.AFVersionDeclaration = devKey;
        d dVar = new d(this, iVarValueOf, (byte) 0);
        if (k.values == null) {
            k.values = new k();
        }
        valueOf(k.values.AFKeystoreWrapper(), dVar, 1L, TimeUnit.MILLISECONDS);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0033  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    final void AFKeystoreWrapper(com.appsflyer.internal.i r7, android.app.Activity r8) {
        /*
            r6 = this;
            android.app.Application r0 = r7.AFKeystoreWrapper
            r1 = 0
            java.lang.String r2 = ""
            r3 = 1
            if (r8 == 0) goto L33
            int r4 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r4 = r4 + 35
            int r5 = r4 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r5
            int r4 = r4 % 2
            android.content.Intent r4 = r8.getIntent()
            if (r4 == 0) goto L1a
            r4 = 0
            goto L1b
        L1a:
            r4 = 1
        L1b:
            if (r4 == 0) goto L1e
            goto L33
        L1e:
            android.net.Uri r8 = com.appsflyer.internal.ap.AFKeystoreWrapper(r8)
            if (r8 == 0) goto L33
            int r4 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r4 = r4 + 117
            int r5 = r4 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r5
            int r4 = r4 % 2
            java.lang.String r8 = r8.toString()
            goto L34
        L33:
            r8 = r2
        L34:
            com.appsflyer.AppsFlyerProperties r4 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r4 = r4.getDevKey()
            if (r4 != 0) goto L3f
            r1 = 1
        L3f:
            if (r1 == r3) goto L67
            com.appsflyer.AppsFlyerProperties r1 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r0 = r1.getReferrer(r0)
            r1 = 46
            if (r0 != 0) goto L50
            r3 = 46
            goto L52
        L50:
            r3 = 58
        L52:
            if (r3 == r1) goto L5f
            int r1 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r1 = r1 + 97
            int r2 = r1 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r2
            int r1 = r1 % 2
            r2 = r0
        L5f:
            r7.AppsFlyer2dXConversionCallback = r2
            r7.valueOf = r8
            r6.values(r7)
            return
        L67:
            java.lang.String r8 = "[LogEvent/Launch] AppsFlyer's SDK cannot send any event without providing DevKey."
            com.appsflyer.AFLogger.AppsFlyer2dXConversionCallback(r8)
            com.appsflyer.attribution.AppsFlyerRequestListener r7 = r7.AFInAppEventParameterName
            if (r7 == 0) goto L77
            int r8 = com.appsflyer.attribution.RequestError.NO_DEV_KEY
            java.lang.String r0 = com.appsflyer.internal.ba.AFInAppEventParameterName
            r7.onError(r8, r0)
        L77:
            int r7 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r7 = r7 + 97
            int r8 = r7 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r8
            int r7 = r7 % 2
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.AFKeystoreWrapper(com.appsflyer.internal.i, android.app.Activity):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x006e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void values(com.appsflyer.internal.i r6) {
        /*
            r5 = this;
            java.lang.String r0 = r6.getLevel
            r1 = 0
            r2 = 1
            if (r0 != 0) goto L8
            r0 = 1
            goto L9
        L8:
            r0 = 0
        L9:
            boolean r3 = r5.AFKeystoreWrapper()
            if (r3 == 0) goto L11
            r3 = 1
            goto L12
        L11:
            r3 = 0
        L12:
            if (r3 == 0) goto L1a
            java.lang.String r6 = "CustomerUserId not set, reporting is disabled"
            com.appsflyer.AFLogger.values(r6, r2)
            return
        L1a:
            if (r0 == 0) goto L83
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 43
            int r3 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r3
            int r0 = r0 % 2
            if (r0 == 0) goto L2a
            r0 = 0
            goto L2b
        L2a:
            r0 = 1
        L2b:
            java.lang.String r3 = "launchProtectEnabled"
            if (r0 == r2) goto L3a
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            boolean r0 = r0.getBoolean(r3, r2)
            if (r0 == 0) goto L6e
            goto L48
        L3a:
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            boolean r0 = r0.getBoolean(r3, r2)
            if (r0 == 0) goto L45
            goto L46
        L45:
            r2 = 0
        L46:
            if (r2 == 0) goto L6e
        L48:
            boolean r0 = r5.getLevel()
            if (r0 == 0) goto L73
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 79
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
            com.appsflyer.attribution.AppsFlyerRequestListener r6 = r6.AFInAppEventParameterName
            r0 = 41
            if (r6 == 0) goto L61
            r1 = 41
            goto L63
        L61:
            r1 = 22
        L63:
            if (r1 == r0) goto L66
            goto L6d
        L66:
            int r0 = com.appsflyer.attribution.RequestError.EVENT_TIMEOUT
            java.lang.String r1 = com.appsflyer.internal.ba.valueOf
            r6.onError(r0, r1)
        L6d:
            return
        L6e:
            java.lang.String r0 = "Allowing multiple launches within a 5 second time window."
            com.appsflyer.AFLogger.values(r0)
        L73:
            long r2 = java.lang.System.currentTimeMillis()
            r5.onAppOpenAttribution = r2
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 101
            int r2 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r2
            int r0 = r0 % 2
        L83:
            com.appsflyer.internal.k r0 = com.appsflyer.internal.k.values
            if (r0 != 0) goto L8e
            com.appsflyer.internal.k r0 = new com.appsflyer.internal.k
            r0.<init>()
            com.appsflyer.internal.k.values = r0
        L8e:
            com.appsflyer.internal.k r0 = com.appsflyer.internal.k.values
            java.util.concurrent.ScheduledThreadPoolExecutor r0 = r0.AFKeystoreWrapper()
            com.appsflyer.internal.ac$b r2 = new com.appsflyer.internal.ac$b
            r2.<init>(r5, r6, r1)
            r3 = 0
            java.util.concurrent.TimeUnit r6 = java.util.concurrent.TimeUnit.MILLISECONDS
            valueOf(r0, r2, r3, r6)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.values(com.appsflyer.internal.i):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00a6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void valueOf(com.appsflyer.internal.i r11) {
        /*
            Method dump skipped, instruction units count: 549
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.valueOf(com.appsflyer.internal.i):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:175:0x0428 A[Catch: all -> 0x0810, TryCatch #6 {all -> 0x0810, blocks: (B:15:0x00ae, B:17:0x00b4, B:21:0x00c1, B:23:0x00d1, B:24:0x00d9, B:26:0x00ec, B:31:0x0104, B:33:0x0120, B:34:0x0125, B:36:0x012d, B:37:0x0132, B:39:0x013a, B:44:0x0147, B:46:0x01ba, B:48:0x01c0, B:50:0x01c6, B:51:0x01d3, B:53:0x01dc, B:56:0x01f0, B:58:0x01f7, B:59:0x01ff, B:61:0x0205, B:54:0x01e5, B:62:0x020c, B:64:0x0224, B:65:0x0229, B:68:0x0231, B:69:0x0234, B:71:0x023b, B:72:0x023e, B:74:0x0248, B:76:0x024e, B:77:0x0251, B:79:0x0259, B:80:0x0262, B:85:0x0279, B:87:0x0284, B:90:0x028e, B:91:0x0293, B:93:0x029b, B:95:0x02af, B:98:0x02bf, B:100:0x02c9, B:101:0x02d3, B:103:0x02db, B:104:0x02e0, B:106:0x02ee, B:111:0x02fb, B:113:0x0301, B:115:0x0307, B:116:0x030a, B:118:0x0314, B:122:0x031e, B:123:0x0323, B:125:0x0329, B:126:0x0332, B:128:0x0338, B:129:0x0341, B:131:0x0347, B:134:0x0354, B:136:0x035a, B:142:0x0371, B:144:0x0377, B:145:0x037c, B:147:0x0385, B:152:0x03a0, B:153:0x03ac, B:155:0x03b2, B:156:0x03bb, B:158:0x03c3, B:160:0x03ca, B:161:0x03e0, B:162:0x03e5, B:164:0x03ed, B:165:0x03f2, B:175:0x0428, B:176:0x042d, B:177:0x0430, B:179:0x043b, B:184:0x0459, B:189:0x046e, B:194:0x0483, B:199:0x0498, B:200:0x04af, B:202:0x04bd, B:237:0x0573, B:239:0x0590, B:241:0x059a, B:243:0x059e, B:245:0x05a6, B:246:0x05ac, B:247:0x05c2, B:249:0x05ce, B:252:0x05e3, B:254:0x05f5, B:253:0x05f0, B:259:0x0610, B:261:0x0616, B:265:0x0624, B:266:0x062b, B:268:0x0635, B:269:0x0647, B:273:0x0668, B:275:0x0675, B:294:0x06e0, B:296:0x06e6, B:298:0x06ed, B:302:0x06f7, B:304:0x0732, B:305:0x0740, B:307:0x07ae, B:309:0x07d1, B:311:0x07fa, B:313:0x07fe, B:308:0x07bf, B:281:0x0686, B:283:0x0695, B:284:0x0698, B:285:0x069e, B:287:0x06af, B:288:0x06b9, B:290:0x06cd, B:291:0x06d0, B:293:0x06dd, B:258:0x05fb, B:236:0x056e, B:209:0x04ce, B:198:0x0493, B:193:0x047e, B:188:0x0469, B:183:0x0444, B:171:0x041b, B:173:0x0420, B:148:0x038c, B:150:0x0395, B:137:0x035e, B:139:0x0368, B:141:0x036e, B:314:0x0804, B:110:0x02f6, B:84:0x026b, B:94:0x02ac, B:43:0x0142, B:30:0x00ff, B:22:0x00cc, B:167:0x0408), top: B:332:0x00ae, inners: #3, #4, #5, #7, #8, #10, #11, #13, #15, #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:179:0x043b A[Catch: Exception -> 0x0442, all -> 0x0810, TRY_LEAVE, TryCatch #17 {Exception -> 0x0442, blocks: (B:177:0x0430, B:179:0x043b), top: B:351:0x0430, outer: #6 }] */
    /* JADX WARN: Removed duplicated region for block: B:212:0x04ea A[Catch: all -> 0x0565, TryCatch #0 {all -> 0x0565, blocks: (B:210:0x04d3, B:212:0x04ea, B:213:0x04ef), top: B:320:0x04d3 }] */
    /* JADX WARN: Removed duplicated region for block: B:239:0x0590 A[Catch: all -> 0x0810, TryCatch #6 {all -> 0x0810, blocks: (B:15:0x00ae, B:17:0x00b4, B:21:0x00c1, B:23:0x00d1, B:24:0x00d9, B:26:0x00ec, B:31:0x0104, B:33:0x0120, B:34:0x0125, B:36:0x012d, B:37:0x0132, B:39:0x013a, B:44:0x0147, B:46:0x01ba, B:48:0x01c0, B:50:0x01c6, B:51:0x01d3, B:53:0x01dc, B:56:0x01f0, B:58:0x01f7, B:59:0x01ff, B:61:0x0205, B:54:0x01e5, B:62:0x020c, B:64:0x0224, B:65:0x0229, B:68:0x0231, B:69:0x0234, B:71:0x023b, B:72:0x023e, B:74:0x0248, B:76:0x024e, B:77:0x0251, B:79:0x0259, B:80:0x0262, B:85:0x0279, B:87:0x0284, B:90:0x028e, B:91:0x0293, B:93:0x029b, B:95:0x02af, B:98:0x02bf, B:100:0x02c9, B:101:0x02d3, B:103:0x02db, B:104:0x02e0, B:106:0x02ee, B:111:0x02fb, B:113:0x0301, B:115:0x0307, B:116:0x030a, B:118:0x0314, B:122:0x031e, B:123:0x0323, B:125:0x0329, B:126:0x0332, B:128:0x0338, B:129:0x0341, B:131:0x0347, B:134:0x0354, B:136:0x035a, B:142:0x0371, B:144:0x0377, B:145:0x037c, B:147:0x0385, B:152:0x03a0, B:153:0x03ac, B:155:0x03b2, B:156:0x03bb, B:158:0x03c3, B:160:0x03ca, B:161:0x03e0, B:162:0x03e5, B:164:0x03ed, B:165:0x03f2, B:175:0x0428, B:176:0x042d, B:177:0x0430, B:179:0x043b, B:184:0x0459, B:189:0x046e, B:194:0x0483, B:199:0x0498, B:200:0x04af, B:202:0x04bd, B:237:0x0573, B:239:0x0590, B:241:0x059a, B:243:0x059e, B:245:0x05a6, B:246:0x05ac, B:247:0x05c2, B:249:0x05ce, B:252:0x05e3, B:254:0x05f5, B:253:0x05f0, B:259:0x0610, B:261:0x0616, B:265:0x0624, B:266:0x062b, B:268:0x0635, B:269:0x0647, B:273:0x0668, B:275:0x0675, B:294:0x06e0, B:296:0x06e6, B:298:0x06ed, B:302:0x06f7, B:304:0x0732, B:305:0x0740, B:307:0x07ae, B:309:0x07d1, B:311:0x07fa, B:313:0x07fe, B:308:0x07bf, B:281:0x0686, B:283:0x0695, B:284:0x0698, B:285:0x069e, B:287:0x06af, B:288:0x06b9, B:290:0x06cd, B:291:0x06d0, B:293:0x06dd, B:258:0x05fb, B:236:0x056e, B:209:0x04ce, B:198:0x0493, B:193:0x047e, B:188:0x0469, B:183:0x0444, B:171:0x041b, B:173:0x0420, B:148:0x038c, B:150:0x0395, B:137:0x035e, B:139:0x0368, B:141:0x036e, B:314:0x0804, B:110:0x02f6, B:84:0x026b, B:94:0x02ac, B:43:0x0142, B:30:0x00ff, B:22:0x00cc, B:167:0x0408), top: B:332:0x00ae, inners: #3, #4, #5, #7, #8, #10, #11, #13, #15, #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:241:0x059a A[Catch: all -> 0x0810, TryCatch #6 {all -> 0x0810, blocks: (B:15:0x00ae, B:17:0x00b4, B:21:0x00c1, B:23:0x00d1, B:24:0x00d9, B:26:0x00ec, B:31:0x0104, B:33:0x0120, B:34:0x0125, B:36:0x012d, B:37:0x0132, B:39:0x013a, B:44:0x0147, B:46:0x01ba, B:48:0x01c0, B:50:0x01c6, B:51:0x01d3, B:53:0x01dc, B:56:0x01f0, B:58:0x01f7, B:59:0x01ff, B:61:0x0205, B:54:0x01e5, B:62:0x020c, B:64:0x0224, B:65:0x0229, B:68:0x0231, B:69:0x0234, B:71:0x023b, B:72:0x023e, B:74:0x0248, B:76:0x024e, B:77:0x0251, B:79:0x0259, B:80:0x0262, B:85:0x0279, B:87:0x0284, B:90:0x028e, B:91:0x0293, B:93:0x029b, B:95:0x02af, B:98:0x02bf, B:100:0x02c9, B:101:0x02d3, B:103:0x02db, B:104:0x02e0, B:106:0x02ee, B:111:0x02fb, B:113:0x0301, B:115:0x0307, B:116:0x030a, B:118:0x0314, B:122:0x031e, B:123:0x0323, B:125:0x0329, B:126:0x0332, B:128:0x0338, B:129:0x0341, B:131:0x0347, B:134:0x0354, B:136:0x035a, B:142:0x0371, B:144:0x0377, B:145:0x037c, B:147:0x0385, B:152:0x03a0, B:153:0x03ac, B:155:0x03b2, B:156:0x03bb, B:158:0x03c3, B:160:0x03ca, B:161:0x03e0, B:162:0x03e5, B:164:0x03ed, B:165:0x03f2, B:175:0x0428, B:176:0x042d, B:177:0x0430, B:179:0x043b, B:184:0x0459, B:189:0x046e, B:194:0x0483, B:199:0x0498, B:200:0x04af, B:202:0x04bd, B:237:0x0573, B:239:0x0590, B:241:0x059a, B:243:0x059e, B:245:0x05a6, B:246:0x05ac, B:247:0x05c2, B:249:0x05ce, B:252:0x05e3, B:254:0x05f5, B:253:0x05f0, B:259:0x0610, B:261:0x0616, B:265:0x0624, B:266:0x062b, B:268:0x0635, B:269:0x0647, B:273:0x0668, B:275:0x0675, B:294:0x06e0, B:296:0x06e6, B:298:0x06ed, B:302:0x06f7, B:304:0x0732, B:305:0x0740, B:307:0x07ae, B:309:0x07d1, B:311:0x07fa, B:313:0x07fe, B:308:0x07bf, B:281:0x0686, B:283:0x0695, B:284:0x0698, B:285:0x069e, B:287:0x06af, B:288:0x06b9, B:290:0x06cd, B:291:0x06d0, B:293:0x06dd, B:258:0x05fb, B:236:0x056e, B:209:0x04ce, B:198:0x0493, B:193:0x047e, B:188:0x0469, B:183:0x0444, B:171:0x041b, B:173:0x0420, B:148:0x038c, B:150:0x0395, B:137:0x035e, B:139:0x0368, B:141:0x036e, B:314:0x0804, B:110:0x02f6, B:84:0x026b, B:94:0x02ac, B:43:0x0142, B:30:0x00ff, B:22:0x00cc, B:167:0x0408), top: B:332:0x00ae, inners: #3, #4, #5, #7, #8, #10, #11, #13, #15, #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:261:0x0616 A[Catch: all -> 0x0810, TryCatch #6 {all -> 0x0810, blocks: (B:15:0x00ae, B:17:0x00b4, B:21:0x00c1, B:23:0x00d1, B:24:0x00d9, B:26:0x00ec, B:31:0x0104, B:33:0x0120, B:34:0x0125, B:36:0x012d, B:37:0x0132, B:39:0x013a, B:44:0x0147, B:46:0x01ba, B:48:0x01c0, B:50:0x01c6, B:51:0x01d3, B:53:0x01dc, B:56:0x01f0, B:58:0x01f7, B:59:0x01ff, B:61:0x0205, B:54:0x01e5, B:62:0x020c, B:64:0x0224, B:65:0x0229, B:68:0x0231, B:69:0x0234, B:71:0x023b, B:72:0x023e, B:74:0x0248, B:76:0x024e, B:77:0x0251, B:79:0x0259, B:80:0x0262, B:85:0x0279, B:87:0x0284, B:90:0x028e, B:91:0x0293, B:93:0x029b, B:95:0x02af, B:98:0x02bf, B:100:0x02c9, B:101:0x02d3, B:103:0x02db, B:104:0x02e0, B:106:0x02ee, B:111:0x02fb, B:113:0x0301, B:115:0x0307, B:116:0x030a, B:118:0x0314, B:122:0x031e, B:123:0x0323, B:125:0x0329, B:126:0x0332, B:128:0x0338, B:129:0x0341, B:131:0x0347, B:134:0x0354, B:136:0x035a, B:142:0x0371, B:144:0x0377, B:145:0x037c, B:147:0x0385, B:152:0x03a0, B:153:0x03ac, B:155:0x03b2, B:156:0x03bb, B:158:0x03c3, B:160:0x03ca, B:161:0x03e0, B:162:0x03e5, B:164:0x03ed, B:165:0x03f2, B:175:0x0428, B:176:0x042d, B:177:0x0430, B:179:0x043b, B:184:0x0459, B:189:0x046e, B:194:0x0483, B:199:0x0498, B:200:0x04af, B:202:0x04bd, B:237:0x0573, B:239:0x0590, B:241:0x059a, B:243:0x059e, B:245:0x05a6, B:246:0x05ac, B:247:0x05c2, B:249:0x05ce, B:252:0x05e3, B:254:0x05f5, B:253:0x05f0, B:259:0x0610, B:261:0x0616, B:265:0x0624, B:266:0x062b, B:268:0x0635, B:269:0x0647, B:273:0x0668, B:275:0x0675, B:294:0x06e0, B:296:0x06e6, B:298:0x06ed, B:302:0x06f7, B:304:0x0732, B:305:0x0740, B:307:0x07ae, B:309:0x07d1, B:311:0x07fa, B:313:0x07fe, B:308:0x07bf, B:281:0x0686, B:283:0x0695, B:284:0x0698, B:285:0x069e, B:287:0x06af, B:288:0x06b9, B:290:0x06cd, B:291:0x06d0, B:293:0x06dd, B:258:0x05fb, B:236:0x056e, B:209:0x04ce, B:198:0x0493, B:193:0x047e, B:188:0x0469, B:183:0x0444, B:171:0x041b, B:173:0x0420, B:148:0x038c, B:150:0x0395, B:137:0x035e, B:139:0x0368, B:141:0x036e, B:314:0x0804, B:110:0x02f6, B:84:0x026b, B:94:0x02ac, B:43:0x0142, B:30:0x00ff, B:22:0x00cc, B:167:0x0408), top: B:332:0x00ae, inners: #3, #4, #5, #7, #8, #10, #11, #13, #15, #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:268:0x0635 A[Catch: all -> 0x0810, TryCatch #6 {all -> 0x0810, blocks: (B:15:0x00ae, B:17:0x00b4, B:21:0x00c1, B:23:0x00d1, B:24:0x00d9, B:26:0x00ec, B:31:0x0104, B:33:0x0120, B:34:0x0125, B:36:0x012d, B:37:0x0132, B:39:0x013a, B:44:0x0147, B:46:0x01ba, B:48:0x01c0, B:50:0x01c6, B:51:0x01d3, B:53:0x01dc, B:56:0x01f0, B:58:0x01f7, B:59:0x01ff, B:61:0x0205, B:54:0x01e5, B:62:0x020c, B:64:0x0224, B:65:0x0229, B:68:0x0231, B:69:0x0234, B:71:0x023b, B:72:0x023e, B:74:0x0248, B:76:0x024e, B:77:0x0251, B:79:0x0259, B:80:0x0262, B:85:0x0279, B:87:0x0284, B:90:0x028e, B:91:0x0293, B:93:0x029b, B:95:0x02af, B:98:0x02bf, B:100:0x02c9, B:101:0x02d3, B:103:0x02db, B:104:0x02e0, B:106:0x02ee, B:111:0x02fb, B:113:0x0301, B:115:0x0307, B:116:0x030a, B:118:0x0314, B:122:0x031e, B:123:0x0323, B:125:0x0329, B:126:0x0332, B:128:0x0338, B:129:0x0341, B:131:0x0347, B:134:0x0354, B:136:0x035a, B:142:0x0371, B:144:0x0377, B:145:0x037c, B:147:0x0385, B:152:0x03a0, B:153:0x03ac, B:155:0x03b2, B:156:0x03bb, B:158:0x03c3, B:160:0x03ca, B:161:0x03e0, B:162:0x03e5, B:164:0x03ed, B:165:0x03f2, B:175:0x0428, B:176:0x042d, B:177:0x0430, B:179:0x043b, B:184:0x0459, B:189:0x046e, B:194:0x0483, B:199:0x0498, B:200:0x04af, B:202:0x04bd, B:237:0x0573, B:239:0x0590, B:241:0x059a, B:243:0x059e, B:245:0x05a6, B:246:0x05ac, B:247:0x05c2, B:249:0x05ce, B:252:0x05e3, B:254:0x05f5, B:253:0x05f0, B:259:0x0610, B:261:0x0616, B:265:0x0624, B:266:0x062b, B:268:0x0635, B:269:0x0647, B:273:0x0668, B:275:0x0675, B:294:0x06e0, B:296:0x06e6, B:298:0x06ed, B:302:0x06f7, B:304:0x0732, B:305:0x0740, B:307:0x07ae, B:309:0x07d1, B:311:0x07fa, B:313:0x07fe, B:308:0x07bf, B:281:0x0686, B:283:0x0695, B:284:0x0698, B:285:0x069e, B:287:0x06af, B:288:0x06b9, B:290:0x06cd, B:291:0x06d0, B:293:0x06dd, B:258:0x05fb, B:236:0x056e, B:209:0x04ce, B:198:0x0493, B:193:0x047e, B:188:0x0469, B:183:0x0444, B:171:0x041b, B:173:0x0420, B:148:0x038c, B:150:0x0395, B:137:0x035e, B:139:0x0368, B:141:0x036e, B:314:0x0804, B:110:0x02f6, B:84:0x026b, B:94:0x02ac, B:43:0x0142, B:30:0x00ff, B:22:0x00cc, B:167:0x0408), top: B:332:0x00ae, inners: #3, #4, #5, #7, #8, #10, #11, #13, #15, #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:271:0x0665  */
    /* JADX WARN: Removed duplicated region for block: B:272:0x0667  */
    /* JADX WARN: Removed duplicated region for block: B:275:0x0675 A[Catch: all -> 0x0810, TRY_LEAVE, TryCatch #6 {all -> 0x0810, blocks: (B:15:0x00ae, B:17:0x00b4, B:21:0x00c1, B:23:0x00d1, B:24:0x00d9, B:26:0x00ec, B:31:0x0104, B:33:0x0120, B:34:0x0125, B:36:0x012d, B:37:0x0132, B:39:0x013a, B:44:0x0147, B:46:0x01ba, B:48:0x01c0, B:50:0x01c6, B:51:0x01d3, B:53:0x01dc, B:56:0x01f0, B:58:0x01f7, B:59:0x01ff, B:61:0x0205, B:54:0x01e5, B:62:0x020c, B:64:0x0224, B:65:0x0229, B:68:0x0231, B:69:0x0234, B:71:0x023b, B:72:0x023e, B:74:0x0248, B:76:0x024e, B:77:0x0251, B:79:0x0259, B:80:0x0262, B:85:0x0279, B:87:0x0284, B:90:0x028e, B:91:0x0293, B:93:0x029b, B:95:0x02af, B:98:0x02bf, B:100:0x02c9, B:101:0x02d3, B:103:0x02db, B:104:0x02e0, B:106:0x02ee, B:111:0x02fb, B:113:0x0301, B:115:0x0307, B:116:0x030a, B:118:0x0314, B:122:0x031e, B:123:0x0323, B:125:0x0329, B:126:0x0332, B:128:0x0338, B:129:0x0341, B:131:0x0347, B:134:0x0354, B:136:0x035a, B:142:0x0371, B:144:0x0377, B:145:0x037c, B:147:0x0385, B:152:0x03a0, B:153:0x03ac, B:155:0x03b2, B:156:0x03bb, B:158:0x03c3, B:160:0x03ca, B:161:0x03e0, B:162:0x03e5, B:164:0x03ed, B:165:0x03f2, B:175:0x0428, B:176:0x042d, B:177:0x0430, B:179:0x043b, B:184:0x0459, B:189:0x046e, B:194:0x0483, B:199:0x0498, B:200:0x04af, B:202:0x04bd, B:237:0x0573, B:239:0x0590, B:241:0x059a, B:243:0x059e, B:245:0x05a6, B:246:0x05ac, B:247:0x05c2, B:249:0x05ce, B:252:0x05e3, B:254:0x05f5, B:253:0x05f0, B:259:0x0610, B:261:0x0616, B:265:0x0624, B:266:0x062b, B:268:0x0635, B:269:0x0647, B:273:0x0668, B:275:0x0675, B:294:0x06e0, B:296:0x06e6, B:298:0x06ed, B:302:0x06f7, B:304:0x0732, B:305:0x0740, B:307:0x07ae, B:309:0x07d1, B:311:0x07fa, B:313:0x07fe, B:308:0x07bf, B:281:0x0686, B:283:0x0695, B:284:0x0698, B:285:0x069e, B:287:0x06af, B:288:0x06b9, B:290:0x06cd, B:291:0x06d0, B:293:0x06dd, B:258:0x05fb, B:236:0x056e, B:209:0x04ce, B:198:0x0493, B:193:0x047e, B:188:0x0469, B:183:0x0444, B:171:0x041b, B:173:0x0420, B:148:0x038c, B:150:0x0395, B:137:0x035e, B:139:0x0368, B:141:0x036e, B:314:0x0804, B:110:0x02f6, B:84:0x026b, B:94:0x02ac, B:43:0x0142, B:30:0x00ff, B:22:0x00cc, B:167:0x0408), top: B:332:0x00ae, inners: #3, #4, #5, #7, #8, #10, #11, #13, #15, #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:297:0x06ec  */
    /* JADX WARN: Removed duplicated region for block: B:300:0x06f5  */
    /* JADX WARN: Removed duplicated region for block: B:301:0x06f6  */
    /* JADX WARN: Removed duplicated region for block: B:304:0x0732 A[Catch: all -> 0x0810, TryCatch #6 {all -> 0x0810, blocks: (B:15:0x00ae, B:17:0x00b4, B:21:0x00c1, B:23:0x00d1, B:24:0x00d9, B:26:0x00ec, B:31:0x0104, B:33:0x0120, B:34:0x0125, B:36:0x012d, B:37:0x0132, B:39:0x013a, B:44:0x0147, B:46:0x01ba, B:48:0x01c0, B:50:0x01c6, B:51:0x01d3, B:53:0x01dc, B:56:0x01f0, B:58:0x01f7, B:59:0x01ff, B:61:0x0205, B:54:0x01e5, B:62:0x020c, B:64:0x0224, B:65:0x0229, B:68:0x0231, B:69:0x0234, B:71:0x023b, B:72:0x023e, B:74:0x0248, B:76:0x024e, B:77:0x0251, B:79:0x0259, B:80:0x0262, B:85:0x0279, B:87:0x0284, B:90:0x028e, B:91:0x0293, B:93:0x029b, B:95:0x02af, B:98:0x02bf, B:100:0x02c9, B:101:0x02d3, B:103:0x02db, B:104:0x02e0, B:106:0x02ee, B:111:0x02fb, B:113:0x0301, B:115:0x0307, B:116:0x030a, B:118:0x0314, B:122:0x031e, B:123:0x0323, B:125:0x0329, B:126:0x0332, B:128:0x0338, B:129:0x0341, B:131:0x0347, B:134:0x0354, B:136:0x035a, B:142:0x0371, B:144:0x0377, B:145:0x037c, B:147:0x0385, B:152:0x03a0, B:153:0x03ac, B:155:0x03b2, B:156:0x03bb, B:158:0x03c3, B:160:0x03ca, B:161:0x03e0, B:162:0x03e5, B:164:0x03ed, B:165:0x03f2, B:175:0x0428, B:176:0x042d, B:177:0x0430, B:179:0x043b, B:184:0x0459, B:189:0x046e, B:194:0x0483, B:199:0x0498, B:200:0x04af, B:202:0x04bd, B:237:0x0573, B:239:0x0590, B:241:0x059a, B:243:0x059e, B:245:0x05a6, B:246:0x05ac, B:247:0x05c2, B:249:0x05ce, B:252:0x05e3, B:254:0x05f5, B:253:0x05f0, B:259:0x0610, B:261:0x0616, B:265:0x0624, B:266:0x062b, B:268:0x0635, B:269:0x0647, B:273:0x0668, B:275:0x0675, B:294:0x06e0, B:296:0x06e6, B:298:0x06ed, B:302:0x06f7, B:304:0x0732, B:305:0x0740, B:307:0x07ae, B:309:0x07d1, B:311:0x07fa, B:313:0x07fe, B:308:0x07bf, B:281:0x0686, B:283:0x0695, B:284:0x0698, B:285:0x069e, B:287:0x06af, B:288:0x06b9, B:290:0x06cd, B:291:0x06d0, B:293:0x06dd, B:258:0x05fb, B:236:0x056e, B:209:0x04ce, B:198:0x0493, B:193:0x047e, B:188:0x0469, B:183:0x0444, B:171:0x041b, B:173:0x0420, B:148:0x038c, B:150:0x0395, B:137:0x035e, B:139:0x0368, B:141:0x036e, B:314:0x0804, B:110:0x02f6, B:84:0x026b, B:94:0x02ac, B:43:0x0142, B:30:0x00ff, B:22:0x00cc, B:167:0x0408), top: B:332:0x00ae, inners: #3, #4, #5, #7, #8, #10, #11, #13, #15, #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:307:0x07ae A[Catch: all -> 0x0810, TryCatch #6 {all -> 0x0810, blocks: (B:15:0x00ae, B:17:0x00b4, B:21:0x00c1, B:23:0x00d1, B:24:0x00d9, B:26:0x00ec, B:31:0x0104, B:33:0x0120, B:34:0x0125, B:36:0x012d, B:37:0x0132, B:39:0x013a, B:44:0x0147, B:46:0x01ba, B:48:0x01c0, B:50:0x01c6, B:51:0x01d3, B:53:0x01dc, B:56:0x01f0, B:58:0x01f7, B:59:0x01ff, B:61:0x0205, B:54:0x01e5, B:62:0x020c, B:64:0x0224, B:65:0x0229, B:68:0x0231, B:69:0x0234, B:71:0x023b, B:72:0x023e, B:74:0x0248, B:76:0x024e, B:77:0x0251, B:79:0x0259, B:80:0x0262, B:85:0x0279, B:87:0x0284, B:90:0x028e, B:91:0x0293, B:93:0x029b, B:95:0x02af, B:98:0x02bf, B:100:0x02c9, B:101:0x02d3, B:103:0x02db, B:104:0x02e0, B:106:0x02ee, B:111:0x02fb, B:113:0x0301, B:115:0x0307, B:116:0x030a, B:118:0x0314, B:122:0x031e, B:123:0x0323, B:125:0x0329, B:126:0x0332, B:128:0x0338, B:129:0x0341, B:131:0x0347, B:134:0x0354, B:136:0x035a, B:142:0x0371, B:144:0x0377, B:145:0x037c, B:147:0x0385, B:152:0x03a0, B:153:0x03ac, B:155:0x03b2, B:156:0x03bb, B:158:0x03c3, B:160:0x03ca, B:161:0x03e0, B:162:0x03e5, B:164:0x03ed, B:165:0x03f2, B:175:0x0428, B:176:0x042d, B:177:0x0430, B:179:0x043b, B:184:0x0459, B:189:0x046e, B:194:0x0483, B:199:0x0498, B:200:0x04af, B:202:0x04bd, B:237:0x0573, B:239:0x0590, B:241:0x059a, B:243:0x059e, B:245:0x05a6, B:246:0x05ac, B:247:0x05c2, B:249:0x05ce, B:252:0x05e3, B:254:0x05f5, B:253:0x05f0, B:259:0x0610, B:261:0x0616, B:265:0x0624, B:266:0x062b, B:268:0x0635, B:269:0x0647, B:273:0x0668, B:275:0x0675, B:294:0x06e0, B:296:0x06e6, B:298:0x06ed, B:302:0x06f7, B:304:0x0732, B:305:0x0740, B:307:0x07ae, B:309:0x07d1, B:311:0x07fa, B:313:0x07fe, B:308:0x07bf, B:281:0x0686, B:283:0x0695, B:284:0x0698, B:285:0x069e, B:287:0x06af, B:288:0x06b9, B:290:0x06cd, B:291:0x06d0, B:293:0x06dd, B:258:0x05fb, B:236:0x056e, B:209:0x04ce, B:198:0x0493, B:193:0x047e, B:188:0x0469, B:183:0x0444, B:171:0x041b, B:173:0x0420, B:148:0x038c, B:150:0x0395, B:137:0x035e, B:139:0x0368, B:141:0x036e, B:314:0x0804, B:110:0x02f6, B:84:0x026b, B:94:0x02ac, B:43:0x0142, B:30:0x00ff, B:22:0x00cc, B:167:0x0408), top: B:332:0x00ae, inners: #3, #4, #5, #7, #8, #10, #11, #13, #15, #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:308:0x07bf A[Catch: all -> 0x0810, TryCatch #6 {all -> 0x0810, blocks: (B:15:0x00ae, B:17:0x00b4, B:21:0x00c1, B:23:0x00d1, B:24:0x00d9, B:26:0x00ec, B:31:0x0104, B:33:0x0120, B:34:0x0125, B:36:0x012d, B:37:0x0132, B:39:0x013a, B:44:0x0147, B:46:0x01ba, B:48:0x01c0, B:50:0x01c6, B:51:0x01d3, B:53:0x01dc, B:56:0x01f0, B:58:0x01f7, B:59:0x01ff, B:61:0x0205, B:54:0x01e5, B:62:0x020c, B:64:0x0224, B:65:0x0229, B:68:0x0231, B:69:0x0234, B:71:0x023b, B:72:0x023e, B:74:0x0248, B:76:0x024e, B:77:0x0251, B:79:0x0259, B:80:0x0262, B:85:0x0279, B:87:0x0284, B:90:0x028e, B:91:0x0293, B:93:0x029b, B:95:0x02af, B:98:0x02bf, B:100:0x02c9, B:101:0x02d3, B:103:0x02db, B:104:0x02e0, B:106:0x02ee, B:111:0x02fb, B:113:0x0301, B:115:0x0307, B:116:0x030a, B:118:0x0314, B:122:0x031e, B:123:0x0323, B:125:0x0329, B:126:0x0332, B:128:0x0338, B:129:0x0341, B:131:0x0347, B:134:0x0354, B:136:0x035a, B:142:0x0371, B:144:0x0377, B:145:0x037c, B:147:0x0385, B:152:0x03a0, B:153:0x03ac, B:155:0x03b2, B:156:0x03bb, B:158:0x03c3, B:160:0x03ca, B:161:0x03e0, B:162:0x03e5, B:164:0x03ed, B:165:0x03f2, B:175:0x0428, B:176:0x042d, B:177:0x0430, B:179:0x043b, B:184:0x0459, B:189:0x046e, B:194:0x0483, B:199:0x0498, B:200:0x04af, B:202:0x04bd, B:237:0x0573, B:239:0x0590, B:241:0x059a, B:243:0x059e, B:245:0x05a6, B:246:0x05ac, B:247:0x05c2, B:249:0x05ce, B:252:0x05e3, B:254:0x05f5, B:253:0x05f0, B:259:0x0610, B:261:0x0616, B:265:0x0624, B:266:0x062b, B:268:0x0635, B:269:0x0647, B:273:0x0668, B:275:0x0675, B:294:0x06e0, B:296:0x06e6, B:298:0x06ed, B:302:0x06f7, B:304:0x0732, B:305:0x0740, B:307:0x07ae, B:309:0x07d1, B:311:0x07fa, B:313:0x07fe, B:308:0x07bf, B:281:0x0686, B:283:0x0695, B:284:0x0698, B:285:0x069e, B:287:0x06af, B:288:0x06b9, B:290:0x06cd, B:291:0x06d0, B:293:0x06dd, B:258:0x05fb, B:236:0x056e, B:209:0x04ce, B:198:0x0493, B:193:0x047e, B:188:0x0469, B:183:0x0444, B:171:0x041b, B:173:0x0420, B:148:0x038c, B:150:0x0395, B:137:0x035e, B:139:0x0368, B:141:0x036e, B:314:0x0804, B:110:0x02f6, B:84:0x026b, B:94:0x02ac, B:43:0x0142, B:30:0x00ff, B:22:0x00cc, B:167:0x0408), top: B:332:0x00ae, inners: #3, #4, #5, #7, #8, #10, #11, #13, #15, #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:311:0x07fa A[Catch: all -> 0x0810, TryCatch #6 {all -> 0x0810, blocks: (B:15:0x00ae, B:17:0x00b4, B:21:0x00c1, B:23:0x00d1, B:24:0x00d9, B:26:0x00ec, B:31:0x0104, B:33:0x0120, B:34:0x0125, B:36:0x012d, B:37:0x0132, B:39:0x013a, B:44:0x0147, B:46:0x01ba, B:48:0x01c0, B:50:0x01c6, B:51:0x01d3, B:53:0x01dc, B:56:0x01f0, B:58:0x01f7, B:59:0x01ff, B:61:0x0205, B:54:0x01e5, B:62:0x020c, B:64:0x0224, B:65:0x0229, B:68:0x0231, B:69:0x0234, B:71:0x023b, B:72:0x023e, B:74:0x0248, B:76:0x024e, B:77:0x0251, B:79:0x0259, B:80:0x0262, B:85:0x0279, B:87:0x0284, B:90:0x028e, B:91:0x0293, B:93:0x029b, B:95:0x02af, B:98:0x02bf, B:100:0x02c9, B:101:0x02d3, B:103:0x02db, B:104:0x02e0, B:106:0x02ee, B:111:0x02fb, B:113:0x0301, B:115:0x0307, B:116:0x030a, B:118:0x0314, B:122:0x031e, B:123:0x0323, B:125:0x0329, B:126:0x0332, B:128:0x0338, B:129:0x0341, B:131:0x0347, B:134:0x0354, B:136:0x035a, B:142:0x0371, B:144:0x0377, B:145:0x037c, B:147:0x0385, B:152:0x03a0, B:153:0x03ac, B:155:0x03b2, B:156:0x03bb, B:158:0x03c3, B:160:0x03ca, B:161:0x03e0, B:162:0x03e5, B:164:0x03ed, B:165:0x03f2, B:175:0x0428, B:176:0x042d, B:177:0x0430, B:179:0x043b, B:184:0x0459, B:189:0x046e, B:194:0x0483, B:199:0x0498, B:200:0x04af, B:202:0x04bd, B:237:0x0573, B:239:0x0590, B:241:0x059a, B:243:0x059e, B:245:0x05a6, B:246:0x05ac, B:247:0x05c2, B:249:0x05ce, B:252:0x05e3, B:254:0x05f5, B:253:0x05f0, B:259:0x0610, B:261:0x0616, B:265:0x0624, B:266:0x062b, B:268:0x0635, B:269:0x0647, B:273:0x0668, B:275:0x0675, B:294:0x06e0, B:296:0x06e6, B:298:0x06ed, B:302:0x06f7, B:304:0x0732, B:305:0x0740, B:307:0x07ae, B:309:0x07d1, B:311:0x07fa, B:313:0x07fe, B:308:0x07bf, B:281:0x0686, B:283:0x0695, B:284:0x0698, B:285:0x069e, B:287:0x06af, B:288:0x06b9, B:290:0x06cd, B:291:0x06d0, B:293:0x06dd, B:258:0x05fb, B:236:0x056e, B:209:0x04ce, B:198:0x0493, B:193:0x047e, B:188:0x0469, B:183:0x0444, B:171:0x041b, B:173:0x0420, B:148:0x038c, B:150:0x0395, B:137:0x035e, B:139:0x0368, B:141:0x036e, B:314:0x0804, B:110:0x02f6, B:84:0x026b, B:94:0x02ac, B:43:0x0142, B:30:0x00ff, B:22:0x00cc, B:167:0x0408), top: B:332:0x00ae, inners: #3, #4, #5, #7, #8, #10, #11, #13, #15, #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:339:0x05ce A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    final java.util.Map<java.lang.String, java.lang.Object> AFInAppEventType(com.appsflyer.internal.i r33) {
        /*
            Method dump skipped, instruction units count: 2074
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.AFInAppEventType(com.appsflyer.internal.i):java.util.Map");
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static void AFKeystoreWrapper(Context context, Map<String, Object> map) {
        a.d dVarValues = a.C0006a.valueOf.values(context);
        map.put("btl", Float.toString(dVarValues.AFInAppEventType));
        Object[] objArr = null;
        Object[] objArr2 = 0;
        if (!(dVarValues.AFKeystoreWrapper == null)) {
            int i = setCustomerIdAndLogSession + 9;
            waitForCustomerUserId = i % 128;
            if ((i % 2 != 0 ? 'Y' : '+') != '+') {
                map.put("btch", dVarValues.AFKeystoreWrapper);
                super.hashCode();
            } else {
                map.put("btch", dVarValues.AFKeystoreWrapper);
            }
        }
        int i2 = waitForCustomerUserId + 109;
        setCustomerIdAndLogSession = i2 % 128;
        if (i2 % 2 == 0) {
            int length = objArr.length;
        }
    }

    private static Map<String, Object> AFLogger$LogLevel(Context context) {
        Location locationValueOf = v.b.AFKeystoreWrapper.valueOf(context);
        HashMap map = new HashMap(3);
        if ((locationValueOf != null ? 'b' : '?') == 'b') {
            int i = waitForCustomerUserId + 83;
            setCustomerIdAndLogSession = i % 128;
            int i2 = i % 2;
            map.put("lat", String.valueOf(locationValueOf.getLatitude()));
            map.put("lon", String.valueOf(locationValueOf.getLongitude()));
            map.put("ts", String.valueOf(locationValueOf.getTime()));
            int i3 = setCustomerIdAndLogSession + 9;
            waitForCustomerUserId = i3 % 128;
            int i4 = i3 % 2;
        }
        return map;
    }

    private static void AFInAppEventType(Map<String, Object> map, cl clVar) {
        HashMap map2 = new HashMap(clVar.values);
        clVar.values.clear();
        clVar.valueOf.AFInAppEventType("gcd");
        if (!map2.isEmpty()) {
            int i = setCustomerIdAndLogSession + 43;
            waitForCustomerUserId = i % 128;
            if (!(i % 2 == 0)) {
                AFInAppEventType(map).put("gcd", map2);
                Object obj = null;
                super.hashCode();
            } else {
                AFInAppEventType(map).put("gcd", map2);
            }
        }
        int i2 = waitForCustomerUserId + 9;
        setCustomerIdAndLogSession = i2 % 128;
        int i3 = i2 % 2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0022, code lost:
    
        if ((r6 == null) != false) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x002e, code lost:
    
        if (r6 == null) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0030, code lost:
    
        r6 = com.appsflyer.internal.ac.waitForCustomerUserId + 3;
        com.appsflyer.internal.ac.setCustomerIdAndLogSession = r6 % 128;
        r0 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x003b, code lost:
    
        if ((r6 % 2) != 0) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x003d, code lost:
    
        super.hashCode();
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0043, code lost:
    
        return null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0054, code lost:
    
        return com.appsflyer.internal.af.valueOf(new java.lang.ref.WeakReference(new com.appsflyer.internal.aa(r6).AFInAppEventParameterName));
     */
    @Override // com.appsflyer.AppsFlyerLib
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String getAppsFlyerUID(android.content.Context r6) {
        /*
            r5 = this;
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 25
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
            r1 = 1
            r2 = 0
            if (r0 == 0) goto L10
            r0 = 0
            goto L11
        L10:
            r0 = 1
        L11:
            java.lang.String r3 = "getAppsFlyerUID"
            if (r0 == 0) goto L25
            com.appsflyer.internal.ak r0 = com.appsflyer.internal.ak.AFInAppEventType()
            java.lang.String[] r4 = new java.lang.String[r2]
            r0.AFKeystoreWrapper(r3, r4)
            if (r6 != 0) goto L21
            goto L22
        L21:
            r1 = 0
        L22:
            if (r1 == 0) goto L44
            goto L30
        L25:
            com.appsflyer.internal.ak r0 = com.appsflyer.internal.ak.AFInAppEventType()
            java.lang.String[] r1 = new java.lang.String[r2]
            r0.AFKeystoreWrapper(r3, r1)
            if (r6 != 0) goto L44
        L30:
            int r6 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r6 = r6 + 3
            int r0 = r6 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r0
            int r6 = r6 % 2
            r0 = 0
            if (r6 != 0) goto L43
            super.hashCode()     // Catch: java.lang.Throwable -> L41
            goto L43
        L41:
            r6 = move-exception
            throw r6
        L43:
            return r0
        L44:
            com.appsflyer.internal.aa r0 = new com.appsflyer.internal.aa
            r0.<init>(r6)
            java.lang.ref.WeakReference r6 = new java.lang.ref.WeakReference
            android.content.Context r0 = r0.AFInAppEventParameterName
            r6.<init>(r0)
            java.lang.String r6 = com.appsflyer.internal.af.valueOf(r6)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.getAppsFlyerUID(android.content.Context):java.lang.String");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00a0 A[Catch: all -> 0x017a, PHI: r1
      0x00a0: PHI (r1v6 int) = (r1v5 int), (r1v8 int) binds: [B:32:0x009e, B:29:0x0097] A[DONT_GENERATE, DONT_INLINE], TryCatch #2 {all -> 0x017a, blocks: (B:10:0x0035, B:17:0x0058, B:19:0x006f, B:22:0x007e, B:25:0x008d, B:34:0x00a5, B:40:0x00d0, B:57:0x015b, B:44:0x00fa, B:51:0x0121, B:54:0x0130, B:56:0x0147, B:55:0x013c, B:33:0x00a0, B:31:0x009a, B:68:0x0176, B:69:0x0179), top: B:80:0x0035 }] */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v2, types: [java.net.HttpURLConnection] */
    /* JADX WARN: Type inference failed for: r8v3 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void init(com.appsflyer.internal.i r15) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 388
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.init(com.appsflyer.internal.i):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x004e  */
    @Override // com.appsflyer.AppsFlyerLib
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void setLogLevel(com.appsflyer.AFLogger.LogLevel r6) {
        /*
            r5 = this;
            int r0 = com.appsflyer.internal.ac.waitForCustomerUserId
            int r0 = r0 + 23
            int r1 = r0 % 128
            com.appsflyer.internal.ac.setCustomerIdAndLogSession = r1
            int r0 = r0 % 2
            r1 = 61
            if (r0 != 0) goto L11
            r0 = 35
            goto L13
        L11:
            r0 = 61
        L13:
            r2 = 0
            r3 = 1
            if (r0 == r1) goto L2d
            int r0 = r6.getLevel()
            com.appsflyer.AFLogger$LogLevel r1 = com.appsflyer.AFLogger.LogLevel.NONE
            int r1 = r1.getLevel()
            r4 = 0
            int r4 = r4.length     // Catch: java.lang.Throwable -> L2b
            if (r0 <= r1) goto L27
            r0 = 0
            goto L28
        L27:
            r0 = 1
        L28:
            if (r0 == r3) goto L4e
            goto L42
        L2b:
            r6 = move-exception
            throw r6
        L2d:
            int r0 = r6.getLevel()
            com.appsflyer.AFLogger$LogLevel r1 = com.appsflyer.AFLogger.LogLevel.NONE
            int r1 = r1.getLevel()
            r4 = 95
            if (r0 <= r1) goto L3e
            r0 = 59
            goto L40
        L3e:
            r0 = 95
        L40:
            if (r0 == r4) goto L4e
        L42:
            int r0 = com.appsflyer.internal.ac.setCustomerIdAndLogSession
            int r0 = r0 + 29
            int r1 = r0 % 128
            com.appsflyer.internal.ac.waitForCustomerUserId = r1
            int r0 = r0 % 2
            r0 = 1
            goto L4f
        L4e:
            r0 = 0
        L4f:
            com.appsflyer.internal.ak r1 = com.appsflyer.internal.ak.AFInAppEventType()
            java.lang.String[] r3 = new java.lang.String[r3]
            java.lang.String r0 = java.lang.String.valueOf(r0)
            r3[r2] = r0
            java.lang.String r0 = "log"
            r1.AFKeystoreWrapper(r0, r3)
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            int r6 = r6.getLevel()
            java.lang.String r1 = "logLevel"
            r0.set(r1, r6)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ac.setLogLevel(com.appsflyer.AFLogger$LogLevel):void");
    }

    private static String values(String str, int i) {
        String str2;
        Object charArray = str;
        if (str != null) {
            charArray = str.toCharArray();
        }
        char[] cArr = (char[]) charArray;
        synchronized (dn.valueOf) {
            dn.AFInAppEventType = i;
            char[] cArr2 = new char[cArr.length];
            dn.values = 0;
            while (dn.values < cArr.length) {
                cArr2[dn.values] = (char) (((long) (cArr[dn.values] ^ (dn.values * dn.AFInAppEventType))) ^ enableLocationCollection);
                dn.values++;
            }
            str2 = new String(cArr2);
        }
        return str2;
    }
}
