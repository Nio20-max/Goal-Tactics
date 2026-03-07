.class public Lcrc645877ad3d44b9b81b/FacebookAccessTokenTracker;
.super Lcom/facebook/AccessTokenTracker;
.source "FacebookAccessTokenTracker.java"

# interfaces
.implements Lmono/android/IGCUserPeer;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onCurrentAccessTokenChanged:(Lcom/facebook/AccessToken;Lcom/facebook/AccessToken;)V:GetOnCurrentAccessTokenChanged_Lcom_facebook_AccessToken_Lcom_facebook_AccessToken_Handler\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 15
    const-class v0, Lcrc645877ad3d44b9b81b/FacebookAccessTokenTracker;

    const-string v1, "GT.Droid.FacebookAccessTokenTracker, GT.Droid"

    const-string v2, "n_onCurrentAccessTokenChanged:(Lcom/facebook/AccessToken;Lcom/facebook/AccessToken;)V:GetOnCurrentAccessTokenChanged_Lcom_facebook_AccessToken_Lcom_facebook_AccessToken_Handler\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 21
    invoke-direct {p0}, Lcom/facebook/AccessTokenTracker;-><init>()V

    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcrc645877ad3d44b9b81b/FacebookAccessTokenTracker;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "GT.Droid.FacebookAccessTokenTracker, GT.Droid"

    const-string v2, ""

    .line 23
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onCurrentAccessTokenChanged(Lcom/facebook/AccessToken;Lcom/facebook/AccessToken;)V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 37
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/FacebookAccessTokenTracker;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcrc645877ad3d44b9b81b/FacebookAccessTokenTracker;->refList:Ljava/util/ArrayList;

    .line 39
    :cond_0
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/FacebookAccessTokenTracker;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 44
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/FacebookAccessTokenTracker;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 45
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onCurrentAccessTokenChanged(Lcom/facebook/AccessToken;Lcom/facebook/AccessToken;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2}, Lcrc645877ad3d44b9b81b/FacebookAccessTokenTracker;->n_onCurrentAccessTokenChanged(Lcom/facebook/AccessToken;Lcom/facebook/AccessToken;)V

    return-void
.end method
