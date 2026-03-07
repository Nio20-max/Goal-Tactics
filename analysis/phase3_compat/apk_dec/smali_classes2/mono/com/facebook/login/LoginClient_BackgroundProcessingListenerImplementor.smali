.class public Lmono/com/facebook/login/LoginClient_BackgroundProcessingListenerImplementor;
.super Ljava/lang/Object;
.source "LoginClient_BackgroundProcessingListenerImplementor.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/facebook/login/LoginClient$BackgroundProcessingListener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onBackgroundProcessingStarted:()V:GetOnBackgroundProcessingStartedHandler:Xamarin.Facebook.Login.LoginClient/IBackgroundProcessingListenerInvoker, Xamarin.Facebook.Common.Android\nn_onBackgroundProcessingStopped:()V:GetOnBackgroundProcessingStoppedHandler:Xamarin.Facebook.Login.LoginClient/IBackgroundProcessingListenerInvoker, Xamarin.Facebook.Common.Android\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 17
    const-class v0, Lmono/com/facebook/login/LoginClient_BackgroundProcessingListenerImplementor;

    const-string v1, "Xamarin.Facebook.Login.LoginClient+IBackgroundProcessingListenerImplementor, Xamarin.Facebook.Common.Android"

    const-string v2, "n_onBackgroundProcessingStarted:()V:GetOnBackgroundProcessingStartedHandler:Xamarin.Facebook.Login.LoginClient/IBackgroundProcessingListenerInvoker, Xamarin.Facebook.Common.Android\nn_onBackgroundProcessingStopped:()V:GetOnBackgroundProcessingStoppedHandler:Xamarin.Facebook.Login.LoginClient/IBackgroundProcessingListenerInvoker, Xamarin.Facebook.Common.Android\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lmono/com/facebook/login/LoginClient_BackgroundProcessingListenerImplementor;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Xamarin.Facebook.Login.LoginClient+IBackgroundProcessingListenerImplementor, Xamarin.Facebook.Common.Android"

    const-string v2, ""

    .line 25
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onBackgroundProcessingStarted()V
.end method

.method private native n_onBackgroundProcessingStopped()V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 47
    iget-object v0, p0, Lmono/com/facebook/login/LoginClient_BackgroundProcessingListenerImplementor;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmono/com/facebook/login/LoginClient_BackgroundProcessingListenerImplementor;->refList:Ljava/util/ArrayList;

    .line 49
    :cond_0
    iget-object v0, p0, Lmono/com/facebook/login/LoginClient_BackgroundProcessingListenerImplementor;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 54
    iget-object v0, p0, Lmono/com/facebook/login/LoginClient_BackgroundProcessingListenerImplementor;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 55
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onBackgroundProcessingStarted()V
    .locals 0

    .line 31
    invoke-direct {p0}, Lmono/com/facebook/login/LoginClient_BackgroundProcessingListenerImplementor;->n_onBackgroundProcessingStarted()V

    return-void
.end method

.method public onBackgroundProcessingStopped()V
    .locals 0

    .line 39
    invoke-direct {p0}, Lmono/com/facebook/login/LoginClient_BackgroundProcessingListenerImplementor;->n_onBackgroundProcessingStopped()V

    return-void
.end method
