package com.ironsource.mediationsdk.logger;

import com.facebook.appevents.internal.ViewHierarchyConstants;
import com.facebook.share.internal.ShareConstants;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.ironsource.eventsmodule.DataBaseEventsStorage;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
class ServerLogEntry {
    private int mLogLevel;
    private String mMessage;
    private IronSourceLogger.IronSourceTag mTag;
    private String mTimetamp;

    public ServerLogEntry(IronSourceLogger.IronSourceTag ironSourceTag, String str, String str2, int i) {
        this.mTag = ironSourceTag;
        this.mTimetamp = str;
        this.mMessage = str2;
        this.mLogLevel = i;
    }

    public JSONObject toJSON() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(DataBaseEventsStorage.EventEntry.COLUMN_NAME_TIMESTAMP, this.mTimetamp);
            jSONObject.put(ViewHierarchyConstants.TAG_KEY, this.mTag);
            jSONObject.put(FirebaseAnalytics.Param.LEVEL, this.mLogLevel);
            jSONObject.put(ShareConstants.WEB_DIALOG_PARAM_MESSAGE, this.mMessage);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jSONObject;
    }

    public int getLogLevel() {
        return this.mLogLevel;
    }
}
