package com.helpshift.applifecycle;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
public abstract class BaseAppLifeCycleTracker {
    private Context context;
    private HSAppLifeCycleListener lifeCycleListener;

    public abstract boolean isAppInForeground();

    public abstract void onManualAppBackgroundAPI();

    public abstract void onManualAppForegroundAPI();

    BaseAppLifeCycleTracker(Context context) {
        this.context = context;
    }

    void registerAppLifeCycleListener(HSAppLifeCycleListener hSAppLifeCycleListener) {
        this.lifeCycleListener = hSAppLifeCycleListener;
    }

    void unregisterAppLifeCycleListener() {
        this.lifeCycleListener = null;
    }

    void notifyAppForeground() {
        HSAppLifeCycleListener hSAppLifeCycleListener = this.lifeCycleListener;
        if (hSAppLifeCycleListener == null) {
            return;
        }
        hSAppLifeCycleListener.onAppForeground(this.context);
    }

    void notifyAppBackground() {
        HSAppLifeCycleListener hSAppLifeCycleListener = this.lifeCycleListener;
        if (hSAppLifeCycleListener == null) {
            return;
        }
        hSAppLifeCycleListener.onAppBackground(this.context);
    }
}
