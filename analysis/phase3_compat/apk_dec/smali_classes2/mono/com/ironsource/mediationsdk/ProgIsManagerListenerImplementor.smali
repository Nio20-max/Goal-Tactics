.class public Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;
.super Ljava/lang/Object;
.source "ProgIsManagerListenerImplementor.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/ironsource/mediationsdk/ProgIsManagerListener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onInterstitialAdClicked:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdClicked_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdClosed:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdClosed_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdLoadFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;J)V:GetOnInterstitialAdLoadFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Lcom_ironsource_mediationsdk_ProgIsSmash_JHandler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdOpened:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdOpened_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdReady:(Lcom/ironsource/mediationsdk/ProgIsSmash;J)V:GetOnInterstitialAdReady_Lcom_ironsource_mediationsdk_ProgIsSmash_JHandler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdShowFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdShowFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdShowSucceeded:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdShowSucceeded_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdVisible:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdVisible_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialInitFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialInitFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialInitSuccess:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialInitSuccess_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 25
    const-class v0, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;

    const-string v1, "Com.Ironsource.Mediationsdk.IProgIsManagerListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, "n_onInterstitialAdClicked:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdClicked_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdClosed:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdClosed_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdLoadFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;J)V:GetOnInterstitialAdLoadFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Lcom_ironsource_mediationsdk_ProgIsSmash_JHandler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdOpened:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdOpened_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdReady:(Lcom/ironsource/mediationsdk/ProgIsSmash;J)V:GetOnInterstitialAdReady_Lcom_ironsource_mediationsdk_ProgIsSmash_JHandler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdShowFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdShowFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdShowSucceeded:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdShowSucceeded_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialAdVisible:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialAdVisible_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialInitFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialInitFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onInterstitialInitSuccess:(Lcom/ironsource/mediationsdk/ProgIsSmash;)V:GetOnInterstitialInitSuccess_Lcom_ironsource_mediationsdk_ProgIsSmash_Handler:Com.Ironsource.Mediationsdk.IProgIsManagerListenerInvoker, IronSource-Android_v7.0.3.1\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Com.Ironsource.Mediationsdk.IProgIsManagerListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, ""

    .line 33
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onInterstitialAdClicked(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
.end method

.method private native n_onInterstitialAdClosed(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
.end method

.method private native n_onInterstitialAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;J)V
.end method

.method private native n_onInterstitialAdOpened(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
.end method

.method private native n_onInterstitialAdReady(Lcom/ironsource/mediationsdk/ProgIsSmash;J)V
.end method

.method private native n_onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;)V
.end method

.method private native n_onInterstitialAdShowSucceeded(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
.end method

.method private native n_onInterstitialAdVisible(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
.end method

.method private native n_onInterstitialInitFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;)V
.end method

.method private native n_onInterstitialInitSuccess(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 119
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 120
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;->refList:Ljava/util/ArrayList;

    .line 121
    :cond_0
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 126
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 127
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onInterstitialAdClicked(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;->n_onInterstitialAdClicked(Lcom/ironsource/mediationsdk/ProgIsSmash;)V

    return-void
.end method

.method public onInterstitialAdClosed(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;->n_onInterstitialAdClosed(Lcom/ironsource/mediationsdk/ProgIsSmash;)V

    return-void
.end method

.method public onInterstitialAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;J)V
    .locals 0

    .line 55
    invoke-direct {p0, p1, p2, p3, p4}, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;->n_onInterstitialAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;J)V

    return-void
.end method

.method public onInterstitialAdOpened(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 0

    .line 63
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;->n_onInterstitialAdOpened(Lcom/ironsource/mediationsdk/ProgIsSmash;)V

    return-void
.end method

.method public onInterstitialAdReady(Lcom/ironsource/mediationsdk/ProgIsSmash;J)V
    .locals 0

    .line 71
    invoke-direct {p0, p1, p2, p3}, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;->n_onInterstitialAdReady(Lcom/ironsource/mediationsdk/ProgIsSmash;J)V

    return-void
.end method

.method public onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 0

    .line 79
    invoke-direct {p0, p1, p2}, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;->n_onInterstitialAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;)V

    return-void
.end method

.method public onInterstitialAdShowSucceeded(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 0

    .line 87
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;->n_onInterstitialAdShowSucceeded(Lcom/ironsource/mediationsdk/ProgIsSmash;)V

    return-void
.end method

.method public onInterstitialAdVisible(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 0

    .line 95
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;->n_onInterstitialAdVisible(Lcom/ironsource/mediationsdk/ProgIsSmash;)V

    return-void
.end method

.method public onInterstitialInitFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 0

    .line 103
    invoke-direct {p0, p1, p2}, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;->n_onInterstitialInitFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgIsSmash;)V

    return-void
.end method

.method public onInterstitialInitSuccess(Lcom/ironsource/mediationsdk/ProgIsSmash;)V
    .locals 0

    .line 111
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/ProgIsManagerListenerImplementor;->n_onInterstitialInitSuccess(Lcom/ironsource/mediationsdk/ProgIsSmash;)V

    return-void
.end method
