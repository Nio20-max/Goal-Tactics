package com.appsflyer.internal;

import androidx.core.view.PointerIconCompat;

/* JADX INFO: loaded from: classes.dex */
public class e {
    private static long onAppOpenAttribution = 0;
    public static byte[] onAppOpenAttributionNative = null;
    private static int onAttributionFailure = 0;
    private static Object onConversionDataFail = null;
    private static Object onConversionDataSuccess = null;
    public static final int onDeepLinking = 0;
    private static int onResponse = 1;
    public static final byte[] onResponseError = null;
    private static int onResponseErrorNative;
    public static byte[] onResponseNative;

    /* JADX WARN: Removed duplicated region for block: B:21:0x0049  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0066  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:31:0x0066 -> B:32:0x006d). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.lang.String $$c(byte r8, short r9, int r10) {
        /*
            int r0 = com.appsflyer.internal.e.onResponse
            int r0 = r0 + 125
            int r1 = r0 % 128
            com.appsflyer.internal.e.onAttributionFailure = r1
            int r0 = r0 % 2
            byte[] r0 = com.appsflyer.internal.e.onResponseError
            int r10 = -r10
            r2 = r10 | 36
            r3 = 1
            int r2 = r2 << r3
            r10 = r10 ^ 36
            int r2 = r2 - r10
            int r9 = 998 - r9
            int r8 = 119 - r8
            byte[] r10 = new byte[r2]
            r4 = 0
            if (r0 != 0) goto L1f
            r5 = 1
            goto L20
        L1f:
            r5 = 0
        L20:
            if (r5 == 0) goto L3e
            int r1 = r1 + 111
            int r5 = r1 % 128
            com.appsflyer.internal.e.onResponse = r5
            int r1 = r1 % 2
            r5 = 58
            if (r1 != 0) goto L31
            r1 = 58
            goto L33
        L31:
            r1 = 89
        L33:
            if (r1 == r5) goto L36
            goto L39
        L36:
            r1 = 91
            int r1 = r1 / r4
        L39:
            r5 = r2
            r1 = 0
            goto L6d
        L3c:
            r8 = move-exception
            throw r8
        L3e:
            r1 = 0
        L3f:
            r7 = r2
            r2 = r8
            r8 = r7
            int r5 = r1 + 1
            byte r6 = (byte) r2
            r10[r1] = r6
            if (r5 != r8) goto L66
            java.lang.String r8 = new java.lang.String
            r8.<init>(r10, r4)
            int r9 = com.appsflyer.internal.e.onAttributionFailure
            r10 = r9 & 7
            r9 = r9 | 7
            int r10 = r10 + r9
            int r9 = r10 % 128
            com.appsflyer.internal.e.onResponse = r9
            int r10 = r10 % 2
            if (r10 != 0) goto L5e
            r3 = 0
        L5e:
            if (r3 == 0) goto L61
            return r8
        L61:
            r9 = 0
            int r9 = r9.length     // Catch: java.lang.Throwable -> L64
            return r8
        L64:
            r8 = move-exception
            throw r8
        L66:
            r1 = r0[r9]
            r7 = r2
            r2 = r8
            r8 = r1
            r1 = r5
            r5 = r7
        L6d:
            r6 = r9 ^ 1
            r9 = r9 & r3
            int r9 = r9 << r3
            int r9 = r9 + r6
            int r8 = -r8
            int r8 = -r8
            r6 = r5 & r8
            r8 = r8 | r5
            int r6 = r6 + r8
            r8 = r6 | (-3)
            int r8 = r8 << r3
            r5 = r6 ^ (-3)
            int r8 = r8 - r5
            int r5 = com.appsflyer.internal.e.onResponse
            int r5 = r5 + 102
            int r5 = r5 - r3
            int r6 = r5 % 128
            com.appsflyer.internal.e.onAttributionFailure = r6
            int r5 = r5 % 2
            goto L3f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.e.$$c(byte, short, int):java.lang.String");
    }

    public static int AFInAppEventParameterName(int i) throws Throwable {
        int i2 = onAttributionFailure;
        int i3 = ((i2 | 61) << 1) - (i2 ^ 61);
        onResponse = i3 % 128;
        int i4 = i3 % 2;
        Object obj = onConversionDataSuccess;
        int i5 = (i2 & 105) + (i2 | 105);
        onResponse = i5 % 128;
        int i6 = i5 % 2;
        try {
            int iIntValue = ((Integer) Class.forName($$c(r8[431], (short) (-onResponseError[398]), r8[167]), true, (ClassLoader) onConversionDataFail).getMethod($$c(r8[12], (short) 679, r8[431]), Integer.TYPE).invoke(obj, Integer.valueOf(i))).intValue();
            int i7 = onAttributionFailure + 97;
            onResponse = i7 % 128;
            int i8 = i7 % 2;
            return iIntValue;
        } catch (Throwable th) {
            Throwable cause = th.getCause();
            if (cause != null) {
                throw cause;
            }
            throw th;
        }
    }

    public static Object AFInAppEventParameterName(int i, int i2, char c) throws Throwable {
        int i3 = onResponse;
        int i4 = (i3 ^ 85) + ((i3 & 85) << 1);
        onAttributionFailure = i4 % 128;
        int i5 = i4 % 2;
        Object obj = onConversionDataSuccess;
        int i6 = ((i3 | 27) << 1) - (i3 ^ 27);
        onAttributionFailure = i6 % 128;
        int i7 = i6 % 2;
        try {
            Object objInvoke = Class.forName($$c(r8[431], (short) (-onResponseError[398]), r8[167]), true, (ClassLoader) onConversionDataFail).getMethod($$c(r8[12], (short) 407, r8[646]), Integer.TYPE, Integer.TYPE, Character.TYPE).invoke(obj, Integer.valueOf(i), Integer.valueOf(i2), Character.valueOf(c));
            int i8 = onResponse;
            int i9 = (i8 ^ 79) + ((i8 & 79) << 1);
            onAttributionFailure = i9 % 128;
            if (i9 % 2 == 0) {
                return objInvoke;
            }
            int i10 = 94 / 0;
            return objInvoke;
        } catch (Throwable th) {
            Throwable cause = th.getCause();
            if (cause != null) {
                throw cause;
            }
            throw th;
        }
    }

    public static int AFInAppEventType(Object obj) throws Throwable {
        Object obj2;
        int i = onAttributionFailure + 47;
        int i2 = i % 128;
        onResponse = i2;
        if ((i % 2 == 0 ? 'A' : ',') != ',') {
            obj2 = onConversionDataSuccess;
            Object[] objArr = null;
            int length = objArr.length;
        } else {
            obj2 = onConversionDataSuccess;
        }
        int i3 = (i2 & 27) + (i2 | 27);
        onAttributionFailure = i3 % 128;
        int i4 = i3 % 2;
        try {
            int iIntValue = ((Integer) Class.forName($$c(r8[431], (short) (-onResponseError[398]), r8[167]), true, (ClassLoader) onConversionDataFail).getMethod($$c(r8[12], (short) 407, r8[646]), Object.class).invoke(obj2, obj)).intValue();
            int i5 = (onAttributionFailure + 2) - 1;
            onResponse = i5 % 128;
            int i6 = i5 % 2;
            return iIntValue;
        } catch (Throwable th) {
            Throwable cause = th.getCause();
            if (cause != null) {
                throw cause;
            }
            throw th;
        }
    }

    static void init$0() {
        int i = (onResponse + 126) - 1;
        onAttributionFailure = i % 128;
        int i2 = i % 2;
        byte[] bArr = new byte[PointerIconCompat.TYPE_TOP_RIGHT_DIAGONAL_DOUBLE_ARROW];
        System.arraycopy("G»¾\u0012ú\u0018îÐ>\tÂ\u00176ô\u0003\u0002\u0010ö\u0002è(\u0005\b\u0002â$\u0001öÿ\u000fú\u0018îÐAø\u0010üÊ()ý\u0004ô\u000b\u0015\u0000\u0003ö\f\tÐ2\u0003ÿ\u0000ý\u0001\u0016ø\t\u0002\u0010ù\u0011\u0000ýþÍD\u0007¾%%\u0000÷\u0005\u0011\u0003ú\u0018îÐCþ\tÂ\u0017:þôà6ô\u0003\u0002\u0010\u0010ù\u0011\u0000ýþÍD\u0007¾\u00176÷\u0006ûÃ5ò\u0010\u0004ù\t\u0002ú\u0018îÐ>\tÂ\u0017:þôß4\u0003ò\u001bÓ(\u0005\b\u0002â$\u0001öÿ\u000f\u0000\u000e\rö\u0005ÆH\tý\u0004ô\u000bÄ\u001e(â\u001b\u000b\u0005\u0006\nÎ$\u0016Î,ø\u0015\u0003Ü&õ\u0006\u0004\u0010öÿ\u0006å2ú\u0003\u0010\u000f\u0001Å5\u0012\u0003\u0006ö\t\u0010ï\u0010À=\b\tô\u0010ÿö\u000eÆ7Ä\u0003\u0001\u0012Õ&\u0006ü\u0011Ô(\fþú\u000eô\u0001\u0012Ò!\u0005\b\u0000â(\föÿ\u0006\u0000\u000e\rö\u0005ÆH\tý\u0004ô\u000bÄ\u0019$\u0016Ñ&\u0006ü\u000fø\u0004ý\u0007\u0001\u0005\b\u0000\u0000\u000e\rö\u0005ÆH\tý\u0004ô\u000bÄ\u0017\"\u0015õâ$\u0016Î,ø\u0015\u0003Ü&õ\u0006\u0004\u0010\u0001\u0012Ò/ø\u0004á!\u0005\b\u0000â(\f\tøø\b\u0006(Ö2\u0003Ø4ò\f\tã(úøî\nì\u000bI\u0004´Iþ\u000e\u0003ù\u0002\u0005\u000b\u000b°Oü\u0004\u0011¸î\tí\u000bî\u0007ï\u000bî\u000bë\u000bú\u0018îÐAø\u0010üÊ\u0018,ø\u0015\u0003Ü&õ\u0006\u0004\u0010\u0010ù\u0011\u0000ýþÍ6\u0012\u0003Á\u00162\u0003Ú(\u0006ö\u0002\u000e\n\u0001\u0012Ô6ÿô\u0010ÿö\u000eê$þ\u0006ò\t\u0001â(\fö\u0001\u0014þ\u0006\n7\u000f\u0001Å5\u0012\u0003\u0006ö\t\u0010ï\u0010À=\b\tô\u0010ÿö\u000eÆ6Îú\u0018îÐ>\tÂ\u0019 \u0016ðë(\u0005\b\u0002â$\u0001öÿ\u000f\u0006õ\u0006ã$\u0016ú\u0018îÐ>\tÂ\u0017:þôß4\u0003ò\u001bÙ)\u0002ÿ\b\u0002â$\u0001öÿ\u000f\u0010ù\u0011\u0000ýþÍD\u0007¾\u001a,\u000bö\f\u0000\u0002\u0002û\f\tî\u000e\fó\u0011\u0001\u0012Þ\u001a\u0003\u0010õ\u0012Ñ&\u0004\f\u0006öû\u0001\n\u0001\u0012Ò,ø\u0015\u0003Ü&õ\u0006\u0004\u00108\u0000\u0016ðÑ8\u0000\u0016ðÑ\u0004\nü\u0012ô\u0001\u0012Õ\u0001\b\b\u001d\u0017ý\u0004þ\u0006öõ\u001eò\u0012\u0003ø\u0010ô\n\u0017í\b\t\u000f\u0001Å5\u0012\u0003\u0006ö\t\u0010ï\u0010À=\b\tô\u0010ÿö\u000eÆ9ÂOö\u0016ø\u0010òê ü\u0013ò\u0014\nÚ\u0014\u0016÷à*ü\u000bû\f\t\u0002\f\u0006\u0007õ\u0001\u0012ã\u0017\röÿ\u0006ï%ú\t\u0006ú\u000e\b7\u000f\u0001Å5\u0012\u0003\u0006ö\t\u0010ï\u0010À=\b\tô\u0010ÿö\u000eÆ5Ïú\u0018îÐ>\tÂIü\u0006÷\b\f\u0001\u0012ß%\u0000\u0004ø\u0010\u0005\b\u0001\u0012Ð$\u0014ÿ\u0000\f\u0002ôî\u0014\u0016÷\u0010ù\u0011\u0000ýþÍ6\u0012\u0003Á\u0016%\u0014ø\u0010ö\u000e\bÞ\u0017\röÿ\u0006ú\u0018îÐ>\tÂ\u001b&\u0006üí)\u0002ÿ\b\u0002â$\u0001öÿ\u000f\u0001\u0010ì\u001eú\u000eôú\u0018îÐ>\tÂ\u001e\tù6î\u0005\u000e\u0007ø\t\u0002\u0010ù\u0011\u0000ýþÍIô\u0016ÿ½)\u0014\u0016ÿä\"ø\u0006\nô\u0016÷ç \r\u0004\u0001\u0012Ø(þ\u000eøû\u000eØ2\u0003ÿ\u0000ý\u0001\u0016ø\t\u0002ú\u0018îÐ>\tÂ\u001b&\u0006üî\u0006ð\u000b\u0015\u0000\u0003ö\f\tã\u0018\u0007ûë\u001f\u0006\u0003\u0000\rú\u0018îÐ>\tÂ\u001b&\u0006üâ$\u0011ó\u0012ú\n\u0007þ\u0006þÖ:þôß4\u0003ò\u001b\u0006õ\u0006â,ø\u0015\u0003\u000f\u0001Ä6\u0012\u0003\u0006ö\t\u0010ï\u0010¿>\b\tô\u0010ÿö\u000eÅ8Ä\u0003\u000f\u0001Ä6\u0012\u0003\u0006ö\t\u0010ï\u0010þò\u0012ö\u0016ø\u0010òê ü\u0013ò\u0014\nÎ(\fö\u0001\u0014þ\u0006úÿ\u0011ú\u0018îÐ>\tÂ\u001e(\u0005\b\u0002â$\u0001öÿ\u000f".getBytes("ISO-8859-1"), 0, bArr, 0, PointerIconCompat.TYPE_TOP_RIGHT_DIAGONAL_DOUBLE_ARROW);
        onResponseError = bArr;
        onDeepLinking = 82;
        int i3 = onAttributionFailure;
        int i4 = (i3 & 67) + (i3 | 67);
        onResponse = i4 % 128;
        int i5 = i4 % 2;
    }

    private e() {
    }

    /* JADX WARN: Code restructure failed: missing block: B:129:0x042f, code lost:
    
        if (((java.lang.Boolean) java.lang.Class.forName($$c(r7[149(0x95, float:2.09E-43)], r12, r7[5])).getMethod($$c(r7[431(0x1af, float:6.04E-43)], (short) 206, (byte) (-com.appsflyer.internal.e.onResponseError[833(0x341, float:1.167E-42)])), null).invoke(r11, null)).booleanValue() != false) goto L146;
     */
    /* JADX WARN: Code restructure failed: missing block: B:784:0x1850, code lost:
    
        r1 = com.appsflyer.internal.e.onAttributionFailure;
        r3 = ((r1 | 51) << 1) - (r1 ^ 51);
        com.appsflyer.internal.e.onResponse = r3 % 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:785:0x185f, code lost:
    
        if ((r3 % 2) != 0) goto L787;
     */
    /* JADX WARN: Code restructure failed: missing block: B:786:0x1861, code lost:
    
        r1 = 'c';
     */
    /* JADX WARN: Code restructure failed: missing block: B:787:0x1864, code lost:
    
        r1 = 31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:789:0x1868, code lost:
    
        if (r1 == 31) goto L791;
     */
    /* JADX WARN: Code restructure failed: missing block: B:790:0x186a, code lost:
    
        r1 = com.appsflyer.internal.e.onResponseError;
        r3 = r1[61];
        r4 = (short) 15470;
        r1 = r1[29858(0x74a2, float:4.184E-41)];
     */
    /* JADX WARN: Code restructure failed: missing block: B:791:0x1879, code lost:
    
        r1 = com.appsflyer.internal.e.onResponseError;
        r3 = r1[52];
        r4 = (short) 664;
        r1 = r1[149(0x95, float:2.09E-43)];
     */
    /* JADX WARN: Code restructure failed: missing block: B:794:0x188d, code lost:
    
        r4 = new java.lang.Object[]{$$c(r3, r4, r1), r2};
        r1 = com.appsflyer.internal.e.onResponseError;
     */
    /* JADX WARN: Code restructure failed: missing block: B:795:0x18c3, code lost:
    
        throw ((java.lang.Throwable) java.lang.Class.forName($$c(r1[149(0x95, float:2.09E-43)], (short) 199, r1[64])).getDeclaredConstructor(java.lang.String.class, java.lang.Throwable.class).newInstance(r4));
     */
    /* JADX WARN: Code restructure failed: missing block: B:796:0x18c4, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:798:0x18c6, code lost:
    
        r2 = r0.getCause();
     */
    /* JADX WARN: Code restructure failed: missing block: B:799:0x18ca, code lost:
    
        if (r2 != null) goto L800;
     */
    /* JADX WARN: Code restructure failed: missing block: B:800:0x18cc, code lost:
    
        throw r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:801:0x18cd, code lost:
    
        throw r0;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:1008:0x1850 A[EDGE_INSN: B:1008:0x1850->B:784:0x1850 BREAK  A[LOOP:0: B:107:0x03c1->B:804:0x18f3], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:1015:0x184d A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:583:0x13f1 A[Catch: all -> 0x177c, TRY_LEAVE, TryCatch #62 {all -> 0x177c, blocks: (B:501:0x1057, B:507:0x10c5, B:517:0x1121, B:551:0x126e, B:554:0x1308, B:556:0x1312, B:563:0x13ba, B:583:0x13f1, B:577:0x13e7), top: B:944:0x1057 }] */
    /* JADX WARN: Removed duplicated region for block: B:771:0x182e  */
    /* JADX WARN: Removed duplicated region for block: B:772:0x1830  */
    /* JADX WARN: Removed duplicated region for block: B:774:0x1833 A[Catch: Exception -> 0x192c, TRY_ENTER, TRY_LEAVE, TryCatch #50 {Exception -> 0x192c, blocks: (B:3:0x000f, B:7:0x0036, B:41:0x014e, B:59:0x01b7, B:811:0x1919, B:813:0x1920, B:814:0x1921, B:816:0x1923, B:818:0x192a, B:819:0x192b, B:65:0x0237, B:71:0x0295, B:73:0x029b, B:74:0x029c, B:76:0x02cc, B:78:0x0350, B:88:0x038b, B:93:0x03a1, B:97:0x03aa, B:101:0x03b4, B:105:0x03bd, B:119:0x03e4, B:774:0x1833, B:790:0x186a, B:792:0x1887, B:798:0x18c6, B:800:0x18cc, B:801:0x18cd, B:791:0x1879, B:802:0x18ce, B:804:0x18f3, B:806:0x190f, B:808:0x1916, B:809:0x1917, B:47:0x0199, B:49:0x019f, B:50:0x01a0, B:61:0x01d5, B:794:0x188d, B:795:0x18c3, B:75:0x029d, B:67:0x0258, B:43:0x0171, B:62:0x020e), top: B:921:0x000f, inners: #3, #27, #77, #85, #86, #88 }] */
    /* JADX WARN: Removed duplicated region for block: B:802:0x18ce A[Catch: Exception -> 0x192c, TryCatch #50 {Exception -> 0x192c, blocks: (B:3:0x000f, B:7:0x0036, B:41:0x014e, B:59:0x01b7, B:811:0x1919, B:813:0x1920, B:814:0x1921, B:816:0x1923, B:818:0x192a, B:819:0x192b, B:65:0x0237, B:71:0x0295, B:73:0x029b, B:74:0x029c, B:76:0x02cc, B:78:0x0350, B:88:0x038b, B:93:0x03a1, B:97:0x03aa, B:101:0x03b4, B:105:0x03bd, B:119:0x03e4, B:774:0x1833, B:790:0x186a, B:792:0x1887, B:798:0x18c6, B:800:0x18cc, B:801:0x18cd, B:791:0x1879, B:802:0x18ce, B:804:0x18f3, B:806:0x190f, B:808:0x1916, B:809:0x1917, B:47:0x0199, B:49:0x019f, B:50:0x01a0, B:61:0x01d5, B:794:0x188d, B:795:0x18c3, B:75:0x029d, B:67:0x0258, B:43:0x0171, B:62:0x020e), top: B:921:0x000f, inners: #3, #27, #77, #85, #86, #88 }] */
    /* JADX WARN: Type inference failed for: r36v1 */
    /* JADX WARN: Type inference failed for: r36v10 */
    /* JADX WARN: Type inference failed for: r36v11 */
    /* JADX WARN: Type inference failed for: r36v12 */
    /* JADX WARN: Type inference failed for: r36v13 */
    /* JADX WARN: Type inference failed for: r36v14 */
    /* JADX WARN: Type inference failed for: r36v18 */
    /* JADX WARN: Type inference failed for: r36v2 */
    /* JADX WARN: Type inference failed for: r36v20 */
    /* JADX WARN: Type inference failed for: r36v21 */
    /* JADX WARN: Type inference failed for: r36v22 */
    /* JADX WARN: Type inference failed for: r36v24 */
    /* JADX WARN: Type inference failed for: r36v25 */
    /* JADX WARN: Type inference failed for: r36v26 */
    /* JADX WARN: Type inference failed for: r36v27 */
    /* JADX WARN: Type inference failed for: r36v28 */
    /* JADX WARN: Type inference failed for: r36v3 */
    /* JADX WARN: Type inference failed for: r36v32 */
    /* JADX WARN: Type inference failed for: r36v33 */
    /* JADX WARN: Type inference failed for: r36v34 */
    /* JADX WARN: Type inference failed for: r36v35 */
    /* JADX WARN: Type inference failed for: r36v36 */
    /* JADX WARN: Type inference failed for: r36v37 */
    /* JADX WARN: Type inference failed for: r36v38 */
    /* JADX WARN: Type inference failed for: r36v39 */
    /* JADX WARN: Type inference failed for: r36v4 */
    /* JADX WARN: Type inference failed for: r36v40 */
    /* JADX WARN: Type inference failed for: r36v41 */
    /* JADX WARN: Type inference failed for: r36v42 */
    /* JADX WARN: Type inference failed for: r36v43 */
    /* JADX WARN: Type inference failed for: r36v44 */
    /* JADX WARN: Type inference failed for: r36v45 */
    /* JADX WARN: Type inference failed for: r36v46 */
    /* JADX WARN: Type inference failed for: r36v47 */
    /* JADX WARN: Type inference failed for: r36v48 */
    /* JADX WARN: Type inference failed for: r36v49 */
    /* JADX WARN: Type inference failed for: r36v5 */
    /* JADX WARN: Type inference failed for: r36v8 */
    /* JADX WARN: Type inference failed for: r36v9 */
    /* JADX WARN: Type inference failed for: r4v150 */
    /* JADX WARN: Type inference failed for: r8v259 */
    /* JADX WARN: Unreachable blocks removed: 2, instructions: 2 */
    static {
        /*
            Method dump skipped, instruction units count: 6452
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.e.<clinit>():void");
    }
}
