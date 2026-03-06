package com.ironsource.sdk.Events;

import android.app.Activity;
import android.util.Pair;
import com.ironsource.eventsTracker.EventsConfiguration;
import com.ironsource.sdk.Events.ISNEventsBaseData;
import com.ironsource.sdk.constants.Events;
import com.ironsource.sdk.data.DemandSource;
import com.ironsource.sdk.data.SSAEnums;
import java.util.ArrayList;
import java.util.Map;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class ISNEventsUtils {
    public static ISNEventsBaseData createEventsBaseData(Activity activity, String str, String str2, Map<String, String> map) throws Exception {
        ISNEventsBaseData.Builder builder = new ISNEventsBaseData.Builder();
        if (map != null && map.containsKey(Events.SESSION_ID)) {
            builder.setSessionId(map.get(Events.SESSION_ID));
        }
        if (activity != null) {
            builder.setContext(activity.getApplicationContext());
        }
        return builder.setUserId(str).setApplicationKey(str2).build();
    }

    public static EventsConfiguration createConfigurations(JSONObject jSONObject) {
        return new EventsConfiguration.Builder(jSONObject.optString(Events.END_POINT)).setHttpMethodGet().setEnableEvents(jSONObject.optBoolean("enabled")).setFormatter(new ISNEventsFormatter()).addHeaders(createHeaders()).setAllowLogs(false).build();
    }

    private static ArrayList<Pair<String, String>> createHeaders() {
        ArrayList<Pair<String, String>> arrayList = new ArrayList<>();
        arrayList.add(new Pair<>("Content-Type", Events.APP_JSON));
        arrayList.add(new Pair<>(Events.CHARSET, Events.CHARSET_FORMAT));
        return arrayList;
    }

    public static boolean getIsBiddingInstance(DemandSource demandSource) {
        if (demandSource == null || demandSource.getExtraParams().get("inAppBidding") == null) {
            return false;
        }
        return Boolean.parseBoolean(demandSource.getExtraParams().get("inAppBidding"));
    }

    public static SSAEnums.ProductType getProductType(DemandSource demandSource, SSAEnums.ProductType productType) {
        return (demandSource == null || demandSource.getExtraParams() == null || demandSource.getExtraParams().get("rewarded") == null) ? productType : Boolean.parseBoolean(demandSource.getExtraParams().get("rewarded")) ? SSAEnums.ProductType.RewardedVideo : SSAEnums.ProductType.Interstitial;
    }
}
