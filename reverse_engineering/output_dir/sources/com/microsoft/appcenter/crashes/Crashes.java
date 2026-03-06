package com.microsoft.appcenter.crashes;

import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.res.Configuration;
import com.helpshift.util.AttachmentConstants;
import com.microsoft.appcenter.AbstractAppCenterService;
import com.microsoft.appcenter.Constants;
import com.microsoft.appcenter.channel.Channel;
import com.microsoft.appcenter.crashes.ingestion.models.ErrorAttachmentLog;
import com.microsoft.appcenter.crashes.ingestion.models.Exception;
import com.microsoft.appcenter.crashes.ingestion.models.HandledErrorLog;
import com.microsoft.appcenter.crashes.ingestion.models.ManagedErrorLog;
import com.microsoft.appcenter.crashes.ingestion.models.StackFrame;
import com.microsoft.appcenter.crashes.ingestion.models.json.ErrorAttachmentLogFactory;
import com.microsoft.appcenter.crashes.ingestion.models.json.HandledErrorLogFactory;
import com.microsoft.appcenter.crashes.ingestion.models.json.ManagedErrorLogFactory;
import com.microsoft.appcenter.crashes.model.ErrorReport;
import com.microsoft.appcenter.crashes.model.NativeException;
import com.microsoft.appcenter.crashes.model.TestCrashException;
import com.microsoft.appcenter.crashes.utils.ErrorLogHelper;
import com.microsoft.appcenter.ingestion.models.Device;
import com.microsoft.appcenter.ingestion.models.Log;
import com.microsoft.appcenter.ingestion.models.json.DefaultLogSerializer;
import com.microsoft.appcenter.ingestion.models.json.LogFactory;
import com.microsoft.appcenter.ingestion.models.json.LogSerializer;
import com.microsoft.appcenter.utils.AppCenterLog;
import com.microsoft.appcenter.utils.DeviceInfoHelper;
import com.microsoft.appcenter.utils.HandlerUtils;
import com.microsoft.appcenter.utils.async.AppCenterFuture;
import com.microsoft.appcenter.utils.async.DefaultAppCenterFuture;
import com.microsoft.appcenter.utils.context.SessionContext;
import com.microsoft.appcenter.utils.context.UserIdContext;
import com.microsoft.appcenter.utils.storage.FileManager;
import com.microsoft.appcenter.utils.storage.SharedPreferencesManager;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import org.json.JSONException;

/* JADX INFO: loaded from: classes2.dex */
public class Crashes extends AbstractAppCenterService {
    public static final int ALWAYS_SEND = 2;
    public static final int DONT_SEND = 1;
    static final String ERROR_GROUP = "groupErrors";
    public static final String LOG_TAG = "AppCenterCrashes";
    private static final int MAX_ATTACHMENT_SIZE = 7340032;
    static final String MINIDUMP_FILE = "minidump";
    public static final String PREF_KEY_ALWAYS_SEND = "com.microsoft.appcenter.crashes.always.send";
    static final String PREF_KEY_MEMORY_RUNNING_LEVEL = "com.microsoft.appcenter.crashes.memory";
    public static final int SEND = 0;
    private static final String SERVICE_NAME = "Crashes";
    private boolean mAutomaticProcessing = true;
    private Context mContext;
    private CrashesListener mCrashesListener;
    private Device mDevice;
    private final Map<UUID, ErrorLogReport> mErrorReportCache;
    private final Map<String, LogFactory> mFactories;
    private boolean mHasReceivedMemoryWarningInLastSession;
    private long mInitializeTimestamp;
    private ErrorReport mLastSessionErrorReport;
    private LogSerializer mLogSerializer;
    private ComponentCallbacks2 mMemoryWarningListener;
    private boolean mSavedUncaughtException;
    private UncaughtExceptionHandler mUncaughtExceptionHandler;
    private final Map<UUID, ErrorLogReport> mUnprocessedErrorReports;
    private static final CrashesListener DEFAULT_ERROR_REPORTING_LISTENER = new DefaultCrashesListener();
    private static Crashes sInstance = null;

    private interface CallbackProcessor {
        void onCallBack(ErrorReport report);
    }

    private interface ExceptionModelBuilder {
        Exception buildExceptionModel();
    }

    private static boolean isMemoryRunningLevelWasReceived(int memoryLevel) {
        return memoryLevel == 5 || memoryLevel == 10 || memoryLevel == 15 || memoryLevel == 80;
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService
    protected String getGroupName() {
        return ERROR_GROUP;
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService
    protected String getLoggerTag() {
        return LOG_TAG;
    }

    @Override // com.microsoft.appcenter.AppCenterService
    public String getServiceName() {
        return SERVICE_NAME;
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService
    protected int getTriggerCount() {
        return 1;
    }

    private Crashes() {
        HashMap map = new HashMap();
        this.mFactories = map;
        map.put(ManagedErrorLog.TYPE, ManagedErrorLogFactory.getInstance());
        map.put(HandledErrorLog.TYPE, HandledErrorLogFactory.getInstance());
        map.put(ErrorAttachmentLog.TYPE, ErrorAttachmentLogFactory.getInstance());
        DefaultLogSerializer defaultLogSerializer = new DefaultLogSerializer();
        this.mLogSerializer = defaultLogSerializer;
        defaultLogSerializer.addLogFactory(ManagedErrorLog.TYPE, ManagedErrorLogFactory.getInstance());
        this.mLogSerializer.addLogFactory(ErrorAttachmentLog.TYPE, ErrorAttachmentLogFactory.getInstance());
        this.mCrashesListener = DEFAULT_ERROR_REPORTING_LISTENER;
        this.mUnprocessedErrorReports = new LinkedHashMap();
        this.mErrorReportCache = new LinkedHashMap();
    }

    public static synchronized Crashes getInstance() {
        if (sInstance == null) {
            sInstance = new Crashes();
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

    public static void trackError(Throwable throwable) {
        trackError(throwable, null, null);
    }

    public static void trackError(Throwable throwable, Map<String, String> properties, Iterable<ErrorAttachmentLog> attachments) {
        getInstance().queueException(throwable, properties, attachments);
    }

    public static void generateTestCrash() {
        if (Constants.APPLICATION_DEBUGGABLE) {
            throw new TestCrashException();
        }
        AppCenterLog.warn(LOG_TAG, "The application is not debuggable so SDK won't generate test crash");
    }

    public static void setListener(CrashesListener listener) {
        getInstance().setInstanceListener(listener);
    }

    public static AppCenterFuture<String> getMinidumpDirectory() {
        return getInstance().getNewMinidumpDirectoryAsync();
    }

    public static void notifyUserConfirmation(int userConfirmation) {
        getInstance().handleUserConfirmation(userConfirmation);
    }

    public static AppCenterFuture<Boolean> hasCrashedInLastSession() {
        return getInstance().hasInstanceCrashedInLastSession();
    }

    public static AppCenterFuture<ErrorReport> getLastSessionCrashReport() {
        return getInstance().getInstanceLastSessionCrashReport();
    }

    public static AppCenterFuture<Boolean> hasReceivedMemoryWarningInLastSession() {
        return getInstance().hasInstanceReceivedMemoryWarningInLastSession();
    }

    private synchronized AppCenterFuture<String> getNewMinidumpDirectoryAsync() {
        final DefaultAppCenterFuture defaultAppCenterFuture;
        defaultAppCenterFuture = new DefaultAppCenterFuture();
        postAsyncGetter(new Runnable() { // from class: com.microsoft.appcenter.crashes.Crashes.1
            @Override // java.lang.Runnable
            public void run() {
                defaultAppCenterFuture.complete(ErrorLogHelper.getNewMinidumpSubfolderWithContextData(Crashes.this.mContext).getAbsolutePath());
            }
        }, defaultAppCenterFuture, null);
        return defaultAppCenterFuture;
    }

    private synchronized AppCenterFuture<Boolean> hasInstanceCrashedInLastSession() {
        final DefaultAppCenterFuture defaultAppCenterFuture;
        defaultAppCenterFuture = new DefaultAppCenterFuture();
        postAsyncGetter(new Runnable() { // from class: com.microsoft.appcenter.crashes.Crashes.2
            @Override // java.lang.Runnable
            public void run() {
                defaultAppCenterFuture.complete(Boolean.valueOf(Crashes.this.mLastSessionErrorReport != null));
            }
        }, defaultAppCenterFuture, false);
        return defaultAppCenterFuture;
    }

    private synchronized AppCenterFuture<Boolean> hasInstanceReceivedMemoryWarningInLastSession() {
        final DefaultAppCenterFuture defaultAppCenterFuture;
        defaultAppCenterFuture = new DefaultAppCenterFuture();
        postAsyncGetter(new Runnable() { // from class: com.microsoft.appcenter.crashes.Crashes.3
            @Override // java.lang.Runnable
            public void run() {
                defaultAppCenterFuture.complete(Boolean.valueOf(Crashes.this.mHasReceivedMemoryWarningInLastSession));
            }
        }, defaultAppCenterFuture, false);
        return defaultAppCenterFuture;
    }

    private synchronized AppCenterFuture<ErrorReport> getInstanceLastSessionCrashReport() {
        final DefaultAppCenterFuture defaultAppCenterFuture;
        defaultAppCenterFuture = new DefaultAppCenterFuture();
        postAsyncGetter(new Runnable() { // from class: com.microsoft.appcenter.crashes.Crashes.4
            @Override // java.lang.Runnable
            public void run() {
                defaultAppCenterFuture.complete(Crashes.this.mLastSessionErrorReport);
            }
        }, defaultAppCenterFuture, null);
        return defaultAppCenterFuture;
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService
    protected synchronized void applyEnabledState(boolean enabled) {
        initialize();
        if (enabled) {
            ComponentCallbacks2 componentCallbacks2 = new ComponentCallbacks2() { // from class: com.microsoft.appcenter.crashes.Crashes.5
                @Override // android.content.ComponentCallbacks
                public void onConfigurationChanged(Configuration newConfig) {
                }

                @Override // android.content.ComponentCallbacks2
                public void onTrimMemory(int level) {
                    Crashes.saveMemoryRunningLevel(level);
                }

                @Override // android.content.ComponentCallbacks
                public void onLowMemory() {
                    Crashes.saveMemoryRunningLevel(80);
                }
            };
            this.mMemoryWarningListener = componentCallbacks2;
            this.mContext.registerComponentCallbacks(componentCallbacks2);
        } else {
            File[] fileArrListFiles = ErrorLogHelper.getErrorStorageDirectory().listFiles();
            if (fileArrListFiles != null) {
                for (File file : fileArrListFiles) {
                    AppCenterLog.debug(LOG_TAG, "Deleting file " + file);
                    if (!file.delete()) {
                        AppCenterLog.warn(LOG_TAG, "Failed to delete file " + file);
                    }
                }
            }
            AppCenterLog.info(LOG_TAG, "Deleted crashes local files");
            this.mErrorReportCache.clear();
            this.mLastSessionErrorReport = null;
            this.mContext.unregisterComponentCallbacks(this.mMemoryWarningListener);
            this.mMemoryWarningListener = null;
            SharedPreferencesManager.remove(PREF_KEY_MEMORY_RUNNING_LEVEL);
        }
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService, com.microsoft.appcenter.AppCenterService
    public synchronized void onStarted(Context context, Channel channel, String appSecret, String transmissionTargetToken, boolean startedFromApp) {
        this.mContext = context;
        if (!isInstanceEnabled()) {
            ErrorLogHelper.removeMinidumpFolder();
            AppCenterLog.debug(LOG_TAG, "Clean up minidump folder.");
        }
        super.onStarted(context, channel, appSecret, transmissionTargetToken, startedFromApp);
        if (isInstanceEnabled()) {
            processPendingErrors();
            if (this.mErrorReportCache.isEmpty()) {
                ErrorLogHelper.removeLostThrowableFiles();
            }
        }
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService, com.microsoft.appcenter.AppCenterService
    public Map<String, LogFactory> getLogFactories() {
        return this.mFactories;
    }

    @Override // com.microsoft.appcenter.AbstractAppCenterService
    protected Channel.GroupListener getChannelListener() {
        return new Channel.GroupListener() { // from class: com.microsoft.appcenter.crashes.Crashes.6
            private void processCallback(final Log log, final CallbackProcessor callbackProcessor) {
                Crashes.this.post(new Runnable() { // from class: com.microsoft.appcenter.crashes.Crashes.6.1
                    @Override // java.lang.Runnable
                    public void run() {
                        Log log2 = log;
                        if (log2 instanceof ManagedErrorLog) {
                            ManagedErrorLog managedErrorLog = (ManagedErrorLog) log2;
                            final ErrorReport errorReportBuildErrorReport = Crashes.this.buildErrorReport(managedErrorLog);
                            UUID id = managedErrorLog.getId();
                            if (errorReportBuildErrorReport != null) {
                                HandlerUtils.runOnUiThread(new Runnable() { // from class: com.microsoft.appcenter.crashes.Crashes.6.1.1
                                    @Override // java.lang.Runnable
                                    public void run() {
                                        callbackProcessor.onCallBack(errorReportBuildErrorReport);
                                    }
                                });
                                return;
                            }
                            AppCenterLog.warn(Crashes.LOG_TAG, "Cannot find crash report for the error log: " + id);
                            return;
                        }
                        if ((log2 instanceof ErrorAttachmentLog) || (log2 instanceof HandledErrorLog)) {
                            return;
                        }
                        AppCenterLog.warn(Crashes.LOG_TAG, "A different type of log comes to crashes: " + log.getClass().getName());
                    }
                });
            }

            @Override // com.microsoft.appcenter.channel.Channel.GroupListener
            public void onBeforeSending(Log log) {
                processCallback(log, new CallbackProcessor() { // from class: com.microsoft.appcenter.crashes.Crashes.6.2
                    @Override // com.microsoft.appcenter.crashes.Crashes.CallbackProcessor
                    public void onCallBack(ErrorReport report) {
                        Crashes.this.mCrashesListener.onBeforeSending(report);
                    }
                });
            }

            @Override // com.microsoft.appcenter.channel.Channel.GroupListener
            public void onSuccess(Log log) {
                processCallback(log, new CallbackProcessor() { // from class: com.microsoft.appcenter.crashes.Crashes.6.3
                    @Override // com.microsoft.appcenter.crashes.Crashes.CallbackProcessor
                    public void onCallBack(ErrorReport report) {
                        Crashes.this.mCrashesListener.onSendingSucceeded(report);
                    }
                });
            }

            @Override // com.microsoft.appcenter.channel.Channel.GroupListener
            public void onFailure(Log log, final Exception e) {
                processCallback(log, new CallbackProcessor() { // from class: com.microsoft.appcenter.crashes.Crashes.6.4
                    @Override // com.microsoft.appcenter.crashes.Crashes.CallbackProcessor
                    public void onCallBack(ErrorReport report) {
                        Crashes.this.mCrashesListener.onSendingFailed(report, e);
                    }
                });
            }
        };
    }

    synchronized Device getDeviceInfo(Context context) throws DeviceInfoHelper.DeviceInfoException {
        if (this.mDevice == null) {
            this.mDevice = DeviceInfoHelper.getDeviceInfo(context);
        }
        return this.mDevice;
    }

    synchronized long getInitializeTimestamp() {
        return this.mInitializeTimestamp;
    }

    private synchronized void queueException(final Throwable throwable, Map<String, String> properties, Iterable<ErrorAttachmentLog> attachments) {
        queueException(new ExceptionModelBuilder() { // from class: com.microsoft.appcenter.crashes.Crashes.7
            @Override // com.microsoft.appcenter.crashes.Crashes.ExceptionModelBuilder
            public Exception buildExceptionModel() {
                return ErrorLogHelper.getModelExceptionFromThrowable(throwable);
            }
        }, properties, attachments);
    }

    synchronized UUID queueException(final Exception modelException, Map<String, String> properties, Iterable<ErrorAttachmentLog> attachments) {
        return queueException(new ExceptionModelBuilder() { // from class: com.microsoft.appcenter.crashes.Crashes.8
            @Override // com.microsoft.appcenter.crashes.Crashes.ExceptionModelBuilder
            public Exception buildExceptionModel() {
                return modelException;
            }
        }, properties, attachments);
    }

    private synchronized UUID queueException(final ExceptionModelBuilder exceptionModelBuilder, Map<String, String> properties, final Iterable<ErrorAttachmentLog> attachments) {
        final UUID uuidRandomUUID;
        final String userId = UserIdContext.getInstance().getUserId();
        uuidRandomUUID = UUID.randomUUID();
        final Map<String, String> mapValidateProperties = ErrorLogHelper.validateProperties(properties, "HandledError");
        post(new Runnable() { // from class: com.microsoft.appcenter.crashes.Crashes.9
            @Override // java.lang.Runnable
            public void run() {
                HandledErrorLog handledErrorLog = new HandledErrorLog();
                handledErrorLog.setId(uuidRandomUUID);
                handledErrorLog.setUserId(userId);
                handledErrorLog.setException(exceptionModelBuilder.buildExceptionModel());
                handledErrorLog.setProperties(mapValidateProperties);
                Crashes.this.mChannel.enqueue(handledErrorLog, Crashes.ERROR_GROUP, 1);
                Crashes.this.sendErrorAttachment(uuidRandomUUID, attachments);
            }
        });
        return uuidRandomUUID;
    }

    private void initialize() {
        boolean zIsInstanceEnabled = isInstanceEnabled();
        this.mInitializeTimestamp = zIsInstanceEnabled ? System.currentTimeMillis() : -1L;
        if (!zIsInstanceEnabled) {
            UncaughtExceptionHandler uncaughtExceptionHandler = this.mUncaughtExceptionHandler;
            if (uncaughtExceptionHandler != null) {
                uncaughtExceptionHandler.unregister();
                this.mUncaughtExceptionHandler = null;
                return;
            }
            return;
        }
        UncaughtExceptionHandler uncaughtExceptionHandler2 = new UncaughtExceptionHandler();
        this.mUncaughtExceptionHandler = uncaughtExceptionHandler2;
        uncaughtExceptionHandler2.register();
        processMinidumpFiles();
    }

    private void processMinidumpFiles() {
        for (File file : ErrorLogHelper.getNewMinidumpFiles()) {
            if (!file.isDirectory()) {
                AppCenterLog.debug(LOG_TAG, "Found a minidump from a previous SDK version.");
                processSingleMinidump(file, file);
            } else {
                File[] fileArrListFiles = file.listFiles(new FilenameFilter() { // from class: com.microsoft.appcenter.crashes.Crashes.10
                    @Override // java.io.FilenameFilter
                    public boolean accept(File dir, String filename) {
                        return filename.endsWith(ErrorLogHelper.MINIDUMP_FILE_EXTENSION);
                    }
                });
                if (fileArrListFiles != null && fileArrListFiles.length != 0) {
                    for (File file2 : fileArrListFiles) {
                        processSingleMinidump(file2, file);
                    }
                }
            }
        }
        File lastErrorLogFile = ErrorLogHelper.getLastErrorLogFile();
        while (lastErrorLogFile != null && lastErrorLogFile.length() == 0) {
            AppCenterLog.warn(LOG_TAG, "Deleting empty error file: " + lastErrorLogFile);
            lastErrorLogFile.delete();
            lastErrorLogFile = ErrorLogHelper.getLastErrorLogFile();
        }
        if (lastErrorLogFile != null) {
            AppCenterLog.debug(LOG_TAG, "Processing crash report for the last session.");
            String str = FileManager.read(lastErrorLogFile);
            if (str == null) {
                AppCenterLog.error(LOG_TAG, "Error reading last session error log.");
            } else {
                try {
                    this.mLastSessionErrorReport = buildErrorReport((ManagedErrorLog) this.mLogSerializer.deserializeLog(str, null));
                    AppCenterLog.debug(LOG_TAG, "Processed crash report for the last session.");
                } catch (JSONException e) {
                    AppCenterLog.error(LOG_TAG, "Error parsing last session error log.", e);
                }
            }
        }
        ErrorLogHelper.removeStaleMinidumpSubfolders();
    }

    private void processSingleMinidump(File minidumpFile, File minidumpFolder) {
        AppCenterLog.debug(LOG_TAG, "Process pending minidump file: " + minidumpFile);
        long jLastModified = minidumpFile.lastModified();
        File file = new File(ErrorLogHelper.getPendingMinidumpDirectory(), minidumpFile.getName());
        Exception exception = new Exception();
        exception.setType(MINIDUMP_FILE);
        exception.setWrapperSdkName(Constants.WRAPPER_SDK_NAME_NDK);
        exception.setMinidumpFilePath(file.getPath());
        ManagedErrorLog managedErrorLog = new ManagedErrorLog();
        managedErrorLog.setException(exception);
        managedErrorLog.setTimestamp(new Date(jLastModified));
        managedErrorLog.setFatal(true);
        managedErrorLog.setId(ErrorLogHelper.parseLogFolderUuid(minidumpFolder));
        SessionContext.SessionInfo sessionAt = SessionContext.getInstance().getSessionAt(jLastModified);
        if (sessionAt != null && sessionAt.getAppLaunchTimestamp() <= jLastModified) {
            managedErrorLog.setAppLaunchTimestamp(new Date(sessionAt.getAppLaunchTimestamp()));
        } else {
            managedErrorLog.setAppLaunchTimestamp(managedErrorLog.getTimestamp());
        }
        managedErrorLog.setProcessId(0);
        managedErrorLog.setProcessName("");
        try {
            String storedUserInfo = ErrorLogHelper.getStoredUserInfo(minidumpFolder);
            Device storedDeviceInfo = ErrorLogHelper.getStoredDeviceInfo(minidumpFolder);
            if (storedDeviceInfo == null) {
                storedDeviceInfo = getDeviceInfo(this.mContext);
                storedDeviceInfo.setWrapperSdkName(Constants.WRAPPER_SDK_NAME_NDK);
            }
            managedErrorLog.setDevice(storedDeviceInfo);
            managedErrorLog.setUserId(storedUserInfo);
            saveErrorLogFiles(new NativeException(), managedErrorLog);
            if (minidumpFile.renameTo(file)) {
            } else {
                throw new IOException("Failed to move file");
            }
        } catch (Exception e) {
            minidumpFile.delete();
            removeAllStoredErrorLogFiles(managedErrorLog.getId());
            AppCenterLog.error(LOG_TAG, "Failed to process new minidump file: " + minidumpFile, e);
        }
    }

    private void processPendingErrors() {
        for (File file : ErrorLogHelper.getStoredErrorLogFiles()) {
            AppCenterLog.debug(LOG_TAG, "Process pending error file: " + file);
            String str = FileManager.read(file);
            if (str != null) {
                try {
                    ManagedErrorLog managedErrorLog = (ManagedErrorLog) this.mLogSerializer.deserializeLog(str, null);
                    UUID id = managedErrorLog.getId();
                    ErrorReport errorReportBuildErrorReport = buildErrorReport(managedErrorLog);
                    if (errorReportBuildErrorReport == null) {
                        removeAllStoredErrorLogFiles(id);
                    } else if (!this.mAutomaticProcessing || this.mCrashesListener.shouldProcess(errorReportBuildErrorReport)) {
                        if (!this.mAutomaticProcessing) {
                            AppCenterLog.debug(LOG_TAG, "CrashesListener.shouldProcess returned true, continue processing log: " + id.toString());
                        }
                        this.mUnprocessedErrorReports.put(id, this.mErrorReportCache.get(id));
                    } else {
                        AppCenterLog.debug(LOG_TAG, "CrashesListener.shouldProcess returned false, clean up and ignore log: " + id.toString());
                        removeAllStoredErrorLogFiles(id);
                    }
                } catch (JSONException e) {
                    AppCenterLog.error(LOG_TAG, "Error parsing error log. Deleting invalid file: " + file, e);
                    file.delete();
                }
            }
        }
        boolean zIsMemoryRunningLevelWasReceived = isMemoryRunningLevelWasReceived(SharedPreferencesManager.getInt(PREF_KEY_MEMORY_RUNNING_LEVEL, -1));
        this.mHasReceivedMemoryWarningInLastSession = zIsMemoryRunningLevelWasReceived;
        if (zIsMemoryRunningLevelWasReceived) {
            AppCenterLog.debug(LOG_TAG, "The application received a low memory warning in the last session.");
        }
        SharedPreferencesManager.remove(PREF_KEY_MEMORY_RUNNING_LEVEL);
        if (this.mAutomaticProcessing) {
            sendCrashReportsOrAwaitUserConfirmation();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean sendCrashReportsOrAwaitUserConfirmation() {
        final boolean z = SharedPreferencesManager.getBoolean(PREF_KEY_ALWAYS_SEND, false);
        HandlerUtils.runOnUiThread(new Runnable() { // from class: com.microsoft.appcenter.crashes.Crashes.11
            @Override // java.lang.Runnable
            public void run() {
                if (Crashes.this.mUnprocessedErrorReports.size() > 0) {
                    if (!z) {
                        if (Crashes.this.mAutomaticProcessing) {
                            if (!Crashes.this.mCrashesListener.shouldAwaitUserConfirmation()) {
                                AppCenterLog.debug(Crashes.LOG_TAG, "CrashesListener.shouldAwaitUserConfirmation returned false, will send logs.");
                                Crashes.this.handleUserConfirmation(0);
                                return;
                            } else {
                                AppCenterLog.debug(Crashes.LOG_TAG, "CrashesListener.shouldAwaitUserConfirmation returned true, wait sending logs.");
                                return;
                            }
                        }
                        AppCenterLog.debug(Crashes.LOG_TAG, "Automatic processing disabled, will wait for explicit user confirmation.");
                        return;
                    }
                    AppCenterLog.debug(Crashes.LOG_TAG, "The flag for user confirmation is set to ALWAYS_SEND, will send logs.");
                    Crashes.this.handleUserConfirmation(0);
                }
            }
        });
        return z;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void removeAllStoredErrorLogFiles(UUID id) {
        ErrorLogHelper.removeStoredErrorLogFile(id);
        removeStoredThrowable(id);
    }

    private void removeStoredThrowable(UUID id) {
        this.mErrorReportCache.remove(id);
        WrapperSdkExceptionManager.deleteWrapperExceptionData(id);
    }

    UncaughtExceptionHandler getUncaughtExceptionHandler() {
        return this.mUncaughtExceptionHandler;
    }

    void setUncaughtExceptionHandler(UncaughtExceptionHandler handler) {
        this.mUncaughtExceptionHandler = handler;
    }

    String buildStackTrace(Exception exception) {
        String str = String.format("%s: %s", exception.getType(), exception.getMessage());
        if (exception.getFrames() == null) {
            return str;
        }
        for (StackFrame stackFrame : exception.getFrames()) {
            str = str + String.format("\n\t at %s.%s(%s:%s)", stackFrame.getClassName(), stackFrame.getMethodName(), stackFrame.getFileName(), stackFrame.getLineNumber());
        }
        return str;
    }

    ErrorReport buildErrorReport(ManagedErrorLog log) {
        UUID id = log.getId();
        if (!this.mErrorReportCache.containsKey(id)) {
            File storedThrowableFile = ErrorLogHelper.getStoredThrowableFile(id);
            String strBuildStackTrace = (storedThrowableFile == null || storedThrowableFile.length() <= 0) ? null : FileManager.read(storedThrowableFile);
            if (strBuildStackTrace == null) {
                if (MINIDUMP_FILE.equals(log.getException().getType())) {
                    strBuildStackTrace = android.util.Log.getStackTraceString(new NativeException());
                } else {
                    strBuildStackTrace = buildStackTrace(log.getException());
                }
            }
            ErrorReport errorReportFromErrorLog = ErrorLogHelper.getErrorReportFromErrorLog(log, strBuildStackTrace);
            this.mErrorReportCache.put(id, new ErrorLogReport(log, errorReportFromErrorLog));
            return errorReportFromErrorLog;
        }
        ErrorReport errorReport = this.mErrorReportCache.get(id).report;
        errorReport.setDevice(log.getDevice());
        return errorReport;
    }

    CrashesListener getInstanceListener() {
        return this.mCrashesListener;
    }

    synchronized void setInstanceListener(CrashesListener listener) {
        if (listener == null) {
            listener = DEFAULT_ERROR_REPORTING_LISTENER;
            this.mCrashesListener = listener;
        } else {
            this.mCrashesListener = listener;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void handleUserConfirmation(final int userConfirmation) {
        post(new Runnable() { // from class: com.microsoft.appcenter.crashes.Crashes.12
            @Override // java.lang.Runnable
            public void run() {
                File file;
                int i = userConfirmation;
                if (i == 1) {
                    Iterator it = Crashes.this.mUnprocessedErrorReports.keySet().iterator();
                    while (it.hasNext()) {
                        UUID uuid = (UUID) it.next();
                        it.remove();
                        Crashes.this.removeAllStoredErrorLogFiles(uuid);
                    }
                    ErrorLogHelper.cleanPendingMinidumps();
                    return;
                }
                if (i == 2) {
                    SharedPreferencesManager.putBoolean(Crashes.PREF_KEY_ALWAYS_SEND, true);
                }
                Iterator it2 = Crashes.this.mUnprocessedErrorReports.entrySet().iterator();
                while (it2.hasNext()) {
                    Map.Entry entry = (Map.Entry) it2.next();
                    ErrorLogReport errorLogReport = (ErrorLogReport) entry.getValue();
                    ErrorAttachmentLog errorAttachmentLogAttachmentWithBinary = null;
                    if (errorLogReport.report.getDevice() == null || !Constants.WRAPPER_SDK_NAME_NDK.equals(errorLogReport.report.getDevice().getWrapperSdkName())) {
                        file = null;
                    } else {
                        Exception exception = errorLogReport.log.getException();
                        String minidumpFilePath = exception.getMinidumpFilePath();
                        exception.setMinidumpFilePath(null);
                        if (minidumpFilePath == null) {
                            minidumpFilePath = exception.getStackTrace();
                            exception.setStackTrace(null);
                        }
                        if (minidumpFilePath != null) {
                            File file2 = new File(minidumpFilePath);
                            errorAttachmentLogAttachmentWithBinary = ErrorAttachmentLog.attachmentWithBinary(FileManager.readBytes(file2), "minidump.dmp", AttachmentConstants.UNKNOWN_FILE_MIME);
                            file = file2;
                        } else {
                            AppCenterLog.warn(Crashes.LOG_TAG, "NativeException found without minidump.");
                            file = null;
                        }
                    }
                    Crashes.this.mChannel.enqueue(errorLogReport.log, Crashes.ERROR_GROUP, 2);
                    if (errorAttachmentLogAttachmentWithBinary != null) {
                        Crashes.this.sendErrorAttachment(errorLogReport.log.getId(), Collections.singleton(errorAttachmentLogAttachmentWithBinary));
                        file.delete();
                    }
                    if (Crashes.this.mAutomaticProcessing) {
                        Crashes.this.sendErrorAttachment(errorLogReport.log.getId(), Crashes.this.mCrashesListener.getErrorAttachments(errorLogReport.report));
                    }
                    it2.remove();
                    ErrorLogHelper.removeStoredErrorLogFile((UUID) entry.getKey());
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendErrorAttachment(UUID errorId, Iterable<ErrorAttachmentLog> attachments) {
        if (attachments == null) {
            AppCenterLog.debug(LOG_TAG, "Error report: " + errorId.toString() + " does not have any attachment.");
            return;
        }
        for (ErrorAttachmentLog errorAttachmentLog : attachments) {
            if (errorAttachmentLog != null) {
                errorAttachmentLog.setId(UUID.randomUUID());
                errorAttachmentLog.setErrorId(errorId);
                if (!errorAttachmentLog.isValid()) {
                    AppCenterLog.error(LOG_TAG, "Not all required fields are present in ErrorAttachmentLog.");
                } else if (errorAttachmentLog.getData().length > MAX_ATTACHMENT_SIZE) {
                    AppCenterLog.error(LOG_TAG, String.format(Locale.ENGLISH, "Discarding attachment with size above %d bytes: size=%d, fileName=%s.", Integer.valueOf(MAX_ATTACHMENT_SIZE), Integer.valueOf(errorAttachmentLog.getData().length), errorAttachmentLog.getFileName()));
                } else {
                    this.mChannel.enqueue(errorAttachmentLog, ERROR_GROUP, 1);
                }
            } else {
                AppCenterLog.warn(LOG_TAG, "Skipping null ErrorAttachmentLog.");
            }
        }
    }

    void setLogSerializer(LogSerializer logSerializer) {
        this.mLogSerializer = logSerializer;
    }

    public UUID saveUncaughtException(Thread thread, Throwable throwable) {
        try {
            return saveUncaughtException(thread, throwable, ErrorLogHelper.getModelExceptionFromThrowable(throwable));
        } catch (IOException e) {
            AppCenterLog.error(LOG_TAG, "Error writing error log to file", e);
            return null;
        } catch (JSONException e2) {
            AppCenterLog.error(LOG_TAG, "Error serializing error log to JSON", e2);
            return null;
        }
    }

    UUID saveUncaughtException(Thread thread, Throwable throwable, Exception modelException) throws JSONException, IOException {
        if (!isEnabled().get().booleanValue() || this.mSavedUncaughtException) {
            return null;
        }
        this.mSavedUncaughtException = true;
        return saveErrorLogFiles(throwable, ErrorLogHelper.createErrorLog(this.mContext, thread, modelException, Thread.getAllStackTraces(), this.mInitializeTimestamp, true));
    }

    private UUID saveErrorLogFiles(Throwable throwable, ManagedErrorLog errorLog) throws JSONException, IOException {
        File errorStorageDirectory = ErrorLogHelper.getErrorStorageDirectory();
        UUID id = errorLog.getId();
        String string = id.toString();
        AppCenterLog.debug(LOG_TAG, "Saving uncaught exception.");
        File file = new File(errorStorageDirectory, string + ErrorLogHelper.ERROR_LOG_FILE_EXTENSION);
        FileManager.write(file, this.mLogSerializer.serializeLog(errorLog));
        AppCenterLog.debug(LOG_TAG, "Saved JSON content for ingestion into " + file);
        return id;
    }

    void setAutomaticProcessing(boolean automaticProcessing) {
        this.mAutomaticProcessing = automaticProcessing;
    }

    AppCenterFuture<Collection<ErrorReport>> getUnprocessedErrorReports() {
        final DefaultAppCenterFuture defaultAppCenterFuture = new DefaultAppCenterFuture();
        postAsyncGetter(new Runnable() { // from class: com.microsoft.appcenter.crashes.Crashes.13
            @Override // java.lang.Runnable
            public void run() {
                ArrayList arrayList = new ArrayList(Crashes.this.mUnprocessedErrorReports.size());
                Iterator it = Crashes.this.mUnprocessedErrorReports.values().iterator();
                while (it.hasNext()) {
                    arrayList.add(((ErrorLogReport) it.next()).report);
                }
                defaultAppCenterFuture.complete(arrayList);
            }
        }, defaultAppCenterFuture, Collections.emptyList());
        return defaultAppCenterFuture;
    }

    AppCenterFuture<Boolean> sendCrashReportsOrAwaitUserConfirmation(final Collection<String> filteredReportIds) {
        final DefaultAppCenterFuture defaultAppCenterFuture = new DefaultAppCenterFuture();
        postAsyncGetter(new Runnable() { // from class: com.microsoft.appcenter.crashes.Crashes.14
            @Override // java.lang.Runnable
            public void run() {
                Iterator it = Crashes.this.mUnprocessedErrorReports.entrySet().iterator();
                while (it.hasNext()) {
                    Map.Entry entry = (Map.Entry) it.next();
                    UUID uuid = (UUID) entry.getKey();
                    String id = ((ErrorLogReport) entry.getValue()).report.getId();
                    Collection collection = filteredReportIds;
                    if (collection != null && collection.contains(id)) {
                        AppCenterLog.debug(Crashes.LOG_TAG, "CrashesListener.shouldProcess returned true, continue processing log: " + id);
                    } else {
                        AppCenterLog.debug(Crashes.LOG_TAG, "CrashesListener.shouldProcess returned false, clean up and ignore log: " + id);
                        Crashes.this.removeAllStoredErrorLogFiles(uuid);
                        it.remove();
                    }
                }
                defaultAppCenterFuture.complete(Boolean.valueOf(Crashes.this.sendCrashReportsOrAwaitUserConfirmation()));
            }
        }, defaultAppCenterFuture, false);
        return defaultAppCenterFuture;
    }

    void sendErrorAttachments(final String errorReportId, final Iterable<ErrorAttachmentLog> attachments) {
        post(new Runnable() { // from class: com.microsoft.appcenter.crashes.Crashes.15
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Crashes.this.sendErrorAttachment(UUID.fromString(errorReportId), attachments);
                } catch (RuntimeException unused) {
                    AppCenterLog.error(Crashes.LOG_TAG, "Error report identifier has an invalid format for sending attachments.");
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void saveMemoryRunningLevel(int level) {
        SharedPreferencesManager.putInt(PREF_KEY_MEMORY_RUNNING_LEVEL, level);
        AppCenterLog.debug(LOG_TAG, String.format("The memory running level (%s) was saved.", Integer.valueOf(level)));
    }

    private static class DefaultCrashesListener extends AbstractCrashesListener {
        private DefaultCrashesListener() {
        }
    }

    private static class ErrorLogReport {
        private final ManagedErrorLog log;
        private final ErrorReport report;

        private ErrorLogReport(ManagedErrorLog log, ErrorReport report) {
            this.log = log;
            this.report = report;
        }
    }
}
