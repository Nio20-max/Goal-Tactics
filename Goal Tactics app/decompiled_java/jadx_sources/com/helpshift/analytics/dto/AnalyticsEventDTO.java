package com.helpshift.analytics.dto;

import com.helpshift.analytics.AnalyticsEventType;
import java.io.Serializable;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class AnalyticsEventDTO implements Serializable {
    public final Map<String, Object> data;
    public final String eventId;
    public final String timeStamp;
    public final AnalyticsEventType type;

    public AnalyticsEventDTO(String str, AnalyticsEventType analyticsEventType, Map<String, Object> map, String str2) {
        this.eventId = str;
        this.type = analyticsEventType;
        this.data = map;
        this.timeStamp = str2;
    }
}
