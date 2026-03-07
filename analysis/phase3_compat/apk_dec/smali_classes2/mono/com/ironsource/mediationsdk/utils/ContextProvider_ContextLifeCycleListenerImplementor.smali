.class public Lmono/com/ironsource/mediationsdk/utils/ContextProvider_ContextLifeCycleListenerImplementor;
.super Ljava/lang/Object;
.source "ContextProvider_ContextLifeCycleListenerImplementor.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/ironsource/mediationsdk/utils/ContextProvider$ContextLifeCycleListener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onPause:(Landroid/app/Activity;)V:GetOnPause_Landroid_app_Activity_Handler:Com.Ironsource.Mediationsdk.Utils.ContextProvider/IContextLifeCycleListenerInvoker, IronSource-Android_v7.0.3.1\nn_onResume:(Landroid/app/Activity;)V:GetOnResume_Landroid_app_Activity_Handler:Com.Ironsource.Mediationsdk.Utils.ContextProvider/IContextLifeCycleListenerInvoker, IronSource-Android_v7.0.3.1\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 17
    const-class v0, Lmono/com/ironsource/mediationsdk/utils/ContextProvider_ContextLifeCycleListenerImplementor;

    const-string v1, "Com.Ironsource.Mediationsdk.Utils.ContextProvider+IContextLifeCycleListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, "n_onPause:(Landroid/app/Activity;)V:GetOnPause_Landroid_app_Activity_Handler:Com.Ironsource.Mediationsdk.Utils.ContextProvider/IContextLifeCycleListenerInvoker, IronSource-Android_v7.0.3.1\nn_onResume:(Landroid/app/Activity;)V:GetOnResume_Landroid_app_Activity_Handler:Com.Ironsource.Mediationsdk.Utils.ContextProvider/IContextLifeCycleListenerInvoker, IronSource-Android_v7.0.3.1\n"

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

    const-class v1, Lmono/com/ironsource/mediationsdk/utils/ContextProvider_ContextLifeCycleListenerImplementor;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Com.Ironsource.Mediationsdk.Utils.ContextProvider+IContextLifeCycleListenerImplementor, IronSource-Android_v7.0.3.1"

    const-string v2, ""

    .line 25
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onPause(Landroid/app/Activity;)V
.end method

.method private native n_onResume(Landroid/app/Activity;)V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 47
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/utils/ContextProvider_ContextLifeCycleListenerImplementor;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmono/com/ironsource/mediationsdk/utils/ContextProvider_ContextLifeCycleListenerImplementor;->refList:Ljava/util/ArrayList;

    .line 49
    :cond_0
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/utils/ContextProvider_ContextLifeCycleListenerImplementor;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 54
    iget-object v0, p0, Lmono/com/ironsource/mediationsdk/utils/ContextProvider_ContextLifeCycleListenerImplementor;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 55
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onPause(Landroid/app/Activity;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/utils/ContextProvider_ContextLifeCycleListenerImplementor;->n_onPause(Landroid/app/Activity;)V

    return-void
.end method

.method public onResume(Landroid/app/Activity;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Lmono/com/ironsource/mediationsdk/utils/ContextProvider_ContextLifeCycleListenerImplementor;->n_onResume(Landroid/app/Activity;)V

    return-void
.end method
