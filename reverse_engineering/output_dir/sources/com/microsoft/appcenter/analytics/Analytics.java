package com.microsoft.appcenter.analytics;

import android.app.Activity;
import android.content.Context;
import com.microsoft.appcenter.AbstractAppCenterService;
import com.microsoft.appcenter.AppCenter;
import com.microsoft.appcenter.Flags;
import com.microsoft.appcenter.analytics.channel.AnalyticsListener;
import com.microsoft.appcenter.analytics.channel.AnalyticsValidator;
import com.microsoft.appcenter.analytics.channel.SessionTracker;
import com.microsoft.appcenter.analytics.ingestion.models.EventLog;
import com.microsoft.appcenter.analytics.ingestion.models.PageLog;
import com.microsoft.appcenter.analytics.ingestion.models.StartSessionLog;
import com.microsoft.appcenter.analytics.ingestion.models.json.EventLogFactory;
import com.microsoft.appcenter.analytics.ingestion.models.json.PageLogFactory;
import com.microsoft.appcenter.analytics.ingestion.models.json.StartSessionLogFactory;
import com.microsoft.appcenter.analytics.ingestion.models.one.CommonSchemaEventLog;
import com.microsoft.appcenter.analytics.ingestion.models.one.json.CommonSchemaEventLogFactory;
import com.microsoft.appcenter.channel.Channel;
import com.microsoft.appcenter.ingestion.models.Log;
import com.microsoft.appcenter.ingestion.models.json.LogFactory;
import com.microsoft.appcenter.ingestion.models.properties.StringTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.TypedProperty;
import com.microsoft.appcenter.utils.AppCenterLog;
import com.microsoft.appcenter.utils.async.AppCenterFuture;
import com.microsoft.appcenter.utils.async.DefaultAppCenterFuture;
import com.microsoft.appcenter.utils.context.UserIdContext;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes2.dex */
public class Analytics extends AbstractAppCenterService {
    private static final String ACTIVITY_SUFFIX = "Activity";
    static final String ANALYTICS_CRITICAL_GROUP = "group_analytics_critical";
    static final String ANALYTICS_GROUP = "group_analytics";
    public static final String LOG_TAG = "AppCenterAnalytics";
    static final int MAXIMUM_TRANSMISSION_INTERVAL_IN_SECONDS = 86400;
    static final int MINIMUM_TRANSMISSION_INTERVAL_IN_SECONDS = 6;
    private static final String SERVICE_NAME = "Analytics";
    private static Analytics sInstance;
    private AnalyticsListener mAnalyticsListener;
    private Channel.Listener mAnalyticsTransmissionTargetListener;
    private AnalyticsValidator mAnalyticsValidator;
    private Context mContext;
    private WeakReference<Activity> mCurrentActivity;
    AnalyticsTransmissionTarget mDefaultTransmissionTarget;
    private final Map<String, LogFactory> mFactories;
    private SessionTracker mSessionTracker;
    private boolean mStartedFromApp;
    private long mTransmissionInterval;
    private final Map<String, AnalyticsTransmissionTarget> mTransmissionTargets;
    private boolean mAutoPageTrackingEnabled = false;
    private boolean isManualSessionTrackerEnabled = false;

    @Override // com.microsoft.appcenter.AbstractAppCenterService
    protected String getGroupName() {
        return ANALYTICS_GROUP;
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService
    protected String getLoggerTag() {
        return LOG_TAG;
    }

    @Override // com.microsoft.appcenter.AppCenterService
    public String getServiceName() {
        return SERVICE_NAME;
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService, com.microsoft.appcenter.AppCenterService
    public boolean isAppSecretRequired() {
        return false;
    }

    private Analytics() {
        HashMap map = new HashMap();
        this.mFactories = map;
        map.put(StartSessionLog.TYPE, new StartSessionLogFactory());
        map.put(PageLog.TYPE, new PageLogFactory());
        map.put("event", new EventLogFactory());
        map.put(CommonSchemaEventLog.TYPE, new CommonSchemaEventLogFactory());
        this.mTransmissionTargets = new HashMap();
        this.mTransmissionInterval = TimeUnit.SECONDS.toMillis(6L);
    }

    public static synchronized Analytics getInstance() {
        if (sInstance == null) {
            sInstance = new Analytics();
        }
        return sInstance;
    }

    static synchronized void unsetInstance() {
        sInstance = null;
    }

    public static AppCenterFuture<Boolean> isEnabled() {
        return getInstance().isInstanceEnabledAsync();
    }

    public static AppCenterFuture<Void> setEnabled(boolean enabled) {
        return getInstance().setInstanceEnabledAsync(enabled);
    }

    public static boolean setTransmissionInterval(int seconds) {
        return getInstance().setInstanceTransmissionInterval(seconds);
    }

    public static void pause() {
        getInstance().pauseInstanceAsync();
    }

    public static void resume() {
        getInstance().resumeInstanceAsync();
    }

    protected static void setListener(AnalyticsListener listener) {
        getInstance().setInstanceListener(listener);
    }

    protected static boolean isAutoPageTrackingEnabled() {
        return getInstance().isInstanceAutoPageTrackingEnabled();
    }

    protected static void setAutoPageTrackingEnabled(boolean autoPageTrackingEnabled) {
        getInstance().setInstanceAutoPageTrackingEnabled(autoPageTrackingEnabled);
    }

    protected static void trackPage(String name) {
        trackPage(name, null);
    }

    protected static void trackPage(String name, Map<String, String> properties) {
        getInstance().trackPageAsync(name, properties);
    }

    public static void trackEvent(String name) {
        trackEvent(name, null, null, 1);
    }

    public static void trackEvent(String name, Map<String, String> properties) {
        getInstance().trackEventAsync(name, convertProperties(properties), null, 1);
    }

    public static void enableManualSessionTracker() {
        getInstance().enableManualSessionTrackerAsync();
    }

    public static void startSession() {
        getInstance().startSessionAsync();
    }

    public static void trackEvent(String name, Map<String, String> properties, int flags) {
        getInstance().trackEventAsync(name, convertProperties(properties), null, flags);
    }

    public static void trackEvent(String name, EventProperties properties) {
        trackEvent(name, properties, 1);
    }

    public static void trackEvent(String name, EventProperties properties, int flags) {
        trackEvent(name, properties, null, flags);
    }

    static void trackEvent(String name, EventProperties properties, AnalyticsTransmissionTarget transmissionTarget, int flags) {
        getInstance().trackEventAsync(name, convertProperties(properties), transmissionTarget, flags);
    }

    private static List<TypedProperty> convertProperties(EventProperties properties) {
        if (properties == null) {
            return null;
        }
        return new ArrayList(properties.getProperties().values());
    }

    private static List<TypedProperty> convertProperties(Map<String, String> properties) {
        if (properties == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(properties.size());
        for (Map.Entry<String, String> entry : properties.entrySet()) {
            StringTypedProperty stringTypedProperty = new StringTypedProperty();
            stringTypedProperty.setName(entry.getKey());
            stringTypedProperty.setValue(entry.getValue());
            arrayList.add(stringTypedProperty);
        }
        return arrayList;
    }

    public static AnalyticsTransmissionTarget getTransmissionTarget(String transmissionTargetToken) {
        return getInstance().getInstanceTransmissionTarget(transmissionTargetToken);
    }

    private static String generatePageName(Class<?> activityClass) {
        String simpleName = activityClass.getSimpleName();
        return (!simpleName.endsWith(ACTIVITY_SUFFIX) || simpleName.length() <= 8) ? simpleName : simpleName.substring(0, simpleName.length() - 8);
    }

    private synchronized AnalyticsTransmissionTarget getInstanceTransmissionTarget(String transmissionTargetToken) {
        if (transmissionTargetToken != null) {
            if (!transmissionTargetToken.isEmpty()) {
                if (!AppCenter.isConfigured()) {
                    AppCenterLog.error(LOG_TAG, "Cannot create transmission target, AppCenter is not configured or started.");
                    return null;
                }
                AnalyticsTransmissionTarget analyticsTransmissionTarget = this.mTransmissionTargets.get(transmissionTargetToken);
                if (analyticsTransmissionTarget != null) {
                    AppCenterLog.debug(LOG_TAG, "Returning transmission target found with token " + transmissionTargetToken);
                    return analyticsTransmissionTarget;
                }
                AnalyticsTransmissionTarget analyticsTransmissionTargetCreateAnalyticsTransmissionTarget = createAnalyticsTransmissionTarget(transmissionTargetToken);
                this.mTransmissionTargets.put(transmissionTargetToken, analyticsTransmissionTargetCreateAnalyticsTransmissionTarget);
                return analyticsTransmissionTargetCreateAnalyticsTransmissionTarget;
            }
        }
        AppCenterLog.error(LOG_TAG, "Transmission target token may not be null or empty.");
        return null;
    }

    private AnalyticsTransmissionTarget createAnalyticsTransmissionTarget(String transmissionTargetToken) {
        final AnalyticsTransmissionTarget analyticsTransmissionTarget = new AnalyticsTransmissionTarget(transmissionTargetToken, null);
        AppCenterLog.debug(LOG_TAG, "Created transmission target with token " + transmissionTargetToken);
        postCommandEvenIfDisabled(new Runnable() { // from class: com.microsoft.appcenter.analytics.Analytics.1
            @Override // java.lang.Runnable
            public void run() {
                analyticsTransmissionTarget.initInBackground(Analytics.this.mContext, Analytics.this.mChannel);
            }
        });
        return analyticsTransmissionTarget;
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService, com.microsoft.appcenter.AppCenterService
    public Map<String, LogFactory> getLogFactories() {
        return this.mFactories;
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService, android.app.Application.ActivityLifecycleCallbacks
    public synchronized void onActivityResumed(final Activity activity) {
        final Runnable runnable = new Runnable() { // from class: com.microsoft.appcenter.analytics.Analytics.2
            @Override // java.lang.Runnable
            public void run() {
                Analytics.this.mCurrentActivity = new WeakReference(activity);
            }
        };
        post(new Runnable() { // from class: com.microsoft.appcenter.analytics.Analytics.3
            @Override // java.lang.Runnable
            public void run() {
                runnable.run();
                Analytics.this.processOnResume(activity);
            }
        }, runnable, runnable);
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService
    protected long getTriggerInterval() {
        return this.mTransmissionInterval;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void processOnResume(Activity activity) {
        SessionTracker sessionTracker = this.mSessionTracker;
        if (sessionTracker != null) {
            sessionTracker.onActivityResumed();
            if (this.mAutoPageTrackingEnabled) {
                queuePage(generatePageName(activity.getClass()), null);
            }
        }
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService, android.app.Application.ActivityLifecycleCallbacks
    public synchronized void onActivityPaused(Activity activity) {
        final Runnable runnable = new Runnable() { // from class: com.microsoft.appcenter.analytics.Analytics.4
            @Override // java.lang.Runnable
            public void run() {
                Analytics.this.mCurrentActivity = null;
            }
        };
        post(new Runnable() { // from class: com.microsoft.appcenter.analytics.Analytics.5
            @Override // java.lang.Runnable
            public void run() {
                runnable.run();
                if (Analytics.this.mSessionTracker != null) {
                    Analytics.this.mSessionTracker.onActivityPaused();
                }
            }
        }, runnable, runnable);
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService
    protected Channel.GroupListener getChannelListener() {
        return new Channel.GroupListener() { // from class: com.microsoft.appcenter.analytics.Analytics.6
            @Override // com.microsoft.appcenter.channel.Channel.GroupListener
            public void onBeforeSending(Log log) {
                if (Analytics.this.mAnalyticsListener != null) {
                    Analytics.this.mAnalyticsListener.onBeforeSending(log);
                }
            }

            @Override // com.microsoft.appcenter.channel.Channel.GroupListener
            public void onSuccess(Log log) {
                if (Analytics.this.mAnalyticsListener != null) {
                    Analytics.this.mAnalyticsListener.onSendingSucceeded(log);
                }
            }

            @Override // com.microsoft.appcenter.channel.Channel.GroupListener
            public void onFailure(Log log, Exception e) {
                if (Analytics.this.mAnalyticsListener != null) {
                    Analytics.this.mAnalyticsListener.onSendingFailed(log, e);
                }
            }
        };
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService
    protected synchronized void applyEnabledState(boolean enabled) {
        if (enabled) {
            this.mChannel.addGroup(ANALYTICS_CRITICAL_GROUP, getTriggerCount(), 3000L, getTriggerMaxParallelRequests(), null, getChannelListener());
            startAppLevelFeatures();
        } else {
            this.mChannel.removeGroup(ANALYTICS_CRITICAL_GROUP);
            if (this.mAnalyticsValidator != null) {
                this.mChannel.removeListener(this.mAnalyticsValidator);
                this.mAnalyticsValidator = null;
            }
            if (this.mSessionTracker != null) {
                this.mChannel.removeListener(this.mSessionTracker);
                this.mSessionTracker.clearSessions();
                this.mSessionTracker = null;
            }
            if (this.mAnalyticsTransmissionTargetListener != null) {
                this.mChannel.removeListener(this.mAnalyticsTransmissionTargetListener);
                this.mAnalyticsTransmissionTargetListener = null;
            }
        }
    }

    private void startAppLevelFeatures() {
        Activity activity;
        if (this.mStartedFromApp) {
            this.mAnalyticsValidator = new AnalyticsValidator();
            this.mChannel.addListener(this.mAnalyticsValidator);
            SessionTracker sessionTracker = new SessionTracker(this.mChannel, ANALYTICS_GROUP);
            this.mSessionTracker = sessionTracker;
            if (this.isManualSessionTrackerEnabled) {
                sessionTracker.enableManualSessionTracker();
            }
            this.mChannel.addListener(this.mSessionTracker);
            WeakReference<Activity> weakReference = this.mCurrentActivity;
            if (weakReference != null && (activity = weakReference.get()) != null) {
                processOnResume(activity);
            }
            this.mAnalyticsTransmissionTargetListener = AnalyticsTransmissionTarget.getChannelListener();
            this.mChannel.addListener(this.mAnalyticsTransmissionTargetListener);
        }
    }

    private synchronized void trackPageAsync(final String name, final Map<String, String> properties) {
        final HashMap map;
        if (properties != null) {
            try {
                map = new HashMap(properties);
            } catch (Throwable th) {
                throw th;
            }
        } else {
            map = null;
        }
        post(new Runnable() { // from class: com.microsoft.appcenter.analytics.Analytics.7
            @Override // java.lang.Runnable
            public void run() {
                if (Analytics.this.mStartedFromApp) {
                    Analytics.this.queuePage(name, map);
                } else {
                    AppCenterLog.error(Analytics.LOG_TAG, "Cannot track page if not started from app.");
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void queuePage(String name, Map<String, String> properties) {
        PageLog pageLog = new PageLog();
        pageLog.setName(name);
        pageLog.setProperties(properties);
        this.mChannel.enqueue(pageLog, ANALYTICS_GROUP, 1);
    }

    private synchronized void enableManualSessionTrackerAsync() {
        if (isStarted()) {
            AppCenterLog.debug("AppCenter", "The manual session tracker state should be set before the App Center start.");
        } else {
            this.isManualSessionTrackerEnabled = true;
        }
    }

    private synchronized void startSessionAsync() {
        SessionTracker sessionTracker = this.mSessionTracker;
        if (sessionTracker == null) {
            AppCenterLog.debug("AppCenter", "Start session should be called after the Analytics start.");
        } else {
            sessionTracker.startSession();
        }
    }

    private synchronized void trackEventAsync(final String name, final List<TypedProperty> properties, final AnalyticsTransmissionTarget transmissionTarget, final int flags) {
        final String userId = UserIdContext.getInstance().getUserId();
        post(new Runnable() { // from class: com.microsoft.appcenter.analytics.Analytics.8
            @Override // java.lang.Runnable
            public void run() {
                AnalyticsTransmissionTarget analyticsTransmissionTarget = transmissionTarget;
                if (analyticsTransmissionTarget == null) {
                    analyticsTransmissionTarget = Analytics.this.mDefaultTransmissionTarget;
                }
                EventLog eventLog = new EventLog();
                if (analyticsTransmissionTarget == null) {
                    if (!Analytics.this.mStartedFromApp) {
                        AppCenterLog.error(Analytics.LOG_TAG, "Cannot track event using Analytics.trackEvent if not started from app, please start from the application or use Analytics.getTransmissionTarget.");
                        return;
                    }
                } else if (analyticsTransmissionTarget.isEnabled()) {
                    eventLog.addTransmissionTarget(analyticsTransmissionTarget.getTransmissionTargetToken());
                    eventLog.setTag(analyticsTransmissionTarget);
                    if (analyticsTransmissionTarget == Analytics.this.mDefaultTransmissionTarget) {
                        eventLog.setUserId(userId);
                    }
                } else {
                    AppCenterLog.error(Analytics.LOG_TAG, "This transmission target is disabled.");
                    return;
                }
                eventLog.setId(UUID.randomUUID());
                eventLog.setName(name);
                eventLog.setTypedProperties(properties);
                int persistenceFlag = Flags.getPersistenceFlag(flags, true);
                Analytics.this.mChannel.enqueue(eventLog, persistenceFlag == 2 ? Analytics.ANALYTICS_CRITICAL_GROUP : Analytics.ANALYTICS_GROUP, persistenceFlag);
            }
        });
    }

    private boolean isInstanceAutoPageTrackingEnabled() {
        return this.mAutoPageTrackingEnabled;
    }

    private synchronized void setInstanceAutoPageTrackingEnabled(boolean autoPageTrackingEnabled) {
        this.mAutoPageTrackingEnabled = autoPageTrackingEnabled;
    }

    private synchronized void setInstanceListener(AnalyticsListener listener) {
        this.mAnalyticsListener = listener;
    }

    private synchronized void pauseInstanceAsync() {
        post(new Runnable() { // from class: com.microsoft.appcenter.analytics.Analytics.9
            @Override // java.lang.Runnable
            public void run() {
                Analytics.this.mChannel.pauseGroup(Analytics.ANALYTICS_GROUP, null);
                Analytics.this.mChannel.pauseGroup(Analytics.ANALYTICS_CRITICAL_GROUP, null);
            }
        });
    }

    private synchronized void resumeInstanceAsync() {
        post(new Runnable() { // from class: com.microsoft.appcenter.analytics.Analytics.10
            @Override // java.lang.Runnable
            public void run() {
                Analytics.this.mChannel.resumeGroup(Analytics.ANALYTICS_GROUP, null);
                Analytics.this.mChannel.resumeGroup(Analytics.ANALYTICS_CRITICAL_GROUP, null);
            }
        });
    }

    WeakReference<Activity> getCurrentActivity() {
        return this.mCurrentActivity;
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService, com.microsoft.appcenter.AppCenterService
    public synchronized void onStarted(Context context, Channel channel, String appSecret, String transmissionTargetToken, boolean startedFromApp) {
        this.mContext = context;
        this.mStartedFromApp = startedFromApp;
        super.onStarted(context, channel, appSecret, transmissionTargetToken, startedFromApp);
        setDefaultTransmissionTarget(transmissionTargetToken);
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService, com.microsoft.appcenter.AppCenterService
    public void onConfigurationUpdated(String appSecret, String transmissionTargetToken) {
        this.mStartedFromApp = true;
        startAppLevelFeatures();
        setDefaultTransmissionTarget(transmissionTargetToken);
    }

    private void setDefaultTransmissionTarget(String transmissionTargetToken) {
        if (transmissionTargetToken != null) {
            this.mDefaultTransmissionTarget = createAnalyticsTransmissionTarget(transmissionTargetToken);
        }
    }

    private boolean setInstanceTransmissionInterval(int seconds) {
        if (isStarted()) {
            AppCenterLog.error(LOG_TAG, "Transmission interval should be set before the service is started.");
            return false;
        }
        if (seconds < 6 || seconds > MAXIMUM_TRANSMISSION_INTERVAL_IN_SECONDS) {
            AppCenterLog.error(LOG_TAG, String.format(Locale.ENGLISH, "The transmission interval is invalid. The value should be between %d seconds and %d seconds (%d day).", 6, Integer.valueOf(MAXIMUM_TRANSMISSION_INTERVAL_IN_SECONDS), Long.valueOf(TimeUnit.SECONDS.toDays(86400L))));
            return false;
        }
        this.mTransmissionInterval = TimeUnit.SECONDS.toMillis(seconds);
        return true;
    }

    <T> void postCommand(Runnable runnable, DefaultAppCenterFuture<T> future, T valueIfDisabledOrNotStarted) {
        postAsyncGetter(runnable, future, valueIfDisabledOrNotStarted);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.microsoft.appcenter.AbstractAppCenterService
    public synchronized void post(Runnable runnable) {
        super.post(runnable);
    }

    void postCommandEvenIfDisabled(Runnable runnable) {
        post(runnable, runnable, runnable);
    }

    String getEnabledPreferenceKeyPrefix() {
        return getEnabledPreferenceKey() + "/";
    }
}
