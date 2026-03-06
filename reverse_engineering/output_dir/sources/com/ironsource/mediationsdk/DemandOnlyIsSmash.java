package com.ironsource.mediationsdk;

import com.ironsource.mediationsdk.DemandOnlySmash;
import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.model.AdapterConfig;
import com.ironsource.mediationsdk.model.ProviderSettings;
import com.ironsource.mediationsdk.sdk.DemandOnlyIsManagerListener;
import com.ironsource.mediationsdk.sdk.InterstitialSmashListener;
import com.ironsource.sdk.constants.Constants;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;

/* JADX INFO: loaded from: classes2.dex */
public class DemandOnlyIsSmash extends DemandOnlySmash implements InterstitialSmashListener {
    private DemandOnlyIsManagerListener mListener;
    private long mLoadStartTime;

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialAdShowSucceeded() {
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialInitFailed(IronSourceError ironSourceError) {
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialInitSuccess() {
    }

    public DemandOnlyIsSmash(String str, String str2, ProviderSettings providerSettings, DemandOnlyIsManagerListener demandOnlyIsManagerListener, int i, AbstractAdapter abstractAdapter) {
        super(new AdapterConfig(providerSettings, providerSettings.getInterstitialSettings()), abstractAdapter);
        this.mListener = demandOnlyIsManagerListener;
        this.mLoadTimeoutSecs = i;
        this.mAdapter.initInterstitial(str, str2, this.mAdUnitSettings, this);
    }

    public void loadInterstitial(String str, String str2, List<String> list) {
        logInternal("loadInterstitial state=" + getStateString());
        DemandOnlySmash.SMASH_STATE smash_stateCompareAndSetState = compareAndSetState(new DemandOnlySmash.SMASH_STATE[]{DemandOnlySmash.SMASH_STATE.NOT_LOADED, DemandOnlySmash.SMASH_STATE.LOADED}, DemandOnlySmash.SMASH_STATE.LOAD_IN_PROGRESS);
        if (smash_stateCompareAndSetState == DemandOnlySmash.SMASH_STATE.NOT_LOADED || smash_stateCompareAndSetState == DemandOnlySmash.SMASH_STATE.LOADED) {
            this.mLoadStartTime = new Date().getTime();
            startLoadTimer();
            if (isBidder()) {
                this.mAuctionId = str2;
                this.mBUrl = list;
                this.mAdapter.loadInterstitialForBidding(this.mAdUnitSettings, this, str);
                return;
            }
            this.mAdapter.loadInterstitial(this.mAdUnitSettings, this);
            return;
        }
        if (smash_stateCompareAndSetState == DemandOnlySmash.SMASH_STATE.LOAD_IN_PROGRESS) {
            this.mListener.onInterstitialAdLoadFailed(new IronSourceError(IronSourceError.ERROR_DO_IS_LOAD_ALREADY_IN_PROGRESS, "load already in progress"), this, 0L);
        } else {
            this.mListener.onInterstitialAdLoadFailed(new IronSourceError(IronSourceError.ERROR_DO_IS_LOAD_ALREADY_IN_PROGRESS, "cannot load because show is in progress"), this, 0L);
        }
    }

    public void showInterstitial() {
        logInternal("showInterstitial state=" + getStateString());
        if (compareAndSetState(DemandOnlySmash.SMASH_STATE.LOADED, DemandOnlySmash.SMASH_STATE.SHOW_IN_PROGRESS)) {
            this.mAdapter.showInterstitial(this.mAdUnitSettings, this);
        } else {
            this.mListener.onInterstitialAdShowFailed(new IronSourceError(IronSourceError.ERROR_DO_IS_CALL_LOAD_BEFORE_SHOW, "load must be called before show"), this);
        }
    }

    public boolean isInterstitialReady() {
        return this.mAdapter.isInterstitialReady(this.mAdUnitSettings);
    }

    private void startLoadTimer() {
        logInternal("start timer");
        startTimer(new TimerTask() { // from class: com.ironsource.mediationsdk.DemandOnlyIsSmash.1
            @Override // java.util.TimerTask, java.lang.Runnable
            public void run() {
                DemandOnlyIsSmash.this.logInternal("load timed out state=" + DemandOnlyIsSmash.this.getStateString());
                if (DemandOnlyIsSmash.this.compareAndSetState(DemandOnlySmash.SMASH_STATE.LOAD_IN_PROGRESS, DemandOnlySmash.SMASH_STATE.NOT_LOADED)) {
                    DemandOnlyIsSmash.this.mListener.onInterstitialAdLoadFailed(new IronSourceError(IronSourceError.ERROR_DO_IS_LOAD_TIMED_OUT, "load timed out"), DemandOnlyIsSmash.this, new Date().getTime() - DemandOnlyIsSmash.this.mLoadStartTime);
                }
            }
        });
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialAdReady() {
        logAdapterCallback("onInterstitialAdReady state=" + getStateString());
        stopTimer();
        if (compareAndSetState(DemandOnlySmash.SMASH_STATE.LOAD_IN_PROGRESS, DemandOnlySmash.SMASH_STATE.LOADED)) {
            this.mListener.onInterstitialAdReady(this, new Date().getTime() - this.mLoadStartTime);
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialAdLoadFailed(IronSourceError ironSourceError) {
        logAdapterCallback("onInterstitialAdLoadFailed error=" + ironSourceError.getErrorMessage() + " state=" + getStateString());
        stopTimer();
        if (compareAndSetState(DemandOnlySmash.SMASH_STATE.LOAD_IN_PROGRESS, DemandOnlySmash.SMASH_STATE.NOT_LOADED)) {
            this.mListener.onInterstitialAdLoadFailed(ironSourceError, this, new Date().getTime() - this.mLoadStartTime);
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialAdOpened() {
        logAdapterCallback("onInterstitialAdOpened");
        this.mListener.onInterstitialAdOpened(this);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialAdClosed() {
        setState(DemandOnlySmash.SMASH_STATE.NOT_LOADED);
        logAdapterCallback("onInterstitialAdClosed");
        this.mListener.onInterstitialAdClosed(this);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialSmashListener
    public void onInterstitialAdShowFailed(IronSourceError ironSourceError) {
        setState(DemandOnlySmash.SMASH_STATE.NOT_LOADED);
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

    private void logAdapterCallback(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, "DemandOnlyInterstitialSmash " + this.mAdapterConfig.getProviderName() + " : " + str, 0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void logInternal(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "DemandOnlyInterstitialSmash " + this.mAdapterConfig.getProviderName() + " : " + str, 0);
    }
}
