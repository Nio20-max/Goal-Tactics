.class public Lcom/helpshift/support/activities/ParentActivity;
.super Lcom/helpshift/activities/MainActivity;
.source "ParentActivity.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_PrntAct"


# instance fields
.field fragmentManager:Landroidx/fragment/app/FragmentManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/helpshift/activities/MainActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 3

    .line 69
    iget-object v0, p0, Lcom/helpshift/support/activities/ParentActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 71
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    if-eqz v1, :cond_0

    .line 73
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->isVisible()Z

    move-result v2

    if-eqz v2, :cond_0

    instance-of v2, v1, Lcom/helpshift/support/fragments/SupportFragment;

    if-eqz v2, :cond_0

    .line 75
    move-object v2, v1

    check-cast v2, Lcom/helpshift/support/fragments/SupportFragment;

    invoke-virtual {v2}, Lcom/helpshift/support/fragments/SupportFragment;->onBackPressed()Z

    move-result v2

    if-eqz v2, :cond_1

    return-void

    .line 79
    :cond_1
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    .line 80
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->getBackStackEntryCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 81
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    return-void

    .line 88
    :cond_2
    invoke-super {p0}, Lcom/helpshift/activities/MainActivity;->onBackPressed()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    const-string v0, "Helpshift_PrntAct"

    .line 29
    :try_start_0
    invoke-super {p0, p1}, Lcom/helpshift/activities/MainActivity;->onCreate(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    sget-object v1, Lcom/helpshift/util/HelpshiftContext;->installCallSuccessful:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_0

    const-string p1, "Install call not successful, falling back to launcher activity"

    .line 43
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    invoke-static {p0}, Lcom/helpshift/util/ActivityUtil;->startLauncherActivityAndFinish(Landroid/app/Activity;)V

    return-void

    .line 48
    :cond_0
    sget v0, Lcom/helpshift/R$layout;->hs__parent_activity:I

    invoke-virtual {p0, v0}, Lcom/helpshift/support/activities/ParentActivity;->setContentView(I)V

    .line 50
    invoke-virtual {p0}, Lcom/helpshift/support/activities/ParentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/activities/ParentActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    if-nez p1, :cond_2

    .line 54
    invoke-virtual {p0}, Lcom/helpshift/support/activities/ParentActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    if-nez p1, :cond_1

    .line 56
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    :cond_1
    const/4 v0, 0x0

    const-string v1, "is_embedded"

    .line 58
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 60
    iget-object v0, p0, Lcom/helpshift/support/activities/ParentActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    .line 61
    sget v1, Lcom/helpshift/R$id;->support_fragment_container:I

    .line 62
    invoke-static {p1}, Lcom/helpshift/support/fragments/SupportFragment;->newInstance(Landroid/os/Bundle;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p1

    .line 61
    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 63
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    :cond_2
    return-void

    :catch_0
    move-exception p1

    const-string v1, "Caught exception in ParentActivity.onCreate()"

    .line 33
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 34
    sget-object p1, Lcom/helpshift/util/HelpshiftContext;->installCallSuccessful:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-nez p1, :cond_3

    .line 35
    invoke-static {p0}, Lcom/helpshift/util/ActivityUtil;->startLauncherActivityAndFinish(Landroid/app/Activity;)V

    :cond_3
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 3

    .line 93
    invoke-super {p0, p1}, Lcom/helpshift/activities/MainActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 94
    iget-object v0, p0, Lcom/helpshift/support/activities/ParentActivity;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 99
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    .line 100
    instance-of v2, v1, Lcom/helpshift/support/fragments/SupportFragment;

    if-eqz v2, :cond_1

    .line 101
    check-cast v1, Lcom/helpshift/support/fragments/SupportFragment;

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/helpshift/support/fragments/SupportFragment;->onNewIntent(Landroid/os/Bundle;)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 108
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-eq v0, v1, :cond_0

    .line 115
    invoke-super {p0, p1}, Lcom/helpshift/activities/MainActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    .line 110
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/activities/ParentActivity;->onBackPressed()V

    const/4 p1, 0x1

    return p1
.end method
