package com.ironsource.mediationsdk;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.ironsource.environment.ApplicationContext;
import com.ironsource.environment.DeviceStatus;
import com.ironsource.eventsmodule.EventData;
import com.ironsource.mediationsdk.IronSource;
import com.ironsource.mediationsdk.MediationInitializer;
import com.ironsource.mediationsdk.config.ConfigValidationResult;
import com.ironsource.mediationsdk.events.InterstitialEventsManager;
import com.ironsource.mediationsdk.events.RewardedVideoEventsManager;
import com.ironsource.mediationsdk.events.SuperLooper;
import com.ironsource.mediationsdk.impressionData.ImpressionDataListener;
import com.ironsource.mediationsdk.logger.ConsoleLogger;
import com.ironsource.mediationsdk.logger.IronLog;
import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.logger.LogListener;
import com.ironsource.mediationsdk.logger.PublisherLogger;
import com.ironsource.mediationsdk.metadata.MetaData;
import com.ironsource.mediationsdk.metadata.MetaDataUtils;
import com.ironsource.mediationsdk.model.ApplicationEvents;
import com.ironsource.mediationsdk.model.BannerConfigurations;
import com.ironsource.mediationsdk.model.BannerPlacement;
import com.ironsource.mediationsdk.model.InterstitialConfigurations;
import com.ironsource.mediationsdk.model.InterstitialPlacement;
import com.ironsource.mediationsdk.model.OfferwallPlacement;
import com.ironsource.mediationsdk.model.Placement;
import com.ironsource.mediationsdk.model.ProviderSettings;
import com.ironsource.mediationsdk.model.RewardedVideoConfigurations;
import com.ironsource.mediationsdk.sdk.ISDemandOnlyInterstitialListener;
import com.ironsource.mediationsdk.sdk.ISDemandOnlyRewardedVideoListener;
import com.ironsource.mediationsdk.sdk.InterstitialListener;
import com.ironsource.mediationsdk.sdk.IronSourceInterface;
import com.ironsource.mediationsdk.sdk.ListenersWrapper;
import com.ironsource.mediationsdk.sdk.OfferwallListener;
import com.ironsource.mediationsdk.sdk.RewardedVideoListener;
import com.ironsource.mediationsdk.sdk.SegmentListener;
import com.ironsource.mediationsdk.server.HttpFunctions;
import com.ironsource.mediationsdk.server.ServerURL;
import com.ironsource.mediationsdk.utils.CappingManager;
import com.ironsource.mediationsdk.utils.ContextProvider;
import com.ironsource.mediationsdk.utils.ErrorBuilder;
import com.ironsource.mediationsdk.utils.GeneralPropertiesWorker;
import com.ironsource.mediationsdk.utils.IronSourceAES;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import com.ironsource.mediationsdk.utils.ServerResponseWrapper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class IronSourceObject implements IronSourceInterface, MediationInitializer.OnMediationInitializationListener {
    private static IronSourceObject sInstance;
    private IronsourceObjectPublisherDataHolder ironsourceObjectPublisherDataHolder;
    private Activity mActivity;
    private Set<IronSource.AD_UNIT> mAdUnitsToInitialize;
    private AtomicBoolean mAtomicIsFirstInit;
    private BannerManager mBannerManager;
    private IronSourceBannerLayout mBnLayoutToLoad;
    private String mBnPlacementToLoad;
    private CopyOnWriteArraySet<String> mDemandOnlyIsLoadBeforeInitCompleted;
    private DemandOnlyIsManager mDemandOnlyIsManager;
    private CopyOnWriteArraySet<String> mDemandOnlyRvLoadBeforeInitCompleted;
    private DemandOnlyRvManager mDemandOnlyRvManager;
    private boolean mDidInitBanner;
    private boolean mDidInitInterstitial;
    private boolean mDidInitRewardedVideo;
    private AtomicBoolean mEventManagersInit;
    private int mInitCounter;
    private List<IronSource.AD_UNIT> mInitiatedAdUnits;
    private InterstitialManager mInterstitialManager;
    private IronSourceSegment mIronSegment;
    private Boolean mIsBnLoadBeforeInitCompleted;
    private boolean mIsBnProgrammatic;
    private boolean mIsDemandOnlyIs;
    private boolean mIsDemandOnlyRv;
    private boolean mIsIsLoadBeforeInitCompleted;
    private boolean mIsIsProgrammatic;
    private boolean mIsRvProgrammatic;
    private ListenersWrapper mListenersWrapper;
    private IronSourceLoggerManager mLoggerManager;
    private AbstractAdapter mOfferwallAdapter;
    private OfferwallManager mOfferwallManager;
    private ProgBannerManager mProgBannerManager;
    private ProgIsManager mProgIsManager;
    private IProgRvManager mProgRvManager;
    private PublisherLogger mPublisherLogger;
    private Set<IronSource.AD_UNIT> mRequestedAdUnits;
    private RewardedVideoManager mRewardedVideoManager;
    private String mSessionId;
    private Context mTrackNetworkStateContext;
    private int rvProgrammaticMode;
    private final String TAG = getClass().getName();
    private final String IRONSOURCE_VERSION_STRING = "!SDK-VERSION-STRING!:com.ironsource:mediationsdk:\u200b7.0.3.1";
    private final Object mServerResponseLocker = new Object();
    private ServerResponseWrapper mCurrentServerResponse = null;
    private String mAppKey = null;
    private String mUserId = null;
    private String mSegment = null;
    private String mDynamicUserId = null;
    private Map<String, String> mRvServerParams = null;
    private String mMediationType = null;
    private boolean mInitSucceeded = false;
    private Boolean mShouldTrackNetworkState = null;
    private boolean mShouldSendGetInstanceEvent = true;
    private final String KEY_INIT_COUNTER = "sessionDepth";
    private Boolean mConsent = null;

    public interface IResponseListener {
        void onUnrecoverableError(String str);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialApi
    public void initInterstitial(Activity activity, String str, String str2) {
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallApi
    public void initOfferwall(String str, String str2) {
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoApi
    public void initRewardedVideo(Activity activity, String str, String str2) {
    }

    public static synchronized IronSourceObject getInstance() {
        if (sInstance == null) {
            sInstance = new IronSourceObject();
        }
        return sInstance;
    }

    private IronSourceObject() {
        this.mSessionId = null;
        initializeManagers();
        this.mEventManagersInit = new AtomicBoolean();
        this.mAdUnitsToInitialize = new HashSet();
        this.mRequestedAdUnits = new HashSet();
        this.mIsDemandOnlyIs = false;
        this.mIsDemandOnlyRv = false;
        this.mAtomicIsFirstInit = new AtomicBoolean(true);
        this.mInitCounter = 0;
        this.mDidInitRewardedVideo = false;
        this.mDidInitInterstitial = false;
        this.mDidInitBanner = false;
        this.mSessionId = UUID.randomUUID().toString();
        this.mIsBnLoadBeforeInitCompleted = false;
        this.mIsIsLoadBeforeInitCompleted = false;
        this.mBnPlacementToLoad = null;
        this.mProgRvManager = null;
        this.mProgIsManager = null;
        this.mProgBannerManager = null;
        this.mIsRvProgrammatic = false;
        this.mIsIsProgrammatic = false;
        this.mIsBnProgrammatic = false;
        this.mDemandOnlyIsLoadBeforeInitCompleted = new CopyOnWriteArraySet<>();
        this.mDemandOnlyRvLoadBeforeInitCompleted = new CopyOnWriteArraySet<>();
        this.mDemandOnlyIsManager = null;
        this.mDemandOnlyRvManager = null;
        this.mBannerManager = null;
        this.rvProgrammaticMode = 1;
        this.ironsourceObjectPublisherDataHolder = new IronsourceObjectPublisherDataHolder();
    }

    public void sendInitCompletedEvent(long j) {
        JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(this.mIsDemandOnlyRv || this.mIsDemandOnlyIs);
        try {
            mediationAdditionalData.put("duration", j);
            mediationAdditionalData.put("sessionDepth", this.mInitCounter);
        } catch (Exception e) {
            e.printStackTrace();
        }
        RewardedVideoEventsManager.getInstance().log(new EventData(IronSourceConstants.INIT_COMPLETE, mediationAdditionalData));
    }

    public synchronized void init(Activity activity, String str, boolean z, IronSource.AD_UNIT... ad_unitArr) {
        IronLog.INTERNAL.verbose("");
        AtomicBoolean atomicBoolean = this.mAtomicIsFirstInit;
        if (atomicBoolean != null && atomicBoolean.compareAndSet(true, false)) {
            if (ad_unitArr == null || ad_unitArr.length == 0) {
                for (IronSource.AD_UNIT ad_unit : IronSource.AD_UNIT.values()) {
                    this.mAdUnitsToInitialize.add(ad_unit);
                }
                this.mDidInitRewardedVideo = true;
                this.mDidInitInterstitial = true;
                this.mDidInitBanner = true;
            } else {
                for (IronSource.AD_UNIT ad_unit2 : ad_unitArr) {
                    this.mAdUnitsToInitialize.add(ad_unit2);
                    this.mRequestedAdUnits.add(ad_unit2);
                    if (ad_unit2.equals(IronSource.AD_UNIT.INTERSTITIAL)) {
                        this.mDidInitInterstitial = true;
                    }
                    if (ad_unit2.equals(IronSource.AD_UNIT.BANNER)) {
                        this.mDidInitBanner = true;
                    }
                    if (ad_unit2.equals(IronSource.AD_UNIT.REWARDED_VIDEO)) {
                        this.mDidInitRewardedVideo = true;
                    }
                }
            }
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "init(appKey:" + str + ")", 1);
            if (activity == null) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Init Fail - provided activity is null", 2);
                return;
            }
            ContextProvider.getInstance().updateActivity(activity);
            AuctionDataUtils.getInstance().setBrowserUserAgent();
            this.mActivity = activity;
            prepareEventManagers(activity);
            ConfigValidationResult configValidationResultValidateAppKey = validateAppKey(str);
            if (configValidationResultValidateAppKey.isValid()) {
                this.mAppKey = str;
                if (this.mShouldSendGetInstanceEvent) {
                    JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(z);
                    try {
                        String str2 = ",androidx=" + IronSourceUtils.isAndroidXAvailable();
                        if (ApplicationContext.isKotlinLibraryExist()) {
                            mediationAdditionalData.put(IronSourceConstants.EVENTS_EXT1, IronSourceConstants.IS_APP_LANGUAGE_KOTLIN + str2);
                        } else {
                            mediationAdditionalData.put(IronSourceConstants.EVENTS_EXT1, IronSourceConstants.IS_APP_LANGUAGE_JAVA + str2);
                        }
                        if (ad_unitArr != null) {
                            for (IronSource.AD_UNIT ad_unit3 : ad_unitArr) {
                                mediationAdditionalData.put(ad_unit3.toString(), true);
                            }
                        }
                        int i = this.mInitCounter + 1;
                        this.mInitCounter = i;
                        mediationAdditionalData.put("sessionDepth", i);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    RewardedVideoEventsManager.getInstance().log(new EventData(14, mediationAdditionalData));
                    this.mShouldSendGetInstanceEvent = false;
                }
                if (this.mAdUnitsToInitialize.contains(IronSource.AD_UNIT.INTERSTITIAL)) {
                    MediationInitializer.getInstance().addMediationInitializationListener(this.mInterstitialManager);
                }
                MediationInitializer.getInstance().addMediationInitializationListener(this);
                MediationInitializer.getInstance().init(activity, str, this.mUserId, ad_unitArr);
            } else {
                MediationInitializer.getInstance().setInitStatusFailed();
                if (this.mAdUnitsToInitialize.contains(IronSource.AD_UNIT.REWARDED_VIDEO)) {
                    this.mListenersWrapper.onRewardedVideoAvailabilityChanged(false);
                }
                if (this.mAdUnitsToInitialize.contains(IronSource.AD_UNIT.OFFERWALL)) {
                    this.mListenersWrapper.onOfferwallAvailable(false, configValidationResultValidateAppKey.getIronSourceError());
                }
                IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.API, configValidationResultValidateAppKey.getIronSourceError().toString(), 1);
            }
        } else if (ad_unitArr != null) {
            attachAdUnits(z, ad_unitArr);
        } else {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Multiple calls to init without ad units are not allowed", 3);
        }
    }

    public synchronized void initISDemandOnly(Activity activity, String str, IronSource.AD_UNIT... ad_unitArr) {
        ArrayList arrayList = new ArrayList();
        if (ad_unitArr == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Cannot initialized demand only mode: No ad units selected", 3);
            return;
        }
        if (ad_unitArr.length <= 0) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Cannot initialized demand only mode: No ad units selected", 3);
            return;
        }
        ContextProvider.getInstance().updateActivity(activity);
        for (IronSource.AD_UNIT ad_unit : ad_unitArr) {
            if (ad_unit.equals(IronSource.AD_UNIT.BANNER) || ad_unit.equals(IronSource.AD_UNIT.OFFERWALL)) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, ad_unit + " ad unit cannot be initialized in demand only mode", 3);
            } else {
                if (ad_unit.equals(IronSource.AD_UNIT.INTERSTITIAL)) {
                    if (this.mDidInitInterstitial) {
                        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, ad_unit + " ad unit has already been initialized", 3);
                    } else {
                        this.mDidInitInterstitial = true;
                        this.mIsDemandOnlyIs = true;
                        if (!arrayList.contains(ad_unit)) {
                            arrayList.add(ad_unit);
                        }
                    }
                }
                if (ad_unit.equals(IronSource.AD_UNIT.REWARDED_VIDEO)) {
                    if (this.mDidInitRewardedVideo) {
                        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, ad_unit + " ad unit has already been initialized", 3);
                    } else {
                        this.mDidInitRewardedVideo = true;
                        this.mIsDemandOnlyRv = true;
                        if (!arrayList.contains(ad_unit)) {
                            arrayList.add(ad_unit);
                        }
                    }
                }
            }
        }
        if (arrayList.size() > 0) {
            init(activity, str, true, (IronSource.AD_UNIT[]) arrayList.toArray(new IronSource.AD_UNIT[arrayList.size()]));
        }
    }

    private synchronized void attachAdUnits(boolean z, IronSource.AD_UNIT... ad_unitArr) {
        int i = 0;
        for (IronSource.AD_UNIT ad_unit : ad_unitArr) {
            if (ad_unit.equals(IronSource.AD_UNIT.INTERSTITIAL)) {
                this.mDidInitInterstitial = true;
            } else if (ad_unit.equals(IronSource.AD_UNIT.BANNER)) {
                this.mDidInitBanner = true;
            }
        }
        if (MediationInitializer.getInstance().getCurrentInitStatus() == MediationInitializer.EInitStatus.INIT_FAILED) {
            try {
                if (this.mListenersWrapper != null) {
                    int length = ad_unitArr.length;
                    while (i < length) {
                        IronSource.AD_UNIT ad_unit2 = ad_unitArr[i];
                        if (!this.mAdUnitsToInitialize.contains(ad_unit2)) {
                            notifyPublisherAboutInitFailed(ad_unit2, true);
                        }
                        i++;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (!this.mInitSucceeded) {
            JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(z);
            int length2 = ad_unitArr.length;
            boolean z2 = false;
            while (i < length2) {
                IronSource.AD_UNIT ad_unit3 = ad_unitArr[i];
                if (!this.mAdUnitsToInitialize.contains(ad_unit3)) {
                    this.mAdUnitsToInitialize.add(ad_unit3);
                    this.mRequestedAdUnits.add(ad_unit3);
                    try {
                        mediationAdditionalData.put(ad_unit3.toString(), true);
                    } catch (Exception e2) {
                        e2.printStackTrace();
                    }
                    z2 = true;
                } else {
                    this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, ad_unit3 + " ad unit has started initializing.", 3);
                }
                i++;
            }
            if (z2) {
                try {
                    String str = ",androidx=" + IronSourceUtils.isAndroidXAvailable();
                    if (ApplicationContext.isKotlinLibraryExist()) {
                        mediationAdditionalData.put(IronSourceConstants.EVENTS_EXT1, IronSourceConstants.IS_APP_LANGUAGE_KOTLIN + str);
                    } else {
                        mediationAdditionalData.put(IronSourceConstants.EVENTS_EXT1, IronSourceConstants.IS_APP_LANGUAGE_JAVA + str);
                    }
                    int i2 = this.mInitCounter + 1;
                    this.mInitCounter = i2;
                    mediationAdditionalData.put("sessionDepth", i2);
                } catch (Exception e3) {
                    e3.printStackTrace();
                }
                RewardedVideoEventsManager.getInstance().log(new EventData(14, mediationAdditionalData));
            }
        }
        if (this.mInitiatedAdUnits == null) {
            return;
        }
        JSONObject mediationAdditionalData2 = IronSourceUtils.getMediationAdditionalData(z);
        boolean z3 = false;
        for (IronSource.AD_UNIT ad_unit4 : ad_unitArr) {
            if (!this.mAdUnitsToInitialize.contains(ad_unit4)) {
                this.mAdUnitsToInitialize.add(ad_unit4);
                this.mRequestedAdUnits.add(ad_unit4);
                try {
                    mediationAdditionalData2.put(ad_unit4.toString(), true);
                } catch (Exception e4) {
                    e4.printStackTrace();
                }
                List<IronSource.AD_UNIT> list = this.mInitiatedAdUnits;
                if (list != null && list.contains(ad_unit4)) {
                    startAdUnit(ad_unit4);
                } else {
                    notifyPublisherAboutInitFailed(ad_unit4, false);
                }
                z3 = true;
            } else {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, ad_unit4 + " ad unit has already been initialized", 3);
            }
        }
        if (z3) {
            try {
                String str2 = ",androidx=" + IronSourceUtils.isAndroidXAvailable();
                if (ApplicationContext.isKotlinLibraryExist()) {
                    mediationAdditionalData2.put(IronSourceConstants.EVENTS_EXT1, IronSourceConstants.IS_APP_LANGUAGE_KOTLIN + str2);
                } else {
                    mediationAdditionalData2.put(IronSourceConstants.EVENTS_EXT1, IronSourceConstants.IS_APP_LANGUAGE_JAVA + str2);
                }
                int i3 = this.mInitCounter + 1;
                this.mInitCounter = i3;
                mediationAdditionalData2.put("sessionDepth", i3);
            } catch (Exception e5) {
                e5.printStackTrace();
            }
            RewardedVideoEventsManager.getInstance().log(new EventData(14, mediationAdditionalData2));
        }
    }

    @Override // com.ironsource.mediationsdk.MediationInitializer.OnMediationInitializationListener
    public void onInitSuccess(List<IronSource.AD_UNIT> list, boolean z) {
        IronLog.INTERNAL.verbose("");
        try {
            this.mInitiatedAdUnits = list;
            this.mInitSucceeded = true;
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "onInitSuccess()", 1);
            IronSourceUtils.sendAutomationLog("init success");
            if (z) {
                JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(false);
                try {
                    mediationAdditionalData.put("revived", true);
                } catch (JSONException e) {
                    e.printStackTrace();
                }
                RewardedVideoEventsManager.getInstance().log(new EventData(114, mediationAdditionalData));
            }
            InterstitialEventsManager.getInstance().triggerEventsSend();
            RewardedVideoEventsManager.getInstance().triggerEventsSend();
            AdapterRepository.getInstance().setInitParams(getIronSourceAppKey(), getIronSourceUserId());
            for (IronSource.AD_UNIT ad_unit : IronSource.AD_UNIT.values()) {
                if (this.mAdUnitsToInitialize.contains(ad_unit)) {
                    if (list.contains(ad_unit)) {
                        startAdUnit(ad_unit);
                    } else {
                        notifyPublisherAboutInitFailed(ad_unit, false);
                    }
                }
            }
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

    private void startAdUnit(IronSource.AD_UNIT ad_unit) {
        int i = AnonymousClass1.$SwitchMap$com$ironsource$mediationsdk$IronSource$AD_UNIT[ad_unit.ordinal()];
        if (i == 1) {
            startRewardedVideo();
            return;
        }
        if (i == 2) {
            startInterstitial();
        } else if (i == 3) {
            this.mOfferwallManager.initOfferwall(getIronSourceAppKey(), getIronSourceUserId());
        } else {
            if (i != 4) {
                return;
            }
            startBanner();
        }
    }

    private void startProgrammaticRv() {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "Rewarded Video started in programmatic mode", 0);
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < this.mCurrentServerResponse.getProviderOrder().getRewardedVideoProviderOrder().size(); i++) {
            String str = this.mCurrentServerResponse.getProviderOrder().getRewardedVideoProviderOrder().get(i);
            if (!TextUtils.isEmpty(str)) {
                arrayList.add(this.mCurrentServerResponse.getProviderSettingsHolder().getProviderSettings(str));
            }
        }
        if (arrayList.size() > 0) {
            if (this.mCurrentServerResponse.getConfigurations().getRewardedVideoConfigurations().getRewardedVideoAuctionSettings().getIsLoadWhileShow()) {
                this.mProgRvManager = new LWSProgRvManager(arrayList, this.mCurrentServerResponse.getConfigurations().getRewardedVideoConfigurations(), getIronSourceAppKey(), IronSourceUtils.getUserIdForNetworks(), this.ironsourceObjectPublisherDataHolder.getImpressionDataListener());
            } else {
                this.mProgRvManager = new ProgRvManager(arrayList, this.mCurrentServerResponse.getConfigurations().getRewardedVideoConfigurations(), getIronSourceAppKey(), IronSourceUtils.getUserIdForNetworks(), this.ironsourceObjectPublisherDataHolder.getImpressionDataListener());
            }
            Boolean bool = this.mShouldTrackNetworkState;
            if (bool != null) {
                this.mProgRvManager.shouldTrackNetworkState(this.mTrackNetworkStateContext, bool.booleanValue());
                if (this.mShouldTrackNetworkState.booleanValue()) {
                    this.mRewardedVideoManager.shouldTrackNetworkState(this.mTrackNetworkStateContext, false);
                    return;
                }
                return;
            }
            return;
        }
        JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(false, true, this.rvProgrammaticMode);
        addToDictionary(mediationAdditionalData, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1010}});
        sentEventWithRVEventManager(IronSourceConstants.TROUBLESHOOTING_RV_INIT_FAILED, mediationAdditionalData);
        notifyPublisherAboutInitFailed(IronSource.AD_UNIT.REWARDED_VIDEO, false);
    }

    private void startDemandOnlyRv() {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "Rewarded Video started in demand only mode", 0);
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < this.mCurrentServerResponse.getProviderOrder().getRewardedVideoProviderOrder().size(); i++) {
            String str = this.mCurrentServerResponse.getProviderOrder().getRewardedVideoProviderOrder().get(i);
            if (!TextUtils.isEmpty(str)) {
                arrayList.add(this.mCurrentServerResponse.getProviderSettingsHolder().getProviderSettings(str));
            }
        }
        if (arrayList.size() > 0) {
            synchronized (this.mDemandOnlyRvLoadBeforeInitCompleted) {
                this.mDemandOnlyRvManager = new DemandOnlyRvManager(arrayList, this.mCurrentServerResponse.getConfigurations().getRewardedVideoConfigurations(), getIronSourceAppKey(), getIronSourceUserId());
            }
            Iterator<String> it = this.mDemandOnlyRvLoadBeforeInitCompleted.iterator();
            while (it.hasNext()) {
                this.mDemandOnlyRvManager.loadRewardedVideoWithAdm(it.next(), null, false);
            }
            this.mDemandOnlyRvLoadBeforeInitCompleted.clear();
            return;
        }
        notifyPublisherAboutInitFailed(IronSource.AD_UNIT.REWARDED_VIDEO, false);
    }

    private void startRewardedVideo() {
        ProviderSettings providerSettings;
        ProviderSettings providerSettings2;
        ProviderSettings providerSettings3;
        if (this.mIsDemandOnlyRv) {
            startDemandOnlyRv();
            return;
        }
        this.mIsRvProgrammatic = this.mCurrentServerResponse.getConfigurations().getRewardedVideoConfigurations().getRewardedVideoAuctionSettings().getIsProgrammatic();
        int i = this.mCurrentServerResponse.getConfigurations().getRewardedVideoConfigurations().getRewardedVideoAuctionSettings().getIsLoadWhileShow() ? 2 : 1;
        this.rvProgrammaticMode = i;
        sentEventWithRVEventManager(IronSourceConstants.TROUBLESHOOTING_RV_FORK, IronSourceUtils.getMediationAdditionalData(false, this.mIsRvProgrammatic, i));
        if (this.mIsRvProgrammatic) {
            startProgrammaticRv();
            return;
        }
        int rewardedVideoAdaptersSmartLoadTimeout = this.mCurrentServerResponse.getConfigurations().getRewardedVideoConfigurations().getRewardedVideoAdaptersSmartLoadTimeout();
        for (int i2 = 0; i2 < this.mCurrentServerResponse.getProviderOrder().getRewardedVideoProviderOrder().size(); i2++) {
            String str = this.mCurrentServerResponse.getProviderOrder().getRewardedVideoProviderOrder().get(i2);
            if (!TextUtils.isEmpty(str) && (providerSettings3 = this.mCurrentServerResponse.getProviderSettingsHolder().getProviderSettings(str)) != null) {
                RewardedVideoSmash rewardedVideoSmash = new RewardedVideoSmash(providerSettings3, rewardedVideoAdaptersSmartLoadTimeout);
                if (validateSmash(rewardedVideoSmash)) {
                    rewardedVideoSmash.setRewardedVideoManagerListener(this.mRewardedVideoManager);
                    rewardedVideoSmash.setProviderPriority(i2 + 1);
                    this.mRewardedVideoManager.addSmashToArray(rewardedVideoSmash);
                }
            }
        }
        if (this.mRewardedVideoManager.mSmashArray.size() > 0) {
            this.mRewardedVideoManager.setIsUltraEventsEnabled(this.mCurrentServerResponse.getConfigurations().getRewardedVideoConfigurations().getRewardedVideoEventsConfigurations().isUltraEventsEnabled());
            this.mRewardedVideoManager.setSmartLoadAmount(this.mCurrentServerResponse.getConfigurations().getRewardedVideoConfigurations().getRewardedVideoAdaptersSmartLoadAmount());
            this.mRewardedVideoManager.setManualLoadInterval(this.mCurrentServerResponse.getConfigurations().getRewardedVideoConfigurations().getManualLoadIntervalInSeconds());
            String rVBackFillProvider = this.mCurrentServerResponse.getRVBackFillProvider();
            if (!TextUtils.isEmpty(rVBackFillProvider) && (providerSettings2 = this.mCurrentServerResponse.getProviderSettingsHolder().getProviderSettings(rVBackFillProvider)) != null) {
                RewardedVideoSmash rewardedVideoSmash2 = new RewardedVideoSmash(providerSettings2, rewardedVideoAdaptersSmartLoadTimeout);
                if (validateSmash(rewardedVideoSmash2)) {
                    rewardedVideoSmash2.setRewardedVideoManagerListener(this.mRewardedVideoManager);
                    this.mRewardedVideoManager.setBackfillSmash(rewardedVideoSmash2);
                }
            }
            String rVPremiumProvider = this.mCurrentServerResponse.getRVPremiumProvider();
            if (!TextUtils.isEmpty(rVPremiumProvider) && (providerSettings = this.mCurrentServerResponse.getProviderSettingsHolder().getProviderSettings(rVPremiumProvider)) != null) {
                RewardedVideoSmash rewardedVideoSmash3 = new RewardedVideoSmash(providerSettings, rewardedVideoAdaptersSmartLoadTimeout);
                if (validateSmash(rewardedVideoSmash3)) {
                    rewardedVideoSmash3.setRewardedVideoManagerListener(this.mRewardedVideoManager);
                    this.mRewardedVideoManager.setPremiumSmash(rewardedVideoSmash3);
                }
            }
            this.mRewardedVideoManager.initRewardedVideo(getIronSourceAppKey(), IronSourceUtils.getUserIdForNetworks());
            return;
        }
        JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(false, false, this.rvProgrammaticMode);
        addToDictionary(mediationAdditionalData, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1010}});
        sentEventWithRVEventManager(IronSourceConstants.TROUBLESHOOTING_RV_INIT_FAILED, mediationAdditionalData);
        notifyPublisherAboutInitFailed(IronSource.AD_UNIT.REWARDED_VIDEO, false);
    }

    private void startProgrammaticIs() {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "Interstitial started in programmatic mode", 0);
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < this.mCurrentServerResponse.getProviderOrder().getInterstitialProviderOrder().size(); i++) {
            String str = this.mCurrentServerResponse.getProviderOrder().getInterstitialProviderOrder().get(i);
            if (!TextUtils.isEmpty(str)) {
                arrayList.add(this.mCurrentServerResponse.getProviderSettingsHolder().getProviderSettings(str));
            }
        }
        if (arrayList.size() > 0) {
            ProgIsManager progIsManager = new ProgIsManager(arrayList, this.mCurrentServerResponse.getConfigurations().getInterstitialConfigurations(), getIronSourceAppKey(), IronSourceUtils.getUserIdForNetworks(), this.mCurrentServerResponse.getConfigurations().getInterstitialConfigurations().getISDelayLoadFailure(), this.ironsourceObjectPublisherDataHolder.getImpressionDataListener());
            this.mProgIsManager = progIsManager;
            Boolean bool = this.mShouldTrackNetworkState;
            if (bool != null) {
                progIsManager.shouldTrackNetworkState(this.mTrackNetworkStateContext, bool.booleanValue());
                if (this.mShouldTrackNetworkState.booleanValue()) {
                    this.mInterstitialManager.shouldTrackNetworkState(this.mTrackNetworkStateContext, false);
                }
            }
            if (this.mIsIsLoadBeforeInitCompleted) {
                this.mIsIsLoadBeforeInitCompleted = false;
                this.mProgIsManager.loadInterstitial();
                return;
            }
            return;
        }
        JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(false, true, 1);
        addToDictionary(mediationAdditionalData, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1010}});
        sentEventWithISEventManager(IronSourceConstants.TROUBLESHOOTING_IS_INIT_FAILED, mediationAdditionalData);
        notifyPublisherAboutInitFailed(IronSource.AD_UNIT.INTERSTITIAL, false);
    }

    private void startProgrammaticBn(ArrayList<ProviderSettings> arrayList) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "Banner started in programmatic mode", 0);
        this.mProgBannerManager = new ProgBannerManager(arrayList, new BannerData(getIronSourceAppKey(), IronSourceUtils.getUserIdForNetworks(), this.mCurrentServerResponse.getConfigurations().getBannerConfigurations()), this.ironsourceObjectPublisherDataHolder.getImpressionDataListener());
        handleBannerLoadBeforeInit();
    }

    private void startDemandOnlyIs() {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "Interstitial started in demand only mode", 0);
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < this.mCurrentServerResponse.getProviderOrder().getInterstitialProviderOrder().size(); i++) {
            String str = this.mCurrentServerResponse.getProviderOrder().getInterstitialProviderOrder().get(i);
            if (!TextUtils.isEmpty(str)) {
                arrayList.add(this.mCurrentServerResponse.getProviderSettingsHolder().getProviderSettings(str));
            }
        }
        if (arrayList.size() > 0) {
            synchronized (this.mDemandOnlyIsLoadBeforeInitCompleted) {
                this.mDemandOnlyIsManager = new DemandOnlyIsManager(arrayList, this.mCurrentServerResponse.getConfigurations().getInterstitialConfigurations(), getIronSourceAppKey(), getIronSourceUserId());
            }
            Iterator<String> it = this.mDemandOnlyIsLoadBeforeInitCompleted.iterator();
            while (it.hasNext()) {
                this.mDemandOnlyIsManager.loadInterstitialWithAdm(it.next(), null, false);
            }
            this.mDemandOnlyIsLoadBeforeInitCompleted.clear();
            return;
        }
        JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(false, false, 1);
        addToDictionary(mediationAdditionalData, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1010}});
        sentEventWithISEventManager(IronSourceConstants.TROUBLESHOOTING_IS_INIT_FAILED, mediationAdditionalData);
        notifyPublisherAboutInitFailed(IronSource.AD_UNIT.INTERSTITIAL, false);
    }

    private void startInterstitial() {
        ProviderSettings providerSettings;
        if (this.mIsDemandOnlyIs) {
            startDemandOnlyIs();
            return;
        }
        boolean isProgrammatic = this.mCurrentServerResponse.getConfigurations().getInterstitialConfigurations().getInterstitialAuctionSettings().getIsProgrammatic();
        this.mIsIsProgrammatic = isProgrammatic;
        sentEventWithISEventManager(IronSourceConstants.TROUBLESHOOTING_IS_FORK, IronSourceUtils.getMediationAdditionalData(false, isProgrammatic, 1));
        if (this.mIsIsProgrammatic) {
            startProgrammaticIs();
            return;
        }
        int interstitialAdaptersSmartLoadTimeout = this.mCurrentServerResponse.getConfigurations().getInterstitialConfigurations().getInterstitialAdaptersSmartLoadTimeout();
        this.mInterstitialManager.setDelayLoadFailureNotificationInSeconds(this.mCurrentServerResponse.getConfigurations().getInterstitialConfigurations().getISDelayLoadFailure());
        for (int i = 0; i < this.mCurrentServerResponse.getProviderOrder().getInterstitialProviderOrder().size(); i++) {
            String str = this.mCurrentServerResponse.getProviderOrder().getInterstitialProviderOrder().get(i);
            if (!TextUtils.isEmpty(str) && (providerSettings = this.mCurrentServerResponse.getProviderSettingsHolder().getProviderSettings(str)) != null) {
                InterstitialSmash interstitialSmash = new InterstitialSmash(providerSettings, interstitialAdaptersSmartLoadTimeout);
                if (validateSmash(interstitialSmash)) {
                    interstitialSmash.setInterstitialManagerListener(this.mInterstitialManager);
                    interstitialSmash.setProviderPriority(i + 1);
                    this.mInterstitialManager.addSmashToArray(interstitialSmash);
                }
            }
        }
        if (this.mInterstitialManager.mSmashArray.size() > 0) {
            this.mInterstitialManager.setSmartLoadAmount(this.mCurrentServerResponse.getConfigurations().getInterstitialConfigurations().getInterstitialAdaptersSmartLoadAmount());
            this.mInterstitialManager.initInterstitial(getIronSourceAppKey(), IronSourceUtils.getUserIdForNetworks());
            if (this.mIsIsLoadBeforeInitCompleted) {
                this.mIsIsLoadBeforeInitCompleted = false;
                this.mInterstitialManager.loadInterstitial();
                return;
            }
            return;
        }
        JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(false, false, 1);
        addToDictionary(mediationAdditionalData, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1010}});
        sentEventWithISEventManager(IronSourceConstants.TROUBLESHOOTING_IS_INIT_FAILED, mediationAdditionalData);
        notifyPublisherAboutInitFailed(IronSource.AD_UNIT.INTERSTITIAL, false);
    }

    private void startBanner() {
        ProviderSettings providerSettings;
        synchronized (this.mIsBnLoadBeforeInitCompleted) {
            this.mIsBnProgrammatic = this.mCurrentServerResponse.getConfigurations().getBannerConfigurations().getBannerAuctionSettings().getIsProgrammatic();
            IronLog.INTERNAL.verbose("mIsBnProgrammatic = " + this.mIsBnProgrammatic);
            IronLog.INTERNAL.verbose("mIsBnLoadBeforeInitCompleted = " + this.mIsBnLoadBeforeInitCompleted);
            sentEventWithISEventManager(IronSourceConstants.TROUBLESHOOTING_BN_FORK, IronSourceUtils.getMediationAdditionalData(false, this.mIsBnProgrammatic, 1));
            ArrayList<ProviderSettings> arrayList = new ArrayList<>();
            for (int i = 0; i < this.mCurrentServerResponse.getProviderOrder().getBannerProviderOrder().size(); i++) {
                String str = this.mCurrentServerResponse.getProviderOrder().getBannerProviderOrder().get(i);
                if (!TextUtils.isEmpty(str) && (providerSettings = this.mCurrentServerResponse.getProviderSettingsHolder().getProviderSettings(str)) != null) {
                    arrayList.add(providerSettings);
                }
            }
            if (arrayList.size() > 0) {
                if (this.mIsBnProgrammatic) {
                    startProgrammaticBn(arrayList);
                } else {
                    this.mBannerManager = new BannerManager(arrayList, getIronSourceAppKey(), IronSourceUtils.getUserIdForNetworks(), this.mCurrentServerResponse.getConfigurations().getBannerConfigurations().getBannerAdaptersSmartLoadTimeout(), this.mCurrentServerResponse.getConfigurations().getBannerConfigurations().getBannerRefreshInterval(), this.mCurrentServerResponse.getConfigurations().getBannerConfigurations().getBannerDelayLoadFailure());
                    handleBannerLoadBeforeInit();
                }
            } else {
                JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(false, this.mIsBnProgrammatic, 1);
                addToDictionary(mediationAdditionalData, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1010}});
                sentEventWithISEventManager(IronSourceConstants.TROUBLESHOOTING_BN_INIT_FAILED, mediationAdditionalData);
                notifyPublisherAboutInitFailed(IronSource.AD_UNIT.BANNER, false);
            }
        }
    }

    private void handleBannerLoadBeforeInit() {
        if (this.mIsBnLoadBeforeInitCompleted.booleanValue()) {
            this.mIsBnLoadBeforeInitCompleted = false;
            loadBanner(this.mBnLayoutToLoad, this.mBnPlacementToLoad);
            this.mBnLayoutToLoad = null;
            this.mBnPlacementToLoad = null;
        }
    }

    private boolean validateSmash(AbstractSmash abstractSmash) {
        return abstractSmash.getMaxAdsPerIteration() >= 1 && abstractSmash.getMaxAdsPerSession() >= 1;
    }

    @Override // com.ironsource.mediationsdk.MediationInitializer.OnMediationInitializationListener
    public void onInitFailed(String str) {
        try {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "onInitFailed(reason:" + str + ")", 1);
            IronSourceUtils.sendAutomationLog("Mediation init failed");
            if (this.mListenersWrapper != null) {
                Iterator<IronSource.AD_UNIT> it = this.mAdUnitsToInitialize.iterator();
                while (it.hasNext()) {
                    notifyPublisherAboutInitFailed(it.next(), true);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override // com.ironsource.mediationsdk.MediationInitializer.OnMediationInitializationListener
    public void onStillInProgressAfter15Secs() {
        synchronized (this.mIsBnLoadBeforeInitCompleted) {
            if (this.mIsBnLoadBeforeInitCompleted.booleanValue()) {
                this.mIsBnLoadBeforeInitCompleted = false;
                BannerCallbackThrottler.getInstance().sendBannerAdLoadFailed(this.mBnLayoutToLoad, new IronSourceError(603, "init had failed"));
                this.mBnLayoutToLoad = null;
                this.mBnPlacementToLoad = null;
            }
        }
        if (this.mIsIsLoadBeforeInitCompleted) {
            this.mIsIsLoadBeforeInitCompleted = false;
            CallbackThrottler.getInstance().onInterstitialAdLoadFailed(ErrorBuilder.buildInitFailedError("init() had failed", "Interstitial"));
        }
        synchronized (this.mDemandOnlyIsLoadBeforeInitCompleted) {
            Iterator<String> it = this.mDemandOnlyIsLoadBeforeInitCompleted.iterator();
            while (it.hasNext()) {
                ISDemandOnlyListenerWrapper.getInstance().onInterstitialAdLoadFailed(it.next(), ErrorBuilder.buildInitFailedError("init() had failed", "Interstitial"));
            }
            this.mDemandOnlyIsLoadBeforeInitCompleted.clear();
        }
        synchronized (this.mDemandOnlyRvLoadBeforeInitCompleted) {
            Iterator<String> it2 = this.mDemandOnlyRvLoadBeforeInitCompleted.iterator();
            while (it2.hasNext()) {
                RVDemandOnlyListenerWrapper.getInstance().onRewardedVideoAdLoadFailed(it2.next(), ErrorBuilder.buildInitFailedError("init() had failed", IronSourceConstants.REWARDED_VIDEO_AD_UNIT));
            }
            this.mDemandOnlyRvLoadBeforeInitCompleted.clear();
        }
    }

    private void notifyPublisherAboutInitFailed(IronSource.AD_UNIT ad_unit, boolean z) {
        int i = AnonymousClass1.$SwitchMap$com$ironsource$mediationsdk$IronSource$AD_UNIT[ad_unit.ordinal()];
        if (i == 1) {
            if (this.mIsDemandOnlyRv) {
                Iterator<String> it = this.mDemandOnlyRvLoadBeforeInitCompleted.iterator();
                while (it.hasNext()) {
                    RVDemandOnlyListenerWrapper.getInstance().onRewardedVideoAdLoadFailed(it.next(), ErrorBuilder.buildInitFailedError("initISDemandOnly() had failed", IronSourceConstants.REWARDED_VIDEO_AD_UNIT));
                }
                this.mDemandOnlyRvLoadBeforeInitCompleted.clear();
                return;
            }
            if (z || isRewardedVideoConfigurationsReady() || this.mRequestedAdUnits.contains(ad_unit)) {
                this.mListenersWrapper.onRewardedVideoAvailabilityChanged(false);
                return;
            }
            return;
        }
        if (i == 2) {
            if (this.mIsDemandOnlyIs) {
                Iterator<String> it2 = this.mDemandOnlyIsLoadBeforeInitCompleted.iterator();
                while (it2.hasNext()) {
                    ISDemandOnlyListenerWrapper.getInstance().onInterstitialAdLoadFailed(it2.next(), ErrorBuilder.buildInitFailedError("initISDemandOnly() had failed", "Interstitial"));
                }
                this.mDemandOnlyIsLoadBeforeInitCompleted.clear();
                return;
            }
            if (this.mIsIsLoadBeforeInitCompleted) {
                this.mIsIsLoadBeforeInitCompleted = false;
                CallbackThrottler.getInstance().onInterstitialAdLoadFailed(ErrorBuilder.buildInitFailedError("init() had failed", "Interstitial"));
                return;
            }
            return;
        }
        if (i == 3) {
            if (z || isOfferwallConfigurationsReady() || this.mRequestedAdUnits.contains(ad_unit)) {
                this.mListenersWrapper.onOfferwallAvailable(false);
                return;
            }
            return;
        }
        if (i != 4) {
            return;
        }
        synchronized (this.mIsBnLoadBeforeInitCompleted) {
            if (this.mIsBnLoadBeforeInitCompleted.booleanValue()) {
                this.mIsBnLoadBeforeInitCompleted = false;
                BannerCallbackThrottler.getInstance().sendBannerAdLoadFailed(this.mBnLayoutToLoad, new IronSourceError(602, "Init had failed"));
                this.mBnLayoutToLoad = null;
                this.mBnPlacementToLoad = null;
            }
        }
    }

    private void prepareEventManagers(Activity activity) {
        AtomicBoolean atomicBoolean = this.mEventManagersInit;
        if (atomicBoolean == null || !atomicBoolean.compareAndSet(false, true)) {
            return;
        }
        SuperLooper.getLooper().post(new GeneralPropertiesWorker(activity.getApplicationContext()));
        InterstitialEventsManager.getInstance().start(activity.getApplicationContext(), this.mIronSegment);
        RewardedVideoEventsManager.getInstance().start(activity.getApplicationContext(), this.mIronSegment);
    }

    synchronized void addOWAdapter(AbstractAdapter abstractAdapter) {
        this.mOfferwallAdapter = abstractAdapter;
    }

    synchronized AbstractAdapter getOfferwallAdapter(String str) {
        try {
            AbstractAdapter abstractAdapter = this.mOfferwallAdapter;
            if (abstractAdapter != null && abstractAdapter.getProviderName().equals(str)) {
                return this.mOfferwallAdapter;
            }
        } catch (Exception e) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "getOfferwallAdapter exception: " + e, 1);
        }
        return null;
    }

    private void initializeManagers() {
        this.mLoggerManager = IronSourceLoggerManager.getLogger(0);
        PublisherLogger publisherLogger = new PublisherLogger(null, 1);
        this.mPublisherLogger = publisherLogger;
        this.mLoggerManager.addLogger(publisherLogger);
        this.mListenersWrapper = new ListenersWrapper();
        RewardedVideoManager rewardedVideoManager = new RewardedVideoManager();
        this.mRewardedVideoManager = rewardedVideoManager;
        rewardedVideoManager.setRewardedVideoListener(this.mListenersWrapper);
        InterstitialManager interstitialManager = new InterstitialManager();
        this.mInterstitialManager = interstitialManager;
        interstitialManager.setInterstitialListener(this.mListenersWrapper);
        OfferwallManager offerwallManager = new OfferwallManager();
        this.mOfferwallManager = offerwallManager;
        offerwallManager.setInternalOfferwallListener(this.mListenersWrapper);
    }

    public void onResume(Activity activity) {
        try {
            this.mActivity = activity;
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "onResume()", 1);
            ContextProvider.getInstance().onResume(activity);
            BannerManager bannerManager = this.mBannerManager;
            if (bannerManager != null) {
                bannerManager.onResume();
            }
        } catch (Throwable th) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, "onResume()", th);
        }
    }

    public void onPause(Activity activity) {
        try {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "onPause()", 1);
            ContextProvider.getInstance().onPause(activity);
            BannerManager bannerManager = this.mBannerManager;
            if (bannerManager != null) {
                bannerManager.onPause();
            }
        } catch (Throwable th) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, "onPause()", th);
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.BaseApi
    public void setMediationSegment(String str) {
        try {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, this.TAG + ":setMediationSegment(segment:" + str + ")", 1);
            ConfigValidationResult configValidationResult = new ConfigValidationResult();
            validateSegment(str, configValidationResult);
            if (configValidationResult.isValid()) {
                this.mSegment = str;
            } else {
                IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.API, configValidationResult.getIronSourceError().toString(), 2);
            }
        } catch (Exception e) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, this.TAG + ":setMediationSegment(segment:" + str + ")", e);
        }
    }

    public void setSegment(IronSourceSegment ironSourceSegment) {
        if (MediationInitializer.getInstance().getCurrentInitStatus() == MediationInitializer.EInitStatus.INIT_IN_PROGRESS || MediationInitializer.getInstance().getCurrentInitStatus() == MediationInitializer.EInitStatus.INITIATED) {
            IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.API, "Segments must be set prior to Init. Setting a segment after the init will be ignored", 0);
        } else {
            this.mIronSegment = ironSourceSegment;
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.IronSourceInterface
    public boolean setDynamicUserId(String str) {
        try {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, this.TAG + ":setDynamicUserId(dynamicUserId:" + str + ")", 1);
            ConfigValidationResult configValidationResult = new ConfigValidationResult();
            validateDynamicUserId(str, configValidationResult);
            if (configValidationResult.isValid()) {
                this.mDynamicUserId = str;
                RewardedVideoEventsManager.getInstance().log(new EventData(52, IronSourceUtils.getJsonForUserId(true)));
                return true;
            }
            IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.API, configValidationResult.getIronSourceError().toString(), 2);
            return false;
        } catch (Exception e) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, this.TAG + ":setDynamicUserId(dynamicUserId:" + str + ")", e);
            return false;
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.IronSourceInterface
    public void setAdaptersDebug(boolean z) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.API, "setAdaptersDebug : " + z, 1);
        AdapterRepository.getInstance().setAdaptersDebug(z);
    }

    @Override // com.ironsource.mediationsdk.sdk.IronSourceInterface
    public void setMediationType(String str) {
        try {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, this.TAG + ":setMediationType(mediationType:" + str + ")", 1);
            if (validateLength(str, 1, 64) && validateAlphanumeric(str)) {
                this.mMediationType = str;
            } else {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, " mediationType value is invalid - should be alphanumeric and 1-64 chars in length", 1);
            }
        } catch (Exception e) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, this.TAG + ":setMediationType(mediationType:" + str + ")", e);
        }
    }

    synchronized String getMediationSegment() {
        return this.mSegment;
    }

    synchronized String getDynamicUserId() {
        return this.mDynamicUserId;
    }

    synchronized Map<String, String> getRvServerParams() {
        return this.mRvServerParams;
    }

    public synchronized String getMediationType() {
        return this.mMediationType;
    }

    public void showRewardedVideo() {
        if (!isRewardedVideoConfigurationsReady()) {
            this.mListenersWrapper.onRewardedVideoAdShowFailed(ErrorBuilder.buildInitFailedError("showRewardedVideo can't be called before the Rewarded Video ad unit initialization completed successfully", IronSourceConstants.REWARDED_VIDEO_AD_UNIT));
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "showRewardedVideo can't be called before the Rewarded Video ad unit initialization completed successfully", 3);
            return;
        }
        Placement defaultRewardedVideoPlacement = getDefaultRewardedVideoPlacement();
        if (defaultRewardedVideoPlacement == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "showRewardedVideo error: empty default placement in response", 3);
            this.mListenersWrapper.onRewardedVideoAdShowFailed(new IronSourceError(1021, "showRewardedVideo error: empty default placement in response"));
            return;
        }
        showRewardedVideo(defaultRewardedVideoPlacement.getPlacementName());
    }

    private Placement getRewardedVideoPlacement(String str) {
        RewardedVideoConfigurations rewardedVideoConfigurations = this.mCurrentServerResponse.getConfigurations().getRewardedVideoConfigurations();
        if (rewardedVideoConfigurations != null) {
            return rewardedVideoConfigurations.getRewardedVideoPlacement(str);
        }
        return null;
    }

    private Placement getDefaultRewardedVideoPlacement() {
        RewardedVideoConfigurations rewardedVideoConfigurations = this.mCurrentServerResponse.getConfigurations().getRewardedVideoConfigurations();
        if (rewardedVideoConfigurations != null) {
            return rewardedVideoConfigurations.getDefaultRewardedVideoPlacement();
        }
        return null;
    }

    private void showProgrammaticRewardedVideo(String str) {
        Placement rewardedVideoPlacement = getRewardedVideoPlacement(str);
        if (rewardedVideoPlacement == null) {
            rewardedVideoPlacement = getDefaultRewardedVideoPlacement();
        }
        if (rewardedVideoPlacement == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "showProgrammaticRewardedVideo error: empty default placement in response", 3);
            this.mListenersWrapper.onRewardedVideoAdShowFailed(new IronSourceError(1021, "showProgrammaticRewardedVideo error: empty default placement in response"));
            return;
        }
        this.mProgRvManager.showRewardedVideo(rewardedVideoPlacement);
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoApi
    public void showRewardedVideo(String str) {
        String str2 = "showRewardedVideo(" + str + ")";
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, str2, 1);
        try {
            if (this.mIsDemandOnlyRv) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Rewarded Video was initialized in demand only mode. Use showISDemandOnlyRewardedVideo instead", 3);
                this.mListenersWrapper.onRewardedVideoAdShowFailed(ErrorBuilder.buildInitFailedError("Rewarded Video was initialized in demand only mode. Use showISDemandOnlyRewardedVideo instead", IronSourceConstants.REWARDED_VIDEO_AD_UNIT));
                return;
            }
            if (!isRewardedVideoConfigurationsReady()) {
                this.mListenersWrapper.onRewardedVideoAdShowFailed(ErrorBuilder.buildInitFailedError("showRewardedVideo can't be called before the Rewarded Video ad unit initialization completed successfully", IronSourceConstants.REWARDED_VIDEO_AD_UNIT));
                return;
            }
            if (this.mIsRvProgrammatic && this.mProgRvManager != null) {
                showProgrammaticRewardedVideo(str);
                return;
            }
            Placement placementToShowWithEvent = getPlacementToShowWithEvent(str);
            if (placementToShowWithEvent != null) {
                this.mRewardedVideoManager.setCurrentPlacement(placementToShowWithEvent);
                this.mRewardedVideoManager.showRewardedVideo(placementToShowWithEvent.getPlacementName());
            }
        } catch (Exception e) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, str2, e);
            this.mListenersWrapper.onRewardedVideoAdShowFailed(new IronSourceError(510, e.getMessage()));
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoApi
    public boolean isRewardedVideoAvailable() {
        boolean z;
        boolean zIsRewardedVideoAvailable;
        try {
            if (this.mIsDemandOnlyRv) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Rewarded Video was initialized in demand only mode. Use isISDemandOnlyRewardedVideoAvailable instead", 3);
                return false;
            }
            if (this.mIsRvProgrammatic) {
                IProgRvManager iProgRvManager = this.mProgRvManager;
                zIsRewardedVideoAvailable = iProgRvManager != null && iProgRvManager.isRewardedVideoAvailable();
            } else {
                zIsRewardedVideoAvailable = this.mRewardedVideoManager.isRewardedVideoAvailable();
            }
            try {
                JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(false);
                if (this.mIsRvProgrammatic) {
                    addToDictionary(mediationAdditionalData, new Object[][]{new Object[]{IronSourceConstants.EVENTS_PROGRAMMATIC, Integer.valueOf(this.rvProgrammaticMode)}});
                }
                RewardedVideoEventsManager.getInstance().log(new EventData(zIsRewardedVideoAvailable ? IronSourceConstants.RV_API_HAS_AVAILABILITY_TRUE : IronSourceConstants.RV_API_HAS_AVAILABILITY_FALSE, mediationAdditionalData));
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "isRewardedVideoAvailable():" + zIsRewardedVideoAvailable, 1);
                return zIsRewardedVideoAvailable;
            } catch (Throwable th) {
                z = zIsRewardedVideoAvailable;
                th = th;
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "isRewardedVideoAvailable():" + z, 1);
                this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, "isRewardedVideoAvailable()", th);
                return false;
            }
        } catch (Throwable th2) {
            th = th2;
            z = false;
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoApi
    public void setRewardedVideoListener(RewardedVideoListener rewardedVideoListener) {
        if (rewardedVideoListener == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "setRewardedVideoListener(RVListener:null)", 1);
        } else {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "setRewardedVideoListener(RVListener)", 1);
        }
        this.mListenersWrapper.setRewardedVideoListener(rewardedVideoListener);
        RVListenerWrapper.getInstance().setListener(rewardedVideoListener);
    }

    @Override // com.ironsource.mediationsdk.sdk.IronSourceInterface
    public void setRewardedVideoServerParameters(Map<String, String> map) {
        if (map != null) {
            try {
                if (map.size() == 0) {
                    return;
                }
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, this.TAG + ":setRewardedVideoServerParameters(params:" + map.toString() + ")", 1);
                this.mRvServerParams = new HashMap(map);
            } catch (Exception e) {
                this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, this.TAG + ":setRewardedVideoServerParameters(params:" + map.toString() + ")", e);
            }
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.IronSourceInterface
    public void clearRewardedVideoServerParameters() {
        this.mRvServerParams = null;
    }

    public synchronized void loadISDemandOnlyRewardedVideoWithAdm(String str, String str2) {
        if (str2 == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "adm cannot be null", 3);
            RVDemandOnlyListenerWrapper.getInstance().onRewardedVideoAdLoadFailed(str, new IronSourceError(510, "adm cannot be null"));
        } else {
            loadISDemandOnlyRewardedVideo(str, str2);
        }
    }

    public synchronized void loadISDemandOnlyRewardedVideo(String str, String str2) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "loadISDemandOnlyRewardedVideo() instanceId=" + str, 1);
        try {
            if (!this.mDidInitRewardedVideo) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "initISDemandOnly() must be called before loadISDemandOnlyRewardedVideo()", 3);
                RVDemandOnlyListenerWrapper.getInstance().onRewardedVideoAdLoadFailed(str, new IronSourceError(508, "initISDemandOnly() must be called before loadISDemandOnlyRewardedVideo()"));
                return;
            }
            if (!this.mIsDemandOnlyRv) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Rewarded video was initialized in mediation mode", 3);
                RVDemandOnlyListenerWrapper.getInstance().onRewardedVideoAdLoadFailed(str, new IronSourceError(508, "Rewarded video was initialized in mediation mode"));
                return;
            }
            MediationInitializer.EInitStatus currentInitStatus = MediationInitializer.getInstance().getCurrentInitStatus();
            if (currentInitStatus == MediationInitializer.EInitStatus.INIT_FAILED) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "init() had failed", 3);
                RVDemandOnlyListenerWrapper.getInstance().onRewardedVideoAdLoadFailed(str, ErrorBuilder.buildInitFailedError("init() had failed", IronSourceConstants.REWARDED_VIDEO_AD_UNIT));
                return;
            }
            if (currentInitStatus == MediationInitializer.EInitStatus.INIT_IN_PROGRESS) {
                if (MediationInitializer.getInstance().isInProgressMoreThan15Secs()) {
                    this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "init() had failed", 3);
                    RVDemandOnlyListenerWrapper.getInstance().onRewardedVideoAdLoadFailed(str, ErrorBuilder.buildInitFailedError("init() had failed", IronSourceConstants.REWARDED_VIDEO_AD_UNIT));
                } else {
                    synchronized (this.mDemandOnlyRvLoadBeforeInitCompleted) {
                        this.mDemandOnlyRvLoadBeforeInitCompleted.add(str);
                    }
                    if (str2 != null) {
                        sentEventWithISEventManager(IronSourceConstants.TROUBLESHOOTING_DO_IAB_RV_LOAD_FAILED_INIT_IN_PROGRESS, IronSourceUtils.getMediationAdditionalData(true, true, this.rvProgrammaticMode));
                    }
                }
                return;
            }
            synchronized (this.mDemandOnlyRvLoadBeforeInitCompleted) {
                if (this.mDemandOnlyRvManager == null) {
                    this.mDemandOnlyRvLoadBeforeInitCompleted.add(str);
                    if (str2 != null) {
                        sentEventWithISEventManager(IronSourceConstants.TROUBLESHOOTING_DO_IAB_RV_LOAD_FAILED_INIT_IN_PROGRESS, IronSourceUtils.getMediationAdditionalData(true, true, this.rvProgrammaticMode));
                    }
                    return;
                }
                ServerResponseWrapper serverResponseWrapper = this.mCurrentServerResponse;
                if (serverResponseWrapper != null && serverResponseWrapper.getConfigurations() != null && this.mCurrentServerResponse.getConfigurations().getRewardedVideoConfigurations() != null) {
                    if (str2 == null) {
                        this.mDemandOnlyRvManager.loadRewardedVideoWithAdm(str, null, false);
                    } else {
                        this.mDemandOnlyRvManager.loadRewardedVideoWithAdm(str, str2, true);
                    }
                }
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "No rewarded video configurations found", 3);
                RVDemandOnlyListenerWrapper.getInstance().onRewardedVideoAdLoadFailed(str, ErrorBuilder.buildInitFailedError("the server response does not contain rewarded video data", IronSourceConstants.REWARDED_VIDEO_AD_UNIT));
                return;
            }
        } catch (Throwable th) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, "loadISDemandOnlyRewardedVideo", th);
            RVDemandOnlyListenerWrapper.getInstance().onRewardedVideoAdLoadFailed(str, new IronSourceError(510, th.getMessage()));
        }
    }

    public synchronized void showDemandOnlyRewardedVideo(String str) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "showISDemandOnlyRewardedVideo() instanceId=" + str, 1);
        try {
        } catch (Exception e) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, "showISDemandOnlyRewardedVideo", e);
            RVDemandOnlyListenerWrapper.getInstance().onRewardedVideoAdShowFailed(str, new IronSourceError(510, e.getMessage()));
        }
        if (!this.mIsDemandOnlyRv) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Rewarded video was initialized in mediation mode. Use showRewardedVideo instead", 3);
            RVDemandOnlyListenerWrapper.getInstance().onRewardedVideoAdShowFailed(str, new IronSourceError(508, "Rewarded video was initialized in mediation mode. Use showRewardedVideo instead"));
            return;
        }
        DemandOnlyRvManager demandOnlyRvManager = this.mDemandOnlyRvManager;
        if (demandOnlyRvManager == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Rewarded video was not initiated", 3);
            RVDemandOnlyListenerWrapper.getInstance().onRewardedVideoAdShowFailed(str, new IronSourceError(508, "Rewarded video was not initiated"));
        } else {
            demandOnlyRvManager.showRewardedVideo(str);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x000d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized boolean isDemandOnlyRewardedVideoAvailable(java.lang.String r2) {
        /*
            r1 = this;
            monitor-enter(r1)
            com.ironsource.mediationsdk.DemandOnlyRvManager r0 = r1.mDemandOnlyRvManager     // Catch: java.lang.Throwable -> L10
            if (r0 == 0) goto Ld
            boolean r2 = r0.isRewardedVideoAvailable(r2)     // Catch: java.lang.Throwable -> L10
            if (r2 == 0) goto Ld
            r2 = 1
            goto Le
        Ld:
            r2 = 0
        Le:
            monitor-exit(r1)
            return r2
        L10:
            r2 = move-exception
            monitor-exit(r1)
            throw r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ironsource.mediationsdk.IronSourceObject.isDemandOnlyRewardedVideoAvailable(java.lang.String):boolean");
    }

    void setISDemandOnlyRewardedVideoListener(ISDemandOnlyRewardedVideoListener iSDemandOnlyRewardedVideoListener) {
        RVDemandOnlyListenerWrapper.getInstance().setListener(iSDemandOnlyRewardedVideoListener);
    }

    private boolean isRewardedVideoConfigurationsReady() {
        ServerResponseWrapper serverResponseWrapper = this.mCurrentServerResponse;
        return (serverResponseWrapper == null || serverResponseWrapper.getConfigurations() == null || this.mCurrentServerResponse.getConfigurations().getRewardedVideoConfigurations() == null) ? false : true;
    }

    private Placement getPlacementToShowWithEvent(String str) {
        Placement rewardedVideoPlacement = getRewardedVideoPlacement(str);
        if (rewardedVideoPlacement == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Placement is not valid, please make sure you are using the right placements, using the default placement.", 3);
            rewardedVideoPlacement = getDefaultRewardedVideoPlacement();
            if (rewardedVideoPlacement == null) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Default placement was not found, please make sure you are using the right placements.", 3);
                return null;
            }
        }
        String cappingMessage = getCappingMessage(rewardedVideoPlacement.getPlacementName(), CappingManager.isPlacementCapped(this.mActivity, rewardedVideoPlacement));
        if (TextUtils.isEmpty(cappingMessage)) {
            return rewardedVideoPlacement;
        }
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, cappingMessage, 1);
        this.mListenersWrapper.onRewardedVideoAdShowFailed(ErrorBuilder.buildCappedPerPlacementError(cappingMessage));
        return null;
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialApi
    public void loadInterstitial() {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "loadInterstitial()", 1);
        try {
            if (this.mIsDemandOnlyIs) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Interstitial was initialized in demand only mode. Use loadISDemandOnlyInterstitial instead", 3);
                CallbackThrottler.getInstance().onInterstitialAdLoadFailed(ErrorBuilder.buildInitFailedError("Interstitial was initialized in demand only mode. Use loadISDemandOnlyInterstitial instead", "Interstitial"));
                return;
            }
            if (!this.mDidInitInterstitial) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "init() must be called before loadInterstitial()", 3);
                CallbackThrottler.getInstance().onInterstitialAdLoadFailed(ErrorBuilder.buildInitFailedError("init() must be called before loadInterstitial()", "Interstitial"));
                return;
            }
            MediationInitializer.EInitStatus currentInitStatus = MediationInitializer.getInstance().getCurrentInitStatus();
            if (currentInitStatus == MediationInitializer.EInitStatus.INIT_FAILED) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "init() had failed", 3);
                CallbackThrottler.getInstance().onInterstitialAdLoadFailed(ErrorBuilder.buildInitFailedError("init() had failed", "Interstitial"));
                return;
            }
            if (currentInitStatus == MediationInitializer.EInitStatus.INIT_IN_PROGRESS) {
                if (MediationInitializer.getInstance().isInProgressMoreThan15Secs()) {
                    this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "init() had failed", 3);
                    CallbackThrottler.getInstance().onInterstitialAdLoadFailed(ErrorBuilder.buildInitFailedError("init() had failed", "Interstitial"));
                    return;
                } else {
                    this.mIsIsLoadBeforeInitCompleted = true;
                    return;
                }
            }
            ServerResponseWrapper serverResponseWrapper = this.mCurrentServerResponse;
            if (serverResponseWrapper != null && serverResponseWrapper.getConfigurations() != null && this.mCurrentServerResponse.getConfigurations().getInterstitialConfigurations() != null) {
                if (!this.mIsIsProgrammatic) {
                    this.mInterstitialManager.loadInterstitial();
                    return;
                }
                ProgIsManager progIsManager = this.mProgIsManager;
                if (progIsManager == null) {
                    this.mIsIsLoadBeforeInitCompleted = true;
                    return;
                } else {
                    progIsManager.loadInterstitial();
                    return;
                }
            }
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "No interstitial configurations found", 3);
            CallbackThrottler.getInstance().onInterstitialAdLoadFailed(ErrorBuilder.buildInitFailedError("the server response does not contain interstitial data", "Interstitial"));
        } catch (Throwable th) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, "loadInterstitial()", th);
            CallbackThrottler.getInstance().onInterstitialAdLoadFailed(new IronSourceError(510, th.getMessage()));
        }
    }

    public void showInterstitial() {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "showInterstitial()", 1);
        try {
            if (this.mIsDemandOnlyIs) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Interstitial was initialized in demand only mode. Use showISDemandOnlyInterstitial instead", 3);
                this.mListenersWrapper.onInterstitialAdShowFailed(new IronSourceError(510, "Interstitial was initialized in demand only mode. Use showISDemandOnlyInterstitial instead"));
            } else {
                if (!isInterstitialConfigurationsReady()) {
                    this.mListenersWrapper.onInterstitialAdShowFailed(ErrorBuilder.buildInitFailedError("showInterstitial can't be called before the Interstitial ad unit initialization completed successfully", "Interstitial"));
                    return;
                }
                InterstitialPlacement defaultInterstitialPlacement = getDefaultInterstitialPlacement();
                if (defaultInterstitialPlacement != null) {
                    showInterstitial(defaultInterstitialPlacement.getPlacementName());
                } else {
                    this.mListenersWrapper.onInterstitialAdShowFailed(new IronSourceError(1020, "showInterstitial error: empty default placement in response"));
                }
            }
        } catch (Exception e) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, "showInterstitial()", e);
            this.mListenersWrapper.onInterstitialAdShowFailed(new IronSourceError(510, e.getMessage()));
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialApi
    public void showInterstitial(String str) {
        String str2 = "showInterstitial(" + str + ")";
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, str2, 1);
        try {
            if (this.mIsDemandOnlyIs) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Interstitial was initialized in demand only mode. Use showISDemandOnlyInterstitial instead", 3);
                this.mListenersWrapper.onInterstitialAdShowFailed(new IronSourceError(510, "Interstitial was initialized in demand only mode. Use showISDemandOnlyInterstitial instead"));
                return;
            }
            if (!isInterstitialConfigurationsReady()) {
                this.mListenersWrapper.onInterstitialAdShowFailed(ErrorBuilder.buildInitFailedError("showInterstitial can't be called before the Interstitial ad unit initialization completed successfully", "Interstitial"));
                return;
            }
            if (this.mIsIsProgrammatic) {
                showProgrammaticInterstitial(str);
                return;
            }
            InterstitialPlacement interstitialPlacementToShowWithEvent = getInterstitialPlacementToShowWithEvent(str);
            JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(false);
            try {
                if (interstitialPlacementToShowWithEvent != null) {
                    mediationAdditionalData.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, interstitialPlacementToShowWithEvent.getPlacementName());
                } else if (!TextUtils.isEmpty(str)) {
                    mediationAdditionalData.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, str);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            InterstitialEventsManager.getInstance().log(new EventData(IronSourceConstants.IS_SHOW_CALLED, mediationAdditionalData));
            if (interstitialPlacementToShowWithEvent != null) {
                this.mInterstitialManager.setCurrentPlacement(interstitialPlacementToShowWithEvent);
                this.mInterstitialManager.showInterstitial(interstitialPlacementToShowWithEvent.getPlacementName());
            }
        } catch (Exception e2) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, str2, e2);
            this.mListenersWrapper.onInterstitialAdShowFailed(new IronSourceError(510, e2.getMessage()));
        }
    }

    private InterstitialPlacement getInterstitialPlacement(String str) {
        InterstitialConfigurations interstitialConfigurations = this.mCurrentServerResponse.getConfigurations().getInterstitialConfigurations();
        if (interstitialConfigurations != null) {
            return interstitialConfigurations.getInterstitialPlacement(str);
        }
        return null;
    }

    private InterstitialPlacement getDefaultInterstitialPlacement() {
        InterstitialConfigurations interstitialConfigurations = this.mCurrentServerResponse.getConfigurations().getInterstitialConfigurations();
        if (interstitialConfigurations != null) {
            return interstitialConfigurations.getDefaultInterstitialPlacement();
        }
        return null;
    }

    private void showProgrammaticInterstitial(String str) {
        String placementName = null;
        try {
            InterstitialPlacement interstitialPlacement = getInterstitialPlacement(str);
            if (interstitialPlacement == null) {
                interstitialPlacement = getDefaultInterstitialPlacement();
            }
            if (interstitialPlacement != null) {
                placementName = interstitialPlacement.getPlacementName();
            }
        } catch (Exception e) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, "showProgrammaticInterstitial()", e);
        }
        this.mProgIsManager.showInterstitial(placementName);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialApi
    public boolean isInterstitialReady() {
        boolean z;
        InterstitialManager interstitialManager;
        ProgIsManager progIsManager;
        try {
            if (this.mIsDemandOnlyIs) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Interstitial was initialized in demand only mode. Use isISDemandOnlyInterstitialReady instead", 3);
                return false;
            }
            boolean z2 = !this.mIsIsProgrammatic ? (interstitialManager = this.mInterstitialManager) == null || !interstitialManager.isInterstitialReady() : (progIsManager = this.mProgIsManager) == null || !progIsManager.isInterstitialReady();
            try {
                InterstitialEventsManager.getInstance().log(new EventData(z2 ? IronSourceConstants.IS_CHECK_READY_TRUE : IronSourceConstants.IS_CHECK_READY_FALSE, IronSourceUtils.getMediationAdditionalData(false, this.mIsIsProgrammatic, 1)));
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "isInterstitialReady():" + z2, 1);
                return z2;
            } catch (Throwable th) {
                z = z2;
                th = th;
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "isInterstitialReady():" + z, 1);
                this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, "isInterstitialReady()", th);
                return false;
            }
        } catch (Throwable th2) {
            th = th2;
            z = false;
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialApi
    public void setInterstitialListener(InterstitialListener interstitialListener) {
        if (interstitialListener == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "setInterstitialListener(ISListener:null)", 1);
        } else {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "setInterstitialListener(ISListener)", 1);
        }
        this.mListenersWrapper.setInterstitialListener(interstitialListener);
        ISListenerWrapper.getInstance().setListener(interstitialListener);
        CallbackThrottler.getInstance().setInterstitialListener(interstitialListener);
    }

    public synchronized void loadISDemandOnlyInterstitialWithAdm(String str, String str2) {
        if (str2 == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "adm cannot be null", 3);
            ISDemandOnlyListenerWrapper.getInstance().onInterstitialAdLoadFailed(str, new IronSourceError(510, "adm cannot be null"));
        } else {
            loadDemandOnlyInterstitial(str, str2);
        }
    }

    public synchronized void loadDemandOnlyInterstitial(String str, String str2) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "loadISDemandOnlyInterstitial() instanceId=" + str, 1);
        try {
            if (!this.mDidInitInterstitial) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "initISDemandOnly() must be called before loadISDemandOnlyInterstitial()", 3);
                ISDemandOnlyListenerWrapper.getInstance().onInterstitialAdLoadFailed(str, new IronSourceError(510, "initISDemandOnly() must be called before loadISDemandOnlyInterstitial()"));
                return;
            }
            if (!this.mIsDemandOnlyIs) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Interstitial was initialized in mediation mode. Use loadInterstitial instead", 3);
                ISDemandOnlyListenerWrapper.getInstance().onInterstitialAdLoadFailed(str, new IronSourceError(510, "Interstitial was initialized in mediation mode. Use loadInterstitial instead"));
                return;
            }
            MediationInitializer.EInitStatus currentInitStatus = MediationInitializer.getInstance().getCurrentInitStatus();
            if (currentInitStatus == MediationInitializer.EInitStatus.INIT_FAILED) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "init() had failed", 3);
                ISDemandOnlyListenerWrapper.getInstance().onInterstitialAdLoadFailed(str, ErrorBuilder.buildInitFailedError("init() had failed", "Interstitial"));
                return;
            }
            if (currentInitStatus == MediationInitializer.EInitStatus.INIT_IN_PROGRESS) {
                if (MediationInitializer.getInstance().isInProgressMoreThan15Secs()) {
                    this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "init() had failed", 3);
                    ISDemandOnlyListenerWrapper.getInstance().onInterstitialAdLoadFailed(str, ErrorBuilder.buildInitFailedError("init() had failed", "Interstitial"));
                } else {
                    synchronized (this.mDemandOnlyIsLoadBeforeInitCompleted) {
                        this.mDemandOnlyIsLoadBeforeInitCompleted.add(str);
                    }
                    if (str2 != null) {
                        sentEventWithISEventManager(IronSourceConstants.TROUBLESHOOTING_DO_IAB_IS_LOAD_FAILED_INIT_IN_PROGRESS, IronSourceUtils.getMediationAdditionalData(true, true, 1));
                    }
                }
                return;
            }
            synchronized (this.mDemandOnlyIsLoadBeforeInitCompleted) {
                if (this.mDemandOnlyIsManager == null) {
                    this.mDemandOnlyIsLoadBeforeInitCompleted.add(str);
                    if (str2 != null) {
                        sentEventWithISEventManager(IronSourceConstants.TROUBLESHOOTING_DO_IAB_IS_LOAD_FAILED_INIT_IN_PROGRESS, IronSourceUtils.getMediationAdditionalData(true, true, 1));
                    }
                    return;
                }
                ServerResponseWrapper serverResponseWrapper = this.mCurrentServerResponse;
                if (serverResponseWrapper != null && serverResponseWrapper.getConfigurations() != null && this.mCurrentServerResponse.getConfigurations().getInterstitialConfigurations() != null) {
                    if (str2 == null) {
                        this.mDemandOnlyIsManager.loadInterstitialWithAdm(str, null, false);
                    } else {
                        this.mDemandOnlyIsManager.loadInterstitialWithAdm(str, str2, true);
                    }
                }
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "No interstitial configurations found", 3);
                ISDemandOnlyListenerWrapper.getInstance().onInterstitialAdLoadFailed(str, ErrorBuilder.buildInitFailedError("the server response does not contain interstitial data", "Interstitial"));
                return;
            }
        } catch (Throwable th) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, "loadDemandOnlyInterstitial", th);
            ISDemandOnlyListenerWrapper.getInstance().onInterstitialAdLoadFailed(str, new IronSourceError(510, th.getMessage()));
        }
    }

    public void showDemandOnlyInterstitial(String str) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "showISDemandOnlyInterstitial() instanceId=" + str, 1);
        try {
            if (!this.mIsDemandOnlyIs) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Interstitial was initialized in mediation mode. Use showInterstitial instead", 3);
                return;
            }
            DemandOnlyIsManager demandOnlyIsManager = this.mDemandOnlyIsManager;
            if (demandOnlyIsManager == null) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Interstitial video was not initiated", 3);
                ISDemandOnlyListenerWrapper.getInstance().onInterstitialAdShowFailed(str, new IronSourceError(508, "Interstitial video was not initiated"));
            } else {
                demandOnlyIsManager.showInterstitial(str);
            }
        } catch (Exception e) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, "showISDemandOnlyInterstitial", e);
            ISDemandOnlyListenerWrapper.getInstance().onInterstitialAdShowFailed(str, ErrorBuilder.buildInitFailedError("showISDemandOnlyInterstitial can't be called before the Interstitial ad unit initialization completed successfully", "Interstitial"));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x000d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized boolean isDemandOnlyInterstitialReady(java.lang.String r2) {
        /*
            r1 = this;
            monitor-enter(r1)
            com.ironsource.mediationsdk.DemandOnlyIsManager r0 = r1.mDemandOnlyIsManager     // Catch: java.lang.Throwable -> L10
            if (r0 == 0) goto Ld
            boolean r2 = r0.isInterstitialReady(r2)     // Catch: java.lang.Throwable -> L10
            if (r2 == 0) goto Ld
            r2 = 1
            goto Le
        Ld:
            r2 = 0
        Le:
            monitor-exit(r1)
            return r2
        L10:
            r2 = move-exception
            monitor-exit(r1)
            throw r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ironsource.mediationsdk.IronSourceObject.isDemandOnlyInterstitialReady(java.lang.String):boolean");
    }

    public void setISDemandOnlyInterstitialListener(ISDemandOnlyInterstitialListener iSDemandOnlyInterstitialListener) {
        ISDemandOnlyListenerWrapper.getInstance().setListener(iSDemandOnlyInterstitialListener);
    }

    private boolean isInterstitialConfigurationsReady() {
        ServerResponseWrapper serverResponseWrapper = this.mCurrentServerResponse;
        return (serverResponseWrapper == null || serverResponseWrapper.getConfigurations() == null || this.mCurrentServerResponse.getConfigurations().getInterstitialConfigurations() == null) ? false : true;
    }

    private InterstitialPlacement getInterstitialPlacementToShowWithEvent(String str) {
        InterstitialPlacement interstitialPlacement = getInterstitialPlacement(str);
        if (interstitialPlacement == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Placement is not valid, please make sure you are using the right placements, using the default placement.", 3);
            interstitialPlacement = getDefaultInterstitialPlacement();
            if (interstitialPlacement == null) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Default placement was not found, please make sure you are using the right placements.", 3);
                return null;
            }
        }
        String cappingMessage = getCappingMessage(interstitialPlacement.getPlacementName(), getInterstitialCappingStatus(interstitialPlacement.getPlacementName()));
        if (TextUtils.isEmpty(cappingMessage)) {
            return interstitialPlacement;
        }
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, cappingMessage, 1);
        this.mListenersWrapper.setInterstitialPlacement(interstitialPlacement);
        this.mListenersWrapper.onInterstitialAdShowFailed(ErrorBuilder.buildCappedPerPlacementError(cappingMessage));
        return null;
    }

    private boolean isOfferwallConfigurationsReady() {
        ServerResponseWrapper serverResponseWrapper = this.mCurrentServerResponse;
        return (serverResponseWrapper == null || serverResponseWrapper.getConfigurations() == null || this.mCurrentServerResponse.getConfigurations().getOfferwallConfigurations() == null) ? false : true;
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallApi
    public void showOfferwall() {
        try {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "showOfferwall()", 1);
            if (!isOfferwallConfigurationsReady()) {
                this.mListenersWrapper.onOfferwallShowFailed(ErrorBuilder.buildInitFailedError("showOfferwall can't be called before the Offerwall ad unit initialization completed successfully", IronSourceConstants.OFFERWALL_AD_UNIT));
                return;
            }
            OfferwallPlacement defaultOfferwallPlacement = this.mCurrentServerResponse.getConfigurations().getOfferwallConfigurations().getDefaultOfferwallPlacement();
            if (defaultOfferwallPlacement != null) {
                showOfferwall(defaultOfferwallPlacement.getPlacementName());
            }
        } catch (Exception e) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, "showOfferwall()", e);
            this.mListenersWrapper.onOfferwallShowFailed(ErrorBuilder.buildInitFailedError("showOfferwall can't be called before the Offerwall ad unit initialization completed successfully", IronSourceConstants.OFFERWALL_AD_UNIT));
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallApi
    public void showOfferwall(String str) {
        String str2 = "showOfferwall(" + str + ")";
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, str2, 1);
        try {
            if (!isOfferwallConfigurationsReady()) {
                this.mListenersWrapper.onOfferwallShowFailed(ErrorBuilder.buildInitFailedError("showOfferwall can't be called before the Offerwall ad unit initialization completed successfully", IronSourceConstants.OFFERWALL_AD_UNIT));
                return;
            }
            OfferwallPlacement offerwallPlacement = this.mCurrentServerResponse.getConfigurations().getOfferwallConfigurations().getOfferwallPlacement(str);
            if (offerwallPlacement == null) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Placement is not valid, please make sure you are using the right placements, using the default placement.", 3);
                offerwallPlacement = this.mCurrentServerResponse.getConfigurations().getOfferwallConfigurations().getDefaultOfferwallPlacement();
                if (offerwallPlacement == null) {
                    this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Default placement was not found, please make sure you are using the right placements.", 3);
                    return;
                }
            }
            this.mOfferwallManager.showOfferwall(offerwallPlacement.getPlacementName());
        } catch (Exception e) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, str2, e);
            this.mListenersWrapper.onOfferwallShowFailed(ErrorBuilder.buildInitFailedError("showOfferwall can't be called before the Offerwall ad unit initialization completed successfully", IronSourceConstants.OFFERWALL_AD_UNIT));
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallApi
    public boolean isOfferwallAvailable() {
        try {
            OfferwallManager offerwallManager = this.mOfferwallManager;
            if (offerwallManager != null) {
                return offerwallManager.isOfferwallAvailable();
            }
            return false;
        } catch (Exception unused) {
            return false;
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallApi
    public void getOfferwallCredits() {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "getOfferwallCredits()", 1);
        try {
            this.mOfferwallManager.getOfferwallCredits();
        } catch (Throwable th) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, "getOfferwallCredits()", th);
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.OfferwallApi
    public void setOfferwallListener(OfferwallListener offerwallListener) {
        if (offerwallListener == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "setOfferwallListener(OWListener:null)", 1);
        } else {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "setOfferwallListener(OWListener)", 1);
        }
        this.mListenersWrapper.setOfferwallListener(offerwallListener);
    }

    @Override // com.ironsource.mediationsdk.logger.LoggingApi
    public void setLogListener(LogListener logListener) {
        if (logListener == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "setLogListener(LogListener:null)", 1);
            return;
        }
        this.mPublisherLogger.setLogListener(logListener);
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "setLogListener(LogListener:" + logListener.getClass().getSimpleName() + ")", 1);
    }

    private boolean isBannerConfigurationsReady() {
        ServerResponseWrapper serverResponseWrapper = this.mCurrentServerResponse;
        return (serverResponseWrapper == null || serverResponseWrapper.getConfigurations() == null || this.mCurrentServerResponse.getConfigurations().getBannerConfigurations() == null) ? false : true;
    }

    public IronSourceBannerLayout createBanner(Activity activity, ISBannerSize iSBannerSize) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "createBanner()", 1);
        if (activity == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "createBanner() : Activity cannot be null", 3);
            return null;
        }
        ContextProvider.getInstance().updateActivity(activity);
        return new IronSourceBannerLayout(activity, iSBannerSize);
    }

    public void loadBanner(IronSourceBannerLayout ironSourceBannerLayout, String str) {
        IronLog.INTERNAL.verbose("placementName = " + str);
        if (ironSourceBannerLayout == null || ironSourceBannerLayout.isDestroyed()) {
            StringBuilder sb = new StringBuilder();
            sb.append("loadBanner can't be called - ");
            sb.append(ironSourceBannerLayout == null ? "banner layout is null " : "banner layout is destroyed");
            String string = sb.toString();
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, string, 3);
            BannerCallbackThrottler.getInstance().sendBannerAdLoadFailed(ironSourceBannerLayout, ErrorBuilder.buildLoadFailedError(string));
            return;
        }
        if (!this.mDidInitBanner) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "init() must be called before loadBanner()", 3);
            BannerCallbackThrottler.getInstance().sendBannerAdLoadFailed(ironSourceBannerLayout, ErrorBuilder.buildLoadFailedError("init() must be called before loadBanner()"));
            return;
        }
        if (ironSourceBannerLayout.getSize().getDescription().equals("CUSTOM") && (ironSourceBannerLayout.getSize().getWidth() <= 0 || ironSourceBannerLayout.getSize().getHeight() <= 0)) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "loadBanner: Unsupported banner size. Height and width must be bigger than 0", 3);
            BannerCallbackThrottler.getInstance().sendBannerAdLoadFailed(ironSourceBannerLayout, ErrorBuilder.unsupportedBannerSize(""));
            return;
        }
        MediationInitializer.EInitStatus currentInitStatus = MediationInitializer.getInstance().getCurrentInitStatus();
        if (currentInitStatus == MediationInitializer.EInitStatus.INIT_FAILED) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "init() had failed", 3);
            BannerCallbackThrottler.getInstance().sendBannerAdLoadFailed(ironSourceBannerLayout, new IronSourceError(600, "Init() had failed"));
            return;
        }
        if (currentInitStatus == MediationInitializer.EInitStatus.INIT_IN_PROGRESS) {
            if (MediationInitializer.getInstance().isInProgressMoreThan15Secs()) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "init() had failed", 3);
                BannerCallbackThrottler.getInstance().sendBannerAdLoadFailed(ironSourceBannerLayout, new IronSourceError(601, "Init had failed"));
                return;
            } else {
                this.mBnLayoutToLoad = ironSourceBannerLayout;
                this.mIsBnLoadBeforeInitCompleted = true;
                this.mBnPlacementToLoad = str;
                return;
            }
        }
        synchronized (this.mIsBnLoadBeforeInitCompleted) {
            if (this.mBannerManager == null && this.mProgBannerManager == null) {
                this.mBnLayoutToLoad = ironSourceBannerLayout;
                this.mIsBnLoadBeforeInitCompleted = true;
                this.mBnPlacementToLoad = str;
                return;
            }
            ServerResponseWrapper serverResponseWrapper = this.mCurrentServerResponse;
            if (serverResponseWrapper == null || serverResponseWrapper.getConfigurations() == null || this.mCurrentServerResponse.getConfigurations().getBannerConfigurations() == null) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "No banner configurations found", 3);
                BannerCallbackThrottler.getInstance().sendBannerAdLoadFailed(ironSourceBannerLayout, new IronSourceError(IronSourceError.ERROR_BN_LOAD_NO_CONFIG, "No banner configurations found"));
            } else if (!this.mIsBnProgrammatic) {
                this.mBannerManager.loadBanner(ironSourceBannerLayout, getBannerPlacement(str));
            } else {
                this.mProgBannerManager.loadBanner(ironSourceBannerLayout, getBannerPlacement(str));
            }
        }
    }

    public void loadBanner(IronSourceBannerLayout ironSourceBannerLayout) {
        loadBanner(ironSourceBannerLayout, "");
    }

    public void destroyBanner(IronSourceBannerLayout ironSourceBannerLayout) {
        ProgBannerManager progBannerManager;
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "destroyBanner()", 1);
        try {
            if (this.mIsBnProgrammatic && (progBannerManager = this.mProgBannerManager) != null) {
                progBannerManager.destroyBanner(ironSourceBannerLayout);
            } else {
                BannerManager bannerManager = this.mBannerManager;
                if (bannerManager != null) {
                    bannerManager.destroyBanner(ironSourceBannerLayout);
                }
            }
        } catch (Throwable th) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, "destroyBanner()", th);
        }
    }

    ServerResponseWrapper getServerResponse(Context context, String str, IResponseListener iResponseListener) {
        synchronized (this.mServerResponseLocker) {
            ServerResponseWrapper serverResponseWrapper = this.mCurrentServerResponse;
            if (serverResponseWrapper != null) {
                return new ServerResponseWrapper(serverResponseWrapper);
            }
            ServerResponseWrapper serverResponseWrapperConnectAndGetServerResponse = connectAndGetServerResponse(context, str, iResponseListener);
            if (serverResponseWrapperConnectAndGetServerResponse == null || !serverResponseWrapperConnectAndGetServerResponse.isValidResponse()) {
                IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "Null or invalid response. Trying to get cached response", 0);
                serverResponseWrapperConnectAndGetServerResponse = getCachedResponse(context, str);
            }
            if (serverResponseWrapperConnectAndGetServerResponse != null) {
                this.mCurrentServerResponse = serverResponseWrapperConnectAndGetServerResponse;
                IronSourceUtils.saveLastResponse(context, serverResponseWrapperConnectAndGetServerResponse.toString());
                initializeSettingsFromServerResponse(this.mCurrentServerResponse, context);
            }
            InterstitialEventsManager.getInstance().setHasServerResponse(true);
            RewardedVideoEventsManager.getInstance().setHasServerResponse(true);
            return serverResponseWrapperConnectAndGetServerResponse;
        }
    }

    private ServerResponseWrapper getCachedResponse(Context context, String str) {
        JSONObject jSONObject;
        try {
            jSONObject = new JSONObject(IronSourceUtils.getLastResponse(context));
        } catch (JSONException unused) {
            jSONObject = new JSONObject();
        }
        String strOptString = jSONObject.optString("appKey");
        String strOptString2 = jSONObject.optString("userId");
        String strOptString3 = jSONObject.optString("response");
        if (TextUtils.isEmpty(strOptString) || TextUtils.isEmpty(strOptString2) || TextUtils.isEmpty(strOptString3) || getIronSourceAppKey() == null || !strOptString.equals(getIronSourceAppKey()) || !strOptString2.equals(str)) {
            return null;
        }
        ServerResponseWrapper serverResponseWrapper = new ServerResponseWrapper(context, strOptString, strOptString2, strOptString3);
        IronSourceError ironSourceErrorBuildUsingCachedConfigurationError = ErrorBuilder.buildUsingCachedConfigurationError(strOptString, strOptString2);
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, ironSourceErrorBuildUsingCachedConfigurationError.toString(), 1);
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, ironSourceErrorBuildUsingCachedConfigurationError.toString() + ": " + serverResponseWrapper.toString(), 1);
        RewardedVideoEventsManager.getInstance().log(new EventData(IronSourceConstants.USING_CACHE_FOR_INIT_EVENT, IronSourceUtils.getMediationAdditionalData(false)));
        return serverResponseWrapper;
    }

    private ServerResponseWrapper connectAndGetServerResponse(Context context, String str, IResponseListener iResponseListener) {
        ServerResponseWrapper serverResponseWrapper = null;
        if (!IronSourceUtils.isNetworkConnected(context)) {
            return null;
        }
        try {
            String advertiserId = getAdvertiserId(context);
            if (TextUtils.isEmpty(advertiserId)) {
                advertiserId = DeviceStatus.getOrGenerateOnceUniqueIdentifier(context);
                IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "using custom identifier", 1);
            }
            String str2 = advertiserId;
            IronSourceSegment ironSourceSegment = this.mIronSegment;
            String stringFromURL = HttpFunctions.getStringFromURL(ServerURL.getCPVProvidersURL(context, getIronSourceAppKey(), str, str2, getMediationType(), ironSourceSegment != null ? ironSourceSegment.getSegmentData() : null), iResponseListener);
            if (stringFromURL == null) {
                IronLog.INTERNAL.warning("serverResponseString is null");
                return null;
            }
            if (IronSourceUtils.getSerr() == 1) {
                IronLog.INTERNAL.verbose("encrypt");
                String strOptString = new JSONObject(stringFromURL).optString("response", null);
                if (TextUtils.isEmpty(strOptString)) {
                    IronLog.INTERNAL.warning("encryptedResponse is empty - return null");
                    return null;
                }
                stringFromURL = IronSourceAES.decode(IronSourceUtils.KEY, strOptString);
            }
            ServerResponseWrapper serverResponseWrapper2 = new ServerResponseWrapper(context, getIronSourceAppKey(), str, stringFromURL);
            try {
                if (serverResponseWrapper2.isValidResponse()) {
                    return serverResponseWrapper2;
                }
                IronLog.INTERNAL.warning("response invalid - return null");
                return null;
            } catch (Exception e) {
                e = e;
                serverResponseWrapper = serverResponseWrapper2;
                IronLog.INTERNAL.warning("exception = " + e);
                e.printStackTrace();
                return serverResponseWrapper;
            }
        } catch (Exception e2) {
            e = e2;
        }
    }

    private void initializeSettingsFromServerResponse(ServerResponseWrapper serverResponseWrapper, Context context) {
        initializeLoggerManager(serverResponseWrapper);
        initializeEventsSettings(serverResponseWrapper, context);
    }

    private void initializeEventsSettings(ServerResponseWrapper serverResponseWrapper, Context context) {
        boolean zIsEventsEnabled = isRewardedVideoConfigurationsReady() ? serverResponseWrapper.getConfigurations().getRewardedVideoConfigurations().getRewardedVideoEventsConfigurations().isEventsEnabled() : false;
        boolean zIsEventsEnabled2 = isInterstitialConfigurationsReady() ? serverResponseWrapper.getConfigurations().getInterstitialConfigurations().getInterstitialEventsConfigurations().isEventsEnabled() : false;
        boolean zIsEventsEnabled3 = isBannerConfigurationsReady() ? serverResponseWrapper.getConfigurations().getBannerConfigurations().getBannerEventsConfigurations().isEventsEnabled() : false;
        boolean zIsEventsEnabled4 = isOfferwallConfigurationsReady() ? serverResponseWrapper.getConfigurations().getOfferwallConfigurations().getOfferWallEventsConfigurations().isEventsEnabled() : false;
        if (zIsEventsEnabled) {
            ApplicationEvents rewardedVideoEventsConfigurations = serverResponseWrapper.getConfigurations().getRewardedVideoConfigurations().getRewardedVideoEventsConfigurations();
            RewardedVideoEventsManager.getInstance().setFormatterType(rewardedVideoEventsConfigurations.getEventsType(), context);
            RewardedVideoEventsManager.getInstance().setEventsUrl(rewardedVideoEventsConfigurations.getEventsURL(), context);
            RewardedVideoEventsManager.getInstance().setMaxNumberOfEvents(rewardedVideoEventsConfigurations.getMaxNumberOfEvents());
            RewardedVideoEventsManager.getInstance().setMaxEventsPerBatch(rewardedVideoEventsConfigurations.getMaxEventsPerBatch());
            RewardedVideoEventsManager.getInstance().setBackupThreshold(rewardedVideoEventsConfigurations.getEventsBackupThreshold());
            RewardedVideoEventsManager.getInstance().setOptOutEvents(rewardedVideoEventsConfigurations.getOptOutEvents(), context);
            RewardedVideoEventsManager.getInstance().setOptInEvents(rewardedVideoEventsConfigurations.getOptInEvents(), context);
            RewardedVideoEventsManager.getInstance().setTriggerEvents(rewardedVideoEventsConfigurations.getTriggerEvents(), context);
            RewardedVideoEventsManager.getInstance().setNonConnectivityEvents(rewardedVideoEventsConfigurations.getNonConnectivityEvents(), context);
            RewardedVideoEventsManager.getInstance().setServerSegmentData(serverResponseWrapper.getConfigurations().getApplicationConfigurations().getSegmetData());
        } else if (zIsEventsEnabled4) {
            ApplicationEvents offerWallEventsConfigurations = serverResponseWrapper.getConfigurations().getOfferwallConfigurations().getOfferWallEventsConfigurations();
            RewardedVideoEventsManager.getInstance().setFormatterType(offerWallEventsConfigurations.getEventsType(), context);
            RewardedVideoEventsManager.getInstance().setEventsUrl(offerWallEventsConfigurations.getEventsURL(), context);
            RewardedVideoEventsManager.getInstance().setMaxNumberOfEvents(offerWallEventsConfigurations.getMaxNumberOfEvents());
            RewardedVideoEventsManager.getInstance().setMaxEventsPerBatch(offerWallEventsConfigurations.getMaxEventsPerBatch());
            RewardedVideoEventsManager.getInstance().setBackupThreshold(offerWallEventsConfigurations.getEventsBackupThreshold());
            RewardedVideoEventsManager.getInstance().setOptOutEvents(offerWallEventsConfigurations.getOptOutEvents(), context);
            RewardedVideoEventsManager.getInstance().setOptInEvents(offerWallEventsConfigurations.getOptInEvents(), context);
            RewardedVideoEventsManager.getInstance().setTriggerEvents(offerWallEventsConfigurations.getTriggerEvents(), context);
            RewardedVideoEventsManager.getInstance().setNonConnectivityEvents(offerWallEventsConfigurations.getNonConnectivityEvents(), context);
            RewardedVideoEventsManager.getInstance().setServerSegmentData(serverResponseWrapper.getConfigurations().getApplicationConfigurations().getSegmetData());
        } else {
            RewardedVideoEventsManager.getInstance().setIsEventsEnabled(false);
        }
        if (zIsEventsEnabled2) {
            ApplicationEvents interstitialEventsConfigurations = serverResponseWrapper.getConfigurations().getInterstitialConfigurations().getInterstitialEventsConfigurations();
            InterstitialEventsManager.getInstance().setFormatterType(interstitialEventsConfigurations.getEventsType(), context);
            InterstitialEventsManager.getInstance().setEventsUrl(interstitialEventsConfigurations.getEventsURL(), context);
            InterstitialEventsManager.getInstance().setMaxNumberOfEvents(interstitialEventsConfigurations.getMaxNumberOfEvents());
            InterstitialEventsManager.getInstance().setMaxEventsPerBatch(interstitialEventsConfigurations.getMaxEventsPerBatch());
            InterstitialEventsManager.getInstance().setBackupThreshold(interstitialEventsConfigurations.getEventsBackupThreshold());
            InterstitialEventsManager.getInstance().setOptOutEvents(interstitialEventsConfigurations.getOptOutEvents(), context);
            InterstitialEventsManager.getInstance().setOptInEvents(interstitialEventsConfigurations.getOptInEvents(), context);
            InterstitialEventsManager.getInstance().setTriggerEvents(interstitialEventsConfigurations.getTriggerEvents(), context);
            InterstitialEventsManager.getInstance().setNonConnectivityEvents(interstitialEventsConfigurations.getNonConnectivityEvents(), context);
            InterstitialEventsManager.getInstance().setServerSegmentData(serverResponseWrapper.getConfigurations().getApplicationConfigurations().getSegmetData());
            return;
        }
        if (zIsEventsEnabled3) {
            ApplicationEvents bannerEventsConfigurations = serverResponseWrapper.getConfigurations().getBannerConfigurations().getBannerEventsConfigurations();
            InterstitialEventsManager.getInstance().setFormatterType(bannerEventsConfigurations.getEventsType(), context);
            InterstitialEventsManager.getInstance().setEventsUrl(bannerEventsConfigurations.getEventsURL(), context);
            InterstitialEventsManager.getInstance().setMaxNumberOfEvents(bannerEventsConfigurations.getMaxNumberOfEvents());
            InterstitialEventsManager.getInstance().setMaxEventsPerBatch(bannerEventsConfigurations.getMaxEventsPerBatch());
            InterstitialEventsManager.getInstance().setBackupThreshold(bannerEventsConfigurations.getEventsBackupThreshold());
            InterstitialEventsManager.getInstance().setOptOutEvents(bannerEventsConfigurations.getOptOutEvents(), context);
            InterstitialEventsManager.getInstance().setOptInEvents(bannerEventsConfigurations.getOptInEvents(), context);
            InterstitialEventsManager.getInstance().setTriggerEvents(bannerEventsConfigurations.getTriggerEvents(), context);
            InterstitialEventsManager.getInstance().setNonConnectivityEvents(bannerEventsConfigurations.getNonConnectivityEvents(), context);
            InterstitialEventsManager.getInstance().setServerSegmentData(serverResponseWrapper.getConfigurations().getApplicationConfigurations().getSegmetData());
            return;
        }
        InterstitialEventsManager.getInstance().setIsEventsEnabled(false);
    }

    private void initializeLoggerManager(ServerResponseWrapper serverResponseWrapper) {
        this.mPublisherLogger.setDebugLevel(serverResponseWrapper.getConfigurations().getApplicationConfigurations().getLoggerConfigurations().getPublisherLoggerLevel());
        this.mLoggerManager.setLoggerDebugLevel(ConsoleLogger.NAME, serverResponseWrapper.getConfigurations().getApplicationConfigurations().getLoggerConfigurations().getConsoleLoggerLevel());
    }

    @Override // com.ironsource.mediationsdk.sdk.IronSourceInterface
    public void removeRewardedVideoListener() {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "removeRewardedVideoListener()", 1);
        this.mListenersWrapper.setRewardedVideoListener(null);
    }

    @Override // com.ironsource.mediationsdk.sdk.IronSourceInterface
    public void removeInterstitialListener() {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "removeInterstitialListener()", 1);
        this.mListenersWrapper.setInterstitialListener(null);
    }

    @Override // com.ironsource.mediationsdk.sdk.IronSourceInterface
    public void removeOfferwallListener() {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "removeOfferwallListener()", 1);
        this.mListenersWrapper.setOfferwallListener(null);
    }

    synchronized void setIronSourceUserId(String str, boolean z) {
        IronLog.API.verbose("userId = " + str + ", isFromPublisher = " + z);
        this.mUserId = str;
        if (z) {
            RewardedVideoEventsManager.getInstance().log(new EventData(52, IronSourceUtils.getJsonForUserId(false)));
        }
    }

    public synchronized String getIronSourceAppKey() {
        return this.mAppKey;
    }

    public synchronized String getIronSourceUserId() {
        return this.mUserId;
    }

    private ConfigValidationResult validateAppKey(String str) {
        ConfigValidationResult configValidationResult = new ConfigValidationResult();
        if (str != null) {
            if (validateLength(str, 5, 10)) {
                if (!validateAlphanumeric(str)) {
                    configValidationResult.setInvalid(ErrorBuilder.buildInvalidCredentialsError("appKey", str, "should contain only english characters and numbers"));
                }
            } else {
                configValidationResult.setInvalid(ErrorBuilder.buildInvalidCredentialsError("appKey", str, "length should be between 5-10 characters"));
            }
        } else {
            configValidationResult.setInvalid(new IronSourceError(506, "Init Fail - appKey is missing"));
        }
        return configValidationResult;
    }

    private void validateSegment(String str, ConfigValidationResult configValidationResult) {
        if (str != null) {
            try {
                if (str.length() > 64) {
                    configValidationResult.setInvalid(ErrorBuilder.buildInvalidKeyValueError("segment", IronSourceConstants.SUPERSONIC_CONFIG_NAME, "segment value should not exceed 64 characters."));
                }
            } catch (Exception unused) {
                configValidationResult.setInvalid(ErrorBuilder.buildInvalidKeyValueError("segment", IronSourceConstants.SUPERSONIC_CONFIG_NAME, "segment value should not exceed 64 characters."));
            }
        }
    }

    private void validateDynamicUserId(String str, ConfigValidationResult configValidationResult) {
        if (validateLength(str, 1, 128)) {
            return;
        }
        configValidationResult.setInvalid(ErrorBuilder.buildInvalidKeyValueError(IronSourceConstants.EVENTS_DYNAMIC_USER_ID, IronSourceConstants.SUPERSONIC_CONFIG_NAME, "dynamicUserId is invalid, should be between 1-128 chars in length."));
    }

    private boolean validateLength(String str, int i, int i2) {
        return str != null && str.length() >= i && str.length() <= i2;
    }

    private boolean validateAlphanumeric(String str) {
        if (str == null) {
            return false;
        }
        return str.matches("^[a-zA-Z0-9]*$");
    }

    @Override // com.ironsource.mediationsdk.sdk.IronSourceInterface
    public InterstitialPlacement getInterstitialPlacementInfo(String str) {
        try {
            InterstitialPlacement interstitialPlacement = getInterstitialPlacement(str);
            if (interstitialPlacement == null) {
                try {
                    this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Placement is not valid, please make sure you are using the right placements, using the default placement.", 2);
                    interstitialPlacement = getDefaultInterstitialPlacement();
                } catch (Exception unused) {
                    return interstitialPlacement;
                }
            }
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "getPlacementInfo(placement: " + str + "):" + interstitialPlacement, 1);
            return interstitialPlacement;
        } catch (Exception unused2) {
            return null;
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.IronSourceInterface
    public Placement getRewardedVideoPlacementInfo(String str) {
        try {
            Placement rewardedVideoPlacement = getRewardedVideoPlacement(str);
            if (rewardedVideoPlacement == null) {
                try {
                    this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Placement is not valid, please make sure you are using the right placements, using the default placement.", 2);
                    rewardedVideoPlacement = getDefaultRewardedVideoPlacement();
                } catch (Exception unused) {
                    return rewardedVideoPlacement;
                }
            }
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "getPlacementInfo(placement: " + str + "):" + rewardedVideoPlacement, 1);
            return rewardedVideoPlacement;
        } catch (Exception unused2) {
            return null;
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.IronSourceInterface
    public String getAdvertiserId(Context context) {
        try {
            String[] advertisingIdInfo = DeviceStatus.getAdvertisingIdInfo(context);
            if (advertisingIdInfo.length > 0 && advertisingIdInfo[0] != null) {
                return advertisingIdInfo[0];
            }
        } catch (Exception unused) {
        }
        return "";
    }

    @Override // com.ironsource.mediationsdk.sdk.IronSourceInterface
    public void shouldTrackNetworkState(Context context, boolean z) {
        this.mTrackNetworkStateContext = context;
        this.mShouldTrackNetworkState = Boolean.valueOf(z);
        if (this.mIsIsProgrammatic) {
            ProgIsManager progIsManager = this.mProgIsManager;
            if (progIsManager != null) {
                progIsManager.shouldTrackNetworkState(context, z);
            }
        } else {
            InterstitialManager interstitialManager = this.mInterstitialManager;
            if (interstitialManager != null) {
                interstitialManager.shouldTrackNetworkState(context, z);
            }
        }
        if (this.mIsRvProgrammatic) {
            IProgRvManager iProgRvManager = this.mProgRvManager;
            if (iProgRvManager != null) {
                iProgRvManager.shouldTrackNetworkState(context, z);
                return;
            }
            return;
        }
        RewardedVideoManager rewardedVideoManager = this.mRewardedVideoManager;
        if (rewardedVideoManager != null) {
            rewardedVideoManager.shouldTrackNetworkState(context, z);
        }
    }

    boolean isInterstitialPlacementCapped(String str) {
        if (this.mIsDemandOnlyIs) {
            return false;
        }
        boolean z = getInterstitialCappingStatus(str) != CappingManager.ECappingStatus.NOT_CAPPED;
        if (z) {
            JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(this.mIsDemandOnlyIs, this.mIsIsProgrammatic, 1);
            try {
                mediationAdditionalData.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, str);
                if (this.mIsIsProgrammatic) {
                    mediationAdditionalData.put(IronSourceConstants.EVENTS_PROGRAMMATIC, 1);
                }
            } catch (Exception unused) {
            }
            InterstitialEventsManager.getInstance().log(new EventData(IronSourceConstants.IS_CHECK_CAPPED_TRUE, mediationAdditionalData));
        }
        return z;
    }

    boolean isRewardedVideoPlacementCapped(String str) {
        int i;
        CappingManager.ECappingStatus rewardedVideoCappingStatus = getRewardedVideoCappingStatus(str);
        boolean z = true;
        if (rewardedVideoCappingStatus == null || ((i = AnonymousClass1.$SwitchMap$com$ironsource$mediationsdk$utils$CappingManager$ECappingStatus[rewardedVideoCappingStatus.ordinal()]) != 1 && i != 2 && i != 3)) {
            z = false;
        }
        sendIsCappedEvent(z, str);
        return z;
    }

    /* JADX INFO: renamed from: com.ironsource.mediationsdk.IronSourceObject$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$ironsource$mediationsdk$IronSource$AD_UNIT;
        static final /* synthetic */ int[] $SwitchMap$com$ironsource$mediationsdk$utils$CappingManager$ECappingStatus;

        static {
            int[] iArr = new int[CappingManager.ECappingStatus.values().length];
            $SwitchMap$com$ironsource$mediationsdk$utils$CappingManager$ECappingStatus = iArr;
            try {
                iArr[CappingManager.ECappingStatus.CAPPED_PER_DELIVERY.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$ironsource$mediationsdk$utils$CappingManager$ECappingStatus[CappingManager.ECappingStatus.CAPPED_PER_COUNT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$ironsource$mediationsdk$utils$CappingManager$ECappingStatus[CappingManager.ECappingStatus.CAPPED_PER_PACE.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$ironsource$mediationsdk$utils$CappingManager$ECappingStatus[CappingManager.ECappingStatus.NOT_CAPPED.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            int[] iArr2 = new int[IronSource.AD_UNIT.values().length];
            $SwitchMap$com$ironsource$mediationsdk$IronSource$AD_UNIT = iArr2;
            try {
                iArr2[IronSource.AD_UNIT.REWARDED_VIDEO.ordinal()] = 1;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$ironsource$mediationsdk$IronSource$AD_UNIT[IronSource.AD_UNIT.INTERSTITIAL.ordinal()] = 2;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$com$ironsource$mediationsdk$IronSource$AD_UNIT[IronSource.AD_UNIT.OFFERWALL.ordinal()] = 3;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                $SwitchMap$com$ironsource$mediationsdk$IronSource$AD_UNIT[IronSource.AD_UNIT.BANNER.ordinal()] = 4;
            } catch (NoSuchFieldError unused8) {
            }
        }
    }

    boolean isBannerPlacementCapped(String str) {
        ServerResponseWrapper serverResponseWrapper = this.mCurrentServerResponse;
        if (serverResponseWrapper == null || serverResponseWrapper.getConfigurations() == null || this.mCurrentServerResponse.getConfigurations().getBannerConfigurations() == null) {
            return false;
        }
        BannerPlacement bannerPlacement = null;
        try {
            bannerPlacement = this.mCurrentServerResponse.getConfigurations().getBannerConfigurations().getBannerPlacement(str);
            if (bannerPlacement == null && (bannerPlacement = this.mCurrentServerResponse.getConfigurations().getBannerConfigurations().getDefaultBannerPlacement()) == null) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Banner default placement was not found", 3);
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (bannerPlacement == null) {
            return false;
        }
        return CappingManager.isBnPlacementCapped(this.mActivity, bannerPlacement.getPlacementName());
    }

    private CappingManager.ECappingStatus getInterstitialCappingStatus(String str) {
        ServerResponseWrapper serverResponseWrapper = this.mCurrentServerResponse;
        if (serverResponseWrapper == null || serverResponseWrapper.getConfigurations() == null || this.mCurrentServerResponse.getConfigurations().getInterstitialConfigurations() == null) {
            return CappingManager.ECappingStatus.NOT_CAPPED;
        }
        InterstitialPlacement interstitialPlacement = null;
        try {
            interstitialPlacement = getInterstitialPlacement(str);
            if (interstitialPlacement == null && (interstitialPlacement = getDefaultInterstitialPlacement()) == null) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Default placement was not found", 3);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (interstitialPlacement == null) {
            return CappingManager.ECappingStatus.NOT_CAPPED;
        }
        return CappingManager.isPlacementCapped(this.mActivity, interstitialPlacement);
    }

    private CappingManager.ECappingStatus getRewardedVideoCappingStatus(String str) {
        ServerResponseWrapper serverResponseWrapper = this.mCurrentServerResponse;
        if (serverResponseWrapper == null || serverResponseWrapper.getConfigurations() == null || this.mCurrentServerResponse.getConfigurations().getRewardedVideoConfigurations() == null) {
            return CappingManager.ECappingStatus.NOT_CAPPED;
        }
        Placement rewardedVideoPlacement = null;
        try {
            rewardedVideoPlacement = getRewardedVideoPlacement(str);
            if (rewardedVideoPlacement == null && (rewardedVideoPlacement = getDefaultRewardedVideoPlacement()) == null) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Default placement was not found", 3);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (rewardedVideoPlacement == null) {
            return CappingManager.ECappingStatus.NOT_CAPPED;
        }
        return CappingManager.isPlacementCapped(this.mActivity, rewardedVideoPlacement);
    }

    private void sentEventWithISEventManager(int i, JSONObject jSONObject) {
        InterstitialEventsManager.getInstance().log(new EventData(i, jSONObject));
    }

    private void sentEventWithRVEventManager(int i, JSONObject jSONObject) {
        RewardedVideoEventsManager.getInstance().log(new EventData(i, jSONObject));
    }

    private void sendIsCappedEvent(boolean z, String str) {
        if (z) {
            JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(this.mIsDemandOnlyRv, this.mIsRvProgrammatic, this.rvProgrammaticMode);
            if (str != null) {
                addToDictionary(mediationAdditionalData, new Object[][]{new Object[]{IronSourceConstants.EVENTS_PLACEMENT_NAME, str}});
            }
            sentEventWithRVEventManager(IronSourceConstants.RV_API_IS_CAPPED_TRUE, mediationAdditionalData);
        }
    }

    String getCappingMessage(String str, CappingManager.ECappingStatus eCappingStatus) {
        if (eCappingStatus == null) {
            return null;
        }
        int i = AnonymousClass1.$SwitchMap$com$ironsource$mediationsdk$utils$CappingManager$ECappingStatus[eCappingStatus.ordinal()];
        if (i != 1 && i != 2 && i != 3) {
            return null;
        }
        return "placement " + str + " is capped";
    }

    ServerResponseWrapper getCurrentServerResponse() {
        return this.mCurrentServerResponse;
    }

    void setSegmentListener(SegmentListener segmentListener) {
        ListenersWrapper listenersWrapper = this.mListenersWrapper;
        if (listenersWrapper != null) {
            listenersWrapper.setSegmentListener(segmentListener);
            MediationInitializer.getInstance().setSegmentListener(this.mListenersWrapper);
        }
    }

    HashSet<String> getAllSettingsForProvider(String str, String str2) {
        ServerResponseWrapper serverResponseWrapper = this.mCurrentServerResponse;
        if (serverResponseWrapper == null) {
            return new HashSet<>();
        }
        return serverResponseWrapper.getProviderSettingsHolder().getProviderSettingsByReflectionName(str, str2);
    }

    private BannerPlacement getBannerPlacement(String str) {
        BannerConfigurations bannerConfigurations = this.mCurrentServerResponse.getConfigurations().getBannerConfigurations();
        if (bannerConfigurations == null) {
            return null;
        }
        if (TextUtils.isEmpty(str)) {
            return bannerConfigurations.getDefaultBannerPlacement();
        }
        BannerPlacement bannerPlacement = bannerConfigurations.getBannerPlacement(str);
        return bannerPlacement != null ? bannerPlacement : bannerConfigurations.getDefaultBannerPlacement();
    }

    public synchronized String getSessionId() {
        return this.mSessionId;
    }

    public void setConsent(boolean z) {
        this.mConsent = Boolean.valueOf(z);
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.API, "setConsent : " + z, 1);
        AdapterRepository.getInstance().setConsent(z);
        if (this.mOfferwallAdapter != null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_API, "Offerwall | setConsent(consent:" + z + ")", 1);
            this.mOfferwallAdapter.setConsent(z);
        }
        RewardedVideoEventsManager.getInstance().log(new EventData(z ? 40 : 41, IronSourceUtils.getMediationAdditionalData(false)));
    }

    Boolean getConsent() {
        return this.mConsent;
    }

    private void addToDictionary(JSONObject jSONObject, Object[][] objArr) {
        if (objArr != null) {
            try {
                for (Object[] objArr2 : objArr) {
                    jSONObject.put(objArr2[0].toString(), objArr2[1]);
                }
            } catch (Exception e) {
                IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "IronSourceObject addToDictionary: " + Log.getStackTraceString(e), 3);
            }
        }
    }

    public void setMetaData(String str, List<String> list) {
        if (MediationInitializer.getInstance().getCurrentInitStatus() == MediationInitializer.EInitStatus.INITIATED) {
            IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.API, "setMetaData must be called prior to Init. Calling it after init will be ignored", 1);
            RewardedVideoEventsManager.getInstance().log(new EventData(51, IronSourceUtils.getJsonForMetaData(str, list, new ArrayList())));
            return;
        }
        IronLog.API.verbose("key = " + str + ", values = " + list.toString());
        String strCheckMetaDataKeyValidity = MetaDataUtils.checkMetaDataKeyValidity(str);
        String strCheckMetaDataValueValidity = MetaDataUtils.checkMetaDataValueValidity(list);
        if (strCheckMetaDataKeyValidity.length() > 0) {
            IronLog.API.verbose(strCheckMetaDataKeyValidity);
            return;
        }
        if (strCheckMetaDataValueValidity.length() > 0) {
            IronLog.API.verbose(strCheckMetaDataValueValidity);
            return;
        }
        MetaData metaData = MetaDataUtils.formatMetaData(str, list);
        String metaDataKey = metaData.getMetaDataKey();
        List<String> metaDataValue = metaData.getMetaDataValue();
        AdapterRepository.getInstance().setMetaData(metaDataKey, metaDataValue);
        RewardedVideoEventsManager.getInstance().log(new EventData(50, IronSourceUtils.getJsonForMetaData(str, list, metaDataValue)));
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0085  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.String getISDemandOnlyBiddingData() {
        /*
            r6 = this;
            r0 = 83005(0x1443d, float:1.16315E-40)
            r1 = 0
            r6.sentEventWithRVEventManager(r0, r1)
            com.ironsource.mediationsdk.logger.IronLog r0 = com.ironsource.mediationsdk.logger.IronLog.API
            java.lang.String r2 = ""
            r0.info(r2)
            com.ironsource.mediationsdk.utils.ServerResponseWrapper r0 = r6.mCurrentServerResponse
            if (r0 != 0) goto L1a
            com.ironsource.mediationsdk.logger.IronLog r0 = com.ironsource.mediationsdk.logger.IronLog.ADAPTER_API
            java.lang.String r2 = "bidding data cannot be retrieved, SDK not initialized"
            r0.error(r2)
            goto L82
        L1a:
            com.ironsource.mediationsdk.model.ProviderSettingsHolder r0 = r0.getProviderSettingsHolder()
            java.lang.String r2 = "IronSource"
            com.ironsource.mediationsdk.model.ProviderSettings r0 = r0.getProviderSettings(r2)
            if (r0 == 0) goto L82
            org.json.JSONObject r2 = new org.json.JSONObject
            r2.<init>()
            com.ironsource.mediationsdk.AdapterRepository r3 = com.ironsource.mediationsdk.AdapterRepository.getInstance()
            org.json.JSONObject r4 = r0.getApplicationSettings()
            r5 = 1
            com.ironsource.mediationsdk.AbstractAdapter r0 = r3.getAdapter(r0, r4, r5)
            if (r0 == 0) goto L3e
            org.json.JSONObject r2 = r0.getPlayerBiddingData()     // Catch: java.lang.Exception -> L61
        L3e:
            com.ironsource.mediationsdk.AuctionDataUtils r0 = com.ironsource.mediationsdk.AuctionDataUtils.getInstance()     // Catch: java.lang.Exception -> L61
            com.ironsource.mediationsdk.utils.ServerResponseWrapper r3 = r6.mCurrentServerResponse     // Catch: java.lang.Exception -> L61
            com.ironsource.mediationsdk.model.Configurations r3 = r3.getConfigurations()     // Catch: java.lang.Exception -> L61
            com.ironsource.mediationsdk.model.ApplicationConfigurations r3 = r3.getApplicationConfigurations()     // Catch: java.lang.Exception -> L61
            com.ironsource.mediationsdk.utils.TokenSettings r3 = r3.getTokenSettings()     // Catch: java.lang.Exception -> L61
            java.util.ArrayList r3 = r3.getOptInKeyParamsTokenArray()     // Catch: java.lang.Exception -> L61
            org.json.JSONObject r0 = r0.createToken(r2, r3)     // Catch: java.lang.Exception -> L61
            com.ironsource.mediationsdk.AuctionDataUtils r2 = com.ironsource.mediationsdk.AuctionDataUtils.getInstance()     // Catch: java.lang.Exception -> L61
            java.lang.String r0 = r2.encryptToken(r0)     // Catch: java.lang.Exception -> L61
            goto L83
        L61:
            r0 = move-exception
            r2 = 83007(0x1443f, float:1.16318E-40)
            r6.sentEventWithRVEventManager(r2, r1)
            com.ironsource.mediationsdk.logger.IronLog r2 = com.ironsource.mediationsdk.logger.IronLog.ADAPTER_API
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            java.lang.String r4 = "got error during creating the token: "
            r3.append(r4)
            java.lang.String r0 = r0.getMessage()
            r3.append(r0)
            java.lang.String r0 = r3.toString()
            r2.error(r0)
        L82:
            r0 = r1
        L83:
            if (r0 != 0) goto L8b
            r2 = 83006(0x1443e, float:1.16316E-40)
            r6.sentEventWithRVEventManager(r2, r1)
        L8b:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ironsource.mediationsdk.IronSourceObject.getISDemandOnlyBiddingData():java.lang.String");
    }

    @Override // com.ironsource.mediationsdk.impressionData.ImpressionDataAPI
    public void setImpressionDataListener(ImpressionDataListener impressionDataListener) {
        if (impressionDataListener == null) {
            IronLog.API.error("listener is null");
            return;
        }
        this.ironsourceObjectPublisherDataHolder.setImpressionDataListener(impressionDataListener);
        IProgRvManager iProgRvManager = this.mProgRvManager;
        if (iProgRvManager != null) {
            iProgRvManager.setImpressionDataListener(impressionDataListener);
        }
        ProgIsManager progIsManager = this.mProgIsManager;
        if (progIsManager != null) {
            progIsManager.setImpressionDataListener(impressionDataListener);
        }
        ProgBannerManager progBannerManager = this.mProgBannerManager;
        if (progBannerManager != null) {
            progBannerManager.setImpressionDataListener(impressionDataListener);
        }
        IronLog.API.info("set impression data listener to " + impressionDataListener.getClass().getSimpleName());
    }
}
