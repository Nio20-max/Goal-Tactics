package com.microsoft.appcenter.crashes;

import android.content.Context;
import com.microsoft.appcenter.crashes.ingestion.models.ErrorAttachmentLog;
import com.microsoft.appcenter.crashes.ingestion.models.Exception;
import com.microsoft.appcenter.crashes.model.ErrorReport;
import com.microsoft.appcenter.crashes.utils.ErrorLogHelper;
import com.microsoft.appcenter.utils.AppCenterLog;
import com.microsoft.appcenter.utils.DeviceInfoHelper;
import com.microsoft.appcenter.utils.async.AppCenterFuture;
import com.microsoft.appcenter.utils.storage.FileManager;
import java.io.File;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/* JADX INFO: loaded from: classes2.dex */
public class WrapperSdkExceptionManager {
    private static final String DATA_FILE_EXTENSION = ".dat";
    static final Map<String, String> sWrapperExceptionDataContainer = new HashMap();

    WrapperSdkExceptionManager() {
    }

    public static UUID saveWrapperException(Thread thread, Throwable throwable, Exception modelException, String rawSerializedException) {
        try {
            UUID uuidSaveUncaughtException = Crashes.getInstance().saveUncaughtException(thread, throwable, modelException);
            if (uuidSaveUncaughtException != null && rawSerializedException != null) {
                sWrapperExceptionDataContainer.put(uuidSaveUncaughtException.toString(), rawSerializedException);
                File file = getFile(uuidSaveUncaughtException);
                FileManager.write(file, rawSerializedException);
                AppCenterLog.debug(Crashes.LOG_TAG, "Saved raw wrapper exception data into " + file);
            }
            return uuidSaveUncaughtException;
        } catch (Exception e) {
            AppCenterLog.error(Crashes.LOG_TAG, "Failed to save wrapper exception data to file", e);
            return null;
        }
    }

    public static void deleteWrapperExceptionData(UUID errorId) {
        if (errorId == null) {
            AppCenterLog.error(Crashes.LOG_TAG, "Failed to delete wrapper exception data: null errorId");
            return;
        }
        File file = getFile(errorId);
        if (file.exists()) {
            if (loadWrapperExceptionData(errorId) == null) {
                AppCenterLog.error(Crashes.LOG_TAG, "Failed to load wrapper exception data.");
            }
            FileManager.delete(file);
        }
    }

    public static String loadWrapperExceptionData(UUID errorId) {
        String str = null;
        if (errorId == null) {
            AppCenterLog.error(Crashes.LOG_TAG, "Failed to load wrapper exception data: null errorId");
            return null;
        }
        Map<String, String> map = sWrapperExceptionDataContainer;
        String str2 = map.get(errorId.toString());
        if (str2 != null) {
            return str2;
        }
        File file = getFile(errorId);
        if (file.exists() && (str = FileManager.read(file)) != null) {
            map.put(errorId.toString(), str);
        }
        return str;
    }

    private static File getFile(UUID errorId) {
        return new File(ErrorLogHelper.getErrorStorageDirectory(), errorId.toString() + DATA_FILE_EXTENSION);
    }

    public static String trackException(Exception modelException, Map<String, String> properties, Iterable<ErrorAttachmentLog> attachments) {
        return Crashes.getInstance().queueException(modelException, properties, attachments).toString();
    }

    public static void setAutomaticProcessing(boolean automaticProcessing) {
        Crashes.getInstance().setAutomaticProcessing(automaticProcessing);
    }

    public static AppCenterFuture<Collection<ErrorReport>> getUnprocessedErrorReports() {
        return Crashes.getInstance().getUnprocessedErrorReports();
    }

    public static AppCenterFuture<Boolean> sendCrashReportsOrAwaitUserConfirmation(Collection<String> filteredReportIds) {
        return Crashes.getInstance().sendCrashReportsOrAwaitUserConfirmation(filteredReportIds);
    }

    public static ErrorReport buildHandledErrorReport(Context context, String errorReportId) {
        ErrorReport errorReport = new ErrorReport();
        errorReport.setId(errorReportId);
        errorReport.setAppErrorTime(new Date());
        errorReport.setAppStartTime(new Date(Crashes.getInstance().getInitializeTimestamp()));
        try {
            errorReport.setDevice(Crashes.getInstance().getDeviceInfo(context));
        } catch (DeviceInfoHelper.DeviceInfoException unused) {
            AppCenterLog.warn(Crashes.LOG_TAG, "Handled error report cannot get device info, errorReportId=" + errorReportId);
        }
        return errorReport;
    }

    public static void sendErrorAttachments(String errorReportId, Iterable<ErrorAttachmentLog> attachments) {
        Crashes.getInstance().sendErrorAttachments(errorReportId, attachments);
    }
}
