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
class LWSProgRvManager extends BaseProgManager implements LWSRvManagerListener, RvLoadTriggerCallback, AuctionEventListener, IProgRvManager, NetworkStateReceiver.NetworkStateReceiverListener {
    private boolean mAdvancedLoading;
    private String mAuctionFailedReason;
    private AuctionHandler mAuctionHandler;
    private AuctionHistory mAuctionHistory;
    private long mAuctionStartTime;
    private int mAuctionTrial;
    private String mCurrentPlacement;
    private AuctionResponseItem mGenericNotifications;
    private boolean mIsAuctionEnabled;
    private boolean mIsShowingVideo;
    private long mLastChangedAvailabilityTime;
    private Boolean mLastReportedAvailabilityState;
    private int mMaxSmashesToLoad;
    private NetworkStateReceiver mNetworkStateReceiver;
    private RvLoadTrigger mRvLoadTrigger;
    private SessionCappingManager mSessionCappingManager;
    private int mSessionDepth;
    private boolean mShouldTrackNetworkState;
    private RV_MEDIATION_STATE mState;
    private ConcurrentHashMap<String, AuctionHistory.ISAuctionPerformance> mWaterfallPerformance;
    private ConcurrentHashMap<String, AuctionResponseItem> mWaterfallServerData;
    private final ConcurrentHashMap<String, LWSProgRvSmash> smashes;
    private final Object stateLock;
    private WaterfallLifeCycleHolder waterfallLifeCycleHolder;

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

    public LWSProgRvManager(List<ProviderSettings> list, RewardedVideoConfigurations rewardedVideoConfigurations, String str, String str2, ImpressionDataListener impressionDataListener) {
        super(impressionDataListener);
        this.mAuctionFailedReason = "";
        this.mShouldTrackNetworkState = false;
        this.mSessionDepth = 1;
        this.stateLock = new Object();
        long time = new Date().getTime();
        sendMediationEventWithoutAuctionId(IronSourceConstants.RV_MANAGER_INIT_STARTED);
        setState(RV_MEDIATION_STATE.RV_STATE_INITIATING);
        this.mLastReportedAvailabilityState = null;
        this.mMaxSmashesToLoad = rewardedVideoConfigurations.getRewardedVideoAdaptersSmartLoadAmount();
        this.mAdvancedLoading = rewardedVideoConfigurations.getRewardedVideoAdvancedLoading();
        this.mCurrentPlacement = "";
        AuctionSettings rewardedVideoAuctionSettings = rewardedVideoConfigurations.getRewardedVideoAuctionSettings();
        this.mIsShowingVideo = false;
        this.waterfallLifeCycleHolder = new WaterfallLifeCycleHolder(rewardedVideoConfigurations.getRewardedVideoAuctionSettings().getLoadWhileShowSupportArray(), rewardedVideoConfigurations.getRewardedVideoAuctionSettings().getTimeToDeleteOldWaterfallAfterAuction());
        this.mWaterfallServerData = new ConcurrentHashMap<>();
        this.mWaterfallPerformance = new ConcurrentHashMap<>();
        this.mLastChangedAvailabilityTime = new Date().getTime();
        boolean z = rewardedVideoAuctionSettings.getNumOfMaxTrials() > 0;
        this.mIsAuctionEnabled = z;
        if (z) {
            this.mAuctionHandler = new AuctionHandler("rewardedVideo", rewardedVideoAuctionSettings, this);
        }
        this.mRvLoadTrigger = new RvLoadTrigger(rewardedVideoAuctionSettings, this);
        this.smashes = new ConcurrentHashMap<>();
        ArrayList arrayList = new ArrayList();
        for (ProviderSettings providerSettings : list) {
            AbstractAdapter adapter = AdapterRepository.getInstance().getAdapter(providerSettings, providerSettings.getRewardedVideoSettings());
            if (adapter != null) {
                LWSProgRvSmash lWSProgRvSmash = new LWSProgRvSmash(str, str2, providerSettings, this, rewardedVideoConfigurations.getRewardedVideoAdaptersSmartLoadTimeout(), adapter, this.mSessionDepth);
                String instanceName = lWSProgRvSmash.getInstanceName();
                this.smashes.put(instanceName, lWSProgRvSmash);
                arrayList.add(instanceName);
            }
        }
        this.mAuctionHistory = new AuctionHistory(arrayList, rewardedVideoAuctionSettings.getAuctionSavedHistoryLimit());
        this.mSessionCappingManager = new SessionCappingManager(new ArrayList(this.smashes.values()));
        sendMediationEventWithoutAuctionId(IronSourceConstants.RV_MANAGER_INIT_ENDED, new Object[][]{new Object[]{"duration", Long.valueOf(new Date().getTime() - time)}});
        loadRewardedVideo(rewardedVideoAuctionSettings.getTimeToWaitBeforeFirstAuctionMs());
    }

    @Override // com.ironsource.mediationsdk.IProgRvManager
    public void showRewardedVideo(Placement placement) {
        LWSProgRvSmash next;
        synchronized (this.stateLock) {
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
            Iterator<LWSProgRvSmash> it = this.waterfallLifeCycleHolder.getCurrentWaterfall().iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                if (next.isReadyToShow()) {
                    this.mIsShowingVideo = true;
                    next.reportShowChance(true);
                    setState(RV_MEDIATION_STATE.RV_STATE_NOT_LOADED);
                    break;
                }
                next.reportShowChance(false);
            }
            if (next != null) {
                if (next != null) {
                    showVideo(next, placement);
                }
            } else {
                logApi("showRewardedVideo(): No ads to show");
                RVListenerWrapper.getInstance().onRewardedVideoAdShowFailed(ErrorBuilder.buildNoAdsToShowError(IronSourceConstants.REWARDED_VIDEO_AD_UNIT));
                sendMediationEventWithPlacement(IronSourceConstants.RV_CALLBACK_SHOW_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 509}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "showRewardedVideo(): No ads to show"}});
                this.mRvLoadTrigger.showError();
            }
        }
    }

    @Override // com.ironsource.mediationsdk.IProgRvManager
    public boolean isRewardedVideoAvailable() {
        if ((!this.mShouldTrackNetworkState || IronSourceUtils.isNetworkConnected(ContextProvider.getInstance().getApplicationContext())) && this.mState == RV_MEDIATION_STATE.RV_STATE_READY_TO_SHOW && !this.mIsShowingVideo) {
            Iterator<LWSProgRvSmash> it = this.waterfallLifeCycleHolder.getCurrentWaterfall().iterator();
            while (it.hasNext()) {
                if (it.next().isReadyToShow()) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // com.ironsource.mediationsdk.LWSRvManagerListener
    public void onLoadSuccess(LWSProgRvSmash lWSProgRvSmash) {
        synchronized (this.stateLock) {
            logSmashCallback(lWSProgRvSmash, "onLoadSuccess mState=" + this.mState);
            if (lWSProgRvSmash.getAuctionId() == this.waterfallLifeCycleHolder.getCurrentWaterfallId() && this.mState != RV_MEDIATION_STATE.RV_STATE_AUCTION_IN_PROGRESS) {
                this.mWaterfallPerformance.put(lWSProgRvSmash.getInstanceName(), AuctionHistory.ISAuctionPerformance.ISAuctionPerformanceLoadedSuccessfully);
                if (this.mState == RV_MEDIATION_STATE.RV_STATE_LOADING_SMASHES) {
                    reportAvailabilityIfNeeded(true);
                    setState(RV_MEDIATION_STATE.RV_STATE_READY_TO_SHOW);
                    sendMediationEvent(1003, new Object[][]{new Object[]{"duration", Long.valueOf(new Date().getTime() - this.mAuctionStartTime)}});
                    if (this.mIsAuctionEnabled) {
                        AuctionResponseItem auctionResponseItem = this.mWaterfallServerData.get(lWSProgRvSmash.getInstanceName());
                        if (auctionResponseItem != null) {
                            this.mAuctionHandler.reportLoadSuccess(auctionResponseItem, lWSProgRvSmash.getInstanceType(), this.mGenericNotifications);
                            this.mAuctionHandler.reportAuctionLose(this.waterfallLifeCycleHolder.getCurrentWaterfall(), this.mWaterfallServerData, lWSProgRvSmash.getInstanceType(), this.mGenericNotifications, auctionResponseItem);
                        } else {
                            String instanceName = lWSProgRvSmash != null ? lWSProgRvSmash.getInstanceName() : "Smash is null";
                            logErrorInternal("onLoadSuccess winner instance " + instanceName + " missing from waterfall. auctionId: " + lWSProgRvSmash.getAuctionId() + " and the current id is " + this.waterfallLifeCycleHolder.getCurrentWaterfallId());
                            Object[] objArr = {IronSourceConstants.EVENTS_ERROR_CODE, 1010};
                            StringBuilder sb = new StringBuilder();
                            sb.append("Loaded missing ");
                            sb.append(RV_MEDIATION_STATE.RV_STATE_LOADING_SMASHES);
                            sendMediationEvent(IronSourceConstants.TROUBLESHOOTING_RV_NOTIFICATIONS_ERROR, new Object[][]{objArr, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, sb.toString()}, new Object[]{IronSourceConstants.EVENTS_EXT1, instanceName}});
                        }
                    }
                }
                return;
            }
            logInternal("onLoadSuccess was invoked with auctionId: " + lWSProgRvSmash.getAuctionId() + " and the current id is " + this.waterfallLifeCycleHolder.getCurrentWaterfallId());
            Object[] objArr2 = {IronSourceConstants.EVENTS_ERROR_CODE, 2};
            StringBuilder sb2 = new StringBuilder();
            sb2.append("onLoadSuccess wrong auction ID ");
            sb2.append(this.mState);
            lWSProgRvSmash.sendProviderEvent(IronSourceConstants.RV_MANAGER_UNEXPECTED_STATE, new Object[][]{objArr2, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, sb2.toString()}});
        }
    }

    @Override // com.ironsource.mediationsdk.LWSRvManagerListener
    public void onLoadError(LWSProgRvSmash lWSProgRvSmash) {
        CopyOnWriteArrayList copyOnWriteArrayList = new CopyOnWriteArrayList();
        synchronized (this.stateLock) {
            logSmashCallback(lWSProgRvSmash, "onLoadError mState=" + this.mState);
            if (lWSProgRvSmash.getAuctionId() == this.waterfallLifeCycleHolder.getCurrentWaterfallId() && this.mState != RV_MEDIATION_STATE.RV_STATE_AUCTION_IN_PROGRESS) {
                this.mWaterfallPerformance.put(lWSProgRvSmash.getInstanceName(), AuctionHistory.ISAuctionPerformance.ISAuctionPerformanceFailedToLoad);
                if (this.mState == RV_MEDIATION_STATE.RV_STATE_LOADING_SMASHES || this.mState == RV_MEDIATION_STATE.RV_STATE_READY_TO_SHOW) {
                    boolean z = false;
                    boolean z2 = false;
                    for (LWSProgRvSmash lWSProgRvSmash2 : this.waterfallLifeCycleHolder.getCurrentWaterfall()) {
                        if (lWSProgRvSmash2.getIsLoadCandidate()) {
                            if (this.mAdvancedLoading && lWSProgRvSmash2.isBidder() && (z || z2)) {
                                logInternal("Advanced Loading: Won't start loading bidder " + lWSProgRvSmash2.getInstanceName() + " as " + (z ? "a non bidder is being loaded" : "a non bidder was already loaded successfully"));
                            } else if (this.mWaterfallServerData.get(lWSProgRvSmash2.getInstanceName()) != null) {
                                copyOnWriteArrayList.add(lWSProgRvSmash2);
                                if (!this.mAdvancedLoading || !lWSProgRvSmash.isBidder() || lWSProgRvSmash2.isBidder() || copyOnWriteArrayList.size() >= this.mMaxSmashesToLoad) {
                                    break;
                                }
                                z = true;
                            } else {
                                continue;
                            }
                        } else if (lWSProgRvSmash2.isLoadingInProgress()) {
                            z = true;
                        } else if (lWSProgRvSmash2.isReadyToShow()) {
                            z2 = true;
                        }
                    }
                    if (copyOnWriteArrayList.size() == 0 && !z2 && !z) {
                        logInternal("onLoadError(): No other available smashes");
                        if (!this.mIsShowingVideo) {
                            reportAvailabilityIfNeeded(false);
                        }
                        setState(RV_MEDIATION_STATE.RV_STATE_NOT_LOADED);
                        this.mRvLoadTrigger.loadError();
                    }
                }
                Iterator it = copyOnWriteArrayList.iterator();
                while (it.hasNext()) {
                    loadSmash((LWSProgRvSmash) it.next());
                }
                return;
            }
            logInternal("onLoadError was invoked with auctionId:" + lWSProgRvSmash.getAuctionId() + " and the current id is " + this.waterfallLifeCycleHolder.getCurrentWaterfallId());
            Object[] objArr = {IronSourceConstants.EVENTS_ERROR_CODE, 4};
            StringBuilder sb = new StringBuilder();
            sb.append("loadError wrong auction ID ");
            sb.append(this.mState);
            lWSProgRvSmash.sendProviderEvent(IronSourceConstants.RV_MANAGER_UNEXPECTED_STATE, new Object[][]{objArr, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, sb.toString()}});
        }
    }

    @Override // com.ironsource.mediationsdk.LWSRvManagerListener
    public void onRewardedVideoAdOpened(LWSProgRvSmash lWSProgRvSmash) {
        this.waterfallLifeCycleHolder.setShowingSmash(lWSProgRvSmash);
        this.mSessionDepth++;
        logSmashCallback(lWSProgRvSmash, "onRewardedVideoAdOpened");
        RVListenerWrapper.getInstance().onRewardedVideoAdOpened();
        if (this.mIsAuctionEnabled) {
            AuctionResponseItem auctionResponseItem = this.mWaterfallServerData.get(lWSProgRvSmash.getInstanceName());
            if (auctionResponseItem != null) {
                this.mAuctionHandler.reportImpression(auctionResponseItem, lWSProgRvSmash.getInstanceType(), this.mGenericNotifications, this.mCurrentPlacement);
                this.mWaterfallPerformance.put(lWSProgRvSmash.getInstanceName(), AuctionHistory.ISAuctionPerformance.ISAuctionPerformanceShowedSuccessfully);
                reportImpressionDataToPublisher(auctionResponseItem, this.mCurrentPlacement);
            } else {
                String instanceName = lWSProgRvSmash != null ? lWSProgRvSmash.getInstanceName() : "Smash is null";
                logErrorInternal("onRewardedVideoAdOpened showing instance " + instanceName + " missing from waterfall");
                sendMediationEvent(IronSourceConstants.TROUBLESHOOTING_RV_NOTIFICATIONS_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1011}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "Showing missing " + this.mState}, new Object[]{IronSourceConstants.EVENTS_EXT1, instanceName}});
            }
        }
        this.mRvLoadTrigger.showStart();
    }

    @Override // com.ironsource.mediationsdk.LWSRvManagerListener
    public void onRewardedVideoAdShowFailed(IronSourceError ironSourceError, LWSProgRvSmash lWSProgRvSmash) {
        logSmashCallback(lWSProgRvSmash, "onRewardedVideoAdShowFailed error=" + ironSourceError.getErrorMessage());
        this.mIsShowingVideo = false;
        sendMediationEventWithPlacement(IronSourceConstants.RV_CALLBACK_SHOW_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(ironSourceError.getErrorCode())}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, ironSourceError.getErrorMessage()}});
        RVListenerWrapper.getInstance().onRewardedVideoAdShowFailed(ironSourceError);
        this.mWaterfallPerformance.put(lWSProgRvSmash.getInstanceName(), AuctionHistory.ISAuctionPerformance.ISAuctionPerformanceFailedToShow);
        if (this.mState != RV_MEDIATION_STATE.RV_STATE_READY_TO_SHOW) {
            reportAvailabilityIfNeeded(false);
        }
        this.mRvLoadTrigger.showError();
    }

    @Override // com.ironsource.mediationsdk.LWSRvManagerListener
    public void onRewardedVideoAdClosed(LWSProgRvSmash lWSProgRvSmash) {
        logSmashCallback(lWSProgRvSmash, "onRewardedVideoAdClosed, mediation state: " + this.mState.name());
        RVListenerWrapper.getInstance().onRewardedVideoAdClosed();
        this.mIsShowingVideo = false;
        boolean z = this.mState == RV_MEDIATION_STATE.RV_STATE_READY_TO_SHOW;
        StringBuilder sb = new StringBuilder();
        if (z) {
            for (LWSProgRvSmash lWSProgRvSmash2 : this.waterfallLifeCycleHolder.getCurrentWaterfall()) {
                if (lWSProgRvSmash2.isLoaded()) {
                    sb.append(lWSProgRvSmash2.getInstanceName() + ";");
                }
            }
        }
        Object[][] objArr = new Object[1][];
        Object[] objArr2 = new Object[2];
        objArr2[0] = IronSourceConstants.EVENTS_EXT1;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("otherRVAvailable = ");
        sb2.append(sb.length() > 0 ? "true|" + ((Object) sb) : "false");
        objArr2[1] = sb2.toString();
        objArr[0] = objArr2;
        lWSProgRvSmash.sendProviderEventWithPlacement(IronSourceConstants.RV_INSTANCE_CLOSED, objArr);
        if (lWSProgRvSmash.equals(this.waterfallLifeCycleHolder.getShowingSmash())) {
            this.waterfallLifeCycleHolder.setShowingSmash(null);
            if (this.mState != RV_MEDIATION_STATE.RV_STATE_READY_TO_SHOW) {
                reportAvailabilityIfNeeded(false);
            }
        }
    }

    @Override // com.ironsource.mediationsdk.LWSRvManagerListener
    public void onRewardedVideoAdStarted(LWSProgRvSmash lWSProgRvSmash) {
        logSmashCallback(lWSProgRvSmash, "onRewardedVideoAdStarted");
        RVListenerWrapper.getInstance().onRewardedVideoAdStarted();
    }

    @Override // com.ironsource.mediationsdk.LWSRvManagerListener
    public void onRewardedVideoAdEnded(LWSProgRvSmash lWSProgRvSmash) {
        logSmashCallback(lWSProgRvSmash, "onRewardedVideoAdEnded");
        RVListenerWrapper.getInstance().onRewardedVideoAdEnded();
    }

    @Override // com.ironsource.mediationsdk.LWSRvManagerListener
    public void onRewardedVideoAdRewarded(LWSProgRvSmash lWSProgRvSmash, Placement placement) {
        logSmashCallback(lWSProgRvSmash, "onRewardedVideoAdRewarded");
        RVListenerWrapper.getInstance().onRewardedVideoAdRewarded(placement);
    }

    @Override // com.ironsource.mediationsdk.LWSRvManagerListener
    public void onRewardedVideoAdClicked(LWSProgRvSmash lWSProgRvSmash, Placement placement) {
        logSmashCallback(lWSProgRvSmash, "onRewardedVideoAdClicked");
        RVListenerWrapper.getInstance().onRewardedVideoAdClicked(placement);
    }

    @Override // com.ironsource.mediationsdk.AuctionEventListener
    public void onAuctionSuccess(List<AuctionResponseItem> list, String str, AuctionResponseItem auctionResponseItem, int i, long j) {
        logInternal("makeAuction(): success");
        this.mGenericNotifications = auctionResponseItem;
        this.mAuctionTrial = i;
        this.mAuctionFailedReason = "";
        updateWaterfall(list, str);
        sendMediationEvent(IronSourceConstants.RV_AUCTION_SUCCESS, new Object[][]{new Object[]{"duration", Long.valueOf(j)}});
        loadSmashes();
    }

    @Override // com.ironsource.mediationsdk.AuctionEventListener
    public void onAuctionFailed(int i, String str, int i2, String str2, long j) {
        logInternal("Auction failed | moving to fallback waterfall");
        this.mAuctionTrial = i2;
        this.mAuctionFailedReason = str2;
        updateWaterfallToNonBidding();
        if (TextUtils.isEmpty(str)) {
            sendMediationEventWithoutAuctionId(IronSourceConstants.RV_AUCTION_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(i)}, new Object[]{"duration", Long.valueOf(j)}});
        } else {
            sendMediationEventWithoutAuctionId(IronSourceConstants.RV_AUCTION_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(i)}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, str}, new Object[]{"duration", Long.valueOf(j)}});
        }
        loadSmashes();
    }

    @Override // com.ironsource.mediationsdk.RvLoadTriggerCallback
    public void onLoadTriggered() {
        logInternal("onLoadTriggered: RV load was triggered in " + this.mState + " state");
        loadRewardedVideo(0L);
    }

    private void loadRewardedVideo(long j) {
        if (this.mSessionCappingManager.areAllSmashesCapped()) {
            logInternal("all smashes are capped");
            sendMediationEvent(IronSourceConstants.TROUBLESHOOTING_RV_LOAD_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 80001}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "all smashes are capped"}});
            handleLoadFailure();
            return;
        }
        if (this.mIsAuctionEnabled) {
            if (!this.mWaterfallPerformance.isEmpty()) {
                this.mAuctionHistory.storeWaterfallPerformance(this.mWaterfallPerformance);
                this.mWaterfallPerformance.clear();
            }
            new Timer().schedule(new TimerTask() { // from class: com.ironsource.mediationsdk.LWSProgRvManager.1
                @Override // java.util.TimerTask, java.lang.Runnable
                public void run() {
                    LWSProgRvManager.this.makeAuction();
                }
            }, j);
            return;
        }
        logInternal("auction fallback flow starting");
        updateWaterfallToNonBidding();
        if (this.waterfallLifeCycleHolder.getCurrentWaterfall().isEmpty()) {
            logInternal("loadSmashes -  waterfall is empty");
            sendMediationEvent(IronSourceConstants.TROUBLESHOOTING_RV_LOAD_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 80004}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "waterfall is empty"}});
            handleLoadFailure();
        } else {
            sendMediationEventWithoutAuctionId(1000);
            loadSmashes();
        }
    }

    private void showVideo(LWSProgRvSmash lWSProgRvSmash, Placement placement) {
        logInternal("showVideo()");
        this.mSessionCappingManager.increaseShowCounter(lWSProgRvSmash);
        if (this.mSessionCappingManager.isCapped(lWSProgRvSmash)) {
            lWSProgRvSmash.setCappedPerSession();
            IronSourceUtils.sendAutomationLog(lWSProgRvSmash.getInstanceName() + " rewarded video is now session capped");
        }
        CappingManager.incrementRvShowCounter(ContextProvider.getInstance().getApplicationContext(), placement.getPlacementName());
        if (CappingManager.isRvPlacementCapped(ContextProvider.getInstance().getApplicationContext(), placement.getPlacementName())) {
            sendMediationEventWithPlacement(IronSourceConstants.RV_CAP_PLACEMENT);
        }
        lWSProgRvSmash.showVideo(placement);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void makeAuction() {
        synchronized (this.stateLock) {
            if (this.mState != RV_MEDIATION_STATE.RV_STATE_AUCTION_IN_PROGRESS) {
                setState(RV_MEDIATION_STATE.RV_STATE_AUCTION_IN_PROGRESS);
                AsyncTask.execute(new Runnable() { // from class: com.ironsource.mediationsdk.LWSProgRvManager.2
                    @Override // java.lang.Runnable
                    public void run() {
                        LWSProgRvManager.this.logInternal("makeAuction()");
                        LWSProgRvManager.this.mAuctionStartTime = new Date().getTime();
                        HashMap map = new HashMap();
                        ArrayList arrayList = new ArrayList();
                        StringBuilder sb = new StringBuilder();
                        for (LWSProgRvSmash lWSProgRvSmash : LWSProgRvManager.this.smashes.values()) {
                            if (!LWSProgRvManager.this.mSessionCappingManager.isCapped(lWSProgRvSmash) && LWSProgRvManager.this.waterfallLifeCycleHolder.shouldAddSmashToWaterfallRequest(lWSProgRvSmash)) {
                                if (lWSProgRvSmash.isBidder()) {
                                    Map<String, Object> biddingData = lWSProgRvSmash.getBiddingData();
                                    if (biddingData != null) {
                                        map.put(lWSProgRvSmash.getInstanceName(), biddingData);
                                        sb.append(lWSProgRvSmash.getInstanceType() + lWSProgRvSmash.getInstanceName() + ",");
                                    }
                                } else {
                                    arrayList.add(lWSProgRvSmash.getInstanceName());
                                    sb.append(lWSProgRvSmash.getInstanceType() + lWSProgRvSmash.getInstanceName() + ",");
                                }
                            }
                        }
                        if (map.keySet().size() == 0 && arrayList.size() == 0) {
                            LWSProgRvManager.this.sendMediationEvent(IronSourceConstants.RV_AUCTION_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1005}, new Object[]{"duration", 0}});
                            LWSProgRvManager.this.logInternal("makeAuction() failed - No candidates available for auctioning");
                            LWSProgRvManager.this.handleLoadFailure();
                            return;
                        }
                        LWSProgRvManager.this.logInternal("makeAuction() - request waterfall is: " + ((Object) sb));
                        LWSProgRvManager.this.sendMediationEventWithoutAuctionId(1000);
                        LWSProgRvManager.this.sendMediationEventWithoutAuctionId(IronSourceConstants.RV_AUCTION_REQUEST);
                        LWSProgRvManager.this.sendMediationEventWithoutAuctionId(IronSourceConstants.RV_AUCTION_REQUEST_WATERFALL, new Object[][]{new Object[]{IronSourceConstants.EVENTS_EXT1, sb.toString()}});
                        LWSProgRvManager.this.mAuctionHandler.executeAuction(ContextProvider.getInstance().getApplicationContext(), map, arrayList, LWSProgRvManager.this.mAuctionHistory, LWSProgRvManager.this.mSessionDepth);
                    }
                });
            }
        }
    }

    private void updateWaterfallToNonBidding() {
        updateWaterfall(extractNonBidderProvidersFromWaterfall(), "fallback_" + System.currentTimeMillis());
    }

    private List<AuctionResponseItem> extractNonBidderProvidersFromWaterfall() {
        CopyOnWriteArrayList copyOnWriteArrayList = new CopyOnWriteArrayList();
        for (LWSProgRvSmash lWSProgRvSmash : this.smashes.values()) {
            if (!lWSProgRvSmash.isBidder() && !this.mSessionCappingManager.isCapped(lWSProgRvSmash) && this.waterfallLifeCycleHolder.shouldAddSmashToWaterfallRequest(lWSProgRvSmash)) {
                copyOnWriteArrayList.add(new AuctionResponseItem(lWSProgRvSmash.getInstanceName()));
            }
        }
        return copyOnWriteArrayList;
    }

    private void updateWaterfall(List<AuctionResponseItem> list, String str) {
        this.mWaterfallServerData.clear();
        this.mWaterfallPerformance.clear();
        CopyOnWriteArrayList<LWSProgRvSmash> copyOnWriteArrayList = new CopyOnWriteArrayList<>();
        StringBuilder sb = new StringBuilder();
        for (AuctionResponseItem auctionResponseItem : list) {
            sb.append(getAuctionResponseItemAsStringForReporting(auctionResponseItem) + ",");
            LWSProgRvSmash lWSProgRvSmash = this.smashes.get(auctionResponseItem.getInstanceName());
            if (lWSProgRvSmash != null) {
                AbstractAdapter abstractAdapterCreateAdapter = AdapterRepository.getInstance().createAdapter(lWSProgRvSmash.mAdapterConfig.getProviderSettings());
                if (abstractAdapterCreateAdapter != null) {
                    LWSProgRvSmash lWSProgRvSmash2 = new LWSProgRvSmash(lWSProgRvSmash, this, abstractAdapterCreateAdapter, this.mSessionDepth, str, this.mAuctionTrial, this.mAuctionFailedReason);
                    lWSProgRvSmash2.setIsLoadCandidate(true);
                    copyOnWriteArrayList.add(lWSProgRvSmash2);
                    this.mWaterfallServerData.put(lWSProgRvSmash2.getInstanceName(), auctionResponseItem);
                    this.mWaterfallPerformance.put(auctionResponseItem.getInstanceName(), AuctionHistory.ISAuctionPerformance.ISAuctionPerformanceDidntAttemptToLoad);
                }
            } else {
                logInternal("updateWaterfall() - could not find matching smash for auction response item " + auctionResponseItem.getInstanceName());
            }
        }
        this.waterfallLifeCycleHolder.updateWaterFall(copyOnWriteArrayList, str);
        if (this.waterfallLifeCycleHolder.areWaterFallsOverMaximum()) {
            sendMediationEvent(IronSourceConstants.TROUBLESHOOTING_RV_WATERFALL_OVERHEAD, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "waterfalls hold too many with size=" + this.waterfallLifeCycleHolder.getNumberOfWaterfalls()}});
        }
        logInternal("updateWaterfall() - response waterfall is " + sb.toString());
        if (sb.length() == 0) {
            logInternal("Updated waterfall is empty");
        }
        sendMediationEvent(IronSourceConstants.RV_AUCTION_RESPONSE_WATERFALL, new Object[][]{new Object[]{IronSourceConstants.EVENTS_EXT1, sb.toString()}});
    }

    private String getAuctionResponseItemAsStringForReporting(AuctionResponseItem auctionResponseItem) {
        String string;
        LWSProgRvSmash lWSProgRvSmash = this.smashes.get(auctionResponseItem.getInstanceName());
        if (lWSProgRvSmash != null) {
            string = Integer.toString(lWSProgRvSmash.getInstanceType());
        } else {
            string = TextUtils.isEmpty(auctionResponseItem.getServerData()) ? "1" : "2";
        }
        return string + auctionResponseItem.getInstanceName();
    }

    private void loadSmashes() {
        if (this.waterfallLifeCycleHolder.getCurrentWaterfall().isEmpty()) {
            logInternal("loadSmashes -  waterfall is empty");
            sendMediationEvent(IronSourceConstants.TROUBLESHOOTING_RV_LOAD_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 80004}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "waterfall is empty"}});
            handleLoadFailure();
            return;
        }
        setState(RV_MEDIATION_STATE.RV_STATE_LOADING_SMASHES);
        int i = 0;
        for (int i2 = 0; i2 < this.waterfallLifeCycleHolder.getCurrentWaterfall().size() && i < this.mMaxSmashesToLoad; i2++) {
            LWSProgRvSmash lWSProgRvSmash = this.waterfallLifeCycleHolder.getCurrentWaterfall().get(i2);
            if (lWSProgRvSmash.getIsLoadCandidate()) {
                if (this.mAdvancedLoading && lWSProgRvSmash.isBidder()) {
                    if (i == 0) {
                        loadSmash(lWSProgRvSmash);
                        return;
                    }
                    logInternal("Advanced Loading: Won't start loading bidder " + lWSProgRvSmash.getInstanceName() + " as a non bidder is being loaded");
                    return;
                }
                loadSmash(lWSProgRvSmash);
                i++;
            }
        }
    }

    private void loadSmash(LWSProgRvSmash lWSProgRvSmash) {
        String serverData = this.mWaterfallServerData.get(lWSProgRvSmash.getInstanceName()).getServerData();
        lWSProgRvSmash.setDynamicDemandSourceIdByServerData(serverData);
        lWSProgRvSmash.loadVideo(serverData);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleLoadFailure() {
        setState(RV_MEDIATION_STATE.RV_STATE_NOT_LOADED);
        if (!this.mIsShowingVideo) {
            reportAvailabilityIfNeeded(false);
        }
        this.mRvLoadTrigger.loadError();
    }

    private void setState(RV_MEDIATION_STATE rv_mediation_state) {
        logInternal("current state=" + this.mState + ", new state=" + rv_mediation_state);
        this.mState = rv_mediation_state;
    }

    private void reportAvailabilityIfNeeded(boolean z) {
        synchronized (this.stateLock) {
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
    }

    private void logSmashCallback(LWSProgRvSmash lWSProgRvSmash, String str) {
        String str2 = lWSProgRvSmash.getInstanceName() + " : " + str;
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, "LWSProgRvManager: " + str2, 0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void logInternal(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "LWSProgRvManager: " + str, 0);
    }

    private void logErrorInternal(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "LWSProgRvManager: " + str, 3);
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
        map.put(IronSourceConstants.EVENTS_PROGRAMMATIC, 2);
        if (z2 && !TextUtils.isEmpty(this.waterfallLifeCycleHolder.getCurrentWaterfallId())) {
            map.put("auctionId", this.waterfallLifeCycleHolder.getCurrentWaterfallId());
        }
        if (z && !TextUtils.isEmpty(this.mCurrentPlacement)) {
            map.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, this.mCurrentPlacement);
        }
        if (shouldAddAuctionParams(i)) {
            RewardedVideoEventsManager.getInstance().setEventAuctionParams(map, this.mAuctionTrial, this.mAuctionFailedReason);
        }
        map.put("sessionDepth", Integer.valueOf(this.mSessionDepth));
        if (objArr != null) {
            try {
                for (Object[] objArr2 : objArr) {
                    map.put(objArr2[0].toString(), objArr2[1]);
                }
            } catch (Exception e) {
                IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "LWSProgRvManager: RV sendMediationEvent " + Log.getStackTraceString(e), 3);
            }
        }
        RewardedVideoEventsManager.getInstance().log(new EventData(i, new JSONObject(map)));
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
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "LWSProgRvManager Should Track Network State: " + z, 0);
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
