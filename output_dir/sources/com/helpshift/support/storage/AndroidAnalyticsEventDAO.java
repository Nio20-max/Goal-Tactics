package com.helpshift.support.storage;

import com.helpshift.analytics.AnalyticsEventDAO;
import com.helpshift.analytics.dto.AnalyticsEventDTO;
import com.helpshift.common.platform.KVStore;
import com.helpshift.util.StringUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class AndroidAnalyticsEventDAO implements AnalyticsEventDAO {
    private static final String KEY_UNSENT_ANALYTICS_EVENTS = "unsent_analytics_events";
    private static final String KEY_UNSENT_APP_LAUNCH_ANALYTICS_EVENTS = "unsent_app_launch_analytics_events";
    private static final int MAX_APP_LAUNCH_EVENTS_COUNT = 1000;
    private KVStore kvStore;

    public AndroidAnalyticsEventDAO(KVStore kVStore) {
        this.kvStore = kVStore;
    }

    @Override // com.helpshift.analytics.AnalyticsEventDAO
    public void saveUnsentAnalyticsData(String str, HashMap<String, String> map) {
        HashMap<String, HashMap<String, String>> unSentAnalyticFromDB = getUnSentAnalyticFromDB();
        unSentAnalyticFromDB.put(str, map);
        this.kvStore.setSerializable(KEY_UNSENT_ANALYTICS_EVENTS, unSentAnalyticFromDB);
    }

    @Override // com.helpshift.analytics.AnalyticsEventDAO
    public void removeAnalyticsData(String str) {
        if (StringUtils.isEmpty(str)) {
            return;
        }
        HashMap<String, HashMap<String, String>> unSentAnalyticFromDB = getUnSentAnalyticFromDB();
        unSentAnalyticFromDB.remove(str);
        if (unSentAnalyticFromDB.size() == 0) {
            this.kvStore.setSerializable(KEY_UNSENT_ANALYTICS_EVENTS, null);
        } else {
            this.kvStore.setSerializable(KEY_UNSENT_ANALYTICS_EVENTS, unSentAnalyticFromDB);
        }
    }

    @Override // com.helpshift.analytics.AnalyticsEventDAO
    public Map<String, HashMap<String, String>> getUnsentAnalytics() {
        return getUnSentAnalyticFromDB();
    }

    @Override // com.helpshift.analytics.AnalyticsEventDAO
    public void saveUnsentAnalyticsAppLaunchData(AnalyticsEventDTO analyticsEventDTO) {
        List<AnalyticsEventDTO> unsentAnalyticsAppLaunchData = getUnsentAnalyticsAppLaunchData();
        if (unsentAnalyticsAppLaunchData.size() < 1000) {
            ArrayList arrayList = new ArrayList(unsentAnalyticsAppLaunchData);
            arrayList.add(analyticsEventDTO);
            this.kvStore.setSerializable(KEY_UNSENT_APP_LAUNCH_ANALYTICS_EVENTS, arrayList);
        }
    }

    @Override // com.helpshift.analytics.AnalyticsEventDAO
    public List<AnalyticsEventDTO> getUnsentAnalyticsAppLaunchData() {
        Object serializable = this.kvStore.getSerializable(KEY_UNSENT_APP_LAUNCH_ANALYTICS_EVENTS);
        if (serializable == null) {
            return new ArrayList();
        }
        return (ArrayList) serializable;
    }

    @Override // com.helpshift.analytics.AnalyticsEventDAO
    public void removeAnalyticsAppLaunchData() {
        this.kvStore.setSerializable(KEY_UNSENT_APP_LAUNCH_ANALYTICS_EVENTS, null);
    }

    private HashMap<String, HashMap<String, String>> getUnSentAnalyticFromDB() {
        Object serializable = this.kvStore.getSerializable(KEY_UNSENT_ANALYTICS_EVENTS);
        if (serializable == null) {
            return new HashMap<>();
        }
        return (HashMap) serializable;
    }
}
