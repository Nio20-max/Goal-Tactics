package com.microsoft.appcenter.crashes.utils;

import android.app.ActivityManager;
import android.content.Context;
import android.os.Build;
import android.os.Process;
import com.microsoft.appcenter.Constants;
import com.microsoft.appcenter.crashes.Crashes;
import com.microsoft.appcenter.crashes.ingestion.models.Exception;
import com.microsoft.appcenter.crashes.ingestion.models.ManagedErrorLog;
import com.microsoft.appcenter.crashes.ingestion.models.StackFrame;
import com.microsoft.appcenter.crashes.ingestion.models.Thread;
import com.microsoft.appcenter.crashes.model.ErrorReport;
import com.microsoft.appcenter.ingestion.models.Device;
import com.microsoft.appcenter.utils.AppCenterLog;
import com.microsoft.appcenter.utils.DeviceInfoHelper;
import com.microsoft.appcenter.utils.context.UserIdContext;
import com.microsoft.appcenter.utils.storage.FileManager;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* JADX INFO: loaded from: classes2.dex */
public class ErrorLogHelper {
    static final int CAUSE_LIMIT = 16;
    private static final int CAUSE_LIMIT_HALF = 8;
    public static final String DEVICE_INFO_FILE = "deviceInfo";
    static String DEVICE_INFO_KEY = "DEVICE_INFO";
    static final String ERROR_DIRECTORY = "error";
    public static final String ERROR_LOG_FILE_EXTENSION = ".json";
    public static final int FRAME_LIMIT = 256;
    private static final int FRAME_LIMIT_HALF = 128;
    private static final int MAX_PROPERTY_COUNT = 20;
    public static final int MAX_PROPERTY_ITEM_LENGTH = 125;
    private static final String MINIDUMP_DIRECTORY = "minidump";
    public static final String MINIDUMP_FILE_EXTENSION = ".dmp";
    private static final String NEW_MINIDUMP_DIRECTORY = "new";
    private static final String PENDING_MINIDUMP_DIRECTORY = "pending";
    public static final String THROWABLE_FILE_EXTENSION = ".throwable";
    static String USER_ID_KEY = "USER_ID";
    private static File sErrorLogDirectory;
    private static File sNewMinidumpDirectory;
    private static File sPendingMinidumpDirectory;

    public static ManagedErrorLog createErrorLog(Context context, final Thread thread, final Throwable throwable, final Map<Thread, StackTraceElement[]> allStackTraces, final long initializeTimestamp) {
        return createErrorLog(context, thread, getModelExceptionFromThrowable(throwable), allStackTraces, initializeTimestamp, true);
    }

    public static ManagedErrorLog createErrorLog(Context context, final Thread thread, final Exception exception, final Map<Thread, StackTraceElement[]> allStackTraces, final long initializeTimestamp, boolean fatal) {
        List<ActivityManager.RunningAppProcessInfo> runningAppProcesses;
        ManagedErrorLog managedErrorLog = new ManagedErrorLog();
        managedErrorLog.setId(UUID.randomUUID());
        managedErrorLog.setTimestamp(new Date());
        managedErrorLog.setUserId(UserIdContext.getInstance().getUserId());
        try {
            managedErrorLog.setDevice(DeviceInfoHelper.getDeviceInfo(context));
        } catch (DeviceInfoHelper.DeviceInfoException e) {
            AppCenterLog.error(Crashes.LOG_TAG, "Could not attach device properties snapshot to error log, will attach at sending time", e);
        }
        managedErrorLog.setProcessId(Integer.valueOf(Process.myPid()));
        ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
        if (activityManager != null && (runningAppProcesses = activityManager.getRunningAppProcesses()) != null) {
            for (ActivityManager.RunningAppProcessInfo runningAppProcessInfo : runningAppProcesses) {
                if (runningAppProcessInfo.pid == Process.myPid()) {
                    managedErrorLog.setProcessName(runningAppProcessInfo.processName);
                }
            }
        }
        if (managedErrorLog.getProcessName() == null) {
            managedErrorLog.setProcessName("");
        }
        managedErrorLog.setArchitecture(getArchitecture());
        managedErrorLog.setErrorThreadId(Long.valueOf(thread.getId()));
        managedErrorLog.setErrorThreadName(thread.getName());
        managedErrorLog.setFatal(Boolean.valueOf(fatal));
        managedErrorLog.setAppLaunchTimestamp(new Date(initializeTimestamp));
        managedErrorLog.setException(exception);
        ArrayList arrayList = new ArrayList(allStackTraces.size());
        for (Map.Entry<Thread, StackTraceElement[]> entry : allStackTraces.entrySet()) {
            Thread thread2 = new Thread();
            thread2.setId(entry.getKey().getId());
            thread2.setName(entry.getKey().getName());
            thread2.setFrames(getModelFramesFromStackTrace(entry.getValue()));
            arrayList.add(thread2);
        }
        managedErrorLog.setThreads(arrayList);
        return managedErrorLog;
    }

    private static String getArchitecture() {
        if (Build.VERSION.SDK_INT >= 21) {
            return Build.SUPPORTED_ABIS[0];
        }
        return Build.CPU_ABI;
    }

    public static synchronized File getErrorStorageDirectory() {
        if (sErrorLogDirectory == null) {
            File file = new File(Constants.FILES_PATH, "error");
            sErrorLogDirectory = file;
            FileManager.mkdir(file.getAbsolutePath());
        }
        return sErrorLogDirectory;
    }

    public static synchronized File getNewMinidumpDirectory() {
        return new File(new File(getErrorStorageDirectory().getAbsolutePath(), MINIDUMP_DIRECTORY), NEW_MINIDUMP_DIRECTORY);
    }

    public static synchronized File getNewMinidumpSubfolder() {
        if (sNewMinidumpDirectory == null) {
            File file = new File(getNewMinidumpDirectory(), UUID.randomUUID().toString());
            sNewMinidumpDirectory = file;
            FileManager.mkdir(file.getPath());
        }
        return sNewMinidumpDirectory;
    }

    public static synchronized File getNewMinidumpSubfolderWithContextData(Context context) {
        File newMinidumpSubfolder;
        newMinidumpSubfolder = getNewMinidumpSubfolder();
        File file = new File(newMinidumpSubfolder, DEVICE_INFO_FILE);
        try {
            Device deviceInfo = DeviceInfoHelper.getDeviceInfo(context);
            String userId = UserIdContext.getInstance().getUserId();
            deviceInfo.setWrapperSdkName(Constants.WRAPPER_SDK_NAME_NDK);
            JSONStringer jSONStringer = new JSONStringer();
            jSONStringer.object();
            deviceInfo.write(jSONStringer);
            jSONStringer.endObject();
            String string = jSONStringer.toString();
            JSONObject jSONObject = new JSONObject();
            jSONObject.put(DEVICE_INFO_KEY, string);
            jSONObject.put(USER_ID_KEY, userId);
            FileManager.write(file, jSONObject.toString());
        } catch (DeviceInfoHelper.DeviceInfoException | IOException | JSONException e) {
            AppCenterLog.error(Crashes.LOG_TAG, "Failed to store device info in a minidump folder.", e);
            file.delete();
        }
        return newMinidumpSubfolder;
    }

    public static synchronized File getPendingMinidumpDirectory() {
        if (sPendingMinidumpDirectory == null) {
            File file = new File(new File(getErrorStorageDirectory().getAbsolutePath(), MINIDUMP_DIRECTORY), PENDING_MINIDUMP_DIRECTORY);
            sPendingMinidumpDirectory = file;
            FileManager.mkdir(file.getPath());
        }
        return sPendingMinidumpDirectory;
    }

    public static File[] getStoredErrorLogFiles() {
        File[] fileArrListFiles = getErrorStorageDirectory().listFiles(new FilenameFilter() { // from class: com.microsoft.appcenter.crashes.utils.ErrorLogHelper.1
            @Override // java.io.FilenameFilter
            public boolean accept(File dir, String filename) {
                return filename.endsWith(ErrorLogHelper.ERROR_LOG_FILE_EXTENSION);
            }
        });
        return fileArrListFiles != null ? fileArrListFiles : new File[0];
    }

    public static File[] getNewMinidumpFiles() {
        File[] fileArrListFiles = getNewMinidumpDirectory().listFiles();
        return fileArrListFiles != null ? fileArrListFiles : new File[0];
    }

    public static Device getStoredDeviceInfo(File logFolder) {
        String contextInformation = getContextInformation(logFolder);
        if (contextInformation == null) {
            return null;
        }
        return parseDevice(contextInformation);
    }

    public static String getStoredUserInfo(File logFolder) {
        String contextInformation = getContextInformation(logFolder);
        if (contextInformation == null) {
            return null;
        }
        return parseUserId(contextInformation);
    }

    static String getContextInformation(File logFolder) {
        File[] fileArrListFiles = logFolder.listFiles(new FilenameFilter() { // from class: com.microsoft.appcenter.crashes.utils.ErrorLogHelper.2
            @Override // java.io.FilenameFilter
            public boolean accept(File dir, String filename) {
                return filename.equals(ErrorLogHelper.DEVICE_INFO_FILE);
            }
        });
        if (fileArrListFiles == null || fileArrListFiles.length == 0) {
            AppCenterLog.warn(Crashes.LOG_TAG, "No stored deviceinfo file found in a minidump folder.");
            return null;
        }
        String str = FileManager.read(fileArrListFiles[0]);
        if (str != null) {
            return str;
        }
        AppCenterLog.error(Crashes.LOG_TAG, "Failed to read stored device info.");
        return null;
    }

    static String parseUserId(String contextInformation) {
        try {
            JSONObject jSONObject = new JSONObject(contextInformation);
            if (jSONObject.has(USER_ID_KEY)) {
                return jSONObject.getString(USER_ID_KEY);
            }
            return null;
        } catch (JSONException e) {
            AppCenterLog.error(Crashes.LOG_TAG, "Failed to deserialize user info.", e);
            return null;
        }
    }

    static Device parseDevice(String contextInformation) {
        try {
            Device device = new Device();
            JSONObject jSONObject = new JSONObject(contextInformation);
            if (jSONObject.has(DEVICE_INFO_KEY)) {
                jSONObject = new JSONObject(jSONObject.getString(DEVICE_INFO_KEY));
            }
            device.read(jSONObject);
            return device;
        } catch (JSONException e) {
            AppCenterLog.error(Crashes.LOG_TAG, "Failed to deserialize device info.", e);
            return null;
        }
    }

    public static void removeStaleMinidumpSubfolders() {
        File[] fileArrListFiles = getNewMinidumpDirectory().listFiles(new FilenameFilter() { // from class: com.microsoft.appcenter.crashes.utils.ErrorLogHelper.3
            @Override // java.io.FilenameFilter
            public boolean accept(File dir, String name) {
                if (ErrorLogHelper.sNewMinidumpDirectory != null) {
                    return !name.equals(ErrorLogHelper.sNewMinidumpDirectory.getName());
                }
                return true;
            }
        });
        if (fileArrListFiles == null || fileArrListFiles.length == 0) {
            AppCenterLog.debug(Crashes.LOG_TAG, "No previous minidump sub-folders.");
            return;
        }
        for (File file : fileArrListFiles) {
            FileManager.deleteDirectory(file);
        }
    }

    public static void removeMinidumpFolder() {
        FileManager.deleteDirectory(new File(getErrorStorageDirectory().getAbsolutePath(), MINIDUMP_DIRECTORY));
    }

    public static File getLastErrorLogFile() {
        return FileManager.lastModifiedFile(getErrorStorageDirectory(), new FilenameFilter() { // from class: com.microsoft.appcenter.crashes.utils.ErrorLogHelper.4
            @Override // java.io.FilenameFilter
            public boolean accept(File dir, String filename) {
                return filename.endsWith(ErrorLogHelper.ERROR_LOG_FILE_EXTENSION);
            }
        });
    }

    public static File getStoredThrowableFile(UUID id) {
        return getStoredFile(id, THROWABLE_FILE_EXTENSION);
    }

    public static void removeStoredThrowableFile(UUID id) {
        File storedThrowableFile = getStoredThrowableFile(id);
        if (storedThrowableFile != null) {
            AppCenterLog.info(Crashes.LOG_TAG, "Deleting throwable file " + storedThrowableFile.getName());
            FileManager.delete(storedThrowableFile);
        }
    }

    static File getStoredErrorLogFile(UUID id) {
        return getStoredFile(id, ERROR_LOG_FILE_EXTENSION);
    }

    public static void removeStoredErrorLogFile(UUID id) {
        File storedErrorLogFile = getStoredErrorLogFile(id);
        if (storedErrorLogFile != null) {
            AppCenterLog.info(Crashes.LOG_TAG, "Deleting error log file " + storedErrorLogFile.getName());
            FileManager.delete(storedErrorLogFile);
        }
    }

    public static void removeLostThrowableFiles() {
        File[] fileArrListFiles = getErrorStorageDirectory().listFiles(new FilenameFilter() { // from class: com.microsoft.appcenter.crashes.utils.ErrorLogHelper.5
            @Override // java.io.FilenameFilter
            public boolean accept(File dir, String filename) {
                return filename.endsWith(ErrorLogHelper.THROWABLE_FILE_EXTENSION);
            }
        });
        if (fileArrListFiles == null || fileArrListFiles.length <= 0) {
            return;
        }
        for (File file : fileArrListFiles) {
            removeStoredThrowableFile(UUID.fromString(file.getName().replaceFirst("\\.[^.]+$", "")));
        }
    }

    public static ErrorReport getErrorReportFromErrorLog(ManagedErrorLog log, String stackTrace) {
        ErrorReport errorReport = new ErrorReport();
        errorReport.setId(log.getId().toString());
        errorReport.setThreadName(log.getErrorThreadName());
        errorReport.setStackTrace(stackTrace);
        errorReport.setAppStartTime(log.getAppLaunchTimestamp());
        errorReport.setAppErrorTime(log.getTimestamp());
        errorReport.setDevice(log.getDevice());
        return errorReport;
    }

    public static void setErrorLogDirectory(File file) {
        sErrorLogDirectory = file;
    }

    private static File getStoredFile(final UUID id, final String extension) {
        File[] fileArrListFiles = getErrorStorageDirectory().listFiles(new FilenameFilter() { // from class: com.microsoft.appcenter.crashes.utils.ErrorLogHelper.6
            @Override // java.io.FilenameFilter
            public boolean accept(File dir, String filename) {
                return filename.startsWith(id.toString()) && filename.endsWith(extension);
            }
        });
        if (fileArrListFiles == null || fileArrListFiles.length <= 0) {
            return null;
        }
        return fileArrListFiles[0];
    }

    public static Exception getModelExceptionFromThrowable(Throwable t) {
        LinkedList<Throwable> linkedList = new LinkedList();
        while (t != null) {
            linkedList.add(t);
            t = t.getCause();
        }
        if (linkedList.size() > 16) {
            AppCenterLog.warn(Crashes.LOG_TAG, "Crash causes truncated from " + linkedList.size() + " to 16 causes.");
            linkedList.subList(8, linkedList.size() - 8).clear();
        }
        Exception exception = null;
        Exception exception2 = null;
        for (Throwable th : linkedList) {
            Exception exception3 = new Exception();
            exception3.setType(th.getClass().getName());
            exception3.setMessage(th.getMessage());
            exception3.setFrames(getModelFramesFromStackTrace(th));
            if (exception == null) {
                exception = exception3;
            } else {
                exception2.setInnerExceptions(Collections.singletonList(exception3));
            }
            exception2 = exception3;
        }
        return exception;
    }

    private static List<StackFrame> getModelFramesFromStackTrace(Throwable throwable) {
        StackTraceElement[] stackTrace = throwable.getStackTrace();
        if (stackTrace.length > 256) {
            StackTraceElement[] stackTraceElementArr = new StackTraceElement[256];
            System.arraycopy(stackTrace, 0, stackTraceElementArr, 0, 128);
            System.arraycopy(stackTrace, stackTrace.length - 128, stackTraceElementArr, 128, 128);
            throwable.setStackTrace(stackTraceElementArr);
            AppCenterLog.warn(Crashes.LOG_TAG, "Crash frames truncated from " + stackTrace.length + " to 256 frames.");
            stackTrace = stackTraceElementArr;
        }
        return getModelFramesFromStackTrace(stackTrace);
    }

    private static List<StackFrame> getModelFramesFromStackTrace(StackTraceElement[] stackTrace) {
        ArrayList arrayList = new ArrayList();
        for (StackTraceElement stackTraceElement : stackTrace) {
            arrayList.add(getModelStackFrame(stackTraceElement));
        }
        return arrayList;
    }

    private static StackFrame getModelStackFrame(StackTraceElement stackTraceElement) {
        StackFrame stackFrame = new StackFrame();
        stackFrame.setClassName(stackTraceElement.getClassName());
        stackFrame.setMethodName(stackTraceElement.getMethodName());
        stackFrame.setLineNumber(Integer.valueOf(stackTraceElement.getLineNumber()));
        stackFrame.setFileName(stackTraceElement.getFileName());
        return stackFrame;
    }

    public static Map<String, String> validateProperties(Map<String, String> properties, String logType) {
        if (properties == null) {
            return null;
        }
        HashMap map = new HashMap();
        Iterator<Map.Entry<String, String>> it = properties.entrySet().iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Map.Entry<String, String> next = it.next();
            String key = next.getKey();
            String value = next.getValue();
            if (map.size() >= 20) {
                AppCenterLog.warn(Crashes.LOG_TAG, String.format("%s : properties cannot contain more than %s items. Skipping other properties.", logType, 20));
                break;
            }
            if (key == null || key.isEmpty()) {
                AppCenterLog.warn(Crashes.LOG_TAG, String.format("%s : a property key cannot be null or empty. Property will be skipped.", logType));
            } else if (value == null) {
                AppCenterLog.warn(Crashes.LOG_TAG, String.format("%s : property '%s' : property value cannot be null. Property '%s' will be skipped.", logType, key, key));
            } else {
                if (key.length() > 125) {
                    AppCenterLog.warn(Crashes.LOG_TAG, String.format("%s : property '%s' : property key length cannot be longer than %s characters. Property key will be truncated.", logType, key, 125));
                    key = key.substring(0, 125);
                }
                if (value.length() > 125) {
                    AppCenterLog.warn(Crashes.LOG_TAG, String.format("%s : property '%s' : property value cannot be longer than %s characters. Property value will be truncated.", logType, key, 125));
                    value = value.substring(0, 125);
                }
                map.put(key, value);
            }
        }
        return map;
    }

    public static void cleanPendingMinidumps() {
        FileManager.cleanDirectory(getPendingMinidumpDirectory());
    }

    public static UUID parseLogFolderUuid(File logFolder) {
        UUID uuidFromString;
        if (logFolder.isDirectory()) {
            try {
                uuidFromString = UUID.fromString(logFolder.getName());
            } catch (IllegalArgumentException e) {
                AppCenterLog.warn(Crashes.LOG_TAG, "Cannot parse minidump folder name to UUID.", e);
                uuidFromString = null;
            }
        } else {
            uuidFromString = null;
        }
        return uuidFromString == null ? UUID.randomUUID() : uuidFromString;
    }

    public static void clearStaticState() {
        sNewMinidumpDirectory = null;
        sErrorLogDirectory = null;
        sPendingMinidumpDirectory = null;
    }
}
