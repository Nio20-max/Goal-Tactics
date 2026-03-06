package com.appsflyer.internal;

import android.util.TypedValue;
import android.view.KeyEvent;
import android.widget.ExpandableListView;

/* JADX INFO: loaded from: classes.dex */
public final class bw {
    private static int AFInAppEventParameterName = 1;
    private static int valueOf;
    private static char[] AFInAppEventType = {'3', 39097, 12579, 51629, 25115, 64132, 37643, 11248, 50275, 23779, 62803, 36311, 9802, 48950, 22456, 61476, 34962, 8476, 47488, 21003, 60154, 33643, 7144, 46174, 19652, 58698, 32304, 5834, 44846, 18321, 57369, 30855, 4470, 43516, 16993, 56042, 29534, 2995, 42057, 15665, 54694, 28255, 1681, 40815, 14223, 53363, 26879, 354, 39383, 12894, 51911, 25417, 64575, 38053, 11566, 50583, 24071, 63227, 36726, 10235, 49260, 22737, 61790, 35255};
    private static long values = -3780520048646514550L;

    /* JADX WARN: Removed duplicated region for block: B:20:0x0037  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final com.appsflyer.internal.ay AFKeystoreWrapper(com.appsflyer.internal.ao r6, java.lang.String r7, java.lang.String r8, java.lang.String r9) {
        /*
            r5 = this;
            int r0 = com.appsflyer.internal.bw.AFInAppEventParameterName
            int r0 = r0 + 55
            int r1 = r0 % 128
            com.appsflyer.internal.bw.valueOf = r1
            int r0 = r0 % 2
            r0 = 0
            r2 = 1
            if (r6 == 0) goto L10
            r3 = 0
            goto L11
        L10:
            r3 = 1
        L11:
            if (r3 == r2) goto L37
            int r3 = r1 + 27
            int r4 = r3 % 128
            com.appsflyer.internal.bw.AFInAppEventParameterName = r4
            int r3 = r3 % 2
            if (r8 == 0) goto L1f
            r3 = 1
            goto L20
        L1f:
            r3 = 0
        L20:
            if (r3 == r2) goto L23
            goto L37
        L23:
            r3 = 89
            if (r9 == 0) goto L2a
            r4 = 89
            goto L2c
        L2a:
            r4 = 37
        L2c:
            if (r4 == r3) goto L2f
            goto L37
        L2f:
            int r1 = r1 + r2
            int r3 = r1 % 128
            com.appsflyer.internal.bw.AFInAppEventParameterName = r3
            int r1 = r1 % 2
            goto L38
        L37:
            r2 = 0
        L38:
            if (r2 != 0) goto L42
            com.appsflyer.internal.ay r6 = new com.appsflyer.internal.ay
            com.appsflyer.internal.cw r7 = com.appsflyer.internal.cw.INTERNAL_ERROR
            r6.<init>(r0, r7)
            return r6
        L42:
            com.appsflyer.internal.ay r6 = AFInAppEventType(r6, r7, r8, r9)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.bw.AFKeystoreWrapper(com.appsflyer.internal.ao, java.lang.String, java.lang.String, java.lang.String):com.appsflyer.internal.ay");
    }

    private static ay AFInAppEventType(ao aoVar, String str, String str2, String str3) {
        String string;
        if (str == null) {
            return new ay(aoVar.AFKeystoreWrapper == cs.DEFAULT, cw.NA);
        }
        String strIntern = values((char) (((byte) KeyEvent.getModifierMetaStateMask()) + 1), (TypedValue.complexToFloat(0) > 0.0f ? 1 : (TypedValue.complexToFloat(0) == 0.0f ? 0 : -1)) + 64, ExpandableListView.getPackedPositionType(0L)).intern();
        if (aoVar.AFKeystoreWrapper == cs.CUSTOM) {
            string = new StringBuilder(str2).reverse().toString();
        } else {
            string = "";
            str3 = strIntern;
        }
        boolean zEquals = valueOf(new StringBuilder(str3).reverse().toString(), aoVar.AFInAppEventParameterName, "android", "v1", string).equals(str);
        return new ay(zEquals, zEquals ? cw.SUCCESS : cw.FAILURE);
    }

    private static String valueOf(String str, String str2, String str3, String str4, String str5) {
        int i = AFInAppEventParameterName + 93;
        valueOf = i % 128;
        int i2 = i % 2;
        String strValueOf = ag.valueOf(ag.AFInAppEventParameterName(str2, str3, str4, str5, ""), str);
        if (strValueOf.length() >= 12) {
            return strValueOf.substring(0, 12);
        }
        int i3 = valueOf + 123;
        AFInAppEventParameterName = i3 % 128;
        int i4 = i3 % 2;
        return strValueOf;
    }

    private static String values(char c, int i, int i2) {
        String str;
        synchronized (dh.AFInAppEventParameterName) {
            char[] cArr = new char[i];
            dh.values = 0;
            while (dh.values < i) {
                cArr[dh.values] = (char) ((((long) AFInAppEventType[dh.values + i2]) ^ (((long) dh.values) * values)) ^ ((long) c));
                dh.values++;
            }
            str = new String(cArr);
        }
        return str;
    }
}
