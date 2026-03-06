package com.ironsource.mediationsdk;

import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.FrameLayout;
import com.ironsource.eventsmodule.EventData;
import com.ironsource.mediationsdk.events.InterstitialEventsManager;
import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.model.BannerPlacement;
import com.ironsource.mediationsdk.model.ProviderSettings;
import com.ironsource.mediationsdk.sdk.BannerManagerListener;
import com.ironsource.mediationsdk.utils.CappingManager;
import com.ironsource.mediationsdk.utils.ContextProvider;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import com.ironsource.mediationsdk.utils.SessionDepthManager;
import java.util.Iterator;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class BannerManager implements BannerManagerListener {
    private BannerSmash mActiveSmash;
    private String mAppKey;
    private BannerPlacement mCurrentPlacement;
    private IronSourceBannerLayout mIronsourceBanner;
    private long mReloadInterval;
    private Timer mReloadTimer;
    private String mUserId;
    private final CopyOnWriteArrayList<BannerSmash> mSmashArray = new CopyOnWriteArrayList<>();
    private IronSourceLoggerManager mLoggerManager = IronSourceLoggerManager.getLogger();
    private BANNER_STATE mState = BANNER_STATE.NOT_INITIATED;
    private Boolean mIsInForeground = true;
    AtomicBoolean mDidImplementOnPause = new AtomicBoolean();
    AtomicBoolean mDidImplementOnResume = new AtomicBoolean();

    private enum BANNER_STATE {
        NOT_INITIATED,
        READY_TO_LOAD,
        FIRST_LOAD_IN_PROGRESS,
        LOAD_IN_PROGRESS,
        RELOAD_IN_PROGRESS
    }

    public BannerManager(List<ProviderSettings> list, String str, String str2, long j, int i, int i2) {
        this.mAppKey = str;
        this.mUserId = str2;
        this.mReloadInterval = i;
        BannerCallbackThrottler.getInstance().setDelayLoadFailureNotificationInSeconds(i2);
        for (int i3 = 0; i3 < list.size(); i3++) {
            ProviderSettings providerSettings = list.get(i3);
            AbstractAdapter adapter = AdapterRepository.getInstance().getAdapter(providerSettings, providerSettings.getBannerSettings());
            if (adapter != null && AdaptersCompatibilityHandler.getInstance().isBannerAdapterCompatible(adapter)) {
                this.mSmashArray.add(new BannerSmash(this, providerSettings, adapter, j, i3 + 1));
            } else {
                debugLog(providerSettings.getProviderInstanceName() + " can't load adapter or wrong version");
            }
        }
        this.mCurrentPlacement = null;
        setState(BANNER_STATE.READY_TO_LOAD);
    }

    public synchronized void loadBanner(IronSourceBannerLayout ironSourceBannerLayout, BannerPlacement bannerPlacement) {
        if (ironSourceBannerLayout != null) {
            try {
            } catch (Exception e) {
                BannerCallbackThrottler.getInstance().sendBannerAdLoadFailed(ironSourceBannerLayout, new IronSourceError(605, "loadBanner() failed " + e.getMessage()));
                sendMediationEvent(IronSourceConstants.BN_CALLBACK_LOAD_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 605}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, e.getMessage()}});
                setState(BANNER_STATE.READY_TO_LOAD);
            }
            if (!ironSourceBannerLayout.isDestroyed()) {
                if (bannerPlacement != null && !TextUtils.isEmpty(bannerPlacement.getPlacementName())) {
                    if (this.mState == BANNER_STATE.READY_TO_LOAD && !BannerCallbackThrottler.getInstance().hasPendingInvocation()) {
                        setState(BANNER_STATE.FIRST_LOAD_IN_PROGRESS);
                        this.mIronsourceBanner = ironSourceBannerLayout;
                        this.mCurrentPlacement = bannerPlacement;
                        sendMediationEvent(IronSourceConstants.BN_LOAD);
                        if (CappingManager.isBnPlacementCapped(ContextProvider.getInstance().getCurrentActiveActivity(), bannerPlacement.getPlacementName())) {
                            BannerCallbackThrottler.getInstance().sendBannerAdLoadFailed(ironSourceBannerLayout, new IronSourceError(604, "placement " + bannerPlacement.getPlacementName() + " is capped"));
                            sendMediationEvent(IronSourceConstants.BN_CALLBACK_LOAD_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 604}});
                            setState(BANNER_STATE.READY_TO_LOAD);
                            return;
                        }
                        Iterator<BannerSmash> it = this.mSmashArray.iterator();
                        while (it.hasNext()) {
                            it.next().setReadyToLoad(true);
                        }
                        BannerSmash bannerSmash = this.mSmashArray.get(0);
                        sendProviderEvent(IronSourceConstants.BN_INSTANCE_LOAD, bannerSmash);
                        bannerSmash.loadBanner(ironSourceBannerLayout, this.mAppKey, this.mUserId);
                        return;
                    }
                    this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "A banner is already loaded", 3);
                    return;
                }
                Object[] objArr = new Object[1];
                objArr[0] = bannerPlacement == null ? "placement is null" : "placement name is empty";
                this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, String.format("can't load banner - %s", objArr), 3);
                return;
            }
        }
        Object[] objArr2 = new Object[1];
        objArr2[0] = ironSourceBannerLayout == null ? "banner is null" : "banner is destroyed";
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, String.format("can't load banner - %s", objArr2), 3);
    }

    public synchronized void destroyBanner(IronSourceBannerLayout ironSourceBannerLayout) {
        if (ironSourceBannerLayout == null) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "destroyBanner banner cannot be null", 3);
            return;
        }
        if (ironSourceBannerLayout.isDestroyed()) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.API, "Banner is already destroyed and can't be used anymore. Please create a new one using IronSource.createBanner API", 3);
            return;
        }
        int sessionDepth = SessionDepthManager.getInstance().getSessionDepth(3);
        sendMediationEvent(IronSourceConstants.BN_DESTROY, new Object[][]{new Object[]{"sessionDepth", Integer.valueOf(sessionDepth)}});
        stopReloadTimer();
        BannerSmash bannerSmash = this.mActiveSmash;
        if (bannerSmash != null) {
            sendProviderEvent(IronSourceConstants.BN_INSTANCE_DESTROY, bannerSmash, new Object[][]{new Object[]{"sessionDepth", Integer.valueOf(sessionDepth)}});
            SessionDepthManager.getInstance().increaseSessionDepth(3);
            this.mActiveSmash.destroyBanner();
            this.mActiveSmash = null;
        }
        ironSourceBannerLayout.destroyBanner();
        this.mIronsourceBanner = null;
        this.mCurrentPlacement = null;
        setState(BANNER_STATE.READY_TO_LOAD);
    }

    private void errorLog(String str) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "BannerManager " + str, 3);
    }

    private void debugLog(String str) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "BannerManager " + str, 0);
    }

    private void setState(BANNER_STATE banner_state) {
        this.mState = banner_state;
        debugLog("state=" + banner_state.name());
    }

    private void callbackLog(String str, BannerSmash bannerSmash) {
        this.mLoggerManager.log(IronSourceLogger.IronSourceTag.ADAPTER_CALLBACK, "BannerManager " + str + " " + bannerSmash.getName(), 0);
    }

    private void bindView(BannerSmash bannerSmash, View view, FrameLayout.LayoutParams layoutParams) {
        this.mActiveSmash = bannerSmash;
        this.mIronsourceBanner.addViewWithFrameLayoutParams(view, layoutParams);
    }

    @Override // com.ironsource.mediationsdk.sdk.BannerManagerListener
    public void onBannerAdLoaded(BannerSmash bannerSmash, View view, FrameLayout.LayoutParams layoutParams) {
        callbackLog("onBannerAdLoaded", bannerSmash);
        if (this.mState == BANNER_STATE.FIRST_LOAD_IN_PROGRESS) {
            sendProviderEvent(IronSourceConstants.BN_INSTANCE_LOAD_SUCCESS, bannerSmash);
            bindView(bannerSmash, view, layoutParams);
            BannerPlacement bannerPlacement = this.mCurrentPlacement;
            String placementName = bannerPlacement != null ? bannerPlacement.getPlacementName() : "";
            CappingManager.incrementBnShowCounter(ContextProvider.getInstance().getCurrentActiveActivity(), placementName);
            if (CappingManager.isBnPlacementCapped(ContextProvider.getInstance().getCurrentActiveActivity(), placementName)) {
                sendMediationEvent(IronSourceConstants.BN_PLACEMENT_CAPPED);
            }
            this.mIronsourceBanner.sendBannerAdLoaded(bannerSmash.getName());
            sendMediationEvent(IronSourceConstants.BN_CALLBACK_LOAD_SUCCESS);
            setState(BANNER_STATE.RELOAD_IN_PROGRESS);
            startReloadTimer();
            return;
        }
        if (this.mState == BANNER_STATE.LOAD_IN_PROGRESS) {
            sendProviderEvent(IronSourceConstants.BN_INSTANCE_RELOAD_SUCCESS, bannerSmash);
            bindView(bannerSmash, view, layoutParams);
            setState(BANNER_STATE.RELOAD_IN_PROGRESS);
            startReloadTimer();
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.BannerManagerListener
    public void onBannerAdLoadFailed(IronSourceError ironSourceError, BannerSmash bannerSmash, boolean z) {
        callbackLog("onBannerAdLoadFailed " + ironSourceError.getErrorMessage(), bannerSmash);
        if (this.mState != BANNER_STATE.FIRST_LOAD_IN_PROGRESS && this.mState != BANNER_STATE.LOAD_IN_PROGRESS) {
            debugLog("onBannerAdLoadFailed " + bannerSmash.getName() + " wrong state=" + this.mState.name());
            return;
        }
        if (z) {
            sendProviderEvent(IronSourceConstants.BN_INSTANCE_LOAD_NO_FILL, bannerSmash);
        } else {
            sendProviderEvent(IronSourceConstants.BN_INSTANCE_LOAD_ERROR, bannerSmash, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(ironSourceError.getErrorCode())}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, ironSourceError.getErrorMessage()}});
        }
        if (loadNextSmash()) {
            return;
        }
        if (this.mState == BANNER_STATE.FIRST_LOAD_IN_PROGRESS) {
            BannerCallbackThrottler.getInstance().sendBannerAdLoadFailed(this.mIronsourceBanner, new IronSourceError(606, "No ads to show"));
            sendMediationEvent(IronSourceConstants.BN_CALLBACK_LOAD_ERROR, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, 606}});
            setState(BANNER_STATE.READY_TO_LOAD);
        } else {
            sendMediationEvent(IronSourceConstants.BN_RELOAD_FAILED);
            setState(BANNER_STATE.RELOAD_IN_PROGRESS);
            startReloadTimer();
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.BannerManagerListener
    public void onBannerAdReloaded(BannerSmash bannerSmash, View view, FrameLayout.LayoutParams layoutParams, boolean z) {
        callbackLog("onBannerAdReloaded", bannerSmash);
        if (this.mState != BANNER_STATE.RELOAD_IN_PROGRESS) {
            debugLog("onBannerAdReloaded " + bannerSmash.getName() + " wrong state=" + this.mState.name());
            return;
        }
        IronSourceUtils.sendAutomationLog("bannerReloadSucceeded");
        sendProviderEvent(IronSourceConstants.BN_INSTANCE_RELOAD_SUCCESS, bannerSmash);
        callbackLog("bindView = " + z, bannerSmash);
        if (z) {
            bindView(bannerSmash, view, layoutParams);
        }
        startReloadTimer();
    }

    @Override // com.ironsource.mediationsdk.sdk.BannerManagerListener
    public void onBannerAdReloadFailed(IronSourceError ironSourceError, BannerSmash bannerSmash, boolean z) {
        callbackLog("onBannerAdReloadFailed " + ironSourceError.getErrorMessage(), bannerSmash);
        if (this.mState != BANNER_STATE.RELOAD_IN_PROGRESS) {
            debugLog("onBannerAdReloadFailed " + bannerSmash.getName() + " wrong state=" + this.mState.name());
            return;
        }
        if (z) {
            sendProviderEvent(IronSourceConstants.BN_INSTANCE_RELOAD_NO_FILL, bannerSmash);
        } else {
            sendProviderEvent(IronSourceConstants.BN_INSTANCE_RELOAD_ERROR, bannerSmash, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(ironSourceError.getErrorCode())}, new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, ironSourceError.getErrorMessage()}});
        }
        if (this.mSmashArray.size() == 1) {
            sendMediationEvent(IronSourceConstants.BN_RELOAD_FAILED);
            startReloadTimer();
        } else {
            setState(BANNER_STATE.LOAD_IN_PROGRESS);
            resetIteration();
            loadNextSmash();
        }
    }

    @Override // com.ironsource.mediationsdk.sdk.BannerManagerListener
    public void onBannerAdClicked(BannerSmash bannerSmash) {
        callbackLog("onBannerAdClicked", bannerSmash);
        Object[][] objArr = (Object[][]) null;
        if (canSendBannerCallbacks()) {
            this.mIronsourceBanner.sendBannerAdClicked();
        } else {
            objArr = new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "banner is destroyed"}};
        }
        sendMediationEvent(IronSourceConstants.BN_CALLBACK_CLICK, objArr);
        sendProviderEvent(IronSourceConstants.BN_INSTANCE_CLICK, bannerSmash, objArr);
    }

    @Override // com.ironsource.mediationsdk.sdk.BannerManagerListener
    public void onBannerAdScreenDismissed(BannerSmash bannerSmash) {
        callbackLog("onBannerAdScreenDismissed", bannerSmash);
        Object[][] objArr = (Object[][]) null;
        if (canSendBannerCallbacks()) {
            this.mIronsourceBanner.sendBannerAdScreenDismissed();
        } else {
            objArr = new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "banner is destroyed"}};
        }
        sendMediationEvent(IronSourceConstants.BN_CALLBACK_DISMISS_SCREEN, objArr);
        sendProviderEvent(IronSourceConstants.BN_INSTANCE_DISMISS_SCREEN, bannerSmash, objArr);
    }

    @Override // com.ironsource.mediationsdk.sdk.BannerManagerListener
    public void onBannerAdScreenPresented(BannerSmash bannerSmash) {
        callbackLog("onBannerAdScreenPresented", bannerSmash);
        Object[][] objArr = (Object[][]) null;
        if (canSendBannerCallbacks()) {
            this.mIronsourceBanner.sendBannerAdScreenPresented();
        } else {
            objArr = new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "banner is destroyed"}};
        }
        sendMediationEvent(IronSourceConstants.BN_CALLBACK_PRESENT_SCREEN, objArr);
        sendProviderEvent(IronSourceConstants.BN_INSTANCE_PRESENT_SCREEN, bannerSmash, objArr);
    }

    @Override // com.ironsource.mediationsdk.sdk.BannerManagerListener
    public void onBannerAdLeftApplication(BannerSmash bannerSmash) {
        callbackLog("onBannerAdLeftApplication", bannerSmash);
        Object[][] objArr = (Object[][]) null;
        if (canSendBannerCallbacks()) {
            this.mIronsourceBanner.sendBannerAdLeftApplication();
        } else {
            objArr = new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_REASON, "banner is destroyed"}};
        }
        sendMediationEvent(IronSourceConstants.BN_CALLBACK_LEAVE_APP, objArr);
        sendProviderEvent(IronSourceConstants.BN_INSTANCE_LEAVE_APP, bannerSmash, objArr);
    }

    private boolean canSendBannerCallbacks() {
        IronSourceBannerLayout ironSourceBannerLayout = this.mIronsourceBanner;
        return (ironSourceBannerLayout == null || ironSourceBannerLayout.isDestroyed()) ? false : true;
    }

    private void sendMediationEvent(int i) {
        sendMediationEvent(i, (Object[][]) null);
    }

    private void sendMediationEvent(int i, Object[][] objArr) {
        JSONObject mediationAdditionalData = IronSourceUtils.getMediationAdditionalData(false);
        try {
            IronSourceBannerLayout ironSourceBannerLayout = this.mIronsourceBanner;
            if (ironSourceBannerLayout != null) {
                addEventSizeFields(mediationAdditionalData, ironSourceBannerLayout.getSize());
            }
            BannerPlacement bannerPlacement = this.mCurrentPlacement;
            if (bannerPlacement != null) {
                mediationAdditionalData.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, bannerPlacement.getPlacementName());
            }
            if (objArr != null) {
                for (Object[] objArr2 : objArr) {
                    mediationAdditionalData.put(objArr2[0].toString(), objArr2[1]);
                }
            }
        } catch (Exception e) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "sendMediationEvent " + Log.getStackTraceString(e), 3);
        }
        InterstitialEventsManager.getInstance().log(new EventData(i, mediationAdditionalData));
    }

    private void sendProviderEvent(int i, BannerSmash bannerSmash) {
        sendProviderEvent(i, bannerSmash, (Object[][]) null);
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    private void addEventSizeFields(JSONObject jSONObject, ISBannerSize iSBannerSize) {
        try {
            String description = iSBannerSize.getDescription();
            byte b = -1;
            switch (description.hashCode()) {
                case -387072689:
                    if (description.equals("RECTANGLE")) {
                        b = 2;
                    }
                    break;
                case 72205083:
                    if (description.equals("LARGE")) {
                        b = 1;
                    }
                    break;
                case 79011241:
                    if (description.equals("SMART")) {
                        b = 3;
                    }
                    break;
                case 1951953708:
                    if (description.equals("BANNER")) {
                        b = 0;
                    }
                    break;
                case 1999208305:
                    if (description.equals("CUSTOM")) {
                        b = 4;
                    }
                    break;
            }
            if (b == 0) {
                jSONObject.put("bannerAdSize", 1);
                return;
            }
            if (b == 1) {
                jSONObject.put("bannerAdSize", 2);
                return;
            }
            if (b == 2) {
                jSONObject.put("bannerAdSize", 3);
                return;
            }
            if (b == 3) {
                jSONObject.put("bannerAdSize", 5);
                return;
            }
            if (b != 4) {
                return;
            }
            jSONObject.put("bannerAdSize", 6);
            jSONObject.put("custom_banner_size", iSBannerSize.getWidth() + "x" + iSBannerSize.getHeight());
        } catch (Exception e) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "sendProviderEvent " + Log.getStackTraceString(e), 3);
        }
    }

    private void sendProviderEvent(int i, BannerSmash bannerSmash, Object[][] objArr) {
        JSONObject providerAdditionalData = IronSourceUtils.getProviderAdditionalData(bannerSmash);
        try {
            IronSourceBannerLayout ironSourceBannerLayout = this.mIronsourceBanner;
            if (ironSourceBannerLayout != null) {
                addEventSizeFields(providerAdditionalData, ironSourceBannerLayout.getSize());
            }
            BannerPlacement bannerPlacement = this.mCurrentPlacement;
            if (bannerPlacement != null) {
                providerAdditionalData.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, bannerPlacement.getPlacementName());
            }
            if (objArr != null) {
                for (Object[] objArr2 : objArr) {
                    providerAdditionalData.put(objArr2[0].toString(), objArr2[1]);
                }
            }
        } catch (Exception e) {
            this.mLoggerManager.log(IronSourceLogger.IronSourceTag.INTERNAL, "sendProviderEvent " + Log.getStackTraceString(e), 3);
        }
        InterstitialEventsManager.getInstance().log(new EventData(i, providerAdditionalData));
    }

    private void resetIteration() {
        Iterator<BannerSmash> it = this.mSmashArray.iterator();
        while (it.hasNext()) {
            it.next().setReadyToLoad(true);
        }
    }

    private boolean loadNextSmash() {
        for (BannerSmash bannerSmash : this.mSmashArray) {
            if (bannerSmash.isReadyToLoad() && this.mActiveSmash != bannerSmash) {
                if (this.mState == BANNER_STATE.FIRST_LOAD_IN_PROGRESS) {
                    sendProviderEvent(IronSourceConstants.BN_INSTANCE_LOAD, bannerSmash);
                } else {
                    sendProviderEvent(IronSourceConstants.BN_INSTANCE_RELOAD, bannerSmash);
                }
                bannerSmash.loadBanner(this.mIronsourceBanner, this.mAppKey, this.mUserId);
                return true;
            }
        }
        return false;
    }

    public void onPause() {
        this.mIsInForeground = false;
    }

    public void onResume() {
        this.mIsInForeground = true;
    }

    private void startReloadTimer() {
        try {
            stopReloadTimer();
            if (this.mReloadInterval > 0) {
                Timer timer = new Timer();
                this.mReloadTimer = timer;
                timer.schedule(new TimerTask() { // from class: com.ironsource.mediationsdk.BannerManager.1
                    @Override // java.util.TimerTask, java.lang.Runnable
                    public void run() {
                        BannerManager.this.onReloadTimer();
                    }
                }, this.mReloadInterval * 1000);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void stopReloadTimer() {
        Timer timer = this.mReloadTimer;
        if (timer != null) {
            timer.cancel();
            this.mReloadTimer = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onReloadTimer() {
        if (this.mState != BANNER_STATE.RELOAD_IN_PROGRESS) {
            debugLog("onReloadTimer wrong state=" + this.mState.name());
            return;
        }
        if (this.mIsInForeground.booleanValue()) {
            sendMediationEvent(IronSourceConstants.BN_RELOAD);
            sendProviderEvent(IronSourceConstants.BN_INSTANCE_RELOAD, this.mActiveSmash);
            this.mActiveSmash.reloadBanner();
        } else {
            sendMediationEvent(IronSourceConstants.BN_SKIP_RELOAD, new Object[][]{new Object[]{IronSourceConstants.EVENTS_ERROR_CODE, Integer.valueOf(IronSourceError.ERROR_BN_RELOAD_SKIP_BACKGROUND)}});
            startReloadTimer();
        }
    }
}
