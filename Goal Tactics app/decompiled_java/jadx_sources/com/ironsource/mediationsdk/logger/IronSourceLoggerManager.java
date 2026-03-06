package com.ironsource.mediationsdk.logger;

import com.ironsource.mediationsdk.logger.IronSourceLogger;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: loaded from: classes2.dex */
public class IronSourceLoggerManager extends IronSourceLogger implements LogListener {
    private static IronSourceLoggerManager mInstance;
    private ArrayList<IronSourceLogger> mLoggers;

    private IronSourceLoggerManager(String str) {
        super(str);
        this.mLoggers = new ArrayList<>();
        initSubLoggers();
    }

    private IronSourceLoggerManager(String str, int i) {
        super(str, i);
        this.mLoggers = new ArrayList<>();
        initSubLoggers();
    }

    private void initSubLoggers() {
        this.mLoggers.add(new ConsoleLogger(0));
    }

    public static synchronized IronSourceLoggerManager getLogger() {
        if (mInstance == null) {
            mInstance = new IronSourceLoggerManager(IronSourceLoggerManager.class.getSimpleName());
        }
        return mInstance;
    }

    public static synchronized IronSourceLoggerManager getLogger(int i) {
        IronSourceLoggerManager ironSourceLoggerManager = mInstance;
        if (ironSourceLoggerManager == null) {
            mInstance = new IronSourceLoggerManager(IronSourceLoggerManager.class.getSimpleName());
        } else {
            ironSourceLoggerManager.mDebugLevel = i;
        }
        return mInstance;
    }

    public void addLogger(IronSourceLogger ironSourceLogger) {
        this.mLoggers.add(ironSourceLogger);
    }

    @Override // com.ironsource.mediationsdk.logger.IronSourceLogger
    public synchronized void log(IronSourceLogger.IronSourceTag ironSourceTag, String str, int i) {
        if (i < this.mDebugLevel) {
            return;
        }
        for (IronSourceLogger ironSourceLogger : this.mLoggers) {
            if (ironSourceLogger.getDebugLevel() <= i) {
                ironSourceLogger.log(ironSourceTag, str, i);
            }
        }
    }

    @Override // com.ironsource.mediationsdk.logger.LogListener
    public synchronized void onLog(IronSourceLogger.IronSourceTag ironSourceTag, String str, int i) {
        log(ironSourceTag, str, i);
    }

    @Override // com.ironsource.mediationsdk.logger.IronSourceLogger
    public synchronized void logException(IronSourceLogger.IronSourceTag ironSourceTag, String str, Throwable th) {
        if (th == null) {
            Iterator<IronSourceLogger> it = this.mLoggers.iterator();
            while (it.hasNext()) {
                it.next().log(ironSourceTag, str, 3);
            }
        } else {
            Iterator<IronSourceLogger> it2 = this.mLoggers.iterator();
            while (it2.hasNext()) {
                it2.next().logException(ironSourceTag, str, th);
            }
        }
    }

    private IronSourceLogger findLoggerByName(String str) {
        for (IronSourceLogger ironSourceLogger : this.mLoggers) {
            if (ironSourceLogger.getLoggerName().equals(str)) {
                return ironSourceLogger;
            }
        }
        return null;
    }

    public void setLoggerDebugLevel(String str, int i) {
        if (str == null) {
            return;
        }
        IronSourceLogger ironSourceLoggerFindLoggerByName = findLoggerByName(str);
        if (ironSourceLoggerFindLoggerByName == null) {
            log(IronSourceLogger.IronSourceTag.NATIVE, "Failed to find logger:setLoggerDebugLevel(loggerName:" + str + " ,debugLevel:" + i + ")", 0);
            return;
        }
        if (i >= 0 && i <= 3) {
            log(IronSourceLogger.IronSourceTag.NATIVE, "setLoggerDebugLevel(loggerName:" + str + " ,debugLevel:" + i + ")", 0);
            ironSourceLoggerFindLoggerByName.setDebugLevel(i);
            return;
        }
        this.mLoggers.remove(ironSourceLoggerFindLoggerByName);
    }
}
