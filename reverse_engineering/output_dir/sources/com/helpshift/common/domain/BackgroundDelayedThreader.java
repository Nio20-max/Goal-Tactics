package com.helpshift.common.domain;

import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.logger.logmodels.ILogExtrasModel;
import com.helpshift.logger.logmodels.LogExtrasModelProvider;
import com.helpshift.util.HSLogger;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes2.dex */
class BackgroundDelayedThreader implements DelayedThreader {
    private static final String TAG = "Helpshift_CoreDelayTh";
    final ScheduledExecutorService service;

    BackgroundDelayedThreader(ScheduledExecutorService scheduledExecutorService) {
        this.service = scheduledExecutorService;
    }

    @Override // com.helpshift.common.domain.DelayedThreader
    public F thread(final F f, final long j) {
        return new F() { // from class: com.helpshift.common.domain.BackgroundDelayedThreader.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                f.cause = new Throwable();
                try {
                    BackgroundDelayedThreader.this.service.schedule(new Runnable() { // from class: com.helpshift.common.domain.BackgroundDelayedThreader.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            try {
                                f.f();
                            } catch (RootAPIException e) {
                                if (e.shouldLog()) {
                                    HSLogger.e(BackgroundDelayedThreader.TAG, e.message == null ? "" : e.message, new Throwable[]{e.exception, f.cause}, e.exceptionType instanceof NetworkException ? LogExtrasModelProvider.fromString("route", ((NetworkException) e.exceptionType).route) : null);
                                }
                            } catch (Exception e2) {
                                HSLogger.f(BackgroundDelayedThreader.TAG, "Caught unhandled exception inside BackgroundThreader", new Throwable[]{e2, f.cause}, new ILogExtrasModel[0]);
                            }
                        }
                    }, j, TimeUnit.MILLISECONDS);
                } catch (RejectedExecutionException e) {
                    HSLogger.e(BackgroundDelayedThreader.TAG, "Rejected execution of task in BackgroundDelayedThreader", e);
                }
            }
        };
    }
}
