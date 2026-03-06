package com.appsflyer.internal;

import android.content.ContentResolver;
import android.os.Build;
import android.provider.Settings;
import com.appsflyer.AFLogger;
import com.appsflyer.AppsFlyerProperties;
import java.util.concurrent.ExecutorService;

/* JADX INFO: loaded from: classes.dex */
public final class ab {
    static String AFInAppEventParameterName;
    static Boolean AFInAppEventType;
    public final ExecutorService AFKeystoreWrapper;
    public final bm valueOf;

    public ab() {
    }

    public static g AFInAppEventType(ContentResolver contentResolver) {
        String string;
        if (!AFInAppEventType() || contentResolver == null || AppsFlyerProperties.getInstance().getString("amazon_aid") != null || !"Amazon".equals(Build.MANUFACTURER)) {
            return null;
        }
        int i = Settings.Secure.getInt(contentResolver, "limit_ad_tracking", 2);
        if (i == 0) {
            return new g(Settings.Secure.getString(contentResolver, "advertising_id"), Boolean.FALSE);
        }
        if (i == 2) {
            return null;
        }
        try {
            string = Settings.Secure.getString(contentResolver, "advertising_id");
        } catch (Throwable th) {
            AFLogger.valueOf("Couldn't fetch Amazon Advertising ID (Ad-Tracking is limited!)", th);
            string = "";
        }
        return new g(string, Boolean.TRUE);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x004c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.appsflyer.internal.g AFInAppEventType(android.content.Context r5) {
        /*
            com.appsflyer.AppsFlyerProperties r0 = com.appsflyer.AppsFlyerProperties.getInstance()
            java.lang.String r1 = com.appsflyer.internal.ab.AFInAppEventParameterName
            r2 = 1
            if (r1 == 0) goto Lb
            r3 = 1
            goto Lc
        Lb:
            r3 = 0
        Lc:
            r4 = 0
            if (r3 == 0) goto L11
        Lf:
            r5 = r4
            goto L4e
        L11:
            java.lang.Boolean r1 = com.appsflyer.internal.ab.AFInAppEventType
            if (r1 == 0) goto L1b
            boolean r1 = r1.booleanValue()
            if (r1 != 0) goto L27
        L1b:
            java.lang.Boolean r1 = com.appsflyer.internal.ab.AFInAppEventType
            if (r1 != 0) goto L4c
            java.lang.String r1 = "collectOAID"
            boolean r1 = r0.getBoolean(r1, r2)
            if (r1 == 0) goto L4c
        L27:
            com.appsflyer.oaid.OaidClient r1 = new com.appsflyer.oaid.OaidClient     // Catch: java.lang.Throwable -> L45
            r1.<init>(r5)     // Catch: java.lang.Throwable -> L45
            boolean r5 = r0.isEnableLog()     // Catch: java.lang.Throwable -> L45
            r1.setLogging(r5)     // Catch: java.lang.Throwable -> L45
            com.appsflyer.oaid.OaidClient$Info r5 = r1.fetch()     // Catch: java.lang.Throwable -> L45
            if (r5 == 0) goto L4c
            java.lang.String r0 = r5.getId()     // Catch: java.lang.Throwable -> L45
            java.lang.Boolean r5 = r5.getLat()     // Catch: java.lang.Throwable -> L43
            r1 = r0
            goto L4e
        L43:
            r1 = r0
            goto L46
        L45:
            r1 = r4
        L46:
            java.lang.String r5 = "No OAID library"
            com.appsflyer.AFLogger.AFInAppEventParameterName(r5)
            goto Lf
        L4c:
            r5 = r4
            r1 = r5
        L4e:
            if (r1 == 0) goto L5c
            com.appsflyer.internal.g r0 = new com.appsflyer.internal.g
            r0.<init>(r1, r5)
            java.lang.Boolean r5 = java.lang.Boolean.valueOf(r3)
            r0.AFInAppEventParameterName = r5
            return r0
        L5c:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ab.AFInAppEventType(android.content.Context):com.appsflyer.internal.g");
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0040 A[Catch: all -> 0x0048, TRY_LEAVE, TryCatch #2 {all -> 0x0048, blocks: (B:13:0x003a, B:15:0x0040), top: B:57:0x003a }] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00ee A[PHI: r7 r8
      0x00ee: PHI (r7v10 java.lang.Boolean) = (r7v3 java.lang.Boolean), (r7v9 java.lang.Boolean), (r7v9 java.lang.Boolean) binds: [B:27:0x0088, B:32:0x00a0, B:31:0x009e] A[DONT_GENERATE, DONT_INLINE]
      0x00ee: PHI (r8v8 java.lang.String) = (r8v2 java.lang.String), (r8v7 java.lang.String), (r8v7 java.lang.String) binds: [B:27:0x0088, B:32:0x00a0, B:31:0x009e] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0100  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0124  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x008a A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.appsflyer.internal.g AFKeystoreWrapper(android.content.Context r12, java.util.Map<java.lang.String, java.lang.Object> r13) {
        /*
            Method dump skipped, instruction units count: 374
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ab.AFKeystoreWrapper(android.content.Context, java.util.Map):com.appsflyer.internal.g");
    }

    private static boolean AFInAppEventType() {
        Boolean bool = AFInAppEventType;
        return bool == null || bool.booleanValue();
    }

    public ab(bm bmVar, ExecutorService executorService) {
        this.valueOf = bmVar;
        this.AFKeystoreWrapper = executorService;
    }
}
