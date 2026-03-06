package com.helpshift.exceptions.handlers;

import android.content.Context;
import android.util.Log;
import com.helpshift.BuildConfig;
import com.helpshift.logger.logmodels.ILogExtrasModel;
import com.helpshift.util.ErrorReportProvider;
import com.helpshift.util.HSLogger;
import java.lang.Thread;

/* JADX INFO: loaded from: classes2.dex */
public class UncaughtExceptionHandler {
    private static final CharSequence HELPSHIFT_BASE_PACKAGE_NAME = BuildConfig.APPLICATION_ID;

    public static void init(final Context context) {
        final Thread.UncaughtExceptionHandler defaultUncaughtExceptionHandler = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() { // from class: com.helpshift.exceptions.handlers.UncaughtExceptionHandler.1
            @Override // java.lang.Thread.UncaughtExceptionHandler
            public void uncaughtException(Thread thread, Throwable th) {
                if (UncaughtExceptionHandler.isCausedByHelpshift(th)) {
                    HSLogger.f("UncaughtExceptionHandler", "UNCAUGHT EXCEPTION ", th, (ILogExtrasModel[]) ErrorReportProvider.getErrorReportExtras(context, thread).toArray(new ILogExtrasModel[0]));
                }
                Thread.UncaughtExceptionHandler uncaughtExceptionHandler = defaultUncaughtExceptionHandler;
                if (uncaughtExceptionHandler != null) {
                    uncaughtExceptionHandler.uncaughtException(thread, th);
                }
            }
        });
    }

    static boolean isCausedByHelpshift(Throwable th) {
        if (th == null) {
            return false;
        }
        return Log.getStackTraceString(th).contains(HELPSHIFT_BASE_PACKAGE_NAME);
    }
}
