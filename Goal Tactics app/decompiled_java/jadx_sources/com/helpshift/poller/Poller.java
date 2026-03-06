package com.helpshift.poller;

import com.helpshift.common.poller.Delay;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.util.HSLogger;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes2.dex */
public abstract class Poller<V> implements Runnable {
    private static final String TAG = "Helpshift_Poller";
    private final Callable<V> callable;
    private final ExecutorService executorService;
    private final ScheduledExecutorService scheduledExecutorService;
    private boolean started;

    public abstract Delay getFailDelay(Exception exc);

    public abstract Delay getSuccessDelay(V v);

    public Poller(Callable<V> callable, ExecutorService executorService, ScheduledExecutorService scheduledExecutorService) {
        this.callable = callable;
        this.executorService = executorService;
        this.scheduledExecutorService = scheduledExecutorService;
    }

    public void shutdown() {
        this.started = false;
        this.scheduledExecutorService.shutdownNow();
        this.executorService.shutdownNow();
    }

    public void start() {
        if (this.started) {
            return;
        }
        this.started = true;
        try {
            this.executorService.execute(this);
        } catch (RejectedExecutionException e) {
            HSLogger.e(TAG, "Rejected execution : ", e);
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        runDelayed(0L, TimeUnit.SECONDS);
    }

    void runDelayed(long j, TimeUnit timeUnit) {
        final Delay failDelay;
        try {
            if (!this.started || this.scheduledExecutorService.isShutdown()) {
                return;
            }
            try {
                failDelay = getSuccessDelay(this.scheduledExecutorService.schedule(this.callable, j, timeUnit).get());
            } catch (Exception e) {
                if (e.getCause() instanceof NetworkError) {
                    failDelay = getFailDelay((NetworkError) e.getCause());
                } else {
                    failDelay = getFailDelay(e);
                }
            }
            if (failDelay != null && !this.executorService.isShutdown()) {
                this.executorService.execute(new Runnable() { // from class: com.helpshift.poller.Poller.1
                    @Override // java.lang.Runnable
                    public void run() {
                        Poller.this.runDelayed(failDelay.delay, failDelay.timeUnit);
                    }
                });
                return;
            }
            this.started = false;
        } catch (RejectedExecutionException e2) {
            HSLogger.e(TAG, "Rejected execution of run delayed : ", e2);
        }
    }
}
