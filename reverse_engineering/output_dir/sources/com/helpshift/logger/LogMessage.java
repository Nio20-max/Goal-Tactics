package com.helpshift.logger;

import com.helpshift.logger.logmodels.ILogExtrasModel;

/* JADX INFO: compiled from: Logger.java */
/* JADX INFO: loaded from: classes2.dex */
class LogMessage {
    ILogExtrasModel[] extras;
    String level;
    String message;
    String sdkVersion;
    String stacktrace;
    long timeStamp;

    LogMessage() {
    }
}
