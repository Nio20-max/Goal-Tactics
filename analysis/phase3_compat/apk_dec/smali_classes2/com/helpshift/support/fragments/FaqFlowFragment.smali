.class public Lcom/helpshift/support/fragments/FaqFlowFragment;
.super Lcom/helpshift/support/fragments/MainFragment;
.source "FaqFlowFragment.java"

# interfaces
.implements Lcom/helpshift/support/contracts/FaqFlowView;


# static fields
.field public static final FRAGMENT_TAG:Ljava/lang/String; = "Helpshift_FaqFlowFrag"


# instance fields
.field private customContactUsFlows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/support/flows/Flow;",
            ">;"
        }
    .end annotation
.end field

.field private faqFlowController:Lcom/helpshift/support/controllers/FaqFlowController;

.field private selectQuestionView:Landroid/view/View;

.field private verticalDivider:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/helpshift/support/fragments/MainFragment;-><init>()V

    return-void
.end method

.method public static newInstance(Landroid/os/Bundle;Ljava/util/List;)Lcom/helpshift/support/fragments/FaqFlowFragment;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "Ljava/util/List<",
            "Lcom/helpshift/support/flows/Flow;",
            ">;)",
            "Lcom/helpshift/support/fragments/FaqFlowFragment;"
        }
    .end annotation

    .line 30
    new-instance v0, Lcom/helpshift/support/fragments/FaqFlowFragment;

    invoke-direct {v0}, Lcom/helpshift/support/fragments/FaqFlowFragment;-><init>()V

    .line 31
    invoke-virtual {v0, p0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->setArguments(Landroid/os/Bundle;)V

    .line 32
    iput-object p1, v0, Lcom/helpshift/support/fragments/FaqFlowFragment;->customContactUsFlows:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public getCustomContactUsFlows()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/support/flows/Flow;",
            ">;"
        }
    .end annotation

    .line 164
    iget-object v0, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->customContactUsFlows:Ljava/util/List;

    return-object v0
.end method

.method public getFaqFlowController()Lcom/helpshift/support/controllers/FaqFlowController;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->faqFlowController:Lcom/helpshift/support/controllers/FaqFlowController;

    return-object v0
.end method

.method public getFaqFlowListener()Lcom/helpshift/support/contracts/FaqFragmentListener;
    .locals 1

    .line 142
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->getFaqFlowController()Lcom/helpshift/support/controllers/FaqFlowController;

    move-result-object v0

    return-object v0
.end method

.method public getSupportFragment()Lcom/helpshift/support/fragments/SupportFragment;
    .locals 1

    .line 137
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/fragments/SupportFragment;

    return-object v0
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 3

    .line 43
    :try_start_0
    invoke-super {p0, p1}, Lcom/helpshift/support/fragments/MainFragment;->onAttach(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    iget-object v0, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->faqFlowController:Lcom/helpshift/support/controllers/FaqFlowController;

    if-nez v0, :cond_0

    .line 51
    new-instance v0, Lcom/helpshift/support/controllers/FaqFlowController;

    .line 53
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    .line 54
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    invoke-direct {v0, p0, p1, v1, v2}, Lcom/helpshift/support/controllers/FaqFlowController;-><init>(Lcom/helpshift/support/contracts/FaqFlowView;Landroid/content/Context;Landroidx/fragment/app/FragmentManager;Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->faqFlowController:Lcom/helpshift/support/controllers/FaqFlowController;

    goto :goto_0

    .line 57
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/helpshift/support/controllers/FaqFlowController;->onFragmentManagerUpdate(Landroidx/fragment/app/FragmentManager;)V

    :goto_0
    return-void

    :catch_0
    move-exception p1

    const-string v0, "Helpshift_FaqFlowFrag"

    const-string v1, "Caught exception in FaqFlowFragment.onAttach()"

    .line 46
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 69
    sget p3, Lcom/helpshift/R$layout;->hs__faq_flow_fragment:I

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDestroy()V
    .locals 1

    .line 106
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onDestroy()V

    const/4 v0, 0x0

    .line 107
    iput-object v0, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->faqFlowController:Lcom/helpshift/support/controllers/FaqFlowController;

    .line 108
    iput-object v0, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->verticalDivider:Landroid/view/View;

    .line 109
    iput-object v0, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->selectQuestionView:Landroid/view/View;

    .line 110
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->getSupportFragment()Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/support/fragments/SupportFragment;->unRegisterSearchListener()V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 89
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onResume()V

    .line 90
    iget-object v0, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->customContactUsFlows:Ljava/util/List;

    invoke-static {v0}, Lcom/helpshift/support/flows/CustomContactUsFlowListHolder;->setFlowList(Ljava/util/List;)V

    .line 91
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->getSupportFragment()Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->faqFlowController:Lcom/helpshift/support/controllers/FaqFlowController;

    invoke-virtual {v0, v1}, Lcom/helpshift/support/fragments/SupportFragment;->setSearchListeners(Lcom/helpshift/support/controllers/FaqFlowController;)V

    .line 92
    iget-object v0, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->faqFlowController:Lcom/helpshift/support/controllers/FaqFlowController;

    invoke-virtual {v0}, Lcom/helpshift/support/controllers/FaqFlowController;->start()V

    .line 93
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->updateSelectQuestionUI()V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 98
    invoke-super {p0, p1}, Lcom/helpshift/support/fragments/MainFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 99
    iget-object v0, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->faqFlowController:Lcom/helpshift/support/controllers/FaqFlowController;

    if-eqz v0, :cond_0

    .line 100
    invoke-virtual {v0, p1}, Lcom/helpshift/support/controllers/FaqFlowController;->onSaveInstanceState(Landroid/os/Bundle;)V

    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    .line 74
    invoke-super {p0, p1, p2}, Lcom/helpshift/support/fragments/MainFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 75
    sget p2, Lcom/helpshift/R$id;->vertical_divider:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->verticalDivider:Landroid/view/View;

    .line 76
    sget p2, Lcom/helpshift/R$id;->select_question_view:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->selectQuestionView:Landroid/view/View;

    return-void
.end method

.method public onViewStateRestored(Landroid/os/Bundle;)V
    .locals 1

    .line 81
    invoke-super {p0, p1}, Lcom/helpshift/support/fragments/MainFragment;->onViewStateRestored(Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    .line 82
    iget-object v0, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->faqFlowController:Lcom/helpshift/support/controllers/FaqFlowController;

    if-eqz v0, :cond_0

    .line 83
    invoke-virtual {v0, p1}, Lcom/helpshift/support/controllers/FaqFlowController;->onViewStateRestored(Landroid/os/Bundle;)V

    :cond_0
    return-void
.end method

.method public retryGetSections()V
    .locals 1

    .line 157
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/util/FragmentUtil;->getFaqFragment(Landroidx/fragment/app/FragmentManager;)Lcom/helpshift/support/compositions/FaqFragment;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 159
    invoke-virtual {v0}, Lcom/helpshift/support/compositions/FaqFragment;->retryGetSections()V

    :cond_0
    return-void
.end method

.method public shouldRefreshMenu()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public showVerticalDivider(Z)V
    .locals 1

    .line 146
    iget-object v0, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->verticalDivider:Landroid/view/View;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 148
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    .line 151
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method public updateSelectQuestionUI()V
    .locals 2

    .line 114
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->isScreenLarge()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->selectQuestionView:Landroid/view/View;

    if-eqz v0, :cond_1

    .line 115
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    sget v1, Lcom/helpshift/R$id;->details_fragment_container:I

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 116
    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->updateSelectQuestionUI(Z)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 119
    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->updateSelectQuestionUI(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method public updateSelectQuestionUI(Z)V
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/helpshift/support/fragments/FaqFlowFragment;->selectQuestionView:Landroid/view/View;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 127
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    .line 130
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method
