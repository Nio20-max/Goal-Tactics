package com.ironsource.mediationsdk;

import android.content.Context;
import android.content.IntentFilter;
import android.os.AsyncTask;
import android.text.TextUtils;
import android.util.Log;
import com.ironsource.environment.NetworkStateReceiver;
import com.ironsource.eventsmodule.EventData;
import com.ironsource.mediationsdk.AuctionHistory;
import com.ironsource.mediationsdk.events.RewardedVideoEventsManager;
import com.ironsource.mediationsdk.impressionData.ImpressionDataListener;
import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.model.Placement;
import com.ironsource.mediationsdk.model.ProviderSettings;
import com.ironsource.mediationsdk.model.RewardedVideoConfigurations;
import com.ironsource.mediationsdk.utils.AuctionSettings;
import com.ironsource.mediationsdk.utils.CappingManager;
import com.ironsource.mediationsdk.utils.ContextProvider;
import com.ironsource.mediationsdk.utils.ErrorBuilder;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import com.ironsource.mediationsdk.utils.SessionCappingManager;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
class ProgRvManager extends BaseProgManager implements ProgRvManagerListener, RvLoadTriggerCallback, AuctionEventListener, IProgRvManager, NetworkStateReceiver.NetworkStateReceiverListener {
    private boolean mAdvancedLoading;
    private String mAuctionFallback;
    private AuctionHandler mAuctionHandler;
    private AuctionHistory mAuctionHistory;
    private long mAuctionStartTime;
    private int mAuctionTrial;
    private String mCurrentAuctionId;
    private String mCurrentPlacement;
    private AuctionResponseItem mGenericNotifications;
    private boolean mIsAuctionEnabled;
    private boolean mIsAuctionOnShowStart;
    private boolean mIsShowingVideo;
    private long mLastChangedAvailabilityTime;
    private Boolean mLastReportedAvailabilityState;
    private int mMaxSmashesToLoad;
    private NetworkStateReceiver mNetworkStateReceiver;
    private List<AuctionResponseItem> mNextWaterfallToLoad;
    private RvLoadTrigger mRvLoadTrigger;
    private SessionCappingManager mSessionCappingManager;
    private int mSessionDepth;
    private boolean mShouldLoadAfterClose;
    private boolean mShouldTrackNetworkState;
    private final ConcurrentHashMap<String, ProgRvSmash> mSmashes;
    private RV_MEDIATION_STATE mState;
    private long mTimeToWaitBeforeLoadMS;
    private CopyOnWriteArrayList<ProgRvSmash> mWaterfall;
    private ConcurrentHashMap<String, AuctionHistory.ISAuctionPerformance> mWaterfallPerformance;
    private ConcurrentHashMap<String, AuctionResponseItem> mWaterfallServerData;

    private enum RV_MEDIATION_STATE {
        RV_STATE_INITIATING,
        RV_STATE_AUCTION_IN_PROGRESS,
        RV_STATE_NOT_LOADED,
        RV_STATE_LOADING_SMASHES,
        RV_STATE_READY_TO_SHOW
    }

    private boolean shouldAddAuctionParams(int i) {
        return i == 1003 || i == 1302 || i == 1301;
    }

    public ProgRvManager(List<ProviderSettings> list, RewardedVideoConfigurations rewardedVideoConfigurations, String str, String str2, ImpressionDataListener impressionDataListener) {
        super(impressionDataListener);
        this.mSessionDepth = 1;
        this.mAuctionFallback = "";
        this.mShouldTrackNetworkState = false;
        long time = new Date().getTime();
        sendMediationEventWithoutAuctionId(IronSourceConstants.RV_MANAGER_INIT_STARTED);
        setState(RV_MEDIATION_STATE.RV_STATE_INITIATING);
        this.mLastReportedAvailabilityState = null;
        this.mMaxSmashesToLoad = rewardedVideoConfigurations.getRewardedVideoAdaptersSmartLoadAmount();
        this.mAdvancedLoading = rewardedVideoConfigurations.getRewardedVideoAdvancedLoading();
        this.mCurrentPlacement = "";
        AuctionSettings rewardedVideoAuctionSettings = rewardedVideoConfigurations.getRewardedVideoAuctionSettings();
        this.mIsShowingVideo = false;
        this.mWaterfall = new CopyOnWriteArrayList<>();
        this.mNextWaterfallToLoad = new ArrayList();
        this.mWaterfallServerData = new ConcurrentHashMap<>();
        this.mWaterfallPerformance = new ConcurrentHashMap<>();
        this.mLastChangedAvailabilityTime = new Date().getTime();
        this.mIsAuctionEnabled = rewardedVideoAuctionSettings.getNumOfMaxTrials() > 0;
        this.mIsAuctionOnShowStart = rewardedVideoAuctionSettings.getIsAuctionOnShowStart();
        this.mShouldLoadAfterClose = !rewardedVideoAuctionSettings.getIsLoadWhileShow();
        this.mTimeToWaitBeforeLoadMS = rewardedVideoAuctionSettings.getTimeToWaitBeforeLoadMs();
        if (this.mIsAuctionEnabled) {
            this.mAuctionHandler = new AuctionHandler("rewardedVideo", rewardedVideoAuctionSettings, this);
        }
        this.mRvLoadTrigger = new RvLoadTrigger(rewardedVideoAuctionSettings, this);
        this.mSmashes = new ConcurrentHashMap<>();
        ArrayList arrayList = new ArrayList();
        for (ProviderSettings providerSettings : list) {
            AbstractAdapter adapter = AdapterRepository.getInstance().getAdapter(providerSettings, providerSettings.getRewardedVideoSettings());
            if (adapter != null && AdaptersCompatibilityHandler.getInstance().isAdapterVersionRVCompatible(adapter)) {
                ProgRvSmash progRvSmash = new ProgRvSmash(str, str2, providerSettings, this, rewardedVideoConfigurations.getRewardedVideoAdaptersSmartLoadTimeout(), adapter);
                String instanceName = progRvSmash.getInstanceName();
                this.mSmashes.put(instanceName, progRvSmash);
                arrayList.add(instanceName);
            }
        }
        this.mAuctionHistory = new AuctionHistory(arrayList, rewardedVideoAuctionSettings.getAuctionSavedHistoryLimit());
        this.mSessionCappingManager = new SessionCappingManager(new ArrayList(this.mSmashes.values()));
        for (ProgRvSmash progRvSmash2 : this.mSmashes.values()) {
            if (progRvSmash2.isBidder()) {
                progRvSmash2.initForBidding();
            }
        }
        sendMediationEventWithoutAuctionId(IronSourceConstants.RV_MANAGER_INIT_ENDED, new Object[][]{new Object[]{"duration", Long.valueOf(new Date().getTime() - time)}});
        loadRewardedVideo(rewardedVideoAuctionSettings.getTimeToWaitBeforeFirstAuctionMs());
    }

    private void loadRewardedVideo(long j) {
        if (this.mSessionCappingManager.areAllSmashesCapped()) {
            sendMediationEvent(IronSourceConstants.TROUBLESHOOTING_RV_LOAD_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 80001}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "all smashes are capped"}});
            handleLoadFailure();
            return;
        }
        if (this.mIsAuctionEnabled) {
            if (!this.mWaterfallPerformance.isEmpty()) {
                this.mAuctionHistory.storeWaterfallPerformance(this.mWaterfallPerformance);
                this.mWaterfallPerformance.clear();
            }
            new Timer().schedule(new TimerTask() { // from class: com.ironsource.mediationsdk.ProgRvManager.1
                @Override // java.util.TimerTask, java.lang.Runnable
                public void run() {
                    ProgRvManager.this.makeAuction();
                }
            }, j);
            return;
        }
        updateWaterfallToNonBidding();
        if (this.mNextWaterfallToLoad.isEmpty()) {
            sendMediationEvent(IronSourceConstants.TROUBLESHOOTING_RV_LOAD_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 80002}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "waterfall is empty"}});
            handleLoadFailure();
            return;
        }
        sendMediationEventWithoutAuctionId(1000);
        if (this.mShouldLoadAfterClose && this.mIsShowingVideo) {
            return;
        }
        loadSmashesForNextWaterfall();
    }

    @Override // com.ironsource.mediationsdk.IProgRvManager
    public synchronized void showRewardedVideo(Placement placement) {
        if (placement == null) {
            logAPIError("showRewardedVideo error: empty default placement");
            RVListenerWrapper.getInstance().onRewardedVideoAdShowFailed(new IronSourceError(1021, "showRewardedVideo error: empty default placement"));
            sendMediationEvent(IronSourceConstants.RV_CALLBACK_SHOW_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1021}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "showRewardedVideo error: empty default placement"}}, false, true);
            return;
        }
        this.mCurrentPlacement = placement.getPlacementName();
        logApi("showRewardedVideo(" + placement + ")");
        sendMediationEventWithPlacement(IronSourceConstants.RV_API_SHOW_CALLED);
        if (this.mIsShowingVideo) {
            logAPIError("showRewardedVideo error: can't show ad while an ad is already showing");
            RVListenerWrapper.getInstance().onRewardedVideoAdShowFailed(new IronSourceError(IronSourceError.ERROR_RV_SHOW_CALLED_DURING_SHOW, "showRewardedVideo error: can't show ad while an ad is already showing"));
            sendMediationEventWithPlacement(IronSourceConstants.RV_CALLBACK_SHOW_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(IronSourceError.ERROR_RV_SHOW_CALLED_DURING_SHOW)}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "showRewardedVideo error: can't show ad while an ad is already showing"}});
            return;
        }
        if (this.mState != RV_MEDIATION_STATE.RV_STATE_READY_TO_SHOW) {
            logAPIError("showRewardedVideo error: show called while no ads are available");
            RVListenerWrapper.getInstance().onRewardedVideoAdShowFailed(new IronSourceError(IronSourceError.ERROR_RV_SHOW_CALLED_WRONG_STATE, "showRewardedVideo error: show called while no ads are available"));
            sendMediationEventWithPlacement(IronSourceConstants.RV_CALLBACK_SHOW_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(IronSourceError.ERROR_RV_SHOW_CALLED_WRONG_STATE)}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "showRewardedVideo error: show called while no ads are available"}});
            return;
        }
        if (CappingManager.isRvPlacementCapped(ContextProvider.getInstance().getApplicationContext(), this.mCurrentPlacement)) {
            String str = "showRewardedVideo error: placement " + this.mCurrentPlacement + " is capped";
            logAPIError(str);
            RVListenerWrapper.getInstance().onRewardedVideoAdShowFailed(new IronSourceError(IronSourceError.ERROR_REACHED_CAP_LIMIT_PER_PLACEMENT, str));
            sendMediationEventWithPlacement(IronSourceConstants.RV_CALLBACK_SHOW_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(IronSourceError.ERROR_REACHED_CAP_LIMIT_PER_PLACEMENT)}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, str}});
            return;
        }
        for (ProgRvSmash progRvSmash : this.mWaterfall) {
            if (progRvSmash.isReadyToShow()) {
                this.mIsShowingVideo = true;
                progRvSmash.reportShowChance(true, this.mSessionDepth);
                showVideo(progRvSmash, placement);
                setState(RV_MEDIATION_STATE.RV_STATE_NOT_LOADED);
                return;
            }
            progRvSmash.reportShowChance(false, this.mSessionDepth);
        }
        logApi("showRewardedVideo(): No ads to show");
        RVListenerWrapper.getInstance().onRewardedVideoAdShowFailed(ErrorBuilder.buildNoAdsToShowError(IronSourceConstants.REWARDED_VIDEO_AD_UNIT));
        sendMediationEventWithPlacement(IronSourceConstants.RV_CALLBACK_SHOW_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 509}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "showRewardedVideo(): No ads to show"}});
        this.mRvLoadTrigger.showError();
    }

    private void showVideo(ProgRvSmash progRvSmash, Placement placement) {
        logInternal("showVideo()");
        this.mSessionCappingManager.increaseShowCounter(progRvSmash);
        if (this.mSessionCappingManager.isCapped(progRvSmash)) {
            progRvSmash.setCappedPerSession();
            IronSourceUtils.sendAutomationLog(progRvSmash.getInstanceName() + " rewarded video is now session capped");
        }
        CappingManager.incrementRvShowCounter(ContextProvider.getInstance().getApplicationContext(), placement.getPlacementName());
        if (CappingManager.isRvPlacementCapped(ContextProvider.getInstance().getApplicationContext(), placement.getPlacementName())) {
            sendMediationEventWithPlacement(IronSourceConstants.RV_CAP_PLACEMENT);
        }
        progRvSmash.showVideo(placement, this.mSessionDepth);
    }

    @Override // com.ironsource.mediationsdk.IProgRvManager
    public synchronized boolean isRewardedVideoAvailable() {
        if (this.mShouldTrackNetworkState && !IronSourceUtils.isNetworkConnected(ContextProvider.getInstance().getApplicationContext())) {
            return false;
        }
        if (this.mState == RV_MEDIATION_STATE.RV_STATE_READY_TO_SHOW && !this.mIsShowingVideo) {
            Iterator<ProgRvSmash> it = this.mWaterfall.iterator();
            while (it.hasNext()) {
                if (it.next().isReadyToShow()) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void makeAuction() {
        setState(RV_MEDIATION_STATE.RV_STATE_AUCTION_IN_PROGRESS);
        AsyncTask.execute(new Runnable() { // from class: com.ironsource.mediationsdk.ProgRvManager.2
            @Override // java.lang.Runnable
            public void run() {
                ProgRvManager.this.logInternal("makeAuction()");
                ProgRvManager.this.mCurrentAuctionId = "";
                ProgRvManager.this.mAuctionStartTime = new Date().getTime();
                HashMap map = new HashMap();
                ArrayList arrayList = new ArrayList();
                StringBuilder sb = new StringBuilder();
                for (ProgRvSmash progRvSmash : ProgRvManager.this.mSmashes.values()) {
                    progRvSmash.unloadVideo();
                    if (!ProgRvManager.this.mSessionCappingManager.isCapped(progRvSmash)) {
                        if (progRvSmash.isBidder()) {
                            Map<String, Object> biddingData = progRvSmash.getBiddingData();
                            if (biddingData != null) {
                                map.put(progRvSmash.getInstanceName(), biddingData);
                                sb.append(progRvSmash.getInstanceType() + progRvSmash.getInstanceName() + ",");
                            }
                        } else {
                            arrayList.add(progRvSmash.getInstanceName());
                            sb.append(progRvSmash.getInstanceType() + progRvSmash.getInstanceName() + ",");
                        }
                    }
                }
                if (map.keySet().size() == 0 && arrayList.size() == 0) {
                    ProgRvManager.this.sendMediationEvent(IronSourceConstants.RV_AUCTION_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1005}, new Object[]{"duration", 0}});
                    ProgRvManager.this.logInternal("makeAuction() failed - No candidates available for auctioning");
                    ProgRvManager.this.handleLoadFailure();
                    return;
                }
                ProgRvManager.this.logInternal("makeAuction() - request waterfall is: " + ((Object) sb));
                ProgRvManager.this.sendMediationEventWithoutAuctionId(1000);
                ProgRvManager.this.sendMediationEventWithoutAuctionId(IronSourceConstants.RV_AUCTION_REQUEST);
                ProgRvManager.this.sendMediationEventWithoutAuctionId(IronSourceConstants.RV_AUCTION_REQUEST_WATERFALL, new Object[][]{new Object[]{IronSourceConstants.EVENTS_EXT1, sb.toString()}});
                ProgRvManager.this.mAuctionHandler.executeAuction(ContextProvider.getInstance().getApplicationContext(), map, arrayList, ProgRvManager.this.mAuctionHistory, ProgRvManager.this.mSessionDepth);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadSmashesForNextWaterfall() {
        updateWaterfall(this.mNextWaterfallToLoad);
        loadSmashes();
    }

    private void updateWaterfallToNonBidding() {
        updateNextWaterfallToLoad(extractNonBidderProvidersFromWaterfall());
        this.mCurrentAuctionId = "fallback_" + System.currentTimeMillis();
    }

    private void updateNextWaterfallToLoad(List<AuctionResponseItem> list) {
        this.mNextWaterfallToLoad = list;
        StringBuilder sb = new StringBuilder();
        Iterator<AuctionResponseItem> it = list.iterator();
        while (it.hasNext()) {
            sb.append(getAsString(it.next()) + ",");
        }
        logInternal("updateNextWaterfallToLoad() - next waterfall is " + sb.toString());
        if (sb.length() == 0) {
            logInternal("Updated waterfall is empty");
        }
        sendMediationEvent(IronSourceConstants.RV_AUCTION_RESPONSE_WATERFALL, new Object[][]{new Object[]{IronSourceConstants.EVENTS_EXT1, sb.toString()}});
    }

    private List<AuctionResponseItem> extractNonBidderProvidersFromWaterfall() {
        CopyOnWriteArrayList copyOnWriteArrayList = new CopyOnWriteArrayList();
        for (ProgRvSmash progRvSmash : this.mSmashes.values()) {
            if (!progRvSmash.isBidder() && !this.mSessionCappingManager.isCapped(progRvSmash)) {
                copyOnWriteArrayList.add(new AuctionResponseItem(progRvSmash.getInstanceName()));
            }
        }
        return copyOnWriteArrayList;
    }

    private String getAsString(AuctionResponseItem auctionResponseItem) {
        String string;
        ProgRvSmash progRvSmash = this.mSmashes.get(auctionResponseItem.getInstanceName());
        if (progRvSmash != null) {
            string = Integer.toString(progRvSmash.getInstanceType());
        } else {
            string = TextUtils.isEmpty(auctionResponseItem.getServerData()) ? "1" : "2";
        }
        return string + auctionResponseItem.getInstanceName();
    }

    private void updateWaterfall(List<AuctionResponseItem> list) {
        this.mWaterfall.clear();
        this.mWaterfallServerData.clear();
        this.mWaterfallPerformance.clear();
        for (AuctionResponseItem auctionResponseItem : list) {
            ProgRvSmash progRvSmash = this.mSmashes.get(auctionResponseItem.getInstanceName());
            if (progRvSmash != null) {
                progRvSmash.setIsLoadCandidate(true);
                this.mWaterfall.add(progRvSmash);
                this.mWaterfallServerData.put(progRvSmash.getInstanceName(), auctionResponseItem);
                this.mWaterfallPerformance.put(auctionResponseItem.getInstanceName(), AuctionHistory.ISAuctionPerformance.ISAuctionPerformanceDidntAttemptToLoad);
            } else {
                logInternal("updateWaterfall() - could not find matching smash for auction response item " + auctionResponseItem.getInstanceName());
            }
        }
        this.mNextWaterfallToLoad.clear();
    }

    private void loadSmash(ProgRvSmash progRvSmash) {
        String serverData = this.mWaterfallServerData.get(progRvSmash.getInstanceName()).getServerData();
        progRvSmash.loadVideo(serverData, this.mCurrentAuctionId, this.mAuctionTrial, this.mAuctionFallback, this.mSessionDepth, AuctionDataUtils.getInstance().getDynamicDemandSourceIdFromServerData(serverData));
    }

    private void loadSmashes() {
        if (this.mWaterfall.isEmpty()) {
            sendMediationEvent(IronSourceConstants.TROUBLESHOOTING_RV_LOAD_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 80004}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "waterfall is empty"}});
            handleLoadFailure();
            return;
        }
        setState(RV_MEDIATION_STATE.RV_STATE_LOADING_SMASHES);
        int i = 0;
        for (int i2 = 0; i2 < this.mWaterfall.size() && i < this.mMaxSmashesToLoad; i2++) {
            ProgRvSmash progRvSmash = this.mWaterfall.get(i2);
            if (progRvSmash.getIsLoadCandidate()) {
                if (this.mAdvancedLoading && progRvSmash.isBidder()) {
                    if (i == 0) {
                        loadSmash(progRvSmash);
                        return;
                    }
                    logInternal("Advanced Loading: Won't start loading bidder " + progRvSmash.getInstanceName() + " as a non bidder is being loaded");
                    return;
                }
                loadSmash(progRvSmash);
                i++;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleLoadFailure() {
        setState(RV_MEDIATION_STATE.RV_STATE_NOT_LOADED);
        reportAvailabilityIfNeeded(false);
        this.mRvLoadTrigger.loadError();
    }

    private void setState(RV_MEDIATION_STATE rv_mediation_state) {
        logInternal("current state=" + this.mState + ", new state=" + rv_mediation_state);
        this.mState = rv_mediation_state;
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public synchronized void onLoadSuccess(ProgRvSmash progRvSmash, String str) {
        logSmashCallback(progRvSmash, "onLoadSuccess ");
        String str2 = this.mCurrentAuctionId;
        if (str2 != null && !str.equalsIgnoreCase(str2)) {
            logInternal("onLoadSuccess was invoked with auctionId: " + str + " and the current id is " + this.mCurrentAuctionId);
            Object[] objArr = {IronSourceConstants.EVENTS_ERROR_CODE, 2};
            StringBuilder sb = new StringBuilder();
            sb.append("onLoadSuccess wrong auction ID ");
            sb.append(this.mState);
            progRvSmash.sendProviderEvent(IronSourceConstants.RV_MANAGER_UNEXPECTED_STATE, new Object[][]{objArr, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, sb.toString()}});
            return;
        }
        RV_MEDIATION_STATE rv_mediation_state = this.mState;
        this.mWaterfallPerformance.put(progRvSmash.getInstanceName(), AuctionHistory.ISAuctionPerformance.ISAuctionPerformanceLoadedSuccessfully);
        reportAvailabilityIfNeeded(true);
        if (this.mState == RV_MEDIATION_STATE.RV_STATE_LOADING_SMASHES) {
            setState(RV_MEDIATION_STATE.RV_STATE_READY_TO_SHOW);
            sendMediationEvent(1003, new Object[][]{new Object[]{"duration", Long.valueOf(new Date().getTime() - this.mAuctionStartTime)}});
            if (this.mIsAuctionEnabled) {
                AuctionResponseItem auctionResponseItem = this.mWaterfallServerData.get(progRvSmash.getInstanceName());
                if (auctionResponseItem != null) {
                    this.mAuctionHandler.reportLoadSuccess(auctionResponseItem, progRvSmash.getInstanceType(), this.mGenericNotifications);
                    this.mAuctionHandler.reportAuctionLose(this.mWaterfall, this.mWaterfallServerData, progRvSmash.getInstanceType(), this.mGenericNotifications, auctionResponseItem);
                } else {
                    String instanceName = progRvSmash != null ? progRvSmash.getInstanceName() : "Smash is null";
                    logErrorInternal("onLoadSuccess winner instance " + instanceName + " missing from waterfall. auctionId: " + str + " and the current id is " + this.mCurrentAuctionId);
                    Object[] objArr2 = {IronSourceConstants.EVENTS_ERROR_CODE, 1010};
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Loaded missing ");
                    sb2.append(rv_mediation_state);
                    sendMediationEvent(IronSourceConstants.TROUBLESHOOTING_RV_NOTIFICATIONS_ERROR, new Object[][]{objArr2, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, sb2.toString()}, new Object[]{IronSourceConstants.EVENTS_EXT1, instanceName}});
                }
            }
        }
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onLoadError(ProgRvSmash progRvSmash, String str) {
        CopyOnWriteArrayList copyOnWriteArrayList = new CopyOnWriteArrayList();
        synchronized (this) {
            logSmashCallback(progRvSmash, "onLoadError ");
            if (!str.equalsIgnoreCase(this.mCurrentAuctionId)) {
                logInternal("onLoadError was invoked with auctionId:" + str + " and the current id is " + this.mCurrentAuctionId);
                Object[] objArr = {IronSourceConstants.EVENTS_ERROR_CODE, 4};
                StringBuilder sb = new StringBuilder();
                sb.append("loadError wrong auction ID ");
                sb.append(this.mState);
                progRvSmash.sendProviderEvent(IronSourceConstants.RV_MANAGER_UNEXPECTED_STATE, new Object[][]{objArr, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, sb.toString()}});
                return;
            }
            this.mWaterfallPerformance.put(progRvSmash.getInstanceName(), AuctionHistory.ISAuctionPerformance.ISAuctionPerformanceFailedToLoad);
            boolean z = false;
            boolean z2 = false;
            for (ProgRvSmash progRvSmash2 : this.mWaterfall) {
                if (progRvSmash2.getIsLoadCandidate()) {
                    if (this.mAdvancedLoading && progRvSmash2.isBidder() && (z || z2)) {
                        logInternal("Advanced Loading: Won't start loading bidder " + progRvSmash2.getInstanceName() + " as " + (z ? "a non bidder is being loaded" : "a non bidder was already loaded successfully"));
                    } else if (this.mWaterfallServerData.get(progRvSmash2.getInstanceName()) != null) {
                        copyOnWriteArrayList.add(progRvSmash2);
                        if (!this.mAdvancedLoading || !progRvSmash.isBidder() || progRvSmash2.isBidder() || copyOnWriteArrayList.size() >= this.mMaxSmashesToLoad) {
                            break;
                        }
                        z = true;
                    } else {
                        continue;
                    }
                } else if (progRvSmash2.isLoadingInProgress()) {
                    z = true;
                } else if (progRvSmash2.isReadyToShow()) {
                    z2 = true;
                }
            }
            if (copyOnWriteArrayList.size() == 0 && !z2 && !z) {
                logInternal("onLoadError(): No other available smashes");
                reportAvailabilityIfNeeded(false);
                setState(RV_MEDIATION_STATE.RV_STATE_NOT_LOADED);
                this.mRvLoadTrigger.loadError();
            }
            Iterator it = copyOnWriteArrayList.iterator();
            while (it.hasNext()) {
                loadSmash((ProgRvSmash) it.next());
            }
        }
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onRewardedVideoAdOpened(ProgRvSmash progRvSmash) {
        synchronized (this) {
            this.mSessionDepth++;
            logSmashCallback(progRvSmash, "onRewardedVideoAdOpened");
            RVListenerWrapper.getInstance().onRewardedVideoAdOpened();
            if (this.mIsAuctionEnabled) {
                AuctionResponseItem auctionResponseItem = this.mWaterfallServerData.get(progRvSmash.getInstanceName());
                if (auctionResponseItem != null) {
                    this.mAuctionHandler.reportImpression(auctionResponseItem, progRvSmash.getInstanceType(), this.mGenericNotifications, this.mCurrentPlacement);
                    this.mWaterfallPerformance.put(progRvSmash.getInstanceName(), AuctionHistory.ISAuctionPerformance.ISAuctionPerformanceShowedSuccessfully);
                    reportImpressionDataToPublisher(auctionResponseItem, this.mCurrentPlacement);
                } else {
                    String instanceName = progRvSmash != null ? progRvSmash.getInstanceName() : "Smash is null";
                    logErrorInternal("onRewardedVideoAdOpened showing instance " + instanceName + " missing from waterfall");
                    sendMediationEvent(IronSourceConstants.TROUBLESHOOTING_RV_NOTIFICATIONS_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1011}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "Showing missing " + this.mState}, new Object[]{IronSourceConstants.EVENTS_EXT1, instanceName}});
                }
            }
            this.mRvLoadTrigger.showStart();
        }
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onRewardedVideoAdShowFailed(IronSourceError ironSourceError, ProgRvSmash progRvSmash) {
        synchronized (this) {
            logSmashCallback(progRvSmash, "onRewardedVideoAdShowFailed error=" + ironSourceError.getErrorMessage());
            sendMediationEventWithPlacement(IronSourceConstants.RV_CALLBACK_SHOW_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(ironSourceError.getErrorCode())}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, ironSourceError.getErrorMessage()}});
            RVListenerWrapper.getInstance().onRewardedVideoAdShowFailed(ironSourceError);
            this.mIsShowingVideo = false;
            this.mWaterfallPerformance.put(progRvSmash.getInstanceName(), AuctionHistory.ISAuctionPerformance.ISAuctionPerformanceFailedToShow);
            if (this.mState != RV_MEDIATION_STATE.RV_STATE_READY_TO_SHOW) {
                reportAvailabilityIfNeeded(false);
            }
            this.mRvLoadTrigger.showError();
        }
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onRewardedVideoAdClosed(ProgRvSmash progRvSmash) {
        synchronized (this) {
            progRvSmash.sendProviderEventWithPlacement(IronSourceConstants.RV_INSTANCE_CLOSED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_EXT1, "otherRVAvailable = false"}});
            logSmashCallback(progRvSmash, "onRewardedVideoAdClosed, mediation state: " + this.mState.name());
            RVListenerWrapper.getInstance().onRewardedVideoAdClosed();
            this.mIsShowingVideo = false;
            if (this.mState != RV_MEDIATION_STATE.RV_STATE_READY_TO_SHOW) {
                reportAvailabilityIfNeeded(false);
            }
            if (this.mIsAuctionOnShowStart) {
                List<AuctionResponseItem> list = this.mNextWaterfallToLoad;
                if (list != null && list.size() > 0) {
                    new Timer().schedule(new TimerTask() { // from class: com.ironsource.mediationsdk.ProgRvManager.3
                        @Override // java.util.TimerTask, java.lang.Runnable
                        public void run() {
                            ProgRvManager.this.loadSmashesForNextWaterfall();
                        }
                    }, this.mTimeToWaitBeforeLoadMS);
                }
            } else {
                this.mRvLoadTrigger.showEnd();
            }
        }
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onRewardedVideoAdStarted(ProgRvSmash progRvSmash) {
        logSmashCallback(progRvSmash, "onRewardedVideoAdStarted");
        RVListenerWrapper.getInstance().onRewardedVideoAdStarted();
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onRewardedVideoAdEnded(ProgRvSmash progRvSmash) {
        logSmashCallback(progRvSmash, "onRewardedVideoAdEnded");
        RVListenerWrapper.getInstance().onRewardedVideoAdEnded();
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onRewardedVideoAdRewarded(ProgRvSmash progRvSmash, Placement placement) {
        logSmashCallback(progRvSmash, "onRewardedVideoAdRewarded");
        RVListenerWrapper.getInstance().onRewardedVideoAdRewarded(placement);
    }

    @Override // com.ironsource.mediationsdk.ProgRvManagerListener
    public void onRewardedVideoAdClicked(ProgRvSmash progRvSmash, Placement placement) {
        logSmashCallback(progRvSmash, "onRewardedVideoAdClicked");
        RVListenerWrapper.getInstance().onRewardedVideoAdClicked(placement);
    }

    private void reportAvailabilityIfNeeded(boolean z) {
        Boolean bool = this.mLastReportedAvailabilityState;
        if (bool == null || bool.booleanValue() != z) {
            this.mLastReportedAvailabilityState = Boolean.valueOf(z);
            long time = new Date().getTime() - this.mLastChangedAvailabilityTime;
            this.mLastChangedAvailabilityTime = new Date().getTime();
            if (z) {
                sendMediationEvent(IronSourceConstants.RV_CALLBACK_AVAILABILITY_TRUE, new Object[][]{new Object[]{"duration", Long.valueOf(time)}});
            } else {
                sendMediationEvent(IronSourceConstants.RV_CALLBACK_AVAILABILITY_FALSE, new Object[][]{new Object[]{"duration", Long.valueOf(time)}});
            }
            RVListenerWrapper.getInstance().onRewardedVideoAvailabilityChanged(z);
        }
    }

    private void logSmashCallback(ProgRvSmash progRvSmash, String str) {
        String str2 = progRvSmash.getInstanceName() + " : " + str;
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, "ProgRvManager: " + str2, 0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void logInternal(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "ProgRvManager: " + str, 0);
    }

    private void logErrorInternal(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "ProgRvManager: " + str, 3);
    }

    private void logAPIError(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.API, str, 3);
    }

    private void logApi(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.API, str, 1);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendMediationEventWithoutAuctionId(int i, Object[][] objArr) {
        sendMediationEvent(i, objArr, false, false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendMediationEventWithoutAuctionId(int i) {
        sendMediationEvent(i, (Object[][]) null, false, false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendMediationEvent(int i, Object[][] objArr) {
        sendMediationEvent(i, objArr, false, true);
    }

    private void sendMediationEventWithPlacement(int i) {
        sendMediationEvent(i, (Object[][]) null, true, true);
    }

    private void sendMediationEventWithPlacement(int i, Object[][] objArr) {
        sendMediationEvent(i, objArr, true, true);
    }

    private void sendMediationEvent(int i, Object[][] objArr, boolean z, boolean z2) {
        HashMap map = new HashMap();
        map.put("provider", "Mediation");
        map.put(IronSourceConstants.EVENTS_PROGRAMMATIC, 1);
        if (z2 && !TextUtils.isEmpty(this.mCurrentAuctionId)) {
            map.put("auctionId", this.mCurrentAuctionId);
        }
        if (z && !TextUtils.isEmpty(this.mCurrentPlacement)) {
            map.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, this.mCurrentPlacement);
        }
        if (shouldAddAuctionParams(i)) {
            RewardedVideoEventsManager.getInstance().setEventAuctionParams(map, this.mAuctionTrial, this.mAuctionFallback);
        }
        map.put("sessionDepth", Integer.valueOf(this.mSessionDepth));
        if (objArr != null) {
            try {
                for (Object[] objArr2 : objArr) {
                    map.put(objArr2[0].toString(), objArr2[1]);
                }
            } catch (Exception e) {
                IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "ProgRvManager: RV sendMediationEvent " + Log.getStackTraceString(e), 3);
            }
        }
        RewardedVideoEventsManager.getInstance().log(new EventData(i, new JSONObject(map)));
    }

    @Override // com.ironsource.mediationsdk.RvLoadTriggerCallback
    public synchronized void onLoadTriggered() {
        logInternal("onLoadTriggered: RV load was triggered in " + this.mState + " state");
        loadRewardedVideo(0L);
    }

    @Override // com.ironsource.mediationsdk.AuctionEventListener
    public void onAuctionSuccess(List<AuctionResponseItem> list, String str, AuctionResponseItem auctionResponseItem, int i, long j) {
        logInternal("makeAuction(): success");
        this.mCurrentAuctionId = str;
        this.mGenericNotifications = auctionResponseItem;
        this.mAuctionTrial = i;
        this.mAuctionFallback = "";
        sendMediationEvent(IronSourceConstants.RV_AUCTION_SUCCESS, new Object[][]{new Object[]{"duration", Long.valueOf(j)}});
        updateNextWaterfallToLoad(list);
        if (this.mShouldLoadAfterClose && this.mIsShowingVideo) {
            return;
        }
        loadSmashesForNextWaterfall();
    }

    @Override // com.ironsource.mediationsdk.AuctionEventListener
    public void onAuctionFailed(int i, String str, int i2, String str2, long j) {
        logInternal("Auction failed | moving to fallback waterfall");
        this.mAuctionTrial = i2;
        this.mAuctionFallback = str2;
        if (TextUtils.isEmpty(str)) {
            sendMediationEventWithoutAuctionId(IronSourceConstants.RV_AUCTION_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(i)}, new Object[]{"duration", Long.valueOf(j)}});
        } else {
            sendMediationEventWithoutAuctionId(IronSourceConstants.RV_AUCTION_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(i)}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, str}, new Object[]{"duration", Long.valueOf(j)}});
        }
        updateWaterfallToNonBidding();
        if (this.mShouldLoadAfterClose && this.mIsShowingVideo) {
            return;
        }
        loadSmashesForNextWaterfall();
    }

    @Override // com.ironsource.environment.NetworkStateReceiver.NetworkStateReceiverListener
    public void onNetworkAvailabilityChanged(boolean z) {
        if (this.mShouldTrackNetworkState) {
            IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "Network Availability Changed To: " + z, 1);
            if (shouldNotifyNetworkAvailabilityChanged(z)) {
                reportAvailabilityIfNeeded(z);
            }
        }
    }

    @Override // com.ironsource.mediationsdk.IProgRvManager
    public void shouldTrackNetworkState(Context context, boolean z) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "ProgRvManager Should Track Network State: " + z, 0);
        this.mShouldTrackNetworkState = z;
        if (z) {
            if (this.mNetworkStateReceiver == null) {
                this.mNetworkStateReceiver = new NetworkStateReceiver(context, this);
            }
            context.getApplicationContext().registerReceiver(this.mNetworkStateReceiver, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
        } else if (this.mNetworkStateReceiver != null) {
            context.getApplicationContext().unregisterReceiver(this.mNetworkStateReceiver);
        }
    }

    private boolean shouldNotifyNetworkAvailabilityChanged(boolean z) {
        Boolean bool = this.mLastReportedAvailabilityState;
        if (bool == null) {
            return false;
        }
        return (z && !bool.booleanValue() && isRewardedVideoAvailable()) || (!z && this.mLastReportedAvailabilityState.booleanValue());
    }
}
