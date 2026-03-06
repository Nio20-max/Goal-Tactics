package com.ironsource.sdk.agent;

import android.app.Activity;
import android.app.Application;
import android.content.MutableContextWrapper;
import android.text.TextUtils;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.sdk.Events.ISNEventParams;
import com.ironsource.sdk.Events.ISNEventsTracker;
import com.ironsource.sdk.Events.ISNEventsUtils;
import com.ironsource.sdk.Events.SDK5Events;
import com.ironsource.sdk.ISAdSize;
import com.ironsource.sdk.ISNAdView.ISNAdView;
import com.ironsource.sdk.IronSourceAdInstance;
import com.ironsource.sdk.IronSourceNetworkAPI;
import com.ironsource.sdk.SSAPublisher;
import com.ironsource.sdk.constants.Constants;
import com.ironsource.sdk.constants.Events;
import com.ironsource.sdk.controller.ControllerManager;
import com.ironsource.sdk.controller.DemandSourceManager;
import com.ironsource.sdk.controller.FeaturesManager;
import com.ironsource.sdk.data.AdUnitsReady;
import com.ironsource.sdk.data.DemandSource;
import com.ironsource.sdk.data.SSAEnums;
import com.ironsource.sdk.listeners.OnBannerListener;
import com.ironsource.sdk.listeners.OnInterstitialListener;
import com.ironsource.sdk.listeners.OnOfferWallListener;
import com.ironsource.sdk.listeners.OnRewardedVideoListener;
import com.ironsource.sdk.listeners.internals.DSAdProductListener;
import com.ironsource.sdk.listeners.internals.DSBannerListener;
import com.ironsource.sdk.listeners.internals.DSInterstitialListener;
import com.ironsource.sdk.listeners.internals.DSRewardedVideoListener;
import com.ironsource.sdk.service.TokenService;
import com.ironsource.sdk.utils.DeviceProperties;
import com.ironsource.sdk.utils.IronSourceAsyncHttpRequestTask;
import com.ironsource.sdk.utils.IronSourceSharedPrefHelper;
import com.ironsource.sdk.utils.Logger;
import com.ironsource.sdk.utils.SDKUtils;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public final class IronSourceAdsPublisherAgent implements SSAPublisher, DSRewardedVideoListener, DSInterstitialListener, DSAdProductListener, DSBannerListener, IronSourceNetworkAPI, OnPauseOnResumeHandler {
    private static final String TAG = "IronSourceAdsPublisherAgent";
    private static MutableContextWrapper mutableContextWrapper;
    private static IronSourceAdsPublisherAgent sInstance;
    private long adViewContainerCounter;
    private String mApplicationKey;
    private ControllerManager mControllerManager;
    private DemandSourceManager mDemandSourceManager;
    private TokenService mTokenService;
    private String mUserId;
    private final String SUPERSONIC_ADS = IronSourceConstants.SUPERSONIC_CONFIG_NAME;
    private boolean mEnableLifeCycleListeners = false;

    private IronSourceAdsPublisherAgent(Activity activity, int i) {
        initPublisherAgent(activity);
    }

    IronSourceAdsPublisherAgent(String str, String str2, Activity activity) {
        this.mApplicationKey = str;
        this.mUserId = str2;
        initPublisherAgent(activity);
    }

    private void initPublisherAgent(Activity activity) {
        try {
            IronSourceSharedPrefHelper.getSupersonicPrefHelper(activity);
            this.mTokenService = createToken(activity);
            this.mDemandSourceManager = new DemandSourceManager();
            this.mControllerManager = new ControllerManager(activity, this.mTokenService, this.mDemandSourceManager);
            Logger.enableLogging(FeaturesManager.getInstance().getDebugMode());
            Logger.i(TAG, "C'tor");
            mutableContextWrapper = new MutableContextWrapper(activity);
            decideOnListeningToApplicationLifeCycleEvents(activity.getApplication(), SDKUtils.getNetworkConfiguration());
            this.adViewContainerCounter = 0L;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private TokenService createToken(Activity activity) {
        TokenService tokenService = TokenService.getInstance();
        tokenService.fetchIndependentData();
        tokenService.fetchDependentData(activity, this.mApplicationKey, this.mUserId);
        return tokenService;
    }

    public static IronSourceNetworkAPI createInstance(Activity activity, String str, String str2) {
        return getInstance(str, str2, activity);
    }

    public static synchronized IronSourceNetworkAPI getInstance(String str, String str2, Activity activity) {
        if (sInstance == null) {
            ISNEventsTracker.logEvent(SDK5Events.initSDK);
            sInstance = new IronSourceAdsPublisherAgent(str, str2, activity);
        } else {
            mutableContextWrapper.setBaseContext(activity);
            TokenService.getInstance().collectApplicationKey(str);
            TokenService.getInstance().collectApplicationUserId(str2);
        }
        return sInstance;
    }

    public static synchronized IronSourceAdsPublisherAgent getInstance(Activity activity) throws Exception {
        return getInstance(activity, 0);
    }

    public static synchronized IronSourceAdsPublisherAgent getInstance(Activity activity, int i) throws Exception {
        Logger.i(TAG, "getInstance()");
        if (sInstance == null) {
            sInstance = new IronSourceAdsPublisherAgent(activity, i);
        } else {
            mutableContextWrapper.setBaseContext(activity);
        }
        return sInstance;
    }

    public ControllerManager getControllerManager() {
        return this.mControllerManager;
    }

    private OnRewardedVideoListener getAdProductListenerAsRVListener(DemandSource demandSource) {
        if (demandSource == null) {
            return null;
        }
        return (OnRewardedVideoListener) demandSource.getListener();
    }

    private OnInterstitialListener getAdProductListenerAsISListener(DemandSource demandSource) {
        if (demandSource == null) {
            return null;
        }
        return (OnInterstitialListener) demandSource.getListener();
    }

    private OnBannerListener getAdProductListenerAsBNListener(DemandSource demandSource) {
        if (demandSource == null) {
            return null;
        }
        return (OnBannerListener) demandSource.getListener();
    }

    @Override // com.ironsource.sdk.SSAPublisher
    public void initRewardedVideo(final String str, final String str2, String str3, Map<String, String> map, OnRewardedVideoListener onRewardedVideoListener) {
        this.mApplicationKey = str;
        this.mUserId = str2;
        final DemandSource demandSourceCreateDemandSource = this.mDemandSourceManager.createDemandSource(SSAEnums.ProductType.RewardedVideo, str3, map, onRewardedVideoListener);
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.1
            @Override // java.lang.Runnable
            public void run() {
                IronSourceAdsPublisherAgent.this.mControllerManager.initRewardedVideo(str, str2, demandSourceCreateDemandSource, IronSourceAdsPublisherAgent.this);
            }
        });
    }

    @Override // com.ironsource.sdk.SSAPublisher
    public void showRewardedVideo(final JSONObject jSONObject) {
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.2
            @Override // java.lang.Runnable
            public void run() {
                IronSourceAdsPublisherAgent.this.mControllerManager.showRewardedVideo(jSONObject, IronSourceAdsPublisherAgent.this);
            }
        });
    }

    @Override // com.ironsource.sdk.SSAPublisher
    public void initOfferWall(final String str, final String str2, final Map<String, String> map, final OnOfferWallListener onOfferWallListener) {
        this.mApplicationKey = str;
        this.mUserId = str2;
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.3
            @Override // java.lang.Runnable
            public void run() {
                IronSourceAdsPublisherAgent.this.mControllerManager.initOfferWall(str, str2, map, onOfferWallListener);
            }
        });
    }

    @Override // com.ironsource.sdk.IronSourceNetworkAds
    public void initOfferWall(final Map<String, String> map, final OnOfferWallListener onOfferWallListener) {
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.4
            @Override // java.lang.Runnable
            public void run() {
                IronSourceAdsPublisherAgent.this.mControllerManager.initOfferWall(IronSourceAdsPublisherAgent.this.mApplicationKey, IronSourceAdsPublisherAgent.this.mUserId, map, onOfferWallListener);
            }
        });
    }

    @Override // com.ironsource.sdk.SSAPublisher, com.ironsource.sdk.IronSourceNetworkAds
    public void showOfferWall(final Map<String, String> map) {
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.5
            @Override // java.lang.Runnable
            public void run() {
                IronSourceAdsPublisherAgent.this.mControllerManager.showOfferWall(map);
            }
        });
    }

    @Override // com.ironsource.sdk.SSAPublisher
    public void getOfferWallCredits(final String str, final String str2, final OnOfferWallListener onOfferWallListener) {
        this.mApplicationKey = str;
        this.mUserId = str2;
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.6
            @Override // java.lang.Runnable
            public void run() {
                IronSourceAdsPublisherAgent.this.mControllerManager.getOfferWallCredits(str, str2, onOfferWallListener);
            }
        });
    }

    @Override // com.ironsource.sdk.IronSourceNetworkAds
    public void getOfferWallCredits(final OnOfferWallListener onOfferWallListener) {
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.7
            @Override // java.lang.Runnable
            public void run() {
                IronSourceAdsPublisherAgent.this.mControllerManager.getOfferWallCredits(IronSourceAdsPublisherAgent.this.mApplicationKey, IronSourceAdsPublisherAgent.this.mUserId, onOfferWallListener);
            }
        });
    }

    @Override // com.ironsource.sdk.SSAPublisher
    public void initInterstitial(final String str, final String str2, String str3, Map<String, String> map, OnInterstitialListener onInterstitialListener) {
        this.mApplicationKey = str;
        this.mUserId = str2;
        final DemandSource demandSourceCreateDemandSource = this.mDemandSourceManager.createDemandSource(SSAEnums.ProductType.Interstitial, str3, map, onInterstitialListener);
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.8
            @Override // java.lang.Runnable
            public void run() {
                IronSourceAdsPublisherAgent.this.mControllerManager.initInterstitial(str, str2, demandSourceCreateDemandSource, IronSourceAdsPublisherAgent.this);
            }
        });
    }

    @Override // com.ironsource.sdk.SSAPublisher
    public void loadInterstitial(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        final String strOptString = jSONObject.optString("demandSourceName");
        if (TextUtils.isEmpty(strOptString)) {
            return;
        }
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.9
            @Override // java.lang.Runnable
            public void run() {
                IronSourceAdsPublisherAgent.this.mControllerManager.loadInterstitial(strOptString, IronSourceAdsPublisherAgent.this);
            }
        });
    }

    @Override // com.ironsource.sdk.SSAPublisher
    public boolean isInterstitialAdAvailable(String str) {
        return this.mControllerManager.isInterstitialAdAvailable(str);
    }

    @Override // com.ironsource.sdk.SSAPublisher
    public void showInterstitial(final JSONObject jSONObject) {
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.10
            @Override // java.lang.Runnable
            public void run() {
                IronSourceAdsPublisherAgent.this.mControllerManager.showInterstitial(jSONObject, IronSourceAdsPublisherAgent.this);
            }
        });
    }

    @Override // com.ironsource.sdk.SSAPublisher
    public void initBanner(final String str, final String str2, String str3, Map<String, String> map, OnBannerListener onBannerListener) {
        this.mApplicationKey = str;
        this.mUserId = str2;
        final DemandSource demandSourceCreateDemandSource = this.mDemandSourceManager.createDemandSource(SSAEnums.ProductType.Banner, str3, map, onBannerListener);
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.11
            @Override // java.lang.Runnable
            public void run() {
                IronSourceAdsPublisherAgent.this.mControllerManager.initBanner(str, str2, demandSourceCreateDemandSource, IronSourceAdsPublisherAgent.this);
            }
        });
    }

    @Override // com.ironsource.sdk.IronSourceNetworkAds
    public void initBanner(String str, Map<String, String> map, OnBannerListener onBannerListener) {
        final DemandSource demandSourceCreateDemandSource = this.mDemandSourceManager.createDemandSource(SSAEnums.ProductType.Banner, str, map, onBannerListener);
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.12
            @Override // java.lang.Runnable
            public void run() {
                IronSourceAdsPublisherAgent.this.mControllerManager.initBanner(IronSourceAdsPublisherAgent.this.mApplicationKey, IronSourceAdsPublisherAgent.this.mUserId, demandSourceCreateDemandSource, IronSourceAdsPublisherAgent.this);
            }
        });
    }

    @Override // com.ironsource.sdk.SSAPublisher, com.ironsource.sdk.IronSourceNetworkAds
    public void loadBanner(final JSONObject jSONObject) {
        if (jSONObject != null) {
            this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.13
                @Override // java.lang.Runnable
                public void run() {
                    IronSourceAdsPublisherAgent.this.mControllerManager.loadBanner(jSONObject, IronSourceAdsPublisherAgent.this);
                }
            });
        }
    }

    @Override // com.ironsource.sdk.SSAPublisher, com.ironsource.sdk.IronSourceNetworkAPI
    public void onResume(Activity activity) {
        if (this.mEnableLifeCycleListeners) {
            return;
        }
        handleOnResume(activity);
    }

    @Override // com.ironsource.sdk.SSAPublisher, com.ironsource.sdk.IronSourceNetworkAPI
    public void onPause(Activity activity) {
        if (this.mEnableLifeCycleListeners) {
            return;
        }
        handleOnPause(activity);
    }

    @Override // com.ironsource.sdk.SSAPublisher, com.ironsource.sdk.IronSourceNetworkAPI
    public void release(Activity activity) {
        try {
            Logger.i(TAG, "release()");
            DeviceProperties.release();
            this.mControllerManager.unregisterConnectionReceiver(activity);
            this.mControllerManager.destroy();
            this.mControllerManager = null;
        } catch (Exception unused) {
        }
        sInstance = null;
    }

    @Override // com.ironsource.sdk.listeners.internals.DSAdProductListener
    public void onAdProductInitSuccess(SSAEnums.ProductType productType, String str, AdUnitsReady adUnitsReady) {
        OnBannerListener adProductListenerAsBNListener;
        DemandSource demandSourceByName = getDemandSourceByName(productType, str);
        if (demandSourceByName != null) {
            demandSourceByName.setDemandSourceInitState(2);
            if (productType == SSAEnums.ProductType.RewardedVideo) {
                OnRewardedVideoListener adProductListenerAsRVListener = getAdProductListenerAsRVListener(demandSourceByName);
                if (adProductListenerAsRVListener != null) {
                    adProductListenerAsRVListener.onRVInitSuccess(adUnitsReady);
                    return;
                }
                return;
            }
            if (productType == SSAEnums.ProductType.Interstitial) {
                OnInterstitialListener adProductListenerAsISListener = getAdProductListenerAsISListener(demandSourceByName);
                if (adProductListenerAsISListener != null) {
                    adProductListenerAsISListener.onInterstitialInitSuccess();
                    return;
                }
                return;
            }
            if (productType != SSAEnums.ProductType.Banner || (adProductListenerAsBNListener = getAdProductListenerAsBNListener(demandSourceByName)) == null) {
                return;
            }
            adProductListenerAsBNListener.onBannerInitSuccess();
        }
    }

    @Override // com.ironsource.sdk.listeners.internals.DSAdProductListener
    public void onAdProductInitFailed(SSAEnums.ProductType productType, String str, String str2) {
        OnBannerListener adProductListenerAsBNListener;
        DemandSource demandSourceByName = getDemandSourceByName(productType, str);
        ISNEventParams iSNEventParamsAddPair = new ISNEventParams().addPair(Events.DEMAND_SOURCE_NAME, str).addPair(Events.PRODUCT_TYPE, productType).addPair(Events.CALL_FAILED_REASON, str2);
        if (demandSourceByName != null) {
            iSNEventParamsAddPair.addPair(Events.IS_BIDDING_INSTANCE, Boolean.valueOf(ISNEventsUtils.getIsBiddingInstance(demandSourceByName)));
            demandSourceByName.setDemandSourceInitState(3);
            if (productType == SSAEnums.ProductType.RewardedVideo) {
                OnRewardedVideoListener adProductListenerAsRVListener = getAdProductListenerAsRVListener(demandSourceByName);
                if (adProductListenerAsRVListener != null) {
                    adProductListenerAsRVListener.onRVInitFail(str2);
                }
            } else if (productType == SSAEnums.ProductType.Interstitial) {
                OnInterstitialListener adProductListenerAsISListener = getAdProductListenerAsISListener(demandSourceByName);
                if (adProductListenerAsISListener != null) {
                    adProductListenerAsISListener.onInterstitialInitFailed(str2);
                }
            } else if (productType == SSAEnums.ProductType.Banner && (adProductListenerAsBNListener = getAdProductListenerAsBNListener(demandSourceByName)) != null) {
                adProductListenerAsBNListener.onBannerInitFailed(str2);
            }
        }
        ISNEventsTracker.logEvent(SDK5Events.initProductFailed, iSNEventParamsAddPair.getData());
    }

    @Override // com.ironsource.sdk.listeners.internals.DSRewardedVideoListener
    public void onRVNoMoreOffers(String str) {
        OnRewardedVideoListener adProductListenerAsRVListener;
        DemandSource demandSourceByName = getDemandSourceByName(SSAEnums.ProductType.RewardedVideo, str);
        if (demandSourceByName == null || (adProductListenerAsRVListener = getAdProductListenerAsRVListener(demandSourceByName)) == null) {
            return;
        }
        adProductListenerAsRVListener.onRVNoMoreOffers();
    }

    @Override // com.ironsource.sdk.listeners.internals.DSRewardedVideoListener
    public void onRVAdCredited(String str, int i) {
        OnRewardedVideoListener adProductListenerAsRVListener;
        DemandSource demandSourceByName = getDemandSourceByName(SSAEnums.ProductType.RewardedVideo, str);
        if (demandSourceByName == null || (adProductListenerAsRVListener = getAdProductListenerAsRVListener(demandSourceByName)) == null) {
            return;
        }
        adProductListenerAsRVListener.onRVAdCredited(i);
    }

    @Override // com.ironsource.sdk.listeners.internals.DSAdProductListener
    public void onAdProductClose(SSAEnums.ProductType productType, String str) {
        OnInterstitialListener adProductListenerAsISListener;
        DemandSource demandSourceByName = getDemandSourceByName(productType, str);
        if (demandSourceByName != null) {
            if (productType == SSAEnums.ProductType.RewardedVideo) {
                OnRewardedVideoListener adProductListenerAsRVListener = getAdProductListenerAsRVListener(demandSourceByName);
                if (adProductListenerAsRVListener != null) {
                    adProductListenerAsRVListener.onRVAdClosed();
                    return;
                }
                return;
            }
            if (productType != SSAEnums.ProductType.Interstitial || (adProductListenerAsISListener = getAdProductListenerAsISListener(demandSourceByName)) == null) {
                return;
            }
            adProductListenerAsISListener.onInterstitialClose();
        }
    }

    @Override // com.ironsource.sdk.listeners.internals.DSRewardedVideoListener
    public void onRVShowFail(String str, String str2) {
        OnRewardedVideoListener adProductListenerAsRVListener;
        DemandSource demandSourceByName = getDemandSourceByName(SSAEnums.ProductType.RewardedVideo, str);
        if (demandSourceByName == null || (adProductListenerAsRVListener = getAdProductListenerAsRVListener(demandSourceByName)) == null) {
            return;
        }
        adProductListenerAsRVListener.onRVShowFail(str2);
    }

    @Override // com.ironsource.sdk.listeners.internals.DSAdProductListener
    public void onAdProductClick(SSAEnums.ProductType productType, String str) {
        OnBannerListener adProductListenerAsBNListener;
        DemandSource demandSourceByName = getDemandSourceByName(productType, str);
        if (demandSourceByName != null) {
            if (productType == SSAEnums.ProductType.RewardedVideo) {
                OnRewardedVideoListener adProductListenerAsRVListener = getAdProductListenerAsRVListener(demandSourceByName);
                if (adProductListenerAsRVListener != null) {
                    adProductListenerAsRVListener.onRVAdClicked();
                    return;
                }
                return;
            }
            if (productType == SSAEnums.ProductType.Interstitial) {
                OnInterstitialListener adProductListenerAsISListener = getAdProductListenerAsISListener(demandSourceByName);
                if (adProductListenerAsISListener != null) {
                    adProductListenerAsISListener.onInterstitialClick();
                    return;
                }
                return;
            }
            if (productType != SSAEnums.ProductType.Banner || (adProductListenerAsBNListener = getAdProductListenerAsBNListener(demandSourceByName)) == null) {
                return;
            }
            adProductListenerAsBNListener.onBannerClick();
        }
    }

    @Override // com.ironsource.sdk.listeners.internals.DSAdProductListener
    public void onAdProductEventNotificationReceived(SSAEnums.ProductType productType, String str, String str2, JSONObject jSONObject) {
        OnRewardedVideoListener adProductListenerAsRVListener;
        DemandSource demandSourceByName = getDemandSourceByName(productType, str);
        if (demandSourceByName != null) {
            try {
                if (productType == SSAEnums.ProductType.Interstitial) {
                    OnInterstitialListener adProductListenerAsISListener = getAdProductListenerAsISListener(demandSourceByName);
                    if (adProductListenerAsISListener != null) {
                        jSONObject.put("demandSourceName", str);
                        adProductListenerAsISListener.onInterstitialEventNotificationReceived(str2, jSONObject);
                    }
                } else if (productType == SSAEnums.ProductType.RewardedVideo && (adProductListenerAsRVListener = getAdProductListenerAsRVListener(demandSourceByName)) != null) {
                    jSONObject.put("demandSourceName", str);
                    adProductListenerAsRVListener.onRVEventNotificationReceived(str2, jSONObject);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.ironsource.sdk.listeners.internals.DSAdProductListener
    public void onAdProductOpen(SSAEnums.ProductType productType, String str) {
        OnRewardedVideoListener adProductListenerAsRVListener;
        DemandSource demandSourceByName = getDemandSourceByName(productType, str);
        if (demandSourceByName != null) {
            if (productType == SSAEnums.ProductType.Interstitial) {
                OnInterstitialListener adProductListenerAsISListener = getAdProductListenerAsISListener(demandSourceByName);
                if (adProductListenerAsISListener != null) {
                    adProductListenerAsISListener.onInterstitialOpen();
                    return;
                }
                return;
            }
            if (productType != SSAEnums.ProductType.RewardedVideo || (adProductListenerAsRVListener = getAdProductListenerAsRVListener(demandSourceByName)) == null) {
                return;
            }
            adProductListenerAsRVListener.onRVAdOpened();
        }
    }

    @Override // com.ironsource.sdk.listeners.internals.DSInterstitialListener
    public void onInterstitialLoadSuccess(String str) {
        DemandSource demandSourceByName = getDemandSourceByName(SSAEnums.ProductType.Interstitial, str);
        ISNEventParams iSNEventParamsAddPair = new ISNEventParams().addPair(Events.DEMAND_SOURCE_NAME, str);
        if (demandSourceByName != null) {
            iSNEventParamsAddPair.addPair(Events.PRODUCT_TYPE, ISNEventsUtils.getProductType(demandSourceByName, SSAEnums.ProductType.Interstitial)).addPair(Events.IS_BIDDING_INSTANCE, Boolean.valueOf(ISNEventsUtils.getIsBiddingInstance(demandSourceByName)));
            OnInterstitialListener adProductListenerAsISListener = getAdProductListenerAsISListener(demandSourceByName);
            if (adProductListenerAsISListener != null) {
                adProductListenerAsISListener.onInterstitialLoadSuccess();
            }
        }
        ISNEventsTracker.logEvent(SDK5Events.loadAdSuccess, iSNEventParamsAddPair.getData());
    }

    @Override // com.ironsource.sdk.listeners.internals.DSInterstitialListener
    public void onInterstitialLoadFailed(String str, String str2) {
        DemandSource demandSourceByName = getDemandSourceByName(SSAEnums.ProductType.Interstitial, str);
        ISNEventParams iSNEventParams = new ISNEventParams();
        iSNEventParams.addPair(Events.CALL_FAILED_REASON, str2).addPair(Events.DEMAND_SOURCE_NAME, str);
        if (demandSourceByName != null) {
            iSNEventParams.addPair(Events.PRODUCT_TYPE, ISNEventsUtils.getProductType(demandSourceByName, SSAEnums.ProductType.Interstitial)).addPair(Events.GENERAL_MSG, demandSourceByName.getDemandSourceInitState() == 2 ? Events.INTIALIZED : Events.UNINTIALIZED).addPair(Events.IS_BIDDING_INSTANCE, Boolean.valueOf(ISNEventsUtils.getIsBiddingInstance(demandSourceByName)));
            OnInterstitialListener adProductListenerAsISListener = getAdProductListenerAsISListener(demandSourceByName);
            if (adProductListenerAsISListener != null) {
                adProductListenerAsISListener.onInterstitialLoadFailed(str2);
            }
        }
        ISNEventsTracker.logEvent(SDK5Events.loadAdFailed, iSNEventParams.getData());
    }

    @Override // com.ironsource.sdk.listeners.internals.DSInterstitialListener
    public void onInterstitialShowSuccess(String str) {
        OnInterstitialListener adProductListenerAsISListener;
        DemandSource demandSourceByName = getDemandSourceByName(SSAEnums.ProductType.Interstitial, str);
        if (demandSourceByName == null || (adProductListenerAsISListener = getAdProductListenerAsISListener(demandSourceByName)) == null) {
            return;
        }
        adProductListenerAsISListener.onInterstitialShowSuccess();
    }

    @Override // com.ironsource.sdk.listeners.internals.DSInterstitialListener
    public void onInterstitialShowFailed(String str, String str2) {
        OnInterstitialListener adProductListenerAsISListener;
        DemandSource demandSourceByName = getDemandSourceByName(SSAEnums.ProductType.Interstitial, str);
        if (demandSourceByName == null || (adProductListenerAsISListener = getAdProductListenerAsISListener(demandSourceByName)) == null) {
            return;
        }
        adProductListenerAsISListener.onInterstitialShowFailed(str2);
    }

    @Override // com.ironsource.sdk.listeners.internals.DSInterstitialListener
    public void onInterstitialAdRewarded(String str, int i) {
        DemandSource demandSourceByName = getDemandSourceByName(SSAEnums.ProductType.Interstitial, str);
        OnInterstitialListener adProductListenerAsISListener = getAdProductListenerAsISListener(demandSourceByName);
        if (demandSourceByName == null || adProductListenerAsISListener == null) {
            return;
        }
        adProductListenerAsISListener.onInterstitialAdRewarded(str, i);
    }

    private DemandSource getDemandSourceByName(SSAEnums.ProductType productType, String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return this.mDemandSourceManager.getDemandSourceById(productType, str);
    }

    @Override // com.ironsource.sdk.SSAPublisher
    public void setMediationState(String str, String str2, int i) {
        SSAEnums.ProductType productType;
        DemandSource demandSourceById;
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || (productType = SDKUtils.getProductType(str)) == null || (demandSourceById = this.mDemandSourceManager.getDemandSourceById(productType, str2)) == null) {
            return;
        }
        demandSourceById.setMediationState(i);
    }

    @Override // com.ironsource.sdk.SSAPublisher, com.ironsource.sdk.IronSourceNetworkAPI
    public void updateConsentInfo(final JSONObject jSONObject) {
        updateConsentInToken(jSONObject);
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.14
            @Override // java.lang.Runnable
            public void run() {
                IronSourceAdsPublisherAgent.this.mControllerManager.updateConsentInfo(jSONObject);
            }
        });
    }

    private void updateConsentInToken(JSONObject jSONObject) {
        if (jSONObject == null || !jSONObject.has(Constants.RequestParameters.GDPR_CONSENT_STATUS)) {
            return;
        }
        try {
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("consent", Boolean.valueOf(jSONObject.getString(Constants.RequestParameters.GDPR_CONSENT_STATUS)).booleanValue());
            this.mTokenService.updateData(jSONObject2);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    @Override // com.ironsource.sdk.SSAPublisher, com.ironsource.sdk.IronSourceNetworkAds
    public ISNAdView createBanner(Activity activity, ISAdSize iSAdSize) {
        String str = "SupersonicAds_" + this.adViewContainerCounter;
        this.adViewContainerCounter++;
        ISNAdView iSNAdView = new ISNAdView(activity, str, iSAdSize);
        this.mControllerManager.setCommunicationWithAdView(iSNAdView);
        return iSNAdView;
    }

    @Override // com.ironsource.sdk.listeners.internals.DSBannerListener
    public void onBannerLoadSuccess(String str) {
        OnBannerListener adProductListenerAsBNListener;
        DemandSource demandSourceByName = getDemandSourceByName(SSAEnums.ProductType.Banner, str);
        if (demandSourceByName == null || (adProductListenerAsBNListener = getAdProductListenerAsBNListener(demandSourceByName)) == null) {
            return;
        }
        adProductListenerAsBNListener.onBannerLoadSuccess();
    }

    @Override // com.ironsource.sdk.listeners.internals.DSBannerListener
    public void onBannerLoadFail(String str, String str2) {
        OnBannerListener adProductListenerAsBNListener;
        DemandSource demandSourceByName = getDemandSourceByName(SSAEnums.ProductType.Banner, str);
        if (demandSourceByName == null || (adProductListenerAsBNListener = getAdProductListenerAsBNListener(demandSourceByName)) == null) {
            return;
        }
        adProductListenerAsBNListener.onBannerLoadFail(str2);
    }

    @Override // com.ironsource.sdk.IronSourceNetworkAds
    public void loadAd(IronSourceAdInstance ironSourceAdInstance, Map<String, String> map) {
        ISNEventParams iSNEventParams = new ISNEventParams();
        iSNEventParams.addPair(Events.IS_BIDDING_INSTANCE, Boolean.valueOf(ironSourceAdInstance.isInAppBidding())).addPair(Events.DEMAND_SOURCE_NAME, ironSourceAdInstance.getName()).addPair(Events.PRODUCT_TYPE, ironSourceAdInstance.isRewarded() ? SSAEnums.ProductType.RewardedVideo : SSAEnums.ProductType.Interstitial);
        ISNEventsTracker.logEvent(SDK5Events.loadAd, iSNEventParams.getData());
        Logger.d(TAG, "loadAd " + ironSourceAdInstance.getId());
        if (ironSourceAdInstance.isInAppBidding()) {
            loadInAppBiddingAd(ironSourceAdInstance, map);
        } else {
            loadInstance(ironSourceAdInstance, map);
        }
    }

    private void loadInAppBiddingAd(IronSourceAdInstance ironSourceAdInstance, Map<String, String> map) {
        try {
            map = decodeADM(map);
        } catch (Exception e) {
            ISNEventsTracker.logEvent(SDK5Events.parseAdmFailed, new ISNEventParams().addPair(Events.CALL_FAILED_REASON, e.getMessage()).addPair(Events.GENERAL_MSG, ironSourceAdInstance.isInitialized() ? Events.INTIALIZED : Events.UNINTIALIZED).addPair(Events.IS_BIDDING_INSTANCE, Boolean.valueOf(ironSourceAdInstance.isInAppBidding())).addPair(Events.DEMAND_SOURCE_NAME, ironSourceAdInstance.getName()).addPair(Events.PRODUCT_TYPE, ironSourceAdInstance.isRewarded() ? SSAEnums.ProductType.RewardedVideo : SSAEnums.ProductType.Interstitial).getData());
            e.printStackTrace();
            Logger.d(TAG, "loadInAppBiddingAd failed decoding ADM " + e.getMessage());
        }
        loadInstance(ironSourceAdInstance, map);
    }

    private void loadInstance(IronSourceAdInstance ironSourceAdInstance, Map<String, String> map) {
        if (ironSourceAdInstance.isInitialized()) {
            loadInitializedInstance(ironSourceAdInstance, map);
        } else {
            loadUninitializedInstance(ironSourceAdInstance, map);
        }
    }

    private Map<String, String> decodeADM(Map<String, String> map) {
        map.put(Constants.ParametersKeys.ADM, SDKUtils.decodeString(map.get(Constants.ParametersKeys.ADM)));
        return map;
    }

    private void loadInitializedInstance(final IronSourceAdInstance ironSourceAdInstance, final Map<String, String> map) {
        Logger.d(TAG, "loadOnInitializedInstance " + ironSourceAdInstance.getId());
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.15
            @Override // java.lang.Runnable
            public void run() {
                DemandSource demandSourceById = IronSourceAdsPublisherAgent.this.mDemandSourceManager.getDemandSourceById(SSAEnums.ProductType.Interstitial, ironSourceAdInstance.getId());
                if (demandSourceById != null) {
                    IronSourceAdsPublisherAgent.this.mControllerManager.loadInterstitial(demandSourceById, map, IronSourceAdsPublisherAgent.this);
                }
            }
        });
    }

    private void loadUninitializedInstance(final IronSourceAdInstance ironSourceAdInstance, final Map<String, String> map) {
        Logger.d(TAG, "loadOnNewInstance " + ironSourceAdInstance.getId());
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.16
            @Override // java.lang.Runnable
            public void run() {
                DemandSource demandSourceCreateDemandSource = IronSourceAdsPublisherAgent.this.mDemandSourceManager.createDemandSource(SSAEnums.ProductType.Interstitial, ironSourceAdInstance);
                ISNEventParams iSNEventParams = new ISNEventParams();
                iSNEventParams.addPair(Events.IS_BIDDING_INSTANCE, Boolean.valueOf(ironSourceAdInstance.isInAppBidding())).addPair(Events.DEMAND_SOURCE_NAME, ironSourceAdInstance.getName()).addPair(Events.PRODUCT_TYPE, ironSourceAdInstance.isRewarded() ? SSAEnums.ProductType.RewardedVideo : SSAEnums.ProductType.Interstitial);
                ISNEventsTracker.logEvent(SDK5Events.initProduct, iSNEventParams.getData());
                IronSourceAdsPublisherAgent.this.mControllerManager.initInterstitial(IronSourceAdsPublisherAgent.this.mApplicationKey, IronSourceAdsPublisherAgent.this.mUserId, demandSourceCreateDemandSource, IronSourceAdsPublisherAgent.this);
                ironSourceAdInstance.setInitialized(true);
                IronSourceAdsPublisherAgent.this.mControllerManager.loadInterstitial(demandSourceCreateDemandSource, map, IronSourceAdsPublisherAgent.this);
            }
        });
    }

    @Override // com.ironsource.sdk.IronSourceNetworkAds
    public void showAd(IronSourceAdInstance ironSourceAdInstance, final Map<String, String> map) {
        Logger.i(TAG, "showAd " + ironSourceAdInstance.getId());
        final DemandSource demandSourceById = this.mDemandSourceManager.getDemandSourceById(SSAEnums.ProductType.Interstitial, ironSourceAdInstance.getId());
        if (demandSourceById == null) {
            return;
        }
        this.mControllerManager.executeCommand(new Runnable() { // from class: com.ironsource.sdk.agent.IronSourceAdsPublisherAgent.17
            @Override // java.lang.Runnable
            public void run() {
                IronSourceAdsPublisherAgent.this.mControllerManager.showInterstitial(demandSourceById, map, IronSourceAdsPublisherAgent.this);
            }
        });
    }

    @Override // com.ironsource.sdk.IronSourceNetworkAds
    public boolean isAdAvailable(IronSourceAdInstance ironSourceAdInstance) {
        Logger.d(TAG, "isAdAvailable " + ironSourceAdInstance.getId());
        DemandSource demandSourceById = this.mDemandSourceManager.getDemandSourceById(SSAEnums.ProductType.Interstitial, ironSourceAdInstance.getId());
        if (demandSourceById == null) {
            return false;
        }
        return demandSourceById.getAvailabilityState();
    }

    public void decideOnListeningToApplicationLifeCycleEvents(Application application, JSONObject jSONObject) {
        boolean zOptBoolean = jSONObject.optBoolean(Constants.ControllerConfigurationKeys.ENABLE_LIFE_CYCLE_EVENT_LISTENRS_KEY, false);
        this.mEnableLifeCycleListeners = zOptBoolean;
        if (zOptBoolean) {
            application.registerActivityLifecycleCallbacks(new ActivityLifeCycleListener(this));
        }
    }

    @Override // com.ironsource.sdk.agent.OnPauseOnResumeHandler
    public void handleOnPause(Activity activity) {
        try {
            this.mControllerManager.enterBackground();
            this.mControllerManager.unregisterConnectionReceiver(activity);
        } catch (Exception e) {
            e.printStackTrace();
            new IronSourceAsyncHttpRequestTask().execute(Constants.NATIVE_EXCEPTION_BASE_URL + e.getStackTrace()[0].getMethodName());
        }
    }

    @Override // com.ironsource.sdk.agent.OnPauseOnResumeHandler
    public void handleOnResume(Activity activity) {
        mutableContextWrapper.setBaseContext(activity);
        this.mControllerManager.enterForeground();
        this.mControllerManager.registerConnectionReceiver(activity);
    }
}
