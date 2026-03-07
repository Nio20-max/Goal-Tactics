.class public Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;
.super Lcom/helpshift/support/fragments/MainFragment;
.source "ConversationSetupFragment.java"

# interfaces
.implements Lcom/helpshift/conversation/activeconversation/usersetup/ConversationSetupRenderer;
.implements Lcom/helpshift/network/connectivity/HSNetworkConnectivityCallback;


# static fields
.field public static final FRAGMENT_TAG:Ljava/lang/String; = "Helpshift_CnvStpFrgmnt"


# instance fields
.field private conversationSetupVM:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

.field private offlineErrorView:Landroid/view/View;

.field private progressBar:Landroid/widget/ProgressBar;

.field private progressDescriptionView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Lcom/helpshift/support/fragments/MainFragment;-><init>()V

    return-void
.end method

.method private addViewStateObservers()V
    .locals 3

    .line 71
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getDomain()Lcom/helpshift/common/domain/Domain;

    move-result-object v0

    .line 74
    iget-object v1, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->conversationSetupVM:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-virtual {v1}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->getProgressBarViewState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v1

    new-instance v2, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment$1;

    invoke-direct {v2, p0}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment$1;-><init>(Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;)V

    invoke-virtual {v1, v0, v2}, Lcom/helpshift/widget/BaseViewState;->subscribe(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/widget/HSObserver;)V

    .line 87
    iget-object v1, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->conversationSetupVM:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-virtual {v1}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->getDescriptionProgressViewState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v1

    new-instance v2, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment$2;

    invoke-direct {v2, p0}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment$2;-><init>(Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;)V

    invoke-virtual {v1, v0, v2}, Lcom/helpshift/widget/BaseViewState;->subscribe(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/widget/HSObserver;)V

    .line 101
    iget-object v1, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->conversationSetupVM:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-virtual {v1}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->getUserOfflineErrorViewState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v1

    new-instance v2, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment$3;

    invoke-direct {v2, p0}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment$3;-><init>(Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;)V

    invoke-virtual {v1, v0, v2}, Lcom/helpshift/widget/BaseViewState;->subscribe(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/widget/HSObserver;)V

    return-void
.end method

.method private getSupportController()Lcom/helpshift/support/controllers/SupportController;
    .locals 1

    .line 187
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/fragments/SupportFragment;

    .line 188
    invoke-virtual {v0}, Lcom/helpshift/support/fragments/SupportFragment;->getSupportController()Lcom/helpshift/support/controllers/SupportController;

    move-result-object v0

    return-object v0
.end method

.method private initialize(Landroid/view/View;)V
    .locals 2

    .line 122
    sget v0, Lcom/helpshift/R$id;->progressbar:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->progressBar:Landroid/widget/ProgressBar;

    .line 123
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/support/util/Styles;->setAccentColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V

    .line 124
    sget v0, Lcom/helpshift/R$id;->progress_description_text_view:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->progressDescriptionView:Landroid/view/View;

    .line 125
    sget v0, Lcom/helpshift/R$id;->offline_error_view:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->offlineErrorView:Landroid/view/View;

    .line 126
    sget v0, Lcom/helpshift/R$id;->info_icon:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    .line 127
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const v1, 0x1010036

    invoke-static {v0, p1, v1}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    .line 128
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1, p0}, Lcom/helpshift/CoreApi;->getConversationSetupVM(Lcom/helpshift/conversation/activeconversation/usersetup/ConversationSetupRenderer;)Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->conversationSetupVM:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    return-void
.end method

.method public static newInstance()Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;
    .locals 1

    .line 36
    new-instance v0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;

    invoke-direct {v0}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;-><init>()V

    return-object v0
.end method

.method private removeViewStateObservers()V
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->conversationSetupVM:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->getProgressBarViewState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/widget/BaseViewState;->unsubscribe()V

    .line 117
    iget-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->conversationSetupVM:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->getDescriptionProgressViewState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/widget/BaseViewState;->unsubscribe()V

    .line 118
    iget-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->conversationSetupVM:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->getUserOfflineErrorViewState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/widget/BaseViewState;->unsubscribe()V

    return-void
.end method


# virtual methods
.method public hideNoInternetView()V
    .locals 2

    .line 153
    iget-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->offlineErrorView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public hideProgressBar()V
    .locals 2

    .line 163
    iget-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->progressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method

.method public hideProgressDescription()V
    .locals 2

    .line 173
    iget-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->progressDescriptionView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public onAuthenticationFailure()V
    .locals 1

    .line 183
    invoke-direct {p0}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->getSupportController()Lcom/helpshift/support/controllers/SupportController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/support/controllers/SupportController;->onAuthenticationFailure()V

    return-void
.end method

.method public onConversationSetupComplete()V
    .locals 1

    .line 178
    invoke-direct {p0}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->getSupportController()Lcom/helpshift/support/controllers/SupportController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/support/controllers/SupportController;->onConversationSetupCompleted()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 42
    sget p3, Lcom/helpshift/R$layout;->hs__user_setup_fragment:I

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDestroyView()V
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->conversationSetupVM:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->onDestroyView()V

    .line 67
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onDestroyView()V

    return-void
.end method

.method public onNetworkAvailable()V
    .locals 1

    .line 193
    iget-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->conversationSetupVM:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->onNetworkAvailable()V

    return-void
.end method

.method public onNetworkUnavailable()V
    .locals 1

    .line 198
    iget-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->conversationSetupVM:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->onNetworkUnavailable()V

    return-void
.end method

.method public onPause()V
    .locals 1

    .line 133
    invoke-direct {p0}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->removeViewStateObservers()V

    .line 135
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/network/connectivity/HSConnectivityManager;->getInstance(Landroid/content/Context;)Lcom/helpshift/network/connectivity/HSConnectivityManager;

    move-result-object v0

    .line 136
    invoke-virtual {v0, p0}, Lcom/helpshift/network/connectivity/HSConnectivityManager;->unregisterNetworkConnectivityListener(Lcom/helpshift/network/connectivity/HSNetworkConnectivityCallback;)V

    .line 137
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 54
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onResume()V

    .line 55
    invoke-direct {p0}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->addViewStateObservers()V

    .line 57
    sget v0, Lcom/helpshift/R$string;->hs__conversation_header:I

    invoke-virtual {p0, v0}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->setToolbarTitle(Ljava/lang/String;)V

    .line 59
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/network/connectivity/HSConnectivityManager;->getInstance(Landroid/content/Context;)Lcom/helpshift/network/connectivity/HSConnectivityManager;

    move-result-object v0

    .line 60
    invoke-virtual {v0, p0}, Lcom/helpshift/network/connectivity/HSConnectivityManager;->registerNetworkConnectivityListener(Lcom/helpshift/network/connectivity/HSNetworkConnectivityCallback;)V

    .line 61
    iget-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->conversationSetupVM:Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->onResume()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    .line 48
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->initialize(Landroid/view/View;)V

    .line 49
    invoke-super {p0, p1, p2}, Lcom/helpshift/support/fragments/MainFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    return-void
.end method

.method public shouldRefreshMenu()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public showNoInternetView()V
    .locals 2

    .line 148
    iget-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->offlineErrorView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public showProgressBar()V
    .locals 2

    .line 158
    iget-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->progressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method

.method public showProgressDescription()V
    .locals 2

    .line 168
    iget-object v0, p0, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->progressDescriptionView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
