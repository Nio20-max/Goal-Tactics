package com.microsoft.appcenter;

import android.app.Application;
import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import com.microsoft.appcenter.channel.Channel;
import com.microsoft.appcenter.channel.DefaultChannel;
import com.microsoft.appcenter.channel.OneCollectorChannelListener;
import com.microsoft.appcenter.http.HttpClient;
import com.microsoft.appcenter.http.HttpUtils;
import com.microsoft.appcenter.ingestion.models.StartServiceLog;
import com.microsoft.appcenter.ingestion.models.WrapperSdk;
import com.microsoft.appcenter.ingestion.models.json.DefaultLogSerializer;
import com.microsoft.appcenter.ingestion.models.json.LogFactory;
import com.microsoft.appcenter.ingestion.models.json.LogSerializer;
import com.microsoft.appcenter.ingestion.models.json.StartServiceLogFactory;
import com.microsoft.appcenter.utils.AppCenterLog;
import com.microsoft.appcenter.utils.ApplicationLifecycleListener;
import com.microsoft.appcenter.utils.DeviceInfoHelper;
import com.microsoft.appcenter.utils.IdHelper;
import com.microsoft.appcenter.utils.InstrumentationRegistryHelper;
import com.microsoft.appcenter.utils.NetworkStateHelper;
import com.microsoft.appcenter.utils.PrefStorageConstants;
import com.microsoft.appcenter.utils.async.AppCenterFuture;
import com.microsoft.appcenter.utils.async.DefaultAppCenterFuture;
import com.microsoft.appcenter.utils.context.SessionContext;
import com.microsoft.appcenter.utils.context.UserIdContext;
import com.microsoft.appcenter.utils.storage.FileManager;
import com.microsoft.appcenter.utils.storage.SharedPreferencesManager;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.logging.Logger;

/* JADX INFO: loaded from: classes2.dex */
public class AppCenter {
    static final String APP_SECRET_KEY = "appsecret";
    static final String CORE_GROUP = "group_core";
    static final long DEFAULT_MAX_STORAGE_SIZE_IN_BYTES = 10485760;
    static final String KEY_VALUE_DELIMITER = "=";
    public static final String LOG_TAG = "AppCenter";
    static final long MINIMUM_STORAGE_SIZE = 24576;
    static final String PAIR_DELIMITER = ";";
    static final String RUNNING_IN_APP_CENTER = "RUNNING_IN_APP_CENTER";
    static final String TRANSMISSION_TARGET_TOKEN_KEY = "target";
    private static final String TRUE_ENVIRONMENT_STRING = "1";
    private static AppCenter sInstance;
    private Boolean mAllowedNetworkRequests;
    private AppCenterHandler mAppCenterHandler;
    private String mAppSecret;
    private Application mApplication;
    private ApplicationLifecycleListener mApplicationLifecycleListener;
    private Channel mChannel;
    private boolean mConfiguredFromApp;
    private Context mContext;
    private Handler mHandler;
    private HandlerThread mHandlerThread;
    private boolean mLogLevelConfigured;
    private LogSerializer mLogSerializer;
    private String mLogUrl;
    private OneCollectorChannelListener mOneCollectorChannelListener;
    private Set<AppCenterService> mServices;
    private Set<AppCenterService> mServicesStartedFromLibrary;
    private DefaultAppCenterFuture<Boolean> mSetMaxStorageSizeFuture;
    private String mTransmissionTargetToken;
    private UncaughtExceptionHandler mUncaughtExceptionHandler;
    private final List<String> mStartedServicesNamesToLog = new ArrayList();
    private long mMaxStorageSizeInBytes = DEFAULT_MAX_STORAGE_SIZE_IN_BYTES;

    public static String getSdkVersion() {
        return "4.4.5";
    }

    public static synchronized AppCenter getInstance() {
        if (sInstance == null) {
            sInstance = new AppCenter();
        }
        return sInstance;
    }

    static synchronized void unsetInstance() {
        sInstance = null;
        NetworkStateHelper.unsetInstance();
    }

    public static void setWrapperSdk(WrapperSdk wrapperSdk) {
        getInstance().setInstanceWrapperSdk(wrapperSdk);
    }

    public static int getLogLevel() {
        return AppCenterLog.getLogLevel();
    }

    public static void setLogLevel(int logLevel) {
        getInstance().setInstanceLogLevel(logLevel);
    }

    public static void setLogUrl(String logUrl) {
        getInstance().setInstanceLogUrl(logUrl);
    }

    public static void setCountryCode(String countryCode) {
        DeviceInfoHelper.setCountryCode(countryCode);
    }

    public static boolean isConfigured() {
        return getInstance().isInstanceConfigured();
    }

    public static boolean isRunningInAppCenterTestCloud() {
        try {
            return "1".equals(InstrumentationRegistryHelper.getArguments().getString(RUNNING_IN_APP_CENTER));
        } catch (IllegalStateException unused) {
            return false;
        }
    }

    public static void configure(Application application, String appSecret) {
        getInstance().configureInstanceWithRequiredAppSecret(application, appSecret);
    }

    public static void configure(Application application) {
        getInstance().configureInstance(application, null, true);
    }

    @SafeVarargs
    public static void start(Class<? extends AppCenterService>... services) {
        getInstance().startServices(true, services);
    }

    @SafeVarargs
    public static void start(Application application, String appSecret, Class<? extends AppCenterService>... services) {
        getInstance().configureAndStartServices(application, appSecret, services);
    }

    @SafeVarargs
    public static void start(Application application, Class<? extends AppCenterService>... services) {
        getInstance().configureAndStartServices(application, null, true, services);
    }

    @SafeVarargs
    public static void startFromLibrary(Context context, Class<? extends AppCenterService>... services) {
        getInstance().startInstanceFromLibrary(context, services);
    }

    public static void setLogger(Logger logger) {
        AppCenterLog.setLogger(logger);
    }

    public static void setNetworkRequestsAllowed(boolean isAllowed) {
        getInstance().setInstanceNetworkRequestsAllowed(isAllowed);
    }

    public static boolean isNetworkRequestsAllowed() {
        return getInstance().isInstanceNetworkRequestsAllowed();
    }

    public static AppCenterFuture<Boolean> isEnabled() {
        return getInstance().isInstanceEnabledAsync();
    }

    public static AppCenterFuture<Void> setEnabled(boolean enabled) {
        return getInstance().setInstanceEnabledAsync(enabled);
    }

    public static AppCenterFuture<UUID> getInstallId() {
        return getInstance().getInstanceInstallIdAsync();
    }

    public static AppCenterFuture<Boolean> setMaxStorageSize(long storageSizeInBytes) {
        return getInstance().setInstanceMaxStorageSizeAsync(storageSizeInBytes);
    }

    private synchronized void setInstanceUserId(String userId) {
        if (!this.mConfiguredFromApp) {
            AppCenterLog.error("AppCenter", "AppCenter must be configured from application, libraries cannot use call setUserId.");
            return;
        }
        String str = this.mAppSecret;
        if (str == null && this.mTransmissionTargetToken == null) {
            AppCenterLog.error("AppCenter", "AppCenter must be configured with a secret from application to call setUserId.");
            return;
        }
        if (userId != null) {
            if (str != null && !UserIdContext.checkUserIdValidForAppCenter(userId)) {
                return;
            }
            if (this.mTransmissionTargetToken != null && !UserIdContext.checkUserIdValidForOneCollector(userId)) {
                return;
            }
        }
        UserIdContext.getInstance().setUserId(userId);
    }

    private synchronized boolean checkPrecondition() {
        if (isInstanceConfigured()) {
            return true;
        }
        AppCenterLog.error("AppCenter", "App Center hasn't been configured. You need to call AppCenter.start with appSecret or AppCenter.configure first.");
        return false;
    }

    private synchronized void setInstanceWrapperSdk(WrapperSdk wrapperSdk) {
        DeviceInfoHelper.setWrapperSdk(wrapperSdk);
        Handler handler = this.mHandler;
        if (handler != null) {
            handler.post(new Runnable() { // from class: com.microsoft.appcenter.AppCenter.1
                @Override // java.lang.Runnable
                public void run() {
                    AppCenter.this.mChannel.invalidateDeviceCache();
                }
            });
        }
    }

    private synchronized void setInstanceLogLevel(int logLevel) {
        this.mLogLevelConfigured = true;
        AppCenterLog.setLogLevel(logLevel);
    }

    private synchronized void setInstanceLogUrl(final String logUrl) {
        this.mLogUrl = logUrl;
        Handler handler = this.mHandler;
        if (handler != null) {
            handler.post(new Runnable() { // from class: com.microsoft.appcenter.AppCenter.2
                @Override // java.lang.Runnable
                public void run() {
                    if (AppCenter.this.mAppSecret != null) {
                        AppCenterLog.info("AppCenter", "The log url of App Center endpoint has been changed to " + logUrl);
                        AppCenter.this.mChannel.setLogUrl(logUrl);
                        return;
                    }
                    AppCenterLog.info("AppCenter", "The log url of One Collector endpoint has been changed to " + logUrl);
                    AppCenter.this.mOneCollectorChannelListener.setLogUrl(logUrl);
                }
            });
        }
    }

    private synchronized void setInstanceNetworkRequestsAllowed(final boolean isAllowed) {
        if (!isConfigured()) {
            this.mAllowedNetworkRequests = Boolean.valueOf(isAllowed);
            return;
        }
        if (isInstanceNetworkRequestsAllowed() == isAllowed) {
            StringBuilder sb = new StringBuilder();
            sb.append("Network requests are already ");
            sb.append(isAllowed ? "allowed" : "forbidden");
            AppCenterLog.info("AppCenter", sb.toString());
            return;
        }
        SharedPreferencesManager.putBoolean(PrefStorageConstants.ALLOWED_NETWORK_REQUEST, isAllowed);
        Channel channel = this.mChannel;
        if (channel != null) {
            channel.setNetworkRequests(isAllowed);
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("Set network requests ");
        sb2.append(isAllowed ? "allowed" : "forbidden");
        AppCenterLog.info("AppCenter", sb2.toString());
    }

    private synchronized boolean isInstanceNetworkRequestsAllowed() {
        Boolean bool = this.mAllowedNetworkRequests;
        boolean zBooleanValue = bool == null ? true : bool.booleanValue();
        if (isConfigured()) {
            return SharedPreferencesManager.getBoolean(PrefStorageConstants.ALLOWED_NETWORK_REQUEST, zBooleanValue);
        }
        return zBooleanValue;
    }

    private synchronized AppCenterFuture<Boolean> setInstanceMaxStorageSizeAsync(long storageSizeInBytes) {
        DefaultAppCenterFuture<Boolean> defaultAppCenterFuture = new DefaultAppCenterFuture<>();
        if (this.mConfiguredFromApp) {
            AppCenterLog.error("AppCenter", "setMaxStorageSize may not be called after App Center has been configured.");
            defaultAppCenterFuture.complete(false);
            return defaultAppCenterFuture;
        }
        if (storageSizeInBytes < MINIMUM_STORAGE_SIZE) {
            AppCenterLog.error("AppCenter", "Maximum storage size must be at least 24576 bytes.");
            defaultAppCenterFuture.complete(false);
            return defaultAppCenterFuture;
        }
        if (this.mSetMaxStorageSizeFuture != null) {
            AppCenterLog.error("AppCenter", "setMaxStorageSize may only be called once per app launch.");
            defaultAppCenterFuture.complete(false);
            return defaultAppCenterFuture;
        }
        this.mMaxStorageSizeInBytes = storageSizeInBytes;
        this.mSetMaxStorageSizeFuture = defaultAppCenterFuture;
        return defaultAppCenterFuture;
    }

    private synchronized boolean isInstanceConfigured() {
        return this.mApplication != null;
    }

    private void configureInstanceWithRequiredAppSecret(Application application, String appSecret) {
        if (appSecret == null || appSecret.isEmpty()) {
            AppCenterLog.error("AppCenter", "appSecret may not be null or empty.");
        } else {
            configureInstance(application, appSecret, true);
        }
    }

    private synchronized boolean configureInstance(Application application, String secretString, final boolean configureFromApp) {
        if (application == null) {
            AppCenterLog.error("AppCenter", "Application context may not be null.");
            return false;
        }
        if (!this.mLogLevelConfigured && (application.getApplicationInfo().flags & 2) == 2) {
            AppCenterLog.setLogLevel(5);
        }
        String str = this.mAppSecret;
        if (configureFromApp && !configureSecretString(secretString)) {
            return false;
        }
        if (this.mHandler != null) {
            String str2 = this.mAppSecret;
            if (str2 != null && !str2.equals(str)) {
                this.mHandler.post(new Runnable() { // from class: com.microsoft.appcenter.AppCenter.3
                    @Override // java.lang.Runnable
                    public void run() {
                        AppCenter.this.mChannel.setAppSecret(AppCenter.this.mAppSecret);
                        AppCenter.this.applyStorageMaxSize();
                    }
                });
            }
            return true;
        }
        this.mApplication = application;
        Context applicationContext = ApplicationContextUtils.getApplicationContext(application);
        this.mContext = applicationContext;
        if (ApplicationContextUtils.isDeviceProtectedStorage(applicationContext)) {
            AppCenterLog.warn("AppCenter", "A user is locked, credential-protected private app data storage is not available.\nApp Center will use device-protected data storage that available without user authentication.\nPlease note that it's a separate storage, all settings and pending logs won't be shared with regular storage.");
        }
        HandlerThread handlerThread = new HandlerThread("AppCenter.Looper");
        this.mHandlerThread = handlerThread;
        handlerThread.start();
        this.mHandler = new Handler(this.mHandlerThread.getLooper());
        this.mAppCenterHandler = new AppCenterHandler() { // from class: com.microsoft.appcenter.AppCenter.4
            @Override // com.microsoft.appcenter.AppCenterHandler
            public void post(Runnable runnable, Runnable disabledRunnable) {
                AppCenter.this.handlerAppCenterOperation(runnable, disabledRunnable);
            }
        };
        ApplicationLifecycleListener applicationLifecycleListener = new ApplicationLifecycleListener(this.mHandler);
        this.mApplicationLifecycleListener = applicationLifecycleListener;
        this.mApplication.registerActivityLifecycleCallbacks(applicationLifecycleListener);
        this.mServices = new HashSet();
        this.mServicesStartedFromLibrary = new HashSet();
        this.mHandler.post(new Runnable() { // from class: com.microsoft.appcenter.AppCenter.5
            @Override // java.lang.Runnable
            public void run() {
                AppCenter.this.finishConfiguration(configureFromApp);
            }
        });
        AppCenterLog.info("AppCenter", "App Center SDK configured successfully.");
        return true;
    }

    private boolean configureSecretString(String secretString) {
        if (this.mConfiguredFromApp) {
            AppCenterLog.warn("AppCenter", "App Center may only be configured once.");
            return false;
        }
        this.mConfiguredFromApp = true;
        if (secretString != null) {
            for (String str : secretString.split(PAIR_DELIMITER)) {
                String[] strArrSplit = str.split("=", -1);
                String str2 = strArrSplit[0];
                if (strArrSplit.length == 1) {
                    if (!str2.isEmpty()) {
                        this.mAppSecret = str2;
                    }
                } else if (!strArrSplit[1].isEmpty()) {
                    String str3 = strArrSplit[1];
                    if (APP_SECRET_KEY.equals(str2)) {
                        this.mAppSecret = str3;
                    } else if ("target".equals(str2)) {
                        this.mTransmissionTargetToken = str3;
                    }
                }
            }
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void handlerAppCenterOperation(final Runnable runnable, final Runnable disabledRunnable) {
        if (checkPrecondition()) {
            Runnable runnable2 = new Runnable() { // from class: com.microsoft.appcenter.AppCenter.6
                @Override // java.lang.Runnable
                public void run() {
                    if (AppCenter.this.isInstanceEnabled()) {
                        runnable.run();
                        return;
                    }
                    Runnable runnable3 = disabledRunnable;
                    if (runnable3 != null) {
                        runnable3.run();
                    } else {
                        AppCenterLog.error("AppCenter", "App Center SDK is disabled.");
                    }
                }
            };
            if (Thread.currentThread() == this.mHandlerThread) {
                runnable.run();
            } else {
                this.mHandler.post(runnable2);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void finishConfiguration(boolean configureFromApp) {
        Constants.loadFromContext(this.mContext);
        FileManager.initialize(this.mContext);
        SharedPreferencesManager.initialize(this.mContext);
        Boolean bool = this.mAllowedNetworkRequests;
        if (bool != null) {
            SharedPreferencesManager.putBoolean(PrefStorageConstants.ALLOWED_NETWORK_REQUEST, bool.booleanValue());
        }
        SessionContext.getInstance();
        boolean zIsInstanceEnabled = isInstanceEnabled();
        HttpClient httpClient = DependencyConfiguration.getHttpClient();
        if (httpClient == null) {
            httpClient = HttpUtils.createHttpClient(this.mContext);
        }
        DefaultLogSerializer defaultLogSerializer = new DefaultLogSerializer();
        this.mLogSerializer = defaultLogSerializer;
        defaultLogSerializer.addLogFactory(StartServiceLog.TYPE, new StartServiceLogFactory());
        DefaultChannel defaultChannel = new DefaultChannel(this.mContext, this.mAppSecret, this.mLogSerializer, httpClient, this.mHandler);
        this.mChannel = defaultChannel;
        if (configureFromApp) {
            applyStorageMaxSize();
        } else {
            defaultChannel.setMaxStorageSize(DEFAULT_MAX_STORAGE_SIZE_IN_BYTES);
        }
        this.mChannel.setEnabled(zIsInstanceEnabled);
        this.mChannel.addGroup(CORE_GROUP, 50, 3000L, 3, null, null);
        this.mOneCollectorChannelListener = new OneCollectorChannelListener(this.mChannel, this.mLogSerializer, httpClient, IdHelper.getInstallId());
        if (this.mLogUrl != null) {
            if (this.mAppSecret != null) {
                AppCenterLog.info("AppCenter", "The log url of App Center endpoint has been changed to " + this.mLogUrl);
                this.mChannel.setLogUrl(this.mLogUrl);
            } else {
                AppCenterLog.info("AppCenter", "The log url of One Collector endpoint has been changed to " + this.mLogUrl);
                this.mOneCollectorChannelListener.setLogUrl(this.mLogUrl);
            }
        }
        this.mChannel.addListener(this.mOneCollectorChannelListener);
        if (!zIsInstanceEnabled) {
            NetworkStateHelper.getSharedInstance(this.mContext).close();
        }
        UncaughtExceptionHandler uncaughtExceptionHandler = new UncaughtExceptionHandler(this.mHandler, this.mChannel);
        this.mUncaughtExceptionHandler = uncaughtExceptionHandler;
        if (zIsInstanceEnabled) {
            uncaughtExceptionHandler.register();
        }
        AppCenterLog.debug("AppCenter", "App Center initialized.");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void applyStorageMaxSize() {
        boolean maxStorageSize = this.mChannel.setMaxStorageSize(this.mMaxStorageSizeInBytes);
        DefaultAppCenterFuture<Boolean> defaultAppCenterFuture = this.mSetMaxStorageSizeFuture;
        if (defaultAppCenterFuture != null) {
            defaultAppCenterFuture.complete(Boolean.valueOf(maxStorageSize));
        }
    }

    @SafeVarargs
    private final synchronized void startServices(final boolean startFromApp, Class<? extends AppCenterService>... services) {
        if (services == null) {
            AppCenterLog.error("AppCenter", "Cannot start services, services array is null. Failed to start services.");
            return;
        }
        if (!isInstanceConfigured()) {
            StringBuilder sb = new StringBuilder();
            for (Class<? extends AppCenterService> cls : services) {
                sb.append("\t");
                sb.append(cls.getName());
                sb.append("\n");
            }
            AppCenterLog.error("AppCenter", "Cannot start services, App Center has not been configured. Failed to start the following services:\n" + ((Object) sb));
            return;
        }
        final ArrayList arrayList = new ArrayList();
        final ArrayList arrayList2 = new ArrayList();
        for (Class<? extends AppCenterService> cls2 : services) {
            if (cls2 == null) {
                AppCenterLog.warn("AppCenter", "Skipping null service, please check your varargs/array does not contain any null reference.");
            } else {
                try {
                    startOrUpdateService((AppCenterService) cls2.getMethod("getInstance", new Class[0]).invoke(null, new Object[0]), arrayList, arrayList2, startFromApp);
                } catch (Exception e) {
                    AppCenterLog.error("AppCenter", "Failed to get service instance '" + cls2.getName() + "', skipping it.", e);
                }
            }
        }
        this.mHandler.post(new Runnable() { // from class: com.microsoft.appcenter.AppCenter.7
            @Override // java.lang.Runnable
            public void run() {
                AppCenter.this.finishStartServices(arrayList2, arrayList, startFromApp);
            }
        });
    }

    private void startOrUpdateService(AppCenterService serviceInstance, Collection<AppCenterService> startedServices, Collection<AppCenterService> updatedServices, boolean startFromApp) {
        if (startFromApp) {
            startOrUpdateServiceFromApp(serviceInstance, startedServices, updatedServices);
        } else {
            if (this.mServices.contains(serviceInstance)) {
                return;
            }
            startServiceFromLibrary(serviceInstance, startedServices);
        }
    }

    private void startOrUpdateServiceFromApp(AppCenterService serviceInstance, Collection<AppCenterService> startedServices, Collection<AppCenterService> updatedServices) {
        String serviceName = serviceInstance.getServiceName();
        if (this.mServices.contains(serviceInstance)) {
            if (this.mServicesStartedFromLibrary.remove(serviceInstance)) {
                updatedServices.add(serviceInstance);
                return;
            }
            AppCenterLog.warn("AppCenter", "App Center has already started the service with class name: " + serviceInstance.getServiceName());
            return;
        }
        if (this.mAppSecret == null && serviceInstance.isAppSecretRequired()) {
            AppCenterLog.error("AppCenter", "App Center was started without app secret, but the service requires it; not starting service " + serviceName + ".");
            return;
        }
        startService(serviceInstance, startedServices);
    }

    private void startServiceFromLibrary(AppCenterService serviceInstance, Collection<AppCenterService> startedServices) {
        String serviceName = serviceInstance.getServiceName();
        if (serviceInstance.isAppSecretRequired()) {
            AppCenterLog.error("AppCenter", "This service cannot be started from a library: " + serviceName + ".");
            return;
        }
        if (startService(serviceInstance, startedServices)) {
            this.mServicesStartedFromLibrary.add(serviceInstance);
        }
    }

    private boolean startService(AppCenterService serviceInstance, Collection<AppCenterService> startedServices) {
        String serviceName = serviceInstance.getServiceName();
        if (ServiceInstrumentationUtils.isServiceDisabledByInstrumentation(serviceName)) {
            AppCenterLog.debug("AppCenter", "Instrumentation variable to disable service has been set; not starting service " + serviceName + ".");
            return false;
        }
        serviceInstance.onStarting(this.mAppCenterHandler);
        this.mApplicationLifecycleListener.registerApplicationLifecycleCallbacks(serviceInstance);
        this.mApplication.registerActivityLifecycleCallbacks(serviceInstance);
        this.mServices.add(serviceInstance);
        startedServices.add(serviceInstance);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void finishStartServices(Iterable<AppCenterService> updatedServices, Iterable<AppCenterService> startedServices, boolean startFromApp) {
        for (AppCenterService appCenterService : updatedServices) {
            appCenterService.onConfigurationUpdated(this.mAppSecret, this.mTransmissionTargetToken);
            AppCenterLog.info("AppCenter", appCenterService.getClass().getSimpleName() + " service configuration updated.");
        }
        boolean zIsInstanceEnabled = isInstanceEnabled();
        for (AppCenterService appCenterService2 : startedServices) {
            Map<String, LogFactory> logFactories = appCenterService2.getLogFactories();
            if (logFactories != null) {
                for (Map.Entry<String, LogFactory> entry : logFactories.entrySet()) {
                    this.mLogSerializer.addLogFactory(entry.getKey(), entry.getValue());
                }
            }
            if (!zIsInstanceEnabled && appCenterService2.isInstanceEnabled()) {
                appCenterService2.setInstanceEnabled(false);
            }
            if (startFromApp) {
                appCenterService2.onStarted(this.mContext, this.mChannel, this.mAppSecret, this.mTransmissionTargetToken, true);
                AppCenterLog.info("AppCenter", appCenterService2.getClass().getSimpleName() + " service started from application.");
            } else {
                appCenterService2.onStarted(this.mContext, this.mChannel, null, null, false);
                AppCenterLog.info("AppCenter", appCenterService2.getClass().getSimpleName() + " service started from library.");
            }
        }
        if (startFromApp) {
            Iterator<AppCenterService> it = updatedServices.iterator();
            while (it.hasNext()) {
                this.mStartedServicesNamesToLog.add(it.next().getServiceName());
            }
            Iterator<AppCenterService> it2 = startedServices.iterator();
            while (it2.hasNext()) {
                this.mStartedServicesNamesToLog.add(it2.next().getServiceName());
            }
            sendStartServiceLog();
        }
    }

    private void sendStartServiceLog() {
        if (this.mStartedServicesNamesToLog.isEmpty() || !isInstanceEnabled()) {
            return;
        }
        ArrayList arrayList = new ArrayList(this.mStartedServicesNamesToLog);
        this.mStartedServicesNamesToLog.clear();
        StartServiceLog startServiceLog = new StartServiceLog();
        startServiceLog.setServices(arrayList);
        startServiceLog.oneCollectorEnabled(Boolean.valueOf(this.mTransmissionTargetToken != null));
        this.mChannel.enqueue(startServiceLog, CORE_GROUP, 1);
    }

    private synchronized void configureAndStartServices(Application application, String appSecret, Class<? extends AppCenterService>[] services) {
        if (appSecret != null) {
            if (appSecret.isEmpty()) {
                AppCenterLog.error("AppCenter", "appSecret may not be null or empty.");
            } else {
                configureAndStartServices(application, appSecret, true, services);
            }
        } else {
            AppCenterLog.error("AppCenter", "appSecret may not be null or empty.");
        }
    }

    private synchronized void startInstanceFromLibrary(Context context, Class<? extends AppCenterService>[] services) {
        Application application;
        if (context != null) {
            try {
                application = (Application) context.getApplicationContext();
            } catch (Throwable th) {
                throw th;
            }
        } else {
            application = null;
        }
        configureAndStartServices(application, null, false, services);
    }

    private void configureAndStartServices(Application application, String appSecret, boolean startFromApp, Class<? extends AppCenterService>[] services) {
        if (configureInstance(application, appSecret, startFromApp)) {
            startServices(startFromApp, services);
        }
    }

    private synchronized AppCenterFuture<Boolean> isInstanceEnabledAsync() {
        final DefaultAppCenterFuture defaultAppCenterFuture;
        defaultAppCenterFuture = new DefaultAppCenterFuture();
        if (checkPrecondition()) {
            this.mAppCenterHandler.post(new Runnable() { // from class: com.microsoft.appcenter.AppCenter.8
                @Override // java.lang.Runnable
                public void run() {
                    defaultAppCenterFuture.complete(true);
                }
            }, new Runnable() { // from class: com.microsoft.appcenter.AppCenter.9
                @Override // java.lang.Runnable
                public void run() {
                    defaultAppCenterFuture.complete(false);
                }
            });
        } else {
            defaultAppCenterFuture.complete(false);
        }
        return defaultAppCenterFuture;
    }

    boolean isInstanceEnabled() {
        return SharedPreferencesManager.getBoolean("enabled", true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setInstanceEnabled(boolean enabled) {
        this.mChannel.setEnabled(enabled);
        boolean zIsInstanceEnabled = isInstanceEnabled();
        boolean z = zIsInstanceEnabled && !enabled;
        boolean z2 = !zIsInstanceEnabled && enabled;
        if (z2) {
            this.mUncaughtExceptionHandler.register();
            NetworkStateHelper.getSharedInstance(this.mContext).reopen();
        } else if (z) {
            this.mUncaughtExceptionHandler.unregister();
            NetworkStateHelper.getSharedInstance(this.mContext).close();
        }
        if (enabled) {
            SharedPreferencesManager.putBoolean("enabled", true);
        }
        if (!this.mStartedServicesNamesToLog.isEmpty() && z2) {
            sendStartServiceLog();
        }
        for (AppCenterService appCenterService : this.mServices) {
            if (appCenterService.isInstanceEnabled() != enabled) {
                appCenterService.setInstanceEnabled(enabled);
            }
        }
        if (!enabled) {
            SharedPreferencesManager.putBoolean("enabled", false);
        }
        if (z) {
            AppCenterLog.info("AppCenter", "App Center has been disabled.");
            return;
        }
        if (z2) {
            AppCenterLog.info("AppCenter", "App Center has been enabled.");
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("App Center has already been ");
        sb.append(enabled ? "enabled" : "disabled");
        sb.append(".");
        AppCenterLog.info("AppCenter", sb.toString());
    }

    private synchronized AppCenterFuture<Void> setInstanceEnabledAsync(final boolean enabled) {
        final DefaultAppCenterFuture defaultAppCenterFuture;
        defaultAppCenterFuture = new DefaultAppCenterFuture();
        if (checkPrecondition()) {
            this.mHandler.post(new Runnable() { // from class: com.microsoft.appcenter.AppCenter.10
                @Override // java.lang.Runnable
                public void run() {
                    AppCenter.this.setInstanceEnabled(enabled);
                    defaultAppCenterFuture.complete(null);
                }
            });
        } else {
            defaultAppCenterFuture.complete(null);
        }
        return defaultAppCenterFuture;
    }

    private synchronized AppCenterFuture<UUID> getInstanceInstallIdAsync() {
        final DefaultAppCenterFuture defaultAppCenterFuture;
        defaultAppCenterFuture = new DefaultAppCenterFuture();
        if (checkPrecondition()) {
            this.mAppCenterHandler.post(new Runnable() { // from class: com.microsoft.appcenter.AppCenter.11
                @Override // java.lang.Runnable
                public void run() {
                    defaultAppCenterFuture.complete(IdHelper.getInstallId());
                }
            }, new Runnable() { // from class: com.microsoft.appcenter.AppCenter.12
                @Override // java.lang.Runnable
                public void run() {
                    defaultAppCenterFuture.complete(null);
                }
            });
        } else {
            defaultAppCenterFuture.complete(null);
        }
        return defaultAppCenterFuture;
    }

    public static void setUserId(String userId) {
        getInstance().setInstanceUserId(userId);
    }

    Set<AppCenterService> getServices() {
        return this.mServices;
    }

    Application getApplication() {
        return this.mApplication;
    }

    void resetApplication() {
        this.mApplication = null;
    }

    AppCenterHandler getAppCenterHandler() {
        return this.mAppCenterHandler;
    }

    UncaughtExceptionHandler getUncaughtExceptionHandler() {
        return this.mUncaughtExceptionHandler;
    }

    public void setChannel(Channel channel) {
        this.mChannel = channel;
    }
}
