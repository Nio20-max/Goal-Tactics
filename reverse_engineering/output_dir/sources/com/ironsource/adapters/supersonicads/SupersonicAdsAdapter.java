package com.ironsource.adapters.supersonicads;

import android.app.Activity;
import android.text.TextUtils;
import android.widget.FrameLayout;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.internal.ServerProtocol;
import com.helpshift.common.domain.network.NetworkConstants;
import com.ironsource.environment.TokenConstants;
import com.ironsource.eventsmodule.DataBaseEventsStorage;
import com.ironsource.mediationsdk.AbstractAdapter;
import com.ironsource.mediationsdk.AbstractSmash;
import com.ironsource.mediationsdk.IntegrationData;
import com.ironsource.mediationsdk.IronSourceBannerLayout;
import com.ironsource.mediationsdk.IronSourceObject;
import com.ironsource.mediationsdk.logger.IronLog;
import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.metadata.MetaDataConstants;
import com.ironsource.mediationsdk.metadata.MetaDataUtils;
import com.ironsource.mediationsdk.sdk.BannerSmashListener;
import com.ironsource.mediationsdk.sdk.InternalOfferwallListener;
import com.ironsource.mediationsdk.sdk.InterstitialSmashListener;
import com.ironsource.mediationsdk.sdk.OfferwallAdapterApi;
import com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener;
import com.ironsource.mediationsdk.utils.ContextProvider;
import com.ironsource.mediationsdk.utils.ErrorBuilder;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import com.ironsource.mediationsdk.utils.SessionDepthManager;
import com.ironsource.sdk.ISNAdView.ISNAdView;
import com.ironsource.sdk.IronSourceNetwork;
import com.ironsource.sdk.SSAFactory;
import com.ironsource.sdk.SSAPublisher;
import com.ironsource.sdk.analytics.omid.OMIDManager;
import com.ironsource.sdk.constants.Constants;
import com.ironsource.sdk.constants.Events;
import com.ironsource.sdk.data.AdUnitsReady;
import com.ironsource.sdk.data.SSAEnums;
import com.ironsource.sdk.listeners.OnBannerListener;
import com.ironsource.sdk.listeners.OnInterstitialListener;
import com.ironsource.sdk.listeners.OnOfferWallListener;
import com.ironsource.sdk.listeners.OnRewardedVideoListener;
import com.ironsource.sdk.utils.SDKUtils;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
class SupersonicAdsAdapter extends AbstractAdapter implements OfferwallAdapterApi, OnOfferWallListener, OnInterstitialListener, OnRewardedVideoListener, OnBannerListener, ContextProvider.ContextLifeCycleListener {
    private static final String VERSION = "7.0.3.1";
    private final String AD_VISIBLE_EVENT_NAME;
    private final String APPLICATION_PRIVATE_KEY;
    private final String APPLICATION_USER_AGE_GROUP;
    private final String APPLICATION_USER_GENDER;
    private final String CAMPAIGN_ID;
    private final String CLIENT_SIDE_CALLBACKS;
    private final String CUSTOM_PARAM_PREFIX;
    private final String CUSTOM_SEGMENT;
    private final String DYNAMIC_CONTROLLER_CONFIG;
    private final String DYNAMIC_CONTROLLER_DEBUG_MODE;
    private final String DYNAMIC_CONTROLLER_URL;
    private final String ITEM_COUNT;
    private final String ITEM_NAME;
    private final String ITEM_SIGNATURE;
    private final String LANGUAGE;
    private final String MAX_VIDEO_LENGTH;
    private final String OW_PLACEMENT_ID;
    private final String SDK_PLUGIN_TYPE;
    private final String SESSION_ID;
    private final String SUPERSONIC_ADS;
    private final String TIMESTAMP;
    private AtomicBoolean isRVInitiated;
    private boolean mConsent;
    private boolean mDidSetConsent;
    private boolean mIsAlreadyShowing;
    private boolean mIsRVAvailable;
    private ISNAdView mIsnAdView;
    private String mMediationSegment;
    private InternalOfferwallListener mOfferwallListener;
    private SSAPublisher mSSAPublisher;
    private String mUserAgeGroup;
    private String mUserGender;
    private static AtomicBoolean mDidSetInitParams = new AtomicBoolean(false);
    private static AtomicBoolean mDidInitSdk = new AtomicBoolean(false);

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public String getVersion() {
        return "7.0.3.1";
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallAdapterApi
    public boolean isOfferwallAvailable() {
        return true;
    }

    @Override // com.ironsource.sdk.listeners.OnInterstitialListener
    public void onInterstitialAdRewarded(String str, int i) {
    }

    @Override // com.ironsource.sdk.listeners.OnOfferWallListener
    public void onOWGeneric(String str, String str2) {
    }

    public static SupersonicAdsAdapter startAdapter(String str) {
        return new SupersonicAdsAdapter(str);
    }

    private SupersonicAdsAdapter(String str) {
        super(str);
        this.TIMESTAMP = DataBaseEventsStorage.EventEntry.COLUMN_NAME_TIMESTAMP;
        this.ITEM_SIGNATURE = "itemSignature";
        this.SDK_PLUGIN_TYPE = TokenConstants.SDK_PLUGIN_TYPE;
        this.OW_PLACEMENT_ID = Constants.PLACEMENT_ID;
        this.SESSION_ID = Events.SESSION_ID;
        this.mIsRVAvailable = false;
        this.SUPERSONIC_ADS = IronSourceConstants.SUPERSONIC_CONFIG_NAME;
        this.DYNAMIC_CONTROLLER_URL = "controllerUrl";
        this.DYNAMIC_CONTROLLER_DEBUG_MODE = Constants.FeaturesManager.DEBUG_MODE;
        this.DYNAMIC_CONTROLLER_CONFIG = Constants.RequestParameters.CONTROLLER_CONFIG;
        this.APPLICATION_USER_GENDER = TokenConstants.APPLICATION_USER_GENDER;
        this.APPLICATION_USER_AGE_GROUP = TokenConstants.APPLICATION_USER_AGE_GROUP;
        this.LANGUAGE = "language";
        this.MAX_VIDEO_LENGTH = "maxVideoLength";
        this.CAMPAIGN_ID = Constants.RequestParameters.CAMPAIGN_ID;
        this.CUSTOM_PARAM_PREFIX = "custom_";
        this.CUSTOM_SEGMENT = "custom_Segment";
        this.ITEM_NAME = "itemName";
        this.ITEM_COUNT = "itemCount";
        this.APPLICATION_PRIVATE_KEY = "privateKey";
        this.CLIENT_SIDE_CALLBACKS = Constants.ParametersKeys.USE_CLIENT_SIDE_CALLBACKS;
        this.AD_VISIBLE_EVENT_NAME = "impressions";
        IronLog.INTERNAL.verbose("");
        this.isRVInitiated = new AtomicBoolean(false);
        ContextProvider.getInstance().registerLifeCycleListener(this);
        this.mIsAlreadyShowing = false;
    }

    public static IntegrationData getIntegrationData(Activity activity) {
        IntegrationData integrationData = new IntegrationData(IronSourceConstants.SUPERSONIC_CONFIG_NAME, "7.0.3.1");
        integrationData.activities = new String[]{"com.ironsource.sdk.controller.ControllerActivity", "com.ironsource.sdk.controller.InterstitialActivity", "com.ironsource.sdk.controller.OpenUrlActivity"};
        return integrationData;
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public String getCoreSDKVersion() {
        return SDKUtils.getSDKVersion();
    }

    public static String getAdapterSDKVersion() {
        return SDKUtils.getSDKVersion();
    }

    @Override // com.ironsource.mediationsdk.utils.ContextProvider.ContextLifeCycleListener
    public void onPause(Activity activity) {
        if (this.mSSAPublisher != null) {
            IronLog.ADAPTER_API.verbose(getProviderName() + " mSSAPublisher.onPause");
            this.mSSAPublisher.onPause(activity);
        }
    }

    @Override // com.ironsource.mediationsdk.utils.ContextProvider.ContextLifeCycleListener
    public void onResume(Activity activity) {
        if (this.mSSAPublisher != null) {
            IronLog.ADAPTER_API.verbose(getProviderName() + " mSSAPublisher.onResume");
            this.mSSAPublisher.onResume(activity);
        }
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public void setAge(int i) {
        if (i >= 13 && i <= 17) {
            this.mUserAgeGroup = "1";
            return;
        }
        if (i >= 18 && i <= 20) {
            this.mUserAgeGroup = "2";
            return;
        }
        if (i >= 21 && i <= 24) {
            this.mUserAgeGroup = NetworkConstants.apiVersion;
            return;
        }
        if (i >= 25 && i <= 34) {
            this.mUserAgeGroup = "4";
            return;
        }
        if (i >= 35 && i <= 44) {
            this.mUserAgeGroup = "5";
            return;
        }
        if (i >= 45 && i <= 54) {
            this.mUserAgeGroup = OMIDManager.OMID_PARTNER_VERSION;
            return;
        }
        if (i >= 55 && i <= 64) {
            this.mUserAgeGroup = "7";
        } else if (i > 65 && i <= 120) {
            this.mUserAgeGroup = "8";
        } else {
            this.mUserAgeGroup = AppEventsConstants.EVENT_PARAM_VALUE_NO;
        }
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public void setGender(String str) {
        this.mUserGender = str;
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter, com.ironsource.mediationsdk.sdk.BaseApi
    public void setMediationSegment(String str) {
        this.mMediationSegment = str;
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoAdapterApi
    public void initRewardedVideo(final String str, String str2, final JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener) {
        if (this.isRVInitiated.compareAndSet(false, true)) {
            setParamsBeforeInit(jSONObject);
            postOnUIThread(new Runnable() { // from class: com.ironsource.adapters.supersonicads.SupersonicAdsAdapter.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        String mediationUserId = IronSourceUtils.getMediationUserId();
                        SupersonicAdsAdapter.this.mSSAPublisher = SSAFactory.getPublisherInstance(ContextProvider.getInstance().getCurrentActiveActivity());
                        HashMap rewardedVideoExtraParams = SupersonicAdsAdapter.this.getRewardedVideoExtraParams(jSONObject);
                        if (SupersonicAdsAdapter.this.mDidSetConsent) {
                            SupersonicAdsAdapter supersonicAdsAdapter = SupersonicAdsAdapter.this;
                            supersonicAdsAdapter.applyConsent(supersonicAdsAdapter.mConsent);
                        }
                        IronLog.ADAPTER_API.verbose(SupersonicAdsAdapter.this.getProviderName() + " mSSAPublisher.initRewardedVideo userId=" + mediationUserId);
                        SupersonicAdsAdapter.this.mSSAPublisher.initRewardedVideo(str, mediationUserId, SupersonicAdsAdapter.this.getProviderName(), rewardedVideoExtraParams, SupersonicAdsAdapter.this);
                        SupersonicAdsAdapter.mDidInitSdk.set(true);
                    } catch (Exception e) {
                        e.printStackTrace();
                        SupersonicAdsAdapter.this.onRVInitFail(Constants.JSMethods.INIT_REWARDED_VIDEO);
                    }
                }
            });
            return;
        }
        IronLog.ADAPTER_API.verbose(getProviderName() + " adapter already initiated");
        fetchRewardedVideoForAutomaticLoad(jSONObject, rewardedVideoSmashListener);
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoAdapterApi
    public void fetchRewardedVideoForAutomaticLoad(JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener) {
        IronLog.ADAPTER_API.verbose(getProviderName());
        for (RewardedVideoSmashListener rewardedVideoSmashListener2 : this.mAllRewardedVideoSmashes) {
            if (rewardedVideoSmashListener2 != null) {
                rewardedVideoSmashListener2.onRewardedVideoAvailabilityChanged(this.mIsRVAvailable);
            }
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoAdapterApi
    public void showRewardedVideo(JSONObject jSONObject, RewardedVideoSmashListener rewardedVideoSmashListener) {
        this.mActiveRewardedVideoSmash = rewardedVideoSmashListener;
        if (this.mSSAPublisher != null) {
            int sessionDepth = SessionDepthManager.getInstance().getSessionDepth(1);
            JSONObject jSONObject2 = new JSONObject();
            try {
                jSONObject2.put("demandSourceName", getProviderName());
                jSONObject2.put("sessionDepth", sessionDepth);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            IronLog.ADAPTER_API.verbose(getProviderName() + " mSSAPublisher.showRewardedVideo");
            this.mSSAPublisher.showRewardedVideo(jSONObject2);
            return;
        }
        this.mIsRVAvailable = false;
        if (this.mActiveRewardedVideoSmash != null) {
            this.mActiveRewardedVideoSmash.onRewardedVideoAdShowFailed(ErrorBuilder.buildNoAdsToShowError(IronSourceConstants.REWARDED_VIDEO_AD_UNIT));
        }
        for (RewardedVideoSmashListener rewardedVideoSmashListener2 : this.mAllRewardedVideoSmashes) {
            if (rewardedVideoSmashListener2 != null) {
                rewardedVideoSmashListener2.onRewardedVideoAvailabilityChanged(false);
            }
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoAdapterApi
    public boolean isRewardedVideoAvailable(JSONObject jSONObject) {
        return this.mIsRVAvailable;
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialAdapterApi
    public void initInterstitial(final String str, String str2, JSONObject jSONObject, InterstitialSmashListener interstitialSmashListener) {
        setParamsBeforeInit(jSONObject);
        postOnUIThread(new Runnable() { // from class: com.ironsource.adapters.supersonicads.SupersonicAdsAdapter.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    String mediationUserId = IronSourceUtils.getMediationUserId();
                    SupersonicAdsAdapter.this.mSSAPublisher = SSAFactory.getPublisherInstance(ContextProvider.getInstance().getCurrentActiveActivity());
                    HashMap interstitialExtraParams = SupersonicAdsAdapter.this.getInterstitialExtraParams();
                    if (SupersonicAdsAdapter.this.mDidSetConsent) {
                        SupersonicAdsAdapter supersonicAdsAdapter = SupersonicAdsAdapter.this;
                        supersonicAdsAdapter.applyConsent(supersonicAdsAdapter.mConsent);
                    }
                    IronLog.ADAPTER_API.verbose(SupersonicAdsAdapter.this.getProviderName() + " mSSAPublisher.initInterstitial userId=" + mediationUserId);
                    SupersonicAdsAdapter.this.mSSAPublisher.initInterstitial(str, mediationUserId, SupersonicAdsAdapter.this.getProviderName(), interstitialExtraParams, SupersonicAdsAdapter.this);
                    SupersonicAdsAdapter.mDidInitSdk.set(true);
                } catch (Exception e) {
                    e.printStackTrace();
                    SupersonicAdsAdapter.this.onInterstitialInitFailed(e.getMessage());
                }
            }
        });
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialAdapterApi
    public void loadInterstitial(JSONObject jSONObject, InterstitialSmashListener interstitialSmashListener) {
        if (this.mSSAPublisher != null) {
            JSONObject jSONObject2 = new JSONObject();
            try {
                jSONObject2.put("demandSourceName", getProviderName());
            } catch (JSONException e) {
                e.printStackTrace();
            }
            IronLog.ADAPTER_API.verbose(getProviderName() + " mSSAPublisher.loadInterstitial");
            this.mSSAPublisher.loadInterstitial(jSONObject2);
            return;
        }
        IronLog.INTERNAL.error("Please call initInterstitial before calling loadInterstitial");
        for (InterstitialSmashListener interstitialSmashListener2 : this.mAllInterstitialSmashes) {
            if (interstitialSmashListener2 != null) {
                interstitialSmashListener2.onInterstitialAdLoadFailed(ErrorBuilder.buildLoadFailedError("Load was called before Init"));
            }
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialAdapterApi
    public void showInterstitial(JSONObject jSONObject, InterstitialSmashListener interstitialSmashListener) {
        this.mActiveInterstitialSmash = interstitialSmashListener;
        if (this.mSSAPublisher != null) {
            int sessionDepth = SessionDepthManager.getInstance().getSessionDepth(2);
            JSONObject jSONObject2 = new JSONObject();
            try {
                jSONObject2.put("demandSourceName", getProviderName());
                jSONObject2.put("sessionDepth", sessionDepth);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            IronLog.ADAPTER_API.verbose(getProviderName() + " mSSAPublisher.showInterstitial");
            this.mSSAPublisher.showInterstitial(jSONObject2);
            return;
        }
        IronLog.INTERNAL.error("Please call loadInterstitialForBidding before calling showInterstitial");
        if (this.mActiveInterstitialSmash != null) {
            this.mActiveInterstitialSmash.onInterstitialAdShowFailed(ErrorBuilder.buildNoAdsToShowError("Interstitial"));
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialAdapterApi
    public boolean isInterstitialReady(JSONObject jSONObject) {
        SSAPublisher sSAPublisher = this.mSSAPublisher;
        return sSAPublisher != null && sSAPublisher.isInterstitialAdAvailable(getProviderName());
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallAdapterApi
    public void setInternalOfferwallListener(InternalOfferwallListener internalOfferwallListener) {
        this.mOfferwallListener = internalOfferwallListener;
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallAdapterApi
    public void initOfferwall(final String str, final String str2, final JSONObject jSONObject) {
        IronLog.ADAPTER_API.verbose(getProviderName() + " userId=" + str2);
        setParamsBeforeInit(jSONObject);
        postOnUIThread(new Runnable() { // from class: com.ironsource.adapters.supersonicads.SupersonicAdsAdapter.3
            @Override // java.lang.Runnable
            public void run() {
                try {
                    HashMap offerwallExtraParams = SupersonicAdsAdapter.this.getOfferwallExtraParams(jSONObject);
                    SupersonicAdsAdapter.this.mSSAPublisher = SSAFactory.getPublisherInstance(ContextProvider.getInstance().getCurrentActiveActivity());
                    if (SupersonicAdsAdapter.this.mDidSetConsent) {
                        SupersonicAdsAdapter supersonicAdsAdapter = SupersonicAdsAdapter.this;
                        supersonicAdsAdapter.applyConsent(supersonicAdsAdapter.mConsent);
                    }
                    IronLog.ADAPTER_API.verbose(SupersonicAdsAdapter.this.getProviderName() + " mSSAPublisher.initOfferWall");
                    SupersonicAdsAdapter.this.mSSAPublisher.initOfferWall(str, str2, offerwallExtraParams, SupersonicAdsAdapter.this);
                    SupersonicAdsAdapter.mDidInitSdk.set(true);
                } catch (Exception e) {
                    e.printStackTrace();
                    IronLog.ADAPTER_API.error(SupersonicAdsAdapter.this.getProviderName() + ":initOfferwall(userId:" + str2 + ")" + e);
                    SupersonicAdsAdapter.this.mOfferwallListener.onOfferwallAvailable(false, ErrorBuilder.buildInitFailedError("Adapter initialization failure - " + SupersonicAdsAdapter.this.getProviderName() + " - " + e.getMessage(), IronSourceConstants.OFFERWALL_AD_UNIT));
                }
            }
        });
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallAdapterApi
    public void getOfferwallCredits() {
        if (this.mSSAPublisher != null) {
            String ironSourceAppKey = IronSourceObject.getInstance().getIronSourceAppKey();
            String ironSourceUserId = IronSourceObject.getInstance().getIronSourceUserId();
            IronLog.ADAPTER_API.verbose(getProviderName() + " mSSAPublisher.getOfferWallCredits userId=" + ironSourceUserId);
            this.mSSAPublisher.getOfferWallCredits(ironSourceAppKey, ironSourceUserId, this);
            return;
        }
        IronLog.INTERNAL.error("Please call init before calling getOfferwallCredits");
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallAdapterApi
    public void showOfferwall(String str, JSONObject jSONObject) {
        HashMap<String, String> offerwallExtraParams = getOfferwallExtraParams(jSONObject);
        if (offerwallExtraParams != null) {
            offerwallExtraParams.put(Constants.PLACEMENT_ID, str);
        }
        if (this.mSSAPublisher != null) {
            IronLog.ADAPTER_API.verbose(getProviderName() + " mSSAPublisher.showOfferWall");
            this.mSSAPublisher.showOfferWall(offerwallExtraParams);
            return;
        }
        IronLog.INTERNAL.error("Please call init before calling showOfferwall");
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter, com.ironsource.mediationsdk.sdk.BannerAdapterApi
    public void initBanners(final String str, String str2, final JSONObject jSONObject, BannerSmashListener bannerSmashListener) {
        IronLog.ADAPTER_API.verbose(getProviderName());
        setParamsBeforeInit(jSONObject);
        postOnUIThread(new Runnable() { // from class: com.ironsource.adapters.supersonicads.SupersonicAdsAdapter.4
            @Override // java.lang.Runnable
            public void run() {
                try {
                    String mediationUserId = IronSourceUtils.getMediationUserId();
                    HashMap bannerExtraParams = SupersonicAdsAdapter.this.getBannerExtraParams(jSONObject);
                    SupersonicAdsAdapter.this.mSSAPublisher = SSAFactory.getPublisherInstance(ContextProvider.getInstance().getCurrentActiveActivity());
                    if (SupersonicAdsAdapter.this.mDidSetConsent) {
                        SupersonicAdsAdapter supersonicAdsAdapter = SupersonicAdsAdapter.this;
                        supersonicAdsAdapter.applyConsent(supersonicAdsAdapter.mConsent);
                    }
                    IronLog.ADAPTER_API.verbose(SupersonicAdsAdapter.this.getProviderName() + " mSSAPublisher.initBanner userId=" + mediationUserId);
                    SupersonicAdsAdapter.this.mSSAPublisher.initBanner(str, mediationUserId, SupersonicAdsAdapter.this.getProviderName(), bannerExtraParams, SupersonicAdsAdapter.this);
                    SupersonicAdsAdapter.mDidInitSdk.set(true);
                } catch (Exception e) {
                    e.printStackTrace();
                    SupersonicAdsAdapter.this.onBannerInitFailed(e.getMessage());
                }
            }
        });
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter, com.ironsource.mediationsdk.sdk.BannerAdapterApi
    public void loadBanner(final IronSourceBannerLayout ironSourceBannerLayout, JSONObject jSONObject, BannerSmashListener bannerSmashListener) {
        try {
            if (this.mSSAPublisher == null) {
                IronLog.INTERNAL.error("Please call initBanner before calling loadBanner");
                for (BannerSmashListener bannerSmashListener2 : this.mAllBannerSmashes) {
                    if (bannerSmashListener2 != null) {
                        bannerSmashListener2.onBannerAdLoadFailed(ErrorBuilder.buildLoadFailedError("Load was called before Init"));
                    }
                }
            }
            this.mActiveBannerSmash = bannerSmashListener;
            ISNAdView iSNAdView = this.mIsnAdView;
            if (iSNAdView != null && !this.mIsAlreadyShowing) {
                iSNAdView.performCleanup();
                this.mIsnAdView = null;
            }
            final JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("demandSourceName", getProviderName());
            jSONObject2.put(Constants.ParametersKeys.PRODUCT_TYPE, SSAEnums.ProductType.Banner);
            postOnUIThread(new Runnable() { // from class: com.ironsource.adapters.supersonicads.SupersonicAdsAdapter.5
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        if (!SupersonicAdsAdapter.this.mIsAlreadyShowing) {
                            SupersonicAdsAdapter supersonicAdsAdapter = SupersonicAdsAdapter.this;
                            supersonicAdsAdapter.mIsnAdView = supersonicAdsAdapter.createBanner(ironSourceBannerLayout.getActivity(), ironSourceBannerLayout.getSize(), SupersonicAdsAdapter.this.mActiveBannerSmash);
                        }
                        if (SupersonicAdsAdapter.this.mIsnAdView != null) {
                            IronLog.ADAPTER_API.verbose("mIsnAdView.loadAd");
                            SupersonicAdsAdapter.this.mIsnAdView.loadAd(jSONObject2);
                        }
                    } catch (Exception e) {
                        IronSourceError ironSourceErrorBuildLoadFailedError = ErrorBuilder.buildLoadFailedError("Banner Load Fail, " + SupersonicAdsAdapter.this.getProviderName() + " - " + e.getMessage());
                        if (SupersonicAdsAdapter.this.mActiveBannerSmash != null) {
                            SupersonicAdsAdapter.this.mActiveBannerSmash.onBannerAdLoadFailed(ironSourceErrorBuildLoadFailedError);
                        }
                    }
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter, com.ironsource.mediationsdk.sdk.BannerAdapterApi
    public void reloadBanner(IronSourceBannerLayout ironSourceBannerLayout, JSONObject jSONObject, BannerSmashListener bannerSmashListener) {
        try {
            if (this.mIsnAdView != null) {
                IronLog.ADAPTER_API.verbose("mIsnAdView.loadAd");
                this.mIsnAdView.loadAd(jSONObject);
            }
        } catch (Exception e) {
            e.printStackTrace();
            IronLog.INTERNAL.error(getProviderName() + " reloadBanner Failed to reload banner ad");
        }
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter, com.ironsource.mediationsdk.sdk.BannerAdapterApi
    public void destroyBanner(JSONObject jSONObject) {
        this.mIsAlreadyShowing = false;
        if (this.mIsnAdView != null) {
            IronLog.ADAPTER_API.verbose(getProviderName() + " mIsnAdView.performCleanup");
            this.mIsnAdView.performCleanup();
            this.mIsnAdView = null;
        }
    }

    private void setParamsBeforeInit(JSONObject jSONObject) {
        if (mDidSetInitParams.compareAndSet(false, true)) {
            SDKUtils.setControllerUrl(jSONObject.optString("controllerUrl"));
            int iOptInt = jSONObject.optInt(Constants.FeaturesManager.DEBUG_MODE, 0);
            if (isAdaptersDebugEnabled()) {
                iOptInt = 3;
            }
            SDKUtils.setDebugMode(iOptInt);
            SDKUtils.setControllerConfig(jSONObject.optString(Constants.RequestParameters.CONTROLLER_CONFIG, ""));
            IronLog.ADAPTER_API.verbose(getProviderName() + "setting controller url to  " + jSONObject.optString("controllerUrl"));
            IronLog.ADAPTER_API.verbose(getProviderName() + "setting controller config to  " + jSONObject.optString(Constants.RequestParameters.CONTROLLER_CONFIG));
            IronLog.ADAPTER_API.verbose(getProviderName() + "setting debug mode to " + iOptInt);
        }
    }

    private HashMap<String, String> getGenenralExtraParams() {
        HashMap<String, String> map = new HashMap<>();
        if (!TextUtils.isEmpty(this.mUserAgeGroup)) {
            map.put(TokenConstants.APPLICATION_USER_AGE_GROUP, this.mUserAgeGroup);
        }
        if (!TextUtils.isEmpty(this.mUserGender)) {
            map.put(TokenConstants.APPLICATION_USER_GENDER, this.mUserGender);
        }
        String pluginType = getPluginType();
        if (!TextUtils.isEmpty(pluginType)) {
            map.put(TokenConstants.SDK_PLUGIN_TYPE, pluginType);
        }
        return map;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public HashMap<String, String> getRewardedVideoExtraParams(JSONObject jSONObject) {
        HashMap<String, String> genenralExtraParams = getGenenralExtraParams();
        String strOptString = jSONObject.optString("language");
        if (!TextUtils.isEmpty(strOptString)) {
            genenralExtraParams.put("language", strOptString);
        }
        String strOptString2 = jSONObject.optString("maxVideoLength");
        if (!TextUtils.isEmpty(strOptString2)) {
            genenralExtraParams.put("maxVideoLength", strOptString2);
        }
        String strOptString3 = jSONObject.optString(Constants.RequestParameters.CAMPAIGN_ID);
        if (!TextUtils.isEmpty(strOptString3)) {
            genenralExtraParams.put(Constants.RequestParameters.CAMPAIGN_ID, strOptString3);
        }
        if (!TextUtils.isEmpty(this.mMediationSegment)) {
            genenralExtraParams.put("custom_Segment", this.mMediationSegment);
        }
        addItemNameCountSignature(genenralExtraParams, jSONObject);
        Map<String, String> rewardedVideoCustomParams = SupersonicConfig.getConfigObj().getRewardedVideoCustomParams();
        if (rewardedVideoCustomParams != null && !rewardedVideoCustomParams.isEmpty()) {
            genenralExtraParams.putAll(rewardedVideoCustomParams);
        }
        return genenralExtraParams;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public HashMap<String, String> getInterstitialExtraParams() {
        return getGenenralExtraParams();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public HashMap<String, String> getOfferwallExtraParams(JSONObject jSONObject) {
        HashMap<String, String> genenralExtraParams = getGenenralExtraParams();
        String strOptString = jSONObject.optString("language");
        if (!TextUtils.isEmpty(strOptString)) {
            genenralExtraParams.put("language", strOptString);
        }
        genenralExtraParams.put(Constants.ParametersKeys.USE_CLIENT_SIDE_CALLBACKS, String.valueOf(SupersonicConfig.getConfigObj().getClientSideCallbacks()));
        Map<String, String> offerwallCustomParams = SupersonicConfig.getConfigObj().getOfferwallCustomParams();
        if (offerwallCustomParams != null && !offerwallCustomParams.isEmpty()) {
            genenralExtraParams.putAll(offerwallCustomParams);
        }
        addItemNameCountSignature(genenralExtraParams, jSONObject);
        return genenralExtraParams;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public HashMap<String, String> getBannerExtraParams(JSONObject jSONObject) {
        return getGenenralExtraParams();
    }

    private void addItemNameCountSignature(HashMap<String, String> map, JSONObject jSONObject) {
        try {
            String strOptString = jSONObject.optString("itemName");
            int iOptInt = jSONObject.optInt("itemCount", -1);
            String strOptString2 = jSONObject.optString("privateKey");
            boolean z = true;
            boolean z2 = false;
            if (TextUtils.isEmpty(strOptString)) {
                z = false;
            } else {
                map.put("itemName", strOptString);
            }
            if (TextUtils.isEmpty(strOptString2)) {
                z = false;
            }
            if (iOptInt != -1) {
                map.put("itemCount", String.valueOf(iOptInt));
                z2 = z;
            }
            if (z2) {
                int currentTimestamp = IronSourceUtils.getCurrentTimestamp();
                map.put(DataBaseEventsStorage.EventEntry.COLUMN_NAME_TIMESTAMP, String.valueOf(currentTimestamp));
                map.put("itemSignature", createItemSig(currentTimestamp, strOptString, iOptInt, strOptString2));
            }
        } catch (Exception e) {
            IronLog.ADAPTER_API.error(" addItemNameCountSignature" + e);
        }
    }

    private String createItemSig(int i, String str, int i2, String str2) {
        return IronSourceUtils.getMD5(i + str + i2 + str2);
    }

    private String createMinimumOfferCommissionSig(double d, String str) {
        return IronSourceUtils.getMD5(d + str);
    }

    private String createUserCreationDateSig(String str, String str2, String str3) {
        return IronSourceUtils.getMD5(str + str2 + str3);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0041  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x007e A[PHI: r7
      0x007e: PHI (r7v1 int) = (r7v0 int), (r7v3 int) binds: [B:22:0x0048, B:40:0x007b] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.ironsource.sdk.ISNAdView.ISNAdView createBanner(android.app.Activity r9, com.ironsource.mediationsdk.ISBannerSize r10, com.ironsource.mediationsdk.sdk.BannerSmashListener r11) {
        /*
            r8 = this;
            java.lang.String r0 = r10.getDescription()
            int r1 = r0.hashCode()
            r2 = 3
            r3 = 2
            r4 = 1
            switch(r1) {
                case -387072689: goto L37;
                case 72205083: goto L2d;
                case 79011241: goto L23;
                case 1951953708: goto L19;
                case 1999208305: goto Lf;
                default: goto Le;
            }
        Le:
            goto L41
        Lf:
            java.lang.String r1 = "CUSTOM"
            boolean r1 = r0.equals(r1)
            if (r1 == 0) goto L41
            r1 = 3
            goto L42
        L19:
            java.lang.String r1 = "BANNER"
            boolean r1 = r0.equals(r1)
            if (r1 == 0) goto L41
            r1 = 0
            goto L42
        L23:
            java.lang.String r1 = "SMART"
            boolean r1 = r0.equals(r1)
            if (r1 == 0) goto L41
            r1 = 2
            goto L42
        L2d:
            java.lang.String r1 = "LARGE"
            boolean r1 = r0.equals(r1)
            if (r1 == 0) goto L41
            r1 = 1
            goto L42
        L37:
            java.lang.String r1 = "RECTANGLE"
            boolean r1 = r0.equals(r1)
            if (r1 == 0) goto L41
            r1 = 4
            goto L42
        L41:
            r1 = -1
        L42:
            r5 = 90
            r6 = 50
            r7 = 320(0x140, float:4.48E-43)
            if (r1 == 0) goto L7e
            if (r1 == r4) goto L80
            if (r1 == r3) goto L71
            java.lang.String r3 = "SupersonicAds"
            r4 = 0
            if (r1 == r2) goto L5d
            if (r11 == 0) goto L5c
            com.ironsource.mediationsdk.logger.IronSourceError r9 = com.ironsource.mediationsdk.utils.ErrorBuilder.unsupportedBannerSize(r3)
            r11.onBannerAdLoadFailed(r9)
        L5c:
            return r4
        L5d:
            int r10 = r10.getHeight()
            if (r10 == r6) goto L6f
            if (r10 == r5) goto L6f
            if (r11 == 0) goto L6e
            com.ironsource.mediationsdk.logger.IronSourceError r9 = com.ironsource.mediationsdk.utils.ErrorBuilder.unsupportedBannerSize(r3)
            r11.onBannerAdLoadFailed(r9)
        L6e:
            return r4
        L6f:
            r5 = r10
            goto L80
        L71:
            boolean r10 = com.ironsource.mediationsdk.AdapterUtils.isLargeScreen(r9)
            if (r10 == 0) goto L7b
            r11 = 728(0x2d8, float:1.02E-42)
            r7 = 728(0x2d8, float:1.02E-42)
        L7b:
            if (r10 == 0) goto L7e
            goto L80
        L7e:
            r5 = 50
        L80:
            int r10 = com.ironsource.mediationsdk.AdapterUtils.dpToPixels(r9, r7)
            int r11 = com.ironsource.mediationsdk.AdapterUtils.dpToPixels(r9, r5)
            com.ironsource.sdk.ISAdSize r1 = new com.ironsource.sdk.ISAdSize
            r1.<init>(r10, r11, r0)
            com.ironsource.sdk.SSAPublisher r10 = r8.mSSAPublisher
            com.ironsource.sdk.ISNAdView.ISNAdView r9 = r10.createBanner(r9, r1)
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ironsource.adapters.supersonicads.SupersonicAdsAdapter.createBanner(android.app.Activity, com.ironsource.mediationsdk.ISBannerSize, com.ironsource.mediationsdk.sdk.BannerSmashListener):com.ironsource.sdk.ISNAdView.ISNAdView");
    }

    @Override // com.ironsource.sdk.listeners.OnRewardedVideoListener
    public void onRVNoMoreOffers() {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        this.mIsRVAvailable = false;
        for (RewardedVideoSmashListener rewardedVideoSmashListener : this.mAllRewardedVideoSmashes) {
            if (rewardedVideoSmashListener != null) {
                rewardedVideoSmashListener.onRewardedVideoAvailabilityChanged(false);
            }
        }
    }

    @Override // com.ironsource.sdk.listeners.OnRewardedVideoListener
    public void onRVInitSuccess(AdUnitsReady adUnitsReady) {
        int i;
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        try {
            i = Integer.parseInt(adUnitsReady.getNumOfAdUnits());
        } catch (NumberFormatException e) {
            IronLog.INTERNAL.error("parseInt()" + e);
            i = 0;
        }
        boolean z = i > 0;
        this.mIsRVAvailable = z;
        for (RewardedVideoSmashListener rewardedVideoSmashListener : this.mAllRewardedVideoSmashes) {
            if (rewardedVideoSmashListener != null) {
                rewardedVideoSmashListener.onRewardedVideoAvailabilityChanged(z);
            }
        }
    }

    @Override // com.ironsource.sdk.listeners.OnRewardedVideoListener
    public void onRVInitFail(String str) {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        for (RewardedVideoSmashListener rewardedVideoSmashListener : this.mAllRewardedVideoSmashes) {
            if (rewardedVideoSmashListener != null) {
                rewardedVideoSmashListener.onRewardedVideoAvailabilityChanged(false);
            }
        }
    }

    @Override // com.ironsource.sdk.listeners.OnRewardedVideoListener
    public void onRVAdClicked() {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        if (this.mActiveRewardedVideoSmash != null) {
            this.mActiveRewardedVideoSmash.onRewardedVideoAdClicked();
        }
    }

    @Override // com.ironsource.sdk.listeners.OnRewardedVideoListener
    public void onRVEventNotificationReceived(String str, JSONObject jSONObject) {
        if (jSONObject != null) {
            IronLog.ADAPTER_CALLBACK.verbose(getProviderName() + " " + str + " extData: " + jSONObject.toString());
        }
        if (TextUtils.isEmpty(str) || !"impressions".equals(str) || this.mActiveRewardedVideoSmash == null) {
            return;
        }
        this.mActiveRewardedVideoSmash.onRewardedVideoAdVisible();
    }

    @Override // com.ironsource.sdk.listeners.OnRewardedVideoListener
    public void onRVShowFail(String str) {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        if (this.mActiveRewardedVideoSmash != null) {
            this.mActiveRewardedVideoSmash.onRewardedVideoAdShowFailed(new IronSourceError(509, str));
        }
    }

    @Override // com.ironsource.sdk.listeners.OnRewardedVideoListener
    public void onRVAdCredited(int i) {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        if (this.mActiveRewardedVideoSmash != null) {
            this.mActiveRewardedVideoSmash.onRewardedVideoAdRewarded();
        }
    }

    @Override // com.ironsource.sdk.listeners.OnRewardedVideoListener
    public void onRVAdClosed() {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        if (this.mActiveRewardedVideoSmash != null) {
            this.mActiveRewardedVideoSmash.onRewardedVideoAdClosed();
        }
    }

    @Override // com.ironsource.sdk.listeners.OnRewardedVideoListener
    public void onRVAdOpened() {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        if (this.mActiveRewardedVideoSmash != null) {
            this.mActiveRewardedVideoSmash.onRewardedVideoAdOpened();
        }
    }

    @Override // com.ironsource.sdk.listeners.OnInterstitialListener
    public void onInterstitialInitSuccess() {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        for (InterstitialSmashListener interstitialSmashListener : this.mAllInterstitialSmashes) {
            if (interstitialSmashListener != null) {
                interstitialSmashListener.onInterstitialInitSuccess();
            }
        }
    }

    @Override // com.ironsource.sdk.listeners.OnInterstitialListener
    public void onInterstitialInitFailed(String str) {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        for (InterstitialSmashListener interstitialSmashListener : this.mAllInterstitialSmashes) {
            if (interstitialSmashListener != null) {
                interstitialSmashListener.onInterstitialInitFailed(ErrorBuilder.buildInitFailedError(str, "Interstitial"));
            }
        }
    }

    @Override // com.ironsource.sdk.listeners.OnInterstitialListener
    public void onInterstitialLoadSuccess() {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        for (InterstitialSmashListener interstitialSmashListener : this.mAllInterstitialSmashes) {
            if (interstitialSmashListener != null) {
                interstitialSmashListener.onInterstitialAdReady();
            }
        }
    }

    @Override // com.ironsource.sdk.listeners.OnInterstitialListener
    public void onInterstitialLoadFailed(String str) {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        for (InterstitialSmashListener interstitialSmashListener : this.mAllInterstitialSmashes) {
            if (interstitialSmashListener != null) {
                interstitialSmashListener.onInterstitialAdLoadFailed(ErrorBuilder.buildLoadFailedError(str));
            }
        }
    }

    @Override // com.ironsource.sdk.listeners.OnInterstitialListener
    public void onInterstitialOpen() {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        if (this.mActiveInterstitialSmash != null) {
            this.mActiveInterstitialSmash.onInterstitialAdOpened();
        }
    }

    @Override // com.ironsource.sdk.listeners.OnInterstitialListener
    public void onInterstitialClose() {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        if (this.mActiveInterstitialSmash != null) {
            this.mActiveInterstitialSmash.onInterstitialAdClosed();
        }
    }

    @Override // com.ironsource.sdk.listeners.OnInterstitialListener
    public void onInterstitialShowSuccess() {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        if (this.mActiveInterstitialSmash != null) {
            this.mActiveInterstitialSmash.onInterstitialAdShowSucceeded();
        }
    }

    @Override // com.ironsource.sdk.listeners.OnInterstitialListener
    public void onInterstitialShowFailed(String str) {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        if (this.mActiveInterstitialSmash != null) {
            this.mActiveInterstitialSmash.onInterstitialAdShowFailed(ErrorBuilder.buildShowFailedError("Interstitial", str));
        }
    }

    @Override // com.ironsource.sdk.listeners.OnInterstitialListener
    public void onInterstitialClick() {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        if (this.mActiveInterstitialSmash != null) {
            this.mActiveInterstitialSmash.onInterstitialAdClicked();
        }
    }

    @Override // com.ironsource.sdk.listeners.OnInterstitialListener
    public void onInterstitialEventNotificationReceived(String str, JSONObject jSONObject) {
        if (jSONObject != null) {
            IronLog.ADAPTER_CALLBACK.verbose(getProviderName() + " " + str + " extData: " + jSONObject.toString());
            if (TextUtils.isEmpty(str) || !"impressions".equals(str) || this.mActiveInterstitialSmash == null) {
                return;
            }
            this.mActiveInterstitialSmash.onInterstitialAdVisible();
        }
    }

    @Override // com.ironsource.sdk.listeners.OnOfferWallListener
    public void onOfferwallInitSuccess() {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        InternalOfferwallListener internalOfferwallListener = this.mOfferwallListener;
        if (internalOfferwallListener != null) {
            internalOfferwallListener.onOfferwallAvailable(true);
        }
    }

    @Override // com.ironsource.sdk.listeners.OnOfferWallListener
    public void onOfferwallInitFail(String str) {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        if (this.mOfferwallListener != null) {
            this.mOfferwallListener.onOfferwallAvailable(false, ErrorBuilder.buildGenericError(str));
        }
    }

    @Override // com.ironsource.sdk.listeners.OnOfferWallListener
    public void onOfferwallEventNotificationReceived(String str, JSONObject jSONObject) {
        if (jSONObject != null) {
            IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        }
    }

    @Override // com.ironsource.sdk.listeners.OnOfferWallListener
    public void onOWShowSuccess(String str) {
        if (TextUtils.isEmpty(str)) {
            IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        } else {
            IronLog.ADAPTER_CALLBACK.verbose(getProviderName() + ":onOWShowSuccess(placementId:" + str + ")");
        }
        InternalOfferwallListener internalOfferwallListener = this.mOfferwallListener;
        if (internalOfferwallListener != null) {
            internalOfferwallListener.onOfferwallOpened();
        }
    }

    @Override // com.ironsource.sdk.listeners.OnOfferWallListener
    public void onOWShowFail(String str) {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        if (this.mOfferwallListener != null) {
            this.mOfferwallListener.onOfferwallShowFailed(ErrorBuilder.buildGenericError(str));
        }
    }

    @Override // com.ironsource.sdk.listeners.OnOfferWallListener
    public boolean onOWAdCredited(int i, int i2, boolean z) {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        InternalOfferwallListener internalOfferwallListener = this.mOfferwallListener;
        return internalOfferwallListener != null && internalOfferwallListener.onOfferwallAdCredited(i, i2, z);
    }

    @Override // com.ironsource.sdk.listeners.OnOfferWallListener
    public void onOWAdClosed() {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        InternalOfferwallListener internalOfferwallListener = this.mOfferwallListener;
        if (internalOfferwallListener != null) {
            internalOfferwallListener.onOfferwallClosed();
        }
    }

    @Override // com.ironsource.sdk.listeners.OnOfferWallListener
    public void onGetOWCreditsFailed(String str) {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        if (this.mOfferwallListener != null) {
            this.mOfferwallListener.onGetOfferwallCreditsFailed(ErrorBuilder.buildGenericError(str));
        }
    }

    @Override // com.ironsource.sdk.listeners.OnBannerListener
    public void onBannerInitSuccess() {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        for (BannerSmashListener bannerSmashListener : this.mAllBannerSmashes) {
            if (bannerSmashListener != null) {
                bannerSmashListener.onBannerInitSuccess();
            }
        }
    }

    @Override // com.ironsource.sdk.listeners.OnBannerListener
    public void onBannerInitFailed(String str) {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        for (BannerSmashListener bannerSmashListener : this.mAllBannerSmashes) {
            if (bannerSmashListener != null) {
                bannerSmashListener.onBannerInitFailed(ErrorBuilder.buildInitFailedError(str, IronSourceConstants.BANNER_AD_UNIT));
            }
        }
    }

    @Override // com.ironsource.sdk.listeners.OnBannerListener
    public void onBannerClick() {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        if (this.mActiveBannerSmash != null) {
            this.mActiveBannerSmash.onBannerAdClicked();
        }
    }

    @Override // com.ironsource.sdk.listeners.OnBannerListener
    public void onBannerLoadSuccess() {
        ISNAdView iSNAdView;
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        this.mIsAlreadyShowing = true;
        for (BannerSmashListener bannerSmashListener : this.mAllBannerSmashes) {
            if (bannerSmashListener != null && (iSNAdView = this.mIsnAdView) != null && iSNAdView.getAdViewSize() != null) {
                FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(this.mIsnAdView.getAdViewSize().getWidth(), this.mIsnAdView.getAdViewSize().getHeight());
                layoutParams.gravity = 17;
                bannerSmashListener.onBannerAdLoaded(this.mIsnAdView, layoutParams);
            }
        }
    }

    @Override // com.ironsource.sdk.listeners.OnBannerListener
    public void onBannerLoadFail(String str) {
        IronLog.ADAPTER_CALLBACK.verbose(getProviderName());
        for (BannerSmashListener bannerSmashListener : this.mAllBannerSmashes) {
            if (bannerSmashListener != null) {
                bannerSmashListener.onBannerAdLoadFailed(ErrorBuilder.buildInitFailedError(str, IronSourceConstants.BANNER_AD_UNIT));
            }
        }
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    protected void addBannerListener(BannerSmashListener bannerSmashListener) {
        this.mAllBannerSmashes.add(bannerSmashListener);
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    protected void removeBannerListener(BannerSmashListener bannerSmashListener) {
        this.mAllBannerSmashes.remove(bannerSmashListener);
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    protected void setMediationState(AbstractSmash.MEDIATION_STATE mediation_state, String str) {
        if (this.mSSAPublisher != null) {
            IronLog.ADAPTER_API.verbose(getProviderName() + ": setMediationState(" + str + " , " + getProviderName() + " , " + mediation_state.getValue() + ")");
            this.mSSAPublisher.setMediationState(str, getProviderName(), mediation_state.getValue());
        }
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    protected void setConsent(boolean z) {
        IronLog ironLog = IronLog.ADAPTER_API;
        StringBuilder sb = new StringBuilder();
        sb.append(getProviderName());
        sb.append(": setConsent (");
        sb.append(z ? ServerProtocol.DIALOG_RETURN_SCOPES_TRUE : "false");
        sb.append(")");
        ironLog.verbose(sb.toString());
        this.mDidSetConsent = true;
        this.mConsent = z;
        applyConsent(z);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void applyConsent(boolean z) {
        if (this.mSSAPublisher == null) {
            return;
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(Constants.RequestParameters.GDPR_CONSENT_STATUS, String.valueOf(z));
            jSONObject.put("demandSourceName", getProviderName());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        this.mSSAPublisher.updateConsentInfo(jSONObject);
    }

    @Override // com.ironsource.mediationsdk.AbstractAdapter
    public void earlyInit(String str, String str2, JSONObject jSONObject) {
        IronSourceUtils.sendAutomationLog(getProviderName() + ": earlyInit");
        if (mDidInitSdk.compareAndSet(false, true)) {
            if (isAdaptersDebugEnabled()) {
                SDKUtils.setDebugMode(3);
            } else {
                SDKUtils.setDebugMode(jSONObject.optInt(Constants.FeaturesManager.DEBUG_MODE, 0));
            }
            SDKUtils.setControllerUrl(jSONObject.optString("controllerUrl"));
            IronLog.ADAPTER_API.verbose(getProviderName() + " IronSourceNetwork setting controller url to  " + jSONObject.optString("controllerUrl"));
            SDKUtils.setControllerConfig(jSONObject.optString(Constants.RequestParameters.CONTROLLER_CONFIG, ""));
            IronLog.ADAPTER_API.verbose(getProviderName() + " IronSourceNetwork setting controller config to  " + jSONObject.optString(Constants.RequestParameters.CONTROLLER_CONFIG));
            HashMap<String, String> initParams = getInitParams();
            IronSourceNetwork.initSDK(ContextProvider.getInstance().getCurrentActiveActivity(), str, str2, initParams);
            IronLog.ADAPTER_API.verbose("initSDK with appKey=" + str + " userId=" + str2 + " parameters " + initParams);
        }
    }

    private HashMap<String, String> getInitParams() {
        HashMap<String, String> map = new HashMap<>();
        if (!TextUtils.isEmpty(this.mUserAgeGroup)) {
            map.put(TokenConstants.APPLICATION_USER_AGE_GROUP, this.mUserAgeGroup);
        }
        if (!TextUtils.isEmpty(this.mUserGender)) {
            map.put(TokenConstants.APPLICATION_USER_GENDER, this.mUserGender);
        }
        String pluginType = getPluginType();
        if (!TextUtils.isEmpty(pluginType)) {
            map.put(TokenConstants.SDK_PLUGIN_TYPE, pluginType);
        }
        if (!TextUtils.isEmpty(this.mMediationSegment)) {
            map.put("custom_Segment", this.mMediationSegment);
        }
        if (!TextUtils.isEmpty(IronSourceObject.getInstance().getSessionId())) {
            map.put(Events.SESSION_ID, IronSourceObject.getInstance().getSessionId());
        }
        return map;
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
            IronLog.ADAPTER_API.verbose("not valid");
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
}
