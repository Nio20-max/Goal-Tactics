.class public Lcom/helpshift/campaigns/activities/ParentActivity;
.super Lcom/helpshift/activities/MainActivity;
.source "ParentActivity.java"


# instance fields
.field fragmentManager:Landroidx/fragment/app/FragmentManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/helpshift/activities/MainActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 2

    .line 41
    invoke-virtual {p0}, Lcom/helpshift/campaigns/activities/ParentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 42
    sget v1, Lcom/helpshift/R$id;->campaigns_fragment_container:I

    .line 43
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/campaigns/fragments/InboxFragment;

    .line 44
    invoke-virtual {v0}, Lcom/helpshift/campaigns/fragments/InboxFragment;->onBackPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    invoke-super {p0}, Lcom/helpshift/activities/MainActivity;->onBackPressed()V

    :cond_0
    return-void
.end method

.method public onContextMenuClosed(Landroid/view/Menu;)V
    .locals 2

    .line 63
    invoke-virtual {p0}, Lcom/helpshift/campaigns/activities/ParentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 64
    sget v1, Lcom/helpshift/R$id;->campaigns_fragment_container:I

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/campaigns/fragments/InboxFragment;

    if-eqz v0, :cond_0

    .line 66
    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/fragments/InboxFragment;->onContextMenuClosed(Landroid/view/Menu;)V

    .line 68
    :cond_0
    invoke-super {p0, p1}, Lcom/helpshift/activities/MainActivity;->onContextMenuClosed(Landroid/view/Menu;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 20
    invoke-super {p0, p1}, Lcom/helpshift/activities/MainActivity;->onCreate(Landroid/os/Bundle;)V

    .line 21
    sget v0, Lcom/helpshift/R$layout;->hs__campaign_parent_activity:I

    invoke-virtual {p0, v0}, Lcom/helpshift/campaigns/activities/ParentActivity;->setContentView(I)V

    .line 23
    sget v0, Lcom/helpshift/R$id;->toolbar:I

    invoke-virtual {p0, v0}, Lcom/helpshift/campaigns/activities/ParentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/Toolbar;

    .line 24
    invoke-virtual {p0, v0}, Lcom/helpshift/campaigns/activities/ParentActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 25
    invoke-virtual {p0}, Lcom/helpshift/campaigns/activities/ParentActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 27
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 30
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/campaigns/activities/ParentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/activities/ParentActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    if-nez p1, :cond_1

    .line 33
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    .line 34
    sget v0, Lcom/helpshift/R$id;->campaigns_fragment_container:I

    invoke-virtual {p0}, Lcom/helpshift/campaigns/activities/ParentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v1}, Lcom/helpshift/campaigns/fragments/InboxFragment;->newInstance(Landroid/os/Bundle;)Lcom/helpshift/campaigns/fragments/InboxFragment;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 35
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    :cond_1
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 51
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-eq v0, v1, :cond_0

    .line 58
    invoke-super {p0, p1}, Lcom/helpshift/activities/MainActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    .line 53
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/campaigns/activities/ParentActivity;->onBackPressed()V

    const/4 p1, 0x1

    return p1
.end method
