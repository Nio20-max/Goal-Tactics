.class public Lmono/com/ironsource/mediationsdk/ProgBannerManagerListenerImplementor;
.super Ljava/lang/Object;
.source "ProgBannerManagerListenerImplementor.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/ironsource/mediationsdk/ProgBannerManagerListener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onBannerClicked:(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V:GetOnBannerClicked_Lcom_ironsource_mediationsdk_ProgBannerSmash_Handler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerLeftApplication:(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V:GetOnBannerLeftApplication_Lcom_ironsource_mediationsdk_ProgBannerSmash_Handler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerLoadFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgBannerSmash;Z)V:GetOnBannerLoadFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Lcom_ironsource_mediationsdk_ProgBannerSmash_ZHandler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerLoadSuccess:(Lcom/ironsource/mediationsdk/ProgBannerSmash;Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;)V:GetOnBannerLoadSuccess_Lcom_ironsource_mediationsdk_ProgBannerSmash_Landroid_view_View_Landroid_widget_FrameLayout_LayoutParams_Handler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerScreenDismissed:(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V:GetOnBannerScreenDismissed_Lcom_ironsource_mediationsdk_ProgBannerSmash_Handler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerScreenPresented:(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V:GetOnBannerScreenPresented_Lcom_ironsource_mediationsdk_ProgBannerSmash_Handler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 21
    const-class v0, Lmono/com/ironsource/mediationsdk/ProgBannerManagerListenerImplementor;

    const-string v1, "Com.Ironsource.Mediationsdk.IProgBannerManagerListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, "n_onBannerClicked:(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V:GetOnBannerClicked_Lcom_ironsource_mediationsdk_ProgBannerSmash_Handler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerLeftApplication:(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V:GetOnBannerLeftApplication_Lcom_ironsource_mediationsdk_ProgBannerSmash_Handler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerLoadFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgBannerSmash;Z)V:GetOnBannerLoadFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Lcom_ironsource_mediationsdk_ProgBannerSmash_ZHandler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerLoadSuccess:(Lcom/ironsource/mediationsdk/ProgBannerSmash;Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;)V:GetOnBannerLoadSuccess_Lcom_ironsource_mediationsdk_ProgBannerSmash_Landroid_view_View_Landroid_widget_FrameLayout_LayoutParams_Handler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerScreenDismissed:(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V:GetOnBannerScreenDismissed_Lcom_ironsource_mediationsdk_ProgBannerSmash_Handler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\nn_onBannerScreenPresented:(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V:GetOnBannerScreenPresented_Lcom_ironsource_mediationsdk_ProgBannerSmash_Handler:Com.Ironsource.Mediationsdk.IProgBannerManagerListenerInvoker, IronSource-Android_v7.0.3.1\n"

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

    const-class v1, Lmono/com/ironsource/mediationsdk/ProgBannerManagerListenerImplementor;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Com.Ironsource.Mediationsdk.IProgBannerManagerListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, ""

    .line 29
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onBannerClicked(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V
.end method

.method private native n_onBannerLeftApplication(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V
.end method

.method private native n_onBannerLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgBannerSmash;Z)V
.end method

.method private native n_onBannerLoadSuccess(Lcom/ironsource/mediationsdk/ProgBannerSmash;Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;)V
.end method

.method private native n_onBannerScreenDismissed(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V
.end method

.method private native n_onBannerScreenPresented(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 83
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/ProgBannerManagerListenerImplementor;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmono/com/ironsource/mediationsdk/ProgBannerManagerListenerImplementor;->refList:Ljava/util/ArrayList;

    .line 85
    :cond_0
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/ProgBannerManagerListenerImplementor;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 90
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/ProgBannerManagerListenerImplementor;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 91
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onBannerClicked(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/ProgBannerManagerListenerImplementor;->n_onBannerClicked(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V

    return-void
.end method

.method public onBannerLeftApplication(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/ProgBannerManagerListenerImplementor;->n_onBannerLeftApplication(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V

    return-void
.end method

.method public onBannerLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgBannerSmash;Z)V
    .locals 0

    .line 51
    invoke-direct {p0, p1, p2, p3}, Lmono/com/ironsource/mediationsdk/ProgBannerManagerListenerImplementor;->n_onBannerLoadFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;Lcom/ironsource/mediationsdk/ProgBannerSmash;Z)V

    return-void
.end method

.method public onBannerLoadSuccess(Lcom/ironsource/mediationsdk/ProgBannerSmash;Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 0

    .line 59
    invoke-direct {p0, p1, p2, p3}, Lmono/com/ironsource/mediationsdk/ProgBannerManagerListenerImplementor;->n_onBannerLoadSuccess(Lcom/ironsource/mediationsdk/ProgBannerSmash;Landroid/view/View;Landroid/widget/FrameLayout$LayoutParams;)V

    return-void
.end method

.method public onBannerScreenDismissed(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V
    .locals 0

    .line 67
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/ProgBannerManagerListenerImplementor;->n_onBannerScreenDismissed(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V

    return-void
.end method

.method public onBannerScreenPresented(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V
    .locals 0

    .line 75
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/ProgBannerManagerListenerImplementor;->n_onBannerScreenPresented(Lcom/ironsource/mediationsdk/ProgBannerSmash;)V

    return-void
.end method
