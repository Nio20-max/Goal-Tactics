.class public Lmono/com/ironsource/mediationsdk/sdk/BannerListenerImplementor;
.super Ljava/lang/Object;
.source "BannerListenerImplementor.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/ironsource/mediationsdk/sdk/BannerListener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onBannerAdClicked:()V:GetOnBannerAdClickedHandler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerAdLeftApplication:()V:GetOnBannerAdLeftApplicationHandler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerAdLoadFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnBannerAdLoadFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerAdLoaded:()V:GetOnBannerAdLoadedHandler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerAdScreenDismissed:()V:GetOnBannerAdScreenDismissedHandler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerAdScreenPresented:()V:GetOnBannerAdScreenPresentedHandler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 21
    const-class v0, Lmono/com/ironsource/mediationsdk/sdk/BannerListenerImplementor;

    const-string v1, "Com.Ironsource.Mediationsdk.Sdk.IBannerListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, "n_onBannerAdClicked:()V:GetOnBannerAdClickedHandler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerAdLeftApplication:()V:GetOnBannerAdLeftApplicationHandler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerAdLoadFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnBannerAdLoadFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerAdLoaded:()V:GetOnBannerAdLoadedHandler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerAdScreenDismissed:()V:GetOnBannerAdScreenDismissedHandler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerAdScreenPresented:()V:GetOnBannerAdScreenPresentedHandler:Com.Ironsource.Mediationsdk.Sdk.IBannerListenerInvoker, IronSource-Android_v7.0.3.1\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lmono/com/ironsource/mediationsdk/sdk/BannerListenerImplementor;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Com.Ironsource.Mediationsdk.Sdk.IBannerListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, ""

    .line 29
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onBannerAdClicked()V
.end method

.method private native n_onBannerAdLeftApplication()V
.end method

.method private native n_onBannerAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
.end method

.method private native n_onBannerAdLoaded()V
.end method

.method private native n_onBannerAdScreenDismissed()V
.end method

.method private native n_onBannerAdScreenPresented()V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 83
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/sdk/BannerListenerImplementor;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmono/com/ironsource/mediationsdk/sdk/BannerListenerImplementor;->refList:Ljava/util/ArrayList;

    .line 85
    :cond_0
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/sdk/BannerListenerImplementor;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 90
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/sdk/BannerListenerImplementor;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 91
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onBannerAdClicked()V
    .locals 0

    .line 35
    invoke-direct {p0}, Lmono/com/ironsource/mediationsdk/sdk/BannerListenerImplementor;->n_onBannerAdClicked()V

    return-void
.end method

.method public onBannerAdLeftApplication()V
    .locals 0

    .line 43
    invoke-direct {p0}, Lmono/com/ironsource/mediationsdk/sdk/BannerListenerImplementor;->n_onBannerAdLeftApplication()V

    return-void
.end method

.method public onBannerAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
    .locals 0

    .line 51
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/sdk/BannerListenerImplementor;->n_onBannerAdLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    return-void
.end method

.method public onBannerAdLoaded()V
    .locals 0

    .line 59
    invoke-direct {p0}, Lmono/com/ironsource/mediationsdk/sdk/BannerListenerImplementor;->n_onBannerAdLoaded()V

    return-void
.end method

.method public onBannerAdScreenDismissed()V
    .locals 0

    .line 67
    invoke-direct {p0}, Lmono/com/ironsource/mediationsdk/sdk/BannerListenerImplementor;->n_onBannerAdScreenDismissed()V

    return-void
.end method

.method public onBannerAdScreenPresented()V
    .locals 0

    .line 75
    invoke-direct {p0}, Lmono/com/ironsource/mediationsdk/sdk/BannerListenerImplementor;->n_onBannerAdScreenPresented()V

    return-void
.end method
