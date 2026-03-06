package com.ironsource.mediationsdk;

import android.text.TextUtils;
import com.ironsource.mediationsdk.AbstractSmash;
import com.ironsource.mediationsdk.config.ConfigFile;
import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.model.AdapterConfig;
import com.ironsource.mediationsdk.model.ProviderSettings;
import com.ironsource.mediationsdk.sdk.InterstitialSmashListener;
import com.ironsource.mediationsdk.utils.ErrorBuilder;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.sdk.constants.Constants;
import java.util.Date;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

/* JADX INFO: loaded from: classes2.dex */
public class ProgIsSmash extends ProgSmash implements InterstitialSmashListener {
    private String mAppKey;
    private ProgIsManagerListener mListener;
    private long mLoadStartTime;
    private int mLoadTimeoutSecs;
    private SMASH_STATE mState;
    private Timer mTimer;
    private final Object mTimerLock;
    private String mUserId;

    protected enum SMASH_STATE {
        NO_INIT,
        INIT_IN_PROGRESS,
        INIT_SUCCESS,
        LOAD_IN_PROGRESS,
        LOADED,
        LOAD_FAILED
    }

    public ProgIsSmash(String str, String str2, ProviderSettings providerSettings, ProgIsManagerListener progIsManagerListener, int i, AbstractAdapter abstractAdapter) {
        super(new AdapterConfig(providerSettings, providerSettings.getInterstitialSettings()), abstractAdapter);
        this.mTimerLock = new Object();
        this.mState = SMASH_STATE.NO_INIT;
        this.mAppKey = str;
        this.mUserId = str2;
        this.mListener = progIsManagerListener;
        this.mTimer = null;
        this.mLoadTimeoutSecs = i;
        this.mAdapter.addInterstitialListener(this);
    }

    public Map<String, Object> getBiddingData() {
        try {
            if (isBidder()) {
                return this.mAdapter.getInterstitialBiddingData(this.mAdUnitSettings);
            }
            return null;
        } catch (Throwable th) {
            logInternalError("getBiddingData exception: " + th.getLocalizedMessage());
            th.printStackTrace();
            return null;
        }
    }

    public boolean isLoadingInProgress() {
        return this.mState == SMASH_STATE.INIT_IN_PROGRESS || this.mState == SMASH_STATE.LOAD_IN_PROGRESS;
    }

    public void initForBidding() {
        logInternal("initForBidding()");
        setState(SMASH_STATE.INIT_IN_PROGRESS);
        setCustomParams();
        try {
            this.mAdapter.initInterstitialForBidding(this.mAppKey, this.mUserId, this.mAdUnitSettings, this);
        } catch (Throwable th) {
            logInternalError(getInstanceName() + "loadInterstitial exception : " + th.getLocalizedMessage());
            th.printStackTrace();
            onInterstitialInitFailed(new IronSourceError(IronSourceError.ERROR_IS_INIT_EXCEPTION, th.getLocalizedMessage()));
        }
    }

    public void loadInterstitial(String str) {
        try {
            this.mLoadStartTime = new Date().getTime();
            logInternal(Constants.JSMethods.LOAD_INTERSTITIAL);
            setIsLoadCandidate(false);
            if (isBidder()) {
                startTimer();
                setState(SMASH_STATE.LOAD_IN_PROGRESS);
                this.mAdapter.loadInterstitialForBidding(this.mAdUnitSettings, this, str);
            } else {
                if (this.mState == SMASH_STATE.NO_INIT) {
                    startTimer();
                    setState(SMASH_STATE.INIT_IN_PROGRESS);
                    setCustomParams();
                    this.mAdapter.initInterstitial(this.mAppKey, this.mUserId, this.mAdUnitSettings, this);
                    return;
                }
                startTimer();
                setState(SMASH_STATE.LOAD_IN_PROGRESS);
                this.mAdapter.loadInterstitial(this.mAdUnitSettings, this);
            }
        } catch (Throwable th) {
            logInternalError("loadInterstitial exception: " + th.getLocalizedMessage());
            th.printStackTrace();
        }
    }

    public void showInterstitial() {
        try {
            this.mAdapter.showInterstitial(this.mAdUnitSettings, this);
        } catch (Throwable th) {
            logInternalError(getInstanceName() + "showInterstitial exception : " + th.getLocalizedMessage());
            th.printStackTrace();
            this.mListener.onInterstitialAdShowFailed(new IronSourceError(IronSourceError.ERROR_IS_SHOW_EXCEPTION, th.getLocalizedMessage()), this);
        }
    }

    public void setCappedPerSession() {
        this.mAdapter.setMediationState(AbstractSmash.MEDIATION_STATE.CAPPED_PER_SESSION, IronSourceConstants.AD_UNIT_IS_MEDIATION_STATE);
    }

    public boolean isReadyToShow() {
        try {
            return this.mAdapter.isInterstitialReady(this.mAdUnitSettings);
        } catch (Throwable th) {
            logInternalError("isReadyToShow exception: " + th.getLocalizedMessage());
            th.printStackTrace();
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setState(SMASH_STATE smash_state) {
        logInternal("current state=" + this.mState + ", new state=" + smash_state);
        this.mState = smash_state;
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

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialInitSuccess() {
        logAdapterCallback("onInterstitialInitSuccess state=" + this.mState.name());
        if (this.mState != SMASH_STATE.INIT_IN_PROGRESS) {
            return;
        }
        stopTimer();
        if (isBidder()) {
            setState(SMASH_STATE.INIT_SUCCESS);
        } else {
            setState(SMASH_STATE.LOAD_IN_PROGRESS);
            startTimer();
            try {
                this.mAdapter.loadInterstitial(this.mAdUnitSettings, this);
            } catch (Throwable th) {
                logInternalError("onInterstitialInitSuccess exception: " + th.getLocalizedMessage());
                th.printStackTrace();
            }
        }
        this.mListener.onInterstitialInitSuccess(this);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialInitFailed(IronSourceError ironSourceError) {
        logAdapterCallback("onInterstitialInitFailed error" + ironSourceError.getErrorMessage() + " state=" + this.mState.name());
        if (this.mState != SMASH_STATE.INIT_IN_PROGRESS) {
            return;
        }
        stopTimer();
        setState(SMASH_STATE.NO_INIT);
        this.mListener.onInterstitialInitFailed(ironSourceError, this);
        if (isBidder()) {
            return;
        }
        this.mListener.onInterstitialAdLoadFailed(ironSourceError, this, new Date().getTime() - this.mLoadStartTime);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialAdReady() {
        logAdapterCallback("onInterstitialAdReady state=" + this.mState.name());
        stopTimer();
        if (this.mState != SMASH_STATE.LOAD_IN_PROGRESS) {
            return;
        }
        setState(SMASH_STATE.LOADED);
        this.mListener.onInterstitialAdReady(this, new Date().getTime() - this.mLoadStartTime);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialAdLoadFailed(IronSourceError ironSourceError) {
        logAdapterCallback("onInterstitialAdLoadFailed error=" + ironSourceError.getErrorMessage() + " state=" + this.mState.name());
        stopTimer();
        if (this.mState != SMASH_STATE.LOAD_IN_PROGRESS) {
            return;
        }
        setState(SMASH_STATE.LOAD_FAILED);
        this.mListener.onInterstitialAdLoadFailed(ironSourceError, this, new Date().getTime() - this.mLoadStartTime);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialAdOpened() {
        logAdapterCallback("onInterstitialAdOpened");
        this.mListener.onInterstitialAdOpened(this);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialAdClosed() {
        logAdapterCallback("onInterstitialAdClosed");
        this.mListener.onInterstitialAdClosed(this);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialAdShowSucceeded() {
        logAdapterCallback("onInterstitialAdShowSucceeded");
        this.mListener.onInterstitialAdShowSucceeded(this);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialAdShowFailed(IronSourceError ironSourceError) {
        logAdapterCallback("onInterstitialAdShowFailed error=" + ironSourceError.getErrorMessage());
        this.mListener.onInterstitialAdShowFailed(ironSourceError, this);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialAdClicked() {
        logAdapterCallback(Constants.JSMethods.ON_INTERSTITIAL_AD_CLICKED);
        this.mListener.onInterstitialAdClicked(this);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialAdVisible() {
        logAdapterCallback("onInterstitialAdVisible");
        this.mListener.onInterstitialAdVisible(this);
    }

    private void stopTimer() {
        synchronized (this.mTimerLock) {
            Timer timer = this.mTimer;
            if (timer != null) {
                timer.cancel();
                this.mTimer = null;
            }
        }
    }

    private void startTimer() {
        synchronized (this.mTimerLock) {
            logInternal("start timer");
            stopTimer();
            Timer timer = new Timer();
            this.mTimer = timer;
            timer.schedule(new TimerTask() { // from class: com.ironsource.mediationsdk.ProgIsSmash.1
                @Override // java.util.TimerTask, java.lang.Runnable
                public void run() {
                    ProgIsSmash.this.logInternal("timed out state=" + ProgIsSmash.this.mState.name() + " isBidder=" + ProgIsSmash.this.isBidder());
                    if (ProgIsSmash.this.mState != SMASH_STATE.INIT_IN_PROGRESS || !ProgIsSmash.this.isBidder()) {
                        ProgIsSmash.this.setState(SMASH_STATE.LOAD_FAILED);
                        ProgIsSmash.this.mListener.onInterstitialAdLoadFailed(ErrorBuilder.buildLoadFailedError("timed out"), ProgIsSmash.this, new Date().getTime() - ProgIsSmash.this.mLoadStartTime);
                        return;
                    }
                    ProgIsSmash.this.setState(SMASH_STATE.NO_INIT);
                }
            }, this.mLoadTimeoutSecs * 1000);
        }
    }

    private void logAdapterCallback(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, "ProgIsSmash " + getInstanceName() + " : " + str, 0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void logInternal(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "ProgIsSmash " + getInstanceName() + " : " + str, 0);
    }

    private void logInternalError(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "ProgIsSmash " + getInstanceName() + " : " + str, 3);
    }
}
