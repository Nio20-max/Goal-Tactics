package com.ironsource.mediationsdk;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.facebook.internal.ServerProtocol;
import com.ironsource.eventsmodule.EventData;
import com.ironsource.mediationsdk.AbstractSmash;
import com.ironsource.mediationsdk.IronSource;
import com.ironsource.mediationsdk.MediationInitializer;
import com.ironsource.mediationsdk.events.InterstitialEventsManager;
import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.model.InterstitialPlacement;
import com.ironsource.mediationsdk.sdk.InterstitialManagerListener;
import com.ironsource.mediationsdk.sdk.ListenersWrapper;
import com.ironsource.mediationsdk.utils.CappingManager;
import com.ironsource.mediationsdk.utils.ContextProvider;
import com.ironsource.mediationsdk.utils.DailyCappingListener;
import com.ironsource.mediationsdk.utils.DailyCappingManager;
import com.ironsource.mediationsdk.utils.ErrorBuilder;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import com.ironsource.mediationsdk.utils.SessionDepthManager;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
class InterstitialManager extends AbstractAdUnitManager implements InterstitialManagerListener, MediationInitializer.OnMediationInitializationListener, DailyCappingListener {
    private InterstitialPlacement mCurrentPlacement;
    private boolean mDidFinishToInitInterstitial;
    private ListenersWrapper mInterstitialListenersWrapper;
    private boolean mIsCurrentlyShowing;
    private long mLoadStartTime;
    private final String TAG = getClass().getName();
    private CopyOnWriteArraySet<String> mInstancesToLoad = new CopyOnWriteArraySet<>();
    private Map<String, InterstitialSmash> mInstanceIdToSmashMap = new ConcurrentHashMap();
    private CallbackThrottler mCallbackThrottler = CallbackThrottler.getInstance();
    private boolean mShouldSendAdReadyEvent = false;
    private boolean mIsLoadInterstitialInProgress = false;
    private boolean mDidCallLoadInterstitial = false;

    @Override // com.ironsource.mediationsdk.MediationInitializer.OnMediationInitializationListener
    public void onInitSuccess(List<IronSource.AD_UNIT> list, boolean z) {
    }

    InterstitialManager() {
        this.mDailyCappingManager = new DailyCappingManager(IronSourceConstants.AD_UNIT_IS_MEDIATION_STATE, this);
        this.mIsCurrentlyShowing = false;
    }

    public void setInterstitialListener(ListenersWrapper listenersWrapper) {
        this.mInterstitialListenersWrapper = listenersWrapper;
        this.mCallbackThrottler.setInterstitialListener(listenersWrapper);
    }

    public synchronized void initInterstitial(String str, String str2) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.NATIVE, this.TAG + ":initInterstitial(appKey: " + str + ", userId: " + str2 + ")", 1);
        long time = new Date().getTime();
        logMediationEvent(IronSourceConstants.IS_MANAGER_INIT_STARTED);
        this.mAppKey = str;
        this.mUserId = str2;
        int i = 0;
        for (AbstractSmash abstractSmash : this.mSmashArray) {
            if (this.mDailyCappingManager.shouldSendCapReleasedEvent(abstractSmash)) {
                logProviderEvent(250, abstractSmash, new Object[][]{new Object[]{"status", "false"}});
            }
            if (this.mDailyCappingManager.isCapped(abstractSmash)) {
                abstractSmash.setMediationState(AbstractSmash.MEDIATION_STATE.CAPPED_PER_DAY);
                i++;
            }
        }
        if (i == this.mSmashArray.size()) {
            this.mDidFinishToInitInterstitial = true;
        }
        prepareSDK5();
        for (int i2 = 0; i2 < this.mSmartLoadAmount && startNextAdapter() != null; i2++) {
        }
        logMediationEvent(IronSourceConstants.IS_MANAGER_INIT_ENDED, new Object[][]{new Object[]{"duration", Long.valueOf(new Date().getTime() - time)}});
    }

    public synchronized void loadInterstitial() {
        try {
        } catch (Exception e) {
            e.printStackTrace();
            IronSourceError ironSourceErrorBuildLoadFailedError = ErrorBuilder.buildLoadFailedError("loadInterstitial exception " + e.getMessage());
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, ironSourceErrorBuildLoadFailedError.getErrorMessage(), 3);
            this.mCallbackThrottler.onInterstitialAdLoadFailed(ironSourceErrorBuildLoadFailedError);
            if (this.mShouldSendAdReadyEvent) {
                this.mShouldSendAdReadyEvent = false;
                logMediationEvent(IronSourceConstants.IS_CALLBACK_LOAD_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(ironSourceErrorBuildLoadFailedError.getErrorCode())}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, e.getMessage()}});
            }
        }
        if (this.mIsCurrentlyShowing) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "loadInterstitial cannot be invoked while showing an ad", 3);
            ISListenerWrapper.getInstance().onInterstitialAdLoadFailed(new IronSourceError(IronSourceError.ERROR_IS_LOAD_DURING_SHOW, "loadInterstitial cannot be invoked while showing an ad"));
            return;
        }
        this.mCurrentPlacement = null;
        this.mInterstitialListenersWrapper.setInterstitialPlacement(null);
        if (!this.mIsLoadInterstitialInProgress && !this.mCallbackThrottler.hasPendingInvocation()) {
            MediationInitializer.EInitStatus currentInitStatus = MediationInitializer.getInstance().getCurrentInitStatus();
            if (currentInitStatus == MediationInitializer.EInitStatus.NOT_INIT) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "init() must be called before loadInterstitial()", 3);
                return;
            }
            if (currentInitStatus == MediationInitializer.EInitStatus.INIT_IN_PROGRESS) {
                if (MediationInitializer.getInstance().isInProgressMoreThan15Secs()) {
                    this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "init() had failed", 3);
                    this.mCallbackThrottler.onInterstitialAdLoadFailed(ErrorBuilder.buildInitFailedError("init() had failed", "Interstitial"));
                } else {
                    this.mLoadStartTime = new Date().getTime();
                    logMediationEvent(IronSourceConstants.IS_LOAD_CALLED, (Object[][]) null);
                    this.mDidCallLoadInterstitial = true;
                    this.mShouldSendAdReadyEvent = true;
                }
                return;
            }
            if (currentInitStatus == MediationInitializer.EInitStatus.INIT_FAILED) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "init() had failed", 3);
                this.mCallbackThrottler.onInterstitialAdLoadFailed(ErrorBuilder.buildInitFailedError("init() had failed", "Interstitial"));
                return;
            }
            if (this.mSmashArray.size() == 0) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "the server response does not contain interstitial data", 3);
                this.mCallbackThrottler.onInterstitialAdLoadFailed(ErrorBuilder.buildInitFailedError("the server response does not contain interstitial data", "Interstitial"));
                return;
            }
            this.mLoadStartTime = new Date().getTime();
            logMediationEvent(IronSourceConstants.IS_LOAD_CALLED, (Object[][]) null);
            this.mShouldSendAdReadyEvent = true;
            changeStateToInitiated();
            if (smashesCount(AbstractSmash.MEDIATION_STATE.INITIATED) == 0) {
                if (!this.mDidFinishToInitInterstitial) {
                    this.mDidCallLoadInterstitial = true;
                    return;
                }
                IronSourceError ironSourceErrorBuildGenericError = ErrorBuilder.buildGenericError("no ads to load");
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, ironSourceErrorBuildGenericError.getErrorMessage(), 1);
                this.mCallbackThrottler.onInterstitialAdLoadFailed(ironSourceErrorBuildGenericError);
                logMediationEvent(IronSourceConstants.IS_CALLBACK_LOAD_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(ironSourceErrorBuildGenericError.getErrorCode())}});
                this.mShouldSendAdReadyEvent = false;
                return;
            }
            this.mDidCallLoadInterstitial = true;
            this.mIsLoadInterstitialInProgress = true;
            int i = 0;
            for (AbstractSmash abstractSmash : this.mSmashArray) {
                if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.INITIATED) {
                    abstractSmash.setMediationState(AbstractSmash.MEDIATION_STATE.LOAD_PENDING);
                    loadAdapterAndSendEvent((InterstitialSmash) abstractSmash);
                    i++;
                    if (i >= this.mSmartLoadAmount) {
                        return;
                    }
                }
            }
            return;
        }
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Load Interstitial is already in progress", 3);
    }

    public void showInterstitial(String str) {
        if (this.mIsCurrentlyShowing) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "showInterstitial error: can't show ad while an ad is already showing", 3);
            this.mInterstitialListenersWrapper.onInterstitialAdShowFailed(new IronSourceError(IronSourceError.ERROR_IS_SHOW_CALLED_DURING_SHOW, "showInterstitial error: can't show ad while an ad is already showing"));
            return;
        }
        if (!this.mDidCallLoadInterstitial) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "showInterstitial failed - You need to load interstitial before showing it", 3);
            this.mInterstitialListenersWrapper.onInterstitialAdShowFailed(ErrorBuilder.buildShowFailedError("Interstitial", "showInterstitial failed - You need to load interstitial before showing it"));
            return;
        }
        if (this.mShouldTrackNetworkState && !IronSourceUtils.isNetworkConnected(ContextProvider.getInstance().getCurrentActiveActivity())) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "showInterstitial error: can't show ad when there's no internet connection", 3);
            this.mInterstitialListenersWrapper.onInterstitialAdShowFailed(ErrorBuilder.buildNoInternetConnectionShowFailError("Interstitial"));
            return;
        }
        for (int i = 0; i < this.mSmashArray.size(); i++) {
            AbstractSmash abstractSmash = this.mSmashArray.get(i);
            if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.AVAILABLE) {
                CappingManager.incrementShowCounter(ContextProvider.getInstance().getCurrentActiveActivity(), this.mCurrentPlacement);
                if (CappingManager.isPlacementCapped(ContextProvider.getInstance().getCurrentActiveActivity(), this.mCurrentPlacement) != CappingManager.ECappingStatus.NOT_CAPPED) {
                    logMediationEventWithPlacement(IronSourceConstants.IS_CAP_PLACEMENT, (Object[][]) null);
                }
                logProviderEventWithPlacement(IronSourceConstants.IS_INSTANCE_SHOW, abstractSmash, (Object[][]) null);
                this.mIsCurrentlyShowing = true;
                ((InterstitialSmash) abstractSmash).showInterstitial();
                if (abstractSmash.isCappedPerSession()) {
                    logProviderEvent(IronSourceConstants.IS_CAP_SESSION, abstractSmash);
                }
                this.mDailyCappingManager.increaseShowCounter(abstractSmash);
                if (this.mDailyCappingManager.isCapped(abstractSmash)) {
                    abstractSmash.setMediationState(AbstractSmash.MEDIATION_STATE.CAPPED_PER_DAY);
                    logProviderEvent(250, abstractSmash, new Object[][]{new Object[]{"status", ServerProtocol.DIALOG_RETURN_SCOPES_TRUE}});
                }
                this.mDidCallLoadInterstitial = false;
                if (abstractSmash.isMediationAvailable()) {
                    return;
                }
                startNextAdapter();
                return;
            }
        }
        this.mInterstitialListenersWrapper.onInterstitialAdShowFailed(ErrorBuilder.buildShowFailedError("Interstitial", "showInterstitial failed - No adapters ready to show"));
    }

    public synchronized boolean isInterstitialReady() {
        if (this.mShouldTrackNetworkState && !IronSourceUtils.isNetworkConnected(ContextProvider.getInstance().getCurrentActiveActivity())) {
            return false;
        }
        for (AbstractSmash abstractSmash : this.mSmashArray) {
            if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.AVAILABLE && ((InterstitialSmash) abstractSmash).isInterstitialReady()) {
                return true;
            }
        }
        return false;
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialManagerListener
    public synchronized void onInterstitialInitSuccess(InterstitialSmash interstitialSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, interstitialSmash.getInstanceName() + " :onInterstitialInitSuccess()", 1);
        logProviderEvent(IronSourceConstants.IS_INSTANCE_INIT_SUCCESS, interstitialSmash);
        this.mDidFinishToInitInterstitial = true;
        if (this.mDidCallLoadInterstitial && smashesCount(AbstractSmash.MEDIATION_STATE.AVAILABLE, AbstractSmash.MEDIATION_STATE.LOAD_PENDING) < this.mSmartLoadAmount) {
            interstitialSmash.setMediationState(AbstractSmash.MEDIATION_STATE.LOAD_PENDING);
            loadAdapterAndSendEvent(interstitialSmash);
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialManagerListener
    public synchronized void onInterstitialInitFailed(IronSourceError ironSourceError, InterstitialSmash interstitialSmash) {
        try {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, interstitialSmash.getInstanceName() + ":onInterstitialInitFailed(" + ironSourceError + ")", 1);
            logProviderEvent(IronSourceConstants.IS_INSTANCE_INIT_FAILED, interstitialSmash, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, ironSourceError.getErrorMessage()}});
            if (smashesCount(AbstractSmash.MEDIATION_STATE.INIT_FAILED) >= this.mSmashArray.size()) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.NATIVE, "Smart Loading - initialization failed - no adapters are initiated and no more left to init, error: " + ironSourceError.getErrorMessage(), 2);
                if (this.mDidCallLoadInterstitial) {
                    this.mCallbackThrottler.onInterstitialAdLoadFailed(ErrorBuilder.buildGenericError("no ads to show"));
                    logMediationEvent(IronSourceConstants.IS_CALLBACK_LOAD_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 510}});
                    this.mShouldSendAdReadyEvent = false;
                }
                this.mDidFinishToInitInterstitial = true;
            } else {
                if (startNextAdapter() == null && this.mDidCallLoadInterstitial && smashesCount(AbstractSmash.MEDIATION_STATE.INIT_FAILED, AbstractSmash.MEDIATION_STATE.NOT_AVAILABLE, AbstractSmash.MEDIATION_STATE.CAPPED_PER_SESSION, AbstractSmash.MEDIATION_STATE.CAPPED_PER_DAY, AbstractSmash.MEDIATION_STATE.EXHAUSTED) >= this.mSmashArray.size()) {
                    this.mCallbackThrottler.onInterstitialAdLoadFailed(new IronSourceError(509, "No ads to show"));
                    logMediationEvent(IronSourceConstants.IS_CALLBACK_LOAD_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 509}});
                    this.mShouldSendAdReadyEvent = false;
                }
                completeIterationRound();
            }
        } catch (Exception e) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, "onInterstitialInitFailed(error:" + ironSourceError + ", provider:" + interstitialSmash.getName() + ")", e);
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialManagerListener
    public synchronized void onInterstitialAdReady(InterstitialSmash interstitialSmash, long j) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, interstitialSmash.getInstanceName() + ":onInterstitialAdReady()", 1);
        logProviderEvent(IronSourceConstants.IS_INSTANCE_LOAD_SUCCESS, interstitialSmash, new Object[][]{new Object[]{"duration", Long.valueOf(j)}});
        long time = new Date().getTime() - this.mLoadStartTime;
        interstitialSmash.setMediationState(AbstractSmash.MEDIATION_STATE.AVAILABLE);
        this.mIsLoadInterstitialInProgress = false;
        if (this.mShouldSendAdReadyEvent) {
            this.mShouldSendAdReadyEvent = false;
            this.mInterstitialListenersWrapper.onInterstitialAdReady();
            logMediationEvent(IronSourceConstants.IS_CALLBACK_LOAD_SUCCESS, new Object[][]{new Object[]{"duration", Long.valueOf(time)}});
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialManagerListener
    public synchronized void onInterstitialAdLoadFailed(IronSourceError ironSourceError, InterstitialSmash interstitialSmash, long j) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, interstitialSmash.getInstanceName() + ":onInterstitialAdLoadFailed(" + ironSourceError + ")", 1);
        IronSourceUtils.sendAutomationLog(interstitialSmash.getInstanceName() + ":onInterstitialAdLoadFailed(" + ironSourceError + ")");
        logProviderEvent(IronSourceConstants.IS_INSTANCE_LOAD_FAILED, interstitialSmash, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(ironSourceError.getErrorCode())}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, ironSourceError.getErrorMessage()}, new Object[]{"duration", Long.valueOf(j)}});
        interstitialSmash.setMediationState(AbstractSmash.MEDIATION_STATE.NOT_AVAILABLE);
        int iSmashesCount = smashesCount(AbstractSmash.MEDIATION_STATE.AVAILABLE, AbstractSmash.MEDIATION_STATE.LOAD_PENDING);
        if (iSmashesCount >= this.mSmartLoadAmount) {
            return;
        }
        for (AbstractSmash abstractSmash : this.mSmashArray) {
            if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.INITIATED) {
                abstractSmash.setMediationState(AbstractSmash.MEDIATION_STATE.LOAD_PENDING);
                loadAdapterAndSendEvent((InterstitialSmash) abstractSmash);
                return;
            }
        }
        if (startNextAdapter() != null) {
            return;
        }
        if (this.mDidCallLoadInterstitial && iSmashesCount + smashesCount(AbstractSmash.MEDIATION_STATE.INIT_PENDING) == 0) {
            completeIterationRound();
            this.mIsLoadInterstitialInProgress = false;
            this.mCallbackThrottler.onInterstitialAdLoadFailed(new IronSourceError(509, "No ads to show"));
            logMediationEvent(IronSourceConstants.IS_CALLBACK_LOAD_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 509}});
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialManagerListener
    public void onInterstitialAdOpened(InterstitialSmash interstitialSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, interstitialSmash.getInstanceName() + ":onInterstitialAdOpened()", 1);
        logProviderEventWithPlacement(IronSourceConstants.IS_INSTANCE_OPENED, interstitialSmash, (Object[][]) null);
        this.mInterstitialListenersWrapper.onInterstitialAdOpened();
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialManagerListener
    public void onInterstitialAdClosed(InterstitialSmash interstitialSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, interstitialSmash.getInstanceName() + ":onInterstitialAdClosed()", 1);
        this.mIsCurrentlyShowing = false;
        logProviderEventWithPlacement(IronSourceConstants.IS_INSTANCE_CLOSED, interstitialSmash, new Object[][]{new Object[]{"sessionDepth", Integer.valueOf(SessionDepthManager.getInstance().getSessionDepth(2))}});
        SessionDepthManager.getInstance().increaseSessionDepth(2);
        this.mInterstitialListenersWrapper.onInterstitialAdClosed();
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialManagerListener
    public void onInterstitialAdShowSucceeded(InterstitialSmash interstitialSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, interstitialSmash.getInstanceName() + ":onInterstitialAdShowSucceeded()", 1);
        logProviderEventWithPlacement(IronSourceConstants.IS_INSTANCE_SHOW_SUCCESS, interstitialSmash, (Object[][]) null);
        boolean z = false;
        for (AbstractSmash abstractSmash : this.mSmashArray) {
            if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.AVAILABLE) {
                completeAdapterShow(abstractSmash);
                z = true;
            }
        }
        if (!z && (interstitialSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.CAPPED_PER_SESSION || interstitialSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.EXHAUSTED || interstitialSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.CAPPED_PER_DAY)) {
            completeIterationRound();
        }
        changeStateToInitiated();
        this.mInterstitialListenersWrapper.onInterstitialAdShowSucceeded();
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialManagerListener
    public void onInterstitialAdShowFailed(IronSourceError ironSourceError, InterstitialSmash interstitialSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, interstitialSmash.getInstanceName() + ":onInterstitialAdShowFailed(" + ironSourceError + ")", 1);
        logProviderEventWithPlacement(IronSourceConstants.IS_INSTANCE_SHOW_FAILED, interstitialSmash, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(ironSourceError.getErrorCode())}});
        this.mIsCurrentlyShowing = false;
        completeAdapterShow(interstitialSmash);
        Iterator<AbstractSmash> it = this.mSmashArray.iterator();
        while (it.hasNext()) {
            if (it.next().getMediationState() == AbstractSmash.MEDIATION_STATE.AVAILABLE) {
                this.mDidCallLoadInterstitial = true;
                InterstitialPlacement interstitialPlacement = this.mCurrentPlacement;
                showInterstitial(interstitialPlacement != null ? interstitialPlacement.getPlacementName() : "");
                return;
            }
        }
        this.mInterstitialListenersWrapper.onInterstitialAdShowFailed(ironSourceError);
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialManagerListener
    public void onInterstitialAdClicked(InterstitialSmash interstitialSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, interstitialSmash.getInstanceName() + ":onInterstitialAdClicked()", 1);
        logProviderEventWithPlacement(IronSourceConstants.IS_INSTANCE_CLICKED, interstitialSmash, (Object[][]) null);
        this.mInterstitialListenersWrapper.onInterstitialAdClicked();
    }

    @Override // com.ironsource.mediationsdk.sdk.InterstitialManagerListener
    public void onInterstitialAdVisible(InterstitialSmash interstitialSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, interstitialSmash.getInstanceName() + ":onInterstitialAdVisible()", 1);
    }

    @Override // com.ironsource.mediationsdk.AbstractAdUnitManager
    void shouldTrackNetworkState(Context context, boolean z) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, this.TAG + " Should Track Network State: " + z, 0);
        this.mShouldTrackNetworkState = z;
    }

    @Override // com.ironsource.mediationsdk.MediationInitializer.OnMediationInitializationListener
    public void onInitFailed(String str) {
        if (this.mDidCallLoadInterstitial) {
            this.mCallbackThrottler.onInterstitialAdLoadFailed(ErrorBuilder.buildInitFailedError("init() had failed", "Interstitial"));
            this.mDidCallLoadInterstitial = false;
            this.mIsLoadInterstitialInProgress = false;
        }
    }

    @Override // com.ironsource.mediationsdk.MediationInitializer.OnMediationInitializationListener
    public void onStillInProgressAfter15Secs() {
        if (this.mDidCallLoadInterstitial) {
            IronSourceError ironSourceErrorBuildInitFailedError = ErrorBuilder.buildInitFailedError("init() had failed", "Interstitial");
            this.mCallbackThrottler.onInterstitialAdLoadFailed(ironSourceErrorBuildInitFailedError);
            this.mDidCallLoadInterstitial = false;
            this.mIsLoadInterstitialInProgress = false;
            if (this.mShouldSendAdReadyEvent) {
                logMediationEvent(IronSourceConstants.IS_CALLBACK_LOAD_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(ironSourceErrorBuildInitFailedError.getErrorCode())}});
                this.mShouldSendAdReadyEvent = false;
            }
        }
    }

    private boolean isIterationRoundComplete() {
        for (AbstractSmash abstractSmash : this.mSmashArray) {
            if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.NOT_INITIATED || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.INIT_PENDING || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.INITIATED || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.LOAD_PENDING || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.AVAILABLE) {
                return false;
            }
        }
        return true;
    }

    private void completeIterationRound() {
        if (isIterationRoundComplete()) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "Reset Iteration", 0);
            for (AbstractSmash abstractSmash : this.mSmashArray) {
                if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.EXHAUSTED) {
                    abstractSmash.completeIteration();
                }
            }
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "End of Reset Iteration", 0);
        }
    }

    private void completeAdapterShow(AbstractSmash abstractSmash) {
        if (!abstractSmash.isMediationAvailable()) {
            startNextAdapter();
            completeIterationRound();
        } else {
            abstractSmash.setMediationState(AbstractSmash.MEDIATION_STATE.INITIATED);
        }
    }

    private AbstractAdapter startNextAdapter() {
        AbstractAdapter abstractAdapterStartAdapter = null;
        int i = 0;
        for (int i2 = 0; i2 < this.mSmashArray.size() && abstractAdapterStartAdapter == null; i2++) {
            if (this.mSmashArray.get(i2).getMediationState() == AbstractSmash.MEDIATION_STATE.AVAILABLE || this.mSmashArray.get(i2).getMediationState() == AbstractSmash.MEDIATION_STATE.INITIATED || this.mSmashArray.get(i2).getMediationState() == AbstractSmash.MEDIATION_STATE.INIT_PENDING || this.mSmashArray.get(i2).getMediationState() == AbstractSmash.MEDIATION_STATE.LOAD_PENDING) {
                i++;
                if (i >= this.mSmartLoadAmount) {
                    break;
                }
            } else if (this.mSmashArray.get(i2).getMediationState() == AbstractSmash.MEDIATION_STATE.NOT_INITIATED && (abstractAdapterStartAdapter = startAdapter((InterstitialSmash) this.mSmashArray.get(i2))) == null) {
                this.mSmashArray.get(i2).setMediationState(AbstractSmash.MEDIATION_STATE.INIT_FAILED);
            }
        }
        return abstractAdapterStartAdapter;
    }

    private synchronized AbstractAdapter startAdapter(InterstitialSmash interstitialSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.NATIVE, this.TAG + ":startAdapter(" + interstitialSmash.getName() + ")", 1);
        AbstractAdapter adapter = AdapterRepository.getInstance().getAdapter(interstitialSmash.mAdapterConfigs, interstitialSmash.mAdapterConfigs.getInterstitialSettings());
        if (adapter == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, interstitialSmash.getInstanceName() + " is configured in IronSource's platform, but the adapter is not integrated", 2);
            return null;
        }
        interstitialSmash.setAdapterForSmash(adapter);
        interstitialSmash.setMediationState(AbstractSmash.MEDIATION_STATE.INIT_PENDING);
        setCustomParams(interstitialSmash);
        try {
            interstitialSmash.initInterstitial(this.mAppKey, this.mUserId);
            return adapter;
        } catch (Throwable th) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, this.TAG + "failed to init adapter: " + interstitialSmash.getName() + "v", th);
            interstitialSmash.setMediationState(AbstractSmash.MEDIATION_STATE.INIT_FAILED);
            return null;
        }
    }

    void setCurrentPlacement(InterstitialPlacement interstitialPlacement) {
        this.mCurrentPlacement = interstitialPlacement;
        this.mInterstitialListenersWrapper.setInterstitialPlacement(interstitialPlacement);
    }

    private synchronized void loadAdapterAndSendEvent(InterstitialSmash interstitialSmash) {
        logProviderEvent(IronSourceConstants.IS_INSTANCE_LOAD, interstitialSmash, (Object[][]) null);
        interstitialSmash.loadInterstitial();
    }

    private synchronized void changeStateToInitiatedForInstanceId(String str) {
        for (AbstractSmash abstractSmash : this.mSmashArray) {
            if (abstractSmash.getSubProviderId().equals(str) && (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.AVAILABLE || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.LOAD_PENDING || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.NOT_AVAILABLE)) {
                abstractSmash.setMediationState(AbstractSmash.MEDIATION_STATE.INITIATED);
                break;
            }
        }
    }

    private synchronized void changeStateToInitiated() {
        for (AbstractSmash abstractSmash : this.mSmashArray) {
            if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.AVAILABLE || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.LOAD_PENDING || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.NOT_AVAILABLE) {
                abstractSmash.setMediationState(AbstractSmash.MEDIATION_STATE.INITIATED);
            }
        }
    }

    private void logMediationEvent(int i) {
        logMediationEvent(i, (Object[][]) null);
    }

    private void logMediationEvent(int i, Object[][] objArr) {
        logMediationEvent(i, objArr, false);
    }

    private void logMediationEventWithPlacement(int i, Object[][] objArr) {
        logMediationEvent(i, objArr, true);
    }

    private void logMediationEvent(int i, Object[][] objArr, boolean z) {
        JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(false);
        if (z) {
            try {
                InterstitialPlacement interstitialPlacement = this.mCurrentPlacement;
                if (interstitialPlacement != null && !TextUtils.isEmpty(interstitialPlacement.getPlacementName())) {
                    mediationAdditionalData.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, this.mCurrentPlacement.getPlacementName());
                }
            } catch (Exception e) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "InterstitialManager logMediationEvent " + Log.getStackTraceString(e), 3);
            }
        }
        if (objArr != null) {
            for (Object[] objArr2 : objArr) {
                mediationAdditionalData.put(objArr2[0].toString(), objArr2[1]);
            }
        }
        InterstitialEventsManager.getInstance().log(new EventData(i, mediationAdditionalData));
    }

    private void logProviderEvent(int i, AbstractSmash abstractSmash) {
        logProviderEvent(i, abstractSmash, (Object[][]) null);
    }

    private void logProviderEvent(int i, AbstractSmash abstractSmash, Object[][] objArr) {
        logProviderEvent(i, abstractSmash, objArr, false);
    }

    private void logProviderEventWithPlacement(int i, AbstractSmash abstractSmash, Object[][] objArr) {
        logProviderEvent(i, abstractSmash, objArr, true);
    }

    private void logProviderEvent(int i, AbstractSmash abstractSmash, Object[][] objArr, boolean z) {
        JSONObject providerAdditionalData = IronSourceUtils.getProviderAdditionalData(abstractSmash);
        if (z) {
            try {
                InterstitialPlacement interstitialPlacement = this.mCurrentPlacement;
                if (interstitialPlacement != null && !TextUtils.isEmpty(interstitialPlacement.getPlacementName())) {
                    providerAdditionalData.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, this.mCurrentPlacement.getPlacementName());
                }
            } catch (Exception e) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "InterstitialManager logProviderEvent " + Log.getStackTraceString(e), 3);
            }
        }
        if (objArr != null) {
            for (Object[] objArr2 : objArr) {
                providerAdditionalData.put(objArr2[0].toString(), objArr2[1]);
            }
        }
        InterstitialEventsManager.getInstance().log(new EventData(i, providerAdditionalData));
    }

    private int smashesCount(AbstractSmash.MEDIATION_STATE... mediation_stateArr) {
        int i = 0;
        for (AbstractSmash abstractSmash : this.mSmashArray) {
            for (AbstractSmash.MEDIATION_STATE mediation_state : mediation_stateArr) {
                if (abstractSmash.getMediationState() == mediation_state) {
                    i++;
                }
            }
        }
        return i;
    }

    @Override // com.ironsource.mediationsdk.utils.DailyCappingListener
    public void onDailyCapReleased() {
        if (this.mSmashArray != null) {
            for (AbstractSmash abstractSmash : this.mSmashArray) {
                if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.CAPPED_PER_DAY) {
                    logProviderEvent(250, abstractSmash, new Object[][]{new Object[]{"status", "false"}});
                    if (abstractSmash.isCappedPerSession()) {
                        abstractSmash.setMediationState(AbstractSmash.MEDIATION_STATE.CAPPED_PER_SESSION);
                    } else if (abstractSmash.isExhausted()) {
                        abstractSmash.setMediationState(AbstractSmash.MEDIATION_STATE.EXHAUSTED);
                    } else {
                        abstractSmash.setMediationState(AbstractSmash.MEDIATION_STATE.INITIATED);
                    }
                }
            }
        }
    }

    public void setDelayLoadFailureNotificationInSeconds(int i) {
        this.mCallbackThrottler.setDelayLoadFailureNotificationInSeconds(i);
    }

    private void prepareSDK5() {
        for (int i = 0; i < this.mSmashArray.size(); i++) {
            String providerTypeForReflection = this.mSmashArray.get(i).mAdapterConfigs.getProviderTypeForReflection();
            if (providerTypeForReflection.equalsIgnoreCase(IronSourceConstants.IRONSOURCE_CONFIG_NAME) || providerTypeForReflection.equalsIgnoreCase(IronSourceConstants.SUPERSONIC_CONFIG_NAME)) {
                AdapterRepository.getInstance().getAdapter(this.mSmashArray.get(i).mAdapterConfigs, this.mSmashArray.get(i).mAdapterConfigs.getInterstitialSettings());
                return;
            }
        }
    }
}
