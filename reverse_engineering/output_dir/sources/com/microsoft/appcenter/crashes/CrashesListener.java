package com.microsoft.appcenter.crashes;

import com.microsoft.appcenter.crashes.ingestion.models.ErrorAttachmentLog;
import com.microsoft.appcenter.crashes.model.ErrorReport;

/* JADX INFO: loaded from: classes2.dex */
public interface CrashesListener {
    Iterable<ErrorAttachmentLog> getErrorAttachments(ErrorReport report);

    void onBeforeSending(ErrorReport report);

    void onSendingFailed(ErrorReport report, Exception e);

    void onSendingSucceeded(ErrorReport report);

    boolean shouldAwaitUserConfirmation();

    boolean shouldProcess(ErrorReport report);
}
