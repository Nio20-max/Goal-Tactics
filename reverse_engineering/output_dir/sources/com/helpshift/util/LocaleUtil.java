package com.helpshift.util;

import android.content.Context;
import android.os.Build;
import android.os.LocaleList;
import java.util.Locale;

/* JADX INFO: loaded from: classes2.dex */
public class LocaleUtil {
    public static String getCountry(Context context) {
        Locale locale;
        if (Build.VERSION.SDK_INT >= 24) {
            LocaleList locales = context.getResources().getConfiguration().getLocales();
            locale = locales.size() > 0 ? locales.get(0) : null;
        } else {
            locale = context.getResources().getConfiguration().locale;
        }
        return locale != null ? locale.getCountry() : "";
    }
}
