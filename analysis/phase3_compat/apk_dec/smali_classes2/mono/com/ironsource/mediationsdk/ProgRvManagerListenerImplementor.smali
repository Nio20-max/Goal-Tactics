.class public Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;
.super Ljava/lang/Object;
.source "ProgRvManagerListenerImplementor.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/ironsource/mediationsdk/ProgRvManagerListener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onLoadError:(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V:GetOnLoadError_Lcom_ironsource_mediationsdk_ProgRvSmash_Ljava_lang_String_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onLoadSuccess:(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V:GetOnLoadSuccess_Lcom_ironsource_mediationsdk_ProgRvSmash_Ljava_lang_String_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdClicked:(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdClicked_Lcom_ironsource_mediationsdk_ProgRvSmash_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdClosed:(Lcom/ironsource/mediationsdk/ProgRvSmash;)V:GetOnRewardedVideoAdClosed_Lcom_ironsource_mediationsdk_ProgRvSmash_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdEnded:(Lcom/ironsource/mediationsdk/ProgRvSmash;)V:GetOnRewardedVideoAdEnded_Lcom_ironsource_mediationsdk_ProgRvSmash_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdOpened:(Lcom/ironsource/mediationsdk/ProgRvSmash;)V:GetOnRewardedVideoAdOpened_Lcom_ironsource_mediationsdk_ProgRvSmash_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdRewarded:(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdRewarded_Lcom_ironsource_mediationsdk_ProgRvSmash_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdShowFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgRvSmash;)V:GetOnRewardedVideoAdShowFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Lcom_ironsource_mediationsdk_ProgRvSmash_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdStarted:(Lcom/ironsource/mediationsdk/ProgRvSmash;)V:GetOnRewardedVideoAdStarted_Lcom_ironsource_mediationsdk_ProgRvSmash_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 24
    const-class v0, Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;

    const-string v1, "Com.Ironsource.Mediationsdk.IProgRvManagerListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, "n_onLoadError:(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V:GetOnLoadError_Lcom_ironsource_mediationsdk_ProgRvSmash_Ljava_lang_String_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onLoadSuccess:(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V:GetOnLoadSuccess_Lcom_ironsource_mediationsdk_ProgRvSmash_Ljava_lang_String_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdClicked:(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdClicked_Lcom_ironsource_mediationsdk_ProgRvSmash_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdClosed:(Lcom/ironsource/mediationsdk/ProgRvSmash;)V:GetOnRewardedVideoAdClosed_Lcom_ironsource_mediationsdk_ProgRvSmash_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdEnded:(Lcom/ironsource/mediationsdk/ProgRvSmash;)V:GetOnRewardedVideoAdEnded_Lcom_ironsource_mediationsdk_ProgRvSmash_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdOpened:(Lcom/ironsource/mediationsdk/ProgRvSmash;)V:GetOnRewardedVideoAdOpened_Lcom_ironsource_mediationsdk_ProgRvSmash_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdRewarded:(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdRewarded_Lcom_ironsource_mediationsdk_ProgRvSmash_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdShowFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgRvSmash;)V:GetOnRewardedVideoAdShowFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Lcom_ironsource_mediationsdk_ProgRvSmash_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdStarted:(Lcom/ironsource/mediationsdk/ProgRvSmash;)V:GetOnRewardedVideoAdStarted_Lcom_ironsource_mediationsdk_ProgRvSmash_Handler:Com.Ironsource.Mediationsdk.IProgRvManagerListenerInvoker, IronSource-Android_v7.0.3.1\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Com.Ironsource.Mediationsdk.IProgRvManagerListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, ""

    .line 32
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onLoadError(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V
.end method

.method private native n_onLoadSuccess(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V
.end method

.method private native n_onRewardedVideoAdClicked(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V
.end method

.method private native n_onRewardedVideoAdClosed(Lcom/ironsource/mediationsdk/ProgRvSmash;)V
.end method

.method private native n_onRewardedVideoAdEnded(Lcom/ironsource/mediationsdk/ProgRvSmash;)V
.end method

.method private native n_onRewardedVideoAdOpened(Lcom/ironsource/mediationsdk/ProgRvSmash;)V
.end method

.method private native n_onRewardedVideoAdRewarded(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V
.end method

.method private native n_onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgRvSmash;)V
.end method

.method private native n_onRewardedVideoAdStarted(Lcom/ironsource/mediationsdk/ProgRvSmash;)V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 110
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 111
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;->refList:Ljava/util/ArrayList;

    .line 112
    :cond_0
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 117
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 118
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onLoadError(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1, p2}, Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;->n_onLoadError(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V

    return-void
.end method

.method public onLoadSuccess(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1, p2}, Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;->n_onLoadSuccess(Lcom/ironsource/mediationsdk/ProgRvSmash;Ljava/lang/String;)V

    return-void
.end method

.method public onRewardedVideoAdClicked(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 0

    .line 54
    invoke-direct {p0, p1, p2}, Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;->n_onRewardedVideoAdClicked(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V

    return-void
.end method

.method public onRewardedVideoAdClosed(Lcom/ironsource/mediationsdk/ProgRvSmash;)V
    .locals 0

    .line 62
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;->n_onRewardedVideoAdClosed(Lcom/ironsource/mediationsdk/ProgRvSmash;)V

    return-void
.end method

.method public onRewardedVideoAdEnded(Lcom/ironsource/mediationsdk/ProgRvSmash;)V
    .locals 0

    .line 70
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;->n_onRewardedVideoAdEnded(Lcom/ironsource/mediationsdk/ProgRvSmash;)V

    return-void
.end method

.method public onRewardedVideoAdOpened(Lcom/ironsource/mediationsdk/ProgRvSmash;)V
    .locals 0

    .line 78
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;->n_onRewardedVideoAdOpened(Lcom/ironsource/mediationsdk/ProgRvSmash;)V

    return-void
.end method

.method public onRewardedVideoAdRewarded(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 0

    .line 86
    invoke-direct {p0, p1, p2}, Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;->n_onRewardedVideoAdRewarded(Lcom/ironsource/mediationsdk/ProgRvSmash;Lcom/ironsource/mediationsdk/model/Placement;)V

    return-void
.end method

.method public onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgRvSmash;)V
    .locals 0

    .line 94
    invoke-direct {p0, p1, p2}, Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;->n_onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgRvSmash;)V

    return-void
.end method

.method public onRewardedVideoAdStarted(Lcom/ironsource/mediationsdk/ProgRvSmash;)V
    .locals 0

    .line 102
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/ProgRvManagerListenerImplementor;->n_onRewardedVideoAdStarted(Lcom/ironsource/mediationsdk/ProgRvSmash;)V

    return-void
.end method
