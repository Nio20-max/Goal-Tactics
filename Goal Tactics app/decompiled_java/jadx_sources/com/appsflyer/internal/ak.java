package com.appsflyer.internal;

import android.content.pm.PackageManager;
import android.os.Build;
import android.text.TextUtils;
import android.view.View;
import com.appsflyer.AFLogger;
import com.appsflyer.AppsFlyerProperties;
import com.appsflyer.internal.bl;
import com.facebook.devicerequests.internal.DeviceRequestsHelper;
import com.ironsource.sdk.constants.Constants;
import com.ironsource.sdk.constants.Events;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.text.Typography;

/* JADX INFO: loaded from: classes.dex */
public final class ak {
    private static char AppsFlyer2dXConversionCallback = 44563;
    private static char init = 63252;
    private static char onAppOpenAttributionNative = 15493;
    private static int onDeepLinkingNative = 0;
    private static int onInstallConversionDataLoadedNative = 1;
    private static char onInstallConversionFailureNative = 10154;
    private static ak values;
    private Map<String, Object> valueOf;
    private List<String> AFInAppEventType = new ArrayList();
    private boolean AFKeystoreWrapper = true;
    private String getLevel = "-1";
    private boolean AFLogger$LogLevel = true ^ AppsFlyerProperties.getInstance().getBoolean(AppsFlyerProperties.DPM, false);
    private int AFInAppEventParameterName = 0;
    private boolean AFVersionDeclaration = false;

    private ak() {
    }

    @Deprecated
    public static ak AFInAppEventType() {
        int i = onInstallConversionDataLoadedNative + 19;
        onDeepLinkingNative = i % 128;
        int i2 = i % 2;
        if (values == null) {
            values = new ak();
        }
        ak akVar = values;
        int i3 = onDeepLinkingNative + 13;
        onInstallConversionDataLoadedNative = i3 % 128;
        if (i3 % 2 != 0) {
            return akVar;
        }
        Object obj = null;
        super.hashCode();
        return akVar;
    }

    final synchronized void values(String str) {
        int i = onInstallConversionDataLoadedNative;
        int i2 = i + 97;
        onDeepLinkingNative = i2 % 128;
        int i3 = i2 % 2;
        this.getLevel = str;
        int i4 = i + 35;
        onDeepLinkingNative = i4 % 128;
        if (i4 % 2 == 0) {
            return;
        }
        Object[] objArr = null;
        int length = objArr.length;
    }

    final synchronized void AFKeystoreWrapper() {
        this.AFVersionDeclaration = true;
        AFInAppEventParameterName("r_debugging_on", new SimpleDateFormat("yyyy-MM-dd HH:mm:ssZ", Locale.ENGLISH).format(Long.valueOf(System.currentTimeMillis())), new String[0]);
        int i = onInstallConversionDataLoadedNative + 27;
        onDeepLinkingNative = i % 128;
        int i2 = i % 2;
    }

    final synchronized void AFInAppEventParameterName() {
        AFInAppEventParameterName("r_debugging_off", new SimpleDateFormat("yyyy-MM-dd HH:mm:ssZ", Locale.ENGLISH).format(Long.valueOf(System.currentTimeMillis())), new String[0]);
        this.AFVersionDeclaration = false;
        this.AFKeystoreWrapper = false;
        int i = onDeepLinkingNative + 43;
        onInstallConversionDataLoadedNative = i % 128;
        if (!(i % 2 != 0)) {
            int i2 = 2 / 0;
        }
    }

    final synchronized void values() {
        int i = onDeepLinkingNative + 23;
        onInstallConversionDataLoadedNative = i % 128;
        Object[] objArr = null;
        if (!(i % 2 == 0)) {
            this.valueOf = null;
            values = null;
        } else {
            this.valueOf = null;
            values = null;
            int length = objArr.length;
        }
    }

    final void AFInAppEventType(String str, PackageManager packageManager) {
        int i = onDeepLinkingNative + 117;
        onInstallConversionDataLoadedNative = i % 128;
        int i2 = i % 2;
        try {
            AFInAppEventParameterName(str, packageManager);
            bl<String> blVarAFKeystoreWrapper = ac.AFInAppEventParameterName().values().valueOf().AFKeystoreWrapper(AFLogger$LogLevel());
            if (!blVarAFKeystoreWrapper.valueOf.getAndSet(true)) {
                blVarAFKeystoreWrapper.AFKeystoreWrapper.submit(new bl.AnonymousClass3(null));
                int i3 = onInstallConversionDataLoadedNative + 125;
                onDeepLinkingNative = i3 % 128;
                int i4 = i3 % 2;
                return;
            }
            throw new IllegalStateException("Http call is already executed");
        } catch (Throwable th) {
            AFLogger.values(th);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x004b, code lost:
    
        if ((!r4.AFVersionDeclaration) != false) goto L31;
     */
    /* JADX WARN: Removed duplicated region for block: B:20:0x002f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private boolean AppsFlyer2dXConversionCallback() {
        /*
            r4 = this;
            int r0 = com.appsflyer.internal.ak.onInstallConversionDataLoadedNative
            int r0 = r0 + 61
            int r1 = r0 % 128
            com.appsflyer.internal.ak.onDeepLinkingNative = r1
            int r0 = r0 % 2
            r1 = 14
            if (r0 == 0) goto L11
            r0 = 16
            goto L13
        L11:
            r0 = 14
        L13:
            r2 = 0
            if (r0 == r1) goto L21
            boolean r0 = r4.AFLogger$LogLevel
            r1 = 0
            super.hashCode()     // Catch: java.lang.Throwable -> L1f
            if (r0 == 0) goto L4d
            goto L2f
        L1f:
            r0 = move-exception
            throw r0
        L21:
            boolean r0 = r4.AFLogger$LogLevel
            r1 = 92
            if (r0 == 0) goto L2a
            r0 = 92
            goto L2c
        L2a:
            r0 = 83
        L2c:
            if (r0 == r1) goto L2f
            goto L4d
        L2f:
            boolean r0 = r4.AFKeystoreWrapper
            r1 = 1
            if (r0 != 0) goto L36
            r0 = 1
            goto L37
        L36:
            r0 = 0
        L37:
            if (r0 == r1) goto L3a
            goto L58
        L3a:
            int r0 = com.appsflyer.internal.ak.onDeepLinkingNative
            int r0 = r0 + 85
            int r3 = r0 % 128
            com.appsflyer.internal.ak.onInstallConversionDataLoadedNative = r3
            int r0 = r0 % 2
            boolean r0 = r4.AFVersionDeclaration
            if (r0 == 0) goto L4a
            r0 = 0
            goto L4b
        L4a:
            r0 = 1
        L4b:
            if (r0 == 0) goto L58
        L4d:
            int r0 = com.appsflyer.internal.ak.onInstallConversionDataLoadedNative
            int r0 = r0 + 43
            int r1 = r0 % 128
            com.appsflyer.internal.ak.onDeepLinkingNative = r1
            int r0 = r0 % 2
            return r2
        L58:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ak.AppsFlyer2dXConversionCallback():boolean");
    }

    private synchronized void AFInAppEventParameterName(String str, String str2, String str3) {
        try {
            this.valueOf.put(AFInAppEventParameterName("쉝鏭碻壨\uf0c3﮻", 5 - View.combineMeasuredStates(0, 0)).intern(), Build.BRAND);
            this.valueOf.put(DeviceRequestsHelper.DEVICE_INFO_MODEL, Build.MODEL);
            this.valueOf.put("platform", Constants.JAVASCRIPT_INTERFACE_NAME);
            this.valueOf.put("platform_version", Build.VERSION.RELEASE);
            if ((str != null) && str.length() > 0) {
                this.valueOf.put("advertiserId", str);
            }
            if ((str2 != null ? ')' : '@') != ')') {
                if (str3 != null && str3.length() > 0) {
                    int i = onInstallConversionDataLoadedNative + 17;
                    onDeepLinkingNative = i % 128;
                    int i2 = i % 2;
                    this.valueOf.put("android_id", str3);
                }
            } else {
                int i3 = onDeepLinkingNative + 115;
                onInstallConversionDataLoadedNative = i3 % 128;
                int i4 = i3 % 2;
                if ((str2.length() > 0 ? 'F' : '7') == 'F') {
                    this.valueOf.put("imei", str2);
                }
                if (str3 != null) {
                    int i5 = onInstallConversionDataLoadedNative + 17;
                    onDeepLinkingNative = i5 % 128;
                    int i22 = i5 % 2;
                    this.valueOf.put("android_id", str3);
                }
            }
        } catch (Throwable unused) {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x005e A[Catch: all -> 0x00aa, TRY_ENTER, TryCatch #1 {all -> 0x00aa, blocks: (B:3:0x0001, B:9:0x0015, B:14:0x0020, B:18:0x0035, B:32:0x005e, B:33:0x0066, B:21:0x003e, B:42:0x007f, B:46:0x0091, B:47:0x009d), top: B:57:0x0001 }] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0066 A[Catch: all -> 0x00aa, TryCatch #1 {all -> 0x00aa, blocks: (B:3:0x0001, B:9:0x0015, B:14:0x0020, B:18:0x0035, B:32:0x005e, B:33:0x0066, B:21:0x003e, B:42:0x007f, B:46:0x0091, B:47:0x009d), top: B:57:0x0001 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private synchronized void AFInAppEventType(java.lang.String r4, java.lang.String r5, java.lang.String r6, java.lang.String r7) {
        /*
            r3 = this;
            monitor-enter(r3)
            java.util.Map<java.lang.String, java.lang.Object> r0 = r3.valueOf     // Catch: java.lang.Throwable -> Laa
            java.lang.String r1 = "sdk_version"
            r0.put(r1, r4)     // Catch: java.lang.Throwable -> Laa
            r4 = 55
            if (r5 == 0) goto Lf
            r0 = 53
            goto L11
        Lf:
            r0 = 55
        L11:
            r1 = 1
            r2 = 0
            if (r0 == r4) goto L27
            int r4 = r5.length()     // Catch: java.lang.Throwable -> Laa
            if (r4 <= 0) goto L1d
            r4 = 1
            goto L1e
        L1d:
            r4 = 0
        L1e:
            if (r4 == 0) goto L27
            java.util.Map<java.lang.String, java.lang.Object> r4 = r3.valueOf     // Catch: java.lang.Throwable -> Laa
            java.lang.String r0 = "devkey"
            r4.put(r0, r5)     // Catch: java.lang.Throwable -> Laa
        L27:
            if (r6 == 0) goto L73
            int r4 = com.appsflyer.internal.ak.onInstallConversionDataLoadedNative     // Catch: java.lang.Throwable -> L71
            int r4 = r4 + 17
            int r5 = r4 % 128
            com.appsflyer.internal.ak.onDeepLinkingNative = r5     // Catch: java.lang.Throwable -> L71
            int r4 = r4 % 2
            if (r4 == 0) goto L3e
            int r4 = r6.length()     // Catch: java.lang.Throwable -> Laa
            r5 = 0
            int r5 = r5.length     // Catch: java.lang.Throwable -> Laa
            if (r4 <= 0) goto L73
            goto L4d
        L3e:
            int r4 = r6.length()     // Catch: java.lang.Throwable -> Laa
            r5 = 83
            if (r4 <= 0) goto L49
            r4 = 43
            goto L4b
        L49:
            r4 = 83
        L4b:
            if (r4 == r5) goto L73
        L4d:
            int r4 = com.appsflyer.internal.ak.onInstallConversionDataLoadedNative     // Catch: java.lang.Throwable -> L71
            int r4 = r4 + 97
            int r5 = r4 % 128
            com.appsflyer.internal.ak.onDeepLinkingNative = r5     // Catch: java.lang.Throwable -> L71
            int r4 = r4 % 2
            if (r4 == 0) goto L5b
            r4 = 1
            goto L5c
        L5b:
            r4 = 0
        L5c:
            if (r4 == r1) goto L66
            java.util.Map<java.lang.String, java.lang.Object> r4 = r3.valueOf     // Catch: java.lang.Throwable -> Laa
            java.lang.String r5 = "originalAppsFlyerId"
            r4.put(r5, r6)     // Catch: java.lang.Throwable -> Laa
            goto L73
        L66:
            java.util.Map<java.lang.String, java.lang.Object> r4 = r3.valueOf     // Catch: java.lang.Throwable -> Laa
            java.lang.String r5 = "originalAppsFlyerId"
            r4.put(r5, r6)     // Catch: java.lang.Throwable -> Laa
            r4 = 56
            int r4 = r4 / r2
            goto L73
        L71:
            r4 = move-exception
            goto La6
        L73:
            r4 = 16
            if (r7 == 0) goto L7a
            r5 = 16
            goto L7c
        L7a:
            r5 = 92
        L7c:
            if (r5 == r4) goto L7f
            goto La8
        L7f:
            int r4 = r7.length()     // Catch: java.lang.Throwable -> Laa
            if (r4 <= 0) goto La8
            int r4 = com.appsflyer.internal.ak.onInstallConversionDataLoadedNative     // Catch: java.lang.Throwable -> L71
            int r4 = r4 + 75
            int r5 = r4 % 128
            com.appsflyer.internal.ak.onDeepLinkingNative = r5     // Catch: java.lang.Throwable -> L71
            int r4 = r4 % 2
            if (r4 == 0) goto L9d
            java.util.Map<java.lang.String, java.lang.Object> r4 = r3.valueOf     // Catch: java.lang.Throwable -> Laa
            java.lang.String r5 = "uid"
            r4.put(r5, r7)     // Catch: java.lang.Throwable -> Laa
            r4 = 63
            int r4 = r4 / r2
            goto La8
        L9d:
            java.util.Map<java.lang.String, java.lang.Object> r4 = r3.valueOf     // Catch: java.lang.Throwable -> Laa
            java.lang.String r5 = "uid"
            r4.put(r5, r7)     // Catch: java.lang.Throwable -> Laa
            goto La8
        La6:
            monitor-exit(r3)
            throw r4
        La8:
            monitor-exit(r3)
            return
        Laa:
            monitor-exit(r3)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ak.AFInAppEventType(java.lang.String, java.lang.String, java.lang.String, java.lang.String):void");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0024 A[Catch: all -> 0x00a2, TRY_ENTER, TRY_LEAVE, TryCatch #1 {, blocks: (B:3:0x0001, B:17:0x0024, B:50:0x008d, B:33:0x0057), top: B:61:0x0001 }] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0043  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0045  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x004c A[Catch: all -> 0x00a0, TRY_LEAVE, TryCatch #0 {all -> 0x00a0, blocks: (B:6:0x000e, B:15:0x001e, B:19:0x0030, B:20:0x0039, B:36:0x006a, B:38:0x0070, B:45:0x0083, B:51:0x0097, B:28:0x004c, B:34:0x0061), top: B:59:0x000e }] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0083 A[Catch: all -> 0x00a0, TRY_LEAVE, TryCatch #0 {all -> 0x00a0, blocks: (B:6:0x000e, B:15:0x001e, B:19:0x0030, B:20:0x0039, B:36:0x006a, B:38:0x0070, B:45:0x0083, B:51:0x0097, B:28:0x004c, B:34:0x0061), top: B:59:0x000e }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private synchronized void valueOf(java.lang.String r4, java.lang.String r5, java.lang.String r6, java.lang.String r7) {
        /*
            r3 = this;
            monitor-enter(r3)
            int r0 = com.appsflyer.internal.ak.onDeepLinkingNative     // Catch: java.lang.Throwable -> La2
            int r0 = r0 + 55
            int r1 = r0 % 128
            com.appsflyer.internal.ak.onInstallConversionDataLoadedNative = r1     // Catch: java.lang.Throwable -> La2
            int r0 = r0 % 2
            r1 = 0
            if (r0 != 0) goto L12
            int r0 = r1.length     // Catch: java.lang.Throwable -> La0
            if (r4 == 0) goto L40
            goto L1e
        L12:
            r0 = 16
            if (r4 == 0) goto L19
            r2 = 16
            goto L1b
        L19:
            r2 = 67
        L1b:
            if (r2 == r0) goto L1e
            goto L40
        L1e:
            int r0 = r4.length()     // Catch: java.lang.Throwable -> La0
            if (r0 <= 0) goto L40
            int r0 = com.appsflyer.internal.ak.onInstallConversionDataLoadedNative     // Catch: java.lang.Throwable -> La2
            int r0 = r0 + 85
            int r2 = r0 % 128
            com.appsflyer.internal.ak.onDeepLinkingNative = r2     // Catch: java.lang.Throwable -> La2
            int r0 = r0 % 2
            if (r0 == 0) goto L39
            java.util.Map<java.lang.String, java.lang.Object> r0 = r3.valueOf     // Catch: java.lang.Throwable -> La0
            java.lang.String r2 = "app_id"
            r0.put(r2, r4)     // Catch: java.lang.Throwable -> La0
            int r4 = r1.length     // Catch: java.lang.Throwable -> La0
            goto L40
        L39:
            java.util.Map<java.lang.String, java.lang.Object> r0 = r3.valueOf     // Catch: java.lang.Throwable -> La0
            java.lang.String r1 = "app_id"
            r0.put(r1, r4)     // Catch: java.lang.Throwable -> La0
        L40:
            r4 = 7
            if (r5 == 0) goto L45
            r0 = 7
            goto L47
        L45:
            r0 = 91
        L47:
            r1 = 0
            r2 = 1
            if (r0 == r4) goto L4c
            goto L68
        L4c:
            int r4 = r5.length()     // Catch: java.lang.Throwable -> La0
            if (r4 <= 0) goto L54
            r4 = 1
            goto L55
        L54:
            r4 = 0
        L55:
            if (r4 == 0) goto L68
            int r4 = com.appsflyer.internal.ak.onDeepLinkingNative     // Catch: java.lang.Throwable -> La2
            int r4 = r4 + 69
            int r0 = r4 % 128
            com.appsflyer.internal.ak.onInstallConversionDataLoadedNative = r0     // Catch: java.lang.Throwable -> La2
            int r4 = r4 % 2
            java.util.Map<java.lang.String, java.lang.Object> r4 = r3.valueOf     // Catch: java.lang.Throwable -> La0
            java.lang.String r0 = "app_version"
            r4.put(r0, r5)     // Catch: java.lang.Throwable -> La0
        L68:
            if (r6 == 0) goto L77
            int r4 = r6.length()     // Catch: java.lang.Throwable -> La0
            if (r4 <= 0) goto L77
            java.util.Map<java.lang.String, java.lang.Object> r4 = r3.valueOf     // Catch: java.lang.Throwable -> La0
            java.lang.String r5 = "channel"
            r4.put(r5, r6)     // Catch: java.lang.Throwable -> La0
        L77:
            r4 = 71
            if (r7 == 0) goto L7e
            r5 = 71
            goto L80
        L7e:
            r5 = 65
        L80:
            if (r5 == r4) goto L83
            goto L9e
        L83:
            int r4 = r7.length()     // Catch: java.lang.Throwable -> La0
            if (r4 <= 0) goto L8a
            r1 = 1
        L8a:
            if (r1 == r2) goto L8d
            goto L9e
        L8d:
            int r4 = com.appsflyer.internal.ak.onDeepLinkingNative     // Catch: java.lang.Throwable -> La2
            int r4 = r4 + 113
            int r5 = r4 % 128
            com.appsflyer.internal.ak.onInstallConversionDataLoadedNative = r5     // Catch: java.lang.Throwable -> La2
            int r4 = r4 % 2
            java.util.Map<java.lang.String, java.lang.Object> r4 = r3.valueOf     // Catch: java.lang.Throwable -> La0
            java.lang.String r5 = "preInstall"
            r4.put(r5, r7)     // Catch: java.lang.Throwable -> La0
        L9e:
            monitor-exit(r3)
            return
        La0:
            monitor-exit(r3)
            return
        La2:
            r4 = move-exception
            monitor-exit(r3)
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ak.valueOf(java.lang.String, java.lang.String, java.lang.String, java.lang.String):void");
    }

    final void AFKeystoreWrapper(String str, String... strArr) {
        int i = onInstallConversionDataLoadedNative + 77;
        onDeepLinkingNative = i % 128;
        char c = i % 2 != 0 ? 'b' : '%';
        AFInAppEventParameterName("public_api_call", str, strArr);
        if (c != '%') {
            Object[] objArr = null;
            int length = objArr.length;
        }
        int i2 = onInstallConversionDataLoadedNative + 89;
        onDeepLinkingNative = i2 % 128;
        int i3 = i2 % 2;
    }

    public final void valueOf(Throwable th) {
        StackTraceElement[] stackTrace;
        int i = onDeepLinkingNative + 117;
        onInstallConversionDataLoadedNative = i % 128;
        int i2 = i % 2;
        Throwable cause = th.getCause();
        String simpleName = th.getClass().getSimpleName();
        String message = (cause == null ? '.' : '?') != '?' ? th.getMessage() : cause.getMessage();
        if (!(cause != null)) {
            int i3 = onDeepLinkingNative + 87;
            onInstallConversionDataLoadedNative = i3 % 128;
            int i4 = i3 % 2;
            stackTrace = th.getStackTrace();
        } else {
            stackTrace = cause.getStackTrace();
            int i5 = onDeepLinkingNative + 51;
            onInstallConversionDataLoadedNative = i5 % 128;
            int i6 = i5 % 2;
        }
        AFInAppEventParameterName("exception", simpleName, values(message, stackTrace));
    }

    public final void AFInAppEventType(String str, String str2) {
        int i = onDeepLinkingNative + 105;
        onInstallConversionDataLoadedNative = i % 128;
        int i2 = i % 2;
        AFInAppEventParameterName("server_request", str, str2);
        int i3 = onDeepLinkingNative + 43;
        onInstallConversionDataLoadedNative = i3 % 128;
        if ((i3 % 2 == 0 ? (char) 18 : 'Y') != 'Y') {
            Object obj = null;
            super.hashCode();
        }
    }

    public final void values(String str, int i, String str2) {
        int i2 = onInstallConversionDataLoadedNative + 59;
        onDeepLinkingNative = i2 % 128;
        if (i2 % 2 == 0) {
            AFInAppEventParameterName("server_response", str, String.valueOf(i), str2);
            return;
        }
        String[] strArr = new String[3];
        strArr[1] = String.valueOf(i);
        strArr[1] = str2;
        AFInAppEventParameterName("server_response", str, strArr);
    }

    public final void AFInAppEventParameterName(String str, String str2) {
        int i = onDeepLinkingNative + 123;
        onInstallConversionDataLoadedNative = i % 128;
        int i2 = i % 2;
        AFInAppEventParameterName((String) null, str, str2);
        int i3 = onInstallConversionDataLoadedNative + 23;
        onDeepLinkingNative = i3 % 128;
        int i4 = i3 % 2;
    }

    private synchronized void AFInAppEventParameterName(String str, String str2, String... strArr) {
        String string;
        int i = onDeepLinkingNative + 85;
        onInstallConversionDataLoadedNative = i % 128;
        int i2 = i % 2;
        if ((AppsFlyer2dXConversionCallback() ? 'R' : '\r') == '\r' || this.AFInAppEventParameterName >= 98304) {
            int i3 = onInstallConversionDataLoadedNative + 103;
            onDeepLinkingNative = i3 % 128;
            int i4 = i3 % 2;
            return;
        }
        try {
            long jCurrentTimeMillis = System.currentTimeMillis();
            String strJoin = TextUtils.join(", ", strArr);
            if (str != null) {
                StringBuilder sb = new StringBuilder();
                sb.append(jCurrentTimeMillis);
                sb.append(" ");
                sb.append(Thread.currentThread().getId());
                sb.append(" _/AppsFlyer_6.5.4 [");
                sb.append(str);
                sb.append("] ");
                sb.append(str2);
                sb.append(" ");
                sb.append(strJoin);
                string = sb.toString();
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(jCurrentTimeMillis);
                sb2.append(" ");
                sb2.append(Thread.currentThread().getId());
                sb2.append(" ");
                sb2.append(str2);
                sb2.append("/AppsFlyer_6.5.4 ");
                sb2.append(strJoin);
                string = sb2.toString();
            }
            this.AFInAppEventType.add(string);
            this.AFInAppEventParameterName += string.length() << 1;
            int i5 = onInstallConversionDataLoadedNative + 31;
            onDeepLinkingNative = i5 % 128;
            if ((i5 % 2 != 0 ? (char) 17 : 'Y') != 'Y') {
                Object[] objArr = null;
                int length = objArr.length;
            }
        } catch (Throwable unused) {
        }
    }

    private synchronized Map<String, Object> AFLogger$LogLevel() {
        int i = onDeepLinkingNative + 47;
        onInstallConversionDataLoadedNative = i % 128;
        int i2 = i % 2;
        this.valueOf.put("data", this.AFInAppEventType);
        init();
        Map<String, Object> map = this.valueOf;
        int i3 = onDeepLinkingNative + 115;
        onInstallConversionDataLoadedNative = i3 % 128;
        if ((i3 % 2 == 0 ? 'Z' : '0') == '0') {
            return map;
        }
        Object obj = null;
        super.hashCode();
        return map;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x00ab  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private synchronized void AFInAppEventParameterName(java.lang.String r9, android.content.pm.PackageManager r10) {
        /*
            r8 = this;
            monitor-enter(r8)
            int r0 = com.appsflyer.internal.ak.onInstallConversionDataLoadedNative     // Catch: java.lang.Throwable -> Lb9
            int r0 = r0 + 67
            int r1 = r0 % 128
            com.appsflyer.internal.ak.onDeepLinkingNative = r1     // Catch: java.lang.Throwable -> Lb9
            int r0 = r0 % 2
            r1 = 1
            r2 = 0
            if (r0 == 0) goto L11
            r0 = 1
            goto L12
        L11:
            r0 = 0
        L12:
            if (r0 == r1) goto L21
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()     // Catch: java.lang.Throwable -> Lb9
            java.lang.String r3 = "remote_debug_static_data"
            java.lang.String r4 = r0.getString(r3)     // Catch: java.lang.Throwable -> Lb9
            if (r4 == 0) goto L3c
            goto L30
        L21:
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()     // Catch: java.lang.Throwable -> Lb9
            java.lang.String r3 = "remote_debug_static_data"
            java.lang.String r4 = r0.getString(r3)     // Catch: java.lang.Throwable -> Lb9
            r5 = 94
            int r5 = r5 / r2
            if (r4 == 0) goto L3c
        L30:
            org.json.JSONObject r9 = new org.json.JSONObject     // Catch: java.lang.Throwable -> Lac
            r9.<init>(r4)     // Catch: java.lang.Throwable -> Lac
            java.util.Map r9 = com.appsflyer.internal.n.valueOf(r9)     // Catch: java.lang.Throwable -> Lac
            r8.valueOf = r9     // Catch: java.lang.Throwable -> Lac
            goto Lac
        L3c:
            java.util.HashMap r4 = new java.util.HashMap     // Catch: java.lang.Throwable -> Lb9
            r4.<init>()     // Catch: java.lang.Throwable -> Lb9
            r8.valueOf = r4     // Catch: java.lang.Throwable -> Lb9
            com.appsflyer.internal.ac r4 = com.appsflyer.internal.ac.AFInAppEventParameterName()     // Catch: java.lang.Throwable -> Lb9
            java.lang.String r5 = "advertiserId"
            java.lang.String r5 = r0.getString(r5)     // Catch: java.lang.Throwable -> Lb9
            java.lang.String r6 = r4.AppsFlyer2dXConversionCallback     // Catch: java.lang.Throwable -> Lb9
            java.lang.String r4 = r4.init     // Catch: java.lang.Throwable -> Lb9
            r8.AFInAppEventParameterName(r5, r6, r4)     // Catch: java.lang.Throwable -> Lb9
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lb9
            java.lang.String r5 = "6.5.4."
            r4.<init>(r5)     // Catch: java.lang.Throwable -> Lb9
            java.lang.String r5 = com.appsflyer.internal.ac.valueOf     // Catch: java.lang.Throwable -> Lb9
            r4.append(r5)     // Catch: java.lang.Throwable -> Lb9
            java.lang.String r4 = r4.toString()     // Catch: java.lang.Throwable -> Lb9
            java.lang.String r5 = r0.getDevKey()     // Catch: java.lang.Throwable -> Lb9
            java.lang.String r6 = "KSAppsFlyerId"
            java.lang.String r6 = r0.getString(r6)     // Catch: java.lang.Throwable -> Lb9
            java.lang.String r7 = "uid"
            java.lang.String r7 = r0.getString(r7)     // Catch: java.lang.Throwable -> Lb9
            r8.AFInAppEventType(r4, r5, r6, r7)     // Catch: java.lang.Throwable -> Lb9
            android.content.pm.PackageInfo r10 = r10.getPackageInfo(r9, r2)     // Catch: java.lang.Throwable -> L91
            int r10 = r10.versionCode     // Catch: java.lang.Throwable -> L91
            java.lang.String r4 = "channel"
            java.lang.String r4 = r0.getString(r4)     // Catch: java.lang.Throwable -> L91
            java.lang.String r5 = "preInstallName"
            java.lang.String r5 = r0.getString(r5)     // Catch: java.lang.Throwable -> L91
            java.lang.String r10 = java.lang.String.valueOf(r10)     // Catch: java.lang.Throwable -> L91
            r8.valueOf(r9, r10, r4, r5)     // Catch: java.lang.Throwable -> L91
        L91:
            org.json.JSONObject r9 = new org.json.JSONObject     // Catch: java.lang.Throwable -> Lb9
            java.util.Map<java.lang.String, java.lang.Object> r10 = r8.valueOf     // Catch: java.lang.Throwable -> Lb9
            r9.<init>(r10)     // Catch: java.lang.Throwable -> Lb9
            java.lang.String r9 = r9.toString()     // Catch: java.lang.Throwable -> Lb9
            r0.set(r3, r9)     // Catch: java.lang.Throwable -> Lb9
            int r9 = com.appsflyer.internal.ak.onDeepLinkingNative     // Catch: java.lang.Throwable -> Lb9
            int r9 = r9 + 97
            int r10 = r9 % 128
            com.appsflyer.internal.ak.onInstallConversionDataLoadedNative = r10     // Catch: java.lang.Throwable -> Lb9
            int r9 = r9 % 2
            if (r9 != 0) goto Lac
            r2 = 1
        Lac:
            java.util.Map<java.lang.String, java.lang.Object> r9 = r8.valueOf     // Catch: java.lang.Throwable -> Lb9
            java.lang.String r10 = "launch_counter"
            java.lang.String r0 = r8.getLevel     // Catch: java.lang.Throwable -> Lb9
            r9.put(r10, r0)     // Catch: java.lang.Throwable -> Lb9
            monitor-exit(r8)
            return
        Lb7:
            r9 = move-exception
            throw r9     // Catch: java.lang.Throwable -> Lb9
        Lb9:
            r9 = move-exception
            monitor-exit(r8)
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ak.AFInAppEventParameterName(java.lang.String, android.content.pm.PackageManager):void");
    }

    private static String[] values(String str, StackTraceElement[] stackTraceElementArr) {
        int i = onDeepLinkingNative + 123;
        onInstallConversionDataLoadedNative = i % 128;
        int i2 = i % 2;
        int i3 = 1;
        if ((stackTraceElementArr == null ? (char) 29 : '1') == 29) {
            return new String[]{str};
        }
        String[] strArr = new String[stackTraceElementArr.length + 1];
        strArr[0] = str;
        while (true) {
            if ((i3 < stackTraceElementArr.length ? '\t' : Typography.less) == '<') {
                break;
            }
            strArr[i3] = stackTraceElementArr[i3].toString();
            i3++;
        }
        int i4 = onInstallConversionDataLoadedNative + 31;
        onDeepLinkingNative = i4 % 128;
        if ((i4 % 2 != 0 ? '/' : Events.EQUAL) == '=') {
            return strArr;
        }
        int i5 = 40 / 0;
        return strArr;
    }

    private synchronized void init() {
        this.AFInAppEventType = new ArrayList();
        this.AFInAppEventParameterName = 0;
        int i = onDeepLinkingNative + 73;
        onInstallConversionDataLoadedNative = i % 128;
        if (i % 2 == 0) {
            int i2 = 72 / 0;
        }
    }

    final synchronized void valueOf() {
        int i = onInstallConversionDataLoadedNative + 91;
        onDeepLinkingNative = i % 128;
        if ((i % 2 != 0 ? '(' : (char) 20) != 20) {
            this.AFKeystoreWrapper = false;
        } else {
            this.AFKeystoreWrapper = false;
        }
        init();
    }

    final void getLevel() {
        int i = onDeepLinkingNative;
        int i2 = i + 29;
        onInstallConversionDataLoadedNative = i2 % 128;
        this.AFLogger$LogLevel = (i2 % 2 == 0 ? 'O' : 'W') != 'W';
        int i3 = i + 45;
        onInstallConversionDataLoadedNative = i3 % 128;
        int i4 = i3 % 2;
    }

    final boolean AFVersionDeclaration() {
        int i = onDeepLinkingNative + 21;
        int i2 = i % 128;
        onInstallConversionDataLoadedNative = i2;
        int i3 = i % 2;
        boolean z = this.AFVersionDeclaration;
        int i4 = i2 + 49;
        onDeepLinkingNative = i4 % 128;
        if ((i4 % 2 != 0 ? (char) 3 : '7') == '7') {
            return z;
        }
        Object obj = null;
        super.hashCode();
        return z;
    }

    private static String AFInAppEventParameterName(String str, int i) {
        String str2;
        Object charArray = str;
        if (str != null) {
            charArray = str.toCharArray();
        }
        char[] cArr = (char[]) charArray;
        synchronized (dt.valueOf) {
            char[] cArr2 = new char[cArr.length];
            dt.AFInAppEventType = 0;
            char[] cArr3 = new char[2];
            while (dt.AFInAppEventType < cArr.length) {
                cArr3[0] = cArr[dt.AFInAppEventType];
                cArr3[1] = cArr[dt.AFInAppEventType + 1];
                int i2 = 58224;
                for (int i3 = 0; i3 < 16; i3++) {
                    cArr3[1] = (char) (cArr3[1] - (((cArr3[0] + i2) ^ ((cArr3[0] << 4) + onInstallConversionFailureNative)) ^ ((cArr3[0] >>> 5) + onAppOpenAttributionNative)));
                    cArr3[0] = (char) (cArr3[0] - (((cArr3[1] + i2) ^ ((cArr3[1] << 4) + init)) ^ ((cArr3[1] >>> 5) + AppsFlyer2dXConversionCallback)));
                    i2 -= 40503;
                }
                cArr2[dt.AFInAppEventType] = cArr3[0];
                cArr2[dt.AFInAppEventType + 1] = cArr3[1];
                dt.AFInAppEventType += 2;
            }
            str2 = new String(cArr2, 0, i);
        }
        return str2;
    }
}
