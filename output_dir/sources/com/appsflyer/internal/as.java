package com.appsflyer.internal;

import com.android.billingclient.api.Purchase;
import com.appsflyer.AFLogger;
import com.appsflyer.AppsFlyerProperties;
import java.util.List;
import java.util.Map;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class as {
    private final boolean AFInAppEventParameterName;
    public final Map<String, String> AFInAppEventType;
    private final boolean valueOf;
    public final List<Purchase> values;

    public as() {
    }

    static JSONObject AFInAppEventParameterName(String str) {
        JSONObject jSONObject;
        JSONObject jSONObject2 = null;
        try {
            jSONObject = new JSONObject(str);
        } catch (Throwable th) {
            th = th;
        }
        try {
            boolean z = AppsFlyerProperties.getInstance().getBoolean(AppsFlyerProperties.DPM, false);
            if (jSONObject.optBoolean("monitor", false) && !z) {
                ak.AFInAppEventType().AFKeystoreWrapper();
            } else {
                ak.AFInAppEventType().valueOf();
                ak.AFInAppEventType().AFInAppEventParameterName();
            }
            if (!jSONObject.has("ol_id")) {
                return jSONObject;
            }
            String strOptString = jSONObject.optString("ol_scheme", null);
            String strOptString2 = jSONObject.optString("ol_domain", null);
            String strOptString3 = jSONObject.optString("ol_ver", null);
            if (strOptString != null) {
                AppsFlyerProperties.getInstance().set(AppsFlyerProperties.ONELINK_SCHEME, strOptString);
            }
            if (strOptString2 != null) {
                AppsFlyerProperties.getInstance().set(AppsFlyerProperties.ONELINK_DOMAIN, strOptString2);
            }
            if (strOptString3 == null) {
                return jSONObject;
            }
            AppsFlyerProperties.getInstance().set("onelinkVersion", strOptString3);
            return jSONObject;
        } catch (Throwable th2) {
            th = th2;
            jSONObject2 = jSONObject;
            AFLogger.valueOf(th.getMessage(), th);
            ak.AFInAppEventType().valueOf();
            ak.AFInAppEventType().AFInAppEventParameterName();
            return jSONObject2;
        }
    }

    public as(boolean z, boolean z2, List<Purchase> list, Map<String, String> map) {
        this.valueOf = z;
        this.AFInAppEventParameterName = z2;
        this.values = list;
        this.AFInAppEventType = map;
    }

    public final boolean AFInAppEventParameterName() {
        return this.valueOf;
    }

    public final boolean valueOf() {
        return this.AFInAppEventParameterName;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && getClass() == obj.getClass()) {
            as asVar = (as) obj;
            if (this.valueOf != asVar.valueOf || this.AFInAppEventParameterName != asVar.AFInAppEventParameterName || !this.values.equals(asVar.values)) {
                return false;
            }
            Map<String, String> map = this.AFInAppEventType;
            Map<String, String> map2 = asVar.AFInAppEventType;
            if (map != null) {
                return map.equals(map2);
            }
            if (map2 == null) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = (((((this.valueOf ? 1 : 0) * 31) + (this.AFInAppEventParameterName ? 1 : 0)) * 31) + this.values.hashCode()) * 31;
        Map<String, String> map = this.AFInAppEventType;
        return iHashCode + (map != null ? map.hashCode() : 0);
    }
}
