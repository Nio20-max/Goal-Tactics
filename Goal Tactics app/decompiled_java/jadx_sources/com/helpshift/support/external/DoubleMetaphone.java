package com.helpshift.support.external;

/* JADX INFO: loaded from: classes2.dex */
public class DoubleMetaphone {
    private static final String VOWELS = "AEIOUY";
    int maxCodeLen = 4;
    private static final String[] SILENT_START = {"GN", "KN", "PN", "WR", "PS"};
    private static final String[] L_R_N_M_B_H_F_V_W_SPACE = {"L", "R", "N", "M", "B", "H", "F", "V", "W", " "};
    private static final String[] ES_EP_EB_EL_EY_IB_IL_IN_IE_EI_ER = {"ES", "EP", "EB", "EL", "EY", "IB", "IL", "IN", "IE", "EI", "ER"};
    private static final String[] L_T_K_S_N_M_B_Z = {"L", "T", "K", "S", "N", "M", "B", "Z"};

    protected static boolean contains(String str, int i, int i2, String[] strArr) {
        int i3;
        if (i < 0 || (i3 = i2 + i) > str.length()) {
            return false;
        }
        String strSubstring = str.substring(i, i3);
        for (String str2 : strArr) {
            if (strSubstring.equals(str2)) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Failed to find 'out' block for switch in B:40:0x0090. Please report as an issue. */
    /* JADX WARN: Removed duplicated region for block: B:245:0x0508  */
    /* JADX WARN: Removed duplicated region for block: B:256:0x054e  */
    /* JADX WARN: Removed duplicated region for block: B:264:0x057c  */
    /* JADX WARN: Removed duplicated region for block: B:265:0x057e A[PHI: r3
      0x057e: PHI (r3v493 int) = 
      (r3v163 int)
      (r3v181 int)
      (r3v181 int)
      (r3v182 int)
      (r3v183 int)
      (r3v317 int)
      (r3v420 int)
      (r3v423 int)
      (r3v423 int)
      (r3v452 int)
      (r3v459 int)
      (r3v462 int)
      (r3v463 int)
      (r3v474 int)
      (r3v485 int)
      (r3v517 int)
      (r3v566 int)
      (r3v571 int)
     binds: [B:1002:0x1552, B:991:0x1510, B:993:0x151e, B:994:0x1520, B:989:0x14fe, B:746:0x0fc8, B:471:0x09e9, B:461:0x09b7, B:462:0x09b9, B:430:0x090b, B:411:0x08b3, B:401:0x0884, B:402:0x0886, B:383:0x0825, B:373:0x07f6, B:338:0x0748, B:264:0x057c, B:263:0x057a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:500:0x0a79  */
    /* JADX WARN: Removed duplicated region for block: B:690:0x0e93  */
    /* JADX WARN: Removed duplicated region for block: B:800:0x10ea  */
    /* JADX WARN: Removed duplicated region for block: B:810:0x1114  */
    /* JADX WARN: Removed duplicated region for block: B:822:0x1150  */
    /* JADX WARN: Removed duplicated region for block: B:841:0x11ba  */
    /* JADX WARN: Removed duplicated region for block: B:842:0x11bc  */
    /* JADX WARN: Removed duplicated region for block: B:849:0x11e1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.String doubleMetaphone(java.lang.String r23, boolean r24) {
        /*
            Method dump skipped, instruction units count: 5654
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.external.DoubleMetaphone.doubleMetaphone(java.lang.String, boolean):java.lang.String");
    }

    protected char charAt(String str, int i) {
        if (i < 0 || i >= str.length()) {
            return (char) 0;
        }
        return str.charAt(i);
    }

    public class DoubleMetaphoneResult {
        final StringBuilder alternate;
        final int maxLength;
        final StringBuilder primary;

        public DoubleMetaphoneResult(int i) {
            this.primary = new StringBuilder(DoubleMetaphone.this.maxCodeLen);
            this.alternate = new StringBuilder(DoubleMetaphone.this.maxCodeLen);
            this.maxLength = i;
        }
    }
}
