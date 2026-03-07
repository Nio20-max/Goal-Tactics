.class public Lmono/com/microsoft/appcenter/crashes/CrashesListenerImplementor;
.super Ljava/lang/Object;
.source "CrashesListenerImplementor.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/microsoft/appcenter/crashes/CrashesListener;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_getErrorAttachments:(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)Ljava/lang/Iterable;:GetGetErrorAttachments_Lcom_microsoft_appcenter_crashes_model_ErrorReport_Handler:Com.Microsoft.Appcenter.Crashes.ICrashesListenerInvoker, Microsoft.AppCenter.Crashes.Android.Bindings\nn_onBeforeSending:(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)V:GetOnBeforeSending_Lcom_microsoft_appcenter_crashes_model_ErrorReport_Handler:Com.Microsoft.Appcenter.Crashes.ICrashesListenerInvoker, Microsoft.AppCenter.Crashes.Android.Bindings\nn_onSendingFailed:(Lcom/microsoft/appcenter/crashes/model/ErrorReport;Ljava/lang/Exception;)V:GetOnSendingFailed_Lcom_microsoft_appcenter_crashes_model_ErrorReport_Ljava_lang_Exception_Handler:Com.Microsoft.Appcenter.Crashes.ICrashesListenerInvoker, Microsoft.AppCenter.Crashes.Android.Bindings\nn_onSendingSucceeded:(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)V:GetOnSendingSucceeded_Lcom_microsoft_appcenter_crashes_model_ErrorReport_Handler:Com.Microsoft.Appcenter.Crashes.ICrashesListenerInvoker, Microsoft.AppCenter.Crashes.Android.Bindings\nn_shouldAwaitUserConfirmation:()Z:GetShouldAwaitUserConfirmationHandler:Com.Microsoft.Appcenter.Crashes.ICrashesListenerInvoker, Microsoft.AppCenter.Crashes.Android.Bindings\nn_shouldProcess:(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)Z:GetShouldProcess_Lcom_microsoft_appcenter_crashes_model_ErrorReport_Handler:Com.Microsoft.Appcenter.Crashes.ICrashesListenerInvoker, Microsoft.AppCenter.Crashes.Android.Bindings\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 21
    const-class v0, Lmono/com/microsoft/appcenter/crashes/CrashesListenerImplementor;

    const-string v1, "Com.Microsoft.Appcenter.Crashes.ICrashesListenerImplementor, Microsoft.AppCenter.Crashes.Android.Bindings"

    const-string v2, "n_getErrorAttachments:(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)Ljava/lang/Iterable;:GetGetErrorAttachments_Lcom_microsoft_appcenter_crashes_model_ErrorReport_Handler:Com.Microsoft.Appcenter.Crashes.ICrashesListenerInvoker, Microsoft.AppCenter.Crashes.Android.Bindings\nn_onBeforeSending:(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)V:GetOnBeforeSending_Lcom_microsoft_appcenter_crashes_model_ErrorReport_Handler:Com.Microsoft.Appcenter.Crashes.ICrashesListenerInvoker, Microsoft.AppCenter.Crashes.Android.Bindings\nn_onSendingFailed:(Lcom/microsoft/appcenter/crashes/model/ErrorReport;Ljava/lang/Exception;)V:GetOnSendingFailed_Lcom_microsoft_appcenter_crashes_model_ErrorReport_Ljava_lang_Exception_Handler:Com.Microsoft.Appcenter.Crashes.ICrashesListenerInvoker, Microsoft.AppCenter.Crashes.Android.Bindings\nn_onSendingSucceeded:(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)V:GetOnSendingSucceeded_Lcom_microsoft_appcenter_crashes_model_ErrorReport_Handler:Com.Microsoft.Appcenter.Crashes.ICrashesListenerInvoker, Microsoft.AppCenter.Crashes.Android.Bindings\nn_shouldAwaitUserConfirmation:()Z:GetShouldAwaitUserConfirmationHandler:Com.Microsoft.Appcenter.Crashes.ICrashesListenerInvoker, Microsoft.AppCenter.Crashes.Android.Bindings\nn_shouldProcess:(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)Z:GetShouldProcess_Lcom_microsoft_appcenter_crashes_model_ErrorReport_Handler:Com.Microsoft.Appcenter.Crashes.ICrashesListenerInvoker, Microsoft.AppCenter.Crashes.Android.Bindings\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lmono/com/microsoft/appcenter/crashes/CrashesListenerImplementor;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Com.Microsoft.Appcenter.Crashes.ICrashesListenerImplementor, Microsoft.AppCenter.Crashes.Android.Bindings"

    const-string v2, ""

    .line 29
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_getErrorAttachments(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)Ljava/lang/Iterable;
.end method

.method private native n_onBeforeSending(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)V
.end method

.method private native n_onSendingFailed(Lcom/microsoft/appcenter/crashes/model/ErrorReport;Ljava/lang/Exception;)V
.end method

.method private native n_onSendingSucceeded(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)V
.end method

.method private native n_shouldAwaitUserConfirmation()Z
.end method

.method private native n_shouldProcess(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)Z
.end method


# virtual methods
.method public getErrorAttachments(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)Ljava/lang/Iterable;
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Lmono/com/microsoft/appcenter/crashes/CrashesListenerImplementor;->n_getErrorAttachments(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)Ljava/lang/Iterable;

    move-result-object p1

    return-object p1
.end method

.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 83
    iget-object v0, p0, Lmono/com/microsoft/appcenter/crashes/CrashesListenerImplementor;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmono/com/microsoft/appcenter/crashes/CrashesListenerImplementor;->refList:Ljava/util/ArrayList;

    .line 85
    :cond_0
    iget-object v0, p0, Lmono/com/microsoft/appcenter/crashes/CrashesListenerImplementor;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 90
    iget-object v0, p0, Lmono/com/microsoft/appcenter/crashes/CrashesListenerImplementor;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 91
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onBeforeSending(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lmono/com/microsoft/appcenter/crashes/CrashesListenerImplementor;->n_onBeforeSending(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)V

    return-void
.end method

.method public onSendingFailed(Lcom/microsoft/appcenter/crashes/model/ErrorReport;Ljava/lang/Exception;)V
    .locals 0

    .line 51
    invoke-direct {p0, p1, p2}, Lmono/com/microsoft/appcenter/crashes/CrashesListenerImplementor;->n_onSendingFailed(Lcom/microsoft/appcenter/crashes/model/ErrorReport;Ljava/lang/Exception;)V

    return-void
.end method

.method public onSendingSucceeded(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)V
    .locals 0

    .line 59
    invoke-direct {p0, p1}, Lmono/com/microsoft/appcenter/crashes/CrashesListenerImplementor;->n_onSendingSucceeded(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)V

    return-void
.end method

.method public shouldAwaitUserConfirmation()Z
    .locals 1

    .line 67
    invoke-direct {p0}, Lmono/com/microsoft/appcenter/crashes/CrashesListenerImplementor;->n_shouldAwaitUserConfirmation()Z

    move-result v0

    return v0
.end method

.method public shouldProcess(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)Z
    .locals 0

    .line 75
    invoke-direct {p0, p1}, Lmono/com/microsoft/appcenter/crashes/CrashesListenerImplementor;->n_shouldProcess(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)Z

    move-result p1

    return p1
.end method
