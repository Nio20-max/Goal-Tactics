package com.ironsource.mediationsdk.events;

import android.os.Handler;
import android.os.HandlerThread;
import com.ironsource.mediationsdk.logger.ThreadExceptionHandler;

/* JADX INFO: loaded from: classes2.dex */
public class SuperLooper extends Thread {
    private static SuperLooper mInstance;
    private SupersonicSdkThread mSdkThread;

    private SuperLooper() {
        SupersonicSdkThread supersonicSdkThread = new SupersonicSdkThread(getClass().getSimpleName());
        this.mSdkThread = supersonicSdkThread;
        supersonicSdkThread.start();
        this.mSdkThread.prepareHandler();
    }

    public static synchronized SuperLooper getLooper() {
        if (mInstance == null) {
            mInstance = new SuperLooper();
        }
        return mInstance;
    }

    public synchronized void post(Runnable runnable) {
        SupersonicSdkThread supersonicSdkThread = this.mSdkThread;
        if (supersonicSdkThread == null) {
            return;
        }
        Handler callbackHandler = supersonicSdkThread.getCallbackHandler();
        if (callbackHandler != null) {
            callbackHandler.post(runnable);
        }
    }

    private class SupersonicSdkThread extends HandlerThread {
        private Handler mHandler;

        SupersonicSdkThread(String str) {
            super(str);
            setUncaughtExceptionHandler(new ThreadExceptionHandler());
        }

        void prepareHandler() {
            this.mHandler = new Handler(getLooper());
        }

        Handler getCallbackHandler() {
            return this.mHandler;
        }
    }
}
