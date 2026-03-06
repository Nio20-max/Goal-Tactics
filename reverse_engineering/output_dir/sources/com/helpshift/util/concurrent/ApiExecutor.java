package com.helpshift.util.concurrent;

/* JADX INFO: loaded from: classes2.dex */
public interface ApiExecutor {
    void awaitForSyncExecution();

    void runAsync(Runnable runnable);

    void runOnUiThread(Runnable runnable);

    void runSync(Runnable runnable);
}
