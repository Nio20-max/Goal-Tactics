.class public Lcom/helpshift/campaigns/fragments/InboxFragment;
.super Lcom/helpshift/campaigns/fragments/MainFragment;
.source "InboxFragment.java"

# interfaces
.implements Lcom/helpshift/campaigns/listeners/CampaignListFragmentListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/campaigns/fragments/InboxFragment$LaunchSource;
    }
.end annotation


# static fields
.field public static final LAUNCH_SOURCE:Ljava/lang/String; = "launch_source"


# instance fields
.field private detailFragmentCampaignId:Ljava/lang/String;

.field private showDetailFragment:Z

.field private toolbar:Landroidx/appcompat/widget/Toolbar;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;-><init>()V

    return-void
.end method

.method private loadDetailFragment(Z)V
    .locals 8

    .line 125
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 126
    iget-object v1, p0, Lcom/helpshift/campaigns/fragments/InboxFragment;->detailFragmentCampaignId:Ljava/lang/String;

    const-string v2, "campaignId"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    const-class v1, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    .line 128
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 129
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->isTablet()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 132
    :cond_0
    invoke-static {v0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->newInstance(Landroid/os/Bundle;)Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;

    move-result-object v4

    .line 133
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->isDualPane()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 134
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v2

    sget v3, Lcom/helpshift/R$id;->detail_fragment_container:I

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Lcom/helpshift/campaigns/util/FragmentUtil;->startFragment(Landroidx/fragment/app/FragmentManager;ILandroidx/fragment/app/Fragment;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    .line 144
    const-class p1, Lcom/helpshift/campaigns/fragments/InboxFragment;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    move-object v6, p1

    goto :goto_0

    :cond_2
    move-object v6, v0

    .line 146
    :goto_0
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v2

    sget v3, Lcom/helpshift/R$id;->inbox_fragment_container:I

    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Lcom/helpshift/campaigns/util/FragmentUtil;->startFragment(Landroidx/fragment/app/FragmentManager;ILandroidx/fragment/app/Fragment;Ljava/lang/String;Ljava/lang/String;Z)V

    :cond_3
    :goto_1
    return-void
.end method

.method private loadListFragment()V
    .locals 2

    .line 100
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    sget v1, Lcom/helpshift/R$id;->inbox_fragment_container:I

    .line 101
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-nez v0, :cond_0

    .line 103
    invoke-direct {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->showCampaignListFragment()V

    goto :goto_0

    .line 105
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->isTablet()Z

    move-result v1

    if-eqz v1, :cond_1

    instance-of v0, v0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    if-nez v0, :cond_1

    .line 108
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->onBackPressed()Z

    .line 109
    invoke-direct {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->showCampaignListFragment()V

    :cond_1
    :goto_0
    return-void
.end method

.method public static newInstance(Landroid/os/Bundle;)Lcom/helpshift/campaigns/fragments/InboxFragment;
    .locals 1

    .line 32
    new-instance v0, Lcom/helpshift/campaigns/fragments/InboxFragment;

    invoke-direct {v0}, Lcom/helpshift/campaigns/fragments/InboxFragment;-><init>()V

    .line 33
    invoke-virtual {v0, p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private showCampaignListFragment()V
    .locals 7

    .line 114
    const-class v0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 115
    invoke-static {}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->newInstance()Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    move-result-object v3

    .line 116
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    sget v2, Lcom/helpshift/R$id;->inbox_fragment_container:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lcom/helpshift/campaigns/util/FragmentUtil;->startFragment(Landroidx/fragment/app/FragmentManager;ILandroidx/fragment/app/Fragment;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method


# virtual methods
.method public getShowDetailFragment()Z
    .locals 1

    .line 228
    iget-boolean v0, p0, Lcom/helpshift/campaigns/fragments/InboxFragment;->showDetailFragment:Z

    return v0
.end method

.method public onBackPressed()Z
    .locals 2

    .line 197
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 198
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->getBackStackEntryCount()I

    move-result v1

    if-lez v1, :cond_0

    .line 200
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onCampaignClicked(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 208
    iput-boolean v0, p0, Lcom/helpshift/campaigns/fragments/InboxFragment;->showDetailFragment:Z

    .line 209
    iput-object p1, p0, Lcom/helpshift/campaigns/fragments/InboxFragment;->detailFragmentCampaignId:Ljava/lang/String;

    .line 210
    invoke-direct {p0, v0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->loadDetailFragment(Z)V

    .line 211
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->updateSelectCampaignView()V

    return-void
.end method

.method public onCampaignDelete(Ljava/lang/String;)V
    .locals 1

    .line 216
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->isDualPane()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/InboxFragment;->detailFragmentCampaignId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 218
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    sget v0, Lcom/helpshift/R$id;->detail_fragment_container:I

    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;

    if-eqz p1, :cond_0

    .line 220
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/helpshift/campaigns/util/FragmentUtil;->removeFragment(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V

    const/4 p1, 0x0

    .line 221
    iput-boolean p1, p0, Lcom/helpshift/campaigns/fragments/InboxFragment;->showDetailFragment:Z

    .line 222
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->updateSelectCampaignView()V

    :cond_0
    return-void
.end method

.method public onContextMenuClosed(Landroid/view/Menu;)V
    .locals 2

    .line 237
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    sget v1, Lcom/helpshift/R$id;->inbox_fragment_container:I

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    if-eqz v0, :cond_0

    .line 239
    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->onContextMenuClosed(Landroid/view/Menu;)V

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 39
    sget p3, Lcom/helpshift/R$layout;->hs__campaign_inbox_fragment:I

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onResume()V
    .locals 1

    .line 44
    invoke-super {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->onResume()V

    const/4 v0, 0x1

    .line 45
    invoke-virtual {p0, v0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->showToolbarElevation(Z)V

    return-void
.end method

.method public onStart()V
    .locals 1

    .line 85
    invoke-super {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->onStart()V

    .line 86
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_0

    .line 87
    invoke-static {}, Lcom/helpshift/campaigns/delegates/CampaignsDelegateRouter;->sessionBegan()V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 93
    invoke-super {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->onStop()V

    .line 94
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_0

    .line 95
    invoke-static {}, Lcom/helpshift/campaigns/delegates/CampaignsDelegateRouter;->sessionEnded()V

    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4

    .line 50
    invoke-super {p0, p1, p2}, Lcom/helpshift/campaigns/fragments/MainFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 51
    invoke-virtual {p0, p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->getActivity(Landroidx/fragment/app/Fragment;)Landroid/app/Activity;

    move-result-object p2

    sget v0, Lcom/helpshift/R$id;->toolbar:I

    invoke-virtual {p2, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/appcompat/widget/Toolbar;

    iput-object p2, p0, Lcom/helpshift/campaigns/fragments/InboxFragment;->toolbar:Landroidx/appcompat/widget/Toolbar;

    .line 53
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    const-string v1, "launch_source"

    .line 56
    invoke-virtual {p2, v1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x1

    if-eqz p2, :cond_3

    if-eq v1, v2, :cond_1

    const/4 v3, 0x3

    if-ne v1, v3, :cond_3

    .line 60
    :cond_1
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->isDualPane()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 61
    invoke-direct {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->loadListFragment()V

    :cond_2
    const-string v1, "campaignId"

    .line 64
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/campaigns/fragments/InboxFragment;->detailFragmentCampaignId:Ljava/lang/String;

    .line 65
    invoke-direct {p0, v0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->loadDetailFragment(Z)V

    goto :goto_1

    .line 68
    :cond_3
    invoke-direct {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->loadListFragment()V

    .line 69
    iget-boolean p2, p0, Lcom/helpshift/campaigns/fragments/InboxFragment;->showDetailFragment:Z

    if-eqz p2, :cond_4

    .line 70
    invoke-direct {p0, v2}, Lcom/helpshift/campaigns/fragments/InboxFragment;->loadDetailFragment(Z)V

    .line 74
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->updateSelectCampaignView()V

    .line 76
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p2

    iget-object p2, p2, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    iget-object p2, p2, Lcom/helpshift/model/AppInfoModel;->disableHelpshiftBranding:Ljava/lang/Boolean;

    if-eqz p2, :cond_5

    .line 77
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_5

    .line 78
    sget p2, Lcom/helpshift/R$id;->hs_logo:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    const/16 p2, 0x8

    .line 79
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_5
    return-void
.end method

.method public setShowDetailFragment(Z)V
    .locals 0

    .line 232
    iput-boolean p1, p0, Lcom/helpshift/campaigns/fragments/InboxFragment;->showDetailFragment:Z

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 1

    .line 185
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/InboxFragment;->toolbar:Landroidx/appcompat/widget/Toolbar;

    if-eqz v0, :cond_0

    .line 186
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 189
    :cond_0
    invoke-virtual {p0, p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->getActivity(Landroidx/fragment/app/Fragment;)Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/app/AppCompatActivity;

    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 191
    invoke-virtual {v0, p1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public updateSelectCampaignView()V
    .locals 2

    .line 157
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 160
    sget v1, Lcom/helpshift/R$id;->select_campaign_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 163
    :goto_0
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->isDualPane()Z

    move-result v1

    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    .line 164
    iget-boolean v1, p0, Lcom/helpshift/campaigns/fragments/InboxFragment;->showDetailFragment:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    .line 165
    invoke-virtual {p0, v1, v0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->updateSelectCampaignView(ZLandroid/view/View;)V

    goto :goto_1

    :cond_1
    const/4 v1, 0x1

    .line 168
    invoke-virtual {p0, v1, v0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->updateSelectCampaignView(ZLandroid/view/View;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public updateSelectCampaignView(ZLandroid/view/View;)V
    .locals 0

    if-eqz p2, :cond_1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 176
    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    .line 179
    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method
