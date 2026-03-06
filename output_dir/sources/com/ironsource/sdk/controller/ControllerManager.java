package com.ironsource.sdk.controller;

import android.app.Activity;
import android.os.CountDownTimer;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import com.ironsource.sdk.Events.ISNEventParams;
import com.ironsource.sdk.Events.ISNEventsTracker;
import com.ironsource.sdk.Events.ISNEventsUtils;
import com.ironsource.sdk.Events.SDK5Events;
import com.ironsource.sdk.ISNAdView.ISNAdView;
import com.ironsource.sdk.constants.Constants;
import com.ironsource.sdk.constants.Events;
import com.ironsource.sdk.data.DemandSource;
import com.ironsource.sdk.data.SSAEnums;
import com.ironsource.sdk.listeners.OnOfferWallListener;
import com.ironsource.sdk.listeners.internals.DSBannerListener;
import com.ironsource.sdk.listeners.internals.DSInterstitialListener;
import com.ironsource.sdk.listeners.internals.DSRewardedVideoListener;
import com.ironsource.sdk.service.TokenService;
import com.ironsource.sdk.utils.Logger;
import java.util.Map;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class ControllerManager implements ControllerEventListener {
    private static final Handler mUiHandler = new Handler(Looper.getMainLooper());
    private IronSourceController mController;
    private CountDownTimer mGlobalControllerTimer;
    private String TAG = ControllerManager.class.getSimpleName();
    private SSAEnums.ControllerState mControllerState = SSAEnums.ControllerState.None;
    private CommandExecutor mCommandExecutor = new CommandExecutor("NativeCommandExecutor");
    private CommandExecutor mControllerCommandsExecutor = new CommandExecutor("ControllerCommandsExecutor");

    public ControllerManager(Activity activity, TokenService tokenService, DemandSourceManager demandSourceManager) {
        createController(activity, tokenService, demandSourceManager);
    }

    private void createController(final Activity activity, final TokenService tokenService, final DemandSourceManager demandSourceManager) {
        mUiHandler.post(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    ControllerManager.this.createWebController(activity, tokenService, demandSourceManager);
                } catch (Exception e) {
                    ControllerManager.this.createNativeController(Log.getStackTraceString(e));
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Type inference failed for: r8v1, types: [com.ironsource.sdk.controller.ControllerManager$2] */
    public void createWebController(Activity activity, TokenService tokenService, DemandSourceManager demandSourceManager) throws Exception {
        ISNEventsTracker.logEvent(SDK5Events.createControllerWeb);
        WebController webController = new WebController(activity, demandSourceManager, this);
        this.mController = webController;
        WebController webController2 = webController;
        webController2.addTokenJSInterface(new TokenJSAdapter(activity.getApplicationContext(), tokenService));
        webController2.addOmidJSInterface(new OMIDJSAdapter(activity.getApplicationContext()));
        webController2.addPermissionsJSInterface(new PermissionsJSAdapter(activity.getApplicationContext()));
        webController2.addBannerJSInterface(new BannerJSAdapter());
        webController2.addDeviceDataJSInterface(new DeviceDataJSAdapter(activity.getApplicationContext()));
        webController2.addAdViewsJSInterface(new AdViewsJSAdapter(activity));
        this.mGlobalControllerTimer = new CountDownTimer(200000L, 1000L) { // from class: com.ironsource.sdk.controller.ControllerManager.2
            @Override // android.os.CountDownTimer
            public void onTick(long j) {
                Logger.i(ControllerManager.this.TAG, "Global Controller Timer Tick " + j);
            }

            @Override // android.os.CountDownTimer
            public void onFinish() {
                Logger.i(ControllerManager.this.TAG, "Global Controller Timer Finish");
                ControllerManager.this.destroyWebControllerIfExist();
                ControllerManager.mUiHandler.post(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.2.1
                    @Override // java.lang.Runnable
                    public void run() {
                        ControllerManager.this.createNativeController(Constants.ErrorCodes.CONTROLLER_DOWNLOAD_TIMEOUT);
                    }
                });
            }
        }.start();
        webController2.downloadController();
        this.mCommandExecutor.setReady();
        this.mCommandExecutor.purgeDelayedCommands();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void destroyWebControllerIfExist() {
        IronSourceController ironSourceController = this.mController;
        if (ironSourceController != null) {
            ironSourceController.destroy();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void createNativeController(String str) {
        ISNEventsTracker.logEvent(SDK5Events.createControllerNative, new ISNEventParams().addPair(Events.CALL_FAILED_REASON, str).getData());
        NativeController nativeController = new NativeController(this);
        this.mController = nativeController;
        nativeController.setFailedControllerReason(str);
        this.mCommandExecutor.setReady();
        this.mCommandExecutor.purgeDelayedCommands();
    }

    private boolean isControllerStateReady() {
        return SSAEnums.ControllerState.Ready.equals(this.mControllerState);
    }

    public void executeCommand(Runnable runnable) {
        this.mCommandExecutor.executeCommand(runnable);
    }

    @Override // com.ironsource.sdk.controller.ControllerEventListener
    public void handleControllerStageLoaded() {
        this.mControllerState = SSAEnums.ControllerState.Loaded;
    }

    @Override // com.ironsource.sdk.controller.ControllerEventListener
    public void handleControllerStageReady() {
        ISNEventsTracker.logEvent(SDK5Events.controllerStageReady);
        this.mControllerState = SSAEnums.ControllerState.Ready;
        CountDownTimer countDownTimer = this.mGlobalControllerTimer;
        if (countDownTimer != null) {
            countDownTimer.cancel();
        }
        this.mControllerCommandsExecutor.setReady();
        this.mControllerCommandsExecutor.purgeDelayedCommands();
        this.mController.restoreSavedState();
    }

    @Override // com.ironsource.sdk.controller.ControllerEventListener
    public void handleControllerStageFailed(final String str) {
        ISNEventsTracker.logEvent(SDK5Events.controllerFailed, new ISNEventParams().addPair(Events.CALL_FAILED_REASON, str).getData());
        CountDownTimer countDownTimer = this.mGlobalControllerTimer;
        if (countDownTimer != null) {
            countDownTimer.cancel();
        }
        destroyWebControllerIfExist();
        mUiHandler.post(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.3
            @Override // java.lang.Runnable
            public void run() {
                ControllerManager.this.createNativeController(str);
            }
        });
    }

    public void initOfferWall(final String str, final String str2, final Map<String, String> map, final OnOfferWallListener onOfferWallListener) {
        this.mControllerCommandsExecutor.executeCommand(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.4
            @Override // java.lang.Runnable
            public void run() {
                ControllerManager.this.mController.initOfferWall(str, str2, map, onOfferWallListener);
            }
        });
    }

    public void showOfferWall(final Map<String, String> map) {
        this.mControllerCommandsExecutor.executeCommand(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.5
            @Override // java.lang.Runnable
            public void run() {
                ControllerManager.this.mController.showOfferWall(map);
            }
        });
    }

    public void getOfferWallCredits(final String str, final String str2, final OnOfferWallListener onOfferWallListener) {
        this.mControllerCommandsExecutor.executeCommand(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.6
            @Override // java.lang.Runnable
            public void run() {
                ControllerManager.this.mController.getOfferWallCredits(str, str2, onOfferWallListener);
            }
        });
    }

    public void initRewardedVideo(final String str, final String str2, final DemandSource demandSource, final DSRewardedVideoListener dSRewardedVideoListener) {
        this.mControllerCommandsExecutor.executeCommand(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.7
            @Override // java.lang.Runnable
            public void run() {
                ControllerManager.this.mController.initRewardedVideo(str, str2, demandSource, dSRewardedVideoListener);
            }
        });
    }

    public void showRewardedVideo(final JSONObject jSONObject, final DSRewardedVideoListener dSRewardedVideoListener) {
        this.mControllerCommandsExecutor.executeCommand(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.8
            @Override // java.lang.Runnable
            public void run() {
                ControllerManager.this.mController.showRewardedVideo(jSONObject, dSRewardedVideoListener);
            }
        });
    }

    public void initInterstitial(final String str, final String str2, final DemandSource demandSource, final DSInterstitialListener dSInterstitialListener) {
        this.mControllerCommandsExecutor.executeCommand(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.9
            @Override // java.lang.Runnable
            public void run() {
                ControllerManager.this.mController.initInterstitial(str, str2, demandSource, dSInterstitialListener);
            }
        });
    }

    public void loadInterstitial(final String str, final DSInterstitialListener dSInterstitialListener) {
        this.mControllerCommandsExecutor.executeCommand(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.10
            @Override // java.lang.Runnable
            public void run() {
                ControllerManager.this.mController.loadInterstitial(str, dSInterstitialListener);
            }
        });
    }

    public void loadInterstitial(final DemandSource demandSource, final Map<String, String> map, final DSInterstitialListener dSInterstitialListener) {
        this.mControllerCommandsExecutor.executeCommand(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.11
            @Override // java.lang.Runnable
            public void run() {
                ISNEventsTracker.logEvent(SDK5Events.loadProduct, new ISNEventParams().addPair(Events.DEMAND_SOURCE_NAME, demandSource.getDemandSourceName()).addPair(Events.PRODUCT_TYPE, ISNEventsUtils.getProductType(demandSource, SSAEnums.ProductType.Interstitial)).addPair(Events.IS_BIDDING_INSTANCE, Boolean.valueOf(ISNEventsUtils.getIsBiddingInstance(demandSource))).getData());
                ControllerManager.this.mController.loadInterstitial(demandSource, map, dSInterstitialListener);
            }
        });
    }

    public void showInterstitial(final JSONObject jSONObject, final DSInterstitialListener dSInterstitialListener) {
        this.mControllerCommandsExecutor.executeCommand(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.12
            @Override // java.lang.Runnable
            public void run() {
                ControllerManager.this.mController.showInterstitial(jSONObject, dSInterstitialListener);
            }
        });
    }

    public void showInterstitial(final DemandSource demandSource, final Map<String, String> map, final DSInterstitialListener dSInterstitialListener) {
        this.mControllerCommandsExecutor.executeCommand(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.13
            @Override // java.lang.Runnable
            public void run() {
                ControllerManager.this.mController.showInterstitial(demandSource, map, dSInterstitialListener);
            }
        });
    }

    public boolean isInterstitialAdAvailable(String str) {
        if (isControllerStateReady()) {
            return this.mController.isInterstitialAdAvailable(str);
        }
        return false;
    }

    public void initBanner(final String str, final String str2, final DemandSource demandSource, final DSBannerListener dSBannerListener) {
        this.mControllerCommandsExecutor.executeCommand(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.14
            @Override // java.lang.Runnable
            public void run() {
                ControllerManager.this.mController.initBanner(str, str2, demandSource, dSBannerListener);
            }
        });
    }

    public void loadBanner(final JSONObject jSONObject, final DSBannerListener dSBannerListener) {
        this.mControllerCommandsExecutor.executeCommand(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.15
            @Override // java.lang.Runnable
            public void run() {
                ControllerManager.this.mController.loadBanner(jSONObject, dSBannerListener);
            }
        });
    }

    public void updateConsentInfo(final JSONObject jSONObject) {
        this.mControllerCommandsExecutor.executeCommand(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.16
            @Override // java.lang.Runnable
            public void run() {
                ControllerManager.this.mController.updateConsentInfo(jSONObject);
            }
        });
    }

    public void enterForeground() {
        if (isControllerStateReady()) {
            this.mController.enterForeground();
        }
    }

    public void enterBackground() {
        if (isControllerStateReady()) {
            this.mController.enterBackground();
        }
    }

    public void registerConnectionReceiver(Activity activity) {
        if (isControllerStateReady()) {
            this.mController.registerConnectionReceiver(activity);
        }
    }

    public void unregisterConnectionReceiver(Activity activity) {
        if (isControllerStateReady()) {
            this.mController.unregisterConnectionReceiver(activity);
        }
    }

    public void destroy() {
        CountDownTimer countDownTimer = this.mGlobalControllerTimer;
        if (countDownTimer != null) {
            countDownTimer.cancel();
        }
        this.mGlobalControllerTimer = null;
        mUiHandler.post(new Runnable() { // from class: com.ironsource.sdk.controller.ControllerManager.17
            @Override // java.lang.Runnable
            public void run() {
                if (ControllerManager.this.mController != null) {
                    ControllerManager.this.mController.destroy();
                    ControllerManager.this.mController = null;
                }
            }
        });
    }

    public IronSourceController getController() {
        return this.mController;
    }

    public void setCommunicationWithAdView(ISNAdView iSNAdView) {
        IronSourceController ironSourceController = this.mController;
        if (ironSourceController != null) {
            ironSourceController.setCommunicationWithAdView(iSNAdView);
        }
    }
}
