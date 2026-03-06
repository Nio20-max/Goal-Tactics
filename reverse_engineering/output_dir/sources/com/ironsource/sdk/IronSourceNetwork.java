package com.ironsource.sdk;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;
import com.ironsource.eventsTracker.EventsConfiguration;
import com.ironsource.sdk.Events.ISNEventsTracker;
import com.ironsource.sdk.Events.ISNEventsUtils;
import com.ironsource.sdk.ISNAdView.ISNAdView;
import com.ironsource.sdk.agent.IronSourceAdsPublisherAgent;
import com.ironsource.sdk.listeners.OnBannerListener;
import com.ironsource.sdk.listeners.OnOfferWallListener;
import com.ironsource.sdk.service.TokenService;
import com.ironsource.sdk.utils.Logger;
import com.ironsource.sdk.utils.SDKUtils;
import java.util.Map;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class IronSourceNetwork {
    static final String TAG = "IronSourceNetwork";
    private static IronSourceNetworkAPI ironSourceNetwork;
    private static JSONObject mConsentParams;

    public static synchronized void initSDK(Activity activity, String str, String str2, Map<String, String> map) {
        if (TextUtils.isEmpty(str)) {
            Logger.e(TAG, "applicationKey is NULL");
            return;
        }
        if (ironSourceNetwork == null) {
            SDKUtils.setInitSDKParams(map);
            try {
                JSONObject jSONObjectOptJSONObject = SDKUtils.getNetworkConfiguration().optJSONObject("events");
                if (jSONObjectOptJSONObject != null) {
                    initSDK5EventTracker(activity, jSONObjectOptJSONObject, str2, str, map);
                }
            } catch (Exception e) {
                Logger.e(TAG, "Failed to init event tracker: " + e.getMessage());
            }
            ironSourceNetwork = IronSourceAdsPublisherAgent.createInstance(activity, str, str2);
            applyConsentInfo(mConsentParams);
        }
    }

    private static void initSDK5EventTracker(Activity activity, JSONObject jSONObject, String str, String str2, Map<String, String> map) throws Exception {
        EventsConfiguration eventsConfigurationCreateConfigurations = ISNEventsUtils.createConfigurations(jSONObject);
        if (eventsConfigurationCreateConfigurations.areEventsEnabled()) {
            ISNEventsTracker.init(eventsConfigurationCreateConfigurations, ISNEventsUtils.createEventsBaseData(activity, str, str2, map));
        }
    }

    private static synchronized void validateInitSDK() throws Exception {
        if (ironSourceNetwork == null) {
            throw new NullPointerException("Call initSDK first");
        }
    }

    public static synchronized void loadAd(IronSourceAdInstance ironSourceAdInstance, Map<String, String> map) throws Exception {
        validateInitSDK();
        ironSourceNetwork.loadAd(ironSourceAdInstance, map);
    }

    public static String getVersion() {
        return SDKUtils.getSDKVersion();
    }

    public static synchronized void loadAd(IronSourceAdInstance ironSourceAdInstance) throws Exception {
        loadAd(ironSourceAdInstance, null);
    }

    public static synchronized void showAd(IronSourceAdInstance ironSourceAdInstance, Map<String, String> map) throws Exception {
        validateInitSDK();
        ironSourceNetwork.showAd(ironSourceAdInstance, map);
    }

    public static synchronized void showAd(IronSourceAdInstance ironSourceAdInstance) throws Exception {
        showAd(ironSourceAdInstance, null);
    }

    public static synchronized boolean isAdAvailableForInstance(IronSourceAdInstance ironSourceAdInstance) {
        IronSourceNetworkAPI ironSourceNetworkAPI = ironSourceNetwork;
        if (ironSourceNetworkAPI == null) {
            return false;
        }
        return ironSourceNetworkAPI.isAdAvailable(ironSourceAdInstance);
    }

    public static synchronized void onPause(Activity activity) {
        IronSourceNetworkAPI ironSourceNetworkAPI = ironSourceNetwork;
        if (ironSourceNetworkAPI == null) {
            return;
        }
        ironSourceNetworkAPI.onPause(activity);
    }

    public static synchronized void onResume(Activity activity) {
        IronSourceNetworkAPI ironSourceNetworkAPI = ironSourceNetwork;
        if (ironSourceNetworkAPI == null) {
            return;
        }
        ironSourceNetworkAPI.onResume(activity);
    }

    public static synchronized void updateConsentInfo(JSONObject jSONObject) {
        mConsentParams = jSONObject;
        applyConsentInfo(jSONObject);
    }

    public static synchronized void applyConsentInfo(JSONObject jSONObject) {
        IronSourceNetworkAPI ironSourceNetworkAPI = ironSourceNetwork;
        if (ironSourceNetworkAPI == null) {
            return;
        }
        if (jSONObject == null) {
            return;
        }
        ironSourceNetworkAPI.updateConsentInfo(jSONObject);
    }

    public static synchronized void updateMetadata(JSONObject jSONObject) {
        TokenService.getInstance().updateMetaData(jSONObject);
    }

    public static synchronized void release(Activity activity) {
        IronSourceNetworkAPI ironSourceNetworkAPI = ironSourceNetwork;
        if (ironSourceNetworkAPI == null) {
            return;
        }
        ironSourceNetworkAPI.release(activity);
    }

    public static synchronized String getToken(Context context) {
        return TokenService.getInstance().getToken(context);
    }

    public static synchronized JSONObject getRawToken(Context context) {
        return TokenService.getInstance().getRawToken(context);
    }

    public static synchronized void initOfferWall(Map<String, String> map, OnOfferWallListener onOfferWallListener) throws Exception {
        validateInitSDK();
        ironSourceNetwork.initOfferWall(map, onOfferWallListener);
    }

    public static synchronized void showOfferWall(Map<String, String> map) throws Exception {
        validateInitSDK();
        ironSourceNetwork.showOfferWall(map);
    }

    public static synchronized void getOfferWallCredits(OnOfferWallListener onOfferWallListener) throws Exception {
        validateInitSDK();
        ironSourceNetwork.getOfferWallCredits(onOfferWallListener);
    }

    public static synchronized void initBanner(String str, Map<String, String> map, OnBannerListener onBannerListener) throws Exception {
        validateInitSDK();
        ironSourceNetwork.initBanner(str, map, onBannerListener);
    }

    public static synchronized void loadBanner(JSONObject jSONObject) throws Exception {
        validateInitSDK();
        ironSourceNetwork.loadBanner(jSONObject);
    }

    public static synchronized ISNAdView createBanner(Activity activity, ISAdSize iSAdSize) throws Exception {
        validateInitSDK();
        return ironSourceNetwork.createBanner(activity, iSAdSize);
    }
}
