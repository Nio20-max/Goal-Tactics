package com.helpshift.applifecycle;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import com.helpshift.PluginEventBridge;
import com.helpshift.util.HSLogger;

/* JADX INFO: loaded from: classes.dex */
class DefaultAppLifeCycleTracker extends BaseAppLifeCycleTracker implements Application.ActivityLifecycleCallbacks {
    private static String TAG = "DALCTracker";
    private boolean isAppForeground;
    private boolean isConfigurationChanged;
    private int started;
    private int stopped;

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityCreated(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityDestroyed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityPaused(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityResumed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    DefaultAppLifeCycleTracker(Application application) {
        super(application);
        this.isConfigurationChanged = false;
        application.unregisterActivityLifecycleCallbacks(this);
        application.registerActivityLifecycleCallbacks(this);
        if (PluginEventBridge.shouldCallFirstForegroundEvent()) {
            this.started++;
            this.isAppForeground = true;
        }
    }

    @Override // com.helpshift.applifecycle.BaseAppLifeCycleTracker
    public boolean isAppInForeground() {
        return this.started > this.stopped;
    }

    @Override // com.helpshift.applifecycle.BaseAppLifeCycleTracker
    public void onManualAppForegroundAPI() {
        HSLogger.e(TAG, "Install API is called with manualLifeCycleTracking config as false, Ignore this event");
    }

    @Override // com.helpshift.applifecycle.BaseAppLifeCycleTracker
    public void onManualAppBackgroundAPI() {
        HSLogger.e(TAG, "Install API is called with manualLifeCycleTracking config as false, Ignore this event");
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStarted(Activity activity) {
        this.started++;
        if (!this.isConfigurationChanged) {
            if (!this.isAppForeground) {
                notifyAppForeground();
            }
            this.isAppForeground = true;
        }
        this.isConfigurationChanged = false;
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(Activity activity) {
        this.stopped++;
        boolean z = activity != null && activity.isChangingConfigurations();
        this.isConfigurationChanged = z;
        if (z || this.started != this.stopped) {
            return;
        }
        this.isAppForeground = false;
        notifyAppBackground();
    }
}
