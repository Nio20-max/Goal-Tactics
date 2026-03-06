package com.helpshift.common.domain;

import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.logger.logmodels.ILogExtrasModel;
import com.helpshift.logger.logmodels.LogExtrasModelProvider;
import com.helpshift.util.HSLogger;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.RejectedExecutionException;

/* JADX INFO: loaded from: classes2.dex */
class BackgroundThreader implements Threader {
    private static final String TAG = "Helpshift_CoreBgTh";
    final ExecutorService service;

    BackgroundThreader(ExecutorService executorService) {
        this.service = executorService;
    }

    @Override // com.helpshift.common.domain.Threader
    public F thread(final F f) {
        return new F() { // from class: com.helpshift.common.domain.BackgroundThreader.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                f.cause = new Throwable();
                try {
                    BackgroundThreader.this.service.submit(new Runnable() { // from class: com.helpshift.common.domain.BackgroundThreader.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            try {
                                f.f();
                            } catch (RootAPIException e) {
                                if (e.shouldLog()) {
                                    HSLogger.e(BackgroundThreader.TAG, e.message == null ? "" : e.message, new Throwable[]{e.exception, f.cause}, e.exceptionType instanceof NetworkException ? LogExtrasModelProvider.fromString("route", ((NetworkException) e.exceptionType).route) : null);
                                }
                            } catch (Exception e2) {
                                HSLogger.f(BackgroundThreader.TAG, "Caught unhandled exception inside BackgroundThreader", new Throwable[]{e2, f.cause}, new ILogExtrasModel[0]);
                            }
                        }
                    });
                } catch (RejectedExecutionException e) {
                    HSLogger.e(BackgroundThreader.TAG, "Rejected execution of task in BackgroundThreader", e);
                }
            }
        };
    }
}
