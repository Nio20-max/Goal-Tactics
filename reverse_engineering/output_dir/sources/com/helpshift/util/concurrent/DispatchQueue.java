package com.helpshift.util.concurrent;

import com.helpshift.common.domain.HSThreadFactory;
import com.helpshift.util.HSLogger;
import java.util.Iterator;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;

/* JADX INFO: loaded from: classes2.dex */
public class DispatchQueue {
    private static final String TAG = "HS_DispatchQueue";
    private ExecutorService threadPoolExecutor;
    private LinkedBlockingQueue<Future> tasks = new LinkedBlockingQueue<>();
    private LinkedBlockingQueue<Thread> afterThreads = new LinkedBlockingQueue<>();

    public DispatchQueue(boolean z) {
        if (z) {
            this.threadPoolExecutor = Executors.newCachedThreadPool(new HSThreadFactory("cmdpq-a"));
        } else {
            this.threadPoolExecutor = Executors.newSingleThreadExecutor(new HSThreadFactory("cmdpq-b"));
        }
    }

    public void dispatchSync(Runnable runnable) {
        try {
            this.threadPoolExecutor.submit(runnable).get();
        } catch (InterruptedException e) {
            HSLogger.w(TAG, "Runnable interrupted : ", e);
            Thread.currentThread().interrupt();
        } catch (ExecutionException e2) {
            HSLogger.w(TAG, "Execution exception : ", e2);
        }
    }

    private void trackTask(Future future) {
        this.tasks.add(future);
    }

    public void dispatchAsync(Runnable runnable) {
        trackTask(this.threadPoolExecutor.submit(runnable));
    }

    public void dispatchAfter(final Runnable runnable, final long j) {
        Thread thread = new Thread(new Runnable() { // from class: com.helpshift.util.concurrent.DispatchQueue.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Thread.sleep(j);
                    this.dispatchAsync(runnable);
                } catch (InterruptedException e) {
                    HSLogger.w(DispatchQueue.TAG, "Runnable interrupted : ", e);
                    Thread.currentThread().interrupt();
                }
            }
        }, "HS-cmdpq-trig");
        thread.start();
        this.afterThreads.add(thread);
    }

    public void join() {
        try {
            Iterator<Thread> it = this.afterThreads.iterator();
            while (it.hasNext()) {
                it.next().join();
            }
            Iterator<Future> it2 = this.tasks.iterator();
            while (it2.hasNext()) {
                it2.next().get();
            }
            this.tasks.clear();
        } catch (InterruptedException e) {
            HSLogger.w(TAG, "Runnable interrupted : ", e);
            Thread.currentThread().interrupt();
        } catch (ExecutionException e2) {
            HSLogger.w(TAG, "Execution exception : ", e2);
        }
    }
}
