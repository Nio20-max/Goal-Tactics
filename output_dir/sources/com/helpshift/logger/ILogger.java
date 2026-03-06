package com.helpshift.logger;

import com.helpshift.logger.logmodels.ILogExtrasModel;
import com.helpshift.logger.model.LogModel;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public interface ILogger {
    public static final int DEBUG = 2;
    public static final int ERROR = 8;
    public static final int FATAL = 16;
    public static final int WARN = 4;

    void d(String str, String str2);

    void d(String str, String str2, ILogExtrasModel... iLogExtrasModelArr);

    void d(String str, String str2, Throwable[] thArr);

    void d(String str, String str2, Throwable[] thArr, ILogExtrasModel... iLogExtrasModelArr);

    void deleteAllCachedLogs();

    void e(String str, String str2);

    void e(String str, String str2, ILogExtrasModel... iLogExtrasModelArr);

    void e(String str, String str2, Throwable[] thArr);

    void e(String str, String str2, Throwable[] thArr, ILogExtrasModel... iLogExtrasModelArr);

    void enableLogging(boolean z, boolean z2);

    void f(String str, String str2, Throwable[] thArr);

    void f(String str, String str2, Throwable[] thArr, ILogExtrasModel... iLogExtrasModelArr);

    List<LogModel> getAll();

    void setConsoleLoggingLevel(int i);

    void setLogCachingLevel(int i);

    void setTimestampDelta(long j);

    void w(String str, String str2);

    void w(String str, String str2, ILogExtrasModel... iLogExtrasModelArr);

    void w(String str, String str2, Throwable[] thArr);

    void w(String str, String str2, Throwable[] thArr, ILogExtrasModel... iLogExtrasModelArr);
}
