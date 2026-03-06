package com.ironsource.mediationsdk.utils;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: loaded from: classes2.dex */
public class ContextProvider {
    private static volatile ContextProvider mInstance;
    private Activity mCurrentActiveActivity;
    private Handler mainThreadHandler = new Handler(Looper.getMainLooper());
    private ConcurrentHashMap<String, ContextLifeCycleListener> mLifeCycleListenerUniqueByClassNameMap = new ConcurrentHashMap<>();

    public interface ContextLifeCycleListener {
        void onPause(Activity activity);

        void onResume(Activity activity);
    }

    private ContextProvider() {
    }

    public static ContextProvider getInstance() {
        if (mInstance == null) {
            synchronized (ContextProvider.class) {
                if (mInstance == null) {
                    mInstance = new ContextProvider();
                }
            }
        }
        return mInstance;
    }

    public void updateActivity(Activity activity) {
        if (activity != null) {
            this.mCurrentActiveActivity = activity;
        }
    }

    public void onResume(Activity activity) {
        if (activity != null) {
            this.mCurrentActiveActivity = activity;
            Iterator<ContextLifeCycleListener> it = this.mLifeCycleListenerUniqueByClassNameMap.values().iterator();
            while (it.hasNext()) {
                it.next().onResume(this.mCurrentActiveActivity);
            }
        }
    }

    public void onPause(Activity activity) {
        if (activity != null) {
            Iterator<ContextLifeCycleListener> it = this.mLifeCycleListenerUniqueByClassNameMap.values().iterator();
            while (it.hasNext()) {
                it.next().onPause(activity);
            }
        }
    }

    public Activity getCurrentActiveActivity() {
        return this.mCurrentActiveActivity;
    }

    public Context getApplicationContext() {
        return this.mCurrentActiveActivity.getApplicationContext();
    }

    public void registerLifeCycleListener(ContextLifeCycleListener contextLifeCycleListener) {
        this.mLifeCycleListenerUniqueByClassNameMap.put(contextLifeCycleListener.getClass().getSimpleName(), contextLifeCycleListener);
    }

    public void postOnUIThread(Runnable runnable) {
        Handler handler = this.mainThreadHandler;
        if (handler != null) {
            handler.post(runnable);
        }
    }

    public void runOnUIThread(Runnable runnable) {
        Activity activity = this.mCurrentActiveActivity;
        if (activity != null) {
            activity.runOnUiThread(runnable);
        }
    }
}
