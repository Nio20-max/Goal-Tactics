package com.helpshift.analytics;

import com.helpshift.analytics.dto.AnalyticsEventDTO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public interface AnalyticsEventDAO {
    Map<String, HashMap<String, String>> getUnsentAnalytics();

    List<AnalyticsEventDTO> getUnsentAnalyticsAppLaunchData();

    void removeAnalyticsAppLaunchData();

    void removeAnalyticsData(String str);

    void saveUnsentAnalyticsAppLaunchData(AnalyticsEventDTO analyticsEventDTO);

    void saveUnsentAnalyticsData(String str, HashMap<String, String> map);
}
