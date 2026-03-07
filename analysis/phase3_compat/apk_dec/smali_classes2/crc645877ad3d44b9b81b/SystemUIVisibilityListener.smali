.class public Lcrc645877ad3d44b9b81b/SystemUIVisibilityListener;
.super Ljava/lang/Object;
.source "SystemUIVisibilityListener.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Landroid/view/View$OnSystemUiVisibilityChangeListener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onSystemUiVisibilityChange:(I)V:GetOnSystemUiVisibilityChange_IHandler:Android.Views.View/IOnSystemUiVisibilityChangeListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 16
    const-class v0, Lcrc645877ad3d44b9b81b/SystemUIVisibilityListener;

    const-string v1, "GT.Droid.SystemUIVisibilityListener, GT.Droid"

    const-string v2, "n_onSystemUiVisibilityChange:(I)V:GetOnSystemUiVisibilityChange_IHandler:Android.Views.View/IOnSystemUiVisibilityChangeListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcrc645877ad3d44b9b81b/SystemUIVisibilityListener;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "GT.Droid.SystemUIVisibilityListener, GT.Droid"

    const-string v2, ""

    .line 24
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public constructor <init>(Lcrc645877ad3d44b9b81b/MainActivity;)V
    .locals 2

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcrc645877ad3d44b9b81b/SystemUIVisibilityListener;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "GT.Droid.SystemUIVisibilityListener, GT.Droid"

    const-string v1, "GT.Droid.MainActivity, GT.Droid"

    .line 31
    invoke-static {p1, v1, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onSystemUiVisibilityChange(I)V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 45
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/SystemUIVisibilityListener;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcrc645877ad3d44b9b81b/SystemUIVisibilityListener;->refList:Ljava/util/ArrayList;

    .line 47
    :cond_0
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/SystemUIVisibilityListener;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 52
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/SystemUIVisibilityListener;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 53
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onSystemUiVisibilityChange(I)V
    .locals 0

    .line 37
    invoke-direct {p0, p1}, Lcrc645877ad3d44b9b81b/SystemUIVisibilityListener;->n_onSystemUiVisibilityChange(I)V

    return-void
.end method
