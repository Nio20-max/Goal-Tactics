package com.helpshift.util;

import com.helpshift.logger.ILogger;
import com.helpshift.logger.logmodels.ILogExtrasModel;
import com.helpshift.logger.model.LogModel;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class HSLogger {
    public static final String LOG_STORE_DB_NAME = "__hs_log_store";
    public static final String OLD_ERROR_REPORTING_DATABASE_NAME = "__hs__db_error_reports";
    private static ILogger logger;

    public static void initialize(ILogger iLogger, int i, int i2) {
        logger = iLogger;
        iLogger.setConsoleLoggingLevel(i);
        logger.setLogCachingLevel(i2);
    }

    public static void updateTimeStampDelta(float f) {
        logger.setTimestampDelta(((long) f) * 1000);
    }

    public static void enableLogging(boolean z, boolean z2) {
        ILogger iLogger = logger;
        if (iLogger != null) {
            iLogger.enableLogging(z, z2);
        }
    }

    public static void d(String str, String str2) {
        d(str, str2, null, null);
    }

    public static void w(String str, String str2) {
        w(str, str2, null, null);
    }

    public static void e(String str, String str2) {
        e(str, str2, (Throwable[]) null, (ILogExtrasModel[]) null);
    }

    public static void d(String str, String str2, Throwable th) {
        d(str, str2, th, null);
    }

    public static void w(String str, String str2, Throwable th) {
        w(str, str2, th, null);
    }

    public static void e(String str, String str2, Throwable th) {
        e(str, str2, new Throwable[]{th}, (ILogExtrasModel[]) null);
    }

    public static void d(String str, String str2, ILogExtrasModel... iLogExtrasModelArr) {
        d(str, str2, null, iLogExtrasModelArr);
    }

    public static void d(String str, String str2, Throwable th, ILogExtrasModel... iLogExtrasModelArr) {
        logMessage(2, str, str2, new Throwable[]{th}, iLogExtrasModelArr);
    }

    public static void w(String str, String str2, Throwable th, ILogExtrasModel... iLogExtrasModelArr) {
        logMessage(4, str, str2, new Throwable[]{th}, iLogExtrasModelArr);
    }

    public static void e(String str, String str2, Throwable th, ILogExtrasModel... iLogExtrasModelArr) {
        logMessage(8, str, str2, new Throwable[]{th}, iLogExtrasModelArr);
    }

    public static void e(String str, String str2, Throwable[] thArr, ILogExtrasModel... iLogExtrasModelArr) {
        logMessage(8, str, str2, thArr, iLogExtrasModelArr);
    }

    public static void f(String str, String str2, Throwable th, ILogExtrasModel... iLogExtrasModelArr) {
        logMessage(16, str, str2, new Throwable[]{th}, iLogExtrasModelArr);
    }

    public static void f(String str, String str2, Throwable[] thArr, ILogExtrasModel... iLogExtrasModelArr) {
        logMessage(16, str, str2, thArr, iLogExtrasModelArr);
    }

    private static void logMessage(int i, String str, String str2, Throwable[] thArr, ILogExtrasModel... iLogExtrasModelArr) {
        ILogger iLogger = logger;
        if (iLogger == null) {
            return;
        }
        if (i == 2) {
            iLogger.d(str, str2, thArr, iLogExtrasModelArr);
            return;
        }
        if (i == 4) {
            iLogger.w(str, str2, thArr, iLogExtrasModelArr);
        } else if (i == 8) {
            iLogger.e(str, str2, thArr, iLogExtrasModelArr);
        } else {
            if (i != 16) {
                return;
            }
            iLogger.f(str, str2, thArr, iLogExtrasModelArr);
        }
    }

    public static List<LogModel> getAll() {
        ILogger iLogger = logger;
        if (iLogger == null) {
            return null;
        }
        return iLogger.getAll();
    }

    public static void deleteAll() {
        ILogger iLogger = logger;
        if (iLogger == null) {
            return;
        }
        iLogger.deleteAllCachedLogs();
    }
}
