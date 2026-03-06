package com.helpshift.logger.constants;

/* JADX INFO: loaded from: classes2.dex */
public enum LogLevel {
    OFF(0),
    FATAL(1),
    ERROR(2),
    WARN(3),
    DEBUG(4);

    int value;

    LogLevel(int i) {
        this.value = i;
    }

    public int getValue() {
        return this.value;
    }
}
