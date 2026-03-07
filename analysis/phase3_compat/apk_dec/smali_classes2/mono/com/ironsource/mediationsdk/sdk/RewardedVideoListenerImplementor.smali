.class public Lmono/com/ironsource/mediationsdk/sdk/RewardedVideoListenerImplementor;
.super Ljava/lang/Object;
.source "RewardedVideoListenerImplementor.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onRewardedVideoAdClicked:(Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdClicked_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdClosed:()V:GetOnRewardedVideoAdClosedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdEnded:()V:GetOnRewardedVideoAdEndedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdOpened:()V:GetOnRewardedVideoAdOpenedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdRewarded:(Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdRewarded_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdShowFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnRewardedVideoAdShowFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdStarted:()V:GetOnRewardedVideoAdStartedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAvailabilityChanged:(Z)V:GetOnRewardedVideoAvailabilityChanged_ZHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 23
    const-class v0, Lmono/com/ironsource/mediationsdk/sdk/RewardedVideoListenerImplementor;

    const-string v1, "Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, "n_onRewardedVideoAdClicked:(Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdClicked_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdClosed:()V:GetOnRewardedVideoAdClosedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdEnded:()V:GetOnRewardedVideoAdEndedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdOpened:()V:GetOnRewardedVideoAdOpenedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdRewarded:(Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdRewarded_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdShowFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnRewardedVideoAdShowFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdStarted:()V:GetOnRewardedVideoAdStartedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAvailabilityChanged:(Z)V:GetOnRewardedVideoAvailabilityChanged_ZHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lmono/com/ironsource/mediationsdk/sdk/RewardedVideoListenerImplementor;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, ""

    .line 31
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onRewardedVideoAdClicked(Lcom/ironsource/mediationsdk/model/Placement;)V
.end method

.method private native n_onRewardedVideoAdClosed()V
.end method

.method private native n_onRewardedVideoAdEnded()V
.end method

.method private native n_onRewardedVideoAdOpened()V
.end method

.method private native n_onRewardedVideoAdRewarded(Lcom/ironsource/mediationsdk/model/Placement;)V
.end method

.method private native n_onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
.end method

.method private native n_onRewardedVideoAdStarted()V
.end method

.method private native n_onRewardedVideoAvailabilityChanged(Z)V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 101
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/sdk/RewardedVideoListenerImplementor;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmono/com/ironsource/mediationsdk/sdk/RewardedVideoListenerImplementor;->refList:Ljava/util/ArrayList;

    .line 103
    :cond_0
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/sdk/RewardedVideoListenerImplementor;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 108
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/sdk/RewardedVideoListenerImplementor;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 109
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onRewardedVideoAdClicked(Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/sdk/RewardedVideoListenerImplementor;->n_onRewardedVideoAdClicked(Lcom/ironsource/mediationsdk/model/Placement;)V

    return-void
.end method

.method public onRewardedVideoAdClosed()V
    .locals 0

    .line 45
    invoke-direct {p0}, Lmono/com/ironsource/mediationsdk/sdk/RewardedVideoListenerImplementor;->n_onRewardedVideoAdClosed()V

    return-void
.end method

.method public onRewardedVideoAdEnded()V
    .locals 0

    .line 53
    invoke-direct {p0}, Lmono/com/ironsource/mediationsdk/sdk/RewardedVideoListenerImplementor;->n_onRewardedVideoAdEnded()V

    return-void
.end method

.method public onRewardedVideoAdOpened()V
    .locals 0

    .line 61
    invoke-direct {p0}, Lmono/com/ironsource/mediationsdk/sdk/RewardedVideoListenerImplementor;->n_onRewardedVideoAdOpened()V

    return-void
.end method

.method public onRewardedVideoAdRewarded(Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 0

    .line 69
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/sdk/RewardedVideoListenerImplementor;->n_onRewardedVideoAdRewarded(Lcom/ironsource/mediationsdk/model/Placement;)V

    return-void
.end method

.method public onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
    .locals 0

    .line 77
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/sdk/RewardedVideoListenerImplementor;->n_onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    return-void
.end method

.method public onRewardedVideoAdStarted()V
    .locals 0

    .line 85
    invoke-direct {p0}, Lmono/com/ironsource/mediationsdk/sdk/RewardedVideoListenerImplementor;->n_onRewardedVideoAdStarted()V

    return-void
.end method

.method public onRewardedVideoAvailabilityChanged(Z)V
    .locals 0

    .line 93
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/sdk/RewardedVideoListenerImplementor;->n_onRewardedVideoAvailabilityChanged(Z)V

    return-void
.end method
