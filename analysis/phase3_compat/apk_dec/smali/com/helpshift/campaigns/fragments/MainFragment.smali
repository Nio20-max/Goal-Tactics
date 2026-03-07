.class public abstract Lcom/helpshift/campaigns/fragments/MainFragment;
.super Landroidx/fragment/app/Fragment;
.source "MainFragment.java"


# static fields
.field public static final TOOLBAR_ID:Ljava/lang/String; = "toolbarId"

.field private static shouldRetainChildFragmentManager:Z


# instance fields
.field private isChangingConfigurations:Z

.field private isDualPane:Z

.field private retainedChildFragmentManager:Landroidx/fragment/app/FragmentManager;

.field private toolbar:Landroidx/appcompat/widget/Toolbar;

.field private toolbarId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    const/4 v0, 0x0

    .line 32
    iput v0, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->toolbarId:I

    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->toolbar:Landroidx/appcompat/widget/Toolbar;

    return-void
.end method

.method private showToolbarElevationLollipop(Z)V
    .locals 3

    .line 248
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->toolbar:Landroidx/appcompat/widget/Toolbar;

    const/high16 v1, 0x40800000    # 4.0f

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    .line 250
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v1}, Lcom/helpshift/util/Styles;->dpToPx(Landroid/content/Context;F)F

    move-result p1

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/Toolbar;->setElevation(F)V

    goto :goto_0

    .line 253
    :cond_0
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/Toolbar;->setElevation(F)V

    goto :goto_0

    .line 257
    :cond_1
    invoke-virtual {p0, p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->getActivity(Landroidx/fragment/app/Fragment;)Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/app/AppCompatActivity;

    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_3

    if-eqz p1, :cond_2

    .line 260
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v1}, Lcom/helpshift/util/Styles;->dpToPx(Landroid/content/Context;F)F

    move-result p1

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/ActionBar;->setElevation(F)V

    goto :goto_0

    .line 263
    :cond_2
    invoke-virtual {v0, v2}, Landroidx/appcompat/app/ActionBar;->setElevation(F)V

    :cond_3
    :goto_0
    return-void
.end method


# virtual methods
.method protected attachMenuListeners(Landroid/view/Menu;)V
    .locals 0

    return-void
.end method

.method public getActivity(Landroidx/fragment/app/Fragment;)Landroid/app/Activity;
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 218
    :cond_0
    :goto_0
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 219
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    goto :goto_0

    .line 221
    :cond_1
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    return-object p1
.end method

.method protected getBundle()Landroid/os/Bundle;
    .locals 3

    .line 187
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 188
    iget v1, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->toolbarId:I

    if-eqz v1, :cond_0

    const-string/jumbo v2, "toolbarId"

    .line 189
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :cond_0
    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .line 65
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 70
    :cond_0
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method protected getMenuResourceId()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;
    .locals 1

    .line 50
    sget-boolean v0, Lcom/helpshift/campaigns/fragments/MainFragment;->shouldRetainChildFragmentManager:Z

    if-eqz v0, :cond_1

    .line 51
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->retainedChildFragmentManager:Landroidx/fragment/app/FragmentManager;

    if-nez v0, :cond_0

    .line 52
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->retainedChildFragmentManager:Landroidx/fragment/app/FragmentManager;

    .line 54
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->retainedChildFragmentManager:Landroidx/fragment/app/FragmentManager;

    return-object v0

    .line 56
    :cond_1
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    return-object v0
.end method

.method public isChangingConfigurations()Z
    .locals 1

    .line 60
    iget-boolean v0, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->isChangingConfigurations:Z

    return v0
.end method

.method public isDualPane()Z
    .locals 1

    .line 225
    iget-boolean v0, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->isDualPane:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->isTablet()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isTablet()Z
    .locals 2

    .line 183
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/helpshift/R$bool;->is_screen_large:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    return v0
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 3

    const-string v0, "MainFragment"

    .line 76
    invoke-static {p1}, Lcom/helpshift/util/LocaleContextUtil;->getContextWithUpdatedLocaleLegacy(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-super {p0, v1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    .line 85
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->shouldRetainInstance()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 87
    :try_start_0
    invoke-virtual {p0, v2}, Lcom/helpshift/campaigns/fragments/MainFragment;->setRetainInstance(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 90
    :catch_0
    sput-boolean v2, Lcom/helpshift/campaigns/fragments/MainFragment;->shouldRetainChildFragmentManager:Z

    .line 95
    :cond_0
    :goto_0
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    if-nez v1, :cond_1

    .line 96
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/helpshift/util/HelpshiftContext;->setApplicationContext(Landroid/content/Context;)V

    .line 99
    :cond_1
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v1, Lcom/helpshift/R$bool;->is_dual_pane:I

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    iput-boolean p1, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->isDualPane:Z

    .line 103
    sget-boolean p1, Lcom/helpshift/campaigns/fragments/MainFragment;->shouldRetainChildFragmentManager:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->retainedChildFragmentManager:Landroidx/fragment/app/FragmentManager;

    if-eqz p1, :cond_2

    .line 105
    :try_start_1
    const-class p1, Landroidx/fragment/app/Fragment;

    const-string v1, "mChildFragmentManager"

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    .line 106
    invoke-virtual {p1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 107
    iget-object v1, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->retainedChildFragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1, p0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    const-string v1, "IllegalAccessException"

    .line 113
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :catch_2
    move-exception p1

    const-string v1, "NoSuchFieldException"

    .line 110
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 120
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 123
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string/jumbo v0, "toolbarId"

    .line 125
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->toolbarId:I

    .line 129
    :cond_0
    iget p1, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->toolbarId:I

    if-nez p1, :cond_1

    .line 130
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->getMenuResourceId()I

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    .line 131
    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/fragments/MainFragment;->setHasOptionsMenu(Z)V

    :cond_1
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1

    .line 170
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->getMenuResourceId()I

    move-result v0

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 171
    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/fragments/MainFragment;->attachMenuListeners(Landroid/view/Menu;)V

    .line 172
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    return-void
.end method

.method public onDetach()V
    .locals 0

    .line 164
    invoke-static {}, Lcom/helpshift/util/LocaleContextUtil;->restoreApplicationLocale()V

    .line 165
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDetach()V

    return-void
.end method

.method public onStop()V
    .locals 1

    .line 158
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    .line 159
    invoke-virtual {p0, p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->getActivity(Landroidx/fragment/app/Fragment;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->isChangingConfigurations()Z

    move-result v0

    iput-boolean v0, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->isChangingConfigurations:Z

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2

    .line 137
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 140
    iget p1, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->toolbarId:I

    if-eqz p1, :cond_1

    .line 141
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->getMenuResourceId()I

    move-result p1

    if-eqz p1, :cond_1

    .line 142
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    iget p2, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->toolbarId:I

    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    iput-object p1, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->toolbar:Landroidx/appcompat/widget/Toolbar;

    .line 145
    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object p1

    .line 146
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x0

    .line 147
    :goto_0
    invoke-interface {p1}, Landroid/view/Menu;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 148
    invoke-interface {p1, v0}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 151
    :cond_0
    iget-object p1, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->toolbar:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->getMenuResourceId()I

    move-result p2

    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/Toolbar;->inflateMenu(I)V

    .line 152
    iget-object p1, p0, Lcom/helpshift/campaigns/fragments/MainFragment;->toolbar:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/fragments/MainFragment;->attachMenuListeners(Landroid/view/Menu;)V

    :cond_1
    return-void
.end method

.method public setToolbarTitle(Ljava/lang/String;)V
    .locals 1

    .line 229
    instance-of v0, p0, Lcom/helpshift/campaigns/fragments/InboxFragment;

    if-eqz v0, :cond_0

    .line 230
    move-object v0, p0

    check-cast v0, Lcom/helpshift/campaigns/fragments/InboxFragment;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/fragments/InboxFragment;->setTitle(Ljava/lang/String;)V

    goto :goto_0

    .line 233
    :cond_0
    invoke-static {p0}, Lcom/helpshift/campaigns/util/FragmentUtil;->getInboxFragment(Landroidx/fragment/app/Fragment;)Lcom/helpshift/campaigns/fragments/InboxFragment;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 235
    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/fragments/InboxFragment;->setTitle(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected shouldRetainInstance()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public showToolbarElevation(Z)V
    .locals 2

    .line 241
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 242
    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/fragments/MainFragment;->showToolbarElevationLollipop(Z)V

    :cond_0
    return-void
.end method
