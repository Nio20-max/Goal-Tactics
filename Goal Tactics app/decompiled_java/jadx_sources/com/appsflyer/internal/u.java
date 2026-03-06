package com.appsflyer.internal;

import android.net.NetworkInfo;

/* JADX INFO: loaded from: classes.dex */
final class u {

    static final class d {
        static final u valueOf = new u();
    }

    u() {
    }

    private static boolean values(NetworkInfo networkInfo) {
        return networkInfo != null && networkInfo.isConnectedOrConnecting();
    }

    static final class a {
        final String AFInAppEventType;
        final String AFKeystoreWrapper;
        final String values;

        a(String str, String str2, String str3) {
            this.AFKeystoreWrapper = str;
            this.AFInAppEventType = str2;
            this.values = str3;
        }
    }

    /* JADX WARN: Can't wrap try/catch for region: R(10:0|2|(3:52|3|4)|(5:6|7|(2:9|(1:(2:11|(3:55|13|(1:15)(2:16|(1:18)(0)))(1:19))(1:54)))(2:20|(2:23|(1:25)(2:26|(2:28|(2:30|22)(2:31|(2:33|25)(0)))(0)))(1:22))|48|49)(0)|34|50|35|(2:39|(1:41))|48|49) */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0090, code lost:
    
        r12 = th;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0091, code lost:
    
        r2 = r1;
        r1 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x0097, code lost:
    
        com.appsflyer.AFLogger.valueOf("Exception while collecting network info. ", r12);
        r11 = r2;
        r2 = r1;
        r1 = r11;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static com.appsflyer.internal.u.a AFInAppEventType(android.content.Context r12) {
        /*
            java.lang.String r0 = "unknown"
            r1 = 0
            java.lang.String r2 = "connectivity"
            java.lang.Object r2 = r12.getSystemService(r2)     // Catch: java.lang.Throwable -> L95
            android.net.ConnectivityManager r2 = (android.net.ConnectivityManager) r2     // Catch: java.lang.Throwable -> L95
            java.lang.String r3 = "MOBILE"
            java.lang.String r4 = "WIFI"
            if (r2 == 0) goto L6e
            r5 = 21
            int r6 = android.os.Build.VERSION.SDK_INT     // Catch: java.lang.Throwable -> L95
            r7 = 0
            r8 = 1
            if (r5 > r6) goto L3e
            android.net.Network[] r5 = r2.getAllNetworks()     // Catch: java.lang.Throwable -> L95
            int r6 = r5.length     // Catch: java.lang.Throwable -> L95
        L1f:
            if (r7 >= r6) goto L6e
            r9 = r5[r7]     // Catch: java.lang.Throwable -> L95
            android.net.NetworkInfo r9 = r2.getNetworkInfo(r9)     // Catch: java.lang.Throwable -> L95
            boolean r10 = values(r9)     // Catch: java.lang.Throwable -> L95
            if (r10 == 0) goto L3b
            int r2 = r9.getType()     // Catch: java.lang.Throwable -> L95
            if (r8 != r2) goto L34
            goto L48
        L34:
            int r2 = r9.getType()     // Catch: java.lang.Throwable -> L95
            if (r2 != 0) goto L6e
            goto L54
        L3b:
            int r7 = r7 + 1
            goto L1f
        L3e:
            android.net.NetworkInfo r5 = r2.getNetworkInfo(r8)     // Catch: java.lang.Throwable -> L95
            boolean r5 = values(r5)     // Catch: java.lang.Throwable -> L95
            if (r5 == 0) goto L4a
        L48:
            r0 = r4
            goto L6e
        L4a:
            android.net.NetworkInfo r5 = r2.getNetworkInfo(r7)     // Catch: java.lang.Throwable -> L95
            boolean r5 = values(r5)     // Catch: java.lang.Throwable -> L95
            if (r5 == 0) goto L56
        L54:
            r0 = r3
            goto L6e
        L56:
            android.net.NetworkInfo r2 = r2.getActiveNetworkInfo()     // Catch: java.lang.Throwable -> L95
            boolean r5 = values(r2)     // Catch: java.lang.Throwable -> L95
            if (r5 == 0) goto L6e
            int r5 = r2.getType()     // Catch: java.lang.Throwable -> L95
            if (r8 != r5) goto L67
            goto L48
        L67:
            int r2 = r2.getType()     // Catch: java.lang.Throwable -> L95
            if (r2 != 0) goto L6e
            goto L54
        L6e:
            java.lang.String r2 = "phone"
            java.lang.Object r12 = r12.getSystemService(r2)     // Catch: java.lang.Throwable -> L95
            android.telephony.TelephonyManager r12 = (android.telephony.TelephonyManager) r12     // Catch: java.lang.Throwable -> L95
            java.lang.String r2 = r12.getSimOperatorName()     // Catch: java.lang.Throwable -> L95
            java.lang.String r1 = r12.getNetworkOperatorName()     // Catch: java.lang.Throwable -> L90
            if (r1 == 0) goto L86
            boolean r3 = r1.isEmpty()     // Catch: java.lang.Throwable -> L90
            if (r3 == 0) goto L9f
        L86:
            r3 = 2
            int r12 = r12.getPhoneType()     // Catch: java.lang.Throwable -> L90
            if (r3 != r12) goto L9f
            java.lang.String r1 = "CDMA"
            goto L9f
        L90:
            r12 = move-exception
            r11 = r2
            r2 = r1
            r1 = r11
            goto L97
        L95:
            r12 = move-exception
            r2 = r1
        L97:
            java.lang.String r3 = "Exception while collecting network info. "
            com.appsflyer.AFLogger.valueOf(r3, r12)
            r11 = r2
            r2 = r1
            r1 = r11
        L9f:
            com.appsflyer.internal.u$a r12 = new com.appsflyer.internal.u$a
            r12.<init>(r0, r1, r2)
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.u.AFInAppEventType(android.content.Context):com.appsflyer.internal.u$a");
    }
}
