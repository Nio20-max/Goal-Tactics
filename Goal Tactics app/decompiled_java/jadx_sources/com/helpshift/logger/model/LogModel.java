package com.helpshift.logger.model;

/* JADX INFO: loaded from: classes2.dex */
public class LogModel {
    public final String extras;
    public final String level;
    public final String message;
    public final String sdkVersion;
    public final String stacktrace;
    public final String timeStamp;

    public LogModel(String str, String str2, String str3, String str4, String str5, String str6) {
        this.timeStamp = str;
        this.extras = str5;
        this.level = str2;
        this.stacktrace = str4;
        this.message = str3;
        this.sdkVersion = str6;
    }
}
