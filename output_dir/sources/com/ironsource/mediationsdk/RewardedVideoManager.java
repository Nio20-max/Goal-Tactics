package com.ironsource.mediationsdk;

import android.content.Context;
import android.content.IntentFilter;
import android.text.TextUtils;
import android.util.Log;
import com.facebook.internal.ServerProtocol;
import com.ironsource.environment.NetworkStateReceiver;
import com.ironsource.eventsmodule.EventData;
import com.ironsource.mediationsdk.AbstractSmash;
import com.ironsource.mediationsdk.events.RewardedVideoEventsManager;
import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.model.Placement;
import com.ironsource.mediationsdk.sdk.ListenersWrapper;
import com.ironsource.mediationsdk.sdk.RewardedVideoManagerListener;
import com.ironsource.mediationsdk.server.Server;
import com.ironsource.mediationsdk.utils.CappingManager;
import com.ironsource.mediationsdk.utils.ContextProvider;
import com.ironsource.mediationsdk.utils.DailyCappingListener;
import com.ironsource.mediationsdk.utils.DailyCappingManager;
import com.ironsource.mediationsdk.utils.ErrorBuilder;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import com.ironsource.mediationsdk.utils.SessionDepthManager;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
class RewardedVideoManager extends AbstractAdUnitManager implements RewardedVideoManagerListener, NetworkStateReceiver.NetworkStateReceiverListener, DailyCappingListener {
    private Placement mCurrentPlacement;
    private ListenersWrapper mListenersWrapper;
    private int mManualLoadInterval;
    private NetworkStateReceiver mNetworkStateReceiver;
    private final String TAG = getClass().getSimpleName();
    private Timer mTimer = null;
    private boolean mPauseSmartLoadDueToNetworkUnavailability = false;
    private boolean mIsUltraEventsEnabled = false;
    private boolean mIsCurrentlyShowing = false;
    private boolean mShouldSendMediationLoadSuccessEvent = false;
    private long mLoadStartTime = new Date().getTime();
    private List<AbstractSmash.MEDIATION_STATE> mStatesToIgnore = Arrays.asList(AbstractSmash.MEDIATION_STATE.INIT_FAILED, AbstractSmash.MEDIATION_STATE.CAPPED_PER_SESSION, AbstractSmash.MEDIATION_STATE.EXHAUSTED, AbstractSmash.MEDIATION_STATE.CAPPED_PER_DAY);

    RewardedVideoManager() {
        this.mDailyCappingManager = new DailyCappingManager("rewarded_video", this);
    }

    public void setRewardedVideoListener(ListenersWrapper listenersWrapper) {
        this.mListenersWrapper = listenersWrapper;
    }

    public synchronized void initRewardedVideo(String str, String str2) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, this.TAG + ":initRewardedVideo(appKey: " + str + ", userId: " + str2 + ")", 1);
        long time = new Date().getTime();
        logMediationEvent(IronSourceConstants.RV_MANAGER_INIT_STARTED);
        this.mAppKey = str;
        this.mUserId = str2;
        int i = 0;
        for (AbstractSmash abstractSmash : this.mSmashArray) {
            if (this.mDailyCappingManager.shouldSendCapReleasedEvent(abstractSmash)) {
                logProviderEvent(IronSourceConstants.REWARDED_VIDEO_DAILY_CAPPED, abstractSmash, new Object[][]{new Object[]{"status", "false"}});
            }
            if (this.mDailyCappingManager.isCapped(abstractSmash)) {
                abstractSmash.setMediationState(AbstractSmash.MEDIATION_STATE.CAPPED_PER_DAY);
                i++;
            }
        }
        if (i == this.mSmashArray.size()) {
            this.mListenersWrapper.onRewardedVideoAvailabilityChanged(false);
            return;
        }
        logMediationEvent(1000);
        this.mListenersWrapper.setRvPlacement(null);
        this.mShouldSendMediationLoadSuccessEvent = true;
        this.mLoadStartTime = new Date().getTime();
        logMediationEvent(IronSourceConstants.RV_MANAGER_INIT_ENDED, new Object[][]{new Object[]{"duration", Long.valueOf(new Date().getTime() - time)}});
        prepareSDK5();
        for (int i2 = 0; i2 < this.mSmartLoadAmount && i2 < this.mSmashArray.size() && loadNextAdapter() != null; i2++) {
        }
    }

    public synchronized void showRewardedVideo(String str) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, this.TAG + ":showRewardedVideo(placementName: " + str + ")", 1);
        this.mListenersWrapper.setRvPlacement(str);
        logMediationEvent(IronSourceConstants.RV_API_SHOW_CALLED, new Object[][]{new Object[]{IronSourceConstants.EVENTS_PLACEMENT_NAME, str}});
        if (this.mIsCurrentlyShowing) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "showRewardedVideo error: can't show ad while an ad is already showing", 3);
            this.mListenersWrapper.onRewardedVideoAdShowFailed(new IronSourceError(IronSourceError.ERROR_RV_SHOW_CALLED_DURING_SHOW, "showRewardedVideo error: can't show ad while an ad is already showing"));
            return;
        }
        if (this.mShouldTrackNetworkState && !IronSourceUtils.isNetworkConnected(ContextProvider.getInstance().getCurrentActiveActivity())) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "showRewardedVideo error: can't show ad when there's no internet connection", 3);
            this.mListenersWrapper.onRewardedVideoAdShowFailed(ErrorBuilder.buildNoInternetConnectionShowFailError(IronSourceConstants.REWARDED_VIDEO_AD_UNIT));
            return;
        }
        int i = 0;
        int i2 = 0;
        for (int i3 = 0; i3 < this.mSmashArray.size(); i3++) {
            AbstractSmash abstractSmash = this.mSmashArray.get(i3);
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "showRewardedVideo, iterating on: " + abstractSmash.getInstanceName() + ", Status: " + abstractSmash.getMediationState(), 0);
            if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.AVAILABLE) {
                if (((RewardedVideoSmash) abstractSmash).isRewardedVideoAvailable()) {
                    showAdapter(abstractSmash, i3);
                    if (this.mCanShowPremium && !abstractSmash.equals(getPremiumSmash())) {
                        disablePremiumForCurrentSession();
                    }
                    if (abstractSmash.isCappedPerSession()) {
                        abstractSmash.setMediationState(AbstractSmash.MEDIATION_STATE.CAPPED_PER_SESSION);
                        logProviderEvent(IronSourceConstants.RV_CAP_SESSION, abstractSmash, (Object[][]) null);
                        completeAdapterCap();
                    } else if (this.mDailyCappingManager.isCapped(abstractSmash)) {
                        abstractSmash.setMediationState(AbstractSmash.MEDIATION_STATE.CAPPED_PER_DAY);
                        logProviderEvent(IronSourceConstants.REWARDED_VIDEO_DAILY_CAPPED, abstractSmash, new Object[][]{new Object[]{"status", ServerProtocol.DIALOG_RETURN_SCOPES_TRUE}});
                        completeAdapterCap();
                    } else if (abstractSmash.isExhausted()) {
                        loadNextAdapter();
                        completeIterationRound();
                    }
                    return;
                }
                onRewardedVideoAvailabilityChanged(false, (RewardedVideoSmash) abstractSmash);
                Exception exc = new Exception("FailedToShowVideoException");
                this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.INTERNAL, abstractSmash.getInstanceName() + " Failed to show video", exc);
            } else if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.CAPPED_PER_SESSION || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.CAPPED_PER_DAY) {
                i++;
            } else if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.NOT_AVAILABLE) {
                i2++;
            }
        }
        if (isBackFillAvailable()) {
            showAdapter(getBackfillSmash(), this.mSmashArray.size());
        } else if (i + i2 == this.mSmashArray.size()) {
            this.mListenersWrapper.onRewardedVideoAdShowFailed(ErrorBuilder.buildNoAdsToShowError(IronSourceConstants.REWARDED_VIDEO_AD_UNIT));
        }
    }

    public synchronized boolean isRewardedVideoAvailable() {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, this.TAG + ":isRewardedVideoAvailable()", 1);
        if (this.mShouldTrackNetworkState && !IronSourceUtils.isNetworkConnected(ContextProvider.getInstance().getCurrentActiveActivity())) {
            return false;
        }
        for (AbstractSmash abstractSmash : this.mSmashArray) {
            if (abstractSmash.isMediationAvailable() && ((RewardedVideoSmash) abstractSmash).isRewardedVideoAvailable()) {
                return true;
            }
        }
        return false;
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoManagerListener
    public void onRewardedVideoAdShowFailed(IronSourceError ironSourceError, RewardedVideoSmash rewardedVideoSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, rewardedVideoSmash.getInstanceName() + ":onRewardedVideoAdShowFailed(" + ironSourceError + ")", 1);
        this.mIsCurrentlyShowing = false;
        logProviderEvent(IronSourceConstants.RV_INSTANCE_SHOW_FAILED, rewardedVideoSmash, new Object[][]{new Object[]{IronSourceConstants.EVENTS_PLACEMENT_NAME, getCurrentPlacementName()}, new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(ironSourceError.getErrorCode())}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, ironSourceError.getErrorMessage()}, new Object[]{"sessionDepth", Integer.valueOf(rewardedVideoSmash != null ? rewardedVideoSmash.mSessionDepth : SessionDepthManager.getInstance().getSessionDepth(1))}});
        sendMediationLoadEvents();
        this.mListenersWrapper.onRewardedVideoAdShowFailed(ironSourceError);
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoManagerListener
    public void onRewardedVideoAdOpened(RewardedVideoSmash rewardedVideoSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, rewardedVideoSmash.getInstanceName() + ":onRewardedVideoAdOpened()", 1);
        logProviderEvent(1005, rewardedVideoSmash, new Object[][]{new Object[]{IronSourceConstants.EVENTS_PLACEMENT_NAME, getCurrentPlacementName()}, new Object[]{"sessionDepth", Integer.valueOf(rewardedVideoSmash.mSessionDepth)}});
        this.mListenersWrapper.onRewardedVideoAdOpened();
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoManagerListener
    public void onRewardedVideoAdClosed(RewardedVideoSmash rewardedVideoSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, rewardedVideoSmash.getInstanceName() + ":onRewardedVideoAdClosed()", 1);
        this.mIsCurrentlyShowing = false;
        StringBuilder sb = new StringBuilder();
        try {
            for (AbstractSmash abstractSmash : this.mSmashArray) {
                if (((RewardedVideoSmash) abstractSmash).isRewardedVideoAvailable()) {
                    sb.append(abstractSmash.getInstanceName() + ";");
                }
            }
        } catch (Throwable unused) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "Failed to check RV availability", 0);
        }
        Object[][] objArr = new Object[3][];
        objArr[0] = new Object[]{IronSourceConstants.EVENTS_PLACEMENT_NAME, getCurrentPlacementName()};
        Object[] objArr2 = new Object[2];
        objArr2[0] = IronSourceConstants.EVENTS_EXT1;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("otherRVAvailable = ");
        sb2.append(sb.length() > 0 ? "true|" + ((Object) sb) : "false");
        objArr2[1] = sb2.toString();
        objArr[1] = objArr2;
        objArr[2] = new Object[]{"sessionDepth", Integer.valueOf(rewardedVideoSmash.mSessionDepth)};
        logProviderEvent(IronSourceConstants.RV_INSTANCE_CLOSED, rewardedVideoSmash, objArr);
        SessionDepthManager.getInstance().increaseSessionDepth(1);
        if (!rewardedVideoSmash.isCappedPerSession() && !this.mDailyCappingManager.isCapped(rewardedVideoSmash)) {
            logProviderEvent(1001, rewardedVideoSmash, (Object[][]) null);
        }
        sendMediationLoadEvents();
        this.mListenersWrapper.onRewardedVideoAdClosed();
        for (AbstractSmash abstractSmash2 : this.mSmashArray) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "Fetch on ad closed, iterating on: " + abstractSmash2.getInstanceName() + ", Status: " + abstractSmash2.getMediationState(), 0);
            if (abstractSmash2.getMediationState() == AbstractSmash.MEDIATION_STATE.NOT_AVAILABLE) {
                try {
                    if (!abstractSmash2.getInstanceName().equals(rewardedVideoSmash.getInstanceName())) {
                        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, abstractSmash2.getInstanceName() + ":reload smash", 1);
                        ((RewardedVideoSmash) abstractSmash2).fetchRewardedVideo();
                        logProviderEvent(1001, abstractSmash2, (Object[][]) null);
                    }
                } catch (Throwable th) {
                    this.mLoggerManager.log(IronSourceLogger.IronSourceTag.NATIVE, abstractSmash2.getInstanceName() + " Failed to call fetchVideo(), " + th.getLocalizedMessage(), 1);
                }
            }
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoManagerListener
    public synchronized void onRewardedVideoAvailabilityChanged(boolean z, RewardedVideoSmash rewardedVideoSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, rewardedVideoSmash.getInstanceName() + ": onRewardedVideoAvailabilityChanged(available:" + z + ")", 1);
        if (this.mPauseSmartLoadDueToNetworkUnavailability) {
            return;
        }
        if (z && this.mShouldSendMediationLoadSuccessEvent) {
            this.mShouldSendMediationLoadSuccessEvent = false;
            logMediationEvent(1003, new Object[][]{new Object[]{"duration", Long.valueOf(new Date().getTime() - this.mLoadStartTime)}});
        }
        try {
        } catch (Throwable th) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, "onRewardedVideoAvailabilityChanged(available:" + z + ", provider:" + rewardedVideoSmash.getName() + ")", th);
        }
        if (rewardedVideoSmash.equals(getBackfillSmash())) {
            if (shouldNotifyAvailabilityChanged(z)) {
                this.mListenersWrapper.onRewardedVideoAvailabilityChanged(this.mLastMediationAvailabilityState.booleanValue());
            }
            return;
        }
        if (rewardedVideoSmash.equals(getPremiumSmash())) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, rewardedVideoSmash.getInstanceName() + " is a premium adapter, canShowPremium: " + canShowPremium(), 1);
            if (!canShowPremium()) {
                rewardedVideoSmash.setMediationState(AbstractSmash.MEDIATION_STATE.CAPPED_PER_SESSION);
                if (shouldNotifyAvailabilityChanged(false)) {
                    this.mListenersWrapper.onRewardedVideoAvailabilityChanged(this.mLastMediationAvailabilityState.booleanValue());
                }
                return;
            }
        }
        if (rewardedVideoSmash.isMediationAvailable() && !this.mDailyCappingManager.isCapped(rewardedVideoSmash)) {
            if (z) {
                if (shouldNotifyAvailabilityChanged(true)) {
                    this.mListenersWrapper.onRewardedVideoAvailabilityChanged(this.mLastMediationAvailabilityState.booleanValue());
                }
            } else {
                if (shouldNotifyAvailabilityChanged(false)) {
                    notifyAvailabilityChange();
                }
                loadNextAdapter();
                completeIterationRound();
            }
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoManagerListener
    public void onRewardedVideoAdStarted(RewardedVideoSmash rewardedVideoSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, rewardedVideoSmash.getInstanceName() + ":onRewardedVideoAdStarted()", 1);
        logProviderEvent(IronSourceConstants.RV_INSTANCE_STARTED, rewardedVideoSmash, new Object[][]{new Object[]{IronSourceConstants.EVENTS_PLACEMENT_NAME, getCurrentPlacementName()}, new Object[]{"sessionDepth", Integer.valueOf(rewardedVideoSmash.mSessionDepth)}});
        this.mListenersWrapper.onRewardedVideoAdStarted();
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoManagerListener
    public void onRewardedVideoAdEnded(RewardedVideoSmash rewardedVideoSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, rewardedVideoSmash.getInstanceName() + ":onRewardedVideoAdEnded()", 1);
        logProviderEvent(IronSourceConstants.RV_INSTANCE_ENDED, rewardedVideoSmash, new Object[][]{new Object[]{IronSourceConstants.EVENTS_PLACEMENT_NAME, getCurrentPlacementName()}, new Object[]{"sessionDepth", Integer.valueOf(rewardedVideoSmash.mSessionDepth)}});
        this.mListenersWrapper.onRewardedVideoAdEnded();
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoManagerListener
    public void onRewardedVideoAdRewarded(RewardedVideoSmash rewardedVideoSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, rewardedVideoSmash.getInstanceName() + ":onRewardedVideoAdRewarded()", 1);
        if (this.mCurrentPlacement == null) {
            this.mCurrentPlacement = IronSourceObject.getInstance().getCurrentServerResponse().getConfigurations().getRewardedVideoConfigurations().getDefaultRewardedVideoPlacement();
        }
        JSONObject providerAdditionalData = IronSourceUtils.getProviderAdditionalData(rewardedVideoSmash);
        try {
            providerAdditionalData.put("sessionDepth", rewardedVideoSmash.mSessionDepth);
            if (this.mCurrentPlacement != null) {
                providerAdditionalData.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, getCurrentPlacementName());
                providerAdditionalData.put(IronSourceConstants.EVENTS_REWARD_NAME, this.mCurrentPlacement.getRewardName());
                providerAdditionalData.put(IronSourceConstants.EVENTS_REWARD_AMOUNT, this.mCurrentPlacement.getRewardAmount());
            } else {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "mCurrentPlacement is null", 3);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        EventData eventData = new EventData(1010, providerAdditionalData);
        if (!TextUtils.isEmpty(this.mAppKey)) {
            eventData.addToAdditionalData(IronSourceConstants.EVENTS_TRANS_ID, IronSourceUtils.getTransId("" + Long.toString(eventData.getTimeStamp()) + this.mAppKey + rewardedVideoSmash.getName()));
            if (!TextUtils.isEmpty(IronSourceObject.getInstance().getDynamicUserId())) {
                eventData.addToAdditionalData(IronSourceConstants.EVENTS_DYNAMIC_USER_ID, IronSourceObject.getInstance().getDynamicUserId());
            }
            Map<String, String> rvServerParams = IronSourceObject.getInstance().getRvServerParams();
            if (rvServerParams != null) {
                for (String str : rvServerParams.keySet()) {
                    eventData.addToAdditionalData("custom_" + str, rvServerParams.get(str));
                }
            }
        }
        RewardedVideoEventsManager.getInstance().log(eventData);
        Placement placement = this.mCurrentPlacement;
        if (placement != null) {
            this.mListenersWrapper.onRewardedVideoAdRewarded(placement);
        } else {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "mCurrentPlacement is null", 3);
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoManagerListener
    public void onRewardedVideoAdClicked(RewardedVideoSmash rewardedVideoSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, rewardedVideoSmash.getInstanceName() + ":onRewardedVideoAdClicked()", 1);
        if (this.mCurrentPlacement == null) {
            this.mCurrentPlacement = IronSourceObject.getInstance().getCurrentServerResponse().getConfigurations().getRewardedVideoConfigurations().getDefaultRewardedVideoPlacement();
        }
        if (this.mCurrentPlacement == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "mCurrentPlacement is null", 3);
        } else {
            logProviderEvent(1006, rewardedVideoSmash, new Object[][]{new Object[]{IronSourceConstants.EVENTS_PLACEMENT_NAME, getCurrentPlacementName()}, new Object[]{"sessionDepth", Integer.valueOf(rewardedVideoSmash.mSessionDepth)}});
            this.mListenersWrapper.onRewardedVideoAdClicked(this.mCurrentPlacement);
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.RewardedVideoManagerListener
    public void onRewardedVideoAdVisible(RewardedVideoSmash rewardedVideoSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, rewardedVideoSmash.getInstanceName() + ":onRewardedVideoAdVisible()", 1);
        if (this.mCurrentPlacement != null) {
            logProviderEvent(IronSourceConstants.RV_INSTANCE_VISIBLE, rewardedVideoSmash, new Object[][]{new Object[]{IronSourceConstants.EVENTS_PLACEMENT_NAME, getCurrentPlacementName()}, new Object[]{"sessionDepth", Integer.valueOf(rewardedVideoSmash.mSessionDepth)}});
        } else {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "mCurrentPlacement is null", 3);
        }
    }

    @Override // com.ironsource.environment.NetworkStateReceiver.NetworkStateReceiverListener
    public void onNetworkAvailabilityChanged(boolean z) {
        if (this.mShouldTrackNetworkState) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "Network Availability Changed To: " + z, 0);
            if (shouldNotifyNetworkAvailabilityChanged(z)) {
                this.mPauseSmartLoadDueToNetworkUnavailability = !z;
                this.mListenersWrapper.onRewardedVideoAvailabilityChanged(z);
            }
        }
    }

    @Override // com.ironsource.mediationsdk.AbstractAdUnitManager
    void shouldTrackNetworkState(Context context, boolean z) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, this.TAG + " Should Track Network State: " + z, 0);
        this.mShouldTrackNetworkState = z;
        if (this.mShouldTrackNetworkState) {
            if (this.mNetworkStateReceiver == null) {
                this.mNetworkStateReceiver = new NetworkStateReceiver(context, this);
            }
            context.getApplicationContext().registerReceiver(this.mNetworkStateReceiver, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
        } else if (this.mNetworkStateReceiver != null) {
            context.getApplicationContext().unregisterReceiver(this.mNetworkStateReceiver);
        }
    }

    private boolean shouldNotifyNetworkAvailabilityChanged(boolean z) {
        if (this.mLastMediationAvailabilityState == null) {
            return false;
        }
        if (z && !this.mLastMediationAvailabilityState.booleanValue() && hasAvailableSmash()) {
            this.mLastMediationAvailabilityState = true;
        } else {
            if (z || !this.mLastMediationAvailabilityState.booleanValue()) {
                return false;
            }
            this.mLastMediationAvailabilityState = false;
        }
        return true;
    }

    void setIsUltraEventsEnabled(boolean z) {
        this.mIsUltraEventsEnabled = z;
    }

    private void reportFalseImpressionsOnHigherPriority(int i, int i2) {
        for (int i3 = 0; i3 < i && i3 < this.mSmashArray.size(); i3++) {
            if (!this.mStatesToIgnore.contains(this.mSmashArray.get(i3).getMediationState())) {
                reportImpression(((RewardedVideoSmash) this.mSmashArray.get(i3)).getRequestUrl(), false, i2);
            }
        }
    }

    private synchronized void reportImpression(String str, boolean z, int i) {
        String str2 = "";
        try {
            str2 = ("" + str) + "&sdkVersion=" + IronSourceUtils.getSDKVersion();
            Server.callAsyncRequestURL(str2, z, i);
        } catch (Throwable th) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.NETWORK, "reportImpression:(providerURL:" + str2 + ", hit:" + z + ")", th);
        }
    }

    void setCurrentPlacement(Placement placement) {
        this.mCurrentPlacement = placement;
        this.mListenersWrapper.setRvPlacement(placement.getPlacementName());
    }

    /* JADX WARN: Code restructure failed: missing block: B:8:0x0020, code lost:
    
        r1.setMediationState(com.ironsource.mediationsdk.AbstractSmash.MEDIATION_STATE.CAPPED_PER_SESSION);
        loadNextAdapter();
     */
    @Override // com.ironsource.mediationsdk.AbstractAdUnitManager
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected synchronized void disablePremiumForCurrentSession() {
        /*
            r3 = this;
            monitor-enter(r3)
            super.disablePremiumForCurrentSession()     // Catch: java.lang.Throwable -> L2a
            java.util.concurrent.CopyOnWriteArrayList<com.ironsource.mediationsdk.AbstractSmash> r0 = r3.mSmashArray     // Catch: java.lang.Throwable -> L2a
            java.util.Iterator r0 = r0.iterator()     // Catch: java.lang.Throwable -> L2a
        La:
            boolean r1 = r0.hasNext()     // Catch: java.lang.Throwable -> L2a
            if (r1 == 0) goto L28
            java.lang.Object r1 = r0.next()     // Catch: java.lang.Throwable -> L2a
            com.ironsource.mediationsdk.AbstractSmash r1 = (com.ironsource.mediationsdk.AbstractSmash) r1     // Catch: java.lang.Throwable -> L2a
            com.ironsource.mediationsdk.AbstractSmash r2 = r3.getPremiumSmash()     // Catch: java.lang.Throwable -> L2a
            boolean r2 = r1.equals(r2)     // Catch: java.lang.Throwable -> L2a
            if (r2 == 0) goto La
            com.ironsource.mediationsdk.AbstractSmash$MEDIATION_STATE r0 = com.ironsource.mediationsdk.AbstractSmash.MEDIATION_STATE.CAPPED_PER_SESSION     // Catch: java.lang.Throwable -> L2a
            r1.setMediationState(r0)     // Catch: java.lang.Throwable -> L2a
            r3.loadNextAdapter()     // Catch: java.lang.Throwable -> L2a
        L28:
            monitor-exit(r3)
            return
        L2a:
            r0 = move-exception
            monitor-exit(r3)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ironsource.mediationsdk.RewardedVideoManager.disablePremiumForCurrentSession():void");
    }

    private synchronized AbstractAdapter startAdapter(RewardedVideoSmash rewardedVideoSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.NATIVE, this.TAG + ":startAdapter(" + rewardedVideoSmash.getInstanceName() + ")", 1);
        AbstractAdapter adapter = AdapterRepository.getInstance().getAdapter(rewardedVideoSmash.mAdapterConfigs, rewardedVideoSmash.mAdapterConfigs.getRewardedVideoSettings());
        if (adapter == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, rewardedVideoSmash.getInstanceName() + " is configured in IronSource's platform, but the adapter is not integrated", 2);
            return null;
        }
        rewardedVideoSmash.setAdapterForSmash(adapter);
        rewardedVideoSmash.setMediationState(AbstractSmash.MEDIATION_STATE.INITIATED);
        setCustomParams(rewardedVideoSmash);
        logProviderEvent(1001, rewardedVideoSmash, (Object[][]) null);
        try {
            rewardedVideoSmash.initRewardedVideo(this.mAppKey, this.mUserId);
            return adapter;
        } catch (Throwable th) {
            this.mLoggerManager.logException(IronSourceLogger.IronSourceTag.API, this.TAG + "failed to init adapter: " + rewardedVideoSmash.getName() + "v", th);
            rewardedVideoSmash.setMediationState(AbstractSmash.MEDIATION_STATE.INIT_FAILED);
            return null;
        }
    }

    private AbstractAdapter loadNextAdapter() {
        AbstractAdapter abstractAdapterStartAdapter = null;
        int i = 0;
        for (int i2 = 0; i2 < this.mSmashArray.size() && abstractAdapterStartAdapter == null; i2++) {
            if (this.mSmashArray.get(i2).getMediationState() == AbstractSmash.MEDIATION_STATE.AVAILABLE || this.mSmashArray.get(i2).getMediationState() == AbstractSmash.MEDIATION_STATE.INITIATED) {
                i++;
                if (i >= this.mSmartLoadAmount) {
                    break;
                }
            } else if (this.mSmashArray.get(i2).getMediationState() == AbstractSmash.MEDIATION_STATE.NOT_INITIATED && (abstractAdapterStartAdapter = startAdapter((RewardedVideoSmash) this.mSmashArray.get(i2))) == null) {
                this.mSmashArray.get(i2).setMediationState(AbstractSmash.MEDIATION_STATE.INIT_FAILED);
            }
        }
        return abstractAdapterStartAdapter;
    }

    private synchronized void showAdapter(AbstractSmash abstractSmash, int i) {
        CappingManager.incrementShowCounter(ContextProvider.getInstance().getCurrentActiveActivity(), this.mCurrentPlacement);
        if (CappingManager.isRvPlacementCapped(ContextProvider.getInstance().getCurrentActiveActivity(), getCurrentPlacementName())) {
            logMediationEvent(IronSourceConstants.RV_CAP_PLACEMENT, new Object[][]{new Object[]{IronSourceConstants.EVENTS_PLACEMENT_NAME, getCurrentPlacementName()}});
        }
        this.mDailyCappingManager.increaseShowCounter(abstractSmash);
        if (this.mCurrentPlacement != null) {
            if (this.mIsUltraEventsEnabled) {
                reportImpression(((RewardedVideoSmash) abstractSmash).getRequestUrl(), true, this.mCurrentPlacement.getPlacementId());
                reportFalseImpressionsOnHigherPriority(i, this.mCurrentPlacement.getPlacementId());
            }
            sendShowChanceEvents(abstractSmash, i, getCurrentPlacementName());
        } else {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "mCurrentPlacement is null", 3);
        }
        logProviderEvent(IronSourceConstants.RV_INSTANCE_SHOW, abstractSmash, this.mCurrentPlacement != null ? new Object[][]{new Object[]{IronSourceConstants.EVENTS_PLACEMENT_NAME, getCurrentPlacementName()}} : (Object[][]) null);
        this.mIsCurrentlyShowing = true;
        ((RewardedVideoSmash) abstractSmash).mSessionDepth = SessionDepthManager.getInstance().getSessionDepth(1);
        ((RewardedVideoSmash) abstractSmash).showRewardedVideo();
    }

    void setManualLoadInterval(int i) {
        this.mManualLoadInterval = i;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void scheduleFetchTimer() {
        if (this.mManualLoadInterval <= 0) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "load interval is not set, ignoring", 1);
            return;
        }
        Timer timer = this.mTimer;
        if (timer != null) {
            timer.cancel();
        }
        Timer timer2 = new Timer();
        this.mTimer = timer2;
        timer2.schedule(new TimerTask() { // from class: com.ironsource.mediationsdk.RewardedVideoManager.1
            @Override // java.util.TimerTask, java.lang.Runnable
            public void run() {
                cancel();
                RewardedVideoManager.this.loadRewardedVideo();
                RewardedVideoManager.this.scheduleFetchTimer();
            }
        }, this.mManualLoadInterval * 1000);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void loadRewardedVideo() {
        if (IronSourceUtils.isNetworkConnected(ContextProvider.getInstance().getCurrentActiveActivity()) && this.mLastMediationAvailabilityState != null) {
            if (!this.mLastMediationAvailabilityState.booleanValue()) {
                logMediationEvent(102);
                logMediationEvent(1000);
                this.mShouldSendMediationLoadSuccessEvent = true;
                for (AbstractSmash abstractSmash : this.mSmashArray) {
                    if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.NOT_AVAILABLE) {
                        try {
                            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "Fetch from timer: " + abstractSmash.getInstanceName() + ":reload smash", 1);
                            logProviderEvent(1001, abstractSmash, (Object[][]) null);
                            ((RewardedVideoSmash) abstractSmash).fetchRewardedVideo();
                        } catch (Throwable th) {
                            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.NATIVE, abstractSmash.getInstanceName() + " Failed to call fetchVideo(), " + th.getLocalizedMessage(), 1);
                        }
                    }
                }
            }
        }
    }

    private synchronized boolean shouldNotifyAvailabilityChanged(boolean z) {
        boolean z2;
        z2 = false;
        if (this.mLastMediationAvailabilityState == null) {
            scheduleFetchTimer();
            if (z) {
                this.mLastMediationAvailabilityState = true;
            } else if (!isBackFillAvailable() && isAllAdaptersInactive()) {
                this.mLastMediationAvailabilityState = false;
            }
            z2 = true;
        } else {
            if (z && !this.mLastMediationAvailabilityState.booleanValue()) {
                this.mLastMediationAvailabilityState = true;
            } else if (!z && this.mLastMediationAvailabilityState.booleanValue() && !hasAvailableSmash() && !isBackFillAvailable()) {
                this.mLastMediationAvailabilityState = false;
            }
            z2 = true;
        }
        return z2;
    }

    private synchronized boolean isAllAdaptersInactive() {
        int i;
        i = 0;
        for (AbstractSmash abstractSmash : this.mSmashArray) {
            if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.INIT_FAILED || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.CAPPED_PER_DAY || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.CAPPED_PER_SESSION || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.NOT_AVAILABLE || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.EXHAUSTED) {
                i++;
            }
        }
        return this.mSmashArray.size() == i;
    }

    private synchronized boolean isAvailableAdaptersToLoad() {
        for (AbstractSmash abstractSmash : this.mSmashArray) {
            if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.NOT_AVAILABLE || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.AVAILABLE || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.INITIATED || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.INIT_PENDING || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.LOAD_PENDING) {
                return true;
            }
        }
        return false;
    }

    private synchronized boolean hasAvailableSmash() {
        boolean z;
        z = false;
        Iterator<AbstractSmash> it = this.mSmashArray.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            if (it.next().getMediationState() == AbstractSmash.MEDIATION_STATE.AVAILABLE) {
                z = true;
                break;
            }
        }
        return z;
    }

    private synchronized boolean isBackFillAvailable() {
        if (getBackfillSmash() == null) {
            return false;
        }
        return ((RewardedVideoSmash) getBackfillSmash()).isRewardedVideoAvailable();
    }

    private void sendShowChanceEvents(AbstractSmash abstractSmash, int i, String str) {
        logProviderEvent(IronSourceConstants.RV_INSTANCE_SHOW_CHANCE, abstractSmash, new Object[][]{new Object[]{IronSourceConstants.EVENTS_PLACEMENT_NAME, str}, new Object[]{"status", ServerProtocol.DIALOG_RETURN_SCOPES_TRUE}});
        for (int i2 = 0; i2 < this.mSmashArray.size() && i2 < i; i2++) {
            AbstractSmash abstractSmash2 = this.mSmashArray.get(i2);
            if (abstractSmash2.getMediationState() == AbstractSmash.MEDIATION_STATE.NOT_AVAILABLE) {
                logProviderEvent(IronSourceConstants.RV_INSTANCE_SHOW_CHANCE, abstractSmash2, new Object[][]{new Object[]{IronSourceConstants.EVENTS_PLACEMENT_NAME, str}, new Object[]{"status", "false"}});
            }
        }
    }

    private synchronized void notifyAvailabilityChange() {
        if (getBackfillSmash() != null && !this.mBackFillInitStarted) {
            this.mBackFillInitStarted = true;
            if (startAdapter((RewardedVideoSmash) getBackfillSmash()) == null) {
                this.mListenersWrapper.onRewardedVideoAvailabilityChanged(this.mLastMediationAvailabilityState.booleanValue());
            }
        } else if (!isBackFillAvailable() || shouldNotifyAvailabilityChanged(true)) {
            this.mListenersWrapper.onRewardedVideoAvailabilityChanged(this.mLastMediationAvailabilityState.booleanValue());
        }
    }

    private synchronized void completeAdapterCap() {
        if (loadNextAdapter() != null) {
            return;
        }
        if (smashesCount(AbstractSmash.MEDIATION_STATE.NOT_AVAILABLE, AbstractSmash.MEDIATION_STATE.CAPPED_PER_SESSION, AbstractSmash.MEDIATION_STATE.CAPPED_PER_DAY) < this.mSmashArray.size()) {
            completeIterationRound();
        } else {
            if (shouldNotifyAvailabilityChanged(false)) {
                notifyAvailabilityChange();
            }
        }
    }

    private synchronized void completeIterationRound() {
        if (isIterationRoundComplete()) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "Reset Iteration", 0);
            boolean z = false;
            for (AbstractSmash abstractSmash : this.mSmashArray) {
                if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.EXHAUSTED) {
                    abstractSmash.completeIteration();
                }
                if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.AVAILABLE) {
                    z = true;
                }
            }
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "End of Reset Iteration", 0);
            if (shouldNotifyAvailabilityChanged(z)) {
                this.mListenersWrapper.onRewardedVideoAvailabilityChanged(this.mLastMediationAvailabilityState.booleanValue());
            }
        }
    }

    private synchronized boolean isIterationRoundComplete() {
        for (AbstractSmash abstractSmash : this.mSmashArray) {
            if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.NOT_INITIATED || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.INITIATED || abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.AVAILABLE) {
                return false;
            }
        }
        return true;
    }

    private void logMediationEvent(int i) {
        logMediationEvent(i, (Object[][]) null);
    }

    private void logMediationEvent(int i, Object[][] objArr) {
        JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(false);
        if (objArr != null) {
            try {
                for (Object[] objArr2 : objArr) {
                    mediationAdditionalData.put(objArr2[0].toString(), objArr2[1]);
                }
            } catch (Exception e) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "RewardedVideoManager logMediationEvent " + Log.getStackTraceString(e), 3);
            }
        }
        RewardedVideoEventsManager.getInstance().log(new EventData(i, mediationAdditionalData));
    }

    private void logProviderEvent(int i, AbstractSmash abstractSmash, Object[][] objArr) {
        JSONObject providerAdditionalData = IronSourceUtils.getProviderAdditionalData(abstractSmash);
        if (objArr != null) {
            try {
                for (Object[] objArr2 : objArr) {
                    providerAdditionalData.put(objArr2[0].toString(), objArr2[1]);
                }
            } catch (Exception e) {
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "RewardedVideoManager logProviderEvent " + Log.getStackTraceString(e), 3);
            }
        }
        RewardedVideoEventsManager.getInstance().log(new EventData(i, providerAdditionalData));
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

    private void sendMediationLoadEvents() {
        if (isRewardedVideoAvailable()) {
            logMediationEvent(1000);
            logMediationEvent(1003, new Object[][]{new Object[]{"duration", 0}});
            this.mShouldSendMediationLoadSuccessEvent = false;
        } else if (isAvailableAdaptersToLoad()) {
            logMediationEvent(1000);
            this.mShouldSendMediationLoadSuccessEvent = true;
            this.mLoadStartTime = new Date().getTime();
        }
    }

    @Override // com.ironsource.mediationsdk.utils.DailyCappingListener
    public void onDailyCapReleased() {
        boolean z = false;
        for (AbstractSmash abstractSmash : this.mSmashArray) {
            if (abstractSmash.getMediationState() == AbstractSmash.MEDIATION_STATE.CAPPED_PER_DAY) {
                logProviderEvent(IronSourceConstants.REWARDED_VIDEO_DAILY_CAPPED, abstractSmash, new Object[][]{new Object[]{"status", "false"}});
                abstractSmash.setMediationState(AbstractSmash.MEDIATION_STATE.NOT_AVAILABLE);
                if (((RewardedVideoSmash) abstractSmash).isRewardedVideoAvailable() && abstractSmash.isMediationAvailable()) {
                    abstractSmash.setMediationState(AbstractSmash.MEDIATION_STATE.AVAILABLE);
                    z = true;
                }
            }
        }
        if (z && shouldNotifyAvailabilityChanged(true)) {
            this.mListenersWrapper.onRewardedVideoAvailabilityChanged(true);
        }
    }

    private void prepareSDK5() {
        for (int i = 0; i < this.mSmashArray.size(); i++) {
            String providerTypeForReflection = this.mSmashArray.get(i).mAdapterConfigs.getProviderTypeForReflection();
            if (providerTypeForReflection.equalsIgnoreCase(IronSourceConstants.IRONSOURCE_CONFIG_NAME) || providerTypeForReflection.equalsIgnoreCase(IronSourceConstants.SUPERSONIC_CONFIG_NAME)) {
                AdapterRepository.getInstance().getAdapter(this.mSmashArray.get(i).mAdapterConfigs, this.mSmashArray.get(i).mAdapterConfigs.getRewardedVideoSettings());
                return;
            }
        }
    }

    private String getCurrentPlacementName() {
        Placement placement = this.mCurrentPlacement;
        return placement == null ? "" : placement.getPlacementName();
    }
}
