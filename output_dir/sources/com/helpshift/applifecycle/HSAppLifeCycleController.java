package com.helpshift.applifecycle;

import android.app.Application;
import android.content.Context;
import com.helpshift.util.concurrent.ApiExecutorFactory;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class HSAppLifeCycleController implements HSAppLifeCycleListener {
    private List<HSAppLifeCycleListener> appLifeCycleListeners = new ArrayList();
    private BaseAppLifeCycleTracker lifeCycleTracker;
    private static final Object lock = new Object();
    private static HSAppLifeCycleController instance = new HSAppLifeCycleController();

    private HSAppLifeCycleController() {
    }

    public static HSAppLifeCycleController getInstance() {
        return instance;
    }

    public synchronized void init(Application application, boolean z) {
        if (this.lifeCycleTracker != null) {
            return;
        }
        if (z) {
            this.lifeCycleTracker = new ManualAppLifeCycleTracker(application);
        } else {
            this.lifeCycleTracker = new DefaultAppLifeCycleTracker(application);
        }
        this.lifeCycleTracker.registerAppLifeCycleListener(this);
    }

    public void registerAppLifeCycleListener(HSAppLifeCycleListener hSAppLifeCycleListener) {
        synchronized (lock) {
            this.appLifeCycleListeners.add(hSAppLifeCycleListener);
        }
    }

    public void onManualAppForegroundAPI() {
        BaseAppLifeCycleTracker baseAppLifeCycleTracker = this.lifeCycleTracker;
        if (baseAppLifeCycleTracker == null) {
            return;
        }
        baseAppLifeCycleTracker.onManualAppForegroundAPI();
    }

    public void onManualAppBackgroundAPI() {
        BaseAppLifeCycleTracker baseAppLifeCycleTracker = this.lifeCycleTracker;
        if (baseAppLifeCycleTracker == null) {
            return;
        }
        baseAppLifeCycleTracker.onManualAppBackgroundAPI();
    }

    public boolean isAppInForeground() {
        BaseAppLifeCycleTracker baseAppLifeCycleTracker = this.lifeCycleTracker;
        if (baseAppLifeCycleTracker == null) {
            return false;
        }
        return baseAppLifeCycleTracker.isAppInForeground();
    }

    @Override // com.helpshift.applifecycle.HSAppLifeCycleListener
    public void onAppForeground(final Context context) {
        ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.applifecycle.HSAppLifeCycleController.1
            @Override // java.lang.Runnable
            public void run() {
                synchronized (HSAppLifeCycleController.lock) {
                    Iterator it = HSAppLifeCycleController.this.appLifeCycleListeners.iterator();
                    while (it.hasNext()) {
                        ((HSAppLifeCycleListener) it.next()).onAppForeground(context);
                    }
                }
            }
        });
    }

    @Override // com.helpshift.applifecycle.HSAppLifeCycleListener
    public void onAppBackground(final Context context) {
        ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.applifecycle.HSAppLifeCycleController.2
            @Override // java.lang.Runnable
            public void run() {
                synchronized (HSAppLifeCycleController.lock) {
                    Iterator it = HSAppLifeCycleController.this.appLifeCycleListeners.iterator();
                    while (it.hasNext()) {
                        ((HSAppLifeCycleListener) it.next()).onAppBackground(context);
                    }
                }
            }
        });
    }
}
