package com.helpshift.app;

import android.content.Context;
import com.helpshift.applifecycle.HSAppLifeCycleController;
import com.helpshift.applifecycle.HSAppLifeCycleListener;
import com.helpshift.common.domain.HSThreadFactory;
import java.util.Iterator;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingDeque;

/* JADX INFO: loaded from: classes.dex */
public class CampaignAppLifeCycleListener implements HSAppLifeCycleListener {
    private LinkedBlockingDeque<LifecycleListener> lifecycleListeners = new LinkedBlockingDeque<>();
    private ExecutorService cachedExecutorService = Executors.newCachedThreadPool(new HSThreadFactory("m-lcycle"));

    public void addLifecycleListener(final LifecycleListener lifecycleListener) {
        this.lifecycleListeners.addFirst(lifecycleListener);
        this.cachedExecutorService.execute(new Runnable() { // from class: com.helpshift.app.CampaignAppLifeCycleListener.1
            @Override // java.lang.Runnable
            public void run() {
                if (HSAppLifeCycleController.getInstance().isAppInForeground()) {
                    lifecycleListener.onForeground();
                }
            }
        });
    }

    @Override // com.helpshift.applifecycle.HSAppLifeCycleListener
    public void onAppForeground(Context context) {
        if (this.lifecycleListeners.size() == 0) {
            return;
        }
        this.cachedExecutorService.execute(new Runnable() { // from class: com.helpshift.app.CampaignAppLifeCycleListener.2
            @Override // java.lang.Runnable
            public void run() {
                Iterator it = CampaignAppLifeCycleListener.this.lifecycleListeners.iterator();
                while (it.hasNext()) {
                    ((LifecycleListener) it.next()).onForeground();
                }
            }
        });
    }

    @Override // com.helpshift.applifecycle.HSAppLifeCycleListener
    public void onAppBackground(Context context) {
        if (this.lifecycleListeners.size() == 0) {
            return;
        }
        this.cachedExecutorService.execute(new Runnable() { // from class: com.helpshift.app.CampaignAppLifeCycleListener.3
            @Override // java.lang.Runnable
            public void run() {
                Iterator it = CampaignAppLifeCycleListener.this.lifecycleListeners.iterator();
                while (it.hasNext()) {
                    ((LifecycleListener) it.next()).onBackground();
                }
            }
        });
    }
}
