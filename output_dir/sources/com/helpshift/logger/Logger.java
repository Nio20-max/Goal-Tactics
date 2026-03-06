package com.helpshift.logger;

import android.content.Context;
import android.util.Log;
import com.helpshift.logger.constants.LogLevel;
import com.helpshift.logger.database.LogSQLiteStorage;
import com.helpshift.logger.database.LogStorage;
import com.helpshift.logger.logmodels.ILogExtrasModel;
import com.helpshift.logger.model.LogModel;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes2.dex */
public class Logger implements ILogger {
    private static final String DEBUG = "DEBUG";
    private static final String ERROR = "ERROR";
    private static final String FATAL = "FATAL";
    static final int MAX_EXTRAS_COUNT = 20;
    static final int MAX_LOG_SIZE = 5000;
    private static final String WARN = "WARN";
    private boolean enableConsoleLogging;
    private boolean enableLogCaching;
    private LogStorage logStorage;
    private final String sdkVersion;
    private final SimpleDateFormat simpleDateFormat;
    private ThreadPoolExecutor threadPoolExecutor;
    private long timestampDelta;
    private int consoleLoggingLevel = 4;
    private int requiredLogCachingLevel = LogLevel.FATAL.getValue();
    private final String TAG = Logger.class.getSimpleName();

    public Logger(Context context, String str, String str2) {
        this.logStorage = new LogSQLiteStorage(context, str);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        this.simpleDateFormat = simpleDateFormat;
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        this.sdkVersion = str2;
    }

    @Override // com.helpshift.logger.ILogger
    public void enableLogging(boolean z, boolean z2) {
        this.enableConsoleLogging = z;
        if (this.enableLogCaching == z2) {
            return;
        }
        this.enableLogCaching = z2;
        if (z2) {
            this.threadPoolExecutor = new ThreadPoolExecutor(1, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue(), new ThreadFactory() { // from class: com.helpshift.logger.Logger.1
                @Override // java.util.concurrent.ThreadFactory
                public Thread newThread(Runnable runnable) {
                    return new Thread(runnable, "HS-Logger");
                }
            });
        } else {
            ThreadPoolExecutor threadPoolExecutor = this.threadPoolExecutor;
            if (threadPoolExecutor != null) {
                threadPoolExecutor.shutdown();
            }
        }
    }

    @Override // com.helpshift.logger.ILogger
    public void setConsoleLoggingLevel(int i) {
        this.consoleLoggingLevel = i;
    }

    @Override // com.helpshift.logger.ILogger
    public void setLogCachingLevel(int i) {
        this.requiredLogCachingLevel = i;
    }

    @Override // com.helpshift.logger.ILogger
    public void setTimestampDelta(long j) {
        this.timestampDelta = j;
    }

    @Override // com.helpshift.logger.ILogger
    public void d(String str, String str2) {
        d(str, str2, null, null);
    }

    @Override // com.helpshift.logger.ILogger
    public void w(String str, String str2) {
        w(str, str2, null, null);
    }

    @Override // com.helpshift.logger.ILogger
    public void e(String str, String str2) {
        e(str, str2, null, null);
    }

    @Override // com.helpshift.logger.ILogger
    public void d(String str, String str2, Throwable[] thArr) {
        d(str, str2, thArr, null);
    }

    @Override // com.helpshift.logger.ILogger
    public void w(String str, String str2, Throwable[] thArr) {
        w(str, str2, thArr, null);
    }

    @Override // com.helpshift.logger.ILogger
    public void e(String str, String str2, Throwable[] thArr) {
        e(str, str2, thArr, null);
    }

    @Override // com.helpshift.logger.ILogger
    public void f(String str, String str2, Throwable[] thArr) {
        f(str, str2, thArr, null);
    }

    @Override // com.helpshift.logger.ILogger
    public void d(String str, String str2, ILogExtrasModel... iLogExtrasModelArr) {
        d(str, str2, null, iLogExtrasModelArr);
    }

    @Override // com.helpshift.logger.ILogger
    public void w(String str, String str2, ILogExtrasModel... iLogExtrasModelArr) {
        w(str, str2, null, iLogExtrasModelArr);
    }

    @Override // com.helpshift.logger.ILogger
    public void e(String str, String str2, ILogExtrasModel... iLogExtrasModelArr) {
        e(str, str2, null, iLogExtrasModelArr);
    }

    @Override // com.helpshift.logger.ILogger
    public void d(String str, String str2, Throwable[] thArr, ILogExtrasModel... iLogExtrasModelArr) {
        if (!isConsoleLoggingEnabled() || this.consoleLoggingLevel > 2) {
            return;
        }
        Log.d(str, str2 + getExtrasForConsoleLogging(iLogExtrasModelArr) + getStackTraceString(thArr));
    }

    @Override // com.helpshift.logger.ILogger
    public void w(String str, String str2, Throwable[] thArr, ILogExtrasModel... iLogExtrasModelArr) {
        String stackTraceString;
        if (!isConsoleLoggingEnabled() || this.consoleLoggingLevel > 4) {
            stackTraceString = null;
        } else {
            stackTraceString = getStackTraceString(thArr);
            Log.w(str, str2 + getExtrasForConsoleLogging(iLogExtrasModelArr) + stackTraceString);
        }
        if (shouldAddLogToDatabase(LogLevel.WARN)) {
            if (stackTraceString == null) {
                stackTraceString = getStackTraceString(thArr);
            }
            logMessageToDatabase(WARN, str2, stackTraceString, iLogExtrasModelArr);
        }
    }

    @Override // com.helpshift.logger.ILogger
    public void e(String str, String str2, Throwable[] thArr, ILogExtrasModel... iLogExtrasModelArr) {
        String stackTraceString;
        if (!isConsoleLoggingEnabled() || this.consoleLoggingLevel > 8) {
            stackTraceString = null;
        } else {
            stackTraceString = getStackTraceString(thArr);
            Log.e(str, str2 + getExtrasForConsoleLogging(iLogExtrasModelArr) + stackTraceString);
        }
        if (!shouldAddLogToDatabase(LogLevel.ERROR) || containsUnknownHostException(thArr)) {
            return;
        }
        if (stackTraceString == null) {
            stackTraceString = getStackTraceString(thArr);
        }
        logMessageToDatabase(ERROR, str2, stackTraceString, iLogExtrasModelArr);
    }

    @Override // com.helpshift.logger.ILogger
    public void f(String str, String str2, Throwable[] thArr, ILogExtrasModel... iLogExtrasModelArr) {
        String stackTraceString;
        if (!isConsoleLoggingEnabled() || this.consoleLoggingLevel > 16) {
            stackTraceString = null;
        } else {
            stackTraceString = getStackTraceString(thArr);
            Log.e(str, str2 + getExtrasForConsoleLogging(iLogExtrasModelArr) + stackTraceString);
        }
        if (shouldAddLogToDatabase(LogLevel.FATAL)) {
            if (stackTraceString == null) {
                stackTraceString = getStackTraceString(thArr);
            }
            Future futureLogMessageToDatabase = logMessageToDatabase(FATAL, str2, stackTraceString, iLogExtrasModelArr);
            if (futureLogMessageToDatabase != null) {
                try {
                    futureLogMessageToDatabase.get();
                } catch (Exception e) {
                    Log.e(this.TAG, "Error logging fatal log : " + e.getMessage());
                }
            }
        }
    }

    @Override // com.helpshift.logger.ILogger
    public List<LogModel> getAll() {
        return this.logStorage.getAll();
    }

    @Override // com.helpshift.logger.ILogger
    public void deleteAllCachedLogs() {
        this.logStorage.deleteAll();
    }

    private boolean shouldAddLogToDatabase(LogLevel logLevel) {
        return this.enableLogCaching && logLevel.getValue() <= this.requiredLogCachingLevel;
    }

    private boolean isConsoleLoggingEnabled() {
        return this.enableConsoleLogging;
    }

    private Future logMessageToDatabase(String str, String str2, String str3, ILogExtrasModel[] iLogExtrasModelArr) {
        LogMessage logMessage = new LogMessage();
        logMessage.level = str;
        logMessage.extras = iLogExtrasModelArr;
        logMessage.message = str2;
        logMessage.timeStamp = System.currentTimeMillis() + this.timestampDelta;
        logMessage.stacktrace = str3;
        logMessage.sdkVersion = this.sdkVersion;
        try {
            return this.threadPoolExecutor.submit(new WorkerThread(logMessage, this.logStorage, this.simpleDateFormat));
        } catch (RejectedExecutionException e) {
            Log.e(this.TAG, "Rejected execution of log message : " + logMessage.message, e);
            return null;
        }
    }

    private boolean containsUnknownHostException(Throwable[] thArr) {
        if (thArr == null) {
            return false;
        }
        for (Throwable th : thArr) {
            if (th instanceof UnknownHostException) {
                return true;
            }
        }
        return false;
    }

    private String getExtrasForConsoleLogging(ILogExtrasModel[] iLogExtrasModelArr) {
        if (iLogExtrasModelArr == null || iLogExtrasModelArr.length <= 0) {
            return " ";
        }
        StringBuilder sb = new StringBuilder(" ");
        for (ILogExtrasModel iLogExtrasModel : iLogExtrasModelArr) {
            if (iLogExtrasModel != null) {
                sb.append(iLogExtrasModel.getConsoleLoggingMessage());
                sb.append(" ");
            }
        }
        return sb.toString();
    }

    private String getStackTraceString(Throwable[] thArr) {
        if (thArr == null) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        if (containsUnknownHostException(thArr)) {
            return "UnknownHostException";
        }
        for (Throwable th : thArr) {
            sb.append(Log.getStackTraceString(th));
        }
        return sb.toString();
    }

    private List<String> convertMaskToLogLevel(int i) {
        if (i == 0) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        if ((i & 8) != 0) {
            arrayList.add(ERROR);
        }
        if ((i & 4) != 0) {
            arrayList.add(WARN);
        }
        if ((i & 16) != 0) {
            arrayList.add(FATAL);
        }
        return arrayList;
    }
}
