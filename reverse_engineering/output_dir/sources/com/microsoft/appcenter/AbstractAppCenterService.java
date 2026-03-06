package com.microsoft.appcenter;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import com.microsoft.appcenter.channel.Channel;
import com.microsoft.appcenter.ingestion.models.json.LogFactory;
import com.microsoft.appcenter.utils.AppCenterLog;
import com.microsoft.appcenter.utils.async.AppCenterFuture;
import com.microsoft.appcenter.utils.async.DefaultAppCenterFuture;
import com.microsoft.appcenter.utils.storage.SharedPreferencesManager;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public abstract class AbstractAppCenterService implements AppCenterService {
    private static final String PREFERENCE_KEY_SEPARATOR = "_";
    protected Channel mChannel;
    private AppCenterHandler mHandler;

    protected Channel.GroupListener getChannelListener() {
        return null;
    }

    protected abstract String getGroupName();

    @Override // com.microsoft.appcenter.AppCenterService
    public Map<String, LogFactory> getLogFactories() {
        return null;
    }

    protected abstract String getLoggerTag();

    protected int getTriggerCount() {
        return 50;
    }

    protected long getTriggerInterval() {
        return 3000L;
    }

    protected int getTriggerMaxParallelRequests() {
        return 3;
    }

    @Override // com.microsoft.appcenter.AppCenterService
    public boolean isAppSecretRequired() {
        return true;
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
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
    public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStarted(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(Activity activity) {
    }

    @Override // com.microsoft.appcenter.utils.ApplicationLifecycleListener.ApplicationLifecycleCallbacks
    public void onApplicationEnterBackground() {
    }

    @Override // com.microsoft.appcenter.utils.ApplicationLifecycleListener.ApplicationLifecycleCallbacks
    public void onApplicationEnterForeground() {
    }

    @Override // com.microsoft.appcenter.AppCenterService
    public void onConfigurationUpdated(String appSecret, String transmissionTargetToken) {
    }

    protected synchronized AppCenterFuture<Boolean> isInstanceEnabledAsync() {
        final DefaultAppCenterFuture defaultAppCenterFuture;
        defaultAppCenterFuture = new DefaultAppCenterFuture();
        postAsyncGetter(new Runnable() { // from class: com.microsoft.appcenter.AbstractAppCenterService.1
            @Override // java.lang.Runnable
            public void run() {
                defaultAppCenterFuture.complete(true);
            }
        }, defaultAppCenterFuture, false);
        return defaultAppCenterFuture;
    }

    protected final synchronized AppCenterFuture<Void> setInstanceEnabledAsync(final boolean enabled) {
        final DefaultAppCenterFuture defaultAppCenterFuture;
        defaultAppCenterFuture = new DefaultAppCenterFuture();
        Runnable runnable = new Runnable() { // from class: com.microsoft.appcenter.AbstractAppCenterService.2
            @Override // java.lang.Runnable
            public void run() {
                AppCenterLog.error("AppCenter", "App Center SDK is disabled.");
                defaultAppCenterFuture.complete(null);
            }
        };
        Runnable runnable2 = new Runnable() { // from class: com.microsoft.appcenter.AbstractAppCenterService.3
            @Override // java.lang.Runnable
            public void run() {
                AbstractAppCenterService.this.setInstanceEnabled(enabled);
                defaultAppCenterFuture.complete(null);
            }
        };
        if (!post(runnable2, runnable, runnable2)) {
            defaultAppCenterFuture.complete(null);
        }
        return defaultAppCenterFuture;
    }

    @Override // com.microsoft.appcenter.AppCenterService
    public synchronized boolean isInstanceEnabled() {
        return SharedPreferencesManager.getBoolean(getEnabledPreferenceKey(), true);
    }

    @Override // com.microsoft.appcenter.AppCenterService
    public synchronized void setInstanceEnabled(boolean enabled) {
        if (enabled == isInstanceEnabled()) {
            String loggerTag = getLoggerTag();
            Object[] objArr = new Object[2];
            objArr[0] = getServiceName();
            objArr[1] = enabled ? "enabled" : "disabled";
            AppCenterLog.info(loggerTag, String.format("%s service has already been %s.", objArr));
            return;
        }
        String groupName = getGroupName();
        Channel channel = this.mChannel;
        if (channel != null && groupName != null) {
            if (enabled) {
                channel.addGroup(groupName, getTriggerCount(), getTriggerInterval(), getTriggerMaxParallelRequests(), null, getChannelListener());
            } else {
                channel.clear(groupName);
                this.mChannel.removeGroup(groupName);
            }
        }
        SharedPreferencesManager.putBoolean(getEnabledPreferenceKey(), enabled);
        String loggerTag2 = getLoggerTag();
        Object[] objArr2 = new Object[2];
        objArr2[0] = getServiceName();
        objArr2[1] = enabled ? "enabled" : "disabled";
        AppCenterLog.info(loggerTag2, String.format("%s service has been %s.", objArr2));
        if (isStarted()) {
            applyEnabledState(enabled);
        }
    }

    protected synchronized void applyEnabledState(boolean enabled) {
    }

    @Override // com.microsoft.appcenter.AppCenterService
    public final synchronized void onStarting(AppCenterHandler handler) {
        this.mHandler = handler;
    }

    @Override // com.microsoft.appcenter.AppCenterService
    public synchronized void onStarted(Context context, Channel channel, String appSecret, String transmissionTargetToken, boolean startedFromApp) {
        String groupName = getGroupName();
        boolean zIsInstanceEnabled = isInstanceEnabled();
        if (groupName != null) {
            channel.removeGroup(groupName);
            if (zIsInstanceEnabled) {
                channel.addGroup(groupName, getTriggerCount(), getTriggerInterval(), getTriggerMaxParallelRequests(), null, getChannelListener());
            } else {
                channel.clear(groupName);
            }
        }
        this.mChannel = channel;
        applyEnabledState(zIsInstanceEnabled);
    }

    protected boolean isStarted() {
        return this.mChannel != null;
    }

    protected String getEnabledPreferenceKey() {
        return "enabled_" + getServiceName();
    }

    protected synchronized void post(Runnable runnable) {
        post(runnable, null, null);
    }

    protected synchronized boolean post(final Runnable runnable, final Runnable coreDisabledRunnable, final Runnable serviceDisabledRunnable) {
        AppCenterHandler appCenterHandler = this.mHandler;
        if (appCenterHandler == null) {
            AppCenterLog.error("AppCenter", getServiceName() + " needs to be started before it can be used.");
            return false;
        }
        appCenterHandler.post(new Runnable() { // from class: com.microsoft.appcenter.AbstractAppCenterService.4
            @Override // java.lang.Runnable
            public void run() {
                if (AbstractAppCenterService.this.isInstanceEnabled()) {
                    runnable.run();
                    return;
                }
                Runnable runnable2 = serviceDisabledRunnable;
                if (runnable2 != null) {
                    runnable2.run();
                    return;
                }
                AppCenterLog.info("AppCenter", AbstractAppCenterService.this.getServiceName() + " service disabled, discarding calls.");
            }
        }, coreDisabledRunnable);
        return true;
    }

    protected synchronized <T> void postAsyncGetter(final Runnable runnable, final DefaultAppCenterFuture<T> future, final T valueIfDisabledOrNotStarted) {
        Runnable runnable2 = new Runnable() { // from class: com.microsoft.appcenter.AbstractAppCenterService.5
            @Override // java.lang.Runnable
            public void run() {
                future.complete(valueIfDisabledOrNotStarted);
            }
        };
        if (!post(new Runnable() { // from class: com.microsoft.appcenter.AbstractAppCenterService.6
            @Override // java.lang.Runnable
            public void run() {
                runnable.run();
            }
        }, runnable2, runnable2)) {
            runnable2.run();
        }
    }
}
