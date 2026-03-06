package com.ironsource.mediationsdk.logger;

import com.ironsource.mediationsdk.logger.IronSourceLogger;

/* JADX INFO: loaded from: classes2.dex */
public enum IronLog {
    API(IronSourceLogger.IronSourceTag.API),
    CALLBACK(IronSourceLogger.IronSourceTag.CALLBACK),
    ADAPTER_API(IronSourceLogger.IronSourceTag.ADAPTER_API),
    ADAPTER_CALLBACK(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK),
    NETWORK(IronSourceLogger.IronSourceTag.NETWORK),
    INTERNAL(IronSourceLogger.IronSourceTag.INTERNAL),
    NATIVE(IronSourceLogger.IronSourceTag.NATIVE),
    EVENT(IronSourceLogger.IronSourceTag.EVENT);

    IronSourceLogger.IronSourceTag mTag;

    IronLog(IronSourceLogger.IronSourceTag ironSourceTag) {
        this.mTag = ironSourceTag;
    }

    public void verbose(String str) {
        IronSourceLoggerManager.getLogger().log(this.mTag, createLogMessage(str), 0);
    }

    public void info(String str) {
        IronSourceLoggerManager.getLogger().log(this.mTag, createLogMessage(str), 1);
    }

    public void warning(String str) {
        IronSourceLoggerManager.getLogger().log(this.mTag, createLogMessage(str), 2);
    }

    public void error(String str) {
        IronSourceLoggerManager.getLogger().log(this.mTag, createLogMessage(str), 3);
    }

    private String createLogMessage(String str) {
        return str.isEmpty() ? getLogPrefix() : String.format("%s - %s", getLogPrefix(), str);
    }

    private String getLogPrefix() {
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        return String.format("%s %s", getClassName(stackTrace, 5), getMethodName(stackTrace, 5));
    }

    private String getClassName(StackTraceElement[] stackTraceElementArr, int i) {
        String str = stackTraceElementArr[i].getClassName().split("\\.")[r1.length - 1];
        return str.contains("$") ? str.split("\\$")[0] : str;
    }

    private String getMethodName(StackTraceElement[] stackTraceElementArr, int i) {
        String[] strArrSplit = stackTraceElementArr[i].getClassName().split("\\.");
        String str = strArrSplit[strArrSplit.length - 1];
        if (str.contains("$")) {
            return str.split("\\$")[1] + "." + stackTraceElementArr[i].getMethodName();
        }
        if (stackTraceElementArr[i].getMethodName().contains("$")) {
            int i2 = i + 1;
            String[] strArrSplit2 = stackTraceElementArr[i2].getClassName().split("\\$");
            if (strArrSplit2.length > 1) {
                return strArrSplit2[1] + "." + stackTraceElementArr[i2].getMethodName();
            }
            return stackTraceElementArr[i2].getMethodName();
        }
        return stackTraceElementArr[i].getMethodName();
    }
}
