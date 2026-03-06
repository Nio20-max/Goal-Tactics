package com.ironsource.mediationsdk;

import android.content.Context;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import com.ironsource.eventsmodule.EventData;
import com.ironsource.mediationsdk.AuctionHistory;
import com.ironsource.mediationsdk.events.InterstitialEventsManager;
import com.ironsource.mediationsdk.impressionData.ImpressionDataListener;
import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.model.InterstitialConfigurations;
import com.ironsource.mediationsdk.model.ProviderSettings;
import com.ironsource.mediationsdk.utils.AuctionSettings;
import com.ironsource.mediationsdk.utils.CappingManager;
import com.ironsource.mediationsdk.utils.ContextProvider;
import com.ironsource.mediationsdk.utils.ErrorBuilder;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import com.ironsource.mediationsdk.utils.SessionCappingManager;
import com.ironsource.mediationsdk.utils.SessionDepthManager;
import com.ironsource.sdk.constants.Constants;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
class ProgIsManager extends BaseProgManager implements ProgIsManagerListener, AuctionEventListener, IProgManager {
    private boolean mAdvancedLoading;
    private String mAuctionFallback;
    private AuctionHandler mAuctionHandler;
    private AuctionHistory mAuctionHistory;
    private int mAuctionTrial;
    private String mCurrentAuctionId;
    private String mCurrentPlacement;
    private AuctionResponseItem mGenericNotifications;
    private long mInitMangerTime;
    private boolean mIsAuctionEnabled;
    private long mLoadStartTime;
    private int mMaxSmashesToLoad;
    private SessionCappingManager mSessionCappingManager;
    boolean mShouldTrackNetworkState;
    private final ConcurrentHashMap<String, ProgIsSmash> mSmashes;
    private MEDIATION_STATE mState;
    private long mTimeToWaitBeforeFirstAction;
    private CopyOnWriteArrayList<ProgIsSmash> mWaterfall;
    private ConcurrentHashMap<String, AuctionHistory.ISAuctionPerformance> mWaterfallPerformance;
    private ConcurrentHashMap<String, AuctionResponseItem> mWaterfallServerData;

    enum MEDIATION_STATE {
        STATE_NOT_INITIALIZED,
        STATE_READY_TO_LOAD,
        STATE_AUCTION,
        STATE_LOADING_SMASHES,
        STATE_READY_TO_SHOW,
        STATE_SHOWING
    }

    private boolean shouldAddAuctionParams(int i) {
        return i == 2002 || i == 2003 || i == 2200 || i == 2005 || i == 2204 || i == 2201 || i == 2203 || i == 2006 || i == 2004 || i == 2110 || i == 2301 || i == 2300;
    }

    public ProgIsManager(List<ProviderSettings> list, InterstitialConfigurations interstitialConfigurations, String str, String str2, int i, ImpressionDataListener impressionDataListener) {
        super(impressionDataListener);
        this.mAuctionFallback = "";
        this.mShouldTrackNetworkState = false;
        long time = new Date().getTime();
        sendMediationEvent(IronSourceConstants.IS_MANAGER_INIT_STARTED);
        setState(MEDIATION_STATE.STATE_NOT_INITIALIZED);
        this.mSmashes = new ConcurrentHashMap<>();
        this.mWaterfall = new CopyOnWriteArrayList<>();
        this.mWaterfallServerData = new ConcurrentHashMap<>();
        this.mWaterfallPerformance = new ConcurrentHashMap<>();
        this.mCurrentPlacement = "";
        this.mCurrentAuctionId = "";
        this.mMaxSmashesToLoad = interstitialConfigurations.getInterstitialAdaptersSmartLoadAmount();
        this.mAdvancedLoading = interstitialConfigurations.getInterstitialAdvancedLoading();
        CallbackThrottler.getInstance().setDelayLoadFailureNotificationInSeconds(i);
        AuctionSettings interstitialAuctionSettings = interstitialConfigurations.getInterstitialAuctionSettings();
        this.mTimeToWaitBeforeFirstAction = interstitialAuctionSettings.getTimeToWaitBeforeFirstAuctionMs();
        boolean z = interstitialAuctionSettings.getNumOfMaxTrials() > 0;
        this.mIsAuctionEnabled = z;
        if (z) {
            this.mAuctionHandler = new AuctionHandler(IronSourceConstants.AD_UNIT_IS_MEDIATION_STATE, interstitialAuctionSettings, this);
        }
        ArrayList arrayList = new ArrayList();
        for (ProviderSettings providerSettings : list) {
            AbstractAdapter adapter = AdapterRepository.getInstance().getAdapter(providerSettings, providerSettings.getInterstitialSettings());
            if (adapter != null && AdaptersCompatibilityHandler.getInstance().isAdapterVersionISCompatible(adapter)) {
                ProgIsSmash progIsSmash = new ProgIsSmash(str, str2, providerSettings, this, interstitialConfigurations.getInterstitialAdaptersSmartLoadTimeout(), adapter);
                String instanceName = progIsSmash.getInstanceName();
                this.mSmashes.put(instanceName, progIsSmash);
                arrayList.add(instanceName);
            }
        }
        this.mAuctionHistory = new AuctionHistory(arrayList, interstitialAuctionSettings.getAuctionSavedHistoryLimit());
        this.mSessionCappingManager = new SessionCappingManager(new ArrayList(this.mSmashes.values()));
        for (ProgIsSmash progIsSmash2 : this.mSmashes.values()) {
            if (progIsSmash2.isBidder()) {
                progIsSmash2.initForBidding();
            }
        }
        this.mInitMangerTime = new Date().getTime();
        setState(MEDIATION_STATE.STATE_READY_TO_LOAD);
        sendMediationEvent(IronSourceConstants.IS_MANAGER_INIT_ENDED, new Object[][]{new Object[]{"duration", Long.valueOf(new Date().getTime() - time)}});
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void makeAuction() {
        setState(MEDIATION_STATE.STATE_AUCTION);
        AsyncTask.execute(new Runnable() { // from class: com.ironsource.mediationsdk.ProgIsManager.1
            @Override // java.lang.Runnable
            public void run() {
                ProgIsManager.this.mCurrentAuctionId = "";
                StringBuilder sb = new StringBuilder();
                long time = ProgIsManager.this.mTimeToWaitBeforeFirstAction - (new Date().getTime() - ProgIsManager.this.mInitMangerTime);
                if (time <= 0) {
                    ProgIsManager.this.sendMediationEvent(IronSourceConstants.IS_AUCTION_REQUEST, (Object[][]) null);
                    HashMap map = new HashMap();
                    ArrayList arrayList = new ArrayList();
                    for (ProgIsSmash progIsSmash : ProgIsManager.this.mSmashes.values()) {
                        if (!ProgIsManager.this.mSessionCappingManager.isCapped(progIsSmash)) {
                            if (progIsSmash.isBidder()) {
                                Map<String, Object> biddingData = progIsSmash.getBiddingData();
                                if (biddingData != null) {
                                    map.put(progIsSmash.getInstanceName(), biddingData);
                                    sb.append(progIsSmash.getInstanceType() + progIsSmash.getInstanceName() + ",");
                                }
                            } else {
                                arrayList.add(progIsSmash.getInstanceName());
                                sb.append(progIsSmash.getInstanceType() + progIsSmash.getInstanceName() + ",");
                            }
                        }
                    }
                    if (map.size() != 0 || arrayList.size() != 0) {
                        ProgIsManager.this.sendMediationEvent(IronSourceConstants.IS_AUCTION_REQUEST_WATERFALL, new Object[][]{new Object[]{IronSourceConstants.EVENTS_EXT1, sb.toString()}});
                        int sessionDepth = SessionDepthManager.getInstance().getSessionDepth(2);
                        if (ProgIsManager.this.mAuctionHandler != null) {
                            ProgIsManager.this.mAuctionHandler.executeAuction(ContextProvider.getInstance().getApplicationContext(), map, arrayList, ProgIsManager.this.mAuctionHistory, sessionDepth);
                            return;
                        }
                        return;
                    }
                    ProgIsManager.this.sendMediationEvent(IronSourceConstants.IS_AUCTION_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1005}, new Object[]{"duration", 0}});
                    ProgIsManager.this.logInternal("makeAuction() failed - No candidates available for auctioning");
                    CallbackThrottler.getInstance().onInterstitialAdLoadFailed(new IronSourceError(1005, "No candidates available for auctioning"));
                    ProgIsManager.this.sendMediationEvent(IronSourceConstants.IS_CALLBACK_LOAD_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1005}});
                    ProgIsManager.this.setState(MEDIATION_STATE.STATE_READY_TO_LOAD);
                    return;
                }
                new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.ironsource.mediationsdk.ProgIsManager.1.1
                    @Override // java.lang.Runnable
                    public void run() {
                        ProgIsManager.this.makeAuction();
                    }
                }, time);
            }
        });
    }

    @Override // com.ironsource.mediationsdk.AuctionEventListener
    public void onAuctionSuccess(List<AuctionResponseItem> list, String str, AuctionResponseItem auctionResponseItem, int i, long j) {
        this.mCurrentAuctionId = str;
        this.mGenericNotifications = auctionResponseItem;
        this.mAuctionTrial = i;
        this.mAuctionFallback = "";
        sendMediationEvent(IronSourceConstants.IS_AUCTION_SUCCESS, new Object[][]{new Object[]{"duration", Long.valueOf(j)}});
        updateWaterfall(list);
        loadSmashes();
    }

    @Override // com.ironsource.mediationsdk.AuctionEventListener
    public void onAuctionFailed(int i, String str, int i2, String str2, long j) {
        logInternal("Auction failed | moving to fallback waterfall");
        this.mAuctionTrial = i2;
        this.mAuctionFallback = str2;
        if (TextUtils.isEmpty(str)) {
            sendMediationEvent(IronSourceConstants.IS_AUCTION_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(i)}, new Object[]{"duration", Long.valueOf(j)}});
        } else {
            sendMediationEvent(IronSourceConstants.IS_AUCTION_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(i)}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, str}, new Object[]{"duration", Long.valueOf(j)}});
        }
        updateWaterfallToNonBidding();
        loadSmashes();
    }

    private void updateWaterfallToNonBidding() {
        updateWaterfall(extractNonBidderProvidersFromWaterfall());
    }

    private List<AuctionResponseItem> extractNonBidderProvidersFromWaterfall() {
        CopyOnWriteArrayList copyOnWriteArrayList = new CopyOnWriteArrayList();
        for (ProgIsSmash progIsSmash : this.mSmashes.values()) {
            if (!progIsSmash.isBidder() && !this.mSessionCappingManager.isCapped(progIsSmash)) {
                copyOnWriteArrayList.add(new AuctionResponseItem(progIsSmash.getInstanceName()));
            }
        }
        return copyOnWriteArrayList;
    }

    private String getAsString(AuctionResponseItem auctionResponseItem) {
        String string;
        ProgIsSmash progIsSmash = this.mSmashes.get(auctionResponseItem.getInstanceName());
        if (progIsSmash != null) {
            string = Integer.toString(progIsSmash.getInstanceType());
        } else {
            string = TextUtils.isEmpty(auctionResponseItem.getServerData()) ? "1" : "2";
        }
        return string + auctionResponseItem.getInstanceName();
    }

    private void updateWaterfall(List<AuctionResponseItem> list) {
        this.mWaterfall.clear();
        this.mWaterfallServerData.clear();
        this.mWaterfallPerformance.clear();
        StringBuilder sb = new StringBuilder();
        for (AuctionResponseItem auctionResponseItem : list) {
            sb.append(getAsString(auctionResponseItem) + ",");
            ProgIsSmash progIsSmash = this.mSmashes.get(auctionResponseItem.getInstanceName());
            if (progIsSmash != null) {
                progIsSmash.setIsLoadCandidate(true);
                this.mWaterfall.add(progIsSmash);
                this.mWaterfallServerData.put(progIsSmash.getInstanceName(), auctionResponseItem);
                this.mWaterfallPerformance.put(auctionResponseItem.getInstanceName(), AuctionHistory.ISAuctionPerformance.ISAuctionPerformanceDidntAttemptToLoad);
            } else {
                logInternal("updateWaterfall() - could not find matching smash for auction response item " + auctionResponseItem.getInstanceName());
            }
        }
        logInternal("updateWaterfall() - response waterfall is " + sb.toString());
        if (sb.length() == 0) {
            logInternal("Updated waterfall is empty");
        }
        sendMediationEvent(IronSourceConstants.IS_RESULT_WATERFALL, new Object[][]{new Object[]{IronSourceConstants.EVENTS_EXT1, sb.toString()}});
    }

    private void loadSmash(ProgIsSmash progIsSmash) {
        String serverData = this.mWaterfallServerData.get(progIsSmash.getInstanceName()).getServerData();
        progIsSmash.setDynamicDemandSourceIdByServerData(serverData);
        sendProviderEvent(IronSourceConstants.IS_INSTANCE_LOAD, progIsSmash);
        progIsSmash.loadInterstitial(serverData);
    }

    private void loadSmashes() {
        if (this.mWaterfall.isEmpty()) {
            setState(MEDIATION_STATE.STATE_READY_TO_LOAD);
            sendMediationEvent(IronSourceConstants.IS_CALLBACK_LOAD_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(IronSourceError.ERROR_IS_LOAD_FAILED_NO_CANDIDATES)}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "Empty waterfall"}});
            CallbackThrottler.getInstance().onInterstitialAdLoadFailed(new IronSourceError(IronSourceError.ERROR_IS_LOAD_FAILED_NO_CANDIDATES, "Empty waterfall"));
            return;
        }
        setState(MEDIATION_STATE.STATE_LOADING_SMASHES);
        int i = 0;
        for (int i2 = 0; i2 < this.mWaterfall.size() && i < this.mMaxSmashesToLoad; i2++) {
            ProgIsSmash progIsSmash = this.mWaterfall.get(i2);
            if (progIsSmash.getIsLoadCandidate()) {
                if (this.mAdvancedLoading && progIsSmash.isBidder()) {
                    if (i == 0) {
                        loadSmash(progIsSmash);
                        return;
                    }
                    logInternal("Advanced Loading: Won't start loading bidder " + progIsSmash.getInstanceName() + " as a non bidder is being loaded");
                    return;
                }
                loadSmash(progIsSmash);
                i++;
            }
        }
    }

    public synchronized void loadInterstitial() {
        if (this.mState == MEDIATION_STATE.STATE_SHOWING) {
            IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.API, "loadInterstitial: load cannot be invoked while showing an ad", 3);
            ISListenerWrapper.getInstance().onInterstitialAdLoadFailed(new IronSourceError(IronSourceError.ERROR_IS_LOAD_DURING_SHOW, "loadInterstitial: load cannot be invoked while showing an ad"));
            return;
        }
        if ((this.mState != MEDIATION_STATE.STATE_READY_TO_LOAD && this.mState != MEDIATION_STATE.STATE_READY_TO_SHOW) || CallbackThrottler.getInstance().hasPendingInvocation()) {
            logInternal("loadInterstitial: load is already in progress");
            return;
        }
        this.mCurrentAuctionId = "";
        this.mCurrentPlacement = "";
        sendMediationEvent(IronSourceConstants.IS_LOAD_CALLED);
        this.mLoadStartTime = new Date().getTime();
        if (this.mIsAuctionEnabled) {
            if (!this.mWaterfallPerformance.isEmpty()) {
                this.mAuctionHistory.storeWaterfallPerformance(this.mWaterfallPerformance);
                this.mWaterfallPerformance.clear();
            }
            makeAuction();
        } else {
            updateWaterfallToNonBidding();
            loadSmashes();
        }
    }

    public synchronized void showInterstitial(String str) {
        if (this.mState == MEDIATION_STATE.STATE_SHOWING) {
            logAPIError("showInterstitial error: can't show ad while an ad is already showing");
            ISListenerWrapper.getInstance().onInterstitialAdShowFailed(new IronSourceError(IronSourceError.ERROR_IS_SHOW_CALLED_DURING_SHOW, "showInterstitial error: can't show ad while an ad is already showing"));
            sendMediationEvent(IronSourceConstants.IS_CALLBACK_AD_SHOW_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(IronSourceError.ERROR_IS_SHOW_CALLED_DURING_SHOW)}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "showInterstitial error: can't show ad while an ad is already showing"}});
            return;
        }
        if (this.mState != MEDIATION_STATE.STATE_READY_TO_SHOW) {
            logInternal("showInterstitial() error state=" + this.mState.toString());
            logAPIError("showInterstitial error: show called while no ads are available");
            ISListenerWrapper.getInstance().onInterstitialAdShowFailed(new IronSourceError(509, "showInterstitial error: show called while no ads are available"));
            sendMediationEvent(IronSourceConstants.IS_CALLBACK_AD_SHOW_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 509}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "showInterstitial error: show called while no ads are available"}});
            return;
        }
        if (str == null) {
            logAPIError("showInterstitial error: empty default placement");
            ISListenerWrapper.getInstance().onInterstitialAdShowFailed(new IronSourceError(1020, "showInterstitial error: empty default placement"));
            sendMediationEvent(IronSourceConstants.IS_CALLBACK_AD_SHOW_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1020}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "showInterstitial error: empty default placement"}});
            return;
        }
        this.mCurrentPlacement = str;
        sendMediationEventWithPlacement(IronSourceConstants.IS_SHOW_CALLED);
        if (CappingManager.isInterstitialPlacementCapped(ContextProvider.getInstance().getApplicationContext(), this.mCurrentPlacement)) {
            String str2 = "placement " + this.mCurrentPlacement + " is capped";
            logAPIError(str2);
            ISListenerWrapper.getInstance().onInterstitialAdShowFailed(new IronSourceError(IronSourceError.ERROR_REACHED_CAP_LIMIT_PER_PLACEMENT, str2));
            sendMediationEventWithPlacement(IronSourceConstants.IS_CALLBACK_AD_SHOW_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(IronSourceError.ERROR_REACHED_CAP_LIMIT_PER_PLACEMENT)}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, str2}});
            return;
        }
        for (ProgIsSmash progIsSmash : this.mWaterfall) {
            if (progIsSmash.isReadyToShow()) {
                showInterstitial(progIsSmash, this.mCurrentPlacement);
                return;
            }
            logInternal("showInterstitial " + progIsSmash.getInstanceName() + " isReadyToShow() == false");
        }
        ISListenerWrapper.getInstance().onInterstitialAdShowFailed(ErrorBuilder.buildNoAdsToShowError("Interstitial"));
        sendMediationEventWithPlacement(IronSourceConstants.IS_CALLBACK_AD_SHOW_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 509}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "Show Fail - No ads to show"}});
    }

    private void showInterstitial(ProgIsSmash progIsSmash, String str) {
        setState(MEDIATION_STATE.STATE_SHOWING);
        progIsSmash.showInterstitial();
        sendProviderEventWithPlacement(IronSourceConstants.IS_INSTANCE_SHOW, progIsSmash);
        this.mSessionCappingManager.increaseShowCounter(progIsSmash);
        if (this.mSessionCappingManager.isCapped(progIsSmash)) {
            progIsSmash.setCappedPerSession();
            sendProviderEvent(IronSourceConstants.IS_CAP_SESSION, progIsSmash);
            IronSourceUtils.sendAutomationLog(progIsSmash.getInstanceName() + " was session capped");
        }
        CappingManager.incrementIsShowCounter(ContextProvider.getInstance().getApplicationContext(), str);
        if (CappingManager.isInterstitialPlacementCapped(ContextProvider.getInstance().getApplicationContext(), str)) {
            sendMediationEventWithPlacement(IronSourceConstants.IS_CAP_PLACEMENT);
        }
    }

    public synchronized boolean isInterstitialReady() {
        if ((this.mShouldTrackNetworkState && !IronSourceUtils.isNetworkConnected(ContextProvider.getInstance().getApplicationContext())) || this.mState != MEDIATION_STATE.STATE_READY_TO_SHOW) {
            return false;
        }
        Iterator<ProgIsSmash> it = this.mWaterfall.iterator();
        while (it.hasNext()) {
            if (it.next().isReadyToShow()) {
                return true;
            }
        }
        return false;
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdReady(ProgIsSmash progIsSmash, long j) {
        synchronized (this) {
            logSmashCallback(progIsSmash, "onInterstitialAdReady");
            sendProviderEvent(IronSourceConstants.IS_INSTANCE_LOAD_SUCCESS, progIsSmash, new Object[][]{new Object[]{"duration", Long.valueOf(j)}});
            if (progIsSmash != null && this.mWaterfallPerformance.containsKey(progIsSmash.getInstanceName())) {
                this.mWaterfallPerformance.put(progIsSmash.getInstanceName(), AuctionHistory.ISAuctionPerformance.ISAuctionPerformanceLoadedSuccessfully);
            }
            if (this.mState == MEDIATION_STATE.STATE_LOADING_SMASHES) {
                setState(MEDIATION_STATE.STATE_READY_TO_SHOW);
                ISListenerWrapper.getInstance().onInterstitialAdReady();
                sendMediationEvent(IronSourceConstants.IS_CALLBACK_LOAD_SUCCESS, new Object[][]{new Object[]{"duration", Long.valueOf(new Date().getTime() - this.mLoadStartTime)}});
                if (this.mIsAuctionEnabled) {
                    AuctionResponseItem auctionResponseItem = this.mWaterfallServerData.get(progIsSmash.getInstanceName());
                    if (auctionResponseItem != null) {
                        this.mAuctionHandler.reportLoadSuccess(auctionResponseItem, progIsSmash.getInstanceType(), this.mGenericNotifications);
                        this.mAuctionHandler.reportAuctionLose(this.mWaterfall, this.mWaterfallServerData, progIsSmash.getInstanceType(), this.mGenericNotifications, auctionResponseItem);
                    } else {
                        String instanceName = progIsSmash != null ? progIsSmash.getInstanceName() : "Smash is null";
                        logInternal("onInterstitialAdReady winner instance " + instanceName + " missing from waterfall");
                        sendMediationEvent(IronSourceConstants.TROUBLESHOOTING_IS_NOTIFICATIONS_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1010}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "Loaded missing"}, new Object[]{IronSourceConstants.EVENTS_EXT1, instanceName}});
                    }
                }
            }
        }
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdLoadFailed(IronSourceError ironSourceError, ProgIsSmash progIsSmash, long j) {
        CopyOnWriteArrayList copyOnWriteArrayList = new CopyOnWriteArrayList();
        synchronized (this) {
            logSmashCallback(progIsSmash, "onInterstitialAdLoadFailed error=" + ironSourceError.getErrorMessage() + " state=" + this.mState.name());
            sendProviderEvent(IronSourceConstants.IS_INSTANCE_LOAD_FAILED, progIsSmash, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(ironSourceError.getErrorCode())}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, ironSourceError.getErrorMessage()}, new Object[]{"duration", Long.valueOf(j)}});
            if (progIsSmash != null && this.mWaterfallPerformance.containsKey(progIsSmash.getInstanceName())) {
                this.mWaterfallPerformance.put(progIsSmash.getInstanceName(), AuctionHistory.ISAuctionPerformance.ISAuctionPerformanceFailedToLoad);
            }
            boolean z = false;
            boolean z2 = false;
            for (ProgIsSmash progIsSmash2 : this.mWaterfall) {
                if (progIsSmash2.getIsLoadCandidate()) {
                    if (!this.mAdvancedLoading || !progIsSmash2.isBidder() || (!z && !z2)) {
                        copyOnWriteArrayList.add(progIsSmash2);
                        if (!this.mAdvancedLoading || !progIsSmash.isBidder() || progIsSmash2.isBidder() || copyOnWriteArrayList.size() >= this.mMaxSmashesToLoad) {
                            break;
                        }
                    } else {
                        logInternal("Advanced Loading: Won't start loading bidder " + progIsSmash2.getInstanceName() + " as " + (z ? "a non bidder is being loaded" : "a non bidder was already loaded successfully"));
                    }
                } else if (!progIsSmash2.isLoadingInProgress()) {
                    if (progIsSmash2.isReadyToShow()) {
                        z2 = true;
                    }
                }
                z = true;
            }
            if (copyOnWriteArrayList.size() == 0 && this.mState == MEDIATION_STATE.STATE_LOADING_SMASHES && !z) {
                CallbackThrottler.getInstance().onInterstitialAdLoadFailed(new IronSourceError(509, "No ads to show"));
                sendMediationEvent(IronSourceConstants.IS_CALLBACK_LOAD_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 509}});
                setState(MEDIATION_STATE.STATE_READY_TO_LOAD);
            }
        }
        Iterator it = copyOnWriteArrayList.iterator();
        while (it.hasNext()) {
            loadSmash((ProgIsSmash) it.next());
        }
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdOpened(ProgIsSmash progIsSmash) {
        synchronized (this) {
            logSmashCallback(progIsSmash, "onInterstitialAdOpened");
            ISListenerWrapper.getInstance().onInterstitialAdOpened();
            sendProviderEventWithPlacement(IronSourceConstants.IS_INSTANCE_OPENED, progIsSmash);
            if (this.mIsAuctionEnabled) {
                AuctionResponseItem auctionResponseItem = this.mWaterfallServerData.get(progIsSmash.getInstanceName());
                if (auctionResponseItem != null) {
                    this.mAuctionHandler.reportImpression(auctionResponseItem, progIsSmash.getInstanceType(), this.mGenericNotifications, this.mCurrentPlacement);
                    this.mWaterfallPerformance.put(progIsSmash.getInstanceName(), AuctionHistory.ISAuctionPerformance.ISAuctionPerformanceShowedSuccessfully);
                    reportImpressionDataToPublisher(auctionResponseItem, this.mCurrentPlacement);
                } else {
                    String instanceName = progIsSmash != null ? progIsSmash.getInstanceName() : "Smash is null";
                    logInternal("onInterstitialAdOpened showing instance " + instanceName + " missing from waterfall");
                    sendMediationEvent(IronSourceConstants.TROUBLESHOOTING_IS_NOTIFICATIONS_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1011}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "Showing missing " + this.mState}, new Object[]{IronSourceConstants.EVENTS_EXT1, instanceName}});
                }
            }
        }
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdClosed(ProgIsSmash progIsSmash) {
        synchronized (this) {
            logSmashCallback(progIsSmash, "onInterstitialAdClosed");
            sendProviderEventWithPlacement(IronSourceConstants.IS_INSTANCE_CLOSED, progIsSmash, new Object[][]{new Object[]{"sessionDepth", Integer.valueOf(SessionDepthManager.getInstance().getSessionDepth(2))}});
            SessionDepthManager.getInstance().increaseSessionDepth(2);
            ISListenerWrapper.getInstance().onInterstitialAdClosed();
            setState(MEDIATION_STATE.STATE_READY_TO_LOAD);
        }
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdShowSucceeded(ProgIsSmash progIsSmash) {
        logSmashCallback(progIsSmash, "onInterstitialAdShowSucceeded");
        ISListenerWrapper.getInstance().onInterstitialAdShowSucceeded();
        sendProviderEventWithPlacement(IronSourceConstants.IS_INSTANCE_SHOW_SUCCESS, progIsSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdShowFailed(IronSourceError ironSourceError, ProgIsSmash progIsSmash) {
        synchronized (this) {
            logSmashCallback(progIsSmash, "onInterstitialAdShowFailed error=" + ironSourceError.getErrorMessage());
            ISListenerWrapper.getInstance().onInterstitialAdShowFailed(ironSourceError);
            sendProviderEventWithPlacement(IronSourceConstants.IS_INSTANCE_SHOW_FAILED, progIsSmash, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(ironSourceError.getErrorCode())}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, ironSourceError.getErrorMessage()}});
            this.mWaterfallPerformance.put(progIsSmash.getInstanceName(), AuctionHistory.ISAuctionPerformance.ISAuctionPerformanceFailedToShow);
            setState(MEDIATION_STATE.STATE_READY_TO_LOAD);
        }
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdClicked(ProgIsSmash progIsSmash) {
        logSmashCallback(progIsSmash, Constants.JSMethods.ON_INTERSTITIAL_AD_CLICKED);
        ISListenerWrapper.getInstance().onInterstitialAdClicked();
        sendProviderEventWithPlacement(IronSourceConstants.IS_INSTANCE_CLICKED, progIsSmash);
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialAdVisible(ProgIsSmash progIsSmash) {
        logSmashCallback(progIsSmash, "onInterstitialAdVisible");
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialInitFailed(IronSourceError ironSourceError, ProgIsSmash progIsSmash) {
        sendProviderEvent(IronSourceConstants.IS_INSTANCE_INIT_FAILED, progIsSmash, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, ironSourceError.getErrorMessage()}});
    }

    @Override // com.ironsource.mediationsdk.ProgIsManagerListener
    public void onInterstitialInitSuccess(ProgIsSmash progIsSmash) {
        sendProviderEvent(IronSourceConstants.IS_INSTANCE_INIT_SUCCESS, progIsSmash);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setState(MEDIATION_STATE mediation_state) {
        this.mState = mediation_state;
        logInternal("state=" + mediation_state);
    }

    private void logSmashCallback(ProgIsSmash progIsSmash, String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "ProgIsManager " + progIsSmash.getInstanceName() + " : " + str, 0);
    }

    private void logAPIError(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.API, str, 3);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void logInternal(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "ProgIsManager " + str, 0);
    }

    private void sendMediationEvent(int i) {
        sendMediationEvent(i, (Object[][]) null, false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendMediationEvent(int i, Object[][] objArr) {
        sendMediationEvent(i, objArr, false);
    }

    private void sendMediationEventWithPlacement(int i, Object[][] objArr) {
        sendMediationEvent(i, objArr, true);
    }

    private void sendMediationEventWithPlacement(int i) {
        sendMediationEvent(i, (Object[][]) null, true);
    }

    private void sendMediationEvent(int i, Object[][] objArr, boolean z) {
        HashMap map = new HashMap();
        map.put("provider", "Mediation");
        map.put(IronSourceConstants.EVENTS_PROGRAMMATIC, 1);
        if (!TextUtils.isEmpty(this.mCurrentAuctionId)) {
            map.put("auctionId", this.mCurrentAuctionId);
        }
        if (z && !TextUtils.isEmpty(this.mCurrentPlacement)) {
            map.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, this.mCurrentPlacement);
        }
        if (shouldAddAuctionParams(i)) {
            InterstitialEventsManager.getInstance().setEventAuctionParams(map, this.mAuctionTrial, this.mAuctionFallback);
        }
        if (objArr != null) {
            try {
                for (Object[] objArr2 : objArr) {
                    map.put(objArr2[0].toString(), objArr2[1]);
                }
            } catch (Exception e) {
                logInternal("sendMediationEvent " + e.getMessage());
            }
        }
        InterstitialEventsManager.getInstance().log(new EventData(i, new JSONObject(map)));
    }

    private void sendProviderEvent(int i, ProgIsSmash progIsSmash) {
        sendProviderEvent(i, progIsSmash, (Object[][]) null, false);
    }

    private void sendProviderEvent(int i, ProgIsSmash progIsSmash, Object[][] objArr) {
        sendProviderEvent(i, progIsSmash, objArr, false);
    }

    private void sendProviderEventWithPlacement(int i, ProgIsSmash progIsSmash, Object[][] objArr) {
        sendProviderEvent(i, progIsSmash, objArr, true);
    }

    private void sendProviderEventWithPlacement(int i, ProgIsSmash progIsSmash) {
        sendProviderEvent(i, progIsSmash, (Object[][]) null, true);
    }

    private void sendProviderEvent(int i, ProgIsSmash progIsSmash, Object[][] objArr, boolean z) {
        Map<String, Object> providerEventData = progIsSmash.getProviderEventData();
        if (!TextUtils.isEmpty(this.mCurrentAuctionId)) {
            providerEventData.put("auctionId", this.mCurrentAuctionId);
        }
        if (z && !TextUtils.isEmpty(this.mCurrentPlacement)) {
            providerEventData.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, this.mCurrentPlacement);
        }
        if (shouldAddAuctionParams(i)) {
            InterstitialEventsManager.getInstance().setEventAuctionParams(providerEventData, this.mAuctionTrial, this.mAuctionFallback);
        }
        if (objArr != null) {
            try {
                for (Object[] objArr2 : objArr) {
                    providerEventData.put(objArr2[0].toString(), objArr2[1]);
                }
            } catch (Exception e) {
                IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "IS sendProviderEvent " + Log.getStackTraceString(e), 3);
            }
        }
        InterstitialEventsManager.getInstance().log(new EventData(i, new JSONObject(providerEventData)));
    }

    void shouldTrackNetworkState(Context context, boolean z) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "Should Track Network State: " + z, 0);
        this.mShouldTrackNetworkState = z;
    }
}
