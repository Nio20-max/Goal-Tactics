.class public Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;
.super Ljava/lang/Object;
.source "WrapperSupportDelegate.java"

# interfaces
.implements Lmono/android/IGCUserPeer;
.implements Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_authenticationFailed:(Lcom/helpshift/xamarin/WrappedHelpshiftUser;I)V:GetAuthenticationFailed_Lcom_helpshift_xamarin_WrappedHelpshiftUser_IHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_conversationEnded:()V:GetConversationEndedHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_didCheckIfConversationActive:(Z)V:GetDidCheckIfConversationActive_ZHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_didReceiveNotification:(I)V:GetDidReceiveNotification_IHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_didReceiveUnreadMessagesCount:(I)V:GetDidReceiveUnreadMessagesCount_IHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_handleTapOnAttachmentFile:(Ljava/lang/String;)V:GetHandleTapOnAttachmentFile_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_newConversationStarted:(Ljava/lang/String;)V:GetNewConversationStarted_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_sessionBegan:()V:GetSessionBeganHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_sessionEnded:()V:GetSessionEndedHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_userClickOnAction:(Ljava/lang/String;Ljava/lang/String;)V:GetUserClickOnAction_Ljava_lang_String_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_userCompletedCustomerSatisfactionSurvey:(ILjava/lang/String;)V:GetUserCompletedCustomerSatisfactionSurvey_ILjava_lang_String_Handler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_userRepliedToConversation:(Ljava/lang/String;)V:GetUserRepliedToConversation_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 27
    const-class v0, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;

    const-string v1, "HelpshiftApi.WrapperSupportDelegate, HelpshiftApi"

    const-string v2, "n_authenticationFailed:(Lcom/helpshift/xamarin/WrappedHelpshiftUser;I)V:GetAuthenticationFailed_Lcom_helpshift_xamarin_WrappedHelpshiftUser_IHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_conversationEnded:()V:GetConversationEndedHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_didCheckIfConversationActive:(Z)V:GetDidCheckIfConversationActive_ZHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_didReceiveNotification:(I)V:GetDidReceiveNotification_IHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_didReceiveUnreadMessagesCount:(I)V:GetDidReceiveUnreadMessagesCount_IHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_handleTapOnAttachmentFile:(Ljava/lang/String;)V:GetHandleTapOnAttachmentFile_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_newConversationStarted:(Ljava/lang/String;)V:GetNewConversationStarted_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_sessionBegan:()V:GetSessionBeganHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_sessionEnded:()V:GetSessionEndedHandler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_userClickOnAction:(Ljava/lang/String;Ljava/lang/String;)V:GetUserClickOnAction_Ljava_lang_String_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_userCompletedCustomerSatisfactionSurvey:(ILjava/lang/String;)V:GetUserCompletedCustomerSatisfactionSurvey_ILjava_lang_String_Handler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\nn_userRepliedToConversation:(Ljava/lang/String;)V:GetUserRepliedToConversation_Ljava_lang_String_Handler:Com.Helpshift.Xamarin.Support.HelpshiftSupport/IDelegateInvoker, HelpshiftApi\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "HelpshiftApi.WrapperSupportDelegate, HelpshiftApi"

    const-string v2, ""

    .line 35
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_authenticationFailed(Lcom/helpshift/xamarin/WrappedHelpshiftUser;I)V
.end method

.method private native n_conversationEnded()V
.end method

.method private native n_didCheckIfConversationActive(Z)V
.end method

.method private native n_didReceiveNotification(I)V
.end method

.method private native n_didReceiveUnreadMessagesCount(I)V
.end method

.method private native n_handleTapOnAttachmentFile(Ljava/lang/String;)V
.end method

.method private native n_newConversationStarted(Ljava/lang/String;)V
.end method

.method private native n_sessionBegan()V
.end method

.method private native n_sessionEnded()V
.end method

.method private native n_userClickOnAction(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private native n_userCompletedCustomerSatisfactionSurvey(ILjava/lang/String;)V
.end method

.method private native n_userRepliedToConversation(Ljava/lang/String;)V
.end method


# virtual methods
.method public authenticationFailed(Lcom/helpshift/xamarin/WrappedHelpshiftUser;I)V
    .locals 0

    .line 41
    invoke-direct {p0, p1, p2}, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->n_authenticationFailed(Lcom/helpshift/xamarin/WrappedHelpshiftUser;I)V

    return-void
.end method

.method public conversationEnded()V
    .locals 0

    .line 49
    invoke-direct {p0}, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->n_conversationEnded()V

    return-void
.end method

.method public didCheckIfConversationActive(Z)V
    .locals 0

    .line 57
    invoke-direct {p0, p1}, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->n_didCheckIfConversationActive(Z)V

    return-void
.end method

.method public didReceiveNotification(I)V
    .locals 0

    .line 65
    invoke-direct {p0, p1}, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->n_didReceiveNotification(I)V

    return-void
.end method

.method public didReceiveUnreadMessagesCount(I)V
    .locals 0

    .line 73
    invoke-direct {p0, p1}, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->n_didReceiveUnreadMessagesCount(I)V

    return-void
.end method

.method public handleTapOnAttachmentFile(Ljava/lang/String;)V
    .locals 0

    .line 81
    invoke-direct {p0, p1}, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->n_handleTapOnAttachmentFile(Ljava/lang/String;)V

    return-void
.end method

.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 137
    iget-object v0, p0, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 138
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->refList:Ljava/util/ArrayList;

    .line 139
    :cond_0
    iget-object v0, p0, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 144
    iget-object v0, p0, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 145
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public newConversationStarted(Ljava/lang/String;)V
    .locals 0

    .line 89
    invoke-direct {p0, p1}, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->n_newConversationStarted(Ljava/lang/String;)V

    return-void
.end method

.method public sessionBegan()V
    .locals 0

    .line 97
    invoke-direct {p0}, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->n_sessionBegan()V

    return-void
.end method

.method public sessionEnded()V
    .locals 0

    .line 105
    invoke-direct {p0}, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->n_sessionEnded()V

    return-void
.end method

.method public userClickOnAction(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 113
    invoke-direct {p0, p1, p2}, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->n_userClickOnAction(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public userCompletedCustomerSatisfactionSurvey(ILjava/lang/String;)V
    .locals 0

    .line 121
    invoke-direct {p0, p1, p2}, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->n_userCompletedCustomerSatisfactionSurvey(ILjava/lang/String;)V

    return-void
.end method

.method public userRepliedToConversation(Ljava/lang/String;)V
    .locals 0

    .line 129
    invoke-direct {p0, p1}, Lcrc643b6637ff49d1db2a/WrapperSupportDelegate;->n_userRepliedToConversation(Ljava/lang/String;)V

    return-void
.end method
