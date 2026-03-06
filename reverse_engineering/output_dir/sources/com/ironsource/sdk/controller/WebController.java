package com.ironsource.sdk.controller;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.MutableContextWrapper;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.webkit.ConsoleMessage;
import android.webkit.DownloadListener;
import android.webkit.JavascriptInterface;
import android.webkit.WebBackForwardList;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceResponse;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.Toast;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.internal.ServerProtocol;
import com.ironsource.environment.ApplicationContext;
import com.ironsource.environment.DeviceStatus;
import com.ironsource.environment.UrlHandler;
import com.ironsource.eventsmodule.DataBaseEventsStorage;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.network.ConnectivityService;
import com.ironsource.network.ConnectivityUtils;
import com.ironsource.sdk.Events.ISNEventParams;
import com.ironsource.sdk.Events.ISNEventsBaseData;
import com.ironsource.sdk.Events.ISNEventsTracker;
import com.ironsource.sdk.Events.SDK5Events;
import com.ironsource.sdk.ISNAdView.ISNAdView;
import com.ironsource.sdk.constants.Constants;
import com.ironsource.sdk.constants.Events;
import com.ironsource.sdk.data.AdUnitsReady;
import com.ironsource.sdk.data.AdUnitsState;
import com.ironsource.sdk.data.DemandSource;
import com.ironsource.sdk.data.SSAEnums;
import com.ironsource.sdk.data.SSAFile;
import com.ironsource.sdk.data.SSAObj;
import com.ironsource.sdk.listeners.OnGenericFunctionListener;
import com.ironsource.sdk.listeners.OnOfferWallListener;
import com.ironsource.sdk.listeners.OnWebViewChangeListener;
import com.ironsource.sdk.listeners.internals.DSAdProductListener;
import com.ironsource.sdk.listeners.internals.DSBannerListener;
import com.ironsource.sdk.listeners.internals.DSInterstitialListener;
import com.ironsource.sdk.listeners.internals.DSRewardedVideoListener;
import com.ironsource.sdk.precache.DownloadManager;
import com.ironsource.sdk.service.ConnectivityAdapter;
import com.ironsource.sdk.service.PackagesInstallationService;
import com.ironsource.sdk.utils.DeviceProperties;
import com.ironsource.sdk.utils.IronSourceAsyncHttpRequestTask;
import com.ironsource.sdk.utils.IronSourceSharedPrefHelper;
import com.ironsource.sdk.utils.IronSourceStorageUtils;
import com.ironsource.sdk.utils.Logger;
import com.ironsource.sdk.utils.SDKUtils;
import com.ironsource.sdk.utils.WebViewUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class WebController extends WebView implements IronSourceController, DownloadManager.OnPreCacheCompletion, DownloadListener {
    public static String EXTERNAL_URL = "external_url";
    public static String IS_STORE = "is_store";
    private static String JSON_KEY_FAIL = "fail";
    private static String JSON_KEY_SUCCESS = "success";
    public static String SECONDARY_WEB_VIEW = "secondary_web_view";
    public static int mDebugMode;
    private final String GENERIC_MESSAGE;
    private String PUB_TAG;
    private String TAG;
    private DownloadManager downloadManager;
    private Boolean isKitkatAndAbove;
    private boolean isRemoveCloseEventHandler;
    private AdViewsJSAdapter mAdViewsJsAdapter;
    private String mApplicationKey;
    private BannerJSAdapter mBannerJsAdapter;
    private String mCacheDirectory;
    private OnWebViewChangeListener mChangeListener;
    private CountDownTimer mCloseEventTimer;
    private ConnectivityAdapter mConnectivityAdapter;
    private ControllerAdapter mControllerAdapter;
    private String mControllerKeyPressed;
    private FrameLayout mControllerLayout;
    private ControllerEventListener mControllerListener;
    Context mCurrentActivityContext;
    private View mCustomView;
    private WebChromeClient.CustomViewCallback mCustomViewCallback;
    private FrameLayout mCustomViewContainer;
    private DSBannerListener mDSBannerListener;
    private DSInterstitialListener mDSInterstitialListener;
    private DSRewardedVideoListener mDSRewardedVideoListener;
    private DemandSourceManager mDemandSourceManager;
    private DeviceDataJSAdapter mDeviceDataJsAdapter;
    private int mHiddenForceCloseHeight;
    private String mHiddenForceCloseLocation;
    private int mHiddenForceCloseWidth;
    private boolean mIsImmersive;
    private boolean mIsWebControllerReady;
    public CountDownTimer mLoadControllerTimer;
    private boolean mOWCreditsMiss;
    private Map<String, String> mOWExtraParameters;
    private boolean mOWmiss;
    private OMIDJSAdapter mOmidJsAdapter;
    private OnGenericFunctionListener mOnGenericFunctionListener;
    private OnOfferWallListener mOnOfferWallListener;
    private String mOrientationState;
    private PermissionsJSAdapter mPermissionsJsAdapter;
    private AdUnitsState mSavedState;
    private Object mSavedStateLocker;
    private State mState;
    private TokenJSAdapter mTokenJSAdapter;
    Handler mUiHandler;
    private String mUserId;
    private VideoEventsListener mVideoEventsListener;
    private ChromeClient mWebChromeClient;
    private WebViewMessagingMediator mWebViewMessagingMediator;

    private interface OnInitProductHandler {
        void handleInitProductFailed(String str, SSAEnums.ProductType productType, DemandSource demandSource);
    }

    public enum State {
        Display,
        Gone
    }

    /* JADX INFO: Access modifiers changed from: private */
    public WebView getWebview() {
        return this;
    }

    private Map<String, String> getExtraParamsByProduct(SSAEnums.ProductType productType) {
        if (productType == SSAEnums.ProductType.OfferWall) {
            return this.mOWExtraParameters;
        }
        return null;
    }

    public WebController(Activity activity, DemandSourceManager demandSourceManager, ControllerEventListener controllerEventListener) {
        super(activity.getApplicationContext());
        this.TAG = WebController.class.getSimpleName();
        this.PUB_TAG = IronSourceConstants.IRONSOURCE_CONFIG_NAME;
        this.GENERIC_MESSAGE = "We're sorry, some error occurred. we will investigate it";
        this.mControllerKeyPressed = "interrupt";
        this.mHiddenForceCloseWidth = 50;
        this.mHiddenForceCloseHeight = 50;
        this.mHiddenForceCloseLocation = Constants.ForceClosePosition.TOP_RIGHT;
        this.isKitkatAndAbove = null;
        this.mSavedStateLocker = new Object();
        this.mIsImmersive = false;
        this.mCurrentActivityContext = new MutableContextWrapper(activity);
        Logger.i(this.TAG, "C'tor");
        this.mControllerListener = controllerEventListener;
        this.mCacheDirectory = initializeCacheDirectory(this.mCurrentActivityContext.getApplicationContext());
        this.mDemandSourceManager = demandSourceManager;
        initLayout(this.mCurrentActivityContext);
        this.mSavedState = new AdUnitsState();
        DownloadManager downloadManager = getDownloadManager();
        this.downloadManager = downloadManager;
        downloadManager.setOnPreCacheCompletion(this);
        this.mWebChromeClient = new ChromeClient();
        setWebViewClient(new ViewClient());
        setWebChromeClient(this.mWebChromeClient);
        WebViewUtils.setWebViewSettings(this);
        setWebViewSettings();
        createSecuredCommunication();
        setDownloadListener(this);
        setOnTouchListener(new SupersonicWebViewTouchListener());
        this.mUiHandler = createMainThreadHandler();
        this.mConnectivityAdapter = createConnectivityAdapter(activity);
        registerConnectionReceiver(activity);
        setDebugMode(FeaturesManager.getInstance().getDebugMode());
    }

    private ConnectivityAdapter createConnectivityAdapter(Context context) {
        return new ConnectivityAdapter(SDKUtils.getControllerConfigAsJSONObject(), context) { // from class: com.ironsource.sdk.controller.WebController.1
            @Override // com.ironsource.sdk.service.ConnectivityAdapter, com.ironsource.sdk.service.Connectivity.IConnectivityStatus
            public void onConnected(String str, JSONObject jSONObject) {
                if (WebController.this.mIsWebControllerReady) {
                    WebController.this.sendConnectionTypeChanged(str);
                }
            }

            @Override // com.ironsource.sdk.service.ConnectivityAdapter, com.ironsource.sdk.service.Connectivity.IConnectivityStatus
            public void onDisconnected() {
                if (WebController.this.mIsWebControllerReady) {
                    WebController.this.sendConnectionTypeChanged("none");
                }
            }

            @Override // com.ironsource.sdk.service.ConnectivityAdapter, com.ironsource.sdk.service.Connectivity.IConnectivityStatus
            public void onStatusChanged(String str, JSONObject jSONObject) {
                if (jSONObject == null || !WebController.this.mIsWebControllerReady) {
                    return;
                }
                try {
                    jSONObject.put("connectionType", str);
                    WebController.this.sendConnectionInfoChanged(jSONObject);
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        };
    }

    private void createSecuredCommunication() {
        SecureMessagingService secureMessagingService = new SecureMessagingService(SecureMessagingService.generateToken());
        addJavascriptInterface(createControllerMessageHandler(secureMessagingService), Constants.JAVASCRIPT_INTERFACE_NAME);
        addJavascriptInterface(createSecureMessagingInterface(secureMessagingService), Constants.JAVASCRIPT_INERFACE_NAME_GENERATE_TOKEN);
    }

    ControllerMessageHandler createControllerMessageHandler(SecureMessagingService secureMessagingService) {
        return new ControllerMessageHandler(new ControllerAdapter(new NativeAPI()), secureMessagingService);
    }

    SecureMessagingInterface createSecureMessagingInterface(SecureMessagingService secureMessagingService) {
        return new SecureMessagingInterface(secureMessagingService);
    }

    Handler createMainThreadHandler() {
        return new Handler(Looper.getMainLooper());
    }

    DownloadManager getDownloadManager() {
        return DownloadManager.getInstance(this.mCacheDirectory);
    }

    String initializeCacheDirectory(Context context) {
        return IronSourceStorageUtils.initializeCacheDirectory(context.getApplicationContext());
    }

    public void addOmidJSInterface(OMIDJSAdapter oMIDJSAdapter) {
        this.mOmidJsAdapter = oMIDJSAdapter;
    }

    public void addPermissionsJSInterface(PermissionsJSAdapter permissionsJSAdapter) {
        this.mPermissionsJsAdapter = permissionsJSAdapter;
    }

    public void addBannerJSInterface(BannerJSAdapter bannerJSAdapter) {
        this.mBannerJsAdapter = bannerJSAdapter;
        bannerJSAdapter.setCommunicationWithController(getControllerDelegate());
    }

    public void addTokenJSInterface(TokenJSAdapter tokenJSAdapter) {
        this.mTokenJSAdapter = tokenJSAdapter;
    }

    public void addDeviceDataJSInterface(DeviceDataJSAdapter deviceDataJSAdapter) {
        this.mDeviceDataJsAdapter = deviceDataJSAdapter;
    }

    public void addAdViewsJSInterface(AdViewsJSAdapter adViewsJSAdapter) {
        this.mAdViewsJsAdapter = adViewsJSAdapter;
        adViewsJSAdapter.setCommunicationWithController(getControllerDelegate());
    }

    public void notifyLifeCycle(String str, String str2) {
        injectJavascript(generateJSToInject(Constants.JSMethods.ON_NATIVE_LIFE_CYCLE_EVENT, parseToJson(Constants.ParametersKeys.LIFE_CYCLE_EVENT, str2, Constants.ParametersKeys.PRODUCT_TYPE, str, null, null, null, null, null, false)));
    }

    public WebViewMessagingMediator getControllerDelegate() {
        if (this.mWebViewMessagingMediator == null) {
            this.mWebViewMessagingMediator = new WebViewMessagingMediator() { // from class: com.ironsource.sdk.controller.WebController.2
                @Override // com.ironsource.sdk.controller.WebViewMessagingMediator
                public void sendMessageToController(String str, JSONObject jSONObject) {
                    WebController.this.injectJavascript(WebController.this.generateJSToInject(str, jSONObject.toString()));
                }
            };
        }
        return this.mWebViewMessagingMediator;
    }

    private class SupersonicWebViewTouchListener implements View.OnTouchListener {
        private SupersonicWebViewTouchListener() {
        }

        /* JADX WARN: Type inference failed for: r9v6, types: [com.ironsource.sdk.controller.WebController$SupersonicWebViewTouchListener$1] */
        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, MotionEvent motionEvent) {
            if (motionEvent.getAction() == 1) {
                float x = motionEvent.getX();
                float y = motionEvent.getY();
                String str = WebController.this.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("X:");
                int i = (int) x;
                sb.append(i);
                sb.append(" Y:");
                int i2 = (int) y;
                sb.append(i2);
                Logger.i(str, sb.toString());
                int deviceWidth = DeviceStatus.getDeviceWidth();
                int deviceHeight = DeviceStatus.getDeviceHeight();
                Logger.i(WebController.this.TAG, "Width:" + deviceWidth + " Height:" + deviceHeight);
                int iDpToPx = SDKUtils.dpToPx((long) WebController.this.mHiddenForceCloseWidth);
                int iDpToPx2 = SDKUtils.dpToPx((long) WebController.this.mHiddenForceCloseHeight);
                if (Constants.ForceClosePosition.TOP_RIGHT.equalsIgnoreCase(WebController.this.mHiddenForceCloseLocation)) {
                    i = deviceWidth - i;
                } else if (!Constants.ForceClosePosition.TOP_LEFT.equalsIgnoreCase(WebController.this.mHiddenForceCloseLocation)) {
                    if (Constants.ForceClosePosition.BOTTOM_RIGHT.equalsIgnoreCase(WebController.this.mHiddenForceCloseLocation)) {
                        i = deviceWidth - i;
                    } else if (!Constants.ForceClosePosition.BOTTOM_LEFT.equalsIgnoreCase(WebController.this.mHiddenForceCloseLocation)) {
                        i = 0;
                        i2 = 0;
                    }
                    i2 = deviceHeight - i2;
                }
                if (i <= iDpToPx && i2 <= iDpToPx2) {
                    WebController.this.isRemoveCloseEventHandler = false;
                    if (WebController.this.mCloseEventTimer != null) {
                        WebController.this.mCloseEventTimer.cancel();
                    }
                    WebController.this.mCloseEventTimer = new CountDownTimer(2000L, 500L) { // from class: com.ironsource.sdk.controller.WebController.SupersonicWebViewTouchListener.1
                        @Override // android.os.CountDownTimer
                        public void onTick(long j) {
                            Logger.i(WebController.this.TAG, "Close Event Timer Tick " + j);
                        }

                        @Override // android.os.CountDownTimer
                        public void onFinish() {
                            Logger.i(WebController.this.TAG, "Close Event Timer Finish");
                            if (WebController.this.isRemoveCloseEventHandler) {
                                WebController.this.isRemoveCloseEventHandler = false;
                            } else {
                                WebController.this.engageEnd(Constants.ParametersKeys.FORCE_CLOSE);
                            }
                        }
                    }.start();
                }
            }
            return false;
        }
    }

    private void initLayout(Context context) {
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
        this.mControllerLayout = new FrameLayout(context);
        this.mCustomViewContainer = new FrameLayout(context);
        this.mCustomViewContainer.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        this.mCustomViewContainer.setVisibility(8);
        FrameLayout frameLayout = new FrameLayout(context);
        frameLayout.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        frameLayout.addView(this);
        this.mControllerLayout.addView(this.mCustomViewContainer, layoutParams);
        this.mControllerLayout.addView(frameLayout);
    }

    private void setWebViewSettings() {
        WebSettings settings = getSettings();
        settings.setLoadWithOverviewMode(true);
        settings.setUseWideViewPort(true);
        setVerticalScrollBarEnabled(false);
        setHorizontalScrollBarEnabled(false);
        settings.setAllowFileAccess(true);
        settings.setBuiltInZoomControls(false);
        settings.setJavaScriptEnabled(true);
        settings.setSupportMultipleWindows(true);
        settings.setJavaScriptCanOpenWindowsAutomatically(true);
        settings.setGeolocationEnabled(true);
        settings.setGeolocationDatabasePath("/data/data/org.itri.html5webview/databases/");
        settings.setDomStorageEnabled(true);
        try {
            setDisplayZoomControls(settings);
            setMediaPlaybackJellyBean(settings);
        } catch (Throwable th) {
            Logger.e(this.TAG, "setWebSettings - " + th.toString());
        }
    }

    private void setDisplayZoomControls(WebSettings webSettings) {
        if (Build.VERSION.SDK_INT > 11) {
            webSettings.setDisplayZoomControls(false);
        }
    }

    @Override // android.webkit.WebView
    public WebBackForwardList saveState(Bundle bundle) {
        return super.saveState(bundle);
    }

    private void setMediaPlaybackJellyBean(WebSettings webSettings) {
        if (Build.VERSION.SDK_INT >= 17) {
            webSettings.setMediaPlaybackRequiresUserGesture(false);
        }
    }

    private void setWebDebuggingEnabled() {
        if (Build.VERSION.SDK_INT >= 19) {
            setWebContentsDebuggingEnabled(true);
        }
    }

    public void downloadController() {
        IronSourceStorageUtils.deleteFile(this.mCacheDirectory, "", Constants.MOBILE_CONTROLLER_HTML);
        String controllerUrl = SDKUtils.getControllerUrl();
        SSAFile sSAFile = new SSAFile(controllerUrl, "");
        if (!this.downloadManager.isMobileControllerThreadLive()) {
            Logger.i(this.TAG, "Download Mobile Controller: " + controllerUrl);
            this.downloadManager.downloadMobileControllerFile(sSAFile);
            return;
        }
        Logger.i(this.TAG, "Download Mobile Controller: already alive");
    }

    public void setDebugMode(int i) {
        mDebugMode = i;
    }

    public int getDebugMode() {
        return mDebugMode;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean shouldNotifyDeveloper(String str) {
        boolean z = false;
        if (TextUtils.isEmpty(str)) {
            Logger.d(this.TAG, "Trying to trigger a listener - no product was found");
            return false;
        }
        if (!str.equalsIgnoreCase(SSAEnums.ProductType.Interstitial.toString()) ? !str.equalsIgnoreCase(SSAEnums.ProductType.RewardedVideo.toString()) ? !str.equalsIgnoreCase(SSAEnums.ProductType.Banner.toString()) ? (str.equalsIgnoreCase(SSAEnums.ProductType.OfferWall.toString()) || str.equalsIgnoreCase(SSAEnums.ProductType.OfferWallCredits.toString())) && this.mOnOfferWallListener != null : this.mDSBannerListener != null : this.mDSRewardedVideoListener != null : this.mDSInterstitialListener != null) {
            z = true;
        }
        if (!z) {
            Logger.d(this.TAG, "Trying to trigger a listener - no listener was found for product " + str);
        }
        return z;
    }

    public void setOrientationState(String str) {
        this.mOrientationState = str;
    }

    public String getOrientationState() {
        return this.mOrientationState;
    }

    private class ViewClient extends WebViewClient {
        private ViewClient() {
        }

        @Override // android.webkit.WebViewClient
        public void onPageStarted(WebView webView, String str, Bitmap bitmap) {
            Logger.i("onPageStarted", str);
            super.onPageStarted(webView, str, bitmap);
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView webView, String str) {
            Logger.i("onPageFinished", str);
            if (str.contains("adUnit") || str.contains("index.html")) {
                WebController.this.pageFinished();
            }
            super.onPageFinished(webView, str);
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView webView, int i, String str, String str2) {
            Logger.i("onReceivedError", str2 + " " + str);
            if (str2.contains(Constants.MOBILE_CONTROLLER_HTML) && WebController.this.mControllerListener != null) {
                WebController.this.mControllerListener.handleControllerStageFailed("WebView failed to load mobileController.html - " + str + " (errorCode: " + i + ")");
            }
            super.onReceivedError(webView, i, str, str2);
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView webView, String str) {
            Logger.i("shouldOverrideUrlLoading", str);
            try {
                if (WebController.this.handleSearchKeysURLs(str)) {
                    WebController.this.interceptedUrlToStore();
                    return true;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return super.shouldOverrideUrlLoading(webView, str);
        }

        @Override // android.webkit.WebViewClient
        public WebResourceResponse shouldInterceptRequest(WebView webView, String str) {
            boolean zContains;
            Logger.i("shouldInterceptRequest", str);
            try {
                zContains = new URL(str).getFile().contains("mraid.js");
            } catch (MalformedURLException unused) {
                zContains = false;
            }
            if (zContains) {
                String str2 = "file://" + WebController.this.mCacheDirectory + File.separator + "mraid.js";
                try {
                    new FileInputStream(new File(str2));
                    return new WebResourceResponse("text/javascript", DownloadManager.UTF8_CHARSET, getClass().getResourceAsStream(str2));
                } catch (FileNotFoundException unused2) {
                }
            }
            return super.shouldInterceptRequest(webView, str);
        }
    }

    private class ChromeClient extends WebChromeClient {
        private ChromeClient() {
        }

        @Override // android.webkit.WebChromeClient
        public boolean onCreateWindow(WebView webView, boolean z, boolean z2, Message message) {
            WebView webView2 = new WebView(webView.getContext());
            webView2.setWebChromeClient(this);
            webView2.setWebViewClient(new FrameBustWebViewClient());
            ((WebView.WebViewTransport) message.obj).setWebView(webView2);
            message.sendToTarget();
            Logger.i("onCreateWindow", "onCreateWindow");
            return true;
        }

        @Override // android.webkit.WebChromeClient
        public boolean onConsoleMessage(ConsoleMessage consoleMessage) {
            Logger.i("MyApplication", consoleMessage.message() + " -- From line " + consoleMessage.lineNumber() + " of " + consoleMessage.sourceId());
            return true;
        }

        @Override // android.webkit.WebChromeClient
        public void onShowCustomView(View view, WebChromeClient.CustomViewCallback customViewCallback) {
            Logger.i("Test", "onShowCustomView");
            WebController.this.setVisibility(8);
            if (WebController.this.mCustomView != null) {
                Logger.i("Test", "mCustomView != null");
                customViewCallback.onCustomViewHidden();
                return;
            }
            Logger.i("Test", "mCustomView == null");
            WebController.this.mCustomViewContainer.addView(view);
            WebController.this.mCustomView = view;
            WebController.this.mCustomViewCallback = customViewCallback;
            WebController.this.mCustomViewContainer.setVisibility(0);
        }

        @Override // android.webkit.WebChromeClient
        public View getVideoLoadingProgressView() {
            FrameLayout frameLayout = new FrameLayout(WebController.this.getCurrentActivityContext());
            frameLayout.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
            return frameLayout;
        }

        @Override // android.webkit.WebChromeClient
        public void onHideCustomView() {
            Logger.i("Test", "onHideCustomView");
            if (WebController.this.mCustomView == null) {
                return;
            }
            WebController.this.mCustomView.setVisibility(8);
            WebController.this.mCustomViewContainer.removeView(WebController.this.mCustomView);
            WebController.this.mCustomView = null;
            WebController.this.mCustomViewContainer.setVisibility(8);
            WebController.this.mCustomViewCallback.onCustomViewHidden();
            WebController.this.setVisibility(0);
        }
    }

    private class FrameBustWebViewClient extends WebViewClient {
        private FrameBustWebViewClient() {
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView webView, String str) {
            Context currentActivityContext = WebController.this.getCurrentActivityContext();
            Intent intent = new Intent(currentActivityContext, (Class<?>) OpenUrlActivity.class);
            intent.putExtra(WebController.EXTERNAL_URL, str);
            intent.putExtra(WebController.SECONDARY_WEB_VIEW, false);
            currentActivityContext.startActivity(intent);
            return true;
        }
    }

    public class NativeAPI {
        public NativeAPI() {
        }

        @JavascriptInterface
        public void removeMessagingInterface(String str) {
            WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.1
                @Override // java.lang.Runnable
                public void run() {
                    WebController.this.removeJavascriptInterface(Constants.JAVASCRIPT_INERFACE_NAME_GENERATE_TOKEN);
                }
            });
        }

        @JavascriptInterface
        public void initController(String str) {
            Logger.i(WebController.this.TAG, "initController(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            if (WebController.this.mLoadControllerTimer != null) {
                WebController.this.mLoadControllerTimer.cancel();
                WebController.this.mLoadControllerTimer = null;
            }
            if (sSAObj.containsKey(Constants.ParametersKeys.STAGE)) {
                String string = sSAObj.getString(Constants.ParametersKeys.STAGE);
                if (Constants.ParametersKeys.READY.equalsIgnoreCase(string)) {
                    WebController.this.mIsWebControllerReady = true;
                    WebController.this.mControllerListener.handleControllerStageReady();
                    return;
                }
                if (Constants.ParametersKeys.LOADED.equalsIgnoreCase(string)) {
                    WebController.this.mControllerListener.handleControllerStageLoaded();
                    return;
                }
                if (!Constants.ParametersKeys.FAILED.equalsIgnoreCase(string)) {
                    Logger.i(WebController.this.TAG, "No STAGE mentioned! Should not get here!");
                    return;
                }
                String string2 = sSAObj.getString("errMsg");
                WebController.this.mControllerListener.handleControllerStageFailed("controller failed to initialize : " + string2);
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:10:0x0054  */
        @android.webkit.JavascriptInterface
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void getDeviceStatus(java.lang.String r5) {
            /*
                r4 = this;
                com.ironsource.sdk.controller.WebController r0 = com.ironsource.sdk.controller.WebController.this
                java.lang.String r0 = com.ironsource.sdk.controller.WebController.access$600(r0)
                java.lang.StringBuilder r1 = new java.lang.StringBuilder
                r1.<init>()
                java.lang.String r2 = "getDeviceStatus("
                r1.append(r2)
                r1.append(r5)
                java.lang.String r2 = ")"
                r1.append(r2)
                java.lang.String r1 = r1.toString()
                com.ironsource.sdk.utils.Logger.i(r0, r1)
                com.ironsource.sdk.controller.WebController r0 = com.ironsource.sdk.controller.WebController.this
                java.lang.String r0 = com.ironsource.sdk.controller.WebController.access$1800(r0, r5)
                com.ironsource.sdk.controller.WebController r1 = com.ironsource.sdk.controller.WebController.this
                java.lang.String r5 = com.ironsource.sdk.controller.WebController.access$1900(r1, r5)
                com.ironsource.sdk.controller.WebController r1 = com.ironsource.sdk.controller.WebController.this
                android.content.Context r2 = r1.getContext()
                java.lang.Object[] r1 = com.ironsource.sdk.controller.WebController.access$2000(r1, r2)
                r2 = 0
                r2 = r1[r2]
                java.lang.String r2 = (java.lang.String) r2
                r3 = 1
                r1 = r1[r3]
                java.lang.Boolean r1 = (java.lang.Boolean) r1
                boolean r1 = r1.booleanValue()
                if (r1 == 0) goto L4d
                boolean r0 = android.text.TextUtils.isEmpty(r5)
                if (r0 != 0) goto L54
                r0 = r5
                goto L55
            L4d:
                boolean r5 = android.text.TextUtils.isEmpty(r0)
                if (r5 != 0) goto L54
                goto L55
            L54:
                r0 = 0
            L55:
                boolean r5 = android.text.TextUtils.isEmpty(r0)
                if (r5 != 0) goto L6a
                com.ironsource.sdk.controller.WebController r5 = com.ironsource.sdk.controller.WebController.this
                java.lang.String r1 = "onGetDeviceStatusSuccess"
                java.lang.String r3 = "onGetDeviceStatusFail"
                java.lang.String r5 = com.ironsource.sdk.controller.WebController.access$2100(r5, r0, r2, r1, r3)
                com.ironsource.sdk.controller.WebController r0 = com.ironsource.sdk.controller.WebController.this
                com.ironsource.sdk.controller.WebController.access$500(r0, r5)
            L6a:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.ironsource.sdk.controller.WebController.NativeAPI.getDeviceStatus(java.lang.String):void");
        }

        @JavascriptInterface
        public void getConnectivityInfo(String str) {
            String strGenerateJSToInject;
            Logger.i(WebController.this.TAG, "getConnectivityInfo(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            String string = sSAObj.getString(WebController.JSON_KEY_SUCCESS);
            String string2 = sSAObj.getString(WebController.JSON_KEY_FAIL);
            JSONObject jSONObject = new JSONObject();
            if (WebController.this.mConnectivityAdapter != null) {
                jSONObject = WebController.this.mConnectivityAdapter.getConnectivityData(WebController.this.getContext());
            }
            if (jSONObject.length() > 0) {
                strGenerateJSToInject = WebController.this.generateJSToInject(string, jSONObject.toString());
            } else {
                strGenerateJSToInject = WebController.this.generateJSToInject(string2, WebController.this.parseToJson("errMsg", Constants.ErrorCodes.FAILED_TO_RETRIEVE_CONNECTION_INFO, null, null, null, null, null, null, null, false));
            }
            WebController.this.injectJavascript(strGenerateJSToInject);
        }

        @JavascriptInterface
        public void setMixedContentAlwaysAllow(String str) {
            Logger.i(WebController.this.TAG, "setMixedContentAlwaysAllow(" + str + ")");
            WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.2
                @Override // java.lang.Runnable
                public void run() {
                    if (Build.VERSION.SDK_INT >= 21) {
                        WebController.this.getSettings().setMixedContentMode(0);
                    }
                }
            });
        }

        @JavascriptInterface
        public void getControllerConfig(String str) {
            Logger.i(WebController.this.TAG, "getControllerConfig(" + str + ")");
            String string = new SSAObj(str).getString(WebController.JSON_KEY_SUCCESS);
            if (TextUtils.isEmpty(string)) {
                return;
            }
            JSONObject controllerConfigAsJSONObject = SDKUtils.getControllerConfigAsJSONObject();
            extendControllerConfig(controllerConfigAsJSONObject);
            WebController.this.injectJavascript(WebController.this.generateJSToInject(string, controllerConfigAsJSONObject.toString()));
        }

        private void extendControllerConfig(JSONObject jSONObject) {
            addSupportedNativeFeaturesToConfig(jSONObject);
            addTesterParametersToConfig(jSONObject, SDKUtils.getTesterParameters());
        }

        private void addSupportedNativeFeaturesToConfig(JSONObject jSONObject) {
            try {
                FeaturesManager featuresManager = FeaturesManager.getInstance();
                if (featuresManager.getSupportedFeatures().isEmpty()) {
                    return;
                }
                jSONObject.put(Constants.ControllerConfigurationKeys.NATIVE_FEATURES_KEY, new JSONArray((Collection) featuresManager.getSupportedFeatures()));
            } catch (Exception e) {
                ISNEventsTracker.logEvent(SDK5Events.appendNativeFeaturesDataFailed, new ISNEventParams().addPair(Events.CALL_FAILED_REASON, e.getMessage()).getData());
                Logger.d(WebController.this.TAG, "getControllerConfig Error while adding supported features data from FeaturesManager");
            }
        }

        private void addTesterParametersToConfig(JSONObject jSONObject, String str) {
            if (areTesterParametersValid(str)) {
                try {
                    JSONObject jSONObject2 = new JSONObject(str);
                    jSONObject.putOpt("testerABGroup", jSONObject2.get("testerABGroup"));
                    jSONObject.putOpt("testFriendlyName", jSONObject2.get("testFriendlyName"));
                } catch (JSONException unused) {
                    Logger.d(WebController.this.TAG, "getControllerConfig Error while parsing Tester AB Group parameters");
                }
            }
        }

        boolean areTesterParametersValid(String str) {
            if (TextUtils.isEmpty(str) || str.contains("-1")) {
                return false;
            }
            try {
                JSONObject jSONObject = new JSONObject(str);
                if (jSONObject.getString("testerABGroup").isEmpty()) {
                    return false;
                }
                return !jSONObject.getString("testFriendlyName").isEmpty();
            } catch (JSONException e) {
                e.printStackTrace();
                return false;
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:10:0x005f  */
        @android.webkit.JavascriptInterface
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void getApplicationInfo(java.lang.String r5) {
            /*
                r4 = this;
                com.ironsource.sdk.controller.WebController r0 = com.ironsource.sdk.controller.WebController.this
                java.lang.String r0 = com.ironsource.sdk.controller.WebController.access$600(r0)
                java.lang.StringBuilder r1 = new java.lang.StringBuilder
                r1.<init>()
                java.lang.String r2 = "getApplicationInfo("
                r1.append(r2)
                r1.append(r5)
                java.lang.String r2 = ")"
                r1.append(r2)
                java.lang.String r1 = r1.toString()
                com.ironsource.sdk.utils.Logger.i(r0, r1)
                com.ironsource.sdk.controller.WebController r0 = com.ironsource.sdk.controller.WebController.this
                java.lang.String r0 = com.ironsource.sdk.controller.WebController.access$1800(r0, r5)
                com.ironsource.sdk.controller.WebController r1 = com.ironsource.sdk.controller.WebController.this
                java.lang.String r1 = com.ironsource.sdk.controller.WebController.access$1900(r1, r5)
                com.ironsource.sdk.data.SSAObj r2 = new com.ironsource.sdk.data.SSAObj
                r2.<init>(r5)
                java.lang.String r5 = "productType"
                java.lang.String r5 = r2.getString(r5)
                java.lang.String r2 = com.ironsource.sdk.utils.SDKUtils.fetchDemandSourceId(r2)
                com.ironsource.sdk.controller.WebController r3 = com.ironsource.sdk.controller.WebController.this
                java.lang.Object[] r5 = com.ironsource.sdk.controller.WebController.access$2600(r3, r5, r2)
                r2 = 0
                r2 = r5[r2]
                java.lang.String r2 = (java.lang.String) r2
                r3 = 1
                r5 = r5[r3]
                java.lang.Boolean r5 = (java.lang.Boolean) r5
                boolean r5 = r5.booleanValue()
                if (r5 == 0) goto L58
                boolean r5 = android.text.TextUtils.isEmpty(r1)
                if (r5 != 0) goto L5f
                r0 = r1
                goto L60
            L58:
                boolean r5 = android.text.TextUtils.isEmpty(r0)
                if (r5 != 0) goto L5f
                goto L60
            L5f:
                r0 = 0
            L60:
                boolean r5 = android.text.TextUtils.isEmpty(r0)
                if (r5 != 0) goto L75
                com.ironsource.sdk.controller.WebController r5 = com.ironsource.sdk.controller.WebController.this
                java.lang.String r1 = "onGetApplicationInfoSuccess"
                java.lang.String r3 = "onGetApplicationInfoFail"
                java.lang.String r5 = com.ironsource.sdk.controller.WebController.access$2100(r5, r0, r2, r1, r3)
                com.ironsource.sdk.controller.WebController r0 = com.ironsource.sdk.controller.WebController.this
                com.ironsource.sdk.controller.WebController.access$500(r0, r5)
            L75:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.ironsource.sdk.controller.WebController.NativeAPI.getApplicationInfo(java.lang.String):void");
        }

        @JavascriptInterface
        public void saveFile(String str) {
            Logger.i(WebController.this.TAG, "saveFile(" + str + ")");
            SSAFile sSAFile = new SSAFile(str);
            if (DeviceStatus.getAvailableMemorySizeInMegaBytes(WebController.this.mCacheDirectory) <= 0) {
                WebController.this.responseBack(str, false, DownloadManager.NO_DISK_SPACE, null);
                return;
            }
            if (!SDKUtils.isExternalStorageAvailable()) {
                WebController.this.responseBack(str, false, DownloadManager.STORAGE_UNAVAILABLE, null);
                return;
            }
            if (IronSourceStorageUtils.isFileCached(WebController.this.mCacheDirectory, sSAFile)) {
                WebController.this.responseBack(str, false, DownloadManager.FILE_ALREADY_EXIST, null);
                return;
            }
            if (!ConnectivityService.isConnected(WebController.this.getContext())) {
                WebController.this.responseBack(str, false, DownloadManager.NO_NETWORK_CONNECTION, null);
                return;
            }
            WebController.this.responseBack(str, true, null, null);
            String lastUpdateTime = sSAFile.getLastUpdateTime();
            if (lastUpdateTime != null) {
                String strValueOf = String.valueOf(lastUpdateTime);
                if (!TextUtils.isEmpty(strValueOf)) {
                    String path = sSAFile.getPath();
                    if (path.contains("/")) {
                        String[] strArrSplit = sSAFile.getPath().split("/");
                        path = strArrSplit[strArrSplit.length - 1];
                    }
                    IronSourceSharedPrefHelper.getSupersonicPrefHelper().setCampaignLastUpdate(path, strValueOf);
                }
            }
            WebController.this.downloadManager.downloadFile(sSAFile);
        }

        @JavascriptInterface
        public void adUnitsReady(String str) {
            Logger.i(WebController.this.TAG, "adUnitsReady(" + str + ")");
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(new SSAObj(str));
            final AdUnitsReady adUnitsReady = new AdUnitsReady(str);
            if (!adUnitsReady.isNumOfAdUnitsExist()) {
                WebController.this.responseBack(str, false, Constants.ErrorCodes.NUM_OF_AD_UNITS_DO_NOT_EXIST, null);
                return;
            }
            WebController.this.responseBack(str, true, null, null);
            String productType = adUnitsReady.getProductType();
            if (SSAEnums.ProductType.RewardedVideo.toString().equalsIgnoreCase(productType) && WebController.this.shouldNotifyDeveloper(productType)) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.3
                    @Override // java.lang.Runnable
                    public void run() {
                        if (Integer.parseInt(adUnitsReady.getNumOfAdUnits()) > 0) {
                            Log.d(WebController.this.TAG, "onRVInitSuccess()");
                            WebController.this.mDSRewardedVideoListener.onAdProductInitSuccess(SSAEnums.ProductType.RewardedVideo, strFetchDemandSourceId, adUnitsReady);
                        } else {
                            WebController.this.mDSRewardedVideoListener.onRVNoMoreOffers(strFetchDemandSourceId);
                        }
                    }
                });
            }
        }

        @JavascriptInterface
        public void iabTokenAPI(String str) {
            try {
                Logger.i(WebController.this.TAG, "iabTokenAPI(" + str + ")");
                WebController.this.mTokenJSAdapter.call(new SSAObj(str).toString(), new JSCallbackTask());
            } catch (Exception e) {
                e.printStackTrace();
                Logger.i(WebController.this.TAG, "iabTokenAPI failed with exception " + e.getMessage());
            }
        }

        @JavascriptInterface
        public void deleteFolder(String str) {
            Logger.i(WebController.this.TAG, "deleteFolder(" + str + ")");
            SSAFile sSAFile = new SSAFile(str);
            if (!IronSourceStorageUtils.isPathExist(WebController.this.mCacheDirectory, sSAFile.getPath())) {
                WebController.this.responseBack(str, false, Constants.ErrorCodes.FOLDER_NOT_EXIST_MSG, "1");
            } else {
                WebController.this.responseBack(str, IronSourceStorageUtils.deleteFolder(WebController.this.mCacheDirectory, sSAFile.getPath()), null, null);
            }
        }

        @JavascriptInterface
        public void deleteFile(String str) {
            Logger.i(WebController.this.TAG, "deleteFile(" + str + ")");
            SSAFile sSAFile = new SSAFile(str);
            if (!IronSourceStorageUtils.isPathExist(WebController.this.mCacheDirectory, sSAFile.getPath())) {
                WebController.this.responseBack(str, false, Constants.ErrorCodes.FILE_NOT_EXIST_MSG, "1");
            } else {
                WebController.this.responseBack(str, IronSourceStorageUtils.deleteFile(WebController.this.mCacheDirectory, sSAFile.getPath(), sSAFile.getFile()), null, null);
            }
        }

        @JavascriptInterface
        public void displayWebView(String str) {
            Intent intent;
            Logger.i(WebController.this.TAG, "displayWebView(" + str + ")");
            WebController.this.responseBack(str, true, null, null);
            SSAObj sSAObj = new SSAObj(str);
            boolean zBooleanValue = ((Boolean) sSAObj.get("display")).booleanValue();
            String string = sSAObj.getString(Constants.ParametersKeys.PRODUCT_TYPE);
            boolean z = sSAObj.getBoolean(Constants.ParametersKeys.IS_STANDALONE_VIEW);
            String string2 = sSAObj.getString(Constants.ParametersKeys.AD_VIEW_ID);
            String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(sSAObj);
            if (zBooleanValue) {
                WebController.this.mIsImmersive = sSAObj.getBoolean(Constants.ParametersKeys.IMMERSIVE);
                boolean z2 = sSAObj.getBoolean(Constants.ParametersKeys.ACTIVITY_THEME_TRANSLUCENT);
                if (WebController.this.getState() == State.Display) {
                    Logger.i(WebController.this.TAG, "State: " + WebController.this.mState);
                    return;
                }
                WebController.this.setState(State.Display);
                Logger.i(WebController.this.TAG, "State: " + WebController.this.mState);
                Context currentActivityContext = WebController.this.getCurrentActivityContext();
                String orientationState = WebController.this.getOrientationState();
                int applicationRotation = DeviceStatus.getApplicationRotation(currentActivityContext);
                if (z) {
                    ControllerView controllerView = new ControllerView(currentActivityContext);
                    controllerView.addView(WebController.this.mControllerLayout);
                    controllerView.showInterstitial(WebController.this);
                    return;
                }
                if (z2) {
                    intent = new Intent(currentActivityContext, (Class<?>) InterstitialActivity.class);
                } else {
                    intent = new Intent(currentActivityContext, (Class<?>) ControllerActivity.class);
                }
                if (SSAEnums.ProductType.RewardedVideo.toString().equalsIgnoreCase(string)) {
                    if (Constants.ParametersKeys.ORIENTATION_APPLICATION.equals(orientationState)) {
                        orientationState = SDKUtils.translateRequestedOrientation(DeviceStatus.getActivityRequestedOrientation(WebController.this.getCurrentActivityContext()));
                    }
                    intent.putExtra(Constants.ParametersKeys.PRODUCT_TYPE, SSAEnums.ProductType.RewardedVideo.toString());
                    WebController.this.mSavedState.adOpened(SSAEnums.ProductType.RewardedVideo.ordinal());
                    WebController.this.mSavedState.setDisplayedDemandSourceId(strFetchDemandSourceId);
                    if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.RewardedVideo.toString())) {
                        WebController.this.mDSRewardedVideoListener.onAdProductOpen(SSAEnums.ProductType.RewardedVideo, strFetchDemandSourceId);
                    }
                } else if (SSAEnums.ProductType.OfferWall.toString().equalsIgnoreCase(string)) {
                    intent.putExtra(Constants.ParametersKeys.PRODUCT_TYPE, SSAEnums.ProductType.OfferWall.toString());
                    WebController.this.mSavedState.adOpened(SSAEnums.ProductType.OfferWall.ordinal());
                } else if (SSAEnums.ProductType.Interstitial.toString().equalsIgnoreCase(string)) {
                    if (Constants.ParametersKeys.ORIENTATION_APPLICATION.equals(orientationState)) {
                        orientationState = SDKUtils.translateRequestedOrientation(DeviceStatus.getActivityRequestedOrientation(WebController.this.getCurrentActivityContext()));
                    }
                    intent.putExtra(Constants.ParametersKeys.PRODUCT_TYPE, SSAEnums.ProductType.Interstitial.toString());
                }
                if (string2 != null) {
                    intent.putExtra(Constants.ParametersKeys.AD_VIEW_ID, string2);
                }
                intent.setFlags(536870912);
                intent.putExtra(Constants.ParametersKeys.IMMERSIVE, WebController.this.mIsImmersive);
                intent.putExtra(Constants.ParametersKeys.ORIENTATION_SET_FLAG, orientationState);
                intent.putExtra(Constants.ParametersKeys.ROTATION_SET_FLAG, applicationRotation);
                currentActivityContext.startActivity(intent);
                return;
            }
            WebController.this.setState(State.Gone);
            WebController.this.closeWebView();
        }

        @JavascriptInterface
        public void getOrientation(String str) {
            String strExtractSuccessFunctionToCall = WebController.this.extractSuccessFunctionToCall(str);
            String string = SDKUtils.getOrientation(WebController.this.getCurrentActivityContext()).toString();
            if (TextUtils.isEmpty(strExtractSuccessFunctionToCall)) {
                return;
            }
            WebController.this.injectJavascript(WebController.this.generateJSToInject(strExtractSuccessFunctionToCall, string, Constants.JSMethods.ON_GET_ORIENTATION_SUCCESS, Constants.JSMethods.ON_GET_ORIENTATION_FAIL));
        }

        @JavascriptInterface
        public void setOrientation(String str) {
            Logger.i(WebController.this.TAG, "setOrientation(" + str + ")");
            String string = new SSAObj(str).getString(Constants.ParametersKeys.ORIENTATION);
            WebController.this.setOrientationState(string);
            int applicationRotation = DeviceStatus.getApplicationRotation(WebController.this.getCurrentActivityContext());
            if (WebController.this.mChangeListener != null) {
                WebController.this.mChangeListener.onOrientationChanged(string, applicationRotation);
            }
        }

        @JavascriptInterface
        public void getCachedFilesMap(String str) {
            Logger.i(WebController.this.TAG, "getCachedFilesMap(" + str + ")");
            String strExtractSuccessFunctionToCall = WebController.this.extractSuccessFunctionToCall(str);
            if (TextUtils.isEmpty(strExtractSuccessFunctionToCall)) {
                return;
            }
            SSAObj sSAObj = new SSAObj(str);
            if (!sSAObj.containsKey("path")) {
                WebController.this.responseBack(str, false, Constants.ErrorCodes.PATH_KEY_DOES_NOT_EXIST, null);
                return;
            }
            String str2 = (String) sSAObj.get("path");
            if (!IronSourceStorageUtils.isPathExist(WebController.this.mCacheDirectory, str2)) {
                WebController.this.responseBack(str, false, Constants.ErrorCodes.PATH_FILE_DOES_NOT_EXIST_ON_DISK, null);
                return;
            }
            WebController.this.injectJavascript(WebController.this.generateJSToInject(strExtractSuccessFunctionToCall, IronSourceStorageUtils.getCachedFilesMap(WebController.this.mCacheDirectory, str2), Constants.JSMethods.ON_GET_CACHED_FILES_MAP_SUCCESS, Constants.JSMethods.ON_GET_CACHED_FILES_MAP_FAIL));
        }

        private void callJavaScriptFunction(String str, String str2) {
            if (TextUtils.isEmpty(str)) {
                return;
            }
            WebController.this.injectJavascript(WebController.this.generateJSToInject(str, str2));
        }

        @JavascriptInterface
        public void getDemandSourceState(String str) {
            String strExtractFailFunctionToCall;
            Logger.i(WebController.this.TAG, "getMediationState(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            String string = sSAObj.getString("demandSourceName");
            String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(sSAObj);
            String string2 = sSAObj.getString(Constants.ParametersKeys.PRODUCT_TYPE);
            if (string2 == null || string == null) {
                return;
            }
            try {
                SSAEnums.ProductType productType = SDKUtils.getProductType(string2);
                if (productType != null) {
                    DemandSource demandSourceById = WebController.this.mDemandSourceManager.getDemandSourceById(productType, strFetchDemandSourceId);
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put(Constants.ParametersKeys.PRODUCT_TYPE, string2);
                    jSONObject.put("demandSourceName", string);
                    jSONObject.put("demandSourceId", strFetchDemandSourceId);
                    if (demandSourceById == null || demandSourceById.isMediationState(-1)) {
                        strExtractFailFunctionToCall = WebController.this.extractFailFunctionToCall(str);
                    } else {
                        strExtractFailFunctionToCall = WebController.this.extractSuccessFunctionToCall(str);
                        jSONObject.put("state", demandSourceById.getMediationState());
                    }
                    callJavaScriptFunction(strExtractFailFunctionToCall, jSONObject.toString());
                }
            } catch (Exception e) {
                WebController.this.responseBack(str, false, e.getMessage(), null);
                e.printStackTrace();
            }
        }

        @JavascriptInterface
        public void adCredited(final String str) {
            final String string;
            final boolean z;
            final boolean z2;
            Log.d(WebController.this.PUB_TAG, "adCredited(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            String string2 = sSAObj.getString(Constants.ParametersKeys.CREDITS);
            boolean z3 = false;
            final int i = string2 != null ? Integer.parseInt(string2) : 0;
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(sSAObj);
            final String string3 = sSAObj.getString(Constants.ParametersKeys.PRODUCT_TYPE);
            if (TextUtils.isEmpty(string3)) {
                Log.d(WebController.this.PUB_TAG, "adCredited | not product NAME !!!!");
            }
            if (SSAEnums.ProductType.Interstitial.toString().equalsIgnoreCase(string3)) {
                handleAdCreditedOnInterstitial(strFetchDemandSourceId, i);
                return;
            }
            String string4 = sSAObj.getString(Constants.ParametersKeys.TOTAL);
            final int i2 = string4 != null ? Integer.parseInt(string4) : 0;
            sSAObj.getBoolean("externalPoll");
            if (!SSAEnums.ProductType.OfferWall.toString().equalsIgnoreCase(string3)) {
                string = null;
                z = false;
                z2 = false;
            } else {
                if (sSAObj.isNull("signature") || sSAObj.isNull(DataBaseEventsStorage.EventEntry.COLUMN_NAME_TIMESTAMP) || sSAObj.isNull("totalCreditsFlag")) {
                    WebController.this.responseBack(str, false, "One of the keys are missing: signature/timestamp/totalCreditsFlag", null);
                    return;
                }
                if (sSAObj.getString("signature").equalsIgnoreCase(SDKUtils.getMD5(string4 + WebController.this.mApplicationKey + WebController.this.mUserId))) {
                    z3 = true;
                } else {
                    WebController.this.responseBack(str, false, "Controller signature is not equal to SDK signature", null);
                }
                boolean z4 = sSAObj.getBoolean("totalCreditsFlag");
                string = sSAObj.getString(DataBaseEventsStorage.EventEntry.COLUMN_NAME_TIMESTAMP);
                z2 = z4;
                z = z3;
            }
            if (WebController.this.shouldNotifyDeveloper(string3)) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.4
                    @Override // java.lang.Runnable
                    public void run() {
                        if (string3.equalsIgnoreCase(SSAEnums.ProductType.RewardedVideo.toString())) {
                            WebController.this.mDSRewardedVideoListener.onRVAdCredited(strFetchDemandSourceId, i);
                            return;
                        }
                        if (string3.equalsIgnoreCase(SSAEnums.ProductType.OfferWall.toString()) && z && WebController.this.mOnOfferWallListener.onOWAdCredited(i, i2, z2) && !TextUtils.isEmpty(string)) {
                            if (IronSourceSharedPrefHelper.getSupersonicPrefHelper().setLatestCompletionsTime(string, WebController.this.mApplicationKey, WebController.this.mUserId)) {
                                WebController.this.responseBack(str, true, null, null);
                            } else {
                                WebController.this.responseBack(str, false, "Time Stamp could not be stored", null);
                            }
                        }
                    }
                });
            }
        }

        private void handleAdCreditedOnInterstitial(final String str, final int i) {
            DemandSource demandSourceById;
            if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.Interstitial.toString()) && (demandSourceById = WebController.this.mDemandSourceManager.getDemandSourceById(SSAEnums.ProductType.Interstitial, str)) != null && demandSourceById.isRewarded()) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.5
                    @Override // java.lang.Runnable
                    public void run() {
                        WebController.this.mDSInterstitialListener.onInterstitialAdRewarded(str, i);
                    }
                });
            }
        }

        @JavascriptInterface
        public void removeCloseEventHandler(String str) {
            Logger.i(WebController.this.TAG, "removeCloseEventHandler(" + str + ")");
            if (WebController.this.mCloseEventTimer != null) {
                WebController.this.mCloseEventTimer.cancel();
            }
            WebController.this.isRemoveCloseEventHandler = true;
        }

        @JavascriptInterface
        public void onGetDeviceStatusSuccess(String str) {
            Logger.i(WebController.this.TAG, "onGetDeviceStatusSuccess(" + str + ")");
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_GET_DEVICE_STATUS_SUCCESS, str);
        }

        @JavascriptInterface
        public void onGetDeviceStatusFail(String str) {
            Logger.i(WebController.this.TAG, "onGetDeviceStatusFail(" + str + ")");
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_GET_DEVICE_STATUS_FAIL, str);
        }

        @JavascriptInterface
        public void onInitRewardedVideoFail(String str) {
            Logger.i(WebController.this.TAG, "onInitRewardedVideoFail(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            final String string = sSAObj.getString("errMsg");
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(sSAObj);
            DemandSource demandSourceById = WebController.this.mDemandSourceManager.getDemandSourceById(SSAEnums.ProductType.RewardedVideo, strFetchDemandSourceId);
            if (demandSourceById != null) {
                demandSourceById.setDemandSourceInitState(3);
            }
            if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.RewardedVideo.toString())) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.6
                    @Override // java.lang.Runnable
                    public void run() {
                        String str2 = string;
                        if (str2 == null) {
                            str2 = "We're sorry, some error occurred. we will investigate it";
                        }
                        Log.d(WebController.this.TAG, "onRVInitFail(message:" + str2 + ")");
                        WebController.this.mDSRewardedVideoListener.onAdProductInitFailed(SSAEnums.ProductType.RewardedVideo, strFetchDemandSourceId, str2);
                    }
                });
            }
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_INIT_REWARDED_VIDEO_FAIL, str);
        }

        @JavascriptInterface
        public void onGetApplicationInfoSuccess(String str) {
            Logger.i(WebController.this.TAG, "onGetApplicationInfoSuccess(" + str + ")");
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_GET_APPLICATION_INFO_SUCCESS, str);
        }

        @JavascriptInterface
        public void onGetApplicationInfoFail(String str) {
            Logger.i(WebController.this.TAG, "onGetApplicationInfoFail(" + str + ")");
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_GET_APPLICATION_INFO_FAIL, str);
        }

        @JavascriptInterface
        public void onShowRewardedVideoSuccess(String str) {
            Logger.i(WebController.this.TAG, "onShowRewardedVideoSuccess(" + str + ")");
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_SHOW_REWARDED_VIDEO_SUCCESS, str);
        }

        @JavascriptInterface
        public void onShowRewardedVideoFail(String str) {
            Logger.i(WebController.this.TAG, "onShowRewardedVideoFail(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            final String string = sSAObj.getString("errMsg");
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(sSAObj);
            if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.RewardedVideo.toString())) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.7
                    @Override // java.lang.Runnable
                    public void run() {
                        String str2 = string;
                        if (str2 == null) {
                            str2 = "We're sorry, some error occurred. we will investigate it";
                        }
                        Log.d(WebController.this.TAG, "onRVShowFail(message:" + string + ")");
                        WebController.this.mDSRewardedVideoListener.onRVShowFail(strFetchDemandSourceId, str2);
                    }
                });
            }
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_SHOW_REWARDED_VIDEO_FAIL, str);
        }

        @JavascriptInterface
        public void onGetCachedFilesMapSuccess(String str) {
            Logger.i(WebController.this.TAG, "onGetCachedFilesMapSuccess(" + str + ")");
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_GET_CACHED_FILES_MAP_SUCCESS, str);
        }

        @JavascriptInterface
        public void onGetCachedFilesMapFail(String str) {
            Logger.i(WebController.this.TAG, "onGetCachedFilesMapFail(" + str + ")");
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_GET_CACHED_FILES_MAP_FAIL, str);
        }

        @JavascriptInterface
        public void onShowOfferWallSuccess(String str) {
            Logger.i(WebController.this.TAG, "onShowOfferWallSuccess(" + str + ")");
            WebController.this.mSavedState.adOpened(SSAEnums.ProductType.OfferWall.ordinal());
            final String valueFromJsonObject = SDKUtils.getValueFromJsonObject(str, Constants.PLACEMENT_ID);
            if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.OfferWall.toString())) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.8
                    @Override // java.lang.Runnable
                    public void run() {
                        WebController.this.mOnOfferWallListener.onOWShowSuccess(valueFromJsonObject);
                    }
                });
            }
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_SHOW_OFFER_WALL_SUCCESS, str);
        }

        @JavascriptInterface
        public void onShowOfferWallFail(String str) {
            Logger.i(WebController.this.TAG, "onShowOfferWallFail(" + str + ")");
            final String string = new SSAObj(str).getString("errMsg");
            if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.OfferWall.toString())) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.9
                    @Override // java.lang.Runnable
                    public void run() {
                        String str2 = string;
                        if (str2 == null) {
                            str2 = "We're sorry, some error occurred. we will investigate it";
                        }
                        WebController.this.mOnOfferWallListener.onOWShowFail(str2);
                    }
                });
            }
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_SHOW_OFFER_WALL_FAIL, str);
        }

        @JavascriptInterface
        public void onInitInterstitialSuccess(String str) {
            Logger.i(WebController.this.TAG, "onInitInterstitialSuccess()");
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_INIT_INTERSTITIAL_SUCCESS, ServerProtocol.DIALOG_RETURN_SCOPES_TRUE);
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(new SSAObj(str));
            if (TextUtils.isEmpty(strFetchDemandSourceId)) {
                Logger.i(WebController.this.TAG, "onInitInterstitialSuccess failed with no demand source");
            } else if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.Interstitial.toString())) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.10
                    @Override // java.lang.Runnable
                    public void run() {
                        Log.d(WebController.this.TAG, "onInterstitialInitSuccess()");
                        WebController.this.mDSInterstitialListener.onAdProductInitSuccess(SSAEnums.ProductType.Interstitial, strFetchDemandSourceId, null);
                    }
                });
            }
        }

        @JavascriptInterface
        public void onInitInterstitialFail(String str) {
            Logger.i(WebController.this.TAG, "onInitInterstitialFail(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            final String string = sSAObj.getString("errMsg");
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(sSAObj);
            if (TextUtils.isEmpty(strFetchDemandSourceId)) {
                Logger.i(WebController.this.TAG, "onInitInterstitialSuccess failed with no demand source");
                return;
            }
            DemandSource demandSourceById = WebController.this.mDemandSourceManager.getDemandSourceById(SSAEnums.ProductType.Interstitial, strFetchDemandSourceId);
            if (demandSourceById != null) {
                demandSourceById.setDemandSourceInitState(3);
            }
            if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.Interstitial.toString())) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.11
                    @Override // java.lang.Runnable
                    public void run() {
                        String str2 = string;
                        if (str2 == null) {
                            str2 = "We're sorry, some error occurred. we will investigate it";
                        }
                        Log.d(WebController.this.TAG, "onInterstitialInitFail(message:" + str2 + ")");
                        WebController.this.mDSInterstitialListener.onAdProductInitFailed(SSAEnums.ProductType.Interstitial, strFetchDemandSourceId, str2);
                    }
                });
            }
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_INIT_INTERSTITIAL_FAIL, str);
        }

        @JavascriptInterface
        public void adClicked(String str) {
            Logger.i(WebController.this.TAG, "adClicked(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            String string = sSAObj.getString(Constants.ParametersKeys.PRODUCT_TYPE);
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(sSAObj);
            if (TextUtils.isEmpty(strFetchDemandSourceId)) {
                return;
            }
            final SSAEnums.ProductType stringProductTypeAsEnum = WebController.this.getStringProductTypeAsEnum(string);
            final DSAdProductListener adProductListenerByProductType = WebController.this.getAdProductListenerByProductType(stringProductTypeAsEnum);
            if (stringProductTypeAsEnum == null || adProductListenerByProductType == null) {
                return;
            }
            WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.12
                @Override // java.lang.Runnable
                public void run() {
                    adProductListenerByProductType.onAdProductClick(stringProductTypeAsEnum, strFetchDemandSourceId);
                }
            });
        }

        @JavascriptInterface
        public void onShowInterstitialSuccess(String str) {
            Logger.i(WebController.this.TAG, "onShowInterstitialSuccess(" + str + ")");
            WebController.this.responseBack(str, true, null, null);
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(new SSAObj(str));
            if (TextUtils.isEmpty(strFetchDemandSourceId)) {
                Logger.i(WebController.this.TAG, "onShowInterstitialSuccess called with no demand");
                return;
            }
            WebController.this.mSavedState.adOpened(SSAEnums.ProductType.Interstitial.ordinal());
            WebController.this.mSavedState.setDisplayedDemandSourceId(strFetchDemandSourceId);
            if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.Interstitial.toString())) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.13
                    @Override // java.lang.Runnable
                    public void run() {
                        WebController.this.mDSInterstitialListener.onAdProductOpen(SSAEnums.ProductType.Interstitial, strFetchDemandSourceId);
                        WebController.this.mDSInterstitialListener.onInterstitialShowSuccess(strFetchDemandSourceId);
                    }
                });
                WebController.this.toastingErrMsg(Constants.JSMethods.ON_SHOW_INTERSTITIAL_SUCCESS, str);
            }
            setInterstitialAvailability(strFetchDemandSourceId, false);
        }

        private void setInterstitialAvailability(String str, boolean z) {
            DemandSource demandSourceById = WebController.this.mDemandSourceManager.getDemandSourceById(SSAEnums.ProductType.Interstitial, str);
            if (demandSourceById != null) {
                demandSourceById.setAvailabilityState(z);
            }
        }

        @JavascriptInterface
        public void onInitOfferWallSuccess(String str) {
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_INIT_OFFERWALL_SUCCESS, ServerProtocol.DIALOG_RETURN_SCOPES_TRUE);
            WebController.this.mSavedState.setOfferwallInitSuccess(true);
            if (WebController.this.mSavedState.reportInitOfferwall()) {
                WebController.this.mSavedState.setOfferwallReportInit(false);
                if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.OfferWall.toString())) {
                    WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.14
                        @Override // java.lang.Runnable
                        public void run() {
                            Log.d(WebController.this.TAG, "onOfferWallInitSuccess()");
                            WebController.this.mOnOfferWallListener.onOfferwallInitSuccess();
                        }
                    });
                }
            }
        }

        @JavascriptInterface
        public void onInitOfferWallFail(String str) {
            Logger.i(WebController.this.TAG, "onInitOfferWallFail(" + str + ")");
            WebController.this.mSavedState.setOfferwallInitSuccess(false);
            final String string = new SSAObj(str).getString("errMsg");
            if (WebController.this.mSavedState.reportInitOfferwall()) {
                WebController.this.mSavedState.setOfferwallReportInit(false);
                if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.OfferWall.toString())) {
                    WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.15
                        @Override // java.lang.Runnable
                        public void run() {
                            String str2 = string;
                            if (str2 == null) {
                                str2 = "We're sorry, some error occurred. we will investigate it";
                            }
                            Log.d(WebController.this.TAG, "onOfferWallInitFail(message:" + str2 + ")");
                            WebController.this.mOnOfferWallListener.onOfferwallInitFail(str2);
                        }
                    });
                }
            }
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_INIT_OFFERWALL_FAIL, str);
        }

        @JavascriptInterface
        public void onLoadInterstitialSuccess(String str) {
            Logger.i(WebController.this.TAG, "onLoadInterstitialSuccess(" + str + ")");
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(new SSAObj(str));
            setInterstitialAvailability(strFetchDemandSourceId, true);
            WebController.this.responseBack(str, true, null, null);
            if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.Interstitial.toString())) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.16
                    @Override // java.lang.Runnable
                    public void run() {
                        WebController.this.mDSInterstitialListener.onInterstitialLoadSuccess(strFetchDemandSourceId);
                    }
                });
            }
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_LOAD_INTERSTITIAL_SUCCESS, ServerProtocol.DIALOG_RETURN_SCOPES_TRUE);
        }

        @JavascriptInterface
        public void onLoadInterstitialFail(String str) {
            Logger.i(WebController.this.TAG, "onLoadInterstitialFail(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            final String string = sSAObj.getString("errMsg");
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(sSAObj);
            WebController.this.responseBack(str, true, null, null);
            if (TextUtils.isEmpty(strFetchDemandSourceId)) {
                return;
            }
            setInterstitialAvailability(strFetchDemandSourceId, false);
            if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.Interstitial.toString())) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.17
                    @Override // java.lang.Runnable
                    public void run() {
                        String str2 = string;
                        if (str2 == null) {
                            str2 = "We're sorry, some error occurred. we will investigate it";
                        }
                        WebController.this.mDSInterstitialListener.onInterstitialLoadFailed(strFetchDemandSourceId, str2);
                    }
                });
            }
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_LOAD_INTERSTITIAL_FAIL, ServerProtocol.DIALOG_RETURN_SCOPES_TRUE);
        }

        @JavascriptInterface
        public void onShowInterstitialFail(String str) {
            Logger.i(WebController.this.TAG, "onShowInterstitialFail(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            final String string = sSAObj.getString("errMsg");
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(sSAObj);
            WebController.this.responseBack(str, true, null, null);
            if (TextUtils.isEmpty(strFetchDemandSourceId)) {
                return;
            }
            setInterstitialAvailability(strFetchDemandSourceId, false);
            if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.Interstitial.toString())) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.18
                    @Override // java.lang.Runnable
                    public void run() {
                        String str2 = string;
                        if (str2 == null) {
                            str2 = "We're sorry, some error occurred. we will investigate it";
                        }
                        WebController.this.mDSInterstitialListener.onInterstitialShowFailed(strFetchDemandSourceId, str2);
                    }
                });
            }
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_SHOW_INTERSTITIAL_FAIL, str);
        }

        @JavascriptInterface
        public void onInitBannerSuccess(String str) {
            Logger.i(WebController.this.TAG, "onInitBannerSuccess()");
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_INIT_BANNER_SUCCESS, ServerProtocol.DIALOG_RETURN_SCOPES_TRUE);
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(new SSAObj(str));
            if (TextUtils.isEmpty(strFetchDemandSourceId)) {
                Logger.i(WebController.this.TAG, "onInitBannerSuccess failed with no demand source");
            } else if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.Banner.toString())) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.19
                    @Override // java.lang.Runnable
                    public void run() {
                        Log.d(WebController.this.TAG, "onBannerInitSuccess()");
                        WebController.this.mDSBannerListener.onAdProductInitSuccess(SSAEnums.ProductType.Banner, strFetchDemandSourceId, null);
                    }
                });
            }
        }

        @JavascriptInterface
        public void onInitBannerFail(String str) {
            Logger.i(WebController.this.TAG, "onInitBannerFail(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            final String string = sSAObj.getString("errMsg");
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(sSAObj);
            if (TextUtils.isEmpty(strFetchDemandSourceId)) {
                Logger.i(WebController.this.TAG, "onInitBannerFail failed with no demand source");
                return;
            }
            DemandSource demandSourceById = WebController.this.mDemandSourceManager.getDemandSourceById(SSAEnums.ProductType.Banner, strFetchDemandSourceId);
            if (demandSourceById != null) {
                demandSourceById.setDemandSourceInitState(3);
            }
            if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.Banner.toString())) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.20
                    @Override // java.lang.Runnable
                    public void run() {
                        String str2 = string;
                        if (str2 == null) {
                            str2 = "We're sorry, some error occurred. we will investigate it";
                        }
                        Log.d(WebController.this.TAG, "onBannerInitFail(message:" + str2 + ")");
                        WebController.this.mDSBannerListener.onAdProductInitFailed(SSAEnums.ProductType.Banner, strFetchDemandSourceId, str2);
                    }
                });
            }
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_INIT_BANNER_FAIL, str);
        }

        @JavascriptInterface
        public void onLoadBannerSuccess(String str) {
            Logger.i(WebController.this.TAG, "onLoadBannerSuccess()");
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(new SSAObj(str));
            WebController.this.responseBack(str, true, null, null);
            if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.Banner.toString())) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.21
                    @Override // java.lang.Runnable
                    public void run() {
                        Log.d(WebController.this.TAG, "onBannerLoadSuccess()");
                        WebController.this.mDSBannerListener.onBannerLoadSuccess(strFetchDemandSourceId);
                    }
                });
            }
        }

        @JavascriptInterface
        public void onLoadBannerFail(String str) {
            Logger.i(WebController.this.TAG, "onLoadBannerFail()");
            SSAObj sSAObj = new SSAObj(str);
            final String string = sSAObj.getString("errMsg");
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(sSAObj);
            WebController.this.responseBack(str, true, null, null);
            if (!TextUtils.isEmpty(strFetchDemandSourceId) && WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.Banner.toString())) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.22
                    @Override // java.lang.Runnable
                    public void run() {
                        Log.d(WebController.this.TAG, "onLoadBannerFail()");
                        String str2 = string;
                        if (str2 == null) {
                            str2 = "We're sorry, some error occurred. we will investigate it";
                        }
                        WebController.this.mDSBannerListener.onBannerLoadFail(strFetchDemandSourceId, str2);
                    }
                });
            }
        }

        @JavascriptInterface
        public void onGenericFunctionSuccess(String str) {
            Logger.i(WebController.this.TAG, "onGenericFunctionSuccess(" + str + ")");
            if (WebController.this.mOnGenericFunctionListener == null) {
                Logger.d(WebController.this.TAG, "genericFunctionListener was not found");
            } else {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.23
                    @Override // java.lang.Runnable
                    public void run() {
                        WebController.this.mOnGenericFunctionListener.onGFSuccess();
                    }
                });
                WebController.this.responseBack(str, true, null, null);
            }
        }

        @JavascriptInterface
        public void onGenericFunctionFail(String str) {
            Logger.i(WebController.this.TAG, "onGenericFunctionFail(" + str + ")");
            if (WebController.this.mOnGenericFunctionListener == null) {
                Logger.d(WebController.this.TAG, "genericFunctionListener was not found");
                return;
            }
            final String string = new SSAObj(str).getString("errMsg");
            WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.24
                @Override // java.lang.Runnable
                public void run() {
                    WebController.this.mOnGenericFunctionListener.onGFFail(string);
                }
            });
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_GENERIC_FUNCTION_FAIL, str);
        }

        @JavascriptInterface
        public void openUrl(String str) {
            Logger.i(WebController.this.TAG, "openUrl(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            String string = sSAObj.getString("url");
            String string2 = sSAObj.getString("method");
            Context currentActivityContext = WebController.this.getCurrentActivityContext();
            try {
                if (string2.equalsIgnoreCase(Constants.ParametersKeys.EXTERNAL_BROWSER)) {
                    UrlHandler.openUrl(currentActivityContext, string);
                } else if (string2.equalsIgnoreCase(Constants.ParametersKeys.WEB_VIEW)) {
                    Intent intent = new Intent(currentActivityContext, (Class<?>) OpenUrlActivity.class);
                    intent.putExtra(WebController.EXTERNAL_URL, string);
                    intent.putExtra(WebController.SECONDARY_WEB_VIEW, true);
                    intent.putExtra(Constants.ParametersKeys.IMMERSIVE, WebController.this.mIsImmersive);
                    currentActivityContext.startActivity(intent);
                } else if (string2.equalsIgnoreCase(Constants.ParametersKeys.STORE)) {
                    Intent intent2 = new Intent(currentActivityContext, (Class<?>) OpenUrlActivity.class);
                    intent2.putExtra(WebController.EXTERNAL_URL, string);
                    intent2.putExtra(WebController.IS_STORE, true);
                    intent2.putExtra(WebController.SECONDARY_WEB_VIEW, true);
                    currentActivityContext.startActivity(intent2);
                }
            } catch (Exception e) {
                WebController.this.responseBack(str, false, e.getMessage(), null);
                e.printStackTrace();
            }
        }

        @JavascriptInterface
        public void setForceClose(String str) {
            Logger.i(WebController.this.TAG, "setForceClose(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            String string = sSAObj.getString("width");
            String string2 = sSAObj.getString("height");
            WebController.this.mHiddenForceCloseWidth = Integer.parseInt(string);
            WebController.this.mHiddenForceCloseHeight = Integer.parseInt(string2);
            WebController.this.mHiddenForceCloseLocation = sSAObj.getString(Constants.ParametersKeys.POSITION);
        }

        @JavascriptInterface
        public void setBackButtonState(String str) {
            Logger.i(WebController.this.TAG, "setBackButtonState(" + str + ")");
            IronSourceSharedPrefHelper.getSupersonicPrefHelper().setBackButtonState(new SSAObj(str).getString("state"));
        }

        @JavascriptInterface
        public void setStoreSearchKeys(String str) {
            Logger.i(WebController.this.TAG, "setStoreSearchKeys(" + str + ")");
            IronSourceSharedPrefHelper.getSupersonicPrefHelper().setSearchKeys(str);
        }

        @JavascriptInterface
        public void setWebviewBackgroundColor(String str) {
            Logger.i(WebController.this.TAG, "setWebviewBackgroundColor(" + str + ")");
            WebController.this.setWebviewBackground(str);
        }

        @JavascriptInterface
        public void onOfferWallGeneric(String str) {
            Logger.i(WebController.this.TAG, "onOfferWallGeneric(" + str + ")");
            if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.OfferWall.toString())) {
                WebController.this.mOnOfferWallListener.onOWGeneric("", "");
            }
        }

        @JavascriptInterface
        public void setUserData(String str) {
            Logger.i(WebController.this.TAG, "setUserData(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            if (!sSAObj.containsKey("key")) {
                WebController.this.responseBack(str, false, Constants.ErrorCodes.KEY_DOES_NOT_EXIST, null);
                return;
            }
            if (!sSAObj.containsKey("value")) {
                WebController.this.responseBack(str, false, Constants.ErrorCodes.VALUE_DOES_NOT_EXIST, null);
                return;
            }
            String string = sSAObj.getString("key");
            String string2 = sSAObj.getString("value");
            if (IronSourceSharedPrefHelper.getSupersonicPrefHelper().setUserData(string, string2)) {
                WebController.this.injectJavascript(WebController.this.generateJSToInject(WebController.this.extractSuccessFunctionToCall(str), WebController.this.parseToJson(string, string2, null, null, null, null, null, null, null, false)));
                return;
            }
            WebController.this.responseBack(str, false, "SetUserData failed writing to shared preferences", null);
        }

        @JavascriptInterface
        public void getUserData(String str) {
            Logger.i(WebController.this.TAG, "getUserData(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            if (!sSAObj.containsKey("key")) {
                WebController.this.responseBack(str, false, Constants.ErrorCodes.KEY_DOES_NOT_EXIST, null);
                return;
            }
            String strExtractSuccessFunctionToCall = WebController.this.extractSuccessFunctionToCall(str);
            String string = sSAObj.getString("key");
            WebController.this.injectJavascript(WebController.this.generateJSToInject(strExtractSuccessFunctionToCall, WebController.this.parseToJson(string, IronSourceSharedPrefHelper.getSupersonicPrefHelper().getUserData(string), null, null, null, null, null, null, null, false)));
        }

        @JavascriptInterface
        public void onGetUserCreditsFail(String str) {
            Logger.i(WebController.this.TAG, "onGetUserCreditsFail(" + str + ")");
            final String string = new SSAObj(str).getString("errMsg");
            if (WebController.this.shouldNotifyDeveloper(SSAEnums.ProductType.OfferWall.toString())) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.25
                    @Override // java.lang.Runnable
                    public void run() {
                        String str2 = string;
                        if (str2 == null) {
                            str2 = "We're sorry, some error occurred. we will investigate it";
                        }
                        WebController.this.mOnOfferWallListener.onGetOWCreditsFailed(str2);
                    }
                });
            }
            WebController.this.responseBack(str, true, null, null);
            WebController.this.toastingErrMsg(Constants.JSMethods.ON_GET_USER_CREDITS_FAILED, str);
        }

        @JavascriptInterface
        public void onAdWindowsClosed(String str) {
            Logger.i(WebController.this.TAG, "onAdWindowsClosed(" + str + ")");
            WebController.this.mSavedState.adClosed();
            WebController.this.mSavedState.setDisplayedDemandSourceId(null);
            SSAObj sSAObj = new SSAObj(str);
            String string = sSAObj.getString(Constants.ParametersKeys.PRODUCT_TYPE);
            final String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(sSAObj);
            final SSAEnums.ProductType stringProductTypeAsEnum = WebController.this.getStringProductTypeAsEnum(string);
            Log.d(WebController.this.PUB_TAG, "onAdClosed() with type " + stringProductTypeAsEnum);
            if (WebController.this.shouldNotifyDeveloper(string)) {
                WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.26
                    @Override // java.lang.Runnable
                    public void run() {
                        if (stringProductTypeAsEnum == SSAEnums.ProductType.RewardedVideo || stringProductTypeAsEnum == SSAEnums.ProductType.Interstitial) {
                            DSAdProductListener adProductListenerByProductType = WebController.this.getAdProductListenerByProductType(stringProductTypeAsEnum);
                            if (adProductListenerByProductType != null) {
                                adProductListenerByProductType.onAdProductClose(stringProductTypeAsEnum, strFetchDemandSourceId);
                                return;
                            }
                            return;
                        }
                        if (stringProductTypeAsEnum == SSAEnums.ProductType.OfferWall) {
                            WebController.this.mOnOfferWallListener.onOWAdClosed();
                        }
                    }
                });
            }
        }

        @JavascriptInterface
        public void onVideoStatusChanged(String str) {
            Log.d(WebController.this.TAG, "onVideoStatusChanged(" + str + ")");
            SSAObj sSAObj = new SSAObj(str);
            String string = sSAObj.getString(Constants.ParametersKeys.PRODUCT_TYPE);
            if (WebController.this.mVideoEventsListener == null || TextUtils.isEmpty(string)) {
                return;
            }
            String string2 = sSAObj.getString("status");
            if (Constants.ParametersKeys.VIDEO_STATUS_STARTED.equalsIgnoreCase(string2)) {
                WebController.this.mVideoEventsListener.onVideoStarted();
                return;
            }
            if (Constants.ParametersKeys.VIDEO_STATUS_PAUSED.equalsIgnoreCase(string2)) {
                WebController.this.mVideoEventsListener.onVideoPaused();
                return;
            }
            if (Constants.ParametersKeys.VIDEO_STATUS_PLAYING.equalsIgnoreCase(string2)) {
                WebController.this.mVideoEventsListener.onVideoResumed();
                return;
            }
            if (Constants.ParametersKeys.VIDEO_STATUS_ENDED.equalsIgnoreCase(string2)) {
                WebController.this.mVideoEventsListener.onVideoEnded();
                return;
            }
            if (Constants.ParametersKeys.VIDEO_STATUS_STOPPED.equalsIgnoreCase(string2)) {
                WebController.this.mVideoEventsListener.onVideoStopped();
                return;
            }
            Logger.i(WebController.this.TAG, "onVideoStatusChanged: unknown status: " + string2);
        }

        @JavascriptInterface
        public void postAdEventNotification(String str) {
            try {
                Logger.i(WebController.this.TAG, "postAdEventNotification(" + str + ")");
                SSAObj sSAObj = new SSAObj(str);
                final String string = sSAObj.getString(Constants.ParametersKeys.EVENT_NAME);
                if (TextUtils.isEmpty(string)) {
                    WebController.this.responseBack(str, false, Constants.ErrorCodes.EVENT_NAME_DOES_NOT_EXIST, null);
                    return;
                }
                String string2 = sSAObj.getString(Constants.ParametersKeys.NOTIFICATION_DEMAND_SOURCE_NAME);
                String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(sSAObj);
                String str2 = !TextUtils.isEmpty(strFetchDemandSourceId) ? strFetchDemandSourceId : string2;
                final JSONObject jSONObject = (JSONObject) sSAObj.get(Constants.ParametersKeys.EXTRA_DATA);
                String string3 = sSAObj.getString(Constants.ParametersKeys.PRODUCT_TYPE);
                final SSAEnums.ProductType stringProductTypeAsEnum = WebController.this.getStringProductTypeAsEnum(string3);
                if (WebController.this.shouldNotifyDeveloper(string3)) {
                    String strExtractSuccessFunctionToCall = WebController.this.extractSuccessFunctionToCall(str);
                    if (!TextUtils.isEmpty(strExtractSuccessFunctionToCall)) {
                        WebController.this.injectJavascript(WebController.this.generateJSToInject(strExtractSuccessFunctionToCall, WebController.this.parseToJson(Constants.ParametersKeys.PRODUCT_TYPE, string3, Constants.ParametersKeys.EVENT_NAME, string, "demandSourceName", string2, "demandSourceId", str2, null, false), Constants.JSMethods.POST_AD_EVENT_NOTIFICATION_SUCCESS, Constants.JSMethods.POST_AD_EVENT_NOTIFICATION_FAIL));
                    }
                    final String str3 = str2;
                    WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.27
                        @Override // java.lang.Runnable
                        public void run() {
                            if (stringProductTypeAsEnum == SSAEnums.ProductType.Interstitial || stringProductTypeAsEnum == SSAEnums.ProductType.RewardedVideo) {
                                DSAdProductListener adProductListenerByProductType = WebController.this.getAdProductListenerByProductType(stringProductTypeAsEnum);
                                if (adProductListenerByProductType != null) {
                                    adProductListenerByProductType.onAdProductEventNotificationReceived(stringProductTypeAsEnum, str3, string, jSONObject);
                                    return;
                                }
                                return;
                            }
                            if (stringProductTypeAsEnum == SSAEnums.ProductType.OfferWall) {
                                WebController.this.mOnOfferWallListener.onOfferwallEventNotificationReceived(string, jSONObject);
                            }
                        }
                    });
                    return;
                }
                WebController.this.responseBack(str, false, Constants.ErrorCodes.PRODUCT_TYPE_DOES_NOT_EXIST, null);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        void sendUnauthorizedError(String str) {
            WebController.this.injectJavascript(WebController.this.generateJSToInject(Constants.JSMethods.ON_UNAUTHORIZED_MESSAGE, str, null, null));
        }

        class JSCallbackTask {
            JSCallbackTask() {
            }

            void sendMessage(boolean z, String str, String str2) {
                SSAObj sSAObj = new SSAObj();
                sSAObj.put(z ? WebController.JSON_KEY_SUCCESS : WebController.JSON_KEY_FAIL, str);
                sSAObj.put("data", str2);
                WebController.this.responseBack(sSAObj.toString(), z, null, null);
            }

            void sendMessage(boolean z, String str, SSAObj sSAObj) {
                sSAObj.put(z ? WebController.JSON_KEY_SUCCESS : WebController.JSON_KEY_FAIL, str);
                WebController.this.responseBack(sSAObj.toString(), z, null, null);
            }

            void sendMessage(boolean z, String str, JSONObject jSONObject) {
                try {
                    jSONObject.put(z ? WebController.JSON_KEY_SUCCESS : WebController.JSON_KEY_FAIL, str);
                    WebController.this.responseBack(jSONObject.toString(), z, null, null);
                } catch (JSONException e) {
                    e.printStackTrace();
                    e.getMessage();
                }
            }
        }

        @JavascriptInterface
        public void bannerViewAPI(String str) {
            try {
                WebController.this.mBannerJsAdapter.sendMessageToISNAdView(str);
            } catch (Exception e) {
                e.printStackTrace();
                Logger.e(WebController.this.TAG, "bannerViewAPI failed with exception " + e.getMessage());
            }
        }

        @JavascriptInterface
        public void omidAPI(final String str) {
            WebController.this.runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.NativeAPI.28
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        Logger.i(WebController.this.TAG, "omidAPI(" + str + ")");
                        WebController.this.mOmidJsAdapter.call(new SSAObj(str).toString(), NativeAPI.this.new JSCallbackTask(), WebController.this.getWebview());
                    } catch (Exception e) {
                        e.printStackTrace();
                        Logger.i(WebController.this.TAG, "omidAPI failed with exception " + e.getMessage());
                    }
                }
            });
        }

        @JavascriptInterface
        public void permissionsAPI(String str) {
            try {
                Logger.i(WebController.this.TAG, "permissionsAPI(" + str + ")");
                WebController.this.mPermissionsJsAdapter.call(new SSAObj(str).toString(), new JSCallbackTask());
            } catch (Exception e) {
                e.printStackTrace();
                Logger.i(WebController.this.TAG, "permissionsAPI failed with exception " + e.getMessage());
            }
        }

        @JavascriptInterface
        public void deviceDataAPI(String str) {
            try {
                Logger.i(WebController.this.TAG, "deviceDataAPI(" + str + ")");
                WebController.this.mDeviceDataJsAdapter.call(new SSAObj(str).toString(), new JSCallbackTask());
            } catch (Exception e) {
                e.printStackTrace();
                Logger.i(WebController.this.TAG, "deviceDataAPI failed with exception " + e.getMessage());
            }
        }

        @JavascriptInterface
        public void adViewAPI(String str) {
            try {
                Logger.i(WebController.this.TAG, "adViewAPI(" + str + ")");
                WebController.this.mAdViewsJsAdapter.call(new SSAObj(str).toString(), new JSCallbackTask());
            } catch (Exception e) {
                e.printStackTrace();
                Logger.i(WebController.this.TAG, "adViewAPI failed with exception " + e.getMessage());
            }
        }

        @JavascriptInterface
        public void getDeviceVolume(String str) {
            Logger.i(WebController.this.TAG, "getDeviceVolume(" + str + ")");
            try {
                float deviceVolume = DeviceProperties.getInstance(WebController.this.getCurrentActivityContext()).getDeviceVolume(WebController.this.getCurrentActivityContext());
                SSAObj sSAObj = new SSAObj(str);
                sSAObj.put("deviceVolume", String.valueOf(deviceVolume));
                WebController.this.responseBack(sSAObj.toString(), true, null, null);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public DSAdProductListener getAdProductListenerByProductType(SSAEnums.ProductType productType) {
        if (productType == SSAEnums.ProductType.Interstitial) {
            return this.mDSInterstitialListener;
        }
        if (productType == SSAEnums.ProductType.RewardedVideo) {
            return this.mDSRewardedVideoListener;
        }
        if (productType == SSAEnums.ProductType.Banner) {
            return this.mDSBannerListener;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public SSAEnums.ProductType getStringProductTypeAsEnum(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        if (str.equalsIgnoreCase(SSAEnums.ProductType.Interstitial.toString())) {
            return SSAEnums.ProductType.Interstitial;
        }
        if (str.equalsIgnoreCase(SSAEnums.ProductType.RewardedVideo.toString())) {
            return SSAEnums.ProductType.RewardedVideo;
        }
        if (str.equalsIgnoreCase(SSAEnums.ProductType.OfferWall.toString())) {
            return SSAEnums.ProductType.OfferWall;
        }
        if (str.equalsIgnoreCase(SSAEnums.ProductType.Banner.toString())) {
            return SSAEnums.ProductType.Banner;
        }
        return null;
    }

    public void setVideoEventsListener(VideoEventsListener videoEventsListener) {
        this.mVideoEventsListener = videoEventsListener;
    }

    public void removeVideoEventsListener() {
        this.mVideoEventsListener = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setWebviewBackground(String str) {
        String string = new SSAObj(str).getString("color");
        setBackgroundColor(!Constants.ParametersKeys.TRANSPARENT.equalsIgnoreCase(string) ? Color.parseColor(string) : 0);
    }

    /* JADX WARN: Type inference failed for: r9v0, types: [com.ironsource.sdk.controller.WebController$3] */
    public void load(final int i) {
        try {
            loadUrl("about:blank");
        } catch (Throwable th) {
            Logger.e(this.TAG, "WebViewController:: load: " + th.toString());
            new IronSourceAsyncHttpRequestTask().execute("https://www.supersonicads.com/mobile/sdk5/log?method=webviewLoadBlank");
        }
        String str = "file://" + this.mCacheDirectory + File.separator + Constants.MOBILE_CONTROLLER_HTML;
        if (new File(this.mCacheDirectory + File.separator + Constants.MOBILE_CONTROLLER_HTML).exists()) {
            JSONObject controllerConfigAsJSONObject = SDKUtils.getControllerConfigAsJSONObject();
            setWebDebuggingEnabled(controllerConfigAsJSONObject);
            String requestParameters = getRequestParameters(controllerConfigAsJSONObject);
            Map<String, String> initSDKParams = SDKUtils.getInitSDKParams();
            if (initSDKParams != null && initSDKParams.containsKey(Events.SESSION_ID)) {
                requestParameters = String.format("%s&sessionid=%s", requestParameters, initSDKParams.get(Events.SESSION_ID));
            }
            String str2 = str + "?" + requestParameters;
            this.mLoadControllerTimer = new CountDownTimer(50000L, 1000L) { // from class: com.ironsource.sdk.controller.WebController.3
                @Override // android.os.CountDownTimer
                public void onTick(long j) {
                    Logger.i(WebController.this.TAG, "Loading Controller Timer Tick " + j);
                }

                @Override // android.os.CountDownTimer
                public void onFinish() {
                    Logger.i(WebController.this.TAG, "Loading Controller Timer Finish");
                    int i2 = i;
                    if (i2 == 3) {
                        WebController.this.mControllerListener.handleControllerStageFailed(Constants.ErrorCodes.CONTROLLER_FAILED_TO_LOAD);
                    } else {
                        WebController.this.load(i2 + 1);
                    }
                }
            }.start();
            try {
                loadUrl(str2);
            } catch (Throwable th2) {
                Logger.e(this.TAG, "WebViewController:: load: " + th2.toString());
                new IronSourceAsyncHttpRequestTask().execute("https://www.supersonicads.com/mobile/sdk5/log?method=webviewLoadWithPath");
            }
            Logger.i(this.TAG, "load(): " + str2);
            return;
        }
        Logger.i(this.TAG, "load(): Mobile Controller HTML Does not exist");
        new IronSourceAsyncHttpRequestTask().execute("https://www.supersonicads.com/mobile/sdk5/log?method=htmlControllerDoesNotExistOnFileSystem");
    }

    private void setWebDebuggingEnabled(JSONObject jSONObject) {
        if (jSONObject.optBoolean("inspectWebview")) {
            setWebDebuggingEnabled();
        }
    }

    private void initProduct(String str, String str2, SSAEnums.ProductType productType, DemandSource demandSource, OnInitProductHandler onInitProductHandler) {
        if (TextUtils.isEmpty(str2) || TextUtils.isEmpty(str)) {
            onInitProductHandler.handleInitProductFailed("User id or Application key are missing", productType, demandSource);
        } else {
            injectJavascript(createInitProductJSMethod(productType, demandSource).script);
        }
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void initRewardedVideo(String str, String str2, DemandSource demandSource, DSRewardedVideoListener dSRewardedVideoListener) {
        this.mApplicationKey = str;
        this.mUserId = str2;
        this.mDSRewardedVideoListener = dSRewardedVideoListener;
        this.mSavedState.setRVAppKey(str);
        this.mSavedState.setRVUserId(str2);
        initProduct(str, str2, SSAEnums.ProductType.RewardedVideo, demandSource, new OnInitProductHandler() { // from class: com.ironsource.sdk.controller.WebController.4
            @Override // com.ironsource.sdk.controller.WebController.OnInitProductHandler
            public void handleInitProductFailed(String str3, SSAEnums.ProductType productType, DemandSource demandSource2) {
                WebController.this.triggerOnControllerInitProductFail(str3, productType, demandSource2);
            }
        });
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void initInterstitial(String str, String str2, DemandSource demandSource, DSInterstitialListener dSInterstitialListener) {
        this.mApplicationKey = str;
        this.mUserId = str2;
        this.mDSInterstitialListener = dSInterstitialListener;
        this.mSavedState.setInterstitialAppKey(str);
        this.mSavedState.setInterstitialUserId(this.mUserId);
        initProduct(this.mApplicationKey, this.mUserId, SSAEnums.ProductType.Interstitial, demandSource, new OnInitProductHandler() { // from class: com.ironsource.sdk.controller.WebController.5
            @Override // com.ironsource.sdk.controller.WebController.OnInitProductHandler
            public void handleInitProductFailed(String str3, SSAEnums.ProductType productType, DemandSource demandSource2) {
                WebController.this.triggerOnControllerInitProductFail(str3, productType, demandSource2);
            }
        });
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void loadInterstitial(String str, DSInterstitialListener dSInterstitialListener) {
        HashMap map = new HashMap();
        map.put("demandSourceName", str);
        String strFlatMapToJsonAsString = SDKUtils.flatMapToJsonAsString(map);
        this.mSavedState.setReportLoadInterstitial(str, true);
        injectJavascript(generateJSToInject(Constants.JSMethods.LOAD_INTERSTITIAL, strFlatMapToJsonAsString, Constants.JSMethods.ON_LOAD_INTERSTITIAL_SUCCESS, Constants.JSMethods.ON_LOAD_INTERSTITIAL_FAIL));
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void loadInterstitial(DemandSource demandSource, Map<String, String> map, DSInterstitialListener dSInterstitialListener) {
        handleLoadAd(demandSource, map);
    }

    private void handleLoadAd(DemandSource demandSource, Map<String, String> map) {
        Map<String, String> mapMergeHashMaps = SDKUtils.mergeHashMaps(new Map[]{map, demandSource.convertToMap()});
        this.mSavedState.setReportLoadInterstitial(demandSource.getId(), true);
        injectJavascript(generateJSToInject(Constants.JSMethods.LOAD_INTERSTITIAL, SDKUtils.flatMapToJsonAsString(mapMergeHashMaps), Constants.JSMethods.ON_LOAD_INTERSTITIAL_SUCCESS, Constants.JSMethods.ON_LOAD_INTERSTITIAL_FAIL));
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void showInterstitial(JSONObject jSONObject, DSInterstitialListener dSInterstitialListener) {
        injectJavascript(createShowProductJSMethod(SSAEnums.ProductType.Interstitial, jSONObject));
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void showInterstitial(DemandSource demandSource, Map<String, String> map, DSInterstitialListener dSInterstitialListener) {
        injectJavascript(createShowProductJSMethod(SSAEnums.ProductType.Interstitial, new JSONObject(SDKUtils.mergeHashMaps(new Map[]{map, demandSource.convertToMap()}))));
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public boolean isInterstitialAdAvailable(String str) {
        DemandSource demandSourceById = this.mDemandSourceManager.getDemandSourceById(SSAEnums.ProductType.Interstitial, str);
        return demandSourceById != null && demandSourceById.getAvailabilityState();
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void initOfferWall(String str, String str2, Map<String, String> map, OnOfferWallListener onOfferWallListener) {
        this.mApplicationKey = str;
        this.mUserId = str2;
        this.mOWExtraParameters = map;
        this.mOnOfferWallListener = onOfferWallListener;
        this.mSavedState.setOfferWallExtraParams(map);
        this.mSavedState.setOfferwallReportInit(true);
        initProduct(this.mApplicationKey, this.mUserId, SSAEnums.ProductType.OfferWall, null, new OnInitProductHandler() { // from class: com.ironsource.sdk.controller.WebController.6
            @Override // com.ironsource.sdk.controller.WebController.OnInitProductHandler
            public void handleInitProductFailed(String str3, SSAEnums.ProductType productType, DemandSource demandSource) {
                WebController.this.triggerOnControllerInitProductFail(str3, productType, demandSource);
            }
        });
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void showOfferWall(Map<String, String> map) {
        this.mOWExtraParameters = map;
        injectJavascript(generateJSToInject(Constants.JSMethods.SHOW_OFFER_WALL, Constants.JSMethods.ON_SHOW_OFFER_WALL_SUCCESS, Constants.JSMethods.ON_SHOW_OFFER_WALL_FAIL));
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void getOfferWallCredits(String str, String str2, OnOfferWallListener onOfferWallListener) {
        this.mApplicationKey = str;
        this.mUserId = str2;
        this.mOnOfferWallListener = onOfferWallListener;
        initProduct(str, str2, SSAEnums.ProductType.OfferWallCredits, null, new OnInitProductHandler() { // from class: com.ironsource.sdk.controller.WebController.7
            @Override // com.ironsource.sdk.controller.WebController.OnInitProductHandler
            public void handleInitProductFailed(String str3, SSAEnums.ProductType productType, DemandSource demandSource) {
                WebController.this.triggerOnControllerInitProductFail(str3, productType, demandSource);
            }
        });
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void initBanner(String str, String str2, DemandSource demandSource, DSBannerListener dSBannerListener) {
        this.mApplicationKey = str;
        this.mUserId = str2;
        this.mDSBannerListener = dSBannerListener;
        initProduct(str, str2, SSAEnums.ProductType.Banner, demandSource, new OnInitProductHandler() { // from class: com.ironsource.sdk.controller.WebController.8
            @Override // com.ironsource.sdk.controller.WebController.OnInitProductHandler
            public void handleInitProductFailed(String str3, SSAEnums.ProductType productType, DemandSource demandSource2) {
                WebController.this.triggerOnControllerInitProductFail(str3, productType, demandSource2);
            }
        });
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void loadBanner(JSONObject jSONObject, DSBannerListener dSBannerListener) {
        if (jSONObject != null) {
            injectJavascript(generateJSToInject(Constants.JSMethods.LOAD_BANNER, jSONObject.toString(), Constants.JSMethods.ON_LOAD_BANNER_SUCCESS, Constants.JSMethods.ON_LOAD_BANNER_FAIL));
        }
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void updateConsentInfo(JSONObject jSONObject) {
        injectJavascript(generateJSToInject(Constants.JSMethods.UPDATE_CONSENT_INFO, jSONObject != null ? jSONObject.toString() : null));
    }

    static class Result {
        String methodName;
        String script;

        Result() {
        }
    }

    private Result createInitProductJSMethod(SSAEnums.ProductType productType, DemandSource demandSource) {
        Result result = new Result();
        if (productType == SSAEnums.ProductType.RewardedVideo || productType == SSAEnums.ProductType.Interstitial || productType == SSAEnums.ProductType.OfferWall || productType == SSAEnums.ProductType.Banner) {
            HashMap map = new HashMap();
            map.put("applicationKey", this.mApplicationKey);
            map.put("applicationUserId", this.mUserId);
            if (demandSource != null) {
                if (demandSource.getExtraParams() != null) {
                    map.putAll(demandSource.getExtraParams());
                }
                map.put("demandSourceName", demandSource.getDemandSourceName());
                map.put("demandSourceId", demandSource.getId());
            }
            Map<String, String> extraParamsByProduct = getExtraParamsByProduct(productType);
            if (extraParamsByProduct != null) {
                map.putAll(extraParamsByProduct);
            }
            String strFlatMapToJsonAsString = SDKUtils.flatMapToJsonAsString(map);
            Constants.JSMethods initMethodByProduct = Constants.JSMethods.getInitMethodByProduct(productType);
            String strGenerateJSToInject = generateJSToInject(initMethodByProduct.methodName, strFlatMapToJsonAsString, initMethodByProduct.successCallbackName, initMethodByProduct.failureCallbackName);
            result.methodName = initMethodByProduct.methodName;
            result.script = strGenerateJSToInject;
        } else if (productType == SSAEnums.ProductType.OfferWallCredits) {
            String strGenerateJSToInject2 = generateJSToInject(Constants.JSMethods.GET_USER_CREDITS, parseToJson(Constants.ParametersKeys.PRODUCT_TYPE, Constants.ParametersKeys.OFFER_WALL, "applicationKey", this.mApplicationKey, "applicationUserId", this.mUserId, null, null, null, false), "null", Constants.JSMethods.ON_GET_USER_CREDITS_FAILED);
            result.methodName = Constants.JSMethods.GET_USER_CREDITS;
            result.script = strGenerateJSToInject2;
        }
        return result;
    }

    private String createShowProductJSMethod(SSAEnums.ProductType productType, JSONObject jSONObject) {
        HashMap map = new HashMap();
        map.put("sessionDepth", Integer.toString(jSONObject.optInt("sessionDepth")));
        String strOptString = jSONObject.optString("demandSourceName");
        String strFetchDemandSourceId = SDKUtils.fetchDemandSourceId(jSONObject);
        DemandSource demandSourceById = this.mDemandSourceManager.getDemandSourceById(productType, strFetchDemandSourceId);
        if (demandSourceById != null) {
            if (demandSourceById.getExtraParams() != null) {
                map.putAll(demandSourceById.getExtraParams());
            }
            if (!TextUtils.isEmpty(strOptString)) {
                map.put("demandSourceName", strOptString);
            }
            if (!TextUtils.isEmpty(strFetchDemandSourceId)) {
                map.put("demandSourceId", strFetchDemandSourceId);
            }
        }
        Map<String, String> extraParamsByProduct = getExtraParamsByProduct(productType);
        if (extraParamsByProduct != null) {
            map.putAll(extraParamsByProduct);
        }
        String strFlatMapToJsonAsString = SDKUtils.flatMapToJsonAsString(map);
        Constants.JSMethods showMethodByProduct = Constants.JSMethods.getShowMethodByProduct(productType);
        return generateJSToInject(showMethodByProduct.methodName, strFlatMapToJsonAsString, showMethodByProduct.successCallbackName, showMethodByProduct.failureCallbackName);
    }

    void setMissProduct(SSAEnums.ProductType productType, DemandSource demandSource) {
        if (productType == SSAEnums.ProductType.RewardedVideo || productType == SSAEnums.ProductType.Interstitial || productType == SSAEnums.ProductType.Banner) {
            if (demandSource != null) {
                demandSource.setDemandSourceInitState(1);
            }
        } else if (productType == SSAEnums.ProductType.OfferWall) {
            this.mOWmiss = true;
        } else if (productType == SSAEnums.ProductType.OfferWallCredits) {
            this.mOWCreditsMiss = true;
        }
        Logger.i(this.TAG, "setMissProduct(" + productType + ")");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void triggerOnControllerInitProductFail(final String str, final SSAEnums.ProductType productType, final DemandSource demandSource) {
        if (shouldNotifyDeveloper(productType.toString())) {
            runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.9
                @Override // java.lang.Runnable
                public void run() {
                    if (SSAEnums.ProductType.RewardedVideo == productType || SSAEnums.ProductType.Interstitial == productType || SSAEnums.ProductType.Banner == productType) {
                        DemandSource demandSource2 = demandSource;
                        if (demandSource2 == null || TextUtils.isEmpty(demandSource2.getId())) {
                            return;
                        }
                        DSAdProductListener adProductListenerByProductType = WebController.this.getAdProductListenerByProductType(productType);
                        Log.d(WebController.this.TAG, "onAdProductInitFailed (message:" + str + ")(" + productType + ")");
                        if (adProductListenerByProductType != null) {
                            adProductListenerByProductType.onAdProductInitFailed(productType, demandSource.getId(), str);
                            return;
                        }
                        return;
                    }
                    if (SSAEnums.ProductType.OfferWall == productType) {
                        WebController.this.mOnOfferWallListener.onOfferwallInitFail(str);
                    } else if (SSAEnums.ProductType.OfferWallCredits == productType) {
                        WebController.this.mOnOfferWallListener.onGetOWCreditsFailed(str);
                    }
                }
            });
        }
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void showRewardedVideo(JSONObject jSONObject, DSRewardedVideoListener dSRewardedVideoListener) {
        injectJavascript(createShowProductJSMethod(SSAEnums.ProductType.RewardedVideo, jSONObject));
    }

    public void assetCached(String str, String str2) {
        injectJavascript(generateJSToInject(Constants.JSMethods.ASSET_CACHED, parseToJson("file", str, "path", str2, null, null, null, null, null, false)));
    }

    public void assetCachedFailed(String str, String str2, String str3) {
        injectJavascript(generateJSToInject(Constants.JSMethods.ASSET_CACHED_FAILED, parseToJson("file", str, "path", str2, "errMsg", str3, null, null, null, false)));
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void enterBackground() {
        injectJavascript(generateJSToInject(Constants.JSMethods.ENTER_BACKGROUND));
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void enterForeground() {
        injectJavascript(generateJSToInject(Constants.JSMethods.ENTER_FOREGROUND));
    }

    public void viewableChange(boolean z, String str) {
        injectJavascript(generateJSToInject(Constants.JSMethods.VIEWABLE_CHANGE, parseToJson(Constants.ParametersKeys.WEB_VIEW, str, null, null, null, null, null, null, Constants.ParametersKeys.IS_VIEWABLE, z)));
    }

    public void nativeNavigationPressed(String str) {
        injectJavascript(generateJSToInject(Constants.JSMethods.NATIVE_NAVIGATION_PRESSED, parseToJson("action", str, null, null, null, null, null, null, null, false)));
    }

    public void pageFinished() {
        injectJavascript(generateJSToInject(Constants.JSMethods.PAGE_FINISHED));
    }

    public void interceptedUrlToStore() {
        injectJavascript(generateJSToInject(Constants.JSMethods.INTERCEPTED_URL_TO_STORE));
    }

    public void failedToStartStoreActivity(String str, String str2) {
        if (TextUtils.isEmpty(str2)) {
            str2 = Constants.ErrorCodes.STORE_ACTIVITY_FAILED_UNKNOWN_URL;
        }
        String str3 = str2;
        if (TextUtils.isEmpty(str)) {
            str = Constants.ErrorCodes.STORE_ACTIVITY_FAILED_REASON_UNSPECIFIED;
        }
        injectJavascript(generateJSToInject(Constants.JSMethods.FAILED_TO_START_STORE_ACTIVITY, parseToJson("errMsg", str, "url", str3, null, null, null, null, null, false)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void injectJavascript(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        String str2 = "console.log(\"JS exeption: \" + JSON.stringify(e));";
        if (getDebugMode() != SSAEnums.DebugMode.MODE_0.getValue() && (getDebugMode() < SSAEnums.DebugMode.MODE_1.getValue() || getDebugMode() > SSAEnums.DebugMode.MODE_3.getValue())) {
            str2 = "empty";
        }
        final StringBuilder sb = new StringBuilder();
        sb.append("try{");
        sb.append(str);
        sb.append("}catch(e){");
        sb.append(str2);
        sb.append("}");
        final String str3 = "javascript:" + sb.toString();
        runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.10
            @Override // java.lang.Runnable
            public void run() {
                Logger.i(WebController.this.TAG, str3);
                try {
                    if (WebController.this.isKitkatAndAbove != null) {
                        if (WebController.this.isKitkatAndAbove.booleanValue()) {
                            WebController.this.evaluateJavascriptKitKat(sb.toString());
                        } else {
                            WebController.this.loadUrl(str3);
                        }
                    } else if (Build.VERSION.SDK_INT >= 19) {
                        try {
                            WebController.this.evaluateJavascriptKitKat(sb.toString());
                            WebController.this.isKitkatAndAbove = true;
                        } catch (NoSuchMethodError e) {
                            Logger.e(WebController.this.TAG, "evaluateJavascrip NoSuchMethodError: SDK version=" + Build.VERSION.SDK_INT + " " + e);
                            WebController.this.loadUrl(str3);
                            WebController.this.isKitkatAndAbove = false;
                        } catch (Throwable th) {
                            Logger.e(WebController.this.TAG, "evaluateJavascrip Exception: SDK version=" + Build.VERSION.SDK_INT + " " + th);
                            WebController.this.loadUrl(str3);
                            WebController.this.isKitkatAndAbove = false;
                        }
                    } else {
                        WebController.this.loadUrl(str3);
                        WebController.this.isKitkatAndAbove = false;
                    }
                } catch (Throwable th2) {
                    Logger.e(WebController.this.TAG, "injectJavascript: " + th2.toString());
                    new IronSourceAsyncHttpRequestTask().execute("https://www.supersonicads.com/mobile/sdk5/log?method=injectJavaScript");
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void evaluateJavascriptKitKat(String str) {
        evaluateJavascript(str, null);
    }

    public Context getCurrentActivityContext() {
        return ((MutableContextWrapper) this.mCurrentActivityContext).getBaseContext();
    }

    private String getRequestParameters(JSONObject jSONObject) {
        DeviceProperties deviceProperties = DeviceProperties.getInstance(getContext());
        StringBuilder sb = new StringBuilder();
        String supersonicSdkVersion = DeviceProperties.getSupersonicSdkVersion();
        if (!TextUtils.isEmpty(supersonicSdkVersion)) {
            sb.append("SDKVersion");
            sb.append(Constants.RequestParameters.EQUAL);
            sb.append(supersonicSdkVersion);
            sb.append(Constants.RequestParameters.AMPERSAND);
        }
        String deviceOsType = deviceProperties.getDeviceOsType();
        if (!TextUtils.isEmpty(deviceOsType)) {
            sb.append("deviceOs");
            sb.append(Constants.RequestParameters.EQUAL);
            sb.append(deviceOsType);
        }
        Uri uri = Uri.parse(SDKUtils.getControllerUrl());
        if (uri != null) {
            String str = uri.getScheme() + ":";
            String host = uri.getHost();
            int port = uri.getPort();
            if (port != -1) {
                host = host + ":" + port;
            }
            sb.append(Constants.RequestParameters.AMPERSAND);
            sb.append(Constants.RequestParameters.PROTOCOL);
            sb.append(Constants.RequestParameters.EQUAL);
            sb.append(str);
            sb.append(Constants.RequestParameters.AMPERSAND);
            sb.append(Constants.RequestParameters.DOMAIN);
            sb.append(Constants.RequestParameters.EQUAL);
            sb.append(host);
            if (jSONObject.keys().hasNext()) {
                try {
                    String string = new JSONObject(jSONObject, new String[]{Constants.RequestParameters.IS_SECURED, "applicationKey"}).toString();
                    if (!TextUtils.isEmpty(string)) {
                        sb.append(Constants.RequestParameters.AMPERSAND);
                        sb.append(Constants.RequestParameters.CONTROLLER_CONFIG);
                        sb.append(Constants.RequestParameters.EQUAL);
                        sb.append(string);
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
            sb.append(Constants.RequestParameters.AMPERSAND);
            sb.append(Constants.RequestParameters.DEBUG);
            sb.append(Constants.RequestParameters.EQUAL);
            sb.append(getDebugMode());
        }
        return sb.toString();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void closeWebView() {
        OnWebViewChangeListener onWebViewChangeListener = this.mChangeListener;
        if (onWebViewChangeListener != null) {
            onWebViewChangeListener.onCloseRequested();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0022  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void responseBack(java.lang.String r4, boolean r5, java.lang.String r6, java.lang.String r7) {
        /*
            r3 = this;
            com.ironsource.sdk.data.SSAObj r0 = new com.ironsource.sdk.data.SSAObj
            r0.<init>(r4)
            java.lang.String r1 = com.ironsource.sdk.controller.WebController.JSON_KEY_SUCCESS
            java.lang.String r1 = r0.getString(r1)
            java.lang.String r2 = com.ironsource.sdk.controller.WebController.JSON_KEY_FAIL
            java.lang.String r0 = r0.getString(r2)
            if (r5 == 0) goto L1a
            boolean r5 = android.text.TextUtils.isEmpty(r1)
            if (r5 != 0) goto L22
            goto L23
        L1a:
            boolean r5 = android.text.TextUtils.isEmpty(r0)
            if (r5 != 0) goto L22
            r1 = r0
            goto L23
        L22:
            r1 = 0
        L23:
            boolean r5 = android.text.TextUtils.isEmpty(r1)
            if (r5 != 0) goto L5c
            boolean r5 = android.text.TextUtils.isEmpty(r6)
            if (r5 != 0) goto L40
            org.json.JSONObject r5 = new org.json.JSONObject     // Catch: org.json.JSONException -> L3f
            r5.<init>(r4)     // Catch: org.json.JSONException -> L3f
            java.lang.String r0 = "errMsg"
            org.json.JSONObject r5 = r5.put(r0, r6)     // Catch: org.json.JSONException -> L3f
            java.lang.String r4 = r5.toString()     // Catch: org.json.JSONException -> L3f
            goto L40
        L3f:
        L40:
            boolean r5 = android.text.TextUtils.isEmpty(r7)
            if (r5 != 0) goto L55
            org.json.JSONObject r5 = new org.json.JSONObject     // Catch: org.json.JSONException -> L55
            r5.<init>(r4)     // Catch: org.json.JSONException -> L55
            java.lang.String r6 = "errCode"
            org.json.JSONObject r5 = r5.put(r6, r7)     // Catch: org.json.JSONException -> L55
            java.lang.String r4 = r5.toString()     // Catch: org.json.JSONException -> L55
        L55:
            java.lang.String r4 = r3.generateJSToInject(r1, r4)
            r3.injectJavascript(r4)
        L5c:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ironsource.sdk.controller.WebController.responseBack(java.lang.String, boolean, java.lang.String, java.lang.String):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String extractSuccessFunctionToCall(String str) {
        return new SSAObj(str).getString(JSON_KEY_SUCCESS);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String extractFailFunctionToCall(String str) {
        return new SSAObj(str).getString(JSON_KEY_FAIL);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String parseToJson(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, boolean z) {
        JSONObject jSONObject = new JSONObject();
        try {
            if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2)) {
                jSONObject.put(str, SDKUtils.encodeString(str2));
            }
            if (!TextUtils.isEmpty(str3) && !TextUtils.isEmpty(str4)) {
                jSONObject.put(str3, SDKUtils.encodeString(str4));
            }
            if (!TextUtils.isEmpty(str5) && !TextUtils.isEmpty(str6)) {
                jSONObject.put(str5, SDKUtils.encodeString(str6));
            }
            if (!TextUtils.isEmpty(str7) && !TextUtils.isEmpty(str8)) {
                jSONObject.put(str7, SDKUtils.encodeString(str8));
            }
            if (!TextUtils.isEmpty(str9)) {
                jSONObject.put(str9, z);
            }
        } catch (JSONException e) {
            e.printStackTrace();
            new IronSourceAsyncHttpRequestTask().execute(Constants.NATIVE_EXCEPTION_BASE_URL + e.getStackTrace()[0].getMethodName());
        }
        return jSONObject.toString();
    }

    private String mapToJson(Map<String, String> map) {
        JSONObject jSONObject = new JSONObject();
        if (map != null && !map.isEmpty()) {
            for (String str : map.keySet()) {
                try {
                    jSONObject.put(str, SDKUtils.encodeString(map.get(str)));
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }
        return jSONObject.toString();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Object[] getDeviceParams(Context context) {
        boolean z;
        DeviceProperties deviceProperties = DeviceProperties.getInstance(context);
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("appOrientation", SDKUtils.translateRequestedOrientation(DeviceStatus.getActivityRequestedOrientation(getCurrentActivityContext())));
            String deviceOem = deviceProperties.getDeviceOem();
            if (deviceOem != null) {
                jSONObject.put(SDKUtils.encodeString("deviceOEM"), SDKUtils.encodeString(deviceOem));
            }
            String deviceModel = deviceProperties.getDeviceModel();
            if (deviceModel != null) {
                jSONObject.put(SDKUtils.encodeString("deviceModel"), SDKUtils.encodeString(deviceModel));
                z = false;
            } else {
                z = true;
            }
            try {
                SDKUtils.loadGoogleAdvertiserInfo(context);
                String advertiserId = SDKUtils.getAdvertiserId();
                Boolean boolValueOf = Boolean.valueOf(SDKUtils.isLimitAdTrackingEnabled());
                if (!TextUtils.isEmpty(advertiserId)) {
                    Logger.i(this.TAG, "add AID and LAT");
                    jSONObject.put("isLimitAdTrackingEnabled", boolValueOf);
                    jSONObject.put(Constants.RequestParameters.DEVICE_IDS + Constants.RequestParameters.LEFT_BRACKETS + "AID" + Constants.RequestParameters.RIGHT_BRACKETS, SDKUtils.encodeString(advertiserId));
                }
                String deviceOsType = deviceProperties.getDeviceOsType();
                if (deviceOsType != null) {
                    jSONObject.put(SDKUtils.encodeString("deviceOs"), SDKUtils.encodeString(deviceOsType));
                } else {
                    z = true;
                }
                String deviceOsVersion = deviceProperties.getDeviceOsVersion();
                if (deviceOsVersion != null) {
                    jSONObject.put(SDKUtils.encodeString("deviceOSVersion"), deviceOsVersion.replaceAll("[^0-9/.]", ""));
                } else {
                    z = true;
                }
                String deviceOsVersion2 = deviceProperties.getDeviceOsVersion();
                if (deviceOsVersion2 != null) {
                    jSONObject.put(SDKUtils.encodeString("deviceOSVersionFull"), SDKUtils.encodeString(deviceOsVersion2));
                }
                String strValueOf = String.valueOf(deviceProperties.getDeviceApiLevel());
                if (strValueOf != null) {
                    jSONObject.put(SDKUtils.encodeString("deviceApiLevel"), strValueOf);
                } else {
                    z = true;
                }
                String supersonicSdkVersion = DeviceProperties.getSupersonicSdkVersion();
                if (supersonicSdkVersion != null) {
                    jSONObject.put(SDKUtils.encodeString("SDKVersion"), SDKUtils.encodeString(supersonicSdkVersion));
                }
                if (deviceProperties.getDeviceCarrier() != null && deviceProperties.getDeviceCarrier().length() > 0) {
                    jSONObject.put(SDKUtils.encodeString("mobileCarrier"), SDKUtils.encodeString(deviceProperties.getDeviceCarrier()));
                }
                String connectionType = ConnectivityUtils.getConnectionType(context);
                if (connectionType.equals("none")) {
                    z = true;
                } else {
                    jSONObject.put(SDKUtils.encodeString("connectionType"), SDKUtils.encodeString(connectionType));
                }
                if (Build.VERSION.SDK_INT >= 23) {
                    jSONObject.put(SDKUtils.encodeString("hasVPN"), ConnectivityUtils.hasVPN(context));
                }
                String language = context.getResources().getConfiguration().locale.getLanguage();
                if (!TextUtils.isEmpty(language)) {
                    jSONObject.put(SDKUtils.encodeString("deviceLanguage"), SDKUtils.encodeString(language.toUpperCase()));
                }
                if (SDKUtils.isExternalStorageAvailable()) {
                    jSONObject.put(SDKUtils.encodeString("diskFreeSize"), SDKUtils.encodeString(String.valueOf(DeviceStatus.getAvailableMemorySizeInMegaBytes(this.mCacheDirectory))));
                } else {
                    z = true;
                }
                String strValueOf2 = String.valueOf(DeviceStatus.getDeviceWidth());
                if (TextUtils.isEmpty(strValueOf2)) {
                    z = true;
                } else {
                    jSONObject.put(SDKUtils.encodeString(Constants.RequestParameters.DEVICE_SCREEN_SIZE) + Constants.RequestParameters.LEFT_BRACKETS + SDKUtils.encodeString("width") + Constants.RequestParameters.RIGHT_BRACKETS, SDKUtils.encodeString(strValueOf2));
                }
                jSONObject.put(SDKUtils.encodeString(Constants.RequestParameters.DEVICE_SCREEN_SIZE) + Constants.RequestParameters.LEFT_BRACKETS + SDKUtils.encodeString("height") + Constants.RequestParameters.RIGHT_BRACKETS, SDKUtils.encodeString(String.valueOf(DeviceStatus.getDeviceHeight())));
                String packageName = ApplicationContext.getPackageName(getContext());
                if (!TextUtils.isEmpty(packageName)) {
                    jSONObject.put(SDKUtils.encodeString("bundleId"), SDKUtils.encodeString(packageName));
                }
                String strValueOf3 = String.valueOf(DeviceStatus.getDeviceDensity());
                if (!TextUtils.isEmpty(strValueOf3)) {
                    jSONObject.put(SDKUtils.encodeString("deviceScreenScale"), SDKUtils.encodeString(strValueOf3));
                }
                String strValueOf4 = String.valueOf(DeviceStatus.isRootedDevice());
                if (!TextUtils.isEmpty(strValueOf4)) {
                    jSONObject.put(SDKUtils.encodeString("unLocked"), SDKUtils.encodeString(strValueOf4));
                }
                jSONObject.put(SDKUtils.encodeString("deviceVolume"), DeviceProperties.getInstance(context).getDeviceVolume(context));
                Context currentActivityContext = getCurrentActivityContext();
                if (Build.VERSION.SDK_INT >= 19 && (currentActivityContext instanceof Activity)) {
                    jSONObject.put(SDKUtils.encodeString("immersiveMode"), DeviceStatus.isImmersiveSupported((Activity) currentActivityContext));
                }
                jSONObject.put(SDKUtils.encodeString("batteryLevel"), DeviceStatus.getBatteryLevel(currentActivityContext));
                jSONObject.put(SDKUtils.encodeString("mcc"), ConnectivityService.getNetworkMCC(currentActivityContext));
                jSONObject.put(SDKUtils.encodeString("mnc"), ConnectivityService.getNetworkMNC(currentActivityContext));
                jSONObject.put(SDKUtils.encodeString("phoneType"), ConnectivityService.getPhoneType(currentActivityContext));
                jSONObject.put(SDKUtils.encodeString("simOperator"), SDKUtils.encodeString(ConnectivityService.getSimOperator(currentActivityContext)));
                jSONObject.put(SDKUtils.encodeString("lastUpdateTime"), ApplicationContext.getLastUpdateTime(currentActivityContext));
                jSONObject.put(SDKUtils.encodeString("firstInstallTime"), ApplicationContext.getFirstInstallTime(currentActivityContext));
                jSONObject.put(SDKUtils.encodeString("appVersion"), SDKUtils.encodeString(ApplicationContext.getApplicationVersionName(currentActivityContext)));
                String installerPackageName = ApplicationContext.getInstallerPackageName(currentActivityContext);
                if (!TextUtils.isEmpty(installerPackageName)) {
                    jSONObject.put(SDKUtils.encodeString("installerPackageName"), SDKUtils.encodeString(installerPackageName));
                }
                addGooglePlayInstalledData(jSONObject);
            } catch (JSONException e) {
                e = e;
                e.printStackTrace();
                new IronSourceAsyncHttpRequestTask().execute(Constants.NATIVE_EXCEPTION_BASE_URL + e.getStackTrace()[0].getMethodName());
            }
        } catch (JSONException e2) {
            e = e2;
            z = false;
        }
        return new Object[]{jSONObject.toString(), Boolean.valueOf(z)};
    }

    private void addGooglePlayInstalledData(JSONObject jSONObject) throws JSONException {
        jSONObject.put(SDKUtils.encodeString(Constants.RequestParameters.GOOGLE_PLAY_INSTALLED), PackagesInstallationService.isGooglePlayInstalled(getContext()));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Object[] getApplicationParams(String str, String str2) {
        boolean z;
        JSONObject jSONObject = new JSONObject();
        Map<String, String> map = null;
        if (TextUtils.isEmpty(str)) {
            z = true;
        } else {
            SSAEnums.ProductType stringProductTypeAsEnum = getStringProductTypeAsEnum(str);
            if (stringProductTypeAsEnum == SSAEnums.ProductType.OfferWall) {
                map = this.mOWExtraParameters;
            } else {
                DemandSource demandSourceById = this.mDemandSourceManager.getDemandSourceById(stringProductTypeAsEnum, str2);
                if (demandSourceById != null) {
                    Map<String, String> extraParams = demandSourceById.getExtraParams();
                    extraParams.put("demandSourceName", demandSourceById.getDemandSourceName());
                    extraParams.put("demandSourceId", demandSourceById.getId());
                    map = extraParams;
                }
            }
            try {
                jSONObject.put(Constants.ParametersKeys.PRODUCT_TYPE, str);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            try {
                Map<String, String> initSDKParams = SDKUtils.getInitSDKParams();
                if (initSDKParams != null) {
                    jSONObject = SDKUtils.mergeJSONObjects(jSONObject, new JSONObject(initSDKParams));
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
            z = false;
        }
        if (TextUtils.isEmpty(this.mUserId)) {
            z = true;
        } else {
            try {
                jSONObject.put(SDKUtils.encodeString("applicationUserId"), SDKUtils.encodeString(this.mUserId));
            } catch (JSONException e3) {
                e3.printStackTrace();
            }
        }
        if (TextUtils.isEmpty(this.mApplicationKey)) {
            z = true;
        } else {
            try {
                jSONObject.put(SDKUtils.encodeString("applicationKey"), SDKUtils.encodeString(this.mApplicationKey));
            } catch (JSONException e4) {
                e4.printStackTrace();
            }
        }
        if (map != null && !map.isEmpty()) {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                if (entry.getKey().equalsIgnoreCase("sdkWebViewCache")) {
                    setWebviewCache(entry.getValue());
                }
                try {
                    jSONObject.put(SDKUtils.encodeString(entry.getKey()), SDKUtils.encodeString(entry.getValue()));
                } catch (JSONException e5) {
                    e5.printStackTrace();
                }
            }
        }
        return new Object[]{jSONObject.toString(), Boolean.valueOf(z)};
    }

    @Override // com.ironsource.sdk.precache.DownloadManager.OnPreCacheCompletion
    public void onFileDownloadSuccess(SSAFile sSAFile) {
        if (sSAFile.getFile().contains(Constants.MOBILE_CONTROLLER_HTML)) {
            load(1);
        } else {
            assetCached(sSAFile.getFile(), sSAFile.getPath());
        }
    }

    @Override // com.ironsource.sdk.precache.DownloadManager.OnPreCacheCompletion
    public void onFileDownloadFail(SSAFile sSAFile) {
        if (sSAFile.getFile().contains(Constants.MOBILE_CONTROLLER_HTML)) {
            this.mControllerListener.handleControllerStageFailed("controller failed to download - " + sSAFile.getErrMsg());
            return;
        }
        assetCachedFailed(sSAFile.getFile(), sSAFile.getPath(), sSAFile.getErrMsg());
    }

    @Override // android.webkit.DownloadListener
    public void onDownloadStart(String str, String str2, String str3, String str4, long j) {
        Logger.i(this.TAG, str + " " + str4);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void toastingErrMsg(final String str, String str2) {
        final String string = new SSAObj(str2).getString("errMsg");
        if (TextUtils.isEmpty(string)) {
            return;
        }
        runOnUiThread(new Runnable() { // from class: com.ironsource.sdk.controller.WebController.11
            @Override // java.lang.Runnable
            public void run() {
                if (WebController.this.getDebugMode() == SSAEnums.DebugMode.MODE_3.getValue()) {
                    Toast.makeText(WebController.this.getCurrentActivityContext(), str + " : " + string, 1).show();
                }
            }
        });
    }

    public void setControllerKeyPressed(String str) {
        this.mControllerKeyPressed = str;
    }

    public String getControllerKeyPressed() {
        String str = this.mControllerKeyPressed;
        setControllerKeyPressed("interrupt");
        return str;
    }

    public void sendConnectionTypeChanged(String str) {
        Logger.i(this.TAG, "device status changed, connection type " + str);
        ISNEventsBaseData.setConnectionType(str);
        injectJavascript(generateJSToInject(Constants.JSMethods.DEVICE_STATUS_CHANGED, parseToJson("connectionType", str, null, null, null, null, null, null, null, false)));
    }

    public void sendConnectionInfoChanged(JSONObject jSONObject) {
        Logger.i(this.TAG, "device connection info changed: " + jSONObject.toString());
        injectJavascript(generateJSToInject(Constants.JSMethods.CONNECTION_INFO_CHANGED, parseToJson(Constants.RequestParameters.CONNECTION_INFO, jSONObject.toString(), null, null, null, null, null, null, null, false)));
    }

    public void engageEnd(String str) {
        if (str.equals(Constants.ParametersKeys.FORCE_CLOSE)) {
            closeWebView();
        }
        injectJavascript(generateJSToInject(Constants.JSMethods.ENGAGE_END, parseToJson("action", str, null, null, null, null, null, null, null, false)));
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void registerConnectionReceiver(Context context) {
        ConnectivityAdapter connectivityAdapter = this.mConnectivityAdapter;
        if (connectivityAdapter == null) {
            return;
        }
        connectivityAdapter.startListenToNetworkChanges(context);
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void unregisterConnectionReceiver(Context context) {
        ConnectivityAdapter connectivityAdapter = this.mConnectivityAdapter;
        if (connectivityAdapter == null) {
            return;
        }
        connectivityAdapter.stopListenToNetworkChanges(context);
    }

    public void pause() {
        if (Build.VERSION.SDK_INT > 10) {
            try {
                onPause();
            } catch (Throwable th) {
                Logger.i(this.TAG, "WebViewController: pause() - " + th);
                new IronSourceAsyncHttpRequestTask().execute("https://www.supersonicads.com/mobile/sdk5/log?method=webviewPause");
            }
        }
    }

    public void resume() {
        if (Build.VERSION.SDK_INT > 10) {
            try {
                onResume();
            } catch (Throwable th) {
                Logger.i(this.TAG, "WebViewController: onResume() - " + th);
                new IronSourceAsyncHttpRequestTask().execute("https://www.supersonicads.com/mobile/sdk5/log?method=webviewResume");
            }
        }
    }

    public void setOnWebViewControllerChangeListener(OnWebViewChangeListener onWebViewChangeListener) {
        this.mChangeListener = onWebViewChangeListener;
    }

    public FrameLayout getLayout() {
        return this.mControllerLayout;
    }

    public boolean inCustomView() {
        return this.mCustomView != null;
    }

    public void hideCustomView() {
        this.mWebChromeClient.onHideCustomView();
    }

    private void setWebviewCache(String str) {
        if (str.equalsIgnoreCase(AppEventsConstants.EVENT_PARAM_VALUE_NO)) {
            getSettings().setCacheMode(2);
        } else {
            getSettings().setCacheMode(-1);
        }
    }

    public boolean handleSearchKeysURLs(String str) {
        List<String> searchKeys = IronSourceSharedPrefHelper.getSupersonicPrefHelper().getSearchKeys();
        if (searchKeys == null) {
            return false;
        }
        try {
            if (searchKeys.isEmpty()) {
                return false;
            }
            Iterator<String> it = searchKeys.iterator();
            while (it.hasNext()) {
                if (str.contains(it.next())) {
                    UrlHandler.openUrl(getCurrentActivityContext(), str);
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void setState(State state) {
        this.mState = state;
    }

    public State getState() {
        return this.mState;
    }

    private void sendProductErrorMessage(SSAEnums.ProductType productType, DemandSource demandSource) {
        triggerOnControllerInitProductFail(SDKUtils.createErrorMessage(getErrorCodeByProductType(productType), Constants.ErrorCodes.InitiatingController), productType, demandSource);
    }

    /* JADX INFO: renamed from: com.ironsource.sdk.controller.WebController$12, reason: invalid class name */
    static /* synthetic */ class AnonymousClass12 {
        static final /* synthetic */ int[] $SwitchMap$com$ironsource$sdk$data$SSAEnums$ProductType;

        static {
            int[] iArr = new int[SSAEnums.ProductType.values().length];
            $SwitchMap$com$ironsource$sdk$data$SSAEnums$ProductType = iArr;
            try {
                iArr[SSAEnums.ProductType.RewardedVideo.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$ironsource$sdk$data$SSAEnums$ProductType[SSAEnums.ProductType.Interstitial.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$ironsource$sdk$data$SSAEnums$ProductType[SSAEnums.ProductType.OfferWall.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$ironsource$sdk$data$SSAEnums$ProductType[SSAEnums.ProductType.OfferWallCredits.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$ironsource$sdk$data$SSAEnums$ProductType[SSAEnums.ProductType.Banner.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
        }
    }

    private String getErrorCodeByProductType(SSAEnums.ProductType productType) {
        int i = AnonymousClass12.$SwitchMap$com$ironsource$sdk$data$SSAEnums$ProductType[productType.ordinal()];
        return i != 1 ? i != 2 ? i != 3 ? i != 4 ? i != 5 ? "" : Constants.ErrorCodes.InitBN : Constants.ErrorCodes.ShowOWCredits : Constants.ErrorCodes.InitOW : Constants.ErrorCodes.InitIS : Constants.ErrorCodes.InitRV;
    }

    @Override // android.webkit.WebView, com.ironsource.sdk.controller.IronSourceController
    public void destroy() {
        super.destroy();
        DownloadManager downloadManager = this.downloadManager;
        if (downloadManager != null) {
            downloadManager.release();
        }
        ConnectivityAdapter connectivityAdapter = this.mConnectivityAdapter;
        if (connectivityAdapter != null) {
            connectivityAdapter.release();
        }
        this.mUiHandler = null;
        this.mCurrentActivityContext = null;
    }

    private String generateJSToInject(String str) {
        return "SSA_CORE.SDKController.runFunction('" + str + "');";
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String generateJSToInject(String str, String str2) {
        return "SSA_CORE.SDKController.runFunction('" + str + "?parameters=" + str2 + "');";
    }

    private String generateJSToInject(String str, String str2, String str3) {
        return "SSA_CORE.SDKController.runFunction('" + str + "','" + str2 + "','" + str3 + "');";
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String generateJSToInject(String str, String str2, String str3, String str4) {
        return "SSA_CORE.SDKController.runFunction('" + str + "?parameters=" + str2 + "','" + str3 + "','" + str4 + "');";
    }

    public AdUnitsState getSavedState() {
        return this.mSavedState;
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void restoreSavedState() {
        restoreState(this.mSavedState);
    }

    public void restoreState(AdUnitsState adUnitsState) {
        synchronized (this.mSavedStateLocker) {
            if (adUnitsState.shouldRestore() && this.mIsWebControllerReady) {
                Log.d(this.TAG, "restoreState(state:" + adUnitsState + ")");
                int displayedProduct = adUnitsState.getDisplayedProduct();
                if (displayedProduct != -1) {
                    if (displayedProduct == SSAEnums.ProductType.RewardedVideo.ordinal()) {
                        Log.d(this.TAG, "onRVAdClosed()");
                        SSAEnums.ProductType productType = SSAEnums.ProductType.RewardedVideo;
                        String displayedDemandSourceId = adUnitsState.getDisplayedDemandSourceId();
                        DSAdProductListener adProductListenerByProductType = getAdProductListenerByProductType(productType);
                        if (adProductListenerByProductType != null && !TextUtils.isEmpty(displayedDemandSourceId)) {
                            adProductListenerByProductType.onAdProductClose(productType, displayedDemandSourceId);
                        }
                    } else if (displayedProduct == SSAEnums.ProductType.Interstitial.ordinal()) {
                        Log.d(this.TAG, "onInterstitialAdClosed()");
                        SSAEnums.ProductType productType2 = SSAEnums.ProductType.Interstitial;
                        String displayedDemandSourceId2 = adUnitsState.getDisplayedDemandSourceId();
                        DSAdProductListener adProductListenerByProductType2 = getAdProductListenerByProductType(productType2);
                        if (adProductListenerByProductType2 != null && !TextUtils.isEmpty(displayedDemandSourceId2)) {
                            adProductListenerByProductType2.onAdProductClose(productType2, displayedDemandSourceId2);
                        }
                    } else if (displayedProduct == SSAEnums.ProductType.OfferWall.ordinal()) {
                        Log.d(this.TAG, "onOWAdClosed()");
                        OnOfferWallListener onOfferWallListener = this.mOnOfferWallListener;
                        if (onOfferWallListener != null) {
                            onOfferWallListener.onOWAdClosed();
                        }
                    }
                    adUnitsState.adOpened(-1);
                    adUnitsState.setDisplayedDemandSourceId(null);
                } else {
                    Log.d(this.TAG, "No ad was opened");
                }
                String interstitialAppKey = adUnitsState.getInterstitialAppKey();
                String interstitialUserId = adUnitsState.getInterstitialUserId();
                for (DemandSource demandSource : this.mDemandSourceManager.getDemandSources(SSAEnums.ProductType.Interstitial)) {
                    if (demandSource.getDemandSourceInitState() == 2) {
                        Log.d(this.TAG, "initInterstitial(appKey:" + interstitialAppKey + ", userId:" + interstitialUserId + ", demandSource:" + demandSource.getDemandSourceName() + ")");
                        initInterstitial(interstitialAppKey, interstitialUserId, demandSource, this.mDSInterstitialListener);
                    }
                }
                String rVAppKey = adUnitsState.getRVAppKey();
                String rVUserId = adUnitsState.getRVUserId();
                for (DemandSource demandSource2 : this.mDemandSourceManager.getDemandSources(SSAEnums.ProductType.RewardedVideo)) {
                    if (demandSource2.getDemandSourceInitState() == 2) {
                        String demandSourceName = demandSource2.getDemandSourceName();
                        Log.d(this.TAG, "onRVNoMoreOffers()");
                        this.mDSRewardedVideoListener.onRVNoMoreOffers(demandSourceName);
                        Log.d(this.TAG, "initRewardedVideo(appKey:" + rVAppKey + ", userId:" + rVUserId + ", demandSource:" + demandSourceName + ")");
                        initRewardedVideo(rVAppKey, rVUserId, demandSource2, this.mDSRewardedVideoListener);
                    }
                }
                adUnitsState.setShouldRestore(false);
            }
            this.mSavedState = adUnitsState;
        }
    }

    @Override // android.webkit.WebView, android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i == 4) {
            if (this.mChangeListener.onBackButtonPressed()) {
                return true;
            }
            return super.onKeyDown(i, keyEvent);
        }
        return super.onKeyDown(i, keyEvent);
    }

    void runOnUiThread(Runnable runnable) {
        Handler handler = this.mUiHandler;
        if (handler != null) {
            handler.post(runnable);
        }
    }

    @Override // com.ironsource.sdk.controller.IronSourceController
    public void setCommunicationWithAdView(ISNAdView iSNAdView) {
        BannerJSAdapter bannerJSAdapter = this.mBannerJsAdapter;
        if (bannerJSAdapter != null) {
            bannerJSAdapter.setCommunicationWithAdView(iSNAdView);
        }
    }
}
