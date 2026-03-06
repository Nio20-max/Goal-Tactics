package com.microsoft.appcenter;

import com.microsoft.appcenter.utils.AppCenterLog;
import com.microsoft.appcenter.utils.InstrumentationRegistryHelper;

/* JADX INFO: loaded from: classes2.dex */
class ServiceInstrumentationUtils {
    static final String DISABLE_ALL_SERVICES = "All";
    static final String DISABLE_SERVICES = "APP_CENTER_DISABLE";

    ServiceInstrumentationUtils() {
    }

    static boolean isServiceDisabledByInstrumentation(String serviceName) {
        try {
            String string = InstrumentationRegistryHelper.getArguments().getString(DISABLE_SERVICES);
            if (string == null) {
                return false;
            }
            for (String str : string.split(",")) {
                String strTrim = str.trim();
                if (strTrim.equals(DISABLE_ALL_SERVICES) || strTrim.equals(serviceName)) {
                    return true;
                }
            }
            return false;
        } catch (IllegalStateException | LinkageError unused) {
            AppCenterLog.debug("AppCenter", "Cannot read instrumentation variables in a non-test environment.");
            return false;
        }
    }
}
