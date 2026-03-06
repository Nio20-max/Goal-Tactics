package com.appsflyer.internal;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import com.appsflyer.AFLogger;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class cg {
    public static void AFInAppEventType(ac acVar, i iVar, String str, Context context, SharedPreferences sharedPreferences, Integer num, Throwable th) {
        if (iVar.valueOf()) {
            if (ac.AFKeystoreWrapper == null) {
                AFLogger.AFInAppEventParameterName("[GCD-E01] AppsFlyerConversionListener is null - skip gcd");
                return;
            }
            StringBuilder sb = new StringBuilder("[GCD-A01] Loading conversion data. Counter: ");
            sb.append(iVar.onInstallConversionFailureNative);
            AFLogger.AFInAppEventParameterName(sb.toString());
            long j = sharedPreferences.getLong("appsflyerConversionDataCacheExpiration", 0L);
            if (j != 0 && System.currentTimeMillis() - j > 5184000000L) {
                AFLogger.AFInAppEventParameterName("[GCD-E02] Cached conversion data expired");
                ac.values(context, "sixtyDayConversionData");
                ac.valueOf(context, "attributionId", (String) null);
                acVar.AFInAppEventType(context, "appsflyerConversionDataCacheExpiration", 0L);
            }
            if (sharedPreferences.getString("attributionId", null) == null) {
                if (th != null) {
                    StringBuilder sb2 = new StringBuilder("Launch exception: ");
                    sb2.append(th.getMessage());
                    cc.AFInAppEventParameterName(sb2.toString());
                    return;
                } else if (num.intValue() != 200) {
                    cc.AFInAppEventParameterName("Launch status code: ".concat(String.valueOf(num)));
                    return;
                } else {
                    cc ccVar = new cc(acVar, (Application) context.getApplicationContext(), str);
                    ac.valueOf(ccVar.AFInAppEventParameterName, ccVar, 10L, TimeUnit.MILLISECONDS);
                    return;
                }
            }
            if (acVar.valueOf(sharedPreferences, false) <= 1) {
                return;
            }
            try {
                Map<String, Object> mapAFInAppEventParameterName = AFInAppEventParameterName(context);
                if (mapAFInAppEventParameterName == null) {
                    return;
                }
                try {
                    if (!mapAFInAppEventParameterName.containsKey("is_first_launch")) {
                        mapAFInAppEventParameterName.put("is_first_launch", Boolean.FALSE);
                    }
                    cc.values(mapAFInAppEventParameterName);
                } catch (Throwable th2) {
                    AFLogger.valueOf(th2.getLocalizedMessage(), th2);
                }
            } catch (ce e) {
                AFLogger.valueOf(e.getMessage(), e);
            }
        }
    }

    static Map<String, Object> AFInAppEventParameterName(Context context) throws ce {
        String string = ac.AFInAppEventType(context).getString("attributionId", null);
        if (string != null && string.length() > 0) {
            return values(string);
        }
        throw new ce();
    }

    static Map<String, Object> values(String str) {
        HashMap map = new HashMap();
        try {
            JSONObject jSONObject = new JSONObject(str);
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                if (!next.equals("is_cache")) {
                    map.put(next, jSONObject.isNull(next) ? null : jSONObject.get(next));
                }
            }
            return map;
        } catch (JSONException e) {
            AFLogger.valueOf(e.getMessage(), e);
            return null;
        }
    }
}
