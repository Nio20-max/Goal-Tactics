package com.ironsource.mediationsdk.events;

import android.text.TextUtils;
import com.ironsource.eventsmodule.DataBaseEventsStorage;
import com.ironsource.eventsmodule.EventData;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
abstract class AbstractEventsFormatter {
    int mAdUnit;
    JSONObject mGeneralProperties;
    private String mServerUrl;
    private final String KEY_EVENT_ID = "eventId";
    private final String KEY_TIMESTAMP = DataBaseEventsStorage.EventEntry.COLUMN_NAME_TIMESTAMP;
    private final String KEY_AD_UNIT = "adUnit";
    private final String EVENTS_KEY_IS = "InterstitialEvents";
    private final String EVENTS_KEY_RV = "events";
    private final String EVENTS_KEY_DEFAULT = "events";

    private String getEventsKey(int i) {
        return i != 2 ? "events" : "InterstitialEvents";
    }

    public abstract String format(ArrayList<EventData> arrayList, JSONObject jSONObject);

    protected abstract String getDefaultEventsUrl();

    public abstract String getFormatterType();

    AbstractEventsFormatter() {
    }

    JSONObject createJSONForEvent(EventData eventData) {
        try {
            JSONObject jSONObject = new JSONObject(eventData.getAdditionalData());
            jSONObject.put("eventId", eventData.getEventId());
            jSONObject.put(DataBaseEventsStorage.EventEntry.COLUMN_NAME_TIMESTAMP, eventData.getTimeStamp());
            return jSONObject;
        } catch (JSONException e) {
            e.printStackTrace();
            return null;
        }
    }

    String createDataToSend(JSONArray jSONArray) {
        try {
            if (this.mGeneralProperties == null) {
                return "";
            }
            JSONObject jSONObject = new JSONObject(this.mGeneralProperties.toString());
            jSONObject.put(DataBaseEventsStorage.EventEntry.COLUMN_NAME_TIMESTAMP, IronSourceUtils.getTimeStamp());
            jSONObject.put("adUnit", this.mAdUnit);
            jSONObject.put(getEventsKey(this.mAdUnit), jSONArray);
            return jSONObject.toString();
        } catch (Exception unused) {
            return "";
        }
    }

    String getEventsServerUrl() {
        return TextUtils.isEmpty(this.mServerUrl) ? getDefaultEventsUrl() : this.mServerUrl;
    }

    void setEventsServerUrl(String str) {
        this.mServerUrl = str;
    }
}
