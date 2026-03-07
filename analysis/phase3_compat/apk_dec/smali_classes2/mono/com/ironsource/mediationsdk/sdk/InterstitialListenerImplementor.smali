.class public Lmono/com/ironsource/mediationsdk/sdk/InterstitialListenerImplementor;
.super Ljava/lang/Object;
.source "InterstitialListenerImplementor.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/ironsource/mediationsdk/sdk/InterstitialListener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onInterstitialAdClicked:()V:GetOnInterstitialAdClickedHandler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdClosed:()V:GetOnInterstitialAdClosedHandler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdLoadFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnInterstitialAdLoadFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdOpened:()V:GetOnInterstitialAdOpenedHandler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdReady:()V:GetOnInterstitialAdReadyHandler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdShowFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnInterstitialAdShowFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdShowSucceeded:()V:GetOnInterstitialAdShowSucceededHandler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 22
    const-class v0, Lmono/com/ironsource/mediationsdk/sdk/InterstitialListenerImplementor;

    const-string v1, "Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, "n_onInterstitialAdClicked:()V:GetOnInterstitialAdClickedHandler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdClosed:()V:GetOnInterstitialAdClosedHandler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdLoadFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnInterstitialAdLoadFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdOpened:()V:GetOnInterstitialAdOpenedHandler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdReady:()V:GetOnInterstitialAdReadyHandler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdShowFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnInterstitialAdShowFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdShowSucceeded:()V:GetOnInterstitialAdShowSucceededHandler:Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerInvoker, IronSource-Android_v7.0.3.1\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lmono/com/ironsource/mediationsdk/sdk/InterstitialListenerImplementor;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Com.Ironsource.Mediationsdk.Sdk.IInterstitialListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, ""

    .line 30
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onInterstitialAdClicked()V
.end method

.method private native n_onInterstitialAdClosed()V
.end method

.method private native n_onInterstitialAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
.end method

.method private native n_onInterstitialAdOpened()V
.end method

.method private native n_onInterstitialAdReady()V
.end method

.method private native n_onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
.end method

.method private native n_onInterstitialAdShowSucceeded()V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 92
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/sdk/InterstitialListenerImplementor;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 93
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmono/com/ironsource/mediationsdk/sdk/InterstitialListenerImplementor;->refList:Ljava/util/ArrayList;

    .line 94
    :cond_0
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/sdk/InterstitialListenerImplementor;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 99
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/sdk/InterstitialListenerImplementor;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 100
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onInterstitialAdClicked()V
    .locals 0

    .line 36
    invoke-direct {p0}, Lmono/com/ironsource/mediationsdk/sdk/InterstitialListenerImplementor;->n_onInterstitialAdClicked()V

    return-void
.end method

.method public onInterstitialAdClosed()V
    .locals 0

    .line 44
    invoke-direct {p0}, Lmono/com/ironsource/mediationsdk/sdk/InterstitialListenerImplementor;->n_onInterstitialAdClosed()V

    return-void
.end method

.method public onInterstitialAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
    .locals 0

    .line 52
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/sdk/InterstitialListenerImplementor;->n_onInterstitialAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    return-void
.end method

.method public onInterstitialAdOpened()V
    .locals 0

    .line 60
    invoke-direct {p0}, Lmono/com/ironsource/mediationsdk/sdk/InterstitialListenerImplementor;->n_onInterstitialAdOpened()V

    return-void
.end method

.method public onInterstitialAdReady()V
    .locals 0

    .line 68
    invoke-direct {p0}, Lmono/com/ironsource/mediationsdk/sdk/InterstitialListenerImplementor;->n_onInterstitialAdReady()V

    return-void
.end method

.method public onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
    .locals 0

    .line 76
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/sdk/InterstitialListenerImplementor;->n_onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    return-void
.end method

.method public onInterstitialAdShowSucceeded()V
    .locals 0

    .line 84
    invoke-direct {p0}, Lmono/com/ironsource/mediationsdk/sdk/InterstitialListenerImplementor;->n_onInterstitialAdShowSucceeded()V

    return-void
.end method
