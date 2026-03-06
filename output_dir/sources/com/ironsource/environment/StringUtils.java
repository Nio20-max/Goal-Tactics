package com.ironsource.environment;

import java.util.Locale;

/* JADX INFO: loaded from: classes2.dex */
public class StringUtils {
    public static String toUpperCase(String str) {
        return str.toUpperCase(Locale.ENGLISH);
    }

    public static String toLowerCase(String str) {
        return str.toLowerCase(Locale.ENGLISH);
    }
}
