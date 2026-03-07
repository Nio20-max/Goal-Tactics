.class public Lmono/com/ironsource/mediationsdk/INetworkInitCallbackListenerImplementor;
.super Ljava/lang/Object;
.source "INetworkInitCallbackListenerImplementor.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/ironsource/mediationsdk/INetworkInitCallbackListener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onNetworkInitCallbackFailed:(Ljava/lang/String;)V:GetOnNetworkInitCallbackFailed_Ljava_lang_String_Handler:Com.Ironsource.Mediationsdk.INetworkInitCallbackListenerInvoker, IronSource-Android_v7.0.3.1\nn_onNetworkInitCallbackLoadSuccess:(Ljava/lang/String;)V:GetOnNetworkInitCallbackLoadSuccess_Ljava_lang_String_Handler:Com.Ironsource.Mediationsdk.INetworkInitCallbackListenerInvoker, IronSource-Android_v7.0.3.1\nn_onNetworkInitCallbackSuccess:()V:GetOnNetworkInitCallbackSuccessHandler:Com.Ironsource.Mediationsdk.INetworkInitCallbackListenerInvoker, IronSource-Android_v7.0.3.1\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 18
    const-class v0, Lmono/com/ironsource/mediationsdk/INetworkInitCallbackListenerImplementor;

    const-string v1, "Com.Ironsource.Mediationsdk.INetworkInitCallbackListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, "n_onNetworkInitCallbackFailed:(Ljava/lang/String;)V:GetOnNetworkInitCallbackFailed_Ljava_lang_String_Handler:Com.Ironsource.Mediationsdk.INetworkInitCallbackListenerInvoker, IronSource-Android_v7.0.3.1\nn_onNetworkInitCallbackLoadSuccess:(Ljava/lang/String;)V:GetOnNetworkInitCallbackLoadSuccess_Ljava_lang_String_Handler:Com.Ironsource.Mediationsdk.INetworkInitCallbackListenerInvoker, IronSource-Android_v7.0.3.1\nn_onNetworkInitCallbackSuccess:()V:GetOnNetworkInitCallbackSuccessHandler:Com.Ironsource.Mediationsdk.INetworkInitCallbackListenerInvoker, IronSource-Android_v7.0.3.1\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lmono/com/ironsource/mediationsdk/INetworkInitCallbackListenerImplementor;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Com.Ironsource.Mediationsdk.INetworkInitCallbackListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, ""

    .line 26
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onNetworkInitCallbackFailed(Ljava/lang/String;)V
.end method

.method private native n_onNetworkInitCallbackLoadSuccess(Ljava/lang/String;)V
.end method

.method private native n_onNetworkInitCallbackSuccess()V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 56
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/INetworkInitCallbackListenerImplementor;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmono/com/ironsource/mediationsdk/INetworkInitCallbackListenerImplementor;->refList:Ljava/util/ArrayList;

    .line 58
    :cond_0
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/INetworkInitCallbackListenerImplementor;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 63
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/INetworkInitCallbackListenerImplementor;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 64
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onNetworkInitCallbackFailed(Ljava/lang/String;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/INetworkInitCallbackListenerImplementor;->n_onNetworkInitCallbackFailed(Ljava/lang/String;)V

    return-void
.end method

.method public onNetworkInitCallbackLoadSuccess(Ljava/lang/String;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/INetworkInitCallbackListenerImplementor;->n_onNetworkInitCallbackLoadSuccess(Ljava/lang/String;)V

    return-void
.end method

.method public onNetworkInitCallbackSuccess()V
    .locals 0

    .line 48
    invoke-direct {p0}, Lmono/com/ironsource/mediationsdk/INetworkInitCallbackListenerImplementor;->n_onNetworkInitCallbackSuccess()V

    return-void
.end method
