.class public Lmono/com/microsoft/appcenter/channel/Channel_GroupListenerImplementor;
.super Ljava/lang/Object;
.source "Channel_GroupListenerImplementor.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/microsoft/appcenter/channel/Channel$GroupListener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onBeforeSending:(Lcom/microsoft/appcenter/ingestion/models/Log;)V:GetOnBeforeSending_Lcom_microsoft_appcenter_ingestion_models_Log_Handler:Com.Microsoft.Appcenter.Channel.IChannelGroupListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onFailure:(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/Exception;)V:GetOnFailure_Lcom_microsoft_appcenter_ingestion_models_Log_Ljava_lang_Exception_Handler:Com.Microsoft.Appcenter.Channel.IChannelGroupListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onSuccess:(Lcom/microsoft/appcenter/ingestion/models/Log;)V:GetOnSuccess_Lcom_microsoft_appcenter_ingestion_models_Log_Handler:Com.Microsoft.Appcenter.Channel.IChannelGroupListenerInvoker, Microsoft.AppCenter.Android.Bindings\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 18
    const-class v0, Lmono/com/microsoft/appcenter/channel/Channel_GroupListenerImplementor;

    const-string v1, "Com.Microsoft.Appcenter.Channel.IChannelGroupListenerImplementor, Microsoft.AppCenter.Android.Bindings"

    const-string v2, "n_onBeforeSending:(Lcom/microsoft/appcenter/ingestion/models/Log;)V:GetOnBeforeSending_Lcom_microsoft_appcenter_ingestion_models_Log_Handler:Com.Microsoft.Appcenter.Channel.IChannelGroupListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onFailure:(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/Exception;)V:GetOnFailure_Lcom_microsoft_appcenter_ingestion_models_Log_Ljava_lang_Exception_Handler:Com.Microsoft.Appcenter.Channel.IChannelGroupListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onSuccess:(Lcom/microsoft/appcenter/ingestion/models/Log;)V:GetOnSuccess_Lcom_microsoft_appcenter_ingestion_models_Log_Handler:Com.Microsoft.Appcenter.Channel.IChannelGroupListenerInvoker, Microsoft.AppCenter.Android.Bindings\n"

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

    const-class v1, Lmono/com/microsoft/appcenter/channel/Channel_GroupListenerImplementor;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Com.Microsoft.Appcenter.Channel.IChannelGroupListenerImplementor, Microsoft.AppCenter.Android.Bindings"

    const-string v2, ""

    .line 26
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onBeforeSending(Lcom/microsoft/appcenter/ingestion/models/Log;)V
.end method

.method private native n_onFailure(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/Exception;)V
.end method

.method private native n_onSuccess(Lcom/microsoft/appcenter/ingestion/models/Log;)V
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 56
    iget-object v0, p0, Lmono/com/microsoft/appcenter/channel/Channel_GroupListenerImplementor;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmono/com/microsoft/appcenter/channel/Channel_GroupListenerImplementor;->refList:Ljava/util/ArrayList;

    .line 58
    :cond_0
    iget-object v0, p0, Lmono/com/microsoft/appcenter/channel/Channel_GroupListenerImplementor;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 63
    iget-object v0, p0, Lmono/com/microsoft/appcenter/channel/Channel_GroupListenerImplementor;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 64
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onBeforeSending(Lcom/microsoft/appcenter/ingestion/models/Log;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1}, Lmono/com/microsoft/appcenter/channel/Channel_GroupListenerImplementor;->n_onBeforeSending(Lcom/microsoft/appcenter/ingestion/models/Log;)V

    return-void
.end method

.method public onFailure(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/Exception;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1, p2}, Lmono/com/microsoft/appcenter/channel/Channel_GroupListenerImplementor;->n_onFailure(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/Exception;)V

    return-void
.end method

.method public onSuccess(Lcom/microsoft/appcenter/ingestion/models/Log;)V
    .locals 0

    .line 48
    invoke-direct {p0, p1}, Lmono/com/microsoft/appcenter/channel/Channel_GroupListenerImplementor;->n_onSuccess(Lcom/microsoft/appcenter/ingestion/models/Log;)V

    return-void
.end method
