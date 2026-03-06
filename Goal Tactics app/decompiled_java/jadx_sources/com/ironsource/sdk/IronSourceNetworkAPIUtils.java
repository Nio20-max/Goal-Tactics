package com.ironsource.sdk;

import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class IronSourceNetworkAPIUtils {
    static String manual_rewarded_instance_prefix = "ManRewInst_";

    public static String generateInstanceId(JSONObject jSONObject) {
        if (jSONObject.optBoolean("rewarded")) {
            return manual_rewarded_instance_prefix + jSONObject.optString("name");
        }
        return jSONObject.optString("name");
    }
}
