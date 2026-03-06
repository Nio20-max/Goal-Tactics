package com.ironsource.adapters.ironsource;

import android.app.Activity;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.internal.ServerProtocol;
import com.helpshift.common.domain.network.NetworkConstants;
import com.ironsource.environment.TokenConstants;
import com.ironsource.mediationsdk.AbstractAdapter;
import com.ironsource.mediationsdk.AuctionDataUtils;
import com.ironsource.mediationsdk.IronSourceObject;
import com.ironsource.mediationsdk.logger.IronLog;
import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.metadata.MetaDataConstants;
import com.ironsource.mediationsdk.metadata.MetaDataUtils;
import com.ironsource.mediationsdk.sdk.InterstitialSmashListener;
import com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener;
import com.ironsource.mediationsdk.utils.ContextProvider;
import com.ironsource.mediationsdk.utils.ErrorBuilder;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import com.ironsource.mediationsdk.utils.SessionDepthManager;
import com.ironsource.sdk.IronSourceAdInstance;
import com.ironsource.sdk.IronSourceAdInstanceBuilder;
import com.ironsource.sdk.IronSourceNetwork;
import com.ironsource.sdk.analytics.omid.OMIDManager;
import com.ironsource.sdk.constants.Constants;
import com.ironsource.sdk.constants.Events;
import com.ironsource.sdk.listeners.OnInterstitialListener;
import com.ironsource.sdk.utils.SDKUtils;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class IronSourceAdapter extends AbstractAdapter implements ContextProvider.ContextLifeCycleListener {
    private static final int IS_LOAD_EXCEPTION = 1000;
    private static final int IS_SHOW_EXCEPTION = 1001;
    private static final int RV_LOAD_EXCEPTION = 1002;
    private static final int RV_SHOW_EXCEPTION = 1003;
    private static final String VERSION = "7.0.3.1";
    private static AtomicBoolean mDidInitSdk = new AtomicBoolean(false);
    private static String mediationSegment;
    private static String userAgeGroup;
    private static String userGender;
    private final String ADM_KEY;
    private final String APPLICATION_USER_AGE_GROUP;
    private final String APPLICATION_USER_GENDER;
    private final String CUSTOM_SEGMENT;
    private final String DEMAND_SOURCE_NAME;
    private final String DYNAMIC_CONTROLLER_CONFIG;
    private final String DYNAMIC_CONTROLLER_DEBUG_MODE;
    private final String DYNAMIC_CONTROLLER_URL;
    private final String SDK_PLUGIN_TYPE;
    private final String SESSION_ID;
    private ConcurrentHashMap<String, IronSourceAdInstance> mDemandSourceToISAd;
    private ConcurrentHashMap<String, InterstitialSmashListener> mDemandSourceToISSmash;
    private ConcurrentHashMap<String, IronSourceAdInstance> mDemandSourceToRvAd;
    private ConcurrentHashMap<String, RewardedVideoSmashListener> mDemandSourceToRvSmash;

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public String getVersion() {
        return "7.0.3.1";
    }

    public static IronSourceAdapter startAdapter(String str) {
        return new IronSourceAdapter(str);
    }

    private IronSourceAdapter(String str) {
        super(str);
        this.DYNAMIC_CONTROLLER_URL = "controllerUrl";
        this.DYNAMIC_CONTROLLER_DEBUG_MODE = Constants.FeaturesManager.DEBUG_MODE;
        this.DYNAMIC_CONTROLLER_CONFIG = Constants.RequestParameters.CONTROLLER_CONFIG;
        this.APPLICATION_USER_GENDER = TokenConstants.APPLICATION_USER_GENDER;
        this.APPLICATION_USER_AGE_GROUP = TokenConstants.APPLICATION_USER_AGE_GROUP;
        this.SESSION_ID = Events.SESSION_ID;
        this.SDK_PLUGIN_TYPE = TokenConstants.SDK_PLUGIN_TYPE;
        this.CUSTOM_SEGMENT = "custom_Segment";
        this.ADM_KEY = Constants.ParametersKeys.ADM;
        this.DEMAND_SOURCE_NAME = "demandSourceName";
        IronLog.INTERNAL.verbose(str + ": new instance");
        this.mDemandSourceToISAd = new ConcurrentHashMap<>();
        this.mDemandSourceToRvAd = new ConcurrentHashMap<>();
        this.mDemandSourceToRvSmash = new ConcurrentHashMap<>();
        this.mDemandSourceToISSmash = new ConcurrentHashMap<>();
        userAgeGroup = null;
        userGender = null;
        mediationSegment = null;
        ContextProvider.getInstance().registerLifeCycleListener(this);
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public String getCoreSDKVersion() {
        return SDKUtils.getSDKVersion();
    }

    @Override // com.ironsource.mediationsdk.utils.ContextProvider.ContextLifeCycleListener
    public void onPause(Activity activity) {
        IronLog.ADAPTER_API.verbose("IronSourceNetwork.onPause");
        IronSourceNetwork.onPause(activity);
    }

    @Override // com.ironsource.mediationsdk.utils.ContextProvider.ContextLifeCycleListener
    public void onResume(Activity activity) {
        IronLog.ADAPTER_API.verbose("IronSourceNetwork.onResume");
        IronSourceNetwork.onResume(activity);
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    protected void setConsent(boolean z) {
        IronLog ironLog = IronLog.ADAPTER_API;
        StringBuilder sb = new StringBuilder();
        sb.append("(");
        sb.append(z ? ServerProtocol.DIALOG_RETURN_SCOPES_TRUE : "false");
        sb.append(")");
        ironLog.verbose(sb.toString());
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("consent", z ? "1" : AppEventsConstants.EVENT_PARAM_VALUE_NO);
            IronSourceNetwork.updateMetadata(jSONObject);
        } catch (JSONException e) {
            IronLog.ADAPTER_API.error("exception " + e.getMessage());
        }
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public void setAge(int i) {
        IronLog.INTERNAL.verbose(": " + i);
        if (i >= 13 && i <= 17) {
            userAgeGroup = "1";
            return;
        }
        if (i >= 18 && i <= 20) {
            userAgeGroup = "2";
            return;
        }
        if (i >= 21 && i <= 24) {
            userAgeGroup = NetworkConstants.apiVersion;
            return;
        }
        if (i >= 25 && i <= 34) {
            userAgeGroup = "4";
            return;
        }
        if (i >= 35 && i <= 44) {
            userAgeGroup = "5";
            return;
        }
        if (i >= 45 && i <= 54) {
            userAgeGroup = OMIDManager.OMID_PARTNER_VERSION;
            return;
        }
        if (i >= 55 && i <= 64) {
            userAgeGroup = "7";
        } else if (i > 65 && i <= 120) {
            userAgeGroup = "8";
        } else {
            userAgeGroup = AppEventsConstants.EVENT_PARAM_VALUE_NO;
        }
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public void setGender(String str) {
        IronLog.INTERNAL.verbose(str);
        userGender = str;
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter, com.ironsource.mediationsdk.sdk.BaseApi
    public void setMediationSegment(String str) {
        mediationSegment = str;
    }

    private HashMap<String, String> getInitParams() {
        HashMap<String, String> map = new HashMap<>();
        if (!TextUtils.isEmpty(userAgeGroup)) {
            map.put(TokenConstants.APPLICATION_USER_AGE_GROUP, userAgeGroup);
        }
        if (!TextUtils.isEmpty(userGender)) {
            map.put(TokenConstants.APPLICATION_USER_GENDER, userGender);
        }
        String pluginType = getPluginType();
        if (!TextUtils.isEmpty(pluginType)) {
            map.put(TokenConstants.SDK_PLUGIN_TYPE, pluginType);
        }
        if (!TextUtils.isEmpty(mediationSegment)) {
            map.put("custom_Segment", mediationSegment);
        }
        if (!TextUtils.isEmpty(IronSourceObject.getInstance().getSessionId())) {
            map.put(Events.SESSION_ID, IronSourceObject.getInstance().getSessionId());
        }
        return map;
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public JSONObject getPlayerBiddingData() {
        JSONObject rawToken;
        IronLog.ADAPTER_API.verbose("");
        JSONObject jSONObject = new JSONObject();
        try {
            rawToken = IronSourceNetwork.getRawToken(ContextProvider.getInstance().getApplicationContext());
        } catch (Exception e) {
            IronLog.ADAPTER_API.error("getRawToken exception: " + e.getLocalizedMessage());
            rawToken = null;
        }
        if (rawToken != null) {
            return rawToken;
        }
        IronLog.ADAPTER_API.error("Player's bidding token is null");
        return jSONObject;
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public void earlyInit(String str, String str2, JSONObject jSONObject) {
        if (str != null) {
            IronSourceUtils.sendAutomationLog(getDemandSourceName(jSONObject) + ": earlyInit");
            initSDK(str, jSONObject);
            return;
        }
        IronLog.ADAPTER_API.error("Appkey is null for early init");
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public Map<String, Object> getInterstitialBiddingData(JSONObject jSONObject) {
        IronLog.ADAPTER_API.verbose("");
        HashMap map = new HashMap();
        String token = IronSourceNetwork.getToken(ContextProvider.getInstance().getApplicationContext());
        if (token != null) {
            map.put("token", token);
        } else {
            IronLog.ADAPTER_API.error("IS bidding token is null");
            map.put("token", "");
        }
        return map;
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public void initInterstitialForBidding(String str, String str2, JSONObject jSONObject, InterstitialSmashListener interstitialSmashListener) {
        String demandSourceName = getDemandSourceName(jSONObject);
        IronLog.INTERNAL.verbose(demandSourceName + ": demandSourceName=" + demandSourceName);
        initInterstitialInternal(str, jSONObject, interstitialSmashListener, demandSourceName);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialAdapterApi
    public void initInterstitial(String str, String str2, JSONObject jSONObject, InterstitialSmashListener interstitialSmashListener) {
        String demandSourceName = getDemandSourceName(jSONObject);
        IronLog.INTERNAL.verbose(demandSourceName + ": demandSourceName=" + demandSourceName);
        initInterstitialInternal(str, jSONObject, interstitialSmashListener, demandSourceName);
    }

    private void initInterstitialInternal(String str, JSONObject jSONObject, InterstitialSmashListener interstitialSmashListener, String str2) {
        initSDK(str, jSONObject);
        this.mDemandSourceToISSmash.put(str2, interstitialSmashListener);
        interstitialSmashListener.onInterstitialInitSuccess();
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public void loadInterstitialForBidding(JSONObject jSONObject, InterstitialSmashListener interstitialSmashListener, String str) {
        IronLog.ADAPTER_API.verbose(getDemandSourceName(jSONObject));
        try {
            loadAdInternal(getDemandSourceName(jSONObject), str, false, true, false);
        } catch (Exception e) {
            IronLog.ADAPTER_API.error("for bidding exception " + e.getMessage());
            interstitialSmashListener.onInterstitialAdLoadFailed(new IronSourceError(1000, e.getMessage()));
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialAdapterApi
    public void loadInterstitial(JSONObject jSONObject, InterstitialSmashListener interstitialSmashListener) {
        IronLog.ADAPTER_API.verbose(getDemandSourceName(jSONObject));
        try {
            loadAdInternal(getDemandSourceName(jSONObject), null, false, false, false);
        } catch (Exception e) {
            IronLog.ADAPTER_API.error("exception " + e.getMessage());
            interstitialSmashListener.onInterstitialAdLoadFailed(new IronSourceError(1000, e.getMessage()));
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialAdapterApi
    public void showInterstitial(JSONObject jSONObject, InterstitialSmashListener interstitialSmashListener) {
        IronLog.ADAPTER_API.verbose(getDemandSourceName(jSONObject));
        try {
            showAdInternal(this.mDemandSourceToISAd.get(getDemandSourceName(jSONObject)), 2);
        } catch (Exception e) {
            IronLog.ADAPTER_API.error("exception " + e.getMessage());
            interstitialSmashListener.onInterstitialAdShowFailed(new IronSourceError(1001, e.getMessage()));
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialAdapterApi
    public boolean isInterstitialReady(JSONObject jSONObject) {
        IronSourceAdInstance ironSourceAdInstance = this.mDemandSourceToISAd.get(getDemandSourceName(jSONObject));
        return ironSourceAdInstance != null && IronSourceNetwork.isAdAvailableForInstance(ironSourceAdInstance);
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public Map<String, Object> getRewardedVideoBiddingData(JSONObject jSONObject) {
        IronLog.ADAPTER_API.verbose("getRewardedVideoBiddingData");
        HashMap map = new HashMap();
        String token = IronSourceNetwork.getToken(ContextProvider.getInstance().getApplicationContext());
        if (token != null) {
            map.put("token", token);
        } else {
            IronLog.ADAPTER_API.error("RV bidding token is null");
            map.put("token", "");
        }
        return map;
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public void initRewardedVideoForBidding(String str, String str2, JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener) {
        String demandSourceName = getDemandSourceName(jSONObject);
        IronLog.INTERNAL.verbose(demandSourceName + ": demandSourceName=" + demandSourceName);
        initRewardedVideoInternal(str, jSONObject, rewardedVideoSmashListener, demandSourceName);
        rewardedVideoSmashListener.onRewardedVideoInitSuccess();
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public void initRewardedVideoForDemandOnly(String str, String str2, JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener) {
        String demandSourceName = getDemandSourceName(jSONObject);
        IronLog.INTERNAL.verbose(demandSourceName + ": demandSourceName=" + demandSourceName);
        initRewardedVideoInternal(str, jSONObject, rewardedVideoSmashListener, demandSourceName);
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoAdapterApi
    public void initRewardedVideo(String str, String str2, JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener) {
        String demandSourceName = getDemandSourceName(jSONObject);
        IronLog.INTERNAL.verbose(demandSourceName + ": demandSourceName=" + demandSourceName);
        initRewardedVideoInternal(str, jSONObject, rewardedVideoSmashListener, demandSourceName);
        fetchRewardedVideoForAutomaticLoad(jSONObject, rewardedVideoSmashListener);
    }

    private void initRewardedVideoInternal(String str, JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener, String str2) {
        initSDK(str, jSONObject);
        this.mDemandSourceToRvSmash.put(str2, rewardedVideoSmashListener);
    }

    private IronSourceAdInstance getAdInstance(String str, boolean z, boolean z2, boolean z3) {
        IronSourceAdInstance ironSourceAdInstanceBuild;
        IronSourceAdInstanceBuilder extraParams;
        if (z3) {
            ironSourceAdInstanceBuild = this.mDemandSourceToRvAd.get(str);
        } else {
            ironSourceAdInstanceBuild = this.mDemandSourceToISAd.get(str);
        }
        if (ironSourceAdInstanceBuild == null) {
            IronLog.ADAPTER_API.verbose("creating ad instance for " + str + " isDemandOnlyForRv=" + z + " isBidder=" + z2 + " isRewarded=" + z3);
            if (z3) {
                extraParams = new IronSourceAdInstanceBuilder(str, new IronSourceRewardedVideoListener(this.mDemandSourceToRvSmash.get(str), str, z)).setExtraParams(getInitParams());
                extraParams.setRewarded();
            } else {
                extraParams = new IronSourceAdInstanceBuilder(str, new IronSourceInterstitialListener(this.mDemandSourceToISSmash.get(str), str)).setExtraParams(getInitParams());
            }
            if (z2) {
                extraParams.setInAppBidding();
            }
            ironSourceAdInstanceBuild = extraParams.build();
            if (z3) {
                this.mDemandSourceToRvAd.put(str, ironSourceAdInstanceBuild);
            } else {
                this.mDemandSourceToISAd.put(str, ironSourceAdInstanceBuild);
            }
        }
        return ironSourceAdInstanceBuild;
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoAdapterApi
    public void fetchRewardedVideoForAutomaticLoad(JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener) {
        String demandSourceName = getDemandSourceName(jSONObject);
        IronLog.ADAPTER_API.verbose(demandSourceName);
        try {
            loadAdInternal(demandSourceName, null, false, false, true);
        } catch (Exception e) {
            IronLog.ADAPTER_API.error("exception " + e.getMessage());
            RewardedVideoSmashListener rewardedVideoSmashListener2 = this.mDemandSourceToRvSmash.get(demandSourceName);
            if (rewardedVideoSmashListener2 != null) {
                IronLog.ADAPTER_API.error("exception " + e.getMessage());
                rewardedVideoSmashListener2.onRewardedVideoLoadFailed(new IronSourceError(1002, e.getMessage()));
                rewardedVideoSmashListener2.onRewardedVideoAvailabilityChanged(false);
            }
        }
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public void loadRewardedVideoForDemandOnly(JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener) {
        IronLog.ADAPTER_API.verbose(getDemandSourceName(jSONObject));
        try {
            loadAdInternal(getDemandSourceName(jSONObject), null, true, false, true);
        } catch (Exception e) {
            IronLog.ADAPTER_API.error("exception " + e.getMessage());
            rewardedVideoSmashListener.onRewardedVideoLoadFailed(new IronSourceError(1002, e.getMessage()));
        }
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public void loadRewardedVideoForDemandOnlyForBidding(JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener, String str) {
        IronLog.ADAPTER_API.verbose(getDemandSourceName(jSONObject));
        try {
            loadAdInternal(getDemandSourceName(jSONObject), str, true, true, true);
        } catch (Exception e) {
            IronLog.ADAPTER_API.error("exception " + e.getMessage());
            rewardedVideoSmashListener.onRewardedVideoLoadFailed(new IronSourceError(1002, e.getMessage()));
        }
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public void loadRewardedVideoForBidding(JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener, String str) {
        IronLog.ADAPTER_API.verbose(getDemandSourceName(jSONObject));
        try {
            loadAdInternal(getDemandSourceName(jSONObject), str, false, true, true);
        } catch (Exception e) {
            IronLog.ADAPTER_API.error("exception " + e.getMessage());
            rewardedVideoSmashListener.onRewardedVideoLoadFailed(new IronSourceError(1002, e.getMessage()));
            rewardedVideoSmashListener.onRewardedVideoAvailabilityChanged(false);
        }
    }

    private void loadAdInternal(String str, String str2, boolean z, boolean z2, boolean z3) throws Exception {
        HashMap map = new HashMap();
        if (str2 != null) {
            map.put(Constants.ParametersKeys.ADM, AuctionDataUtils.getInstance().getAdmFromServerData(str2));
            map.putAll(AuctionDataUtils.getInstance().getAuctionResponseServerDataParams(str2));
        }
        IronSourceAdInstance adInstance = getAdInstance(str, z, z2, z3);
        printInstanceExtraParams(map);
        IronLog.ADAPTER_API.verbose("demandSourceName=" + adInstance.getName());
        IronSourceNetwork.loadAd(adInstance, map);
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoAdapterApi
    public void showRewardedVideo(JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener) {
        try {
            showAdInternal(this.mDemandSourceToRvAd.get(getDemandSourceName(jSONObject)), 1);
        } catch (Exception e) {
            IronLog.ADAPTER_API.error("exception " + e.getMessage());
            rewardedVideoSmashListener.onRewardedVideoAdShowFailed(new IronSourceError(1003, e.getMessage()));
        }
    }

    private void showAdInternal(IronSourceAdInstance ironSourceAdInstance, int i) throws Exception {
        int sessionDepth = SessionDepthManager.getInstance().getSessionDepth(i);
        HashMap map = new HashMap();
        map.put("sessionDepth", String.valueOf(sessionDepth));
        IronLog.ADAPTER_API.verbose("demandSourceName=" + ironSourceAdInstance.getName() + " showParams=" + map);
        IronSourceNetwork.showAd(ironSourceAdInstance, map);
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoAdapterApi
    public boolean isRewardedVideoAvailable(JSONObject jSONObject) {
        IronSourceAdInstance ironSourceAdInstance = this.mDemandSourceToRvAd.get(getDemandSourceName(jSONObject));
        return ironSourceAdInstance != null && IronSourceNetwork.isAdAvailableForInstance(ironSourceAdInstance);
    }

    private void initSDK(String str, JSONObject jSONObject) {
        if (mDidInitSdk.compareAndSet(false, true)) {
            String mediationUserId = IronSourceUtils.getMediationUserId();
            int iOptInt = jSONObject.optInt(Constants.FeaturesManager.DEBUG_MODE, 0);
            if (isAdaptersDebugEnabled()) {
                iOptInt = 3;
            }
            IronLog.ADAPTER_API.verbose("etting debug mode to " + iOptInt);
            SDKUtils.setDebugMode(iOptInt);
            SDKUtils.setControllerUrl(jSONObject.optString("controllerUrl"));
            IronLog.ADAPTER_API.verbose("IronSourceNetwork setting controller url to  " + jSONObject.optString("controllerUrl"));
            SDKUtils.setControllerConfig(jSONObject.optString(Constants.RequestParameters.CONTROLLER_CONFIG));
            IronLog.ADAPTER_API.verbose("IronSourceNetwork setting controller config to  " + jSONObject.optString(Constants.RequestParameters.CONTROLLER_CONFIG));
            HashMap<String, String> initParams = getInitParams();
            IronLog.ADAPTER_API.verbose("with appKey=" + str + " userId=" + mediationUserId + " parameters " + initParams);
            IronSourceNetwork.initSDK(ContextProvider.getInstance().getCurrentActiveActivity(), str, mediationUserId, initParams);
        }
    }

    private class IronSourceInterstitialListener implements OnInterstitialListener {
        private String mDemandSourceName;
        private InterstitialSmashListener mListener;

        IronSourceInterstitialListener(InterstitialSmashListener interstitialSmashListener, String str) {
            this.mDemandSourceName = str;
            this.mListener = interstitialSmashListener;
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialInitSuccess() {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " interstitialListener");
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialInitFailed(String str) {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " interstitialListener");
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialLoadSuccess() {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " interstitialListener");
            this.mListener.onInterstitialAdReady();
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialLoadFailed(String str) {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " interstitialListener " + str);
            this.mListener.onInterstitialAdLoadFailed(ErrorBuilder.buildLoadFailedError(str));
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialOpen() {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " interstitialListener");
            this.mListener.onInterstitialAdOpened();
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialAdRewarded(String str, int i) {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " interstitialListener demandSourceId=" + str + " amount=" + i);
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialClose() {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " interstitialListener");
            this.mListener.onInterstitialAdClosed();
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialShowSuccess() {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " interstitialListener");
            this.mListener.onInterstitialAdShowSucceeded();
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialShowFailed(String str) {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " interstitialListener " + str);
            this.mListener.onInterstitialAdShowFailed(ErrorBuilder.buildShowFailedError("Interstitial", str));
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialClick() {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " interstitialListener");
            this.mListener.onInterstitialAdClicked();
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialEventNotificationReceived(String str, JSONObject jSONObject) {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " interstitialListener eventName=" + str);
            this.mListener.onInterstitialAdVisible();
        }
    }

    private class IronSourceRewardedVideoListener implements OnInterstitialListener {
        private String mDemandSourceName;
        boolean mIsRvDemandOnly;
        RewardedVideoSmashListener mListener;

        IronSourceRewardedVideoListener(RewardedVideoSmashListener rewardedVideoSmashListener, String str) {
            this.mDemandSourceName = str;
            this.mListener = rewardedVideoSmashListener;
            this.mIsRvDemandOnly = false;
        }

        IronSourceRewardedVideoListener(RewardedVideoSmashListener rewardedVideoSmashListener, String str, boolean z) {
            this.mDemandSourceName = str;
            this.mListener = rewardedVideoSmashListener;
            this.mIsRvDemandOnly = z;
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialInitSuccess() {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " rewardedVideoListener");
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialInitFailed(String str) {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " rewardedVideoListener");
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialLoadSuccess() {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " rewardedVideoListener");
            if (this.mIsRvDemandOnly) {
                this.mListener.onRewardedVideoLoadSuccess();
            } else {
                this.mListener.onRewardedVideoAvailabilityChanged(true);
            }
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialLoadFailed(String str) {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " rewardedVideoListener " + str);
            this.mListener.onRewardedVideoLoadFailed(ErrorBuilder.buildLoadFailedError(str));
            if (this.mIsRvDemandOnly) {
                return;
            }
            this.mListener.onRewardedVideoAvailabilityChanged(false);
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialOpen() {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " rewardedVideoListener");
            this.mListener.onRewardedVideoAdOpened();
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialAdRewarded(String str, int i) {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " rewardedVideoListener demandSourceId=" + str + " amount=" + i);
            this.mListener.onRewardedVideoAdRewarded();
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialClose() {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " rewardedVideoListener");
            this.mListener.onRewardedVideoAdClosed();
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialShowSuccess() {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " rewardedVideoListener");
            if (this.mIsRvDemandOnly) {
                return;
            }
            this.mListener.onRewardedVideoAvailabilityChanged(false);
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialShowFailed(String str) {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + "rewardedVideoListener " + str);
            this.mListener.onRewardedVideoAdShowFailed(ErrorBuilder.buildShowFailedError(IronSourceConstants.REWARDED_VIDEO_AD_UNIT, str));
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialClick() {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " rewardedVideoListener");
            this.mListener.onRewardedVideoAdClicked();
        }

        @Override // com.ironsource.sdk.listeners.OnInterstitialListener
        public void onInterstitialEventNotificationReceived(String str, JSONObject jSONObject) {
            IronLog.ADAPTER_CALLBACK.verbose(this.mDemandSourceName + " rewardedVideoListener eventName=" + str);
            this.mListener.onRewardedVideoAdVisible();
        }
    }

    private String getDemandSourceName(JSONObject jSONObject) {
        if (!TextUtils.isEmpty(jSONObject.optString("demandSourceName"))) {
            return jSONObject.optString("demandSourceName");
        }
        return getProviderName();
    }

    private boolean isValidMetaData(String str, String str2) {
        if (str.equals(MetaDataConstants.META_DATA_CCPA_KEY)) {
            return MetaDataUtils.isValidCCPAMetaData(str, str2);
        }
        return true;
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    protected void setMetaData(String str, String str2) {
        if (mDidInitSdk.get()) {
            return;
        }
        IronLog.ADAPTER_API.verbose("key=" + str + ", value=" + str2);
        if (!isValidMetaData(str, str2)) {
            IronLog.ADAPTER_API.verbose("MetaData not valid");
            return;
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(str, str2);
            IronSourceNetwork.updateMetadata(jSONObject);
        } catch (JSONException e) {
            IronLog.ADAPTER_API.error("error - " + e);
            e.printStackTrace();
        }
    }

    private void printInstanceExtraParams(Map<String, String> map) {
        if (map == null || map.size() <= 0) {
            return;
        }
        IronLog.ADAPTER_API.verbose("instance extra params:");
        for (String str : map.keySet()) {
            IronLog.ADAPTER_API.verbose(str + Constants.RequestParameters.EQUAL + map.get(str));
        }
    }
}
