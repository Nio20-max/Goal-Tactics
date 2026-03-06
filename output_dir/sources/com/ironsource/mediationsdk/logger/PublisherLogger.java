package com.ironsource.mediationsdk.logger;

import com.ironsource.mediationsdk.logger.IronSourceLogger;

/* JADX INFO: loaded from: classes2.dex */
public class PublisherLogger extends IronSourceLogger {
    private static final String NAME = "publisher";
    private LogListener mLogListener;

    private PublisherLogger() {
        super(NAME);
    }

    public PublisherLogger(LogListener logListener, int i) {
        super(NAME, i);
        this.mLogListener = logListener;
    }

    @Override // com.ironsource.mediationsdk.logger.IronSourceLogger
    public synchronized void log(IronSourceLogger.IronSourceTag ironSourceTag, String str, int i) {
        LogListener logListener = this.mLogListener;
        if (logListener != null && str != null) {
            logListener.onLog(ironSourceTag, str, i);
        }
    }

    @Override // com.ironsource.mediationsdk.logger.IronSourceLogger
    public void logException(IronSourceLogger.IronSourceTag ironSourceTag, String str, Throwable th) {
        if (th != null) {
            log(ironSourceTag, th.getMessage(), 3);
        }
    }

    public void setLogListener(LogListener logListener) {
        this.mLogListener = logListener;
    }
}
