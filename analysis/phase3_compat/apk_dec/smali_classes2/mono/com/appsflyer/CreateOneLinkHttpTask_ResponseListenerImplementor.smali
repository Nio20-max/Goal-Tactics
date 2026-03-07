.class public Lmono/com/appsflyer/CreateOneLinkHttpTask_ResponseListenerImplementor;
.super Ljava/lang/Object;
.source "CreateOneLinkHttpTask_ResponseListenerImplementor.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/appsflyer/CreateOneLinkHttpTask$ResponseListener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onResponse:(Ljava/lang/String;)V:GetOnResponse_Ljava_lang_String_Handler:Com.Appsflyer.CreateOneLinkHttpTask/IResponseListenerInvoker, AppsFlyerXamarinBindingAndroid\nn_onResponseError:(Ljava/lang/String;)V:GetOnResponseError_Ljava_lang_String_Handler:Com.Appsflyer.CreateOneLinkHttpTask/IResponseListenerInvoker, AppsFlyerXamarinBindingAndroid\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 17
    const-class v0, Lmono/com/appsflyer/CreateOneLinkHttpTask_ResponseListenerImplementor;

    const-string v1, "Com.Appsflyer.CreateOneLinkHttpTask+IResponseListenerImplementor, AppsFlyerXamarinBindingAndroid"

    const-string v2, "n_onResponse:(Ljava/lang/String;)V:GetOnResponse_Ljava_lang_String_Handler:Com.Appsflyer.CreateOneLinkHttpTask/IResponseListenerInvoker, AppsFlyerXamarinBindingAndroid\nn_onResponseError:(Ljava/lang/String;)V:GetOnResponseError_Ljava_lang_String_Handler:Com.Appsflyer.CreateOneLinkHttpTask/IResponseListenerInvoker, AppsFlyerXamarinBindingAndroid\n"

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

    const-class v1, Lmono/com/appsflyer/CreateOneLinkHttpTask_ResponseListenerImplementor;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Com.Appsflyer.CreateOneLinkHttpTask+IResponseListenerImplementor, AppsFlyerXamarinBindingAndroid"

    const-string v2, ""

    .line 25
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onResponse(Ljava/lang/String;)V
.end method

.method private native n_onResponseError(Ljava/lang/String;)V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 47
    iget-object v0, p0, Lmono/com/appsflyer/CreateOneLinkHttpTask_ResponseListenerImplementor;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmono/com/appsflyer/CreateOneLinkHttpTask_ResponseListenerImplementor;->refList:Ljava/util/ArrayList;

    .line 49
    :cond_0
    iget-object v0, p0, Lmono/com/appsflyer/CreateOneLinkHttpTask_ResponseListenerImplementor;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 54
    iget-object v0, p0, Lmono/com/appsflyer/CreateOneLinkHttpTask_ResponseListenerImplementor;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 55
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onResponse(Ljava/lang/String;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lmono/com/appsflyer/CreateOneLinkHttpTask_ResponseListenerImplementor;->n_onResponse(Ljava/lang/String;)V

    return-void
.end method

.method public onResponseError(Ljava/lang/String;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Lmono/com/appsflyer/CreateOneLinkHttpTask_ResponseListenerImplementor;->n_onResponseError(Ljava/lang/String;)V

    return-void
.end method
