.class public Lcrc64350623dcb797cc38/AndroidHttpClientAdapter;
.super Ljava/lang/Object;
.source "AndroidHttpClientAdapter.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/microsoft/appcenter/http/HttpClient;
.implements Ljava/io/Closeable;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_callAsync:(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/microsoft/appcenter/http/HttpClient$CallTemplate;Lcom/microsoft/appcenter/http/ServiceCallback;)Lcom/microsoft/appcenter/http/ServiceCall;:GetCallAsync_Ljava_lang_String_Ljava_lang_String_Ljava_util_Map_Lcom_microsoft_appcenter_http_HttpClient_CallTemplate_Lcom_microsoft_appcenter_http_ServiceCallback_Handler:Com.Microsoft.Appcenter.Http.IAndroidHttpClientInvoker, Microsoft.AppCenter.Android.Bindings\nn_reopen:()V:GetReopenHandler:Com.Microsoft.Appcenter.Http.IAndroidHttpClientInvoker, Microsoft.AppCenter.Android.Bindings\nn_close:()V:GetCloseHandler:Java.IO.ICloseableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 19
    const-class v0, Lcrc64350623dcb797cc38/AndroidHttpClientAdapter;

    const-string v1, "Microsoft.AppCenter.AndroidHttpClientAdapter, Microsoft.AppCenter"

    const-string v2, "n_callAsync:(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/microsoft/appcenter/http/HttpClient$CallTemplate;Lcom/microsoft/appcenter/http/ServiceCallback;)Lcom/microsoft/appcenter/http/ServiceCall;:GetCallAsync_Ljava_lang_String_Ljava_lang_String_Ljava_util_Map_Lcom_microsoft_appcenter_http_HttpClient_CallTemplate_Lcom_microsoft_appcenter_http_ServiceCallback_Handler:Com.Microsoft.Appcenter.Http.IAndroidHttpClientInvoker, Microsoft.AppCenter.Android.Bindings\nn_reopen:()V:GetReopenHandler:Com.Microsoft.Appcenter.Http.IAndroidHttpClientInvoker, Microsoft.AppCenter.Android.Bindings\nn_close:()V:GetCloseHandler:Java.IO.ICloseableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcrc64350623dcb797cc38/AndroidHttpClientAdapter;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Microsoft.AppCenter.AndroidHttpClientAdapter, Microsoft.AppCenter"

    const-string v2, ""

    .line 27
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_callAsync(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/microsoft/appcenter/http/HttpClient$CallTemplate;Lcom/microsoft/appcenter/http/ServiceCallback;)Lcom/microsoft/appcenter/http/ServiceCall;
.end method

.method private native n_close()V
.end method

.method private native n_reopen()V
.end method


# virtual methods
.method public callAsync(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/microsoft/appcenter/http/HttpClient$CallTemplate;Lcom/microsoft/appcenter/http/ServiceCallback;)Lcom/microsoft/appcenter/http/ServiceCall;
    .locals 0

    .line 33
    invoke-direct/range {p0 .. p5}, Lcrc64350623dcb797cc38/AndroidHttpClientAdapter;->n_callAsync(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/microsoft/appcenter/http/HttpClient$CallTemplate;Lcom/microsoft/appcenter/http/ServiceCallback;)Lcom/microsoft/appcenter/http/ServiceCall;

    move-result-object p1

    return-object p1
.end method

.method public close()V
    .locals 0

    .line 49
    invoke-direct {p0}, Lcrc64350623dcb797cc38/AndroidHttpClientAdapter;->n_close()V

    return-void
.end method

.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 57
    iget-object v0, p0, Lcrc64350623dcb797cc38/AndroidHttpClientAdapter;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcrc64350623dcb797cc38/AndroidHttpClientAdapter;->refList:Ljava/util/ArrayList;

    .line 59
    :cond_0
    iget-object v0, p0, Lcrc64350623dcb797cc38/AndroidHttpClientAdapter;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 64
    iget-object v0, p0, Lcrc64350623dcb797cc38/AndroidHttpClientAdapter;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 65
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public reopen()V
    .locals 0

    .line 41
    invoke-direct {p0}, Lcrc64350623dcb797cc38/AndroidHttpClientAdapter;->n_reopen()V

    return-void
.end method
