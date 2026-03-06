package com.helpshift.logger;

import android.text.TextUtils;
import android.util.Log;
import com.helpshift.logger.database.LogStorage;
import com.helpshift.logger.logmodels.ILogExtrasModel;
import com.helpshift.logger.model.LogModel;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: compiled from: Logger.java */
/* JADX INFO: loaded from: classes2.dex */
class WorkerThread implements Runnable {
    private LogMessage logMessage;
    private LogStorage logStorage;
    private SimpleDateFormat simpleDateFormat;

    WorkerThread(LogMessage logMessage, LogStorage logStorage, SimpleDateFormat simpleDateFormat) {
        this.logMessage = logMessage;
        this.logStorage = logStorage;
        this.simpleDateFormat = simpleDateFormat;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            if (this.logMessage != null) {
                String str = this.simpleDateFormat.format(new Date(this.logMessage.timeStamp));
                if (!TextUtils.isEmpty(this.logMessage.message) && this.logMessage.message.length() > 5000) {
                    LogMessage logMessage = this.logMessage;
                    logMessage.message = logMessage.message.substring(0, 5000);
                }
                this.logStorage.insert(new LogModel(str, this.logMessage.level, this.logMessage.message, this.logMessage.stacktrace, convertExtrasToJSON(this.logMessage.extras), this.logMessage.sdkVersion));
            }
        } catch (Exception e) {
            Log.e("LogWorkerThread", "Exception in log messages worker : ", e);
        }
    }

    private String convertExtrasToJSON(ILogExtrasModel[] iLogExtrasModelArr) {
        JSONArray jSONArray = new JSONArray();
        if (iLogExtrasModelArr == null || iLogExtrasModelArr.length == 0) {
            return jSONArray.toString();
        }
        for (ILogExtrasModel iLogExtrasModel : iLogExtrasModelArr) {
            if (iLogExtrasModel != null) {
                if (jSONArray.length() > 20) {
                    break;
                }
                JSONObject jSONObject = (JSONObject) iLogExtrasModel.toJSONObject();
                if (jSONObject.toString().length() <= 5000) {
                    jSONArray.put(jSONObject);
                }
            }
        }
        return jSONArray.toString();
    }
}
