package com.helpshift.campaigns.controllers;

import android.text.TextUtils;
import com.helpshift.app.CampaignAppLifeCycleListener;
import com.helpshift.app.LifecycleListener;
import com.helpshift.campaigns.models.AnalyticsEvent;
import com.helpshift.campaigns.util.constants.DeviceProperties;
import com.helpshift.campaigns.util.constants.NetworkRoutes;
import com.helpshift.controllers.SyncController;
import com.helpshift.network.NetworkDataProvider;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.network.request.Request;
import com.helpshift.network.response.JsonArrayResponseParser;
import com.helpshift.network.response.Response;
import com.helpshift.storage.KeyValueStorage;
import com.helpshift.util.HSJSONUtils;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.concurrent.DispatchQueue;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;

/* JADX INFO: loaded from: classes.dex */
public class AnalyticsEventController implements NetworkDataProvider, LifecycleListener {
    private static final String KEY_ANALYTICS_EVENTS = "kAnalyticsEvents";
    private static final String KEY_RECORDED_EVENTS_MAP = "kRecordedEventsMap";
    private static final String TAG = "Helpshift_AnalyticsCnt";
    KeyValueStorage storage;
    public final SyncController syncController;
    DispatchQueue workerQueue;

    @Override // com.helpshift.network.NetworkDataProvider
    public Request getRequestWithFullData() {
        return null;
    }

    @Override // com.helpshift.app.LifecycleListener
    public void onForeground() {
    }

    @Override // com.helpshift.network.NetworkDataProvider
    public void setBatchSize(Integer num) {
    }

    protected AnalyticsEventController(KeyValueStorage keyValueStorage, DispatchQueue dispatchQueue, SyncController syncController) {
        this.storage = keyValueStorage;
        this.workerQueue = dispatchQueue;
        this.syncController = syncController;
        CampaignAppLifeCycleListener campaignAppLifeCycleListener = HelpshiftContext.getCampaignAppLifeCycleListener();
        if (campaignAppLifeCycleListener != null) {
            campaignAppLifeCycleListener.addLifecycleListener(this);
        }
    }

    public void recordAnalyticsEvent(Integer num, String str, Boolean bool) {
        if (TextUtils.isEmpty(str)) {
            HSLogger.d(TAG, "Encountered empty campaign id for analytics record");
            return;
        }
        AnalyticsEvent analyticsEvent = new AnalyticsEvent(num, str, bool);
        if (isAnalyticsEventRecorded(num, str)) {
            return;
        }
        addEventToStorage(analyticsEvent);
    }

    private void addEventToStorage(final AnalyticsEvent analyticsEvent) {
        this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.controllers.AnalyticsEventController.1
            @Override // java.lang.Runnable
            public void run() {
                AnalyticsEventController.this.addToRecordedEventsMap(analyticsEvent.type, analyticsEvent.campaignId);
                ArrayList arrayList = (ArrayList) AnalyticsEventController.this.storage.get(AnalyticsEventController.KEY_ANALYTICS_EVENTS);
                if (arrayList == null) {
                    arrayList = new ArrayList();
                }
                arrayList.add(analyticsEvent);
                AnalyticsEventController.this.storage.set(AnalyticsEventController.KEY_ANALYTICS_EVENTS, arrayList);
                AnalyticsEventController.this.syncController.incrementDataChangeCount(SyncController.DataTypes.ANALYTICS_EVENT, 1);
            }
        });
    }

    private boolean isAnalyticsEventRecorded(Integer num, String str) {
        List<Integer> list;
        HashMap<String, List<Integer>> recordedEventsMap = getRecordedEventsMap();
        return (recordedEventsMap == null || (list = recordedEventsMap.get(str)) == null || !list.contains(num)) ? false : true;
    }

    void addToRecordedEventsMap(Integer num, String str) {
        HashMap<String, List<Integer>> recordedEventsMap = getRecordedEventsMap();
        if (recordedEventsMap == null) {
            recordedEventsMap = new HashMap<>();
        }
        List<Integer> arrayList = recordedEventsMap.get(str);
        if (arrayList == null) {
            arrayList = new ArrayList<>();
        }
        arrayList.add(num);
        recordedEventsMap.put(str, arrayList);
        this.storage.set(KEY_RECORDED_EVENTS_MAP, recordedEventsMap);
    }

    void removeAnalyticsEventsFromStorage(final String[] strArr) {
        this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.controllers.AnalyticsEventController.2
            @Override // java.lang.Runnable
            public void run() {
                ArrayList<AnalyticsEvent> arrayList = (ArrayList) AnalyticsEventController.this.storage.get(AnalyticsEventController.KEY_ANALYTICS_EVENTS);
                AnalyticsEventController.this.storage.removeKey(AnalyticsEventController.KEY_ANALYTICS_EVENTS);
                ArrayList arrayList2 = new ArrayList(Arrays.asList(strArr));
                ArrayList arrayList3 = new ArrayList();
                for (AnalyticsEvent analyticsEvent : arrayList) {
                    if (!arrayList2.contains(analyticsEvent.eventId)) {
                        arrayList3.add(analyticsEvent);
                    }
                }
                if (arrayList3.size() > 0) {
                    AnalyticsEventController.this.storage.set(AnalyticsEventController.KEY_ANALYTICS_EVENTS, arrayList3);
                }
            }
        });
    }

    private HashMap<String, List<Integer>> getRecordedEventsMap() {
        return (HashMap) this.storage.get(KEY_RECORDED_EVENTS_MAP);
    }

    ArrayList<AnalyticsEvent> getAnalyticsEventsFromStorage() {
        return (ArrayList) this.storage.get(KEY_ANALYTICS_EVENTS);
    }

    @Override // com.helpshift.network.NetworkDataProvider
    public Request getRequest() {
        ArrayList<AnalyticsEvent> analyticsEventsFromStorage = getAnalyticsEventsFromStorage();
        if (analyticsEventsFromStorage == null || analyticsEventsFromStorage.size() <= 0) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (AnalyticsEvent analyticsEvent : analyticsEventsFromStorage) {
            arrayList.add(analyticsEvent.toData());
            arrayList2.add(analyticsEvent.eventId);
        }
        JSONArray jSONArrayFromListOfMaps = HSJSONUtils.fromListOfMaps(arrayList);
        HashMap map = new HashMap();
        map.put("e", jSONArrayFromListOfMaps.toString());
        map.put(DeviceProperties.DeviceKeys.SDK_VERSION, "7.11.1");
        map.put("v", "1.1.0");
        for (Map.Entry<String, Object> entry : ControllerFactory.getInstance().deviceController.getDeviceInfoForPushAnalytics().entrySet()) {
            Object value = entry.getValue();
            if (value != null) {
                map.put(entry.getKey(), value.toString());
            }
        }
        final String[] strArr = (String[]) arrayList2.toArray(new String[0]);
        return new Request(1, NetworkRoutes.ANALYTICS_ROUTE, map, new Response.Listener<JSONArray>() { // from class: com.helpshift.campaigns.controllers.AnalyticsEventController.3
            @Override // com.helpshift.network.response.Response.Listener
            public void onResponse(JSONArray jSONArray, Integer num) {
                this.workerQueue.dispatchAsync(new Runnable() { // from class: com.helpshift.campaigns.controllers.AnalyticsEventController.3.1
                    @Override // java.lang.Runnable
                    public void run() {
                        this.removeAnalyticsEventsFromStorage(strArr);
                        this.syncController.dataSynced(SyncController.DataTypes.ANALYTICS_EVENT, false);
                    }
                });
            }
        }, new Response.ErrorListener() { // from class: com.helpshift.campaigns.controllers.AnalyticsEventController.4
            @Override // com.helpshift.network.response.Response.ErrorListener
            public void onErrorResponse(NetworkError networkError, Integer num) {
                this.syncController.dataSyncFailed(SyncController.DataTypes.ANALYTICS_EVENT, networkError);
            }
        }, new JsonArrayResponseParser());
    }

    @Override // com.helpshift.app.LifecycleListener
    public void onBackground() {
        ArrayList<AnalyticsEvent> analyticsEventsFromStorage = getAnalyticsEventsFromStorage();
        if (analyticsEventsFromStorage == null || analyticsEventsFromStorage.size() <= 0) {
            return;
        }
        this.syncController.setDataChangeCount(SyncController.DataTypes.ANALYTICS_EVENT, analyticsEventsFromStorage.size());
    }
}
