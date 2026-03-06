package com.helpshift.util;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import java.util.Locale;

/* JADX INFO: loaded from: classes2.dex */
public class LocaleContextUtil {
    public static Context getContextWithUpdatedLocale(Context context) {
        Locale currentLocaleFromStorage;
        if (Build.VERSION.SDK_INT < 17 || (currentLocaleFromStorage = HelpshiftContext.getCoreApi().getLocaleProviderDM().getCurrentLocaleFromStorage()) == null) {
            return context;
        }
        Configuration configuration = new Configuration(context.getResources().getConfiguration());
        configuration.setLocale(currentLocaleFromStorage);
        return context.createConfigurationContext(configuration);
    }

    public static Context getContextWithUpdatedLocaleLegacy(Context context) {
        Locale currentLocaleFromStorage = HelpshiftContext.getCoreApi().getLocaleProviderDM().getCurrentLocaleFromStorage();
        if (currentLocaleFromStorage != null) {
            HelpshiftContext.getCoreApi().getLocaleProviderDM().backupApplicationLocale();
            Resources resources = context.getResources();
            Configuration configuration = new Configuration(resources.getConfiguration());
            configuration.locale = currentLocaleFromStorage;
            resources.updateConfiguration(configuration, resources.getDisplayMetrics());
        }
        return context;
    }

    public static void restoreApplicationLocale() {
        HelpshiftContext.getCoreApi().getLocaleProviderDM().restoreApplicationLocale();
    }
}
