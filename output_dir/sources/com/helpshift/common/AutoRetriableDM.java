package com.helpshift.common;

import com.helpshift.common.AutoRetryFailedEventDM;

/* JADX INFO: loaded from: classes.dex */
public interface AutoRetriableDM {
    void sendFailedApiCalls(AutoRetryFailedEventDM.EventType eventType);
}
