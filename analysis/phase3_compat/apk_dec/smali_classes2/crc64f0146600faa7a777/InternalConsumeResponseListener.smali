.class public Lcrc64f0146600faa7a777/InternalConsumeResponseListener;
.super Ljava/lang/Object;
.source "InternalConsumeResponseListener.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/android/billingclient/api/ConsumeResponseListener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onConsumeResponse:(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V:GetOnConsumeResponse_Lcom_android_billingclient_api_BillingResult_Ljava_lang_String_Handler:Android.BillingClient.Api.IConsumeResponseListenerInvoker, Xamarin.Android.Google.BillingClient\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 16
    const-class v0, Lcrc64f0146600faa7a777/InternalConsumeResponseListener;

    const-string v1, "Android.BillingClient.Api.InternalConsumeResponseListener, Xamarin.Android.Google.BillingClient"

    const-string v2, "n_onConsumeResponse:(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V:GetOnConsumeResponse_Lcom_android_billingclient_api_BillingResult_Ljava_lang_String_Handler:Android.BillingClient.Api.IConsumeResponseListenerInvoker, Xamarin.Android.Google.BillingClient\n"

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

    const-class v1, Lcrc64f0146600faa7a777/InternalConsumeResponseListener;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Android.BillingClient.Api.InternalConsumeResponseListener, Xamarin.Android.Google.BillingClient"

    const-string v2, ""

    .line 24
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onConsumeResponse(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 38
    iget-object v0, p0, Lcrc64f0146600faa7a777/InternalConsumeResponseListener;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcrc64f0146600faa7a777/InternalConsumeResponseListener;->refList:Ljava/util/ArrayList;

    .line 40
    :cond_0
    iget-object v0, p0, Lcrc64f0146600faa7a777/InternalConsumeResponseListener;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 45
    iget-object v0, p0, Lcrc64f0146600faa7a777/InternalConsumeResponseListener;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 46
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onConsumeResponse(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2}, Lcrc64f0146600faa7a777/InternalConsumeResponseListener;->n_onConsumeResponse(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V

    return-void
.end method
