.class public Lcom/helpshift/support/fragments/QuestionListFragment;
.super Lcom/helpshift/support/fragments/MainFragment;
.source "QuestionListFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/fragments/QuestionListFragment$SectionFailureHandler;,
        Lcom/helpshift/support/fragments/QuestionListFragment$SectionSuccessHandler;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_QstnListFrag"


# instance fields
.field private data:Lcom/helpshift/support/HSApiData;

.field private eventSent:Z

.field private faqTagFilter:Lcom/helpshift/support/FaqTagFilter;

.field private isConfigurationChanged:Z

.field private onQuestionClickedListener:Landroid/view/View$OnClickListener;

.field private questionList:Landroidx/recyclerview/widget/RecyclerView;

.field private sectionId:Ljava/lang/String;

.field private sectionTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 40
    invoke-direct {p0}, Lcom/helpshift/support/fragments/MainFragment;-><init>()V

    const/4 v0, 0x0

    .line 49
    iput-boolean v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->eventSent:Z

    .line 50
    iput-boolean v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->isConfigurationChanged:Z

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/support/fragments/QuestionListFragment;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->questionList:Landroidx/recyclerview/widget/RecyclerView;

    return-object p0
.end method

.method private getSectionId(Ljava/lang/String;)V
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->data:Lcom/helpshift/support/HSApiData;

    invoke-virtual {v0, p1}, Lcom/helpshift/support/HSApiData;->getSection(Ljava/lang/String;)Lcom/helpshift/support/Section;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 136
    invoke-virtual {p1}, Lcom/helpshift/support/Section;->getSectionId()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->sectionId:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method private getSectionTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->data:Lcom/helpshift/support/HSApiData;

    invoke-virtual {v0, p1}, Lcom/helpshift/support/HSApiData;->getSection(Ljava/lang/String;)Lcom/helpshift/support/Section;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 128
    invoke-virtual {p1}, Lcom/helpshift/support/Section;->getTitle()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public static newInstance(Landroid/os/Bundle;)Lcom/helpshift/support/fragments/QuestionListFragment;
    .locals 1

    .line 53
    new-instance v0, Lcom/helpshift/support/fragments/QuestionListFragment;

    invoke-direct {v0}, Lcom/helpshift/support/fragments/QuestionListFragment;-><init>()V

    .line 54
    invoke-virtual {v0, p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private pushAnalyticEvent()V
    .locals 3

    .line 228
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->getUserVisibleHint()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->eventSent:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->isConfigurationChanged:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->sectionId:Ljava/lang/String;

    .line 231
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 232
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object v0

    sget-object v1, Lcom/helpshift/analytics/AnalyticsEventType;->BROWSED_FAQ_LIST:Lcom/helpshift/analytics/AnalyticsEventType;

    iget-object v2, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->sectionId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 233
    iput-boolean v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->eventSent:Z

    :cond_0
    return-void
.end method


# virtual methods
.method public getFaqFlowListener()Lcom/helpshift/support/contracts/FaqFragmentListener;
    .locals 1

    .line 59
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/contracts/FaqFlowViewParent;

    invoke-interface {v0}, Lcom/helpshift/support/contracts/FaqFlowViewParent;->getFaqFlowListener()Lcom/helpshift/support/contracts/FaqFragmentListener;

    move-result-object v0

    return-object v0
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 2

    .line 65
    :try_start_0
    invoke-super {p0, p1}, Lcom/helpshift/support/fragments/MainFragment;->onAttach(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    new-instance v0, Lcom/helpshift/support/HSApiData;

    invoke-direct {v0, p1}, Lcom/helpshift/support/HSApiData;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->data:Lcom/helpshift/support/HSApiData;

    .line 73
    sget p1, Lcom/helpshift/R$string;->hs__help_header:I

    invoke-virtual {p0, p1}, Lcom/helpshift/support/fragments/QuestionListFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->sectionTitle:Ljava/lang/String;

    return-void

    :catch_0
    move-exception p1

    const-string v0, "Helpshift_QstnListFrag"

    const-string v1, "Caught exception in QuestionListFragment.onAttach()"

    .line 68
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 148
    invoke-super {p0, p1}, Lcom/helpshift/support/fragments/MainFragment;->onCreate(Landroid/os/Bundle;)V

    .line 149
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "withTagsMatching"

    .line 151
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    check-cast p1, Lcom/helpshift/support/FaqTagFilter;

    iput-object p1, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->faqTagFilter:Lcom/helpshift/support/FaqTagFilter;

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 158
    sget p3, Lcom/helpshift/R$layout;->hs__question_list_fragment:I

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDestroyView()V
    .locals 2

    .line 219
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/util/SnackbarUtil;->hideSnackbar(Landroid/view/View;)V

    .line 222
    iget-object v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->questionList:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 223
    iput-object v1, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->questionList:Landroidx/recyclerview/widget/RecyclerView;

    .line 224
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onDestroyView()V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 200
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onResume()V

    .line 204
    sget v0, Lcom/helpshift/R$string;->hs__help_header:I

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/QuestionListFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/QuestionListFragment;->setToolbarTitle(Ljava/lang/String;)V

    .line 205
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->isScreenLarge()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 206
    iget-object v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->sectionTitle:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/QuestionListFragment;->setToolbarTitle(Ljava/lang/String;)V

    .line 209
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 210
    instance-of v1, v0, Lcom/helpshift/support/fragments/FaqFlowFragment;

    if-eqz v1, :cond_0

    .line 211
    check-cast v0, Lcom/helpshift/support/fragments/FaqFlowFragment;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/support/fragments/FaqFlowFragment;->showVerticalDivider(Z)V

    .line 214
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->pushAnalyticEvent()V

    return-void
.end method

.method public onStart()V
    .locals 1

    .line 78
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onStart()V

    .line 79
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->isChangingConfigurations()Z

    move-result v0

    iput-boolean v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->isConfigurationChanged:Z

    const/4 v0, 0x0

    .line 80
    iput-boolean v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->eventSent:Z

    return-void
.end method

.method public onStop()V
    .locals 1

    .line 85
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->isScreenLarge()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    sget v0, Lcom/helpshift/R$string;->hs__help_header:I

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/QuestionListFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/QuestionListFragment;->setToolbarTitle(Ljava/lang/String;)V

    .line 88
    :cond_0
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onStop()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4

    .line 163
    invoke-super {p0, p1, p2}, Lcom/helpshift/support/fragments/MainFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 165
    sget p2, Lcom/helpshift/R$id;->question_list:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->questionList:Landroidx/recyclerview/widget/RecyclerView;

    .line 166
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 167
    new-instance p1, Lcom/helpshift/support/fragments/QuestionListFragment$1;

    invoke-direct {p1, p0}, Lcom/helpshift/support/fragments/QuestionListFragment$1;-><init>(Lcom/helpshift/support/fragments/QuestionListFragment;)V

    iput-object p1, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->onQuestionClickedListener:Landroid/view/View$OnClickListener;

    .line 175
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string p2, "sectionPublishId"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 176
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->isScreenLarge()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 177
    invoke-direct {p0, p1}, Lcom/helpshift/support/fragments/QuestionListFragment;->getSectionTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 178
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 179
    iput-object p2, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->sectionTitle:Ljava/lang/String;

    .line 183
    :cond_0
    new-instance p2, Lcom/helpshift/support/fragments/QuestionListFragment$SectionSuccessHandler;

    invoke-direct {p2, p0}, Lcom/helpshift/support/fragments/QuestionListFragment$SectionSuccessHandler;-><init>(Lcom/helpshift/support/fragments/QuestionListFragment;)V

    .line 184
    new-instance v0, Lcom/helpshift/support/fragments/QuestionListFragment$SectionFailureHandler;

    invoke-direct {v0, p0}, Lcom/helpshift/support/fragments/QuestionListFragment$SectionFailureHandler;-><init>(Lcom/helpshift/support/fragments/QuestionListFragment;)V

    .line 186
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const/4 v2, 0x0

    const-string v3, "support_mode"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1

    .line 192
    iget-object v1, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->data:Lcom/helpshift/support/HSApiData;

    invoke-virtual {v1, p1, p2, v0}, Lcom/helpshift/support/HSApiData;->getSectionSync(Ljava/lang/String;Landroid/os/Handler;Landroid/os/Handler;)V

    goto :goto_0

    .line 189
    :cond_1
    iget-object v1, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->data:Lcom/helpshift/support/HSApiData;

    iget-object v2, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->faqTagFilter:Lcom/helpshift/support/FaqTagFilter;

    invoke-virtual {v1, p1, p2, v0, v2}, Lcom/helpshift/support/HSApiData;->getSection(Ljava/lang/String;Landroid/os/Handler;Landroid/os/Handler;Lcom/helpshift/support/FaqTagFilter;)V

    .line 195
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "FAQ section loaded : Name : "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->sectionTitle:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Helpshift_QstnListFrag"

    invoke-static {p2, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 0

    .line 142
    invoke-super {p0, p1}, Lcom/helpshift/support/fragments/MainFragment;->setUserVisibleHint(Z)V

    .line 143
    invoke-direct {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->pushAnalyticEvent()V

    return-void
.end method

.method public shouldRefreshMenu()Z
    .locals 1

    .line 93
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    instance-of v0, v0, Lcom/helpshift/support/fragments/FaqFlowFragment;

    return v0
.end method

.method updateSectionData(Lcom/helpshift/support/Section;)V
    .locals 3

    .line 98
    iget-object v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->questionList:Landroidx/recyclerview/widget/RecyclerView;

    if-nez v0, :cond_0

    return-void

    .line 105
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->data:Lcom/helpshift/support/HSApiData;

    invoke-virtual {p1}, Lcom/helpshift/support/Section;->getPublishId()Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->faqTagFilter:Lcom/helpshift/support/FaqTagFilter;

    invoke-virtual {v0, p1, v1}, Lcom/helpshift/support/HSApiData;->getFaqsForSection(Ljava/lang/String;Lcom/helpshift/support/FaqTagFilter;)Ljava/util/ArrayList;

    move-result-object p1

    if-eqz p1, :cond_4

    .line 106
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 112
    :cond_1
    iget-object v0, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->questionList:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lcom/helpshift/support/adapters/QuestionListAdapter;

    iget-object v2, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->onQuestionClickedListener:Landroid/view/View$OnClickListener;

    invoke-direct {v1, p1, v2}, Lcom/helpshift/support/adapters/QuestionListAdapter;-><init>(Ljava/util/List;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 113
    invoke-static {p0}, Lcom/helpshift/support/util/FragmentUtil;->getSupportFragment(Landroidx/fragment/app/Fragment;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 115
    invoke-virtual {p1}, Lcom/helpshift/support/fragments/SupportFragment;->onFaqsLoaded()V

    .line 118
    :cond_2
    iget-object p1, p0, Lcom/helpshift/support/fragments/QuestionListFragment;->sectionId:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 119
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "sectionPublishId"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/helpshift/support/fragments/QuestionListFragment;->getSectionId(Ljava/lang/String;)V

    .line 121
    :cond_3
    invoke-direct {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->pushAnalyticEvent()V

    goto :goto_1

    .line 107
    :cond_4
    :goto_0
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->isDetached()Z

    move-result p1

    if-nez p1, :cond_5

    const/16 p1, 0x67

    .line 108
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/QuestionListFragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/helpshift/support/util/SnackbarUtil;->showErrorSnackbar(ILandroid/view/View;)V

    :cond_5
    :goto_1
    return-void
.end method
