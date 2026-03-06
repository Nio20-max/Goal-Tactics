package com.ironsource.mediationsdk;

import android.app.Activity;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Build;
import android.security.NetworkSecurityPolicy;
import android.text.TextUtils;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.facebook.internal.ServerProtocol;
import com.ironsource.environment.ApplicationContext;
import com.ironsource.environment.DeviceStatus;
import com.ironsource.environment.TokenConstants;
import com.ironsource.mediationsdk.logger.IronLog;
import com.ironsource.mediationsdk.utils.AuctionSettings;
import com.ironsource.mediationsdk.utils.ContextProvider;
import com.ironsource.mediationsdk.utils.IronSourceAES;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class AuctionDataUtils {
    public static final String AUCTION_LOSS_MACRO = "${AUCTION_LOSS}";
    public static final String AUCTION_MBR_MACRO = "${AUCTION_MBR}";
    public static final String AUCTION_PRICE_MACRO = "${AUCTION_PRICE}";
    public static final String AUCTION_RESPONSE_KEY_AD_MARKUP = "adMarkup";
    public static final String AUCTION_RESPONSE_KEY_AUCTION_ID = "auctionId";
    public static final String AUCTION_RESPONSE_KEY_BURL = "burl";
    public static final String AUCTION_RESPONSE_KEY_IMPRESSION_DATA = "armData";
    public static final String AUCTION_RESPONSE_KEY_INSTANCE = "instance";
    public static final String AUCTION_RESPONSE_KEY_LURL = "lurl";
    public static final String AUCTION_RESPONSE_KEY_NOTIFICATIONS = "notifications";
    public static final String AUCTION_RESPONSE_KEY_NURL = "nurl";
    public static final String AUCTION_RESPONSE_KEY_PRICE = "price";
    public static final String AUCTION_RESPONSE_KEY_SERVER_DATA = "serverData";
    public static final String AUCTION_RESPONSE_KEY_SETTINGS = "settings";
    public static final String AUCTION_RESPONSE_KEY_WATERFALL = "waterfall";
    private static final String AUCTION_RESPONSE_SERVER_DATA_ADM_KEY = "adMarkup";
    private static final String AUCTION_RESPONSE_SERVER_DATA_MARKET_PLACE_DEMAND_TYPE_KEY = "dynamicDemandSource";
    private static final String AUCTION_RESPONSE_SERVER_DATA_PARAMS_KEY = "params";
    public static final String DYNAMIC_DEMAND_SOURCE_MACRO = "${DYNAMIC_DEMAND_SOURCE}";
    public static final String INSTANCE_NAME_MACRO = "${INSTANCE}";
    public static final String INSTANCE_TYPE_MACRO = "${INSTANCE_TYPE}";
    public static final String PLACEMENT_NAME_MACRO = "${PLACEMENT_NAME}";
    private static final String TAG = "AuctionDataUtils";
    private static AuctionDataUtils sInstance = new AuctionDataUtils();
    private String mBrowserUserAgent = "";

    private enum SecureFlag {
        NOT_SECURE,
        SECURE
    }

    public static AuctionDataUtils getInstance() {
        return sInstance;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x002f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    com.ironsource.mediationsdk.AuctionDataUtils.AuctionData getAuctionDataFromResponse(org.json.JSONObject r6) throws org.json.JSONException {
        /*
            r5 = this;
            com.ironsource.mediationsdk.AuctionDataUtils$AuctionData r0 = new com.ironsource.mediationsdk.AuctionDataUtils$AuctionData
            r0.<init>()
            java.lang.String r1 = "auctionId"
            java.lang.String r1 = r6.getString(r1)
            com.ironsource.mediationsdk.AuctionDataUtils.AuctionData.access$002(r0, r1)
            java.lang.String r1 = "settings"
            boolean r2 = r6.has(r1)
            if (r2 == 0) goto L2f
            org.json.JSONObject r1 = r6.getJSONObject(r1)
            com.ironsource.mediationsdk.AuctionResponseItem r2 = new com.ironsource.mediationsdk.AuctionResponseItem
            r2.<init>(r1)
            com.ironsource.mediationsdk.AuctionDataUtils.AuctionData.access$102(r0, r2)
            java.lang.String r2 = "armData"
            boolean r3 = r1.has(r2)
            if (r3 == 0) goto L2f
            org.json.JSONObject r1 = r1.optJSONObject(r2)
            goto L30
        L2f:
            r1 = 0
        L30:
            java.util.ArrayList r2 = new java.util.ArrayList
            r2.<init>()
            com.ironsource.mediationsdk.AuctionDataUtils.AuctionData.access$202(r0, r2)
            java.lang.String r2 = "waterfall"
            org.json.JSONArray r6 = r6.getJSONArray(r2)
            r2 = 0
        L3f:
            int r3 = r6.length()
            if (r2 >= r3) goto L7f
            com.ironsource.mediationsdk.AuctionResponseItem r3 = new com.ironsource.mediationsdk.AuctionResponseItem
            org.json.JSONObject r4 = r6.getJSONObject(r2)
            r3.<init>(r4, r1)
            boolean r4 = r3.isValid()
            if (r4 == 0) goto L5e
            java.util.List r4 = com.ironsource.mediationsdk.AuctionDataUtils.AuctionData.access$200(r0)
            r4.add(r3)
            int r2 = r2 + 1
            goto L3f
        L5e:
            r6 = 1002(0x3ea, float:1.404E-42)
            com.ironsource.mediationsdk.AuctionDataUtils.AuctionData.access$302(r0, r6)
            java.lang.StringBuilder r6 = new java.lang.StringBuilder
            r6.<init>()
            java.lang.String r1 = "waterfall "
            r6.append(r1)
            r6.append(r2)
            java.lang.String r6 = r6.toString()
            com.ironsource.mediationsdk.AuctionDataUtils.AuctionData.access$402(r0, r6)
            org.json.JSONException r6 = new org.json.JSONException
            java.lang.String r0 = "invalid response"
            r6.<init>(r0)
            throw r6
        L7f:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ironsource.mediationsdk.AuctionDataUtils.getAuctionDataFromResponse(org.json.JSONObject):com.ironsource.mediationsdk.AuctionDataUtils$AuctionData");
    }

    public void setBrowserUserAgent() {
        IronLog.INTERNAL.verbose("");
        final Activity currentActiveActivity = ContextProvider.getInstance().getCurrentActiveActivity();
        if (currentActiveActivity != null) {
            if (Build.VERSION.SDK_INT >= 17) {
                IronLog.INTERNAL.verbose("from web settings");
                try {
                    String defaultUserAgent = WebSettings.getDefaultUserAgent(currentActiveActivity);
                    this.mBrowserUserAgent = defaultUserAgent;
                    IronSourceUtils.saveBrowserUserAgent(currentActiveActivity, defaultUserAgent);
                    return;
                } catch (Exception unused) {
                    return;
                }
            }
            IronLog.INTERNAL.verbose("from web view");
            ContextProvider.getInstance().runOnUIThread(new Runnable() { // from class: com.ironsource.mediationsdk.AuctionDataUtils.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        WebView webView = new WebView(currentActiveActivity);
                        webView.setLayerType(1, null);
                        AuctionDataUtils.this.mBrowserUserAgent = webView.getSettings().getUserAgentString();
                        IronLog.INTERNAL.verbose("mBrowserUserAgent = " + AuctionDataUtils.this.mBrowserUserAgent);
                        webView.destroy();
                        IronSourceUtils.saveBrowserUserAgent(currentActiveActivity, AuctionDataUtils.this.mBrowserUserAgent);
                    } catch (Exception unused2) {
                    }
                }
            });
        }
    }

    public String getBrowserUserAgent() {
        Context applicationContext;
        if (this.mBrowserUserAgent.isEmpty() && (applicationContext = ContextProvider.getInstance().getApplicationContext()) != null) {
            return IronSourceUtils.getBrowserUserAgent(applicationContext);
        }
        return this.mBrowserUserAgent;
    }

    private String getDeviceType() {
        return DeviceStatus.getIsTablet(ContextProvider.getInstance().getCurrentActiveActivity()) ? "Tablet" : "Phone";
    }

    private String getDeviceLang() {
        String language = Locale.getDefault().getLanguage();
        IronLog.INTERNAL.verbose("lang = " + language);
        return language;
    }

    private SecureFlag getAuctionSecureFlag() {
        SecureFlag secureFlag;
        SecureFlag secureFlag2 = SecureFlag.SECURE;
        if (Build.VERSION.SDK_INT >= 28) {
            secureFlag = NetworkSecurityPolicy.getInstance().isCleartextTrafficPermitted() ? SecureFlag.NOT_SECURE : SecureFlag.SECURE;
        } else if (Build.VERSION.SDK_INT >= 23) {
            secureFlag = (ContextProvider.getInstance().getApplicationContext().getApplicationInfo().flags & 134217728) != 0 ? SecureFlag.NOT_SECURE : SecureFlag.SECURE;
        } else {
            secureFlag = SecureFlag.NOT_SECURE;
        }
        IronLog.INTERNAL.verbose("secureFlag = " + secureFlag);
        return secureFlag;
    }

    public AuctionResponseItem getAuctionResponseItem(String str, List<AuctionResponseItem> list) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getInstanceName().equals(str)) {
                return list.get(i);
            }
        }
        return null;
    }

    JSONObject enrichToken(Context context, Map<String, Object> map, List<String> list, AuctionHistory auctionHistory, int i, String str, AuctionSettings auctionSettings, ISBannerSize iSBannerSize) throws JSONException {
        Object storedPerformanceForInstance;
        String orGenerateOnceUniqueIdentifier;
        String[] advertisingIdInfo;
        JSONObject jSONObject = new JSONObject();
        Iterator<String> it = map.keySet().iterator();
        while (true) {
            storedPerformanceForInstance = "";
            if (!it.hasNext()) {
                break;
            }
            String next = it.next();
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put(IronSourceConstants.EVENTS_INSTANCE_TYPE, 2);
            jSONObject2.put("biddingAdditionalData", new JSONObject((Map) map.get(next)));
            if (auctionHistory != null) {
                storedPerformanceForInstance = auctionHistory.getStoredPerformanceForInstance(next);
            }
            jSONObject2.put("performance", storedPerformanceForInstance);
            jSONObject.put(next, jSONObject2);
        }
        if (list != null) {
            for (String str2 : list) {
                JSONObject jSONObject3 = new JSONObject();
                jSONObject3.put(IronSourceConstants.EVENTS_INSTANCE_TYPE, 1);
                jSONObject3.put("performance", auctionHistory != null ? auctionHistory.getStoredPerformanceForInstance(str2) : "");
                jSONObject.put(str2, jSONObject3);
            }
        }
        ConcurrentHashMap<String, List<String>> metaData = AdapterRepository.getInstance().getMetaData();
        JSONObject jSONObject4 = new JSONObject();
        for (Map.Entry<String, List<String>> entry : metaData.entrySet()) {
            jSONObject4.put(entry.getKey(), TextUtils.join(",", entry.getValue()));
        }
        JSONObject jSONObject5 = new JSONObject();
        jSONObject5.put("applicationUserId", IronSourceObject.getInstance().getIronSourceUserId());
        Boolean consent = IronSourceObject.getInstance().getConsent();
        if (consent != null) {
            jSONObject5.put("consent", consent.booleanValue() ? 1 : 0);
        }
        jSONObject5.put("mobileCarrier", DeviceStatus.getMobileCarrier(context));
        jSONObject5.put("connectionType", IronSourceUtils.getConnectionType(context));
        jSONObject5.put(TokenConstants.DEVICE_OS, "android");
        jSONObject5.put(TokenConstants.DEVICE_WIDTH, context.getResources().getConfiguration().screenWidthDp);
        jSONObject5.put(TokenConstants.DEVICE_HEIGHT, context.getResources().getConfiguration().screenHeightDp);
        jSONObject5.put("deviceOSVersion", Build.VERSION.SDK_INT + "(" + Build.VERSION.RELEASE + ")");
        jSONObject5.put("deviceModel", Build.MODEL);
        jSONObject5.put(TokenConstants.DEVICE_MAKE, Build.MANUFACTURER);
        jSONObject5.put("bundleId", context.getPackageName());
        jSONObject5.put("appVersion", ApplicationContext.getPublisherApplicationVersion(context, context.getPackageName()));
        jSONObject5.put(TokenConstants.CLIENT_TIMESTAMP, new Date().getTime());
        jSONObject5.put("browserUserAgent", getBrowserUserAgent());
        jSONObject5.put("deviceType", getDeviceType());
        jSONObject5.put("deviceLang", getDeviceLang());
        jSONObject5.put("secure", getAuctionSecureFlag().ordinal());
        if (iSBannerSize != null) {
            jSONObject5.put("bannerSize", iSBannerSize.getDescription());
            jSONObject5.put("bannerWidth", iSBannerSize.getWidth());
            jSONObject5.put("bannerHeight", iSBannerSize.getHeight());
        }
        boolean zBooleanValue = false;
        try {
            advertisingIdInfo = DeviceStatus.getAdvertisingIdInfo(context);
        } catch (Exception unused) {
        }
        if (advertisingIdInfo == null || advertisingIdInfo.length != 2) {
            orGenerateOnceUniqueIdentifier = "";
        } else {
            orGenerateOnceUniqueIdentifier = !TextUtils.isEmpty(advertisingIdInfo[0]) ? advertisingIdInfo[0] : "";
            try {
                zBooleanValue = Boolean.valueOf(advertisingIdInfo[1]).booleanValue();
            } catch (Exception unused2) {
            }
        }
        if (TextUtils.isEmpty(orGenerateOnceUniqueIdentifier)) {
            orGenerateOnceUniqueIdentifier = DeviceStatus.getOrGenerateOnceUniqueIdentifier(context);
            if (!TextUtils.isEmpty(orGenerateOnceUniqueIdentifier)) {
                storedPerformanceForInstance = IronSourceConstants.TYPE_UUID;
            }
        } else {
            storedPerformanceForInstance = IronSourceConstants.TYPE_GAID;
        }
        if (!TextUtils.isEmpty(orGenerateOnceUniqueIdentifier)) {
            jSONObject5.put(TokenConstants.MINIMIZED_ADVERTISING_ID, orGenerateOnceUniqueIdentifier);
            jSONObject5.put(TokenConstants.ADVERTISING_ID_TYPE, storedPerformanceForInstance);
            jSONObject5.put("isLimitAdTrackingEnabled", zBooleanValue ? ServerProtocol.DIALOG_RETURN_SCOPES_TRUE : "false");
        }
        JSONObject jSONObject6 = new JSONObject();
        jSONObject6.put("applicationKey", IronSourceObject.getInstance().getIronSourceAppKey());
        jSONObject6.put("SDKVersion", IronSourceUtils.getSDKVersion());
        jSONObject6.put("clientParams", jSONObject5);
        jSONObject6.put("sessionDepth", i);
        jSONObject6.put(TokenConstants.SESSION_ID, str);
        jSONObject6.put("instances", jSONObject);
        jSONObject6.put("auctionData", auctionSettings.getAuctionData());
        jSONObject6.put("metaData", jSONObject4);
        return jSONObject6;
    }

    JSONObject createToken(JSONObject jSONObject, List<String> list) {
        String str;
        JSONObject jSONObjectFetchNativeKeysListFromMinimizedToken = fetchNativeKeysListFromMinimizedToken(TokenDataService.getInstance().getTokenData(), list);
        JSONObject playerTokenWithMinimizedKeyParams = getPlayerTokenWithMinimizedKeyParams(jSONObject, list);
        Iterator<String> itKeys = playerTokenWithMinimizedKeyParams.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            try {
                if (jSONObjectFetchNativeKeysListFromMinimizedToken.has(next)) {
                    str = next + "_1";
                } else {
                    str = next;
                }
                jSONObjectFetchNativeKeysListFromMinimizedToken.put(str, playerTokenWithMinimizedKeyParams.opt(next));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return jSONObjectFetchNativeKeysListFromMinimizedToken;
    }

    String getMinimizedKeyParamFromMap(HashMap<String, String> map, String str) {
        return map.containsKey(str) ? map.get(str) : str;
    }

    private JSONObject getPlayerTokenWithMinimizedKeyParams(JSONObject jSONObject, List<String> list) {
        String minimizedKeyParamFromMap;
        JSONObject jSONObject2 = new JSONObject();
        if (jSONObject != null) {
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                try {
                    minimizedKeyParamFromMap = getMinimizedKeyParamFromMap(TokenConstants.minimizedTokenKeyNames, next);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if ((list.isEmpty() && !TokenConstants.defaultNativeTokenKeysToInclude.contains(minimizedKeyParamFromMap) && !minimizedKeyParamFromMap.startsWith(TokenConstants.METADATA_KEY_PREFIX)) || list.contains(minimizedKeyParamFromMap)) {
                    jSONObject2.put(minimizedKeyParamFromMap, jSONObject.opt(next));
                }
            }
        }
        return jSONObject2;
    }

    private JSONObject fetchNativeKeysListFromMinimizedToken(JSONObject jSONObject, List<String> list) {
        JSONObject jSONObject2 = new JSONObject();
        if (jSONObject != null) {
            Iterator<String> itKeys = jSONObject.keys();
            if (list.isEmpty()) {
                list = TokenConstants.defaultNativeTokenKeysToInclude;
            }
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                try {
                    if (list.contains(next)) {
                        jSONObject2.put(next, jSONObject.opt(next));
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return jSONObject2;
    }

    String encryptToken(JSONObject jSONObject) {
        return IronSourceAES.encode(IronSourceUtils.KEY, jSONObject.toString());
    }

    JSONObject decodeAdmResponse(String str) {
        try {
            return new JSONObject(IronSourceAES.decode(IronSourceUtils.KEY, str));
        } catch (Exception unused) {
            return null;
        }
    }

    public String enrichNotificationURL(String str, String str2, int i, String str3, String str4, String str5, String str6, String str7) {
        return str.replace(AUCTION_PRICE_MACRO, str4).replace(AUCTION_LOSS_MACRO, str6).replace(AUCTION_MBR_MACRO, str5).replace(INSTANCE_NAME_MACRO, str2).replace(INSTANCE_TYPE_MACRO, Integer.toString(i)).replace(DYNAMIC_DEMAND_SOURCE_MACRO, str3).replace(PLACEMENT_NAME_MACRO, str7);
    }

    public String enrichNotificationURL(String str, int i, AuctionResponseItem auctionResponseItem, String str2, String str3, String str4) {
        String price = auctionResponseItem.getPrice();
        return enrichNotificationURL(str, auctionResponseItem.getInstanceName(), i, getInstance().getDynamicDemandSourceIdFromServerData(auctionResponseItem.getServerData()), price, getInstance().getBidRatio(price, str2), str3, str4);
    }

    void sendResponse(String str) {
        new ImpressionHttpTask().execute(str);
    }

    public static class AuctionData {
        private String mAuctionId;
        private int mErrorCode;
        private String mErrorMessage;
        private AuctionResponseItem mGenericNotifications;
        private List<AuctionResponseItem> mWaterfall;

        public String getAuctionId() {
            return this.mAuctionId;
        }

        public List<AuctionResponseItem> getWaterfall() {
            return this.mWaterfall;
        }

        public AuctionResponseItem getGenericNotifications() {
            return this.mGenericNotifications;
        }

        public int getErrorCode() {
            return this.mErrorCode;
        }

        public String getErrorMessage() {
            return this.mErrorMessage;
        }
    }

    static class ImpressionHttpTask extends AsyncTask<String, Void, Boolean> {
        private static final int SERVER_REQUEST_TIMEOUT = 15000;

        ImpressionHttpTask() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public Boolean doInBackground(String... strArr) {
            try {
                HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(strArr[0]).openConnection();
                httpURLConnection.setRequestMethod("GET");
                httpURLConnection.setReadTimeout(SERVER_REQUEST_TIMEOUT);
                httpURLConnection.setConnectTimeout(SERVER_REQUEST_TIMEOUT);
                httpURLConnection.connect();
                int responseCode = httpURLConnection.getResponseCode();
                httpURLConnection.disconnect();
                return Boolean.valueOf(responseCode == 200);
            } catch (Exception unused) {
                return false;
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(Boolean bool) {
            super.onPostExecute(bool);
        }
    }

    public Map<String, String> getAuctionResponseServerDataParams(String str) {
        HashMap map = new HashMap();
        try {
            JSONObject jSONObject = new JSONObject(str);
            if (jSONObject.has("params")) {
                JSONObject jSONObject2 = jSONObject.getJSONObject("params");
                Iterator<String> itKeys = jSONObject2.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    Object obj = jSONObject2.get(next);
                    if (obj instanceof String) {
                        map.put(next, (String) obj);
                    }
                }
            }
        } catch (JSONException unused) {
        }
        return map;
    }

    public String getAdmFromServerData(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            return jSONObject.has("adMarkup") ? jSONObject.getString("adMarkup") : str;
        } catch (JSONException unused) {
            return str;
        }
    }

    public String getDynamicDemandSourceIdFromServerData(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            if (!jSONObject.has("params")) {
                return "";
            }
            JSONObject jSONObject2 = jSONObject.getJSONObject("params");
            return jSONObject2.has("dynamicDemandSource") ? jSONObject2.getString("dynamicDemandSource") : "";
        } catch (JSONException unused) {
            return "";
        }
    }

    private String getBidRatio(String str, String str2) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return "";
        }
        double d = Double.parseDouble(str);
        return Double.parseDouble(str2) == 0.0d ? "" : String.valueOf(Math.round((d / r7) * 1000.0d) / 1000.0d);
    }
}
