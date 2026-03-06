package com.helpshift.util;

import java.security.SecureRandom;
import java.text.BreakIterator;

/* JADX INFO: loaded from: classes2.dex */
public class StringUtils {
    public static boolean isEmpty(String str) {
        return str == null || str.trim().length() == 0;
    }

    public static boolean isEmpty(String str, boolean z) {
        if (str == null) {
            return true;
        }
        if (z) {
            str = str.trim();
        }
        return str.length() == 0;
    }

    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }

    public static String join(CharSequence charSequence, Iterable iterable) {
        if (iterable == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        boolean z = true;
        for (Object obj : iterable) {
            if (z) {
                z = false;
            } else {
                sb.append(charSequence);
            }
            sb.append(obj);
        }
        return sb.toString();
    }

    public static boolean isEmptyWithoutTrim(String str) {
        return str == null || str.length() == 0;
    }

    public static String generateRandomString(char[] cArr, int i) {
        if (cArr == null || cArr.length == 0 || i < 0) {
            return null;
        }
        if (i == 0) {
            return "";
        }
        SecureRandom secureRandom = new SecureRandom();
        StringBuilder sb = new StringBuilder();
        for (int i2 = 0; i2 < i; i2++) {
            sb.append(cArr[secureRandom.nextInt(cArr.length)]);
        }
        return sb.toString();
    }

    public static int userVisibleCharacterCount(String str) {
        if (str == null) {
            return -1;
        }
        int i = 0;
        if (str.length() == 0) {
            return 0;
        }
        BreakIterator characterInstance = BreakIterator.getCharacterInstance();
        characterInstance.setText(str);
        while (characterInstance.next() != -1) {
            i++;
        }
        return i;
    }

    public static boolean isEqual(String str, String str2) {
        return (str == null && str2 == null) || (str != null && str.equals(str2));
    }

    public static boolean isNotEqual(String str, String str2) {
        return !isEqual(str, str2);
    }
}
