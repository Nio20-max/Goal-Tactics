.class public Lcom/ironsource/sdk/ISNAdView/ISNAdView;
.super Landroid/widget/FrameLayout;
.source "ISNAdView.java"


# instance fields
.field private TAG:Ljava/lang/String;

.field private mActivity:Landroid/app/Activity;

.field private mAdViewSize:Lcom/ironsource/sdk/ISAdSize;

.field private mContainerIdentifier:Ljava/lang/String;

.field private mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

.field private mWebView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Lcom/ironsource/sdk/ISAdSize;)V
    .locals 1

    .line 41
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 38
    const-class v0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->TAG:Ljava/lang/String;

    .line 42
    iput-object p1, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mActivity:Landroid/app/Activity;

    .line 43
    iput-object p3, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mAdViewSize:Lcom/ironsource/sdk/ISAdSize;

    .line 44
    iput-object p2, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mContainerIdentifier:Ljava/lang/String;

    .line 45
    new-instance p1, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    invoke-direct {p1}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;-><init>()V

    iput-object p1, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    return-void
.end method

.method static synthetic access$000(Lcom/ironsource/sdk/ISNAdView/ISNAdView;)Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    return-object p0
.end method

.method static synthetic access$002(Lcom/ironsource/sdk/ISNAdView/ISNAdView;Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;)Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    return-object p1
.end method

.method static synthetic access$100(Lcom/ironsource/sdk/ISNAdView/ISNAdView;)Landroid/webkit/WebView;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mWebView:Landroid/webkit/WebView;

    return-object p0
.end method

.method static synthetic access$202(Lcom/ironsource/sdk/ISNAdView/ISNAdView;Landroid/app/Activity;)Landroid/app/Activity;
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mActivity:Landroid/app/Activity;

    return-object p1
.end method

.method static synthetic access$302(Lcom/ironsource/sdk/ISNAdView/ISNAdView;Lcom/ironsource/sdk/ISAdSize;)Lcom/ironsource/sdk/ISAdSize;
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mAdViewSize:Lcom/ironsource/sdk/ISAdSize;

    return-object p1
.end method

.method static synthetic access$402(Lcom/ironsource/sdk/ISNAdView/ISNAdView;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mContainerIdentifier:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$500(Lcom/ironsource/sdk/ISNAdView/ISNAdView;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$600(Lcom/ironsource/sdk/ISNAdView/ISNAdView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 30
    invoke-direct {p0, p1, p2}, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->createWebView(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private createWebView(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 145
    new-instance v0, Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mWebView:Landroid/webkit/WebView;

    .line 146
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 147
    iget-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mWebView:Landroid/webkit/WebView;

    new-instance v1, Lcom/ironsource/sdk/ISNAdView/ISNAdViewWebViewJSInterface;

    invoke-direct {v1, p0}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewWebViewJSInterface;-><init>(Lcom/ironsource/sdk/ISNAdView/ISNAdView;)V

    const-string v2, "containerMsgHandler"

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 148
    iget-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mWebView:Landroid/webkit/WebView;

    new-instance v1, Lcom/ironsource/sdk/ISNAdView/ISNAdViewWebClient;

    new-instance v2, Lcom/ironsource/sdk/ISNAdView/ISNAdView$3;

    invoke-direct {v2, p0, p2}, Lcom/ironsource/sdk/ISNAdView/ISNAdView$3;-><init>(Lcom/ironsource/sdk/ISNAdView/ISNAdView;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewWebClient;-><init>(Lcom/ironsource/sdk/WPAD/ISNAdViewProtocol$IErrorReportDelegate;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 154
    iget-object p2, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mWebView:Landroid/webkit/WebView;

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 155
    iget-object p2, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    iget-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {p2, v0}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->setAdViewWebView(Landroid/webkit/WebView;)V

    .line 156
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 157
    iget-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    invoke-virtual {v0}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->getAdViewId()Ljava/lang/String;

    move-result-object v0

    const-string v1, "adViewId"

    invoke-virtual {p2, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 158
    iget-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    invoke-virtual {v0, p1, p2}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->sendMessageToController(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method


# virtual methods
.method public getAdViewSize()Lcom/ironsource/sdk/ISAdSize;
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mAdViewSize:Lcom/ironsource/sdk/ISAdSize;

    return-object v0
.end method

.method public load(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 69
    :try_start_0
    iget-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    iget-object v1, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mContainerIdentifier:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->buildDataForLoadingAd(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 75
    :try_start_1
    invoke-static {p1}, Lcom/ironsource/sdk/IronSourceNetwork;->loadBanner(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    .line 77
    :catch_0
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "ISNAdView | Failed to instantiate IronSourceAdsPublisherAgent"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 71
    :catch_1
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "ISNAdView | loadAd | Failed to build load parameters"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public loadAd(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 55
    :try_start_0
    iget-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    iget-object v1, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mContainerIdentifier:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->buildDataForLoadingAd(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 60
    :try_start_1
    iget-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/ironsource/sdk/SSAFactory;->getPublisherInstance(Landroid/app/Activity;)Lcom/ironsource/sdk/SSAPublisher;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/ironsource/sdk/SSAPublisher;->loadBanner(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    .line 62
    :catch_0
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "ISNAdView | Failed to instantiate IronSourceAdsPublisherAgent"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 57
    :catch_1
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "ISNAdView | loadAd | Failed to build load parameters"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public loadUrlIntoWebView(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 124
    iget-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mActivity:Landroid/app/Activity;

    new-instance v1, Lcom/ironsource/sdk/ISNAdView/ISNAdView$2;

    invoke-direct {v1, p0, p2, p3, p1}, Lcom/ironsource/sdk/ISNAdView/ISNAdView$2;-><init>(Lcom/ironsource/sdk/ISNAdView/ISNAdView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 2

    .line 109
    iget-object p1, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    if-eqz p1, :cond_0

    .line 110
    invoke-virtual {p0}, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->isShown()Z

    move-result v0

    const-string v1, "isVisible"

    invoke-virtual {p1, v1, p2, v0}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->updateViewVisibilityParameters(Ljava/lang/String;IZ)V

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 3

    .line 116
    iget-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    if-eqz v0, :cond_0

    .line 117
    invoke-virtual {p0}, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->isShown()Z

    move-result v1

    const-string v2, "isWindowVisible"

    invoke-virtual {v0, v2, p1, v1}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->updateViewVisibilityParameters(Ljava/lang/String;IZ)V

    :cond_0
    return-void
.end method

.method public performCleanup()V
    .locals 2

    .line 83
    iget-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mActivity:Landroid/app/Activity;

    new-instance v1, Lcom/ironsource/sdk/ISNAdView/ISNAdView$1;

    invoke-direct {v1, p0}, Lcom/ironsource/sdk/ISNAdView/ISNAdView$1;-><init>(Lcom/ironsource/sdk/ISNAdView/ISNAdView;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public receiveMessageFromController(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    :try_start_0
    const-string v0, "loadWithUrl"

    .line 167
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "urlForWebView"

    .line 168
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "adViewId"

    .line 169
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 170
    iget-object v2, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    invoke-virtual {v2, v1}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->setAdViewId(Ljava/lang/String;)V

    .line 171
    invoke-virtual {p0, v0, p3, p4}, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->loadUrlIntoWebView(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 174
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->handleMessageFromController(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p3

    .line 176
    invoke-virtual {p3}, Ljava/lang/Exception;->printStackTrace()V

    .line 177
    iget-object p3, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not handle message from controller: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " with params: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p4, p1}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->sendErrorMessageToController(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method receiveMessageFromWebView(Ljava/lang/String;)V
    .locals 1

    .line 162
    iget-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->handleMessageFromWebView(Ljava/lang/String;)V

    return-void
.end method

.method public setControllerDelegate(Lcom/ironsource/sdk/ISNAdView/ISNAdViewDelegate;)V
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdView;->mIsnAdViewLogic:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->setControllerDelegate(Lcom/ironsource/sdk/ISNAdView/ISNAdViewDelegate;)V

    return-void
.end method
