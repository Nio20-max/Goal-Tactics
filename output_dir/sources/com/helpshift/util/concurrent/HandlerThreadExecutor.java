package com.helpshift.util.concurrent;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;

/* JADX INFO: loaded from: classes2.dex */
public class HandlerThreadExecutor implements ApiExecutor {
    private Handler handler;
    private final Object syncLock = new Object();
    Handler uiHandler;

    public HandlerThreadExecutor(String str) {
        HandlerThread handlerThread = new HandlerThread(str);
        handlerThread.start();
        this.handler = new Handler(handlerThread.getLooper());
        this.uiHandler = new Handler(Looper.getMainLooper());
    }

    @Override // com.helpshift.util.concurrent.ApiExecutor
    public void runAsync(Runnable runnable) {
        this.handler.post(runnable);
    }

    @Override // com.helpshift.util.concurrent.ApiExecutor
    public void runSync(Runnable runnable) {
        NotifyingRunnable notifyingRunnable = new NotifyingRunnable(runnable);
        synchronized (this.syncLock) {
            this.handler.post(notifyingRunnable);
            notifyingRunnable.waitForCompletion();
        }
    }

    @Override // com.helpshift.util.concurrent.ApiExecutor
    public void runOnUiThread(final Runnable runnable) {
        runAsync(new Runnable() { // from class: com.helpshift.util.concurrent.HandlerThreadExecutor.1
            @Override // java.lang.Runnable
            public void run() {
                HandlerThreadExecutor.this.uiHandler.post(runnable);
            }
        });
    }

    @Override // com.helpshift.util.concurrent.ApiExecutor
    public void awaitForSyncExecution() {
        runSync(new Runnable() { // from class: com.helpshift.util.concurrent.HandlerThreadExecutor.2
            @Override // java.lang.Runnable
            public void run() {
            }
        });
    }
}
