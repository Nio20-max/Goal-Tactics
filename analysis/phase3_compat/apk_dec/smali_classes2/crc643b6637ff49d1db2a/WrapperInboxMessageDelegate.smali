.class public Lcrc643b6637ff49d1db2a/WrapperInboxMessageDelegate;
.super Ljava/lang/Object;
.source "WrapperInboxMessageDelegate.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_coverImageDownloaded:(Ljava/lang/String;)V:GetCoverImageDownloaded_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\nn_iconImageDownloaded:(Ljava/lang/String;)V:GetIconImageDownloaded_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\nn_inboxMessageAdded:(Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;)V:GetInboxMessageAdded_Lcom_helpshift_xamarin_campaigns_models_HelpshiftInboxMessage_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\nn_inboxMessageDeleted:(Ljava/lang/String;)V:GetInboxMessageDeleted_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\nn_inboxMessageMarkedAsRead:(Ljava/lang/String;)V:GetInboxMessageMarkedAsRead_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\nn_inboxMessageMarkedAsSeen:(Ljava/lang/String;)V:GetInboxMessageMarkedAsSeen_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 21
    const-class v0, Lcrc643b6637ff49d1db2a/WrapperInboxMessageDelegate;

    const-string v1, "HelpshiftApi.WrapperInboxMessageDelegate, HelpshiftApi"

    const-string v2, "n_coverImageDownloaded:(Ljava/lang/String;)V:GetCoverImageDownloaded_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\nn_iconImageDownloaded:(Ljava/lang/String;)V:GetIconImageDownloaded_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\nn_inboxMessageAdded:(Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;)V:GetInboxMessageAdded_Lcom_helpshift_xamarin_campaigns_models_HelpshiftInboxMessage_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\nn_inboxMessageDeleted:(Ljava/lang/String;)V:GetInboxMessageDeleted_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\nn_inboxMessageMarkedAsRead:(Ljava/lang/String;)V:GetInboxMessageMarkedAsRead_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\nn_inboxMessageMarkedAsSeen:(Ljava/lang/String;)V:GetInboxMessageMarkedAsSeen_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Campaigns.IHelpshiftInboxMessageDelegateInvoker, HelpshiftApi\n"

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

    const-class v1, Lcrc643b6637ff49d1db2a/WrapperInboxMessageDelegate;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "HelpshiftApi.WrapperInboxMessageDelegate, HelpshiftApi"

    const-string v2, ""

    .line 29
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_coverImageDownloaded(Ljava/lang/String;)V
.end method

.method private native n_iconImageDownloaded(Ljava/lang/String;)V
.end method

.method private native n_inboxMessageAdded(Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;)V
.end method

.method private native n_inboxMessageDeleted(Ljava/lang/String;)V
.end method

.method private native n_inboxMessageMarkedAsRead(Ljava/lang/String;)V
.end method

.method private native n_inboxMessageMarkedAsSeen(Ljava/lang/String;)V
.end method


# virtual methods
.method public coverImageDownloaded(Ljava/lang/String;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Lcrc643b6637ff49d1db2a/WrapperInboxMessageDelegate;->n_coverImageDownloaded(Ljava/lang/String;)V

    return-void
.end method

.method public iconImageDownloaded(Ljava/lang/String;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lcrc643b6637ff49d1db2a/WrapperInboxMessageDelegate;->n_iconImageDownloaded(Ljava/lang/String;)V

    return-void
.end method

.method public inboxMessageAdded(Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;)V
    .locals 0

    .line 51
    invoke-direct {p0, p1}, Lcrc643b6637ff49d1db2a/WrapperInboxMessageDelegate;->n_inboxMessageAdded(Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;)V

    return-void
.end method

.method public inboxMessageDeleted(Ljava/lang/String;)V
    .locals 0

    .line 59
    invoke-direct {p0, p1}, Lcrc643b6637ff49d1db2a/WrapperInboxMessageDelegate;->n_inboxMessageDeleted(Ljava/lang/String;)V

    return-void
.end method

.method public inboxMessageMarkedAsRead(Ljava/lang/String;)V
    .locals 0

    .line 67
    invoke-direct {p0, p1}, Lcrc643b6637ff49d1db2a/WrapperInboxMessageDelegate;->n_inboxMessageMarkedAsRead(Ljava/lang/String;)V

    return-void
.end method

.method public inboxMessageMarkedAsSeen(Ljava/lang/String;)V
    .locals 0

    .line 75
    invoke-direct {p0, p1}, Lcrc643b6637ff49d1db2a/WrapperInboxMessageDelegate;->n_inboxMessageMarkedAsSeen(Ljava/lang/String;)V

    return-void
.end method

.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 83
    iget-object v0, p0, Lcrc643b6637ff49d1db2a/WrapperInboxMessageDelegate;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcrc643b6637ff49d1db2a/WrapperInboxMessageDelegate;->refList:Ljava/util/ArrayList;

    .line 85
    :cond_0
    iget-object v0, p0, Lcrc643b6637ff49d1db2a/WrapperInboxMessageDelegate;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 90
    iget-object v0, p0, Lcrc643b6637ff49d1db2a/WrapperInboxMessageDelegate;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 91
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method
