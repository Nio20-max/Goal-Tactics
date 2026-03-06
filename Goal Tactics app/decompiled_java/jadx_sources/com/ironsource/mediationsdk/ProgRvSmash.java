package com.ironsource.mediationsdk;

import android.text.TextUtils;
import android.util.Log;
import com.facebook.internal.ServerProtocol;
import com.ironsource.eventsmodule.EventData;
import com.ironsource.mediationsdk.AbstractSmash;
import com.ironsource.mediationsdk.config.ConfigFile;
import com.ironsource.mediationsdk.events.RewardedVideoEventsManager;
import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.model.AdapterConfig;
import com.ironsource.mediationsdk.model.Placement;
import com.ironsource.mediationsdk.model.ProviderSettings;
import com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import com.ironsource.mediationsdk.utils.SessionDepthManager;
import java.util.Date;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class ProgRvSmash extends ProgSmash implements RewardedVideoSmashListener {
    private static final int errorCode_adClosed = 5009;
    private static final int errorCode_biddingDataException = 5001;
    private static final int errorCode_initFailed = 5008;
    private static final int errorCode_initSuccess = 5007;
    private static final int errorCode_isReadyException = 5002;
    private static final int errorCode_loadException = 5005;
    private static final int errorCode_loadInProgress = 5003;
    private static final int errorCode_showFailed = 5006;
    private static final int errorCode_showInProgress = 5004;
    private String mAppKey;
    private String mAuctionFallback;
    private String mAuctionFallbackToLoad;
    private String mAuctionIdToLoad;
    private String mAuctionServerDataToLoad;
    private int mAuctionTrial;
    private int mAuctionTrialToLoad;
    private String mCurrentAuctionId;
    private Placement mCurrentPlacement;
    private String mDynamicDemandSourceIdToLoad;
    private boolean mIsShowCandidate;
    private ProgRvManagerListener mListener;
    private long mLoadStartTime;
    private int mLoadTimeoutSecs;
    private int mSessionDepth;
    private int mSessionDepthToLoad;
    private boolean mShouldLoadAfterClose;
    private boolean mShouldLoadAfterLoad;
    private SMASH_STATE mState;
    private final Object mStateLock;
    private Timer mTimer;
    private final Object mTimerLock;
    private String mUserId;

    protected enum SMASH_STATE {
        NO_INIT,
        INIT_IN_PROGRESS,
        NOT_LOADED,
        LOAD_IN_PROGRESS,
        LOADED,
        SHOW_IN_PROGRESS
    }

    private boolean shouldAddAuctionParams(int i) {
        return i == 1001 || i == 1002 || i == 1200 || i == 1005 || i == 1203 || i == 1201 || i == 1202 || i == 1006 || i == 1010;
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener
    public void onRewardedVideoLoadSuccess() {
    }

    public ProgRvSmash(String str, String str2, ProviderSettings providerSettings, ProgRvManagerListener progRvManagerListener, int i, AbstractAdapter abstractAdapter) {
        super(new AdapterConfig(providerSettings, providerSettings.getRewardedVideoSettings()), abstractAdapter);
        this.mTimerLock = new Object();
        this.mStateLock = new Object();
        this.mState = SMASH_STATE.NO_INIT;
        this.mAppKey = str;
        this.mUserId = str2;
        this.mListener = progRvManagerListener;
        this.mTimer = null;
        this.mLoadTimeoutSecs = i;
        this.mAdapter.addRewardedVideoListener(this);
        this.mShouldLoadAfterClose = false;
        this.mShouldLoadAfterLoad = false;
        this.mIsShowCandidate = false;
        this.mCurrentPlacement = null;
        this.mCurrentAuctionId = "";
        this.mSessionDepth = 1;
        resetAuctionParams();
    }

    private void resetAuctionParams() {
        this.mAuctionIdToLoad = "";
        this.mAuctionTrialToLoad = -1;
        this.mAuctionFallbackToLoad = "";
        this.mAuctionServerDataToLoad = "";
        this.mSessionDepthToLoad = this.mSessionDepth;
        this.mDynamicDemandSourceIdToLoad = "";
    }

    public boolean isLoadingInProgress() {
        return this.mState == SMASH_STATE.INIT_IN_PROGRESS || this.mState == SMASH_STATE.LOAD_IN_PROGRESS;
    }

    public Map<String, Object> getBiddingData() {
        try {
            if (isBidder()) {
                return this.mAdapter.getRewardedVideoBiddingData(this.mAdUnitSettings);
            }
            return null;
        } catch (Throwable th) {
            logInternalError("getBiddingData exception: " + th.getLocalizedMessage());
            th.printStackTrace();
            sendProviderEvent(IronSourceConstants.RV_SMASH_UNEXPECTED_STATE, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 5001}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, th.getLocalizedMessage()}});
            return null;
        }
    }

    public void initForBidding() {
        logInternal("initForBidding()");
        setState(SMASH_STATE.INIT_IN_PROGRESS);
        setCustomParams();
        try {
            this.mAdapter.initRewardedVideoForBidding(this.mAppKey, this.mUserId, this.mAdUnitSettings, this);
        } catch (Throwable th) {
            logInternalError("initForBidding exception: " + th.getLocalizedMessage());
            th.printStackTrace();
            onRewardedVideoInitFailed(new IronSourceError(IronSourceError.ERROR_RV_INIT_EXCEPTION, th.getLocalizedMessage()));
        }
    }

    public void unloadVideo() {
        if (isBidder()) {
            this.mIsShowCandidate = false;
        }
    }

    public boolean isRewardedVideoAvailable() {
        return this.mAdapter.isRewardedVideoAvailable(this.mAdUnitSettings);
    }

    public boolean isReadyToShow() {
        try {
            if (isBidder()) {
                return this.mIsShowCandidate && this.mState == SMASH_STATE.LOADED && isRewardedVideoAvailable();
            }
            return isRewardedVideoAvailable();
        } catch (Throwable th) {
            logInternalError("isReadyToShow exception: " + th.getLocalizedMessage());
            th.printStackTrace();
            sendProviderEvent(IronSourceConstants.RV_SMASH_UNEXPECTED_STATE, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 5002}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, th.getLocalizedMessage()}});
            return false;
        }
    }

    public void loadVideo(String str, String str2, int i, String str3, int i2, String str4) {
        SMASH_STATE smash_state;
        logInternal("loadVideo() auctionId: " + str2 + " state: " + this.mState);
        setIsLoadCandidate(false);
        this.mIsShowCandidate = true;
        synchronized (this.mStateLock) {
            smash_state = this.mState;
            if (smash_state != SMASH_STATE.LOAD_IN_PROGRESS && this.mState != SMASH_STATE.SHOW_IN_PROGRESS) {
                setState(SMASH_STATE.LOAD_IN_PROGRESS);
            }
        }
        if (smash_state == SMASH_STATE.LOAD_IN_PROGRESS) {
            sendProviderEvent(IronSourceConstants.RV_SMASH_UNEXPECTED_STATE, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 5003}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "load during load"}});
            this.mShouldLoadAfterLoad = true;
            updateFutureAuctionData(str, str2, i, str3, i2, str4);
            this.mListener.onLoadError(this, str2);
            return;
        }
        if (smash_state == SMASH_STATE.SHOW_IN_PROGRESS) {
            sendProviderEvent(IronSourceConstants.RV_SMASH_UNEXPECTED_STATE, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 5004}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "load during show"}});
            this.mShouldLoadAfterClose = true;
            updateFutureAuctionData(str, str2, i, str3, i2, str4);
            return;
        }
        this.mDynamicDemandSourceId = str4;
        this.mCurrentAuctionId = str2;
        this.mAuctionTrial = i;
        this.mAuctionFallback = str3;
        this.mSessionDepth = i2;
        startLoadTimer();
        this.mLoadStartTime = new Date().getTime();
        sendProviderEvent(1001);
        try {
            if (isBidder()) {
                this.mAdapter.loadRewardedVideoForBidding(this.mAdUnitSettings, this, str);
            } else if (smash_state == SMASH_STATE.NO_INIT) {
                setCustomParams();
                this.mAdapter.initRewardedVideo(this.mAppKey, this.mUserId, this.mAdUnitSettings, this);
            } else {
                this.mAdapter.fetchRewardedVideoForAutomaticLoad(this.mAdUnitSettings, this);
            }
        } catch (Throwable th) {
            logInternalError("loadRewardedVideoForBidding exception: " + th.getLocalizedMessage());
            th.printStackTrace();
            sendProviderEvent(IronSourceConstants.RV_SMASH_UNEXPECTED_STATE, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 5005}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, th.getLocalizedMessage()}});
        }
    }

    public void reportShowChance(boolean z, int i) {
        this.mSessionDepth = i;
        Object[][] objArr = new Object[1][];
        Object[] objArr2 = new Object[2];
        objArr2[0] = "status";
        objArr2[1] = z ? ServerProtocol.DIALOG_RETURN_SCOPES_TRUE : "false";
        objArr[0] = objArr2;
        sendProviderEventWithPlacement(IronSourceConstants.RV_INSTANCE_SHOW_CHANCE, objArr);
    }

    public void showVideo(Placement placement, int i) {
        stopLoadTimer();
        logInternal("showVideo()");
        this.mCurrentPlacement = placement;
        this.mSessionDepth = i;
        setState(SMASH_STATE.SHOW_IN_PROGRESS);
        sendProviderEventWithPlacement(IronSourceConstants.RV_INSTANCE_SHOW);
        try {
            this.mAdapter.showRewardedVideo(this.mAdUnitSettings, this);
        } catch (Throwable th) {
            logInternalError("showVideo exception: " + th.getLocalizedMessage());
            th.printStackTrace();
            onRewardedVideoAdShowFailed(new IronSourceError(IronSourceError.ERROR_RV_SHOW_EXCEPTION, th.getLocalizedMessage()));
        }
    }

    public void setCappedPerSession() {
        this.mAdapter.setMediationState(AbstractSmash.MEDIATION_STATE.CAPPED_PER_SESSION, IronSourceConstants.AD_UNIT_RV_MEDIATION_STATE);
        sendProviderEvent(IronSourceConstants.RV_CAP_SESSION);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setState(SMASH_STATE smash_state) {
        logInternal("current state=" + this.mState + ", new state=" + smash_state);
        synchronized (this.mStateLock) {
            this.mState = smash_state;
        }
    }

    private void setCustomParams() {
        try {
            String mediationSegment = IronSourceObject.getInstance().getMediationSegment();
            if (!TextUtils.isEmpty(mediationSegment)) {
                this.mAdapter.setMediationSegment(mediationSegment);
            }
            String pluginType = ConfigFile.getConfigFile().getPluginType();
            if (TextUtils.isEmpty(pluginType)) {
                return;
            }
            this.mAdapter.setPluginData(pluginType, ConfigFile.getConfigFile().getPluginFrameworkVersion());
        } catch (Exception e) {
            logInternal("setCustomParams() " + e.getMessage());
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener
    public void onRewardedVideoAvailabilityChanged(boolean z) {
        boolean z2;
        stopLoadTimer();
        logAdapterCallback("onRewardedVideoAvailabilityChanged available=" + z + " state=" + this.mState.name());
        synchronized (this.mStateLock) {
            if (this.mState == SMASH_STATE.LOAD_IN_PROGRESS) {
                setState(z ? SMASH_STATE.LOADED : SMASH_STATE.NOT_LOADED);
                z2 = false;
            } else {
                z2 = true;
            }
        }
        if (z2) {
            if (z) {
                sendProviderEvent(IronSourceConstants.RV_INSTANCE_AVAILABILITY_TRUE, new Object[][]{new Object[]{IronSourceConstants.EVENTS_EXT1, this.mState.name()}});
                return;
            } else {
                sendProviderEvent(IronSourceConstants.RV_INSTANCE_AVAILABILITY_FALSE, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(IronSourceError.ERROR_RV_LOAD_UNEXPECTED_CALLBACK)}, new Object[]{"duration", Long.valueOf(getElapsedTime())}, new Object[]{IronSourceConstants.EVENTS_EXT1, this.mState.name()}});
                return;
            }
        }
        sendProviderEvent(z ? 1002 : IronSourceConstants.RV_INSTANCE_LOAD_FAILED, new Object[][]{new Object[]{"duration", Long.valueOf(getElapsedTime())}});
        if (!this.mShouldLoadAfterLoad) {
            if (z) {
                this.mListener.onLoadSuccess(this, this.mCurrentAuctionId);
                return;
            } else {
                this.mListener.onLoadError(this, this.mCurrentAuctionId);
                return;
            }
        }
        this.mShouldLoadAfterLoad = false;
        logInternal("onRewardedVideoAvailabilityChanged to " + z + "and mShouldLoadAfterLoad is true - calling loadVideo");
        loadVideo(this.mAuctionServerDataToLoad, this.mAuctionIdToLoad, this.mAuctionTrialToLoad, this.mAuctionFallbackToLoad, this.mSessionDepthToLoad, this.mDynamicDemandSourceIdToLoad);
        resetAuctionParams();
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener
    public void onRewardedVideoLoadFailed(IronSourceError ironSourceError) {
        sendProviderEvent(IronSourceConstants.RV_INSTANCE_LOAD_FAILED_REASON, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(ironSourceError.getErrorCode())}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, ironSourceError.getErrorMessage()}, new Object[]{"duration", Long.valueOf(getElapsedTime())}});
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener
    public void onRewardedVideoAdShowFailed(IronSourceError ironSourceError) {
        logAdapterCallback("onRewardedVideoAdShowFailed error=" + ironSourceError.getErrorMessage());
        sendProviderEventWithPlacement(IronSourceConstants.RV_INSTANCE_SHOW_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(ironSourceError.getErrorCode())}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, ironSourceError.getErrorMessage()}});
        synchronized (this.mStateLock) {
            if (this.mState == SMASH_STATE.SHOW_IN_PROGRESS) {
                setState(SMASH_STATE.NOT_LOADED);
                this.mListener.onRewardedVideoAdShowFailed(ironSourceError, this);
                return;
            }
            sendProviderEvent(IronSourceConstants.RV_SMASH_UNEXPECTED_STATE, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 5006}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "showFailed: " + this.mState}});
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener
    public void onRewardedVideoInitSuccess() {
        logAdapterCallback("onRewardedVideoInitSuccess");
        synchronized (this.mStateLock) {
            if (this.mState == SMASH_STATE.INIT_IN_PROGRESS) {
                setState(SMASH_STATE.NOT_LOADED);
                return;
            }
            sendProviderEvent(IronSourceConstants.RV_SMASH_UNEXPECTED_STATE, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 5007}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "initSuccess: " + this.mState}});
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener
    public void onRewardedVideoInitFailed(IronSourceError ironSourceError) {
        logAdapterCallback("onRewardedVideoInitFailed error=" + ironSourceError.getErrorMessage());
        stopLoadTimer();
        sendProviderEvent(IronSourceConstants.RV_INSTANCE_LOAD_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(IronSourceError.ERROR_RV_LOAD_FAIL_DUE_TO_INIT)}, new Object[]{"duration", Long.valueOf(getElapsedTime())}});
        sendProviderEvent(IronSourceConstants.RV_INSTANCE_LOAD_FAILED_REASON, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(ironSourceError.getErrorCode())}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, ironSourceError.getErrorMessage()}, new Object[]{"duration", Long.valueOf(getElapsedTime())}});
        synchronized (this.mStateLock) {
            if (this.mState == SMASH_STATE.INIT_IN_PROGRESS) {
                setState(SMASH_STATE.NO_INIT);
                this.mListener.onLoadError(this, this.mCurrentAuctionId);
                return;
            }
            sendProviderEvent(IronSourceConstants.RV_SMASH_UNEXPECTED_STATE, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 5008}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "initFailed: " + this.mState}});
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener
    public void onRewardedVideoAdOpened() {
        logAdapterCallback("onRewardedVideoAdOpened");
        this.mListener.onRewardedVideoAdOpened(this);
        sendProviderEventWithPlacement(1005);
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener
    public void onRewardedVideoAdStarted() {
        logAdapterCallback("onRewardedVideoAdStarted");
        this.mListener.onRewardedVideoAdStarted(this);
        sendProviderEventWithPlacement(IronSourceConstants.RV_INSTANCE_STARTED);
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener
    public void onRewardedVideoAdVisible() {
        logAdapterCallback("onRewardedVideoAdVisible");
        sendProviderEventWithPlacement(IronSourceConstants.RV_INSTANCE_VISIBLE);
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener
    public void onRewardedVideoAdClosed() {
        logAdapterCallback("onRewardedVideoAdClosed");
        synchronized (this.mStateLock) {
            if (this.mState != SMASH_STATE.SHOW_IN_PROGRESS) {
                sendProviderEventWithPlacement(IronSourceConstants.RV_INSTANCE_CLOSED);
                sendProviderEvent(IronSourceConstants.RV_SMASH_UNEXPECTED_STATE, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 5009}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "adClosed: " + this.mState}});
                return;
            }
            setState(SMASH_STATE.NOT_LOADED);
            this.mListener.onRewardedVideoAdClosed(this);
            if (this.mShouldLoadAfterClose) {
                logInternal("onRewardedVideoAdClosed and mShouldLoadAfterClose is true - calling loadRewardedVideoForBidding");
                this.mShouldLoadAfterClose = false;
                loadVideo(this.mAuctionServerDataToLoad, this.mAuctionIdToLoad, this.mAuctionTrialToLoad, this.mAuctionFallbackToLoad, this.mSessionDepthToLoad, this.mDynamicDemandSourceIdToLoad);
                resetAuctionParams();
            }
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener
    public void onRewardedVideoAdEnded() {
        logAdapterCallback("onRewardedVideoAdEnded");
        this.mListener.onRewardedVideoAdEnded(this);
        sendProviderEventWithPlacement(IronSourceConstants.RV_INSTANCE_ENDED);
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener
    public void onRewardedVideoAdRewarded() {
        logAdapterCallback("onRewardedVideoAdRewarded");
        this.mListener.onRewardedVideoAdRewarded(this, this.mCurrentPlacement);
        Map<String, Object> providerEventData = getProviderEventData();
        Placement placement = this.mCurrentPlacement;
        if (placement != null) {
            providerEventData.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, placement.getPlacementName());
            providerEventData.put(IronSourceConstants.EVENTS_REWARD_NAME, this.mCurrentPlacement.getRewardName());
            providerEventData.put(IronSourceConstants.EVENTS_REWARD_AMOUNT, Integer.valueOf(this.mCurrentPlacement.getRewardAmount()));
        }
        if (!TextUtils.isEmpty(IronSourceObject.getInstance().getDynamicUserId())) {
            providerEventData.put(IronSourceConstants.EVENTS_DYNAMIC_USER_ID, IronSourceObject.getInstance().getDynamicUserId());
        }
        if (IronSourceObject.getInstance().getRvServerParams() != null) {
            for (String str : IronSourceObject.getInstance().getRvServerParams().keySet()) {
                providerEventData.put("custom_" + str, IronSourceObject.getInstance().getRvServerParams().get(str));
            }
        }
        if (!TextUtils.isEmpty(this.mCurrentAuctionId)) {
            providerEventData.put("auctionId", this.mCurrentAuctionId);
        }
        if (shouldAddAuctionParams(1010)) {
            RewardedVideoEventsManager.getInstance().setEventAuctionParams(providerEventData, this.mAuctionTrial, this.mAuctionFallback);
        }
        providerEventData.put("sessionDepth", Integer.valueOf(this.mSessionDepth));
        EventData eventData = new EventData(1010, new JSONObject(providerEventData));
        eventData.addToAdditionalData(IronSourceConstants.EVENTS_TRANS_ID, IronSourceUtils.getTransId("" + Long.toString(eventData.getTimeStamp()) + this.mAppKey + getInstanceName()));
        RewardedVideoEventsManager.getInstance().log(eventData);
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoSmashListener
    public void onRewardedVideoAdClicked() {
        logAdapterCallback("onRewardedVideoAdClicked");
        this.mListener.onRewardedVideoAdClicked(this, this.mCurrentPlacement);
        sendProviderEventWithPlacement(1006);
    }

    private void stopLoadTimer() {
        synchronized (this.mTimerLock) {
            Timer timer = this.mTimer;
            if (timer != null) {
                timer.cancel();
                this.mTimer = null;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public long getElapsedTime() {
        return new Date().getTime() - this.mLoadStartTime;
    }

    private void updateFutureAuctionData(String str, String str2, int i, String str3, int i2, String str4) {
        this.mAuctionIdToLoad = str2;
        this.mAuctionServerDataToLoad = str;
        this.mAuctionTrialToLoad = i;
        this.mAuctionFallbackToLoad = str3;
        this.mSessionDepthToLoad = i2;
        this.mDynamicDemandSourceIdToLoad = str4;
    }

    private void startLoadTimer() {
        synchronized (this.mTimerLock) {
            stopLoadTimer();
            Timer timer = new Timer();
            this.mTimer = timer;
            timer.schedule(new TimerTask() { // from class: com.ironsource.mediationsdk.ProgRvSmash.1
                @Override // java.util.TimerTask, java.lang.Runnable
                public void run() {
                    int i;
                    boolean z;
                    String str = "Rewarded Video - load instance time out";
                    synchronized (ProgRvSmash.this.mStateLock) {
                        if (ProgRvSmash.this.mState == SMASH_STATE.LOAD_IN_PROGRESS || ProgRvSmash.this.mState == SMASH_STATE.INIT_IN_PROGRESS) {
                            if (ProgRvSmash.this.mState == SMASH_STATE.LOAD_IN_PROGRESS) {
                                i = 1025;
                            } else {
                                str = "Rewarded Video - init instance time out";
                                i = IronSourceError.ERROR_RV_INIT_FAILED_TIMEOUT;
                            }
                            ProgRvSmash.this.setState(SMASH_STATE.NOT_LOADED);
                            z = true;
                        } else {
                            i = 510;
                            z = false;
                        }
                    }
                    ProgRvSmash.this.logInternal(str);
                    if (z) {
                        ProgRvSmash.this.sendProviderEvent(IronSourceConstants.RV_INSTANCE_LOAD_FAILED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(i)}, new Object[]{"duration", Long.valueOf(ProgRvSmash.this.getElapsedTime())}});
                        ProgRvSmash.this.sendProviderEvent(IronSourceConstants.RV_INSTANCE_LOAD_FAILED_REASON, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(i)}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, str}, new Object[]{"duration", Long.valueOf(ProgRvSmash.this.getElapsedTime())}});
                        ProgRvManagerListener progRvManagerListener = ProgRvSmash.this.mListener;
                        ProgRvSmash progRvSmash = ProgRvSmash.this;
                        progRvManagerListener.onLoadError(progRvSmash, progRvSmash.mCurrentAuctionId);
                        return;
                    }
                    ProgRvSmash.this.sendProviderEvent(IronSourceConstants.RV_INSTANCE_AVAILABILITY_FALSE, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 1025}, new Object[]{"duration", Long.valueOf(ProgRvSmash.this.getElapsedTime())}, new Object[]{IronSourceConstants.EVENTS_EXT1, ProgRvSmash.this.mState.name()}});
                }
            }, this.mLoadTimeoutSecs * 1000);
        }
    }

    private void logAdapterCallback(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, "ProgRvSmash " + getInstanceName() + " : " + str, 0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void logInternal(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "ProgRvSmash " + getInstanceName() + " : " + str, 0);
    }

    private void logInternalError(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "ProgRvSmash " + getInstanceName() + " : " + str, 3);
    }

    private void sendProviderEventWithPlacement(int i) {
        sendProviderEventWithPlacement(i, (Object[][]) null);
    }

    public void sendProviderEventWithPlacement(int i, Object[][] objArr) {
        sendProviderEvent(i, objArr, true);
    }

    private void sendProviderEvent(int i) {
        sendProviderEvent(i, (Object[][]) null, false);
    }

    public void sendProviderEvent(int i, Object[][] objArr) {
        sendProviderEvent(i, objArr, false);
    }

    private void sendProviderEvent(int i, Object[][] objArr, boolean z) {
        Placement placement;
        Map<String, Object> providerEventData = getProviderEventData();
        if (!TextUtils.isEmpty(this.mCurrentAuctionId)) {
            providerEventData.put("auctionId", this.mCurrentAuctionId);
        }
        if (z && (placement = this.mCurrentPlacement) != null && !TextUtils.isEmpty(placement.getPlacementName())) {
            providerEventData.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, this.mCurrentPlacement.getPlacementName());
        }
        if (shouldAddAuctionParams(i)) {
            RewardedVideoEventsManager.getInstance().setEventAuctionParams(providerEventData, this.mAuctionTrial, this.mAuctionFallback);
        }
        providerEventData.put("sessionDepth", Integer.valueOf(this.mSessionDepth));
        if (objArr != null) {
            try {
                for (Object[] objArr2 : objArr) {
                    providerEventData.put(objArr2[0].toString(), objArr2[1]);
                }
            } catch (Exception e) {
                IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, getInstanceName() + " smash: RV sendMediationEvent " + Log.getStackTraceString(e), 3);
            }
        }
        RewardedVideoEventsManager.getInstance().log(new EventData(i, new JSONObject(providerEventData)));
        if (i == 1203) {
            SessionDepthManager.getInstance().increaseSessionDepth(1);
        }
    }
}
