package com.microsoft.appcenter.analytics.channel;

import com.microsoft.appcenter.ingestion.models.Log;

/* JADX INFO: loaded from: classes2.dex */
public interface AnalyticsListener {
    void onBeforeSending(Log log);

    void onSendingFailed(Log log, Exception e);

    void onSendingSucceeded(Log log);
}
