.class public Lcom/ironsource/sdk/controller/WebController;
.super Landroid/webkit/WebView;
.source "WebController.java"

# interfaces
.implements Lcom/ironsource/sdk/controller/IronSourceController;
.implements Lcom/ironsource/sdk/precache/DownloadManager$OnPreCacheCompletion;
.implements Landroid/webkit/DownloadListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ironsource/sdk/controller/WebController$State;,
        Lcom/ironsource/sdk/controller/WebController$Result;,
        Lcom/ironsource/sdk/controller/WebController$OnInitProductHandler;,
        Lcom/ironsource/sdk/controller/WebController$NativeAPI;,
        Lcom/ironsource/sdk/controller/WebController$FrameBustWebViewClient;,
        Lcom/ironsource/sdk/controller/WebController$ChromeClient;,
        Lcom/ironsource/sdk/controller/WebController$ViewClient;,
        Lcom/ironsource/sdk/controller/WebController$SupersonicWebViewTouchListener;
    }
.end annotation


# static fields
.field public static EXTERNAL_URL:Ljava/lang/String; = "external_url"

.field public static IS_STORE:Ljava/lang/String; = "is_store"

.field private static JSON_KEY_FAIL:Ljava/lang/String; = "fail"

.field private static JSON_KEY_SUCCESS:Ljava/lang/String; = "success"

.field public static SECONDARY_WEB_VIEW:Ljava/lang/String; = "secondary_web_view"

.field public static mDebugMode:I


# instance fields
.field private final GENERIC_MESSAGE:Ljava/lang/String;

.field private PUB_TAG:Ljava/lang/String;

.field private TAG:Ljava/lang/String;

.field private downloadManager:Lcom/ironsource/sdk/precache/DownloadManager;

.field private isKitkatAndAbove:Ljava/lang/Boolean;

.field private isRemoveCloseEventHandler:Z

.field private mAdViewsJsAdapter:Lcom/ironsource/sdk/controller/AdViewsJSAdapter;

.field private mApplicationKey:Ljava/lang/String;

.field private mBannerJsAdapter:Lcom/ironsource/sdk/controller/BannerJSAdapter;

.field private mCacheDirectory:Ljava/lang/String;

.field private mChangeListener:Lcom/ironsource/sdk/listeners/OnWebViewChangeListener;

.field private mCloseEventTimer:Landroid/os/CountDownTimer;

.field private mConnectivityAdapter:Lcom/ironsource/sdk/service/ConnectivityAdapter;

.field private mControllerAdapter:Lcom/ironsource/sdk/controller/ControllerAdapter;

.field private mControllerKeyPressed:Ljava/lang/String;

.field private mControllerLayout:Landroid/widget/FrameLayout;

.field private mControllerListener:Lcom/ironsource/sdk/controller/ControllerEventListener;

.field mCurrentActivityContext:Landroid/content/Context;

.field private mCustomView:Landroid/view/View;

.field private mCustomViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

.field private mCustomViewContainer:Landroid/widget/FrameLayout;

.field private mDSBannerListener:Lcom/ironsource/sdk/listeners/internals/DSBannerListener;

.field private mDSInterstitialListener:Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;

.field private mDSRewardedVideoListener:Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;

.field private mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

.field private mDeviceDataJsAdapter:Lcom/ironsource/sdk/controller/DeviceDataJSAdapter;

.field private mHiddenForceCloseHeight:I

.field private mHiddenForceCloseLocation:Ljava/lang/String;

.field private mHiddenForceCloseWidth:I

.field private mIsImmersive:Z

.field private mIsWebControllerReady:Z

.field public mLoadControllerTimer:Landroid/os/CountDownTimer;

.field private mOWCreditsMiss:Z

.field private mOWExtraParameters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mOWmiss:Z

.field private mOmidJsAdapter:Lcom/ironsource/sdk/controller/OMIDJSAdapter;

.field private mOnGenericFunctionListener:Lcom/ironsource/sdk/listeners/OnGenericFunctionListener;

.field private mOnOfferWallListener:Lcom/ironsource/sdk/listeners/OnOfferWallListener;

.field private mOrientationState:Ljava/lang/String;

.field private mPermissionsJsAdapter:Lcom/ironsource/sdk/controller/PermissionsJSAdapter;

.field private mSavedState:Lcom/ironsource/sdk/data/AdUnitsState;

.field private mSavedStateLocker:Ljava/lang/Object;

.field private mState:Lcom/ironsource/sdk/controller/WebController$State;

.field private mTokenJSAdapter:Lcom/ironsource/sdk/controller/TokenJSAdapter;

.field mUiHandler:Landroid/os/Handler;

.field private mUserId:Ljava/lang/String;

.field private mVideoEventsListener:Lcom/ironsource/sdk/controller/VideoEventsListener;

.field private mWebChromeClient:Lcom/ironsource/sdk/controller/WebController$ChromeClient;

.field private mWebViewMessagingMediator:Lcom/ironsource/sdk/controller/WebViewMessagingMediator;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/ironsource/sdk/controller/DemandSourceManager;Lcom/ironsource/sdk/controller/ControllerEventListener;)V
    .locals 3

    .line 200
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 103
    const-class v0, Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    const-string v0, "IronSource"

    .line 104
    iput-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->PUB_TAG:Ljava/lang/String;

    const-string v0, "We\'re sorry, some error occurred. we will investigate it"

    .line 108
    iput-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->GENERIC_MESSAGE:Ljava/lang/String;

    const-string v0, "interrupt"

    .line 132
    iput-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mControllerKeyPressed:Ljava/lang/String;

    const/16 v0, 0x32

    .line 138
    iput v0, p0, Lcom/ironsource/sdk/controller/WebController;->mHiddenForceCloseWidth:I

    .line 139
    iput v0, p0, Lcom/ironsource/sdk/controller/WebController;->mHiddenForceCloseHeight:I

    const-string v0, "top-right"

    .line 140
    iput-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mHiddenForceCloseLocation:Ljava/lang/String;

    const/4 v0, 0x0

    .line 159
    iput-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->isKitkatAndAbove:Ljava/lang/Boolean;

    .line 168
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->mSavedStateLocker:Ljava/lang/Object;

    const/4 v1, 0x0

    .line 173
    iput-boolean v1, p0, Lcom/ironsource/sdk/controller/WebController;->mIsImmersive:Z

    .line 201
    new-instance v1, Landroid/content/MutableContextWrapper;

    invoke-direct {v1, p1}, Landroid/content/MutableContextWrapper;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->mCurrentActivityContext:Landroid/content/Context;

    .line 202
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    const-string v2, "C\'tor"

    invoke-static {v1, v2}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    iput-object p3, p0, Lcom/ironsource/sdk/controller/WebController;->mControllerListener:Lcom/ironsource/sdk/controller/ControllerEventListener;

    .line 205
    iget-object p3, p0, Lcom/ironsource/sdk/controller/WebController;->mCurrentActivityContext:Landroid/content/Context;

    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p0, p3}, Lcom/ironsource/sdk/controller/WebController;->initializeCacheDirectory(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/ironsource/sdk/controller/WebController;->mCacheDirectory:Ljava/lang/String;

    .line 206
    iput-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    .line 207
    iget-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mCurrentActivityContext:Landroid/content/Context;

    invoke-direct {p0, p2}, Lcom/ironsource/sdk/controller/WebController;->initLayout(Landroid/content/Context;)V

    .line 209
    new-instance p2, Lcom/ironsource/sdk/data/AdUnitsState;

    invoke-direct {p2}, Lcom/ironsource/sdk/data/AdUnitsState;-><init>()V

    iput-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mSavedState:Lcom/ironsource/sdk/data/AdUnitsState;

    .line 211
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getDownloadManager()Lcom/ironsource/sdk/precache/DownloadManager;

    move-result-object p2

    iput-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->downloadManager:Lcom/ironsource/sdk/precache/DownloadManager;

    .line 212
    invoke-virtual {p2, p0}, Lcom/ironsource/sdk/precache/DownloadManager;->setOnPreCacheCompletion(Lcom/ironsource/sdk/precache/DownloadManager$OnPreCacheCompletion;)V

    .line 214
    new-instance p2, Lcom/ironsource/sdk/controller/WebController$ChromeClient;

    invoke-direct {p2, p0, v0}, Lcom/ironsource/sdk/controller/WebController$ChromeClient;-><init>(Lcom/ironsource/sdk/controller/WebController;Lcom/ironsource/sdk/controller/WebController$1;)V

    iput-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mWebChromeClient:Lcom/ironsource/sdk/controller/WebController$ChromeClient;

    .line 216
    new-instance p2, Lcom/ironsource/sdk/controller/WebController$ViewClient;

    invoke-direct {p2, p0, v0}, Lcom/ironsource/sdk/controller/WebController$ViewClient;-><init>(Lcom/ironsource/sdk/controller/WebController;Lcom/ironsource/sdk/controller/WebController$1;)V

    invoke-virtual {p0, p2}, Lcom/ironsource/sdk/controller/WebController;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 217
    iget-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mWebChromeClient:Lcom/ironsource/sdk/controller/WebController$ChromeClient;

    invoke-virtual {p0, p2}, Lcom/ironsource/sdk/controller/WebController;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 219
    invoke-static {p0}, Lcom/ironsource/sdk/utils/WebViewUtils;->setWebViewSettings(Landroid/webkit/WebView;)V

    .line 220
    invoke-direct {p0}, Lcom/ironsource/sdk/controller/WebController;->setWebViewSettings()V

    .line 222
    invoke-direct {p0}, Lcom/ironsource/sdk/controller/WebController;->createSecuredCommunication()V

    .line 224
    invoke-virtual {p0, p0}, Lcom/ironsource/sdk/controller/WebController;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    .line 226
    new-instance p2, Lcom/ironsource/sdk/controller/WebController$SupersonicWebViewTouchListener;

    invoke-direct {p2, p0, v0}, Lcom/ironsource/sdk/controller/WebController$SupersonicWebViewTouchListener;-><init>(Lcom/ironsource/sdk/controller/WebController;Lcom/ironsource/sdk/controller/WebController$1;)V

    invoke-virtual {p0, p2}, Lcom/ironsource/sdk/controller/WebController;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 227
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->createMainThreadHandler()Landroid/os/Handler;

    move-result-object p2

    iput-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mUiHandler:Landroid/os/Handler;

    .line 228
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->createConnectivityAdapter(Landroid/content/Context;)Lcom/ironsource/sdk/service/ConnectivityAdapter;

    move-result-object p2

    iput-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mConnectivityAdapter:Lcom/ironsource/sdk/service/ConnectivityAdapter;

    .line 230
    invoke-virtual {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->registerConnectionReceiver(Landroid/content/Context;)V

    .line 231
    invoke-static {}, Lcom/ironsource/sdk/controller/FeaturesManager;->getInstance()Lcom/ironsource/sdk/controller/FeaturesManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ironsource/sdk/controller/FeaturesManager;->getDebugMode()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->setDebugMode(I)V

    return-void
.end method

.method static synthetic access$1000(Lcom/ironsource/sdk/controller/WebController;)Z
    .locals 0

    .line 97
    iget-boolean p0, p0, Lcom/ironsource/sdk/controller/WebController;->isRemoveCloseEventHandler:Z

    return p0
.end method

.method static synthetic access$1002(Lcom/ironsource/sdk/controller/WebController;Z)Z
    .locals 0

    .line 97
    iput-boolean p1, p0, Lcom/ironsource/sdk/controller/WebController;->isRemoveCloseEventHandler:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/ironsource/sdk/controller/WebController;)Landroid/os/CountDownTimer;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mCloseEventTimer:Landroid/os/CountDownTimer;

    return-object p0
.end method

.method static synthetic access$1102(Lcom/ironsource/sdk/controller/WebController;Landroid/os/CountDownTimer;)Landroid/os/CountDownTimer;
    .locals 0

    .line 97
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mCloseEventTimer:Landroid/os/CountDownTimer;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/ControllerEventListener;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mControllerListener:Lcom/ironsource/sdk/controller/ControllerEventListener;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mCacheDirectory:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/ironsource/sdk/controller/WebController;)Landroid/view/View;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mCustomView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$1502(Lcom/ironsource/sdk/controller/WebController;Landroid/view/View;)Landroid/view/View;
    .locals 0

    .line 97
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mCustomView:Landroid/view/View;

    return-object p1
.end method

.method static synthetic access$1600(Lcom/ironsource/sdk/controller/WebController;)Landroid/widget/FrameLayout;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mCustomViewContainer:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/ironsource/sdk/controller/WebController;)Landroid/webkit/WebChromeClient$CustomViewCallback;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mCustomViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    return-object p0
.end method

.method static synthetic access$1702(Lcom/ironsource/sdk/controller/WebController;Landroid/webkit/WebChromeClient$CustomViewCallback;)Landroid/webkit/WebChromeClient$CustomViewCallback;
    .locals 0

    .line 97
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mCustomViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    return-object p1
.end method

.method static synthetic access$1800(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 97
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->extractSuccessFunctionToCall(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 97
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->extractFailFunctionToCall(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2000(Lcom/ironsource/sdk/controller/WebController;Landroid/content/Context;)[Ljava/lang/Object;
    .locals 0

    .line 97
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->getDeviceParams(Landroid/content/Context;)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2100(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 97
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2200()Ljava/lang/String;
    .locals 1

    .line 97
    sget-object v0, Lcom/ironsource/sdk/controller/WebController;->JSON_KEY_SUCCESS:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2300()Ljava/lang/String;
    .locals 1

    .line 97
    sget-object v0, Lcom/ironsource/sdk/controller/WebController;->JSON_KEY_FAIL:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/service/ConnectivityAdapter;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mConnectivityAdapter:Lcom/ironsource/sdk/service/ConnectivityAdapter;

    return-object p0
.end method

.method static synthetic access$2500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 0

    .line 97
    invoke-direct/range {p0 .. p10}, Lcom/ironsource/sdk/controller/WebController;->parseToJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2600(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/Object;
    .locals 0

    .line 97
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/controller/WebController;->getApplicationParams(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 97
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ironsource/sdk/controller/WebController;->responseBack(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2800(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/precache/DownloadManager;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->downloadManager:Lcom/ironsource/sdk/precache/DownloadManager;

    return-object p0
.end method

.method static synthetic access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z
    .locals 0

    .line 97
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->shouldNotifyDeveloper(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/ironsource/sdk/controller/WebController;)Z
    .locals 0

    .line 97
    iget-boolean p0, p0, Lcom/ironsource/sdk/controller/WebController;->mIsWebControllerReady:Z

    return p0
.end method

.method static synthetic access$3000(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mDSRewardedVideoListener:Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;

    return-object p0
.end method

.method static synthetic access$302(Lcom/ironsource/sdk/controller/WebController;Z)Z
    .locals 0

    .line 97
    iput-boolean p1, p0, Lcom/ironsource/sdk/controller/WebController;->mIsWebControllerReady:Z

    return p1
.end method

.method static synthetic access$3100(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/TokenJSAdapter;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mTokenJSAdapter:Lcom/ironsource/sdk/controller/TokenJSAdapter;

    return-object p0
.end method

.method static synthetic access$3200(Lcom/ironsource/sdk/controller/WebController;)Z
    .locals 0

    .line 97
    iget-boolean p0, p0, Lcom/ironsource/sdk/controller/WebController;->mIsImmersive:Z

    return p0
.end method

.method static synthetic access$3202(Lcom/ironsource/sdk/controller/WebController;Z)Z
    .locals 0

    .line 97
    iput-boolean p1, p0, Lcom/ironsource/sdk/controller/WebController;->mIsImmersive:Z

    return p1
.end method

.method static synthetic access$3300(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/WebController$State;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mState:Lcom/ironsource/sdk/controller/WebController$State;

    return-object p0
.end method

.method static synthetic access$3400(Lcom/ironsource/sdk/controller/WebController;)Landroid/widget/FrameLayout;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mControllerLayout:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method static synthetic access$3500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/data/AdUnitsState;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mSavedState:Lcom/ironsource/sdk/data/AdUnitsState;

    return-object p0
.end method

.method static synthetic access$3600(Lcom/ironsource/sdk/controller/WebController;)V
    .locals 0

    .line 97
    invoke-direct {p0}, Lcom/ironsource/sdk/controller/WebController;->closeWebView()V

    return-void
.end method

.method static synthetic access$3700(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/listeners/OnWebViewChangeListener;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mChangeListener:Lcom/ironsource/sdk/listeners/OnWebViewChangeListener;

    return-object p0
.end method

.method static synthetic access$3800(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/DemandSourceManager;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    return-object p0
.end method

.method static synthetic access$3900(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->PUB_TAG:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 97
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4000(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mUserId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$4100(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mApplicationKey:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$4200(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/listeners/OnOfferWallListener;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mOnOfferWallListener:Lcom/ironsource/sdk/listeners/OnOfferWallListener;

    return-object p0
.end method

.method static synthetic access$4300(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mDSInterstitialListener:Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;

    return-object p0
.end method

.method static synthetic access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 97
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/controller/WebController;->toastingErrMsg(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$4500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Lcom/ironsource/sdk/data/SSAEnums$ProductType;
    .locals 0

    .line 97
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->getStringProductTypeAsEnum(Ljava/lang/String;)Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4600(Lcom/ironsource/sdk/controller/WebController;Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Lcom/ironsource/sdk/listeners/internals/DSAdProductListener;
    .locals 0

    .line 97
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->getAdProductListenerByProductType(Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Lcom/ironsource/sdk/listeners/internals/DSAdProductListener;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4700(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/listeners/internals/DSBannerListener;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mDSBannerListener:Lcom/ironsource/sdk/listeners/internals/DSBannerListener;

    return-object p0
.end method

.method static synthetic access$4800(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/listeners/OnGenericFunctionListener;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mOnGenericFunctionListener:Lcom/ironsource/sdk/listeners/OnGenericFunctionListener;

    return-object p0
.end method

.method static synthetic access$4900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)V
    .locals 0

    .line 97
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->setWebviewBackground(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)V
    .locals 0

    .line 97
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$5000(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/VideoEventsListener;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mVideoEventsListener:Lcom/ironsource/sdk/controller/VideoEventsListener;

    return-object p0
.end method

.method static synthetic access$5100(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/BannerJSAdapter;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mBannerJsAdapter:Lcom/ironsource/sdk/controller/BannerJSAdapter;

    return-object p0
.end method

.method static synthetic access$5200(Lcom/ironsource/sdk/controller/WebController;)Landroid/webkit/WebView;
    .locals 0

    .line 97
    invoke-direct {p0}, Lcom/ironsource/sdk/controller/WebController;->getWebview()Landroid/webkit/WebView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$5300(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/OMIDJSAdapter;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mOmidJsAdapter:Lcom/ironsource/sdk/controller/OMIDJSAdapter;

    return-object p0
.end method

.method static synthetic access$5400(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/PermissionsJSAdapter;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mPermissionsJsAdapter:Lcom/ironsource/sdk/controller/PermissionsJSAdapter;

    return-object p0
.end method

.method static synthetic access$5500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/DeviceDataJSAdapter;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mDeviceDataJsAdapter:Lcom/ironsource/sdk/controller/DeviceDataJSAdapter;

    return-object p0
.end method

.method static synthetic access$5600(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/AdViewsJSAdapter;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mAdViewsJsAdapter:Lcom/ironsource/sdk/controller/AdViewsJSAdapter;

    return-object p0
.end method

.method static synthetic access$5700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;)V
    .locals 0

    .line 97
    invoke-direct {p0, p1, p2, p3}, Lcom/ironsource/sdk/controller/WebController;->triggerOnControllerInitProductFail(Ljava/lang/String;Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;)V

    return-void
.end method

.method static synthetic access$5800(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/Boolean;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->isKitkatAndAbove:Ljava/lang/Boolean;

    return-object p0
.end method

.method static synthetic access$5802(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 97
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->isKitkatAndAbove:Ljava/lang/Boolean;

    return-object p1
.end method

.method static synthetic access$5900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)V
    .locals 0

    .line 97
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->evaluateJavascriptKitKat(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$700(Lcom/ironsource/sdk/controller/WebController;)I
    .locals 0

    .line 97
    iget p0, p0, Lcom/ironsource/sdk/controller/WebController;->mHiddenForceCloseWidth:I

    return p0
.end method

.method static synthetic access$702(Lcom/ironsource/sdk/controller/WebController;I)I
    .locals 0

    .line 97
    iput p1, p0, Lcom/ironsource/sdk/controller/WebController;->mHiddenForceCloseWidth:I

    return p1
.end method

.method static synthetic access$800(Lcom/ironsource/sdk/controller/WebController;)I
    .locals 0

    .line 97
    iget p0, p0, Lcom/ironsource/sdk/controller/WebController;->mHiddenForceCloseHeight:I

    return p0
.end method

.method static synthetic access$802(Lcom/ironsource/sdk/controller/WebController;I)I
    .locals 0

    .line 97
    iput p1, p0, Lcom/ironsource/sdk/controller/WebController;->mHiddenForceCloseHeight:I

    return p1
.end method

.method static synthetic access$900(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/ironsource/sdk/controller/WebController;->mHiddenForceCloseLocation:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$902(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 97
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mHiddenForceCloseLocation:Ljava/lang/String;

    return-object p1
.end method

.method private addGooglePlayInstalledData(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "gpi"

    .line 3466
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3467
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/ironsource/sdk/service/PackagesInstallationService;->isGooglePlayInstalled(Landroid/content/Context;)Z

    move-result v1

    .line 3465
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    return-void
.end method

.method private closeWebView()V
    .locals 1

    .line 3122
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mChangeListener:Lcom/ironsource/sdk/listeners/OnWebViewChangeListener;

    if-eqz v0, :cond_0

    .line 3123
    invoke-interface {v0}, Lcom/ironsource/sdk/listeners/OnWebViewChangeListener;->onCloseRequested()V

    :cond_0
    return-void
.end method

.method private createConnectivityAdapter(Landroid/content/Context;)Lcom/ironsource/sdk/service/ConnectivityAdapter;
    .locals 2

    .line 236
    new-instance v0, Lcom/ironsource/sdk/controller/WebController$1;

    invoke-static {}, Lcom/ironsource/sdk/utils/SDKUtils;->getControllerConfigAsJSONObject()Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, p0, v1, p1}, Lcom/ironsource/sdk/controller/WebController$1;-><init>(Lcom/ironsource/sdk/controller/WebController;Lorg/json/JSONObject;Landroid/content/Context;)V

    return-object v0
.end method

.method private createInitProductJSMethod(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/controller/WebController$Result;
    .locals 12

    .line 2787
    new-instance v0, Lcom/ironsource/sdk/controller/WebController$Result;

    invoke-direct {v0}, Lcom/ironsource/sdk/controller/WebController$Result;-><init>()V

    .line 2790
    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-eq p1, v1, :cond_1

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-eq p1, v1, :cond_1

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-eq p1, v1, :cond_1

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v1, :cond_0

    goto :goto_0

    .line 2816
    :cond_0
    sget-object p2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWallCredits:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, p2, :cond_5

    .line 2817
    iget-object v5, p0, Lcom/ironsource/sdk/controller/WebController;->mApplicationKey:Ljava/lang/String;

    iget-object v7, p0, Lcom/ironsource/sdk/controller/WebController;->mUserId:Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-string v2, "productType"

    const-string v3, "OfferWall"

    const-string v4, "applicationKey"

    const-string v6, "applicationUserId"

    move-object v1, p0

    invoke-direct/range {v1 .. v11}, Lcom/ironsource/sdk/controller/WebController;->parseToJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    const-string p2, "getUserCredits"

    const-string v1, "null"

    const-string v2, "onGetUserCreditsFail"

    .line 2821
    invoke-direct {p0, p2, p1, v1, v2}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2822
    iput-object p2, v0, Lcom/ironsource/sdk/controller/WebController$Result;->methodName:Ljava/lang/String;

    .line 2823
    iput-object p1, v0, Lcom/ironsource/sdk/controller/WebController$Result;->script:Ljava/lang/String;

    goto :goto_1

    .line 2791
    :cond_1
    :goto_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 2792
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController;->mApplicationKey:Ljava/lang/String;

    const-string v3, "applicationKey"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2793
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController;->mUserId:Ljava/lang/String;

    const-string v3, "applicationUserId"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_3

    .line 2796
    invoke-virtual {p2}, Lcom/ironsource/sdk/data/DemandSource;->getExtraParams()Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 2797
    invoke-virtual {p2}, Lcom/ironsource/sdk/data/DemandSource;->getExtraParams()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 2799
    :cond_2
    invoke-virtual {p2}, Lcom/ironsource/sdk/data/DemandSource;->getDemandSourceName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "demandSourceName"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2800
    invoke-virtual {p2}, Lcom/ironsource/sdk/data/DemandSource;->getId()Ljava/lang/String;

    move-result-object p2

    const-string v2, "demandSourceId"

    invoke-interface {v1, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2803
    :cond_3
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->getExtraParamsByProduct(Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Ljava/util/Map;

    move-result-object p2

    if-eqz p2, :cond_4

    .line 2805
    invoke-interface {v1, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 2808
    :cond_4
    invoke-static {v1}, Lcom/ironsource/sdk/utils/SDKUtils;->flatMapToJsonAsString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p2

    .line 2810
    invoke-static {p1}, Lcom/ironsource/sdk/constants/Constants$JSMethods;->getInitMethodByProduct(Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Lcom/ironsource/sdk/constants/Constants$JSMethods;

    move-result-object p1

    .line 2811
    iget-object v1, p1, Lcom/ironsource/sdk/constants/Constants$JSMethods;->methodName:Ljava/lang/String;

    iget-object v2, p1, Lcom/ironsource/sdk/constants/Constants$JSMethods;->successCallbackName:Ljava/lang/String;

    iget-object v3, p1, Lcom/ironsource/sdk/constants/Constants$JSMethods;->failureCallbackName:Ljava/lang/String;

    invoke-direct {p0, v1, p2, v2, v3}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 2813
    iget-object p1, p1, Lcom/ironsource/sdk/constants/Constants$JSMethods;->methodName:Ljava/lang/String;

    iput-object p1, v0, Lcom/ironsource/sdk/controller/WebController$Result;->methodName:Ljava/lang/String;

    .line 2814
    iput-object p2, v0, Lcom/ironsource/sdk/controller/WebController$Result;->script:Ljava/lang/String;

    :cond_5
    :goto_1
    return-object v0
.end method

.method private createSecuredCommunication()V
    .locals 3

    .line 267
    invoke-static {}, Lcom/ironsource/sdk/controller/SecureMessagingService;->generateToken()Ljava/lang/String;

    move-result-object v0

    .line 268
    new-instance v1, Lcom/ironsource/sdk/controller/SecureMessagingService;

    invoke-direct {v1, v0}, Lcom/ironsource/sdk/controller/SecureMessagingService;-><init>(Ljava/lang/String;)V

    .line 271
    invoke-virtual {p0, v1}, Lcom/ironsource/sdk/controller/WebController;->createControllerMessageHandler(Lcom/ironsource/sdk/controller/SecureMessagingService;)Lcom/ironsource/sdk/controller/ControllerMessageHandler;

    move-result-object v0

    const-string v2, "Android"

    .line 270
    invoke-virtual {p0, v0, v2}, Lcom/ironsource/sdk/controller/WebController;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 276
    invoke-virtual {p0, v1}, Lcom/ironsource/sdk/controller/WebController;->createSecureMessagingInterface(Lcom/ironsource/sdk/controller/SecureMessagingService;)Lcom/ironsource/sdk/controller/SecureMessagingInterface;

    move-result-object v0

    const-string v1, "GenerateTokenForMessaging"

    .line 275
    invoke-virtual {p0, v0, v1}, Lcom/ironsource/sdk/controller/WebController;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method private createShowProductJSMethod(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 5

    .line 2831
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "sessionDepth"

    .line 2832
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 2833
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "demandSourceName"

    .line 2835
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2836
    invoke-static {p2}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p2

    .line 2838
    iget-object v3, p0, Lcom/ironsource/sdk/controller/WebController;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    invoke-virtual {v3, p1, p2}, Lcom/ironsource/sdk/controller/DemandSourceManager;->getDemandSourceById(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 2841
    invoke-virtual {v3}, Lcom/ironsource/sdk/data/DemandSource;->getExtraParams()Ljava/util/Map;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 2842
    invoke-virtual {v3}, Lcom/ironsource/sdk/data/DemandSource;->getExtraParams()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 2845
    :cond_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 2846
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2848
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "demandSourceId"

    .line 2849
    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2853
    :cond_2
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->getExtraParamsByProduct(Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Ljava/util/Map;

    move-result-object p2

    if-eqz p2, :cond_3

    .line 2855
    invoke-interface {v0, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 2858
    :cond_3
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->flatMapToJsonAsString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p2

    .line 2859
    invoke-static {p1}, Lcom/ironsource/sdk/constants/Constants$JSMethods;->getShowMethodByProduct(Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Lcom/ironsource/sdk/constants/Constants$JSMethods;

    move-result-object p1

    .line 2860
    iget-object v0, p1, Lcom/ironsource/sdk/constants/Constants$JSMethods;->methodName:Ljava/lang/String;

    iget-object v1, p1, Lcom/ironsource/sdk/constants/Constants$JSMethods;->successCallbackName:Ljava/lang/String;

    iget-object p1, p1, Lcom/ironsource/sdk/constants/Constants$JSMethods;->failureCallbackName:Ljava/lang/String;

    invoke-direct {p0, v0, p2, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private evaluateJavascriptKitKat(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 3040
    invoke-virtual {p0, p1, v0}, Lcom/ironsource/sdk/controller/WebController;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method private extractFailFunctionToCall(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 3190
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 3191
    sget-object p1, Lcom/ironsource/sdk/controller/WebController;->JSON_KEY_FAIL:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private extractSuccessFunctionToCall(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 3182
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 3183
    sget-object p1, Lcom/ironsource/sdk/controller/WebController;->JSON_KEY_SUCCESS:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private generateJSToInject(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 3813
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SSA_CORE.SDKController.runFunction(\'"

    .line 3814
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\');"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3815
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private generateJSToInject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 3819
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SSA_CORE.SDKController.runFunction(\'"

    .line 3821
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "?parameters="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\');"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3822
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private generateJSToInject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 3827
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SSA_CORE.SDKController.runFunction(\'"

    .line 3829
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\',\'"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3830
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\');"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3831
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private generateJSToInject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 3836
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SSA_CORE.SDKController.runFunction(\'"

    .line 3838
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3839
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "?parameters="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\',\'"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3840
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\');"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3841
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getAdProductListenerByProductType(Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Lcom/ironsource/sdk/listeners/internals/DSAdProductListener;
    .locals 1

    .line 2425
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v0, :cond_0

    .line 2426
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mDSInterstitialListener:Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;

    return-object p1

    .line 2427
    :cond_0
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v0, :cond_1

    .line 2428
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mDSRewardedVideoListener:Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;

    return-object p1

    .line 2429
    :cond_1
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v0, :cond_2

    .line 2430
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mDSBannerListener:Lcom/ironsource/sdk/listeners/internals/DSBannerListener;

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method private getApplicationParams(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/Object;
    .locals 6

    .line 3475
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 3481
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v1, :cond_3

    .line 3483
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->getStringProductTypeAsEnum(Ljava/lang/String;)Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    move-result-object v1

    .line 3484
    sget-object v5, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne v1, v5, :cond_0

    .line 3485
    iget-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mOWExtraParameters:Ljava/util/Map;

    move-object v4, p2

    goto :goto_0

    .line 3487
    :cond_0
    iget-object v5, p0, Lcom/ironsource/sdk/controller/WebController;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    invoke-virtual {v5, v1, p2}, Lcom/ironsource/sdk/controller/DemandSourceManager;->getDemandSourceById(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 3489
    invoke-virtual {p2}, Lcom/ironsource/sdk/data/DemandSource;->getExtraParams()Ljava/util/Map;

    move-result-object v1

    .line 3490
    invoke-virtual {p2}, Lcom/ironsource/sdk/data/DemandSource;->getDemandSourceName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "demandSourceName"

    invoke-interface {v1, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3491
    invoke-virtual {p2}, Lcom/ironsource/sdk/data/DemandSource;->getId()Ljava/lang/String;

    move-result-object p2

    const-string v4, "demandSourceId"

    invoke-interface {v1, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v4, v1

    :cond_1
    :goto_0
    :try_start_0
    const-string p2, "productType"

    .line 3496
    invoke-virtual {v0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 3498
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 3502
    :goto_1
    :try_start_1
    invoke-static {}, Lcom/ironsource/sdk/utils/SDKUtils;->getInitSDKParams()Ljava/util/Map;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 3504
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 3505
    invoke-static {v0, p2}, Lcom/ironsource/sdk/utils/SDKUtils;->mergeJSONObjects(Lorg/json/JSONObject;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception p1

    .line 3508
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    :goto_2
    const/4 p1, 0x0

    goto :goto_3

    :cond_3
    const/4 p1, 0x1

    .line 3516
    :goto_3
    iget-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mUserId:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_4

    :try_start_2
    const-string p2, "applicationUserId"

    .line 3519
    invoke-static {p2}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->mUserId:Ljava/lang/String;

    .line 3520
    invoke-static {v1}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 3518
    invoke-virtual {v0, p2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_4

    :catch_2
    move-exception p2

    .line 3523
    invoke-virtual {p2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_4

    :cond_4
    const/4 p1, 0x1

    .line 3530
    :goto_4
    iget-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mApplicationKey:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_5

    :try_start_3
    const-string p2, "applicationKey"

    .line 3533
    invoke-static {p2}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->mApplicationKey:Ljava/lang/String;

    .line 3534
    invoke-static {v1}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 3532
    invoke-virtual {v0, p2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_5

    :catch_3
    move-exception p2

    .line 3536
    invoke-virtual {p2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_5

    :cond_5
    const/4 p1, 0x1

    :goto_5
    if-eqz v4, :cond_7

    .line 3543
    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_7

    .line 3545
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_6
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 3547
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "sdkWebViewCache"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 3548
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/ironsource/sdk/controller/WebController;->setWebviewCache(Ljava/lang/String;)V

    .line 3552
    :cond_6
    :try_start_4
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_6

    :catch_4
    move-exception v1

    .line 3554
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_6

    :cond_7
    const/4 p2, 0x2

    new-array p2, p2, [Ljava/lang/Object;

    .line 3561
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p2, v2

    .line 3562
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, p2, v3

    return-object p2
.end method

.method private getDeviceParams(Landroid/content/Context;)[Ljava/lang/Object;
    .locals 11

    .line 3254
    invoke-static {p1}, Lcom/ironsource/sdk/utils/DeviceProperties;->getInstance(Landroid/content/Context;)Lcom/ironsource/sdk/utils/DeviceProperties;

    move-result-object v0

    .line 3256
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x1

    :try_start_0
    const-string v4, "appOrientation"

    .line 3261
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getCurrentActivityContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/ironsource/environment/DeviceStatus;->getActivityRequestedOrientation(Landroid/content/Context;)I

    move-result v5

    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->translateRequestedOrientation(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3264
    invoke-virtual {v0}, Lcom/ironsource/sdk/utils/DeviceProperties;->getDeviceOem()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    const-string v5, "deviceOEM"

    .line 3266
    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3270
    :cond_0
    invoke-virtual {v0}, Lcom/ironsource/sdk/utils/DeviceProperties;->getDeviceModel()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    const-string v5, "deviceModel"

    .line 3272
    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v4, 0x0

    goto :goto_0

    :cond_1
    const/4 v4, 0x1

    .line 3278
    :goto_0
    :try_start_1
    invoke-static {p1}, Lcom/ironsource/sdk/utils/SDKUtils;->loadGoogleAdvertiserInfo(Landroid/content/Context;)V

    .line 3279
    invoke-static {}, Lcom/ironsource/sdk/utils/SDKUtils;->getAdvertiserId()Ljava/lang/String;

    move-result-object v5

    .line 3280
    invoke-static {}, Lcom/ironsource/sdk/utils/SDKUtils;->isLimitAdTrackingEnabled()Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    .line 3282
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    const-string v8, "]"

    const-string v9, "["

    if-nez v7, :cond_2

    .line 3284
    :try_start_2
    iget-object v7, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    const-string v10, "add AID and LAT"

    invoke-static {v7, v10}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "isLimitAdTrackingEnabled"

    .line 3287
    invoke-virtual {v1, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3290
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "deviceIds"

    .line 3291
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3292
    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "AID"

    .line 3293
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3294
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3296
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3300
    :cond_2
    invoke-virtual {v0}, Lcom/ironsource/sdk/utils/DeviceProperties;->getDeviceOsType()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    const-string v6, "deviceOs"

    .line 3302
    invoke-static {v6}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    :cond_3
    const/4 v4, 0x1

    .line 3308
    :goto_1
    invoke-virtual {v0}, Lcom/ironsource/sdk/utils/DeviceProperties;->getDeviceOsVersion()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_4

    const-string v6, "[^0-9/.]"

    const-string v7, ""

    .line 3310
    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "deviceOSVersion"

    .line 3311
    invoke-static {v6}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_2

    :cond_4
    const/4 v4, 0x1

    .line 3316
    :goto_2
    invoke-virtual {v0}, Lcom/ironsource/sdk/utils/DeviceProperties;->getDeviceOsVersion()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_5

    const-string v6, "deviceOSVersionFull"

    .line 3318
    invoke-static {v6}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3322
    :cond_5
    invoke-virtual {v0}, Lcom/ironsource/sdk/utils/DeviceProperties;->getDeviceApiLevel()I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_6

    const-string v6, "deviceApiLevel"

    .line 3324
    invoke-static {v6}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3

    :cond_6
    const/4 v4, 0x1

    .line 3330
    :goto_3
    invoke-static {}, Lcom/ironsource/sdk/utils/DeviceProperties;->getSupersonicSdkVersion()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_7

    const-string v6, "SDKVersion"

    .line 3332
    invoke-static {v6}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3336
    :cond_7
    invoke-virtual {v0}, Lcom/ironsource/sdk/utils/DeviceProperties;->getDeviceCarrier()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_8

    invoke-virtual {v0}, Lcom/ironsource/sdk/utils/DeviceProperties;->getDeviceCarrier()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_8

    const-string v5, "mobileCarrier"

    .line 3337
    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lcom/ironsource/sdk/utils/DeviceProperties;->getDeviceCarrier()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3341
    :cond_8
    invoke-static {p1}, Lcom/ironsource/network/ConnectivityUtils;->getConnectionType(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string v5, "none"

    .line 3342
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_9

    const-string v5, "connectionType"

    .line 3343
    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_4

    :cond_9
    const/4 v4, 0x1

    .line 3349
    :goto_4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x17

    if-lt v0, v5, :cond_a

    const-string v0, "hasVPN"

    .line 3351
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/ironsource/network/ConnectivityUtils;->hasVPN(Landroid/content/Context;)Z

    move-result v5

    invoke-virtual {v1, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 3355
    :cond_a
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 3356
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_b

    const-string v5, "deviceLanguage"

    .line 3357
    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3361
    :cond_b
    invoke-static {}, Lcom/ironsource/sdk/utils/SDKUtils;->isExternalStorageAvailable()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 3362
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mCacheDirectory:Ljava/lang/String;

    invoke-static {v0}, Lcom/ironsource/environment/DeviceStatus;->getAvailableMemorySizeInMegaBytes(Ljava/lang/String;)J

    move-result-wide v5

    const-string v0, "diskFreeSize"

    .line 3364
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3365
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 3363
    invoke-virtual {v1, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_5

    :cond_c
    const/4 v4, 0x1

    .line 3371
    :goto_5
    invoke-static {}, Lcom/ironsource/environment/DeviceStatus;->getDeviceWidth()I

    move-result v0

    .line 3372
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 3373
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    const-string v6, "deviceScreenSize"

    if-nez v5, :cond_d

    .line 3375
    :try_start_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 3376
    invoke-static {v6}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3377
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "width"

    .line 3378
    invoke-static {v7}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3379
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3381
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 3382
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3381
    invoke-virtual {v1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_6

    :cond_d
    const/4 v4, 0x1

    .line 3388
    :goto_6
    invoke-static {}, Lcom/ironsource/environment/DeviceStatus;->getDeviceHeight()I

    move-result v0

    .line 3389
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 3391
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 3392
    invoke-static {v6}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3393
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "height"

    .line 3394
    invoke-static {v6}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3395
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3397
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 3398
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3397
    invoke-virtual {v1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3400
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/ironsource/environment/ApplicationContext;->getPackageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 3401
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_e

    const-string v5, "bundleId"

    .line 3402
    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3405
    :cond_e
    invoke-static {}, Lcom/ironsource/environment/DeviceStatus;->getDeviceDensity()F

    move-result v0

    .line 3406
    invoke-static {v0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    .line 3407
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_f

    const-string v5, "deviceScreenScale"

    .line 3408
    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3411
    :cond_f
    invoke-static {}, Lcom/ironsource/environment/DeviceStatus;->isRootedDevice()Z

    move-result v0

    .line 3412
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    .line 3413
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_10

    const-string v5, "unLocked"

    .line 3414
    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3417
    :cond_10
    invoke-static {p1}, Lcom/ironsource/sdk/utils/DeviceProperties;->getInstance(Landroid/content/Context;)Lcom/ironsource/sdk/utils/DeviceProperties;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/utils/DeviceProperties;->getDeviceVolume(Landroid/content/Context;)F

    move-result p1

    const-string v0, "deviceVolume"

    .line 3418
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    float-to-double v5, p1

    invoke-virtual {v1, v0, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 3419
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getCurrentActivityContext()Landroid/content/Context;

    move-result-object p1

    .line 3420
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x13

    if-lt v0, v5, :cond_11

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_11

    const-string v0, "immersiveMode"

    .line 3421
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v5, p1

    check-cast v5, Landroid/app/Activity;

    .line 3422
    invoke-static {v5}, Lcom/ironsource/environment/DeviceStatus;->isImmersiveSupported(Landroid/app/Activity;)Z

    move-result v5

    .line 3421
    invoke-virtual {v1, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    :cond_11
    const-string v0, "batteryLevel"

    .line 3425
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/ironsource/environment/DeviceStatus;->getBatteryLevel(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v1, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "mcc"

    .line 3427
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3428
    invoke-static {p1}, Lcom/ironsource/network/ConnectivityService;->getNetworkMCC(Landroid/content/Context;)I

    move-result v5

    .line 3427
    invoke-virtual {v1, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "mnc"

    .line 3429
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3430
    invoke-static {p1}, Lcom/ironsource/network/ConnectivityService;->getNetworkMNC(Landroid/content/Context;)I

    move-result v5

    .line 3429
    invoke-virtual {v1, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "phoneType"

    .line 3432
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3433
    invoke-static {p1}, Lcom/ironsource/network/ConnectivityService;->getPhoneType(Landroid/content/Context;)I

    move-result v5

    .line 3432
    invoke-virtual {v1, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "simOperator"

    .line 3434
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3435
    invoke-static {p1}, Lcom/ironsource/network/ConnectivityService;->getSimOperator(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 3434
    invoke-virtual {v1, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "lastUpdateTime"

    .line 3437
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3438
    invoke-static {p1}, Lcom/ironsource/environment/ApplicationContext;->getLastUpdateTime(Landroid/content/Context;)J

    move-result-wide v5

    .line 3437
    invoke-virtual {v1, v0, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v0, "firstInstallTime"

    .line 3439
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3440
    invoke-static {p1}, Lcom/ironsource/environment/ApplicationContext;->getFirstInstallTime(Landroid/content/Context;)J

    move-result-wide v5

    .line 3439
    invoke-virtual {v1, v0, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v0, "appVersion"

    .line 3441
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3442
    invoke-static {p1}, Lcom/ironsource/environment/ApplicationContext;->getApplicationVersionName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 3441
    invoke-virtual {v1, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3444
    invoke-static {p1}, Lcom/ironsource/environment/ApplicationContext;->getInstallerPackageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    .line 3445
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "installerPackageName"

    .line 3446
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3447
    invoke-static {p1}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 3446
    invoke-virtual {v1, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3449
    :cond_12
    invoke-direct {p0, v1}, Lcom/ironsource/sdk/controller/WebController;->addGooglePlayInstalledData(Lorg/json/JSONObject;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_8

    :catch_0
    move-exception p1

    goto :goto_7

    :catch_1
    move-exception p1

    const/4 v4, 0x0

    .line 3452
    :goto_7
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 3453
    new-instance v0, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;

    invoke-direct {v0}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;-><init>()V

    new-array v5, v3, [Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "https://www.supersonicads.com/mobile/sdk5/log?method="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONException;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object p1

    aget-object p1, p1, v2

    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v5, v2

    invoke-virtual {v0, v5}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :goto_8
    const/4 p1, 0x2

    new-array p1, p1, [Ljava/lang/Object;

    .line 3458
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p1, v2

    .line 3459
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, p1, v3

    return-object p1
.end method

.method private getErrorCodeByProductType(Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Ljava/lang/String;
    .locals 1

    .line 3773
    sget-object v0, Lcom/ironsource/sdk/controller/WebController$12;->$SwitchMap$com$ironsource$sdk$data$SSAEnums$ProductType:[I

    invoke-virtual {p1}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_4

    const/4 v0, 0x2

    if-eq p1, v0, :cond_3

    const/4 v0, 0x3

    if-eq p1, v0, :cond_2

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    const-string p1, ""

    goto :goto_0

    :cond_0
    const-string p1, "Init BN"

    goto :goto_0

    :cond_1
    const-string p1, "Show OW Credits"

    goto :goto_0

    :cond_2
    const-string p1, "Init OW"

    goto :goto_0

    :cond_3
    const-string p1, "Init IS"

    goto :goto_0

    :cond_4
    const-string p1, "Init RV"

    :goto_0
    return-object p1
.end method

.method private getExtraParamsByProduct(Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ironsource/sdk/data/SSAEnums$ProductType;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 191
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v0, :cond_0

    .line 192
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mOWExtraParameters:Ljava/util/Map;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private getRequestParameters(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 8

    .line 3051
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/ironsource/sdk/utils/DeviceProperties;->getInstance(Landroid/content/Context;)Lcom/ironsource/sdk/utils/DeviceProperties;

    move-result-object v0

    .line 3053
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3055
    invoke-static {}, Lcom/ironsource/sdk/utils/DeviceProperties;->getSupersonicSdkVersion()Ljava/lang/String;

    move-result-object v2

    .line 3056
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    const-string v4, "&"

    const-string v5, "="

    if-nez v3, :cond_0

    const-string v3, "SDKVersion"

    .line 3057
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3058
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3059
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3060
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3063
    :cond_0
    invoke-virtual {v0}, Lcom/ironsource/sdk/utils/DeviceProperties;->getDeviceOsType()Ljava/lang/String;

    move-result-object v0

    .line 3064
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "deviceOs"

    .line 3065
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3066
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3067
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3070
    :cond_1
    invoke-static {}, Lcom/ironsource/sdk/utils/SDKUtils;->getControllerUrl()Ljava/lang/String;

    move-result-object v0

    .line 3071
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 3074
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3075
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    .line 3076
    invoke-virtual {v0}, Landroid/net/Uri;->getPort()I

    move-result v0

    const/4 v7, -0x1

    if-eq v0, v7, :cond_2

    .line 3078
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 3081
    :cond_2
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "protocol"

    .line 3082
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3083
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3084
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3086
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "domain"

    .line 3087
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3088
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3089
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3091
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 3094
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    const-string v2, "isSecured"

    const-string v3, "applicationKey"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p1, v2}, Lorg/json/JSONObject;-><init>(Lorg/json/JSONObject;[Ljava/lang/String;)V

    .line 3099
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    .line 3100
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 3101
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "controllerConfig"

    .line 3102
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3103
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3104
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 3108
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 3112
    :cond_3
    :goto_0
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "debug"

    .line 3113
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3114
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3115
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getDebugMode()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 3118
    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getStringProductTypeAsEnum(Ljava/lang/String;)Lcom/ironsource/sdk/data/SSAEnums$ProductType;
    .locals 2

    .line 2437
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 2441
    :cond_0
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2442
    sget-object p1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    return-object p1

    .line 2443
    :cond_1
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2444
    sget-object p1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    return-object p1

    .line 2445
    :cond_2
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2446
    sget-object p1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    return-object p1

    .line 2447
    :cond_3
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 2448
    sget-object p1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    return-object p1

    :cond_4
    return-object v1
.end method

.method private getWebview()Landroid/webkit/WebView;
    .locals 0

    return-object p0
.end method

.method private handleLoadAd(Lcom/ironsource/sdk/data/DemandSource;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ironsource/sdk/data/DemandSource;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/util/Map;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    .line 2649
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/DemandSource;->convertToMap()Ljava/util/Map;

    move-result-object p2

    const/4 v1, 0x1

    aput-object p2, v0, v1

    .line 2647
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->mergeHashMaps([Ljava/util/Map;)Ljava/util/Map;

    move-result-object p2

    .line 2655
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mSavedState:Lcom/ironsource/sdk/data/AdUnitsState;

    invoke-virtual {p1}, Lcom/ironsource/sdk/data/DemandSource;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, v1}, Lcom/ironsource/sdk/data/AdUnitsState;->setReportLoadInterstitial(Ljava/lang/String;Z)V

    .line 2657
    invoke-static {p2}, Lcom/ironsource/sdk/utils/SDKUtils;->flatMapToJsonAsString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "loadInterstitial"

    const-string v0, "onLoadInterstitialSuccess"

    const-string v1, "onLoadInterstitialFail"

    .line 2658
    invoke-direct {p0, p2, p1, v0, v1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2659
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method private initLayout(Landroid/content/Context;)V
    .locals 4

    .line 439
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 444
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/ironsource/sdk/controller/WebController;->mControllerLayout:Landroid/widget/FrameLayout;

    .line 448
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/ironsource/sdk/controller/WebController;->mCustomViewContainer:Landroid/widget/FrameLayout;

    .line 449
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 450
    iget-object v3, p0, Lcom/ironsource/sdk/controller/WebController;->mCustomViewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v2}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 451
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController;->mCustomViewContainer:Landroid/widget/FrameLayout;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 454
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 455
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p1, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 456
    invoke-virtual {v2, p1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 457
    invoke-virtual {v2, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 459
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mControllerLayout:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->mCustomViewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 460
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mControllerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method private initProduct(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/controller/WebController$OnInitProductHandler;)V
    .locals 0

    .line 2569
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 2574
    :cond_0
    invoke-direct {p0, p3, p4}, Lcom/ironsource/sdk/controller/WebController;->createInitProductJSMethod(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;)Lcom/ironsource/sdk/controller/WebController$Result;

    move-result-object p1

    .line 2576
    iget-object p1, p1, Lcom/ironsource/sdk/controller/WebController$Result;->script:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void

    :cond_1
    :goto_0
    const-string p1, "User id or Application key are missing"

    .line 2570
    invoke-interface {p5, p1, p3, p4}, Lcom/ironsource/sdk/controller/WebController$OnInitProductHandler;->handleInitProductFailed(Ljava/lang/String;Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;)V

    return-void
.end method

.method private injectJavascript(Ljava/lang/String;)V
    .locals 3

    .line 2967
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 2973
    :cond_0
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getDebugMode()I

    move-result v0

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$DebugMode;->MODE_0:Lcom/ironsource/sdk/data/SSAEnums$DebugMode;

    invoke-virtual {v1}, Lcom/ironsource/sdk/data/SSAEnums$DebugMode;->getValue()I

    move-result v1

    const-string v2, "console.log(\"JS exeption: \" + JSON.stringify(e));"

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 2977
    :cond_1
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getDebugMode()I

    move-result v0

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$DebugMode;->MODE_1:Lcom/ironsource/sdk/data/SSAEnums$DebugMode;

    invoke-virtual {v1}, Lcom/ironsource/sdk/data/SSAEnums$DebugMode;->getValue()I

    move-result v1

    if-lt v0, v1, :cond_2

    .line 2978
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getDebugMode()I

    move-result v0

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$DebugMode;->MODE_3:Lcom/ironsource/sdk/data/SSAEnums$DebugMode;

    invoke-virtual {v1}, Lcom/ironsource/sdk/data/SSAEnums$DebugMode;->getValue()I

    move-result v1

    if-gt v0, v1, :cond_2

    goto :goto_0

    :cond_2
    const-string v2, "empty"

    .line 2988
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "try{"

    .line 2990
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2991
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "}catch(e){"

    .line 2992
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2993
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "}"

    .line 2994
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2996
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 2998
    new-instance v1, Lcom/ironsource/sdk/controller/WebController$10;

    invoke-direct {v1, p0, p1, v0}, Lcom/ironsource/sdk/controller/WebController$10;-><init>(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/StringBuilder;)V

    invoke-virtual {p0, v1}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private mapToJson(Ljava/util/Map;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 3233
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    if-eqz p1, :cond_0

    .line 3235
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 3237
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 3238
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 3240
    :try_start_0
    invoke-static {v3}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    .line 3242
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 3247
    :cond_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseToJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2

    .line 3199
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 3203
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 3204
    invoke-static {p2}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3207
    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 3208
    invoke-static {p4}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3211
    :cond_1
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 3212
    invoke-static {p6}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p5, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3215
    :cond_2
    invoke-static {p7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3

    invoke-static {p8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 3216
    invoke-static {p8}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p7, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3219
    :cond_3
    invoke-static {p9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 3220
    invoke-virtual {v0, p9, p10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 3224
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 3225
    new-instance p2, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;

    invoke-direct {p2}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;-><init>()V

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/String;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "https://www.supersonicads.com/mobile/sdk5/log?method="

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONException;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object p1

    const/4 p5, 0x0

    aget-object p1, p1, p5

    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, p3, p5

    invoke-virtual {p2, p3}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 3228
    :cond_4
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private responseBack(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 3139
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 3140
    sget-object v1, Lcom/ironsource/sdk/controller/WebController;->JSON_KEY_SUCCESS:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 3141
    sget-object v2, Lcom/ironsource/sdk/controller/WebController;->JSON_KEY_FAIL:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz p2, :cond_0

    .line 3147
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1

    goto :goto_0

    .line 3151
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1

    move-object v1, v0

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 3157
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_4

    .line 3159
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_2

    .line 3161
    :try_start_0
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "errMsg"

    .line 3162
    invoke-virtual {p2, v0, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    nop

    .line 3167
    :cond_2
    :goto_1
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_3

    .line 3169
    :try_start_1
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p3, "errCode"

    .line 3170
    invoke-virtual {p2, p3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 3175
    :catch_1
    :cond_3
    invoke-direct {p0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 3176
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    :cond_4
    return-void
.end method

.method private sendProductErrorMessage(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;)V
    .locals 2

    .line 3767
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->getErrorCodeByProductType(Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Initiating Controller"

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/SDKUtils;->createErrorMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3766
    invoke-direct {p0, v0, p1, p2}, Lcom/ironsource/sdk/controller/WebController;->triggerOnControllerInitProductFail(Ljava/lang/String;Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;)V

    return-void
.end method

.method private setDisplayZoomControls(Landroid/webkit/WebSettings;)V
    .locals 2

    .line 500
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-le v0, v1, :cond_0

    const/4 v0, 0x0

    .line 502
    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    :cond_0
    return-void
.end method

.method private setMediaPlaybackJellyBean(Landroid/webkit/WebSettings;)V
    .locals 2

    .line 513
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    const/4 v0, 0x0

    .line 514
    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    :cond_0
    return-void
.end method

.method private setWebDebuggingEnabled()V
    .locals 2

    .line 520
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    .line 521
    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->setWebContentsDebuggingEnabled(Z)V

    :cond_0
    return-void
.end method

.method private setWebDebuggingEnabled(Lorg/json/JSONObject;)V
    .locals 1

    const-string v0, "inspectWebview"

    .line 2553
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 2554
    invoke-direct {p0}, Lcom/ironsource/sdk/controller/WebController;->setWebDebuggingEnabled()V

    :cond_0
    return-void
.end method

.method private setWebViewSettings()V
    .locals 4

    .line 464
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    .line 466
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 467
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    const/4 v2, 0x0

    .line 468
    invoke-virtual {p0, v2}, Lcom/ironsource/sdk/controller/WebController;->setVerticalScrollBarEnabled(Z)V

    .line 469
    invoke-virtual {p0, v2}, Lcom/ironsource/sdk/controller/WebController;->setHorizontalScrollBarEnabled(Z)V

    .line 473
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 476
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 478
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 480
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    .line 481
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 484
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setGeolocationEnabled(Z)V

    const-string v2, "/data/data/org.itri.html5webview/databases/"

    .line 485
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setGeolocationDatabasePath(Ljava/lang/String;)V

    .line 488
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 492
    :try_start_0
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/controller/WebController;->setDisplayZoomControls(Landroid/webkit/WebSettings;)V

    .line 493
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/controller/WebController;->setMediaPlaybackJellyBean(Landroid/webkit/WebSettings;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 495
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setWebSettings - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/ironsource/sdk/utils/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private setWebviewBackground(Ljava/lang/String;)V
    .locals 1

    .line 2464
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string p1, "color"

    .line 2465
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "transparent"

    .line 2469
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2470
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 2473
    :goto_0
    invoke-virtual {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->setBackgroundColor(I)V

    return-void
.end method

.method private setWebviewCache(Ljava/lang/String;)V
    .locals 1

    const-string v0, "0"

    .line 3729
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 3731
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getSettings()Landroid/webkit/WebSettings;

    move-result-object p1

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    goto :goto_0

    .line 3734
    :cond_0
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getSettings()Landroid/webkit/WebSettings;

    move-result-object p1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    :goto_0
    return-void
.end method

.method private shouldNotifyDeveloper(Ljava/lang/String;)Z
    .locals 4

    .line 556
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 557
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    const-string v0, "Trying to trigger a listener - no product was found"

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 561
    :cond_0
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 562
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mDSInterstitialListener:Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;

    if-eqz v0, :cond_5

    :goto_0
    const/4 v1, 0x1

    goto :goto_1

    .line 563
    :cond_1
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 564
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mDSRewardedVideoListener:Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;

    if-eqz v0, :cond_5

    goto :goto_0

    .line 565
    :cond_2
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 566
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mDSBannerListener:Lcom/ironsource/sdk/listeners/internals/DSBannerListener;

    if-eqz v0, :cond_5

    goto :goto_0

    .line 567
    :cond_3
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWallCredits:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    .line 568
    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 569
    :cond_4
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mOnOfferWallListener:Lcom/ironsource/sdk/listeners/OnOfferWallListener;

    if-eqz v0, :cond_5

    goto :goto_0

    :cond_5
    :goto_1
    if-nez v1, :cond_6

    .line 572
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Trying to trigger a listener - no listener was found for product "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ironsource/sdk/utils/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    return v1
.end method

.method private toastingErrMsg(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 3603
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p2}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string p2, "errMsg"

    .line 3604
    invoke-virtual {v0, p2}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 3606
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3607
    new-instance v0, Lcom/ironsource/sdk/controller/WebController$11;

    invoke-direct {v0, p0, p1, p2}, Lcom/ironsource/sdk/controller/WebController$11;-><init>(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method private triggerOnControllerInitProductFail(Ljava/lang/String;Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;)V
    .locals 1

    .line 2877
    invoke-virtual {p2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ironsource/sdk/controller/WebController;->shouldNotifyDeveloper(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2878
    new-instance v0, Lcom/ironsource/sdk/controller/WebController$9;

    invoke-direct {v0, p0, p2, p3, p1}, Lcom/ironsource/sdk/controller/WebController$9;-><init>(Lcom/ironsource/sdk/controller/WebController;Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public addAdViewsJSInterface(Lcom/ironsource/sdk/controller/AdViewsJSAdapter;)V
    .locals 1

    .line 328
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mAdViewsJsAdapter:Lcom/ironsource/sdk/controller/AdViewsJSAdapter;

    .line 329
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getControllerDelegate()Lcom/ironsource/sdk/controller/WebViewMessagingMediator;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/ironsource/sdk/controller/AdViewsJSAdapter;->setCommunicationWithController(Lcom/ironsource/sdk/controller/WebViewMessagingMediator;)V

    return-void
.end method

.method public addBannerJSInterface(Lcom/ironsource/sdk/controller/BannerJSAdapter;)V
    .locals 1

    .line 315
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mBannerJsAdapter:Lcom/ironsource/sdk/controller/BannerJSAdapter;

    .line 316
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getControllerDelegate()Lcom/ironsource/sdk/controller/WebViewMessagingMediator;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/ironsource/sdk/controller/BannerJSAdapter;->setCommunicationWithController(Lcom/ironsource/sdk/controller/WebViewMessagingMediator;)V

    return-void
.end method

.method public addDeviceDataJSInterface(Lcom/ironsource/sdk/controller/DeviceDataJSAdapter;)V
    .locals 0

    .line 324
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mDeviceDataJsAdapter:Lcom/ironsource/sdk/controller/DeviceDataJSAdapter;

    return-void
.end method

.method public addOmidJSInterface(Lcom/ironsource/sdk/controller/OMIDJSAdapter;)V
    .locals 0

    .line 307
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mOmidJsAdapter:Lcom/ironsource/sdk/controller/OMIDJSAdapter;

    return-void
.end method

.method public addPermissionsJSInterface(Lcom/ironsource/sdk/controller/PermissionsJSAdapter;)V
    .locals 0

    .line 311
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mPermissionsJsAdapter:Lcom/ironsource/sdk/controller/PermissionsJSAdapter;

    return-void
.end method

.method public addTokenJSInterface(Lcom/ironsource/sdk/controller/TokenJSAdapter;)V
    .locals 0

    .line 320
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mTokenJSAdapter:Lcom/ironsource/sdk/controller/TokenJSAdapter;

    return-void
.end method

.method public assetCached(Ljava/lang/String;Ljava/lang/String;)V
    .locals 11

    const-string v1, "file"

    const-string v3, "path"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v4, p2

    .line 2907
    invoke-direct/range {v0 .. v10}, Lcom/ironsource/sdk/controller/WebController;->parseToJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    const-string p2, "assetCached"

    .line 2908
    invoke-direct {p0, p2, p1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2909
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public assetCachedFailed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11

    const-string v1, "file"

    const-string v3, "path"

    const-string v5, "errMsg"

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v4, p2

    move-object v6, p3

    .line 2913
    invoke-direct/range {v0 .. v10}, Lcom/ironsource/sdk/controller/WebController;->parseToJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    const-string p2, "assetCachedFailed"

    .line 2914
    invoke-direct {p0, p2, p1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2915
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method createControllerMessageHandler(Lcom/ironsource/sdk/controller/SecureMessagingService;)Lcom/ironsource/sdk/controller/ControllerMessageHandler;
    .locals 2

    .line 285
    new-instance v0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;

    invoke-direct {v0, p0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI;-><init>(Lcom/ironsource/sdk/controller/WebController;)V

    .line 286
    new-instance v1, Lcom/ironsource/sdk/controller/ControllerAdapter;

    invoke-direct {v1, v0}, Lcom/ironsource/sdk/controller/ControllerAdapter;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;)V

    .line 287
    new-instance v0, Lcom/ironsource/sdk/controller/ControllerMessageHandler;

    invoke-direct {v0, v1, p1}, Lcom/ironsource/sdk/controller/ControllerMessageHandler;-><init>(Lcom/ironsource/sdk/controller/ControllerAdapter;Lcom/ironsource/sdk/controller/SecureMessagingService;)V

    return-object v0
.end method

.method createMainThreadHandler()Landroid/os/Handler;
    .locals 2

    .line 295
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-object v0
.end method

.method createSecureMessagingInterface(Lcom/ironsource/sdk/controller/SecureMessagingService;)Lcom/ironsource/sdk/controller/SecureMessagingInterface;
    .locals 1

    .line 291
    new-instance v0, Lcom/ironsource/sdk/controller/SecureMessagingInterface;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/controller/SecureMessagingInterface;-><init>(Lcom/ironsource/sdk/controller/SecureMessagingService;)V

    return-object v0
.end method

.method public destroy()V
    .locals 1

    .line 3797
    invoke-super {p0}, Landroid/webkit/WebView;->destroy()V

    .line 3799
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->downloadManager:Lcom/ironsource/sdk/precache/DownloadManager;

    if-eqz v0, :cond_0

    .line 3800
    invoke-virtual {v0}, Lcom/ironsource/sdk/precache/DownloadManager;->release()V

    .line 3803
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mConnectivityAdapter:Lcom/ironsource/sdk/service/ConnectivityAdapter;

    if-eqz v0, :cond_1

    .line 3804
    invoke-virtual {v0}, Lcom/ironsource/sdk/service/ConnectivityAdapter;->release()V

    :cond_1
    const/4 v0, 0x0

    .line 3807
    iput-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mUiHandler:Landroid/os/Handler;

    .line 3808
    iput-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mCurrentActivityContext:Landroid/content/Context;

    return-void
.end method

.method public downloadController()V
    .locals 5

    .line 528
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mCacheDirectory:Ljava/lang/String;

    const-string v1, ""

    const-string v2, "mobileController.html"

    invoke-static {v0, v1, v2}, Lcom/ironsource/sdk/utils/IronSourceStorageUtils;->deleteFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 531
    invoke-static {}, Lcom/ironsource/sdk/utils/SDKUtils;->getControllerUrl()Ljava/lang/String;

    move-result-object v0

    .line 532
    new-instance v2, Lcom/ironsource/sdk/data/SSAFile;

    invoke-direct {v2, v0, v1}, Lcom/ironsource/sdk/data/SSAFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 534
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->downloadManager:Lcom/ironsource/sdk/precache/DownloadManager;

    invoke-virtual {v1}, Lcom/ironsource/sdk/precache/DownloadManager;->isMobileControllerThreadLive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 535
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Download Mobile Controller: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 536
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->downloadManager:Lcom/ironsource/sdk/precache/DownloadManager;

    invoke-virtual {v0, v2}, Lcom/ironsource/sdk/precache/DownloadManager;->downloadMobileControllerFile(Lcom/ironsource/sdk/data/SSAFile;)V

    goto :goto_0

    .line 538
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    const-string v1, "Download Mobile Controller: already alive"

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public engageEnd(Ljava/lang/String;)V
    .locals 12

    const-string v0, "forceClose"

    .line 3653
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3654
    invoke-direct {p0}, Lcom/ironsource/sdk/controller/WebController;->closeWebView()V

    :cond_0
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-string v2, "action"

    move-object v1, p0

    move-object v3, p1

    .line 3657
    invoke-direct/range {v1 .. v11}, Lcom/ironsource/sdk/controller/WebController;->parseToJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    const-string v0, "engageEnd"

    .line 3658
    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 3659
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public enterBackground()V
    .locals 1

    const-string v0, "enterBackground"

    .line 2919
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2920
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public enterForeground()V
    .locals 1

    const-string v0, "enterForeground"

    .line 2924
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2925
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public failedToStartStoreActivity(Ljava/lang/String;Ljava/lang/String;)V
    .locals 11

    .line 2957
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p2, "unknown url"

    :cond_0
    move-object v4, p2

    .line 2958
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_1

    const-string p1, "activity failed to open with unspecified reason"

    :cond_1
    move-object v2, p1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const-string v1, "errMsg"

    const-string v3, "url"

    move-object v0, p0

    .line 2959
    invoke-direct/range {v0 .. v10}, Lcom/ironsource/sdk/controller/WebController;->parseToJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    const-string p2, "failedToStartStoreActivity"

    .line 2962
    invoke-direct {p0, p2, p1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public getControllerDelegate()Lcom/ironsource/sdk/controller/WebViewMessagingMediator;
    .locals 1

    .line 344
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mWebViewMessagingMediator:Lcom/ironsource/sdk/controller/WebViewMessagingMediator;

    if-nez v0, :cond_0

    .line 345
    new-instance v0, Lcom/ironsource/sdk/controller/WebController$2;

    invoke-direct {v0, p0}, Lcom/ironsource/sdk/controller/WebController$2;-><init>(Lcom/ironsource/sdk/controller/WebController;)V

    iput-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mWebViewMessagingMediator:Lcom/ironsource/sdk/controller/WebViewMessagingMediator;

    .line 353
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mWebViewMessagingMediator:Lcom/ironsource/sdk/controller/WebViewMessagingMediator;

    return-object v0
.end method

.method public getControllerKeyPressed()Ljava/lang/String;
    .locals 2

    .line 3624
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mControllerKeyPressed:Ljava/lang/String;

    const-string v1, "interrupt"

    .line 3627
    invoke-virtual {p0, v1}, Lcom/ironsource/sdk/controller/WebController;->setControllerKeyPressed(Ljava/lang/String;)V

    return-object v0
.end method

.method public getCurrentActivityContext()Landroid/content/Context;
    .locals 1

    .line 3045
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mCurrentActivityContext:Landroid/content/Context;

    check-cast v0, Landroid/content/MutableContextWrapper;

    .line 3046
    invoke-virtual {v0}, Landroid/content/MutableContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getDebugMode()I
    .locals 1

    .line 547
    sget v0, Lcom/ironsource/sdk/controller/WebController;->mDebugMode:I

    return v0
.end method

.method getDownloadManager()Lcom/ironsource/sdk/precache/DownloadManager;
    .locals 1

    .line 299
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mCacheDirectory:Ljava/lang/String;

    invoke-static {v0}, Lcom/ironsource/sdk/precache/DownloadManager;->getInstance(Ljava/lang/String;)Lcom/ironsource/sdk/precache/DownloadManager;

    move-result-object v0

    return-object v0
.end method

.method public getLayout()Landroid/widget/FrameLayout;
    .locals 1

    .line 3711
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mControllerLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method public getOfferWallCredits(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V
    .locals 6

    .line 2726
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mApplicationKey:Ljava/lang/String;

    .line 2727
    iput-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mUserId:Ljava/lang/String;

    .line 2729
    iput-object p3, p0, Lcom/ironsource/sdk/controller/WebController;->mOnOfferWallListener:Lcom/ironsource/sdk/listeners/OnOfferWallListener;

    .line 2731
    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWallCredits:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    new-instance v5, Lcom/ironsource/sdk/controller/WebController$7;

    invoke-direct {v5, p0}, Lcom/ironsource/sdk/controller/WebController$7;-><init>(Lcom/ironsource/sdk/controller/WebController;)V

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/ironsource/sdk/controller/WebController;->initProduct(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/controller/WebController$OnInitProductHandler;)V

    return-void
.end method

.method public getOrientationState()Ljava/lang/String;
    .locals 1

    .line 582
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mOrientationState:Ljava/lang/String;

    return-object v0
.end method

.method public getSavedState()Lcom/ironsource/sdk/data/AdUnitsState;
    .locals 1

    .line 3845
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mSavedState:Lcom/ironsource/sdk/data/AdUnitsState;

    return-object v0
.end method

.method public getState()Lcom/ironsource/sdk/controller/WebController$State;
    .locals 1

    .line 3762
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mState:Lcom/ironsource/sdk/controller/WebController$State;

    return-object v0
.end method

.method public handleSearchKeysURLs(Ljava/lang/String;)Z
    .locals 2

    .line 3739
    invoke-static {}, Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;->getSupersonicPrefHelper()Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;->getSearchKeys()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 3741
    :try_start_0
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 3743
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 3744
    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3745
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->getCurrentActivityContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/ironsource/environment/UrlHandler;->openUrl(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    move-exception p1

    .line 3751
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public hideCustomView()V
    .locals 1

    .line 3719
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mWebChromeClient:Lcom/ironsource/sdk/controller/WebController$ChromeClient;

    invoke-virtual {v0}, Lcom/ironsource/sdk/controller/WebController$ChromeClient;->onHideCustomView()V

    return-void
.end method

.method public inCustomView()Z
    .locals 1

    .line 3715
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mCustomView:Landroid/view/View;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public initBanner(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/listeners/internals/DSBannerListener;)V
    .locals 6

    .line 2749
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mApplicationKey:Ljava/lang/String;

    .line 2750
    iput-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mUserId:Ljava/lang/String;

    .line 2752
    iput-object p4, p0, Lcom/ironsource/sdk/controller/WebController;->mDSBannerListener:Lcom/ironsource/sdk/listeners/internals/DSBannerListener;

    .line 2754
    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    new-instance v5, Lcom/ironsource/sdk/controller/WebController$8;

    invoke-direct {v5, p0}, Lcom/ironsource/sdk/controller/WebController$8;-><init>(Lcom/ironsource/sdk/controller/WebController;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/ironsource/sdk/controller/WebController;->initProduct(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/controller/WebController$OnInitProductHandler;)V

    return-void
.end method

.method public initInterstitial(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 6

    .line 2610
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mApplicationKey:Ljava/lang/String;

    .line 2611
    iput-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mUserId:Ljava/lang/String;

    .line 2612
    iput-object p4, p0, Lcom/ironsource/sdk/controller/WebController;->mDSInterstitialListener:Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;

    .line 2615
    iget-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mSavedState:Lcom/ironsource/sdk/data/AdUnitsState;

    invoke-virtual {p2, p1}, Lcom/ironsource/sdk/data/AdUnitsState;->setInterstitialAppKey(Ljava/lang/String;)V

    .line 2616
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mSavedState:Lcom/ironsource/sdk/data/AdUnitsState;

    iget-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mUserId:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/ironsource/sdk/data/AdUnitsState;->setInterstitialUserId(Ljava/lang/String;)V

    .line 2618
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->mApplicationKey:Ljava/lang/String;

    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController;->mUserId:Ljava/lang/String;

    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    new-instance v5, Lcom/ironsource/sdk/controller/WebController$5;

    invoke-direct {v5, p0}, Lcom/ironsource/sdk/controller/WebController$5;-><init>(Lcom/ironsource/sdk/controller/WebController;)V

    move-object v0, p0

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/ironsource/sdk/controller/WebController;->initProduct(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/controller/WebController$OnInitProductHandler;)V

    return-void
.end method

.method public initOfferWall(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ironsource/sdk/listeners/OnOfferWallListener;",
            ")V"
        }
    .end annotation

    .line 2697
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mApplicationKey:Ljava/lang/String;

    .line 2698
    iput-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mUserId:Ljava/lang/String;

    .line 2699
    iput-object p3, p0, Lcom/ironsource/sdk/controller/WebController;->mOWExtraParameters:Ljava/util/Map;

    .line 2700
    iput-object p4, p0, Lcom/ironsource/sdk/controller/WebController;->mOnOfferWallListener:Lcom/ironsource/sdk/listeners/OnOfferWallListener;

    .line 2702
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mSavedState:Lcom/ironsource/sdk/data/AdUnitsState;

    invoke-virtual {p1, p3}, Lcom/ironsource/sdk/data/AdUnitsState;->setOfferWallExtraParams(Ljava/util/Map;)V

    .line 2704
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mSavedState:Lcom/ironsource/sdk/data/AdUnitsState;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/ironsource/sdk/data/AdUnitsState;->setOfferwallReportInit(Z)V

    .line 2706
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->mApplicationKey:Ljava/lang/String;

    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController;->mUserId:Ljava/lang/String;

    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    new-instance v5, Lcom/ironsource/sdk/controller/WebController$6;

    invoke-direct {v5, p0}, Lcom/ironsource/sdk/controller/WebController$6;-><init>(Lcom/ironsource/sdk/controller/WebController;)V

    const/4 v4, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/ironsource/sdk/controller/WebController;->initProduct(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/controller/WebController$OnInitProductHandler;)V

    return-void
.end method

.method public initRewardedVideo(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;)V
    .locals 6

    .line 2584
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mApplicationKey:Ljava/lang/String;

    .line 2585
    iput-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->mUserId:Ljava/lang/String;

    .line 2586
    iput-object p4, p0, Lcom/ironsource/sdk/controller/WebController;->mDSRewardedVideoListener:Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;

    .line 2587
    iget-object p4, p0, Lcom/ironsource/sdk/controller/WebController;->mSavedState:Lcom/ironsource/sdk/data/AdUnitsState;

    invoke-virtual {p4, p1}, Lcom/ironsource/sdk/data/AdUnitsState;->setRVAppKey(Ljava/lang/String;)V

    .line 2588
    iget-object p4, p0, Lcom/ironsource/sdk/controller/WebController;->mSavedState:Lcom/ironsource/sdk/data/AdUnitsState;

    invoke-virtual {p4, p2}, Lcom/ironsource/sdk/data/AdUnitsState;->setRVUserId(Ljava/lang/String;)V

    .line 2590
    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    new-instance v5, Lcom/ironsource/sdk/controller/WebController$4;

    invoke-direct {v5, p0}, Lcom/ironsource/sdk/controller/WebController$4;-><init>(Lcom/ironsource/sdk/controller/WebController;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/ironsource/sdk/controller/WebController;->initProduct(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/controller/WebController$OnInitProductHandler;)V

    return-void
.end method

.method initializeCacheDirectory(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 303
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/ironsource/sdk/utils/IronSourceStorageUtils;->initializeCacheDirectory(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public interceptedUrlToStore()V
    .locals 1

    const-string v0, "interceptedUrlToStore"

    .line 2949
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2950
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public isInterstitialAdAvailable(Ljava/lang/String;)Z
    .locals 2

    .line 2684
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0, v1, p1}, Lcom/ironsource/sdk/controller/DemandSourceManager;->getDemandSourceById(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 2685
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/DemandSource;->getAvailabilityState()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public load(I)V
    .locals 10

    const-string v0, "WebViewController:: load: "

    :try_start_0
    const-string v1, "about:blank"

    .line 2482
    invoke-virtual {p0, v1}, Lcom/ironsource/sdk/controller/WebController;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    .line 2484
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/ironsource/sdk/utils/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 2485
    new-instance v1, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;

    invoke-direct {v1}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;-><init>()V

    const-string v2, "https://www.supersonicads.com/mobile/sdk5/log?method=webviewLoadBlank"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 2489
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController;->mCacheDirectory:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "mobileController.html"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2491
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/ironsource/sdk/controller/WebController;->mCacheDirectory:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2492
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2495
    invoke-static {}, Lcom/ironsource/sdk/utils/SDKUtils;->getControllerConfigAsJSONObject()Lorg/json/JSONObject;

    move-result-object v2

    .line 2498
    invoke-direct {p0, v2}, Lcom/ironsource/sdk/controller/WebController;->setWebDebuggingEnabled(Lorg/json/JSONObject;)V

    .line 2501
    invoke-direct {p0, v2}, Lcom/ironsource/sdk/controller/WebController;->getRequestParameters(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v2

    .line 2503
    invoke-static {}, Lcom/ironsource/sdk/utils/SDKUtils;->getInitSDKParams()Ljava/util/Map;

    move-result-object v3

    if-eqz v3, :cond_0

    const-string v4, "sessionid"

    .line 2505
    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    const/4 v2, 0x1

    .line 2506
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v5, v2

    const-string v2, "%s&sessionid=%s"

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 2511
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "?"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2514
    new-instance v9, Lcom/ironsource/sdk/controller/WebController$3;

    const-wide/32 v4, 0xc350

    const-wide/16 v6, 0x3e8

    move-object v2, v9

    move-object v3, p0

    move v8, p1

    invoke-direct/range {v2 .. v8}, Lcom/ironsource/sdk/controller/WebController$3;-><init>(Lcom/ironsource/sdk/controller/WebController;JJI)V

    .line 2534
    invoke-virtual {v9}, Lcom/ironsource/sdk/controller/WebController$3;->start()Landroid/os/CountDownTimer;

    move-result-object p1

    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mLoadControllerTimer:Landroid/os/CountDownTimer;

    .line 2538
    :try_start_1
    invoke-virtual {p0, v1}, Lcom/ironsource/sdk/controller/WebController;->loadUrl(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p1

    .line 2540
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/ironsource/sdk/utils/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 2541
    new-instance p1, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;

    invoke-direct {p1}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;-><init>()V

    const-string v0, "https://www.supersonicads.com/mobile/sdk5/log?method=webviewLoadWithPath"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 2544
    :goto_1
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "load(): "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 2547
    :cond_1
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    const-string v0, "load(): Mobile Controller HTML Does not exist"

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2548
    new-instance p1, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;

    invoke-direct {p1}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;-><init>()V

    const-string v0, "https://www.supersonicads.com/mobile/sdk5/log?method=htmlControllerDoesNotExistOnFileSystem"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :goto_2
    return-void
.end method

.method public loadBanner(Lorg/json/JSONObject;Lcom/ironsource/sdk/listeners/internals/DSBannerListener;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 2766
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "loadBanner"

    const-string v0, "onLoadBannerSuccess"

    const-string v1, "onLoadBannerFail"

    .line 2767
    invoke-direct {p0, p2, p1, v0, v1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2768
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public loadInterstitial(Lcom/ironsource/sdk/data/DemandSource;Ljava/util/Map;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ironsource/sdk/data/DemandSource;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;",
            ")V"
        }
    .end annotation

    .line 2643
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/controller/WebController;->handleLoadAd(Lcom/ironsource/sdk/data/DemandSource;Ljava/util/Map;)V

    return-void
.end method

.method public loadInterstitial(Ljava/lang/String;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 2

    .line 2632
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string v0, "demandSourceName"

    .line 2633
    invoke-interface {p2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2634
    invoke-static {p2}, Lcom/ironsource/sdk/utils/SDKUtils;->flatMapToJsonAsString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p2

    .line 2636
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mSavedState:Lcom/ironsource/sdk/data/AdUnitsState;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/ironsource/sdk/data/AdUnitsState;->setReportLoadInterstitial(Ljava/lang/String;Z)V

    const-string p1, "loadInterstitial"

    const-string v0, "onLoadInterstitialSuccess"

    const-string v1, "onLoadInterstitialFail"

    .line 2638
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2639
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public nativeNavigationPressed(Ljava/lang/String;)V
    .locals 11

    const-string v1, "action"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v0, p0

    move-object v2, p1

    .line 2938
    invoke-direct/range {v0 .. v10}, Lcom/ironsource/sdk/controller/WebController;->parseToJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    const-string v0, "nativeNavigationPressed"

    .line 2939
    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2940
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public notifyLifeCycle(Ljava/lang/String;Ljava/lang/String;)V
    .locals 11

    const-string v1, "lifeCycleEvent"

    const-string v3, "productType"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v0, p0

    move-object v2, p2

    move-object v4, p1

    .line 333
    invoke-direct/range {v0 .. v10}, Lcom/ironsource/sdk/controller/WebController;->parseToJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    const-string p2, "onNativeLifeCycleEvent"

    .line 339
    invoke-direct {p0, p2, p1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 340
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public onDownloadStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 3597
    iget-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onFileDownloadFail(Lcom/ironsource/sdk/data/SSAFile;)V
    .locals 3

    .line 3586
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/SSAFile;->getFile()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mobileController.html"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3587
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mControllerListener:Lcom/ironsource/sdk/controller/ControllerEventListener;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "controller failed to download - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ironsource/sdk/data/SSAFile;->getErrMsg()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/ironsource/sdk/controller/ControllerEventListener;->handleControllerStageFailed(Ljava/lang/String;)V

    goto :goto_0

    .line 3589
    :cond_0
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/SSAFile;->getFile()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/ironsource/sdk/data/SSAFile;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/ironsource/sdk/data/SSAFile;->getErrMsg()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->assetCachedFailed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onFileDownloadSuccess(Lcom/ironsource/sdk/data/SSAFile;)V
    .locals 2

    .line 3574
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/SSAFile;->getFile()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mobileController.html"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    .line 3576
    invoke-virtual {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->load(I)V

    goto :goto_0

    .line 3578
    :cond_0
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/SSAFile;->getFile()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/ironsource/sdk/data/SSAFile;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/ironsource/sdk/controller/WebController;->assetCached(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_1

    .line 3940
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mChangeListener:Lcom/ironsource/sdk/listeners/OnWebViewChangeListener;

    invoke-interface {v0}, Lcom/ironsource/sdk/listeners/OnWebViewChangeListener;->onBackButtonPressed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3941
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1

    .line 3947
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public pageFinished()V
    .locals 1

    const-string v0, "pageFinished"

    .line 2944
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2945
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public pause()V
    .locals 4

    .line 3680
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-le v0, v1, :cond_0

    .line 3682
    :try_start_0
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->onPause()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 3684
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "WebViewController: pause() - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 3685
    new-instance v0, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;

    invoke-direct {v0}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;-><init>()V

    const-string v1, "https://www.supersonicads.com/mobile/sdk5/log?method=webviewPause"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_0
    :goto_0
    return-void
.end method

.method public registerConnectionReceiver(Landroid/content/Context;)V
    .locals 1

    .line 3663
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mConnectivityAdapter:Lcom/ironsource/sdk/service/ConnectivityAdapter;

    if-nez v0, :cond_0

    return-void

    .line 3667
    :cond_0
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/service/ConnectivityAdapter;->startListenToNetworkChanges(Landroid/content/Context;)V

    return-void
.end method

.method public removeVideoEventsListener()V
    .locals 1

    const/4 v0, 0x0

    .line 2459
    iput-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mVideoEventsListener:Lcom/ironsource/sdk/controller/VideoEventsListener;

    return-void
.end method

.method public restoreSavedState()V
    .locals 1

    .line 3848
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mSavedState:Lcom/ironsource/sdk/data/AdUnitsState;

    invoke-virtual {p0, v0}, Lcom/ironsource/sdk/controller/WebController;->restoreState(Lcom/ironsource/sdk/data/AdUnitsState;)V

    return-void
.end method

.method public restoreState(Lcom/ironsource/sdk/data/AdUnitsState;)V
    .locals 10

    .line 3851
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mSavedStateLocker:Ljava/lang/Object;

    monitor-enter v0

    .line 3853
    :try_start_0
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/AdUnitsState;->shouldRestore()Z

    move-result v1

    if-eqz v1, :cond_8

    iget-boolean v1, p0, Lcom/ironsource/sdk/controller/WebController;->mIsWebControllerReady:Z

    if-eqz v1, :cond_8

    .line 3855
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "restoreState(state:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3858
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/AdUnitsState;->getDisplayedProduct()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_3

    .line 3863
    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v3}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->ordinal()I

    move-result v3

    if-ne v1, v3, :cond_0

    .line 3864
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    const-string v3, "onRVAdClosed()"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3865
    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    .line 3866
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/AdUnitsState;->getDisplayedDemandSourceId()Ljava/lang/String;

    move-result-object v3

    .line 3867
    invoke-direct {p0, v1}, Lcom/ironsource/sdk/controller/WebController;->getAdProductListenerByProductType(Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Lcom/ironsource/sdk/listeners/internals/DSAdProductListener;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 3868
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 3869
    invoke-interface {v4, v1, v3}, Lcom/ironsource/sdk/listeners/internals/DSAdProductListener;->onAdProductClose(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)V

    goto :goto_0

    .line 3873
    :cond_0
    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v3}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->ordinal()I

    move-result v3

    if-ne v1, v3, :cond_1

    .line 3874
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    const-string v3, "onInterstitialAdClosed()"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3875
    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    .line 3876
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/AdUnitsState;->getDisplayedDemandSourceId()Ljava/lang/String;

    move-result-object v3

    .line 3877
    invoke-direct {p0, v1}, Lcom/ironsource/sdk/controller/WebController;->getAdProductListenerByProductType(Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Lcom/ironsource/sdk/listeners/internals/DSAdProductListener;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 3878
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 3879
    invoke-interface {v4, v1, v3}, Lcom/ironsource/sdk/listeners/internals/DSAdProductListener;->onAdProductClose(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)V

    goto :goto_0

    .line 3883
    :cond_1
    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v3}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->ordinal()I

    move-result v3

    if-ne v1, v3, :cond_2

    .line 3884
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    const-string v3, "onOWAdClosed()"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3885
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->mOnOfferWallListener:Lcom/ironsource/sdk/listeners/OnOfferWallListener;

    if-eqz v1, :cond_2

    .line 3886
    invoke-interface {v1}, Lcom/ironsource/sdk/listeners/OnOfferWallListener;->onOWAdClosed()V

    .line 3890
    :cond_2
    :goto_0
    invoke-virtual {p1, v2}, Lcom/ironsource/sdk/data/AdUnitsState;->adOpened(I)V

    const/4 v1, 0x0

    .line 3891
    invoke-virtual {p1, v1}, Lcom/ironsource/sdk/data/AdUnitsState;->setDisplayedDemandSourceId(Ljava/lang/String;)V

    goto :goto_1

    .line 3893
    :cond_3
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    const-string v2, "No ad was opened"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3900
    :goto_1
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/AdUnitsState;->getInterstitialAppKey()Ljava/lang/String;

    move-result-object v1

    .line 3901
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/AdUnitsState;->getInterstitialUserId()Ljava/lang/String;

    move-result-object v2

    .line 3903
    iget-object v3, p0, Lcom/ironsource/sdk/controller/WebController;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    sget-object v4, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v3, v4}, Lcom/ironsource/sdk/controller/DemandSourceManager;->getDemandSources(Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Ljava/util/Collection;

    move-result-object v3

    .line 3904
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_4
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x2

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/ironsource/sdk/data/DemandSource;

    .line 3905
    invoke-virtual {v4}, Lcom/ironsource/sdk/data/DemandSource;->getDemandSourceInitState()I

    move-result v6

    if-ne v6, v5, :cond_4

    .line 3906
    iget-object v5, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "initInterstitial(appKey:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ", userId:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ", demandSource:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/ironsource/sdk/data/DemandSource;->getDemandSourceName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3907
    iget-object v5, p0, Lcom/ironsource/sdk/controller/WebController;->mDSInterstitialListener:Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;

    invoke-virtual {p0, v1, v2, v4, v5}, Lcom/ironsource/sdk/controller/WebController;->initInterstitial(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V

    goto :goto_2

    .line 3913
    :cond_5
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/AdUnitsState;->getRVAppKey()Ljava/lang/String;

    move-result-object v1

    .line 3914
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/AdUnitsState;->getRVUserId()Ljava/lang/String;

    move-result-object v2

    .line 3916
    iget-object v3, p0, Lcom/ironsource/sdk/controller/WebController;->mDemandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    sget-object v4, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v3, v4}, Lcom/ironsource/sdk/controller/DemandSourceManager;->getDemandSources(Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Ljava/util/Collection;

    move-result-object v3

    .line 3917
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_6
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/ironsource/sdk/data/DemandSource;

    .line 3918
    invoke-virtual {v4}, Lcom/ironsource/sdk/data/DemandSource;->getDemandSourceInitState()I

    move-result v6

    if-ne v6, v5, :cond_6

    .line 3919
    invoke-virtual {v4}, Lcom/ironsource/sdk/data/DemandSource;->getDemandSourceName()Ljava/lang/String;

    move-result-object v6

    .line 3920
    iget-object v7, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    const-string v8, "onRVNoMoreOffers()"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3921
    iget-object v7, p0, Lcom/ironsource/sdk/controller/WebController;->mDSRewardedVideoListener:Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;

    invoke-interface {v7, v6}, Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;->onRVNoMoreOffers(Ljava/lang/String;)V

    .line 3922
    iget-object v7, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "initRewardedVideo(appKey:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ", userId:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ", demandSource:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ")"

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3923
    iget-object v6, p0, Lcom/ironsource/sdk/controller/WebController;->mDSRewardedVideoListener:Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;

    invoke-virtual {p0, v1, v2, v4, v6}, Lcom/ironsource/sdk/controller/WebController;->initRewardedVideo(Ljava/lang/String;Ljava/lang/String;Lcom/ironsource/sdk/data/DemandSource;Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;)V

    goto :goto_3

    :cond_7
    const/4 v1, 0x0

    .line 3927
    invoke-virtual {p1, v1}, Lcom/ironsource/sdk/data/AdUnitsState;->setShouldRestore(Z)V

    .line 3930
    :cond_8
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mSavedState:Lcom/ironsource/sdk/data/AdUnitsState;

    .line 3932
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public resume()V
    .locals 4

    .line 3694
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-le v0, v1, :cond_0

    .line 3696
    :try_start_0
    invoke-virtual {p0}, Lcom/ironsource/sdk/controller/WebController;->onResume()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 3698
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "WebViewController: onResume() - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 3699
    new-instance v0, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;

    invoke-direct {v0}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;-><init>()V

    const-string v1, "https://www.supersonicads.com/mobile/sdk5/log?method=webviewResume"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_0
    :goto_0
    return-void
.end method

.method runOnUiThread(Ljava/lang/Runnable;)V
    .locals 1

    .line 3951
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mUiHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 3952
    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public saveState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;
    .locals 0

    .line 508
    invoke-super {p0, p1}, Landroid/webkit/WebView;->saveState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;

    move-result-object p1

    return-object p1
.end method

.method public sendConnectionInfoChanged(Lorg/json/JSONObject;)V
    .locals 13

    .line 3644
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "device connection info changed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 3646
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v3, "connectionInfo"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v2, p0

    invoke-direct/range {v2 .. v12}, Lcom/ironsource/sdk/controller/WebController;->parseToJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    const-string v0, "connectionInfoChanged"

    .line 3647
    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 3648
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public sendConnectionTypeChanged(Ljava/lang/String;)V
    .locals 13

    .line 3634
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "device status changed, connection type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 3636
    invoke-static {p1}, Lcom/ironsource/sdk/Events/ISNEventsBaseData;->setConnectionType(Ljava/lang/String;)V

    const-string v3, "connectionType"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v2, p0

    move-object v4, p1

    .line 3637
    invoke-direct/range {v2 .. v12}, Lcom/ironsource/sdk/controller/WebController;->parseToJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    const-string v0, "deviceStatusChanged"

    .line 3638
    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 3639
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public setCommunicationWithAdView(Lcom/ironsource/sdk/ISNAdView/ISNAdView;)V
    .locals 1

    .line 3957
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mBannerJsAdapter:Lcom/ironsource/sdk/controller/BannerJSAdapter;

    if-eqz v0, :cond_0

    .line 3958
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/controller/BannerJSAdapter;->setCommunicationWithAdView(Lcom/ironsource/sdk/ISNAdView/ISNAdView;)V

    :cond_0
    return-void
.end method

.method public setControllerKeyPressed(Ljava/lang/String;)V
    .locals 0

    .line 3618
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mControllerKeyPressed:Ljava/lang/String;

    return-void
.end method

.method public setDebugMode(I)V
    .locals 0

    .line 543
    sput p1, Lcom/ironsource/sdk/controller/WebController;->mDebugMode:I

    return-void
.end method

.method setMissProduct(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lcom/ironsource/sdk/data/DemandSource;)V
    .locals 2

    .line 2864
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    const/4 v1, 0x1

    if-eq p1, v0, :cond_2

    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-eq p1, v0, :cond_2

    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 2868
    :cond_0
    sget-object p2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, p2, :cond_1

    .line 2869
    iput-boolean v1, p0, Lcom/ironsource/sdk/controller/WebController;->mOWmiss:Z

    goto :goto_1

    .line 2870
    :cond_1
    sget-object p2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWallCredits:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    if-ne p1, p2, :cond_3

    .line 2871
    iput-boolean v1, p0, Lcom/ironsource/sdk/controller/WebController;->mOWCreditsMiss:Z

    goto :goto_1

    :cond_2
    :goto_0
    if-eqz p2, :cond_3

    .line 2866
    invoke-virtual {p2, v1}, Lcom/ironsource/sdk/data/DemandSource;->setDemandSourceInitState(I)V

    .line 2873
    :cond_3
    :goto_1
    iget-object p2, p0, Lcom/ironsource/sdk/controller/WebController;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setMissProduct("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setOnWebViewControllerChangeListener(Lcom/ironsource/sdk/listeners/OnWebViewChangeListener;)V
    .locals 0

    .line 3707
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mChangeListener:Lcom/ironsource/sdk/listeners/OnWebViewChangeListener;

    return-void
.end method

.method public setOrientationState(Ljava/lang/String;)V
    .locals 0

    .line 578
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mOrientationState:Ljava/lang/String;

    return-void
.end method

.method public setState(Lcom/ironsource/sdk/controller/WebController$State;)V
    .locals 0

    .line 3758
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mState:Lcom/ironsource/sdk/controller/WebController$State;

    return-void
.end method

.method public setVideoEventsListener(Lcom/ironsource/sdk/controller/VideoEventsListener;)V
    .locals 0

    .line 2455
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mVideoEventsListener:Lcom/ironsource/sdk/controller/VideoEventsListener;

    return-void
.end method

.method public showInterstitial(Lcom/ironsource/sdk/data/DemandSource;Ljava/util/Map;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ironsource/sdk/data/DemandSource;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;",
            ")V"
        }
    .end annotation

    const/4 p3, 0x2

    new-array p3, p3, [Ljava/util/Map;

    const/4 v0, 0x0

    aput-object p2, p3, v0

    .line 2675
    invoke-virtual {p1}, Lcom/ironsource/sdk/data/DemandSource;->convertToMap()Ljava/util/Map;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, p3, p2

    .line 2673
    invoke-static {p3}, Lcom/ironsource/sdk/utils/SDKUtils;->mergeHashMaps([Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 2679
    sget-object p2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    new-instance p3, Lorg/json/JSONObject;

    invoke-direct {p3, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-direct {p0, p2, p3}, Lcom/ironsource/sdk/controller/WebController;->createShowProductJSMethod(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    .line 2680
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public showInterstitial(Lorg/json/JSONObject;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 0

    .line 2668
    sget-object p2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-direct {p0, p2, p1}, Lcom/ironsource/sdk/controller/WebController;->createShowProductJSMethod(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    .line 2669
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public showOfferWall(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 2716
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController;->mOWExtraParameters:Ljava/util/Map;

    const-string p1, "showOfferWall"

    const-string v0, "onShowOfferWallSuccess"

    const-string v1, "onShowOfferWallFail"

    .line 2717
    invoke-direct {p0, p1, v0, v1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2718
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public showRewardedVideo(Lorg/json/JSONObject;Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;)V
    .locals 0

    .line 2902
    sget-object p2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-direct {p0, p2, p1}, Lcom/ironsource/sdk/controller/WebController;->createShowProductJSMethod(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    .line 2903
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public unregisterConnectionReceiver(Landroid/content/Context;)V
    .locals 1

    .line 3671
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController;->mConnectivityAdapter:Lcom/ironsource/sdk/service/ConnectivityAdapter;

    if-nez v0, :cond_0

    return-void

    .line 3675
    :cond_0
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/service/ConnectivityAdapter;->stopListenToNetworkChanges(Landroid/content/Context;)V

    return-void
.end method

.method public updateConsentInfo(Lorg/json/JSONObject;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 2776
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const-string v0, "updateConsentInfo"

    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2777
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method

.method public viewableChange(ZLjava/lang/String;)V
    .locals 11

    const-string v1, "webview"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "isViewable"

    move-object v0, p0

    move-object v2, p2

    move v10, p1

    .line 2929
    invoke-direct/range {v0 .. v10}, Lcom/ironsource/sdk/controller/WebController;->parseToJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    const-string p2, "viewableChange"

    .line 2933
    invoke-direct {p0, p2, p1}, Lcom/ironsource/sdk/controller/WebController;->generateJSToInject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2934
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController;->injectJavascript(Ljava/lang/String;)V

    return-void
.end method
