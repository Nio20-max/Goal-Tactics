.class public Lcom/helpshift/campaigns/fragments/CampaignListFragment;
.super Lcom/helpshift/campaigns/fragments/MainFragment;
.source "CampaignListFragment.java"

# interfaces
.implements Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_CampaignList"


# instance fields
.field adapter:Lcom/helpshift/campaigns/adapters/CampaignListAdapter;

.field private noCampaignsView:Landroid/widget/TextView;

.field private onCampaignClickListener:Landroid/view/View$OnClickListener;

.field presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

.field private presenterSetup:Z

.field searchMenuItem:Landroid/view/MenuItem;

.field private searchView:Landroidx/appcompat/widget/SearchView;

.field private undoSnackbar:Lcom/google/android/material/snackbar/Snackbar;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;-><init>()V

    const/4 v0, 0x0

    .line 44
    iput-boolean v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenterSetup:Z

    return-void
.end method

.method private dismissSnackbar()V
    .locals 1

    .line 259
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->undoSnackbar:Lcom/google/android/material/snackbar/Snackbar;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/material/snackbar/Snackbar;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 260
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->undoSnackbar:Lcom/google/android/material/snackbar/Snackbar;

    invoke-virtual {v0}, Lcom/google/android/material/snackbar/Snackbar;->dismiss()V

    :cond_0
    return-void
.end method

.method public static newInstance()Lcom/helpshift/campaigns/fragments/CampaignListFragment;
    .locals 1

    .line 47
    new-instance v0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    invoke-direct {v0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;-><init>()V

    return-object v0
.end method

.method private restoreSearchMenuItem()V
    .locals 2

    .line 207
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->getRetainSearchState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->getCurrentQuery()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->setSearchMenuQuery(Ljava/lang/String;)V

    .line 209
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->setRetainSearchState(Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected attachMenuListeners(Landroid/view/Menu;)V
    .locals 1

    .line 157
    sget v0, Lcom/helpshift/R$id;->hs__search:I

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->searchMenuItem:Landroid/view/MenuItem;

    .line 158
    invoke-static {p1}, Lcom/helpshift/views/HSMenuItemCompat;->getActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/SearchView;

    iput-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->searchView:Landroidx/appcompat/widget/SearchView;

    .line 159
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Landroidx/appcompat/widget/SearchView$OnQueryTextListener;)V

    .line 160
    iget-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->searchMenuItem:Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-static {p1, v0}, Lcom/helpshift/views/HSMenuItemCompat;->setOnActionExpandListener(Landroid/view/MenuItem;Landroid/view/MenuItem$OnActionExpandListener;)V

    .line 161
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->searchMenuItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/helpshift/util/Styles;->setActionButtonIconColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V

    .line 162
    invoke-direct {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->restoreSearchMenuItem()V

    return-void
.end method

.method public dataChanged()V
    .locals 2

    .line 233
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 234
    new-instance v1, Lcom/helpshift/campaigns/fragments/CampaignListFragment$4;

    invoke-direct {v1, p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment$4;-><init>(Lcom/helpshift/campaigns/fragments/CampaignListFragment;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method getCampaignListFragmentListener()Lcom/helpshift/campaigns/listeners/CampaignListFragmentListener;
    .locals 1

    .line 265
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/campaigns/listeners/CampaignListFragmentListener;

    return-object v0
.end method

.method public getMenuItemPosition()I
    .locals 1

    .line 228
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->adapter:Lcom/helpshift/campaigns/adapters/CampaignListAdapter;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->getMenuItemPosition()I

    move-result v0

    return v0
.end method

.method protected getMenuResourceId()I
    .locals 1

    .line 152
    sget v0, Lcom/helpshift/R$menu;->hs__campaign_list_menu:I

    return v0
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 3

    .line 106
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->adapter:Lcom/helpshift/campaigns/adapters/CampaignListAdapter;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->getMenuItemPosition()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    .line 112
    sget v2, Lcom/helpshift/R$id;->delete_campaign:I

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    .line 113
    invoke-virtual {p0, v0, v1}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->removeItem(IZ)V

    goto :goto_0

    .line 115
    :cond_0
    sget v2, Lcom/helpshift/R$id;->mark_campaign_as_read:I

    if-ne v1, v2, :cond_1

    .line 116
    iget-object v1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->adapter:Lcom/helpshift/campaigns/adapters/CampaignListAdapter;

    invoke-virtual {v1, v0}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->markCampaignAsRead(I)V

    .line 118
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->adapter:Lcom/helpshift/campaigns/adapters/CampaignListAdapter;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->setMenuItemPosition(I)V

    .line 119
    invoke-super {p0, p1}, Lcom/helpshift/campaigns/fragments/MainFragment;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    .line 109
    :catch_0
    invoke-super {p0, p1}, Lcom/helpshift/campaigns/fragments/MainFragment;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onContextMenuClosed(Landroid/view/Menu;)V
    .locals 1

    .line 224
    iget-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->adapter:Lcom/helpshift/campaigns/adapters/CampaignListAdapter;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->setMenuItemPosition(I)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    .line 54
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    move-result-object p3

    iget-object p3, p3, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    .line 55
    new-instance v0, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;

    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p3}, Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;-><init>(Landroid/content/Context;Lcom/helpshift/campaigns/storage/CampaignStorage;)V

    .line 56
    new-instance p3, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-direct {p3, v0}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;-><init>(Lcom/helpshift/campaigns/interactors/CampaignsListInteractor;)V

    iput-object p3, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    .line 58
    invoke-static {p0}, Lcom/helpshift/campaigns/util/FragmentUtil;->getInboxFragment(Landroidx/fragment/app/Fragment;)Lcom/helpshift/campaigns/fragments/InboxFragment;

    move-result-object p3

    .line 59
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->isDualPane()Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Lcom/helpshift/campaigns/fragments/InboxFragment;->getShowDetailFragment()Z

    move-result p3

    if-nez p3, :cond_1

    .line 60
    :cond_0
    iget-object p3, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {p3}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->setUp()V

    .line 61
    iget-object p3, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {p3, p0}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->addObserver(Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;)V

    :cond_1
    const/4 p3, 0x1

    .line 63
    iput-boolean p3, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenterSetup:Z

    .line 65
    new-instance p3, Lcom/helpshift/campaigns/fragments/CampaignListFragment$1;

    invoke-direct {p3, p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment$1;-><init>(Lcom/helpshift/campaigns/fragments/CampaignListFragment;)V

    iput-object p3, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->onCampaignClickListener:Landroid/view/View$OnClickListener;

    .line 77
    sget p3, Lcom/helpshift/R$layout;->hs__campaign_list_fragment:I

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onPause()V
    .locals 1

    .line 94
    invoke-super {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->onPause()V

    .line 96
    invoke-direct {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->dismissSnackbar()V

    .line 97
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->cleanUp()V

    .line 98
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0, p0}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->removeObserver(Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;)V

    const/4 v0, 0x0

    .line 99
    iput-boolean v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenterSetup:Z

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 82
    invoke-super {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->onResume()V

    .line 83
    sget v0, Lcom/helpshift/R$string;->hs__cam_inbox:I

    invoke-virtual {p0, v0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->setToolbarTitle(Ljava/lang/String;)V

    .line 84
    iget-boolean v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenterSetup:Z

    if-nez v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->setUp()V

    .line 86
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0, p0}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->addObserver(Lcom/helpshift/campaigns/observers/CampaignListPresenterObserver;)V

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->cleanUpExpiredCampaigns()V

    .line 89
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->dataChanged()V

    return-void
.end method

.method public onStop()V
    .locals 2

    .line 141
    invoke-super {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->onStop()V

    .line 142
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->isChangingConfigurations()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->searchMenuItem:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/helpshift/views/HSMenuItemCompat;->isActionViewExpanded(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 143
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->setRetainSearchState(Z)V

    goto :goto_0

    .line 145
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->isDualPane()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_1

    .line 146
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->setRetainSearchState(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3

    .line 124
    invoke-super {p0, p1, p2}, Lcom/helpshift/campaigns/fragments/MainFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 125
    sget p2, Lcom/helpshift/R$id;->inbox_list:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/recyclerview/widget/RecyclerView;

    .line 126
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 127
    new-instance v0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;

    iget-object v1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->onCampaignClickListener:Landroid/view/View$OnClickListener;

    invoke-direct {v0, v1, v2}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;-><init>(Lcom/helpshift/campaigns/presenters/CampaignListPresenter;Landroid/view/View$OnClickListener;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->adapter:Lcom/helpshift/campaigns/adapters/CampaignListAdapter;

    .line 128
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 129
    new-instance v0, Lcom/helpshift/campaigns/callbacks/CampaignListItemTouchHelperCallback;

    .line 130
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/helpshift/campaigns/callbacks/CampaignListItemTouchHelperCallback;-><init>(Landroid/content/Context;Lcom/helpshift/campaigns/fragments/CampaignListFragment;)V

    .line 131
    new-instance v1, Landroidx/recyclerview/widget/ItemTouchHelper;

    invoke-direct {v1, v0}, Landroidx/recyclerview/widget/ItemTouchHelper;-><init>(Landroidx/recyclerview/widget/ItemTouchHelper$Callback;)V

    .line 132
    invoke-virtual {v1, p2}, Landroidx/recyclerview/widget/ItemTouchHelper;->attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 134
    sget p2, Lcom/helpshift/R$id;->view_no_campaigns:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->noCampaignsView:Landroid/widget/TextView;

    .line 135
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->updateEmptyView()V

    const-string p1, "Helpshift_CampaignList"

    const-string p2, "Showing Campaigns list fragment"

    .line 136
    invoke-static {p1, p2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public performedSearch()V
    .locals 0

    .line 250
    invoke-direct {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->dismissSnackbar()V

    return-void
.end method

.method public removeItem(IZ)V
    .locals 3

    .line 175
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->getCampaignListFragmentListener()Lcom/helpshift/campaigns/listeners/CampaignListFragmentListener;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v1, p1}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->getCampaignId(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/helpshift/campaigns/listeners/CampaignListFragmentListener;->onCampaignDelete(Ljava/lang/String;)V

    if-eqz p2, :cond_0

    .line 178
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->getView()Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/helpshift/R$string;->hs__cam_message_deleted:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/helpshift/views/HSSnackbar;->make(Landroid/view/View;II)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object v0

    sget v1, Lcom/helpshift/R$string;->hs__cam_undo:I

    new-instance v2, Lcom/helpshift/campaigns/fragments/CampaignListFragment$3;

    invoke-direct {v2, p0, p1}, Lcom/helpshift/campaigns/fragments/CampaignListFragment$3;-><init>(Lcom/helpshift/campaigns/fragments/CampaignListFragment;I)V

    .line 181
    invoke-virtual {v0, v1, v2}, Lcom/google/android/material/snackbar/Snackbar;->setAction(ILandroid/view/View$OnClickListener;)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object v0

    new-instance v1, Lcom/helpshift/campaigns/fragments/CampaignListFragment$2;

    invoke-direct {v1, p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment$2;-><init>(Lcom/helpshift/campaigns/fragments/CampaignListFragment;)V

    .line 190
    invoke-virtual {v0, v1}, Lcom/google/android/material/snackbar/Snackbar;->setCallback(Lcom/google/android/material/snackbar/Snackbar$Callback;)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->undoSnackbar:Lcom/google/android/material/snackbar/Snackbar;

    .line 200
    invoke-virtual {v0}, Lcom/google/android/material/snackbar/Snackbar;->show()V

    .line 202
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->adapter:Lcom/helpshift/campaigns/adapters/CampaignListAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->removeItem(IZ)V

    .line 203
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->updateEmptyView()V

    return-void
.end method

.method public searchActionStarted()V
    .locals 0

    .line 245
    invoke-direct {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->dismissSnackbar()V

    return-void
.end method

.method public searchActionStopped()V
    .locals 0

    .line 255
    invoke-direct {p0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->dismissSnackbar()V

    return-void
.end method

.method public setSearchMenuQuery(Ljava/lang/String;)V
    .locals 2

    .line 214
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->searchMenuItem:Landroid/view/MenuItem;

    invoke-static {v0}, Lcom/helpshift/views/HSMenuItemCompat;->isActionViewExpanded(Landroid/view/MenuItem;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 215
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->searchMenuItem:Landroid/view/MenuItem;

    invoke-static {v0}, Lcom/helpshift/views/HSMenuItemCompat;->expandActionView(Landroid/view/MenuItem;)V

    .line 218
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 219
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->searchView:Landroidx/appcompat/widget/SearchView;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    :cond_1
    return-void
.end method

.method updateEmptyView()V
    .locals 2

    .line 166
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->getCountOfCampaigns()I

    move-result v0

    if-nez v0, :cond_0

    .line 167
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->noCampaignsView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 170
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->noCampaignsView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    return-void
.end method
