package com.ironsource.sdk.service;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;
import com.iab.omid.library.ironsrc.Omid;
import com.ironsource.environment.DeviceStatus;
import com.ironsource.environment.TokenConstants;
import com.ironsource.sdk.analytics.omid.OMIDManager;
import com.ironsource.sdk.utils.IronSourceQaProperties;
import com.ironsource.sdk.utils.SDKUtils;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class TokenService {
    private static TokenService mInstance;
    private JSONObject tokenData = new JSONObject();

    public static synchronized TokenService getInstance() {
        if (mInstance == null) {
            mInstance = new TokenService();
        }
        return mInstance;
    }

    private TokenService() {
    }

    public void collectOmidParameters() {
        HashMap map = new HashMap();
        map.put("omidVersion", Omid.getVersion());
        map.put("omidPartnerVersion", OMIDManager.OMID_PARTNER_VERSION);
        mInstance.collectDataFromExternalParams(map);
    }

    public void collectQaParameters() {
        if (IronSourceQaProperties.isInitialized()) {
            mInstance.collectDataFromExternalParams(IronSourceQaProperties.getInstance().getParameters());
        }
    }

    synchronized void put(String str, Object obj) {
        try {
            this.tokenData.put(str, obj);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public void collectApplicationUserId(String str) {
        if (str != null) {
            put("applicationUserId", SDKUtils.encodeString(str));
        }
    }

    public void collectApplicationKey(String str) {
        if (str != null) {
            put("applicationKey", SDKUtils.encodeString(str));
        }
    }

    public void collectDataFromActivity(Activity activity) {
        if (activity == null) {
            return;
        }
        if (Build.VERSION.SDK_INT >= 19) {
            put(SDKUtils.encodeString("immersiveMode"), Boolean.valueOf(DeviceStatus.isImmersiveSupported(activity)));
        }
        put("appOrientation", SDKUtils.translateRequestedOrientation(DeviceStatus.getActivityRequestedOrientation(activity)));
    }

    public void collectAdvertisingID(final Activity activity) {
        if (activity == null) {
            return;
        }
        try {
            new Thread(new Runnable() { // from class: com.ironsource.sdk.service.TokenService.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        TokenService.this.updateData(DeviceData.fetchAdvertiserIdData(activity));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }).start();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void collectDataFromDevice(Context context) {
        if (context == null) {
            return;
        }
        updateData(DeviceData.fetchPermanentData(context));
        updateData(DeviceData.fetchMutableData(context));
    }

    public void collectDataFromExternalParams(Map<String, String> map) {
        if (map == null) {
            Log.d("TokenService", "collectDataFromExternalParams params=null");
            return;
        }
        for (String str : map.keySet()) {
            put(str, SDKUtils.encodeString(map.get(str)));
        }
    }

    public void collectDataFromControllerConfig(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        try {
            put(TokenConstants.CHINA_CDN, new JSONObject(str).opt(TokenConstants.CHINA_CDN));
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public void updateData(JSONObject jSONObject) {
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            put(next, jSONObject.opt(next));
        }
    }

    public void updateMetaData(JSONObject jSONObject) {
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            put(TokenConstants.METADATA_KEY_PREFIX + next, jSONObject.opt(next));
        }
    }

    public String getToken(Context context) {
        try {
            return Gibberish.encode(getRawToken(context).toString());
        } catch (Exception unused) {
            return Gibberish.encode(new JSONObject().toString());
        }
    }

    public JSONObject getRawToken(Context context) {
        fetchIndependentData();
        collectDataFromDevice(context);
        try {
            return new JSONObject(this.tokenData.toString());
        } catch (Exception e) {
            e.printStackTrace();
            return new JSONObject();
        }
    }

    public void fetchDependentData(Activity activity, String str, String str2) {
        collectAdvertisingID(activity);
        collectDataFromActivity(activity);
        collectDataFromDevice(activity);
        collectApplicationUserId(str2);
        collectApplicationKey(str);
    }

    public void fetchIndependentData() {
        collectDataFromControllerConfig(SDKUtils.getControllerConfig());
        collectDataFromExternalParams(SDKUtils.getInitSDKParams());
        collectQaParameters();
        collectOmidParameters();
    }
}
