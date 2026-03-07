.class public Lcrc645877ad3d44b9b81b/FacebookCallback;
.super Ljava/lang/Object;
.source "FacebookCallback.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/facebook/FacebookCallback;
.implements Lcom/facebook/GraphRequest$GraphJSONObjectCallback;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onCancel:()V:GetOnCancelHandler:Xamarin.Facebook.IFacebookCallbackInvoker, Xamarin.Facebook.Common.Android\nn_onError:(Lcom/facebook/FacebookException;)V:GetOnError_Lcom_facebook_FacebookException_Handler:Xamarin.Facebook.IFacebookCallbackInvoker, Xamarin.Facebook.Common.Android\nn_onSuccess:(Ljava/lang/Object;)V:GetOnSuccess_Ljava_lang_Object_Handler:Xamarin.Facebook.IFacebookCallbackInvoker, Xamarin.Facebook.Common.Android\nn_onCompleted:(Lorg/json/JSONObject;Lcom/facebook/GraphResponse;)V:GetOnCompleted_Lorg_json_JSONObject_Lcom_facebook_GraphResponse_Handler:Xamarin.Facebook.GraphRequest/IGraphJSONObjectCallbackInvoker, Xamarin.Facebook.Core.Android\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 20
    const-class v0, Lcrc645877ad3d44b9b81b/FacebookCallback;

    const-string v1, "GT.Droid.FacebookCallback, GT.Droid"

    const-string v2, "n_onCancel:()V:GetOnCancelHandler:Xamarin.Facebook.IFacebookCallbackInvoker, Xamarin.Facebook.Common.Android\nn_onError:(Lcom/facebook/FacebookException;)V:GetOnError_Lcom_facebook_FacebookException_Handler:Xamarin.Facebook.IFacebookCallbackInvoker, Xamarin.Facebook.Common.Android\nn_onSuccess:(Ljava/lang/Object;)V:GetOnSuccess_Ljava_lang_Object_Handler:Xamarin.Facebook.IFacebookCallbackInvoker, Xamarin.Facebook.Common.Android\nn_onCompleted:(Lorg/json/JSONObject;Lcom/facebook/GraphResponse;)V:GetOnCompleted_Lorg_json_JSONObject_Lcom_facebook_GraphResponse_Handler:Xamarin.Facebook.GraphRequest/IGraphJSONObjectCallbackInvoker, Xamarin.Facebook.Core.Android\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcrc645877ad3d44b9b81b/FacebookCallback;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "GT.Droid.FacebookCallback, GT.Droid"

    const-string v2, ""

    .line 28
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onCancel()V
.end method

.method private native n_onCompleted(Lorg/json/JSONObject;Lcom/facebook/GraphResponse;)V
.end method

.method private native n_onError(Lcom/facebook/FacebookException;)V
.end method

.method private native n_onSuccess(Ljava/lang/Object;)V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 66
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/FacebookCallback;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcrc645877ad3d44b9b81b/FacebookCallback;->refList:Ljava/util/ArrayList;

    .line 68
    :cond_0
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/FacebookCallback;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 73
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/FacebookCallback;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 74
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onCancel()V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcrc645877ad3d44b9b81b/FacebookCallback;->n_onCancel()V

    return-void
.end method

.method public onCompleted(Lorg/json/JSONObject;Lcom/facebook/GraphResponse;)V
    .locals 0

    .line 58
    invoke-direct {p0, p1, p2}, Lcrc645877ad3d44b9b81b/FacebookCallback;->n_onCompleted(Lorg/json/JSONObject;Lcom/facebook/GraphResponse;)V

    return-void
.end method

.method public onError(Lcom/facebook/FacebookException;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1}, Lcrc645877ad3d44b9b81b/FacebookCallback;->n_onError(Lcom/facebook/FacebookException;)V

    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 50
    invoke-direct {p0, p1}, Lcrc645877ad3d44b9b81b/FacebookCallback;->n_onSuccess(Ljava/lang/Object;)V

    return-void
.end method
