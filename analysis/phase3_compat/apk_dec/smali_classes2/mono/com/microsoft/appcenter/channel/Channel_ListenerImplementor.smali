.class public Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;
.super Ljava/lang/Object;
.source "Channel_ListenerImplementor.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/microsoft/appcenter/channel/Channel$Listener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_onClear:(Ljava/lang/String;)V:GetOnClear_Ljava_lang_String_Handler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onGloballyEnabled:(Z)V:GetOnGloballyEnabled_ZHandler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onGroupAdded:(Ljava/lang/String;Lcom/microsoft/appcenter/channel/Channel$GroupListener;J)V:GetOnGroupAdded_Ljava_lang_String_Lcom_microsoft_appcenter_channel_Channel_GroupListener_JHandler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onGroupRemoved:(Ljava/lang/String;)V:GetOnGroupRemoved_Ljava_lang_String_Handler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onPaused:(Ljava/lang/String;Ljava/lang/String;)V:GetOnPaused_Ljava_lang_String_Ljava_lang_String_Handler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onPreparedLog:(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/String;I)V:GetOnPreparedLog_Lcom_microsoft_appcenter_ingestion_models_Log_Ljava_lang_String_IHandler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onPreparingLog:(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/String;)V:GetOnPreparingLog_Lcom_microsoft_appcenter_ingestion_models_Log_Ljava_lang_String_Handler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onResumed:(Ljava/lang/String;Ljava/lang/String;)V:GetOnResumed_Ljava_lang_String_Ljava_lang_String_Handler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_shouldFilter:(Lcom/microsoft/appcenter/ingestion/models/Log;)Z:GetShouldFilter_Lcom_microsoft_appcenter_ingestion_models_Log_Handler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 24
    const-class v0, Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;

    const-string v1, "Com.Microsoft.Appcenter.Channel.IChannelListenerImplementor, Microsoft.AppCenter.Android.Bindings"

    const-string v2, "n_onClear:(Ljava/lang/String;)V:GetOnClear_Ljava_lang_String_Handler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onGloballyEnabled:(Z)V:GetOnGloballyEnabled_ZHandler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onGroupAdded:(Ljava/lang/String;Lcom/microsoft/appcenter/channel/Channel$GroupListener;J)V:GetOnGroupAdded_Ljava_lang_String_Lcom_microsoft_appcenter_channel_Channel_GroupListener_JHandler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onGroupRemoved:(Ljava/lang/String;)V:GetOnGroupRemoved_Ljava_lang_String_Handler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onPaused:(Ljava/lang/String;Ljava/lang/String;)V:GetOnPaused_Ljava_lang_String_Ljava_lang_String_Handler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onPreparedLog:(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/String;I)V:GetOnPreparedLog_Lcom_microsoft_appcenter_ingestion_models_Log_Ljava_lang_String_IHandler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onPreparingLog:(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/String;)V:GetOnPreparingLog_Lcom_microsoft_appcenter_ingestion_models_Log_Ljava_lang_String_Handler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_onResumed:(Ljava/lang/String;Ljava/lang/String;)V:GetOnResumed_Ljava_lang_String_Ljava_lang_String_Handler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\nn_shouldFilter:(Lcom/microsoft/appcenter/ingestion/models/Log;)Z:GetShouldFilter_Lcom_microsoft_appcenter_ingestion_models_Log_Handler:Com.Microsoft.Appcenter.Channel.IChannelListenerInvoker, Microsoft.AppCenter.Android.Bindings\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Com.Microsoft.Appcenter.Channel.IChannelListenerImplementor, Microsoft.AppCenter.Android.Bindings"

    const-string v2, ""

    .line 32
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_onClear(Ljava/lang/String;)V
.end method

.method private native n_onGloballyEnabled(Z)V
.end method

.method private native n_onGroupAdded(Ljava/lang/String;Lcom/microsoft/appcenter/channel/Channel$GroupListener;J)V
.end method

.method private native n_onGroupRemoved(Ljava/lang/String;)V
.end method

.method private native n_onPaused(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private native n_onPreparedLog(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/String;I)V
.end method

.method private native n_onPreparingLog(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/String;)V
.end method

.method private native n_onResumed(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private native n_shouldFilter(Lcom/microsoft/appcenter/ingestion/models/Log;)Z
.end method


# virtual methods
.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 110
    iget-object v0, p0, Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 111
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;->refList:Ljava/util/ArrayList;

    .line 112
    :cond_0
    iget-object v0, p0, Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 117
    iget-object v0, p0, Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 118
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onClear(Ljava/lang/String;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1}, Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;->n_onClear(Ljava/lang/String;)V

    return-void
.end method

.method public onGloballyEnabled(Z)V
    .locals 0

    .line 46
    invoke-direct {p0, p1}, Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;->n_onGloballyEnabled(Z)V

    return-void
.end method

.method public onGroupAdded(Ljava/lang/String;Lcom/microsoft/appcenter/channel/Channel$GroupListener;J)V
    .locals 0

    .line 54
    invoke-direct {p0, p1, p2, p3, p4}, Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;->n_onGroupAdded(Ljava/lang/String;Lcom/microsoft/appcenter/channel/Channel$GroupListener;J)V

    return-void
.end method

.method public onGroupRemoved(Ljava/lang/String;)V
    .locals 0

    .line 62
    invoke-direct {p0, p1}, Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;->n_onGroupRemoved(Ljava/lang/String;)V

    return-void
.end method

.method public onPaused(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 70
    invoke-direct {p0, p1, p2}, Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;->n_onPaused(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onPreparedLog(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/String;I)V
    .locals 0

    .line 78
    invoke-direct {p0, p1, p2, p3}, Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;->n_onPreparedLog(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/String;I)V

    return-void
.end method

.method public onPreparingLog(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/String;)V
    .locals 0

    .line 86
    invoke-direct {p0, p1, p2}, Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;->n_onPreparingLog(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/String;)V

    return-void
.end method

.method public onResumed(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 94
    invoke-direct {p0, p1, p2}, Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;->n_onResumed(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public shouldFilter(Lcom/microsoft/appcenter/ingestion/models/Log;)Z
    .locals 0

    .line 102
    invoke-direct {p0, p1}, Lmono/com/microsoft/appcenter/channel/Channel_ListenerImplementor;->n_shouldFilter(Lcom/microsoft/appcenter/ingestion/models/Log;)Z

    move-result p1

    return p1
.end method
