.class public Lcrc645877ad3d44b9b81b/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/ironsource/mediationsdk/sdk/RewardedVideoListener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onCreate:(Landroid/os/Bundle;)V:GetOnCreate_Landroid_os_Bundle_Handler\nn_onWindowFocusChanged:(Z)V:GetOnWindowFocusChanged_ZHandler\nn_onNewIntent:(Landroid/content/Intent;)V:GetOnNewIntent_Landroid_content_Intent_Handler\nn_onActivityResult:(IILandroid/content/Intent;)V:GetOnActivityResult_IILandroid_content_Intent_Handler\nn_onRequestPermissionsResult:(I[Ljava/lang/String;[I)V:GetOnRequestPermissionsResult_IarrayLjava_lang_String_arrayIHandler\nn_onPause:()V:GetOnPauseHandler\nn_onResume:()V:GetOnResumeHandler\nn_onBackPressed:()V:GetOnBackPressedHandler\nn_onRewardedVideoAdClicked:(Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdClicked_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdClosed:()V:GetOnRewardedVideoAdClosedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdEnded:()V:GetOnRewardedVideoAdEndedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdOpened:()V:GetOnRewardedVideoAdOpenedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdRewarded:(Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdRewarded_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdShowFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnRewardedVideoAdShowFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdStarted:()V:GetOnRewardedVideoAdStartedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAvailabilityChanged:(Z)V:GetOnRewardedVideoAvailabilityChanged_ZHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 31
    const-class v0, Lcrc645877ad3d44b9b81b/MainActivity;

    const-string v1, "GT.Droid.MainActivity, GT.Droid"

    const-string v2, "n_onCreate:(Landroid/os/Bundle;)V:GetOnCreate_Landroid_os_Bundle_Handler\nn_onWindowFocusChanged:(Z)V:GetOnWindowFocusChanged_ZHandler\nn_onNewIntent:(Landroid/content/Intent;)V:GetOnNewIntent_Landroid_content_Intent_Handler\nn_onActivityResult:(IILandroid/content/Intent;)V:GetOnActivityResult_IILandroid_content_Intent_Handler\nn_onRequestPermissionsResult:(I[Ljava/lang/String;[I)V:GetOnRequestPermissionsResult_IarrayLjava_lang_String_arrayIHandler\nn_onPause:()V:GetOnPauseHandler\nn_onResume:()V:GetOnResumeHandler\nn_onBackPressed:()V:GetOnBackPressedHandler\nn_onRewardedVideoAdClicked:(Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdClicked_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdClosed:()V:GetOnRewardedVideoAdClosedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdEnded:()V:GetOnRewardedVideoAdEndedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdOpened:()V:GetOnRewardedVideoAdOpenedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdRewarded:(Lcom/ironsource/mediationsdk/model/Placement;)V:GetOnRewardedVideoAdRewarded_Lcom_ironsource_mediationsdk_model_Placement_Handler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdShowFailed:(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V:GetOnRewardedVideoAdShowFailed_Lcom_ironsource_mediationsdk_logger_IronSourceError_Handler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAdStarted:()V:GetOnRewardedVideoAdStartedHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\nn_onRewardedVideoAvailabilityChanged:(Z)V:GetOnRewardedVideoAvailabilityChanged_ZHandler:Com.Ironsource.Mediationsdk.Sdk.IRewardedVideoListenerInvoker, IronSource-Android_v7.0.3.1\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 37
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 38
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcrc645877ad3d44b9b81b/MainActivity;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "GT.Droid.MainActivity, GT.Droid"

    const-string v2, ""

    .line 39
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 45
    invoke-direct {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;-><init>(I)V

    .line 46
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcrc645877ad3d44b9b81b/MainActivity;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 47
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v0, v1

    const-string p1, "GT.Droid.MainActivity, GT.Droid"

    const-string v1, "System.Int32, mscorlib"

    invoke-static {p1, v1, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onActivityResult(IILandroid/content/Intent;)V
.end method

.method private native n_onBackPressed()V
.end method

.method private native n_onCreate(Landroid/os/Bundle;)V
.end method

.method private native n_onNewIntent(Landroid/content/Intent;)V
.end method

.method private native n_onPause()V
.end method

.method private native n_onRequestPermissionsResult(I[Ljava/lang/String;[I)V
.end method

.method private native n_onResume()V
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

.method private native n_onWindowFocusChanged(Z)V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 181
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/MainActivity;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 182
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcrc645877ad3d44b9b81b/MainActivity;->refList:Ljava/util/ArrayList;

    .line 183
    :cond_0
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/MainActivity;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 188
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/MainActivity;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 189
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 77
    invoke-direct {p0, p1, p2, p3}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 109
    invoke-direct {p0}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onBackPressed()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 53
    invoke-direct {p0, p1}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 69
    invoke-direct {p0, p1}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onNewIntent(Landroid/content/Intent;)V

    return-void
.end method

.method public onPause()V
    .locals 0

    .line 93
    invoke-direct {p0}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onPause()V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0

    .line 85
    invoke-direct {p0, p1, p2, p3}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    return-void
.end method

.method public onResume()V
    .locals 0

    .line 101
    invoke-direct {p0}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onResume()V

    return-void
.end method

.method public onRewardedVideoAdClicked(Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 0

    .line 117
    invoke-direct {p0, p1}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onRewardedVideoAdClicked(Lcom/ironsource/mediationsdk/model/Placement;)V

    return-void
.end method

.method public onRewardedVideoAdClosed()V
    .locals 0

    .line 125
    invoke-direct {p0}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onRewardedVideoAdClosed()V

    return-void
.end method

.method public onRewardedVideoAdEnded()V
    .locals 0

    .line 133
    invoke-direct {p0}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onRewardedVideoAdEnded()V

    return-void
.end method

.method public onRewardedVideoAdOpened()V
    .locals 0

    .line 141
    invoke-direct {p0}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onRewardedVideoAdOpened()V

    return-void
.end method

.method public onRewardedVideoAdRewarded(Lcom/ironsource/mediationsdk/model/Placement;)V
    .locals 0

    .line 149
    invoke-direct {p0, p1}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onRewardedVideoAdRewarded(Lcom/ironsource/mediationsdk/model/Placement;)V

    return-void
.end method

.method public onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V
    .locals 0

    .line 157
    invoke-direct {p0, p1}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onRewardedVideoAdShowFailed(Lcom/ironsource/mediationsdk/logger/IronSourceError;)V

    return-void
.end method

.method public onRewardedVideoAdStarted()V
    .locals 0

    .line 165
    invoke-direct {p0}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onRewardedVideoAdStarted()V

    return-void
.end method

.method public onRewardedVideoAvailabilityChanged(Z)V
    .locals 0

    .line 173
    invoke-direct {p0, p1}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onRewardedVideoAvailabilityChanged(Z)V

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 61
    invoke-direct {p0, p1}, Lcrc645877ad3d44b9b81b/MainActivity;->n_onWindowFocusChanged(Z)V

    return-void
.end method
