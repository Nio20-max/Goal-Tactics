package com.appsflyer.internal;

import android.app.Application;
import com.appsflyer.AFLogger;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: loaded from: classes.dex */
public final class cc implements Runnable {
    private static String valueOf = "https://%sgcdsdk.%s/install_data/v4.0/";
    private static final List<String> values = Arrays.asList("googleplay", "playstore", "googleplaystore");
    final ScheduledExecutorService AFInAppEventParameterName;
    private final Application AFInAppEventType;
    private final String AFKeystoreWrapper;
    private final ac AFLogger$LogLevel;
    private final int AFVersionDeclaration;
    private final AtomicInteger AppsFlyer2dXConversionCallback;

    cc(ac acVar, Application application, String str) {
        if (k.values == null) {
            k.values = new k();
        }
        this.AFInAppEventParameterName = k.values.AFKeystoreWrapper();
        this.AppsFlyer2dXConversionCallback = new AtomicInteger(0);
        this.AFLogger$LogLevel = acVar;
        this.AFInAppEventType = application;
        this.AFKeystoreWrapper = str;
        this.AFVersionDeclaration = 0;
    }

    private cc(cc ccVar) {
        if (k.values == null) {
            k.values = new k();
        }
        this.AFInAppEventParameterName = k.values.AFKeystoreWrapper();
        this.AppsFlyer2dXConversionCallback = new AtomicInteger(0);
        this.AFLogger$LogLevel = ccVar.AFLogger$LogLevel;
        this.AFInAppEventType = ccVar.AFInAppEventType;
        this.AFKeystoreWrapper = ccVar.AFKeystoreWrapper;
        this.AFVersionDeclaration = ccVar.AFVersionDeclaration + 1;
    }

    static void values(Map<String, Object> map) {
        StringBuilder sb = new StringBuilder("[GCD-A02] Calling onConversionDataSuccess with:\n");
        sb.append(map.toString());
        AFLogger.AFInAppEventParameterName(sb.toString());
        ac.AFKeystoreWrapper.onConversionDataSuccess(map);
    }

    public static void AFInAppEventParameterName(String str) {
        if (ac.AFKeystoreWrapper != null) {
            AFLogger.AFInAppEventParameterName("[GCD-A02] Calling onConversionFailure with:\n".concat(String.valueOf(str)));
            ac.AFKeystoreWrapper.onConversionDataFail(str);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0120 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x013c A[Catch: all -> 0x014d, TRY_LEAVE, TryCatch #5 {all -> 0x014d, blocks: (B:38:0x013c, B:35:0x012b, B:37:0x012f), top: B:118:0x012b }] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0151 A[Catch: all -> 0x02a4, TRY_ENTER, TryCatch #2 {all -> 0x02a4, blocks: (B:26:0x00f7, B:42:0x0151, B:44:0x015f), top: B:113:0x00f7 }] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x015f A[Catch: all -> 0x02a4, TRY_LEAVE, TryCatch #2 {all -> 0x02a4, blocks: (B:26:0x00f7, B:42:0x0151, B:44:0x015f), top: B:113:0x00f7 }] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0170 A[Catch: all -> 0x02a2, TryCatch #1 {all -> 0x02a2, blocks: (B:46:0x0165, B:48:0x0177, B:50:0x01a7, B:52:0x01b5, B:54:0x01d0, B:56:0x01d6, B:57:0x01e3, B:60:0x01ed, B:62:0x01f3, B:63:0x0207, B:64:0x0219, B:66:0x021f, B:67:0x0232, B:70:0x0244, B:72:0x024f, B:74:0x0253, B:76:0x025b, B:78:0x0270, B:82:0x027d, B:81:0x0278, B:71:0x024a, B:47:0x0170), top: B:111:0x015d, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x01a7 A[Catch: all -> 0x02a2, TryCatch #1 {all -> 0x02a2, blocks: (B:46:0x0165, B:48:0x0177, B:50:0x01a7, B:52:0x01b5, B:54:0x01d0, B:56:0x01d6, B:57:0x01e3, B:60:0x01ed, B:62:0x01f3, B:63:0x0207, B:64:0x0219, B:66:0x021f, B:67:0x0232, B:70:0x0244, B:72:0x024f, B:74:0x0253, B:76:0x025b, B:78:0x0270, B:82:0x027d, B:81:0x0278, B:71:0x024a, B:47:0x0170), top: B:111:0x015d, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:85:0x029e  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x02af A[Catch: all -> 0x02e1, TryCatch #0 {all -> 0x02e1, blocks: (B:92:0x02ab, B:94:0x02af, B:96:0x02c5, B:95:0x02be), top: B:109:0x02ab }] */
    /* JADX WARN: Removed duplicated region for block: B:95:0x02be A[Catch: all -> 0x02e1, TryCatch #0 {all -> 0x02e1, blocks: (B:92:0x02ab, B:94:0x02af, B:96:0x02c5, B:95:0x02be), top: B:109:0x02ab }] */
    /* JADX WARN: Removed duplicated region for block: B:99:0x02d3 A[DONT_GENERATE] */
    /* JADX WARN: Type inference failed for: r16v0 */
    /* JADX WARN: Type inference failed for: r16v1 */
    /* JADX WARN: Type inference failed for: r16v10 */
    /* JADX WARN: Type inference failed for: r16v11 */
    /* JADX WARN: Type inference failed for: r16v12 */
    /* JADX WARN: Type inference failed for: r16v2 */
    /* JADX WARN: Type inference failed for: r16v3 */
    /* JADX WARN: Type inference failed for: r16v4 */
    /* JADX WARN: Type inference failed for: r16v5 */
    /* JADX WARN: Type inference failed for: r16v6 */
    /* JADX WARN: Type inference failed for: r16v7, types: [java.net.HttpURLConnection] */
    /* JADX WARN: Type inference failed for: r16v8 */
    /* JADX WARN: Type inference failed for: r16v9 */
    /* JADX WARN: Type inference failed for: r3v31 */
    /* JADX WARN: Type inference failed for: r3v5 */
    /* JADX WARN: Type inference failed for: r3v6, types: [java.net.HttpURLConnection] */
    /* JADX WARN: Type inference failed for: r3v7 */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void run() {
        /*
            Method dump skipped, instruction units count: 760
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.cc.run():void");
    }
}
