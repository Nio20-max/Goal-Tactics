.class public Lcom/helpshift/support/fragments/SupportFragment;
.super Lcom/helpshift/support/fragments/MainFragment;
.source "SupportFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/helpshift/support/contracts/SupportScreenView;
.implements Lcom/helpshift/util/FetchDataFromThread;
.implements Lcom/helpshift/support/widget/AttachmentPicker$AttachmentPickerListener;
.implements Landroid/view/MenuItem$OnMenuItemClickListener;
.implements Lcom/helpshift/support/fragments/IToolbarMenuItemRenderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/fragments/SupportFragment$SupportModes;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/helpshift/support/fragments/MainFragment;",
        "Landroid/view/View$OnClickListener;",
        "Lcom/helpshift/support/contracts/SupportScreenView;",
        "Lcom/helpshift/util/FetchDataFromThread<",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        ">;",
        "Lcom/helpshift/support/widget/AttachmentPicker$AttachmentPickerListener;",
        "Landroid/view/MenuItem$OnMenuItemClickListener;",
        "Lcom/helpshift/support/fragments/IToolbarMenuItemRenderer;"
    }
.end annotation


# static fields
.field public static final SUPPORT_MODE:Ljava/lang/String; = "support_mode"

.field private static final TAG:Ljava/lang/String; = "Helpshift_SupportFrag"


# instance fields
.field private attachImageMenuItem:Landroid/view/MenuItem;

.field private bottomSheetContainer:Landroid/widget/FrameLayout;

.field contactUsMenuItem:Landroid/view/MenuItem;

.field private doneMenuItem:Landroid/view/MenuItem;

.field private embeddedToolbarId:I

.field private embeddedToolbarView:Landroidx/appcompat/widget/Toolbar;

.field private embeddedToolbarViewImportanceForAccessibility:I

.field private faqLoaded:Z

.field private fragmentMenuItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private handleNewIntent:Z

.field private hsToolbarView:Landroidx/appcompat/widget/Toolbar;

.field private imagePicker:Lcom/helpshift/support/widget/AttachmentPicker;

.field private isEmbedded:Z

.field private isForeground:Z

.field private isNoOpMode:Z

.field private menuItemEventListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/helpshift/support/fragments/IMenuItemEventListener;",
            ">;"
        }
    .end annotation
.end field

.field private menuItemsPrepared:Z

.field private newIntentData:Landroid/os/Bundle;

.field private newMessageCount:I

.field private searchMenuItem:Landroid/view/MenuItem;

.field private searchView:Landroidx/appcompat/widget/SearchView;

.field private startNewConversationMenuItem:Landroid/view/MenuItem;

.field private supportController:Lcom/helpshift/support/controllers/SupportController;

.field private supportUIContainer:Landroid/widget/LinearLayout;

.field private viewFaqsLoadError:Landroid/view/View;

.field private viewFaqsLoading:Landroid/view/View;

.field private viewNoFaqs:Landroid/view/View;

.field private final visibleFragments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 96
    invoke-direct {p0}, Lcom/helpshift/support/fragments/MainFragment;-><init>()V

    .line 105
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 106
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->visibleFragments:Ljava/util/List;

    const/4 v0, 0x0

    .line 119
    iput v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->newMessageCount:I

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/support/fragments/SupportFragment;)Landroid/widget/LinearLayout;
    .locals 0

    .line 96
    iget-object p0, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportUIContainer:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method private animateViewBottomMarginChange(Landroid/view/View;II)V
    .locals 1

    .line 1317
    new-instance v0, Lcom/helpshift/support/fragments/SupportFragment$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/helpshift/support/fragments/SupportFragment$2;-><init>(Lcom/helpshift/support/fragments/SupportFragment;Landroid/view/View;I)V

    int-to-long p1, p3

    .line 1326
    invoke-virtual {v0, p1, p2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 1327
    iget-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportUIContainer:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->startAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method private attachMenuListeners(Landroid/view/Menu;)V
    .locals 2

    .line 241
    sget v0, Lcom/helpshift/R$id;->hs__search:I

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->searchMenuItem:Landroid/view/MenuItem;

    .line 242
    invoke-static {v0}, Lcom/helpshift/views/HSMenuItemCompat;->getActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SearchView;

    iput-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->searchView:Landroidx/appcompat/widget/SearchView;

    .line 244
    sget v0, Lcom/helpshift/R$id;->hs__contact_us:I

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->contactUsMenuItem:Landroid/view/MenuItem;

    .line 245
    sget v1, Lcom/helpshift/R$string;->hs__contact_us_btn:I

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 246
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->contactUsMenuItem:Landroid/view/MenuItem;

    invoke-interface {v0, p0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 251
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->contactUsMenuItem:Landroid/view/MenuItem;

    invoke-static {v0}, Lcom/helpshift/views/HSMenuItemCompat;->getActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/helpshift/support/fragments/SupportFragment$1;

    invoke-direct {v1, p0}, Lcom/helpshift/support/fragments/SupportFragment$1;-><init>(Lcom/helpshift/support/fragments/SupportFragment;)V

    .line 252
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 259
    sget v0, Lcom/helpshift/R$id;->hs__action_done:I

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->doneMenuItem:Landroid/view/MenuItem;

    .line 260
    invoke-interface {v0, p0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 262
    sget v0, Lcom/helpshift/R$id;->hs__start_new_conversation:I

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->startNewConversationMenuItem:Landroid/view/MenuItem;

    .line 263
    invoke-interface {v0, p0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 265
    sget v0, Lcom/helpshift/R$id;->hs__attach_screenshot:I

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->attachImageMenuItem:Landroid/view/MenuItem;

    .line 266
    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    const/4 p1, 0x1

    .line 268
    iput-boolean p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->menuItemsPrepared:Z

    const/4 p1, 0x0

    .line 269
    invoke-virtual {p0, p1}, Lcom/helpshift/support/fragments/SupportFragment;->setSearchListeners(Lcom/helpshift/support/controllers/FaqFlowController;)V

    .line 270
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->refreshMenu()V

    return-void
.end method

.method private findToolbarViewInViewHierarchy(I)Landroidx/appcompat/widget/Toolbar;
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 1064
    :cond_0
    invoke-virtual {p0, p0}, Lcom/helpshift/support/fragments/SupportFragment;->getActivity(Landroidx/fragment/app/Fragment;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/appcompat/widget/Toolbar;

    if-eqz v1, :cond_1

    return-object v1

    .line 1074
    :cond_1
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v1

    const/4 v2, 0x5

    :goto_0
    add-int/lit8 v3, v2, -0x1

    if-lez v2, :cond_3

    if-eqz v1, :cond_3

    .line 1077
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 1080
    invoke-virtual {v2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/appcompat/widget/Toolbar;

    if-eqz v2, :cond_2

    return-object v2

    .line 1087
    :cond_2
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v1

    move v2, v3

    goto :goto_0

    :cond_3
    return-object v0
.end method

.method private getHSActivityActionBar()Landroidx/appcompat/app/ActionBar;
    .locals 1

    .line 1013
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getHSSupportActivity()Lcom/helpshift/support/activities/ParentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1015
    invoke-virtual {v0}, Lcom/helpshift/support/activities/ParentActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private getHSSupportActivity()Lcom/helpshift/support/activities/ParentActivity;
    .locals 2

    .line 1021
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 1023
    instance-of v1, v0, Lcom/helpshift/support/activities/ParentActivity;

    if-eqz v1, :cond_0

    .line 1024
    check-cast v0, Lcom/helpshift/support/activities/ParentActivity;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private getHeaderTitle()Ljava/lang/String;
    .locals 2

    .line 920
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    .line 921
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getCustomHeaderTitle()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 922
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/helpshift/R$string;->hs__conversation_header:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getCustomHeaderTitle()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private declared-synchronized getImagePicker()Lcom/helpshift/support/widget/AttachmentPicker;
    .locals 4

    monitor-enter p0

    .line 778
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->imagePicker:Lcom/helpshift/support/widget/AttachmentPicker;

    if-nez v0, :cond_0

    .line 779
    new-instance v0, Lcom/helpshift/support/widget/AttachmentPicker;

    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 780
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object v2

    invoke-interface {v2}, Lcom/helpshift/common/platform/Platform;->getDevice()Lcom/helpshift/common/platform/Device;

    move-result-object v2

    .line 782
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v3

    invoke-interface {v3}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v3

    invoke-direct {v0, v1, v2, p0, v3}, Lcom/helpshift/support/widget/AttachmentPicker;-><init>(Landroid/content/Context;Lcom/helpshift/common/platform/Device;Landroidx/fragment/app/Fragment;Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;)V

    iput-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->imagePicker:Lcom/helpshift/support/widget/AttachmentPicker;

    .line 784
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->imagePicker:Lcom/helpshift/support/widget/AttachmentPicker;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private getMenuResourceId()I
    .locals 1

    .line 237
    sget v0, Lcom/helpshift/R$menu;->hs__support_fragment:I

    return v0
.end method

.method private hideAllMenuItems()V
    .locals 2

    .line 339
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->searchMenuItem:Landroid/view/MenuItem;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 340
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->contactUsMenuItem:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 341
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->doneMenuItem:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 342
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->startNewConversationMenuItem:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 343
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->attachImageMenuItem:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

.method private isConversationFragmentVisible()Z
    .locals 2

    .line 907
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportController:Lcom/helpshift/support/controllers/SupportController;

    .line 908
    invoke-virtual {v0}, Lcom/helpshift/support/controllers/SupportController;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-string v1, "HSConversationFragment"

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/conversations/ConversationalFragment;

    if-eqz v0, :cond_0

    .line 910
    invoke-virtual {v0}, Lcom/helpshift/support/conversations/ConversationalFragment;->isResumed()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static newInstance(Landroid/os/Bundle;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 1

    .line 141
    new-instance v0, Lcom/helpshift/support/fragments/SupportFragment;

    invoke-direct {v0}, Lcom/helpshift/support/fragments/SupportFragment;-><init>()V

    .line 142
    invoke-virtual {v0, p0}, Lcom/helpshift/support/fragments/SupportFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private quitSupportFragment()V
    .locals 2

    .line 564
    invoke-virtual {p0, p0}, Lcom/helpshift/support/fragments/SupportFragment;->getActivity(Landroidx/fragment/app/Fragment;)Landroid/app/Activity;

    move-result-object v0

    .line 565
    instance-of v1, v0, Lcom/helpshift/support/activities/ParentActivity;

    if-eqz v1, :cond_0

    .line 566
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 569
    :cond_0
    check-cast v0, Landroidx/appcompat/app/AppCompatActivity;

    .line 570
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 571
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroidx/fragment/app/FragmentTransaction;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    :goto_0
    return-void
.end method

.method private restoreConversationFragmentMenu()V
    .locals 3

    const/4 v0, 0x1

    .line 412
    invoke-direct {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setRetainSearchFragmentState(Z)V

    const/4 v0, 0x0

    .line 413
    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setSearchMenuVisible(Z)V

    .line 414
    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setContactUsMenuVisible(Z)V

    .line 417
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    const-string v2, "HSNewConversationFragment"

    .line 418
    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/helpshift/support/conversations/BaseConversationFragment;

    if-nez v1, :cond_0

    .line 421
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    const-string v2, "HSConversationFragment"

    .line 422
    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/helpshift/support/conversations/BaseConversationFragment;

    :cond_0
    if-eqz v1, :cond_1

    .line 425
    iget-object v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->doneMenuItem:Landroid/view/MenuItem;

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_1
    return-void
.end method

.method private restoreSearchMenuItem()V
    .locals 1

    .line 457
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/util/FragmentUtil;->getFaqFlowFragment(Landroidx/fragment/app/FragmentManager;)Lcom/helpshift/support/fragments/FaqFlowFragment;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 460
    invoke-virtual {v0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/util/FragmentUtil;->getSearchFragment(Landroidx/fragment/app/FragmentManager;)Lcom/helpshift/support/fragments/SearchFragment;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 462
    invoke-virtual {v0}, Lcom/helpshift/support/fragments/SearchFragment;->getCurrentQuery()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setSearchMenuQuery(Ljava/lang/String;)V

    .line 465
    :cond_0
    sget-object v0, Lcom/helpshift/support/ContactUsFilter$LOCATION;->ACTION_BAR:Lcom/helpshift/support/ContactUsFilter$LOCATION;

    invoke-static {v0}, Lcom/helpshift/support/ContactUsFilter;->showContactUs(Lcom/helpshift/support/ContactUsFilter$LOCATION;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setContactUsMenuVisible(Z)V

    const/4 v0, 0x0

    .line 466
    invoke-direct {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setRetainSearchFragmentState(Z)V

    return-void
.end method

.method private restoreSingleQuestionDoneModeFragmentMenu()V
    .locals 2

    .line 408
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->doneMenuItem:Landroid/view/MenuItem;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

.method private sendMenuEventClickEvent(Lcom/helpshift/support/fragments/HSMenuItemType;)V
    .locals 1

    .line 297
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->menuItemEventListener:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 298
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->menuItemEventListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/fragments/IMenuItemEventListener;

    invoke-interface {v0, p1}, Lcom/helpshift/support/fragments/IMenuItemEventListener;->onMenuItemClicked(Lcom/helpshift/support/fragments/HSMenuItemType;)V

    :cond_0
    return-void
.end method

.method private setMenuItemColors()V
    .locals 3

    .line 326
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 327
    iget-object v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->searchMenuItem:Landroid/view/MenuItem;

    invoke-interface {v1}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/util/Styles;->setActionButtonIconColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V

    .line 328
    iget-object v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->contactUsMenuItem:Landroid/view/MenuItem;

    invoke-interface {v1}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/util/Styles;->setActionButtonIconColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V

    .line 329
    iget-object v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->contactUsMenuItem:Landroid/view/MenuItem;

    invoke-static {v1}, Lcom/helpshift/views/HSMenuItemCompat;->getActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v1

    .line 330
    sget v2, Lcom/helpshift/R$id;->hs__notification_badge:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 331
    invoke-virtual {v1}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/util/Styles;->setActionButtonIconColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V

    .line 332
    iget-object v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->doneMenuItem:Landroid/view/MenuItem;

    invoke-interface {v1}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/util/Styles;->setActionButtonIconColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V

    .line 334
    iget-object v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->startNewConversationMenuItem:Landroid/view/MenuItem;

    invoke-interface {v1}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/util/Styles;->setActionButtonIconColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V

    .line 335
    iget-object v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->attachImageMenuItem:Landroid/view/MenuItem;

    invoke-interface {v1}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/util/Styles;->setActionButtonIconColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private setRetainSearchFragmentState(Z)V
    .locals 2

    .line 448
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-string v1, "Helpshift_FaqFlowFrag"

    .line 449
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/fragments/FaqFlowFragment;

    if-eqz v0, :cond_0

    .line 450
    invoke-virtual {v0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->getFaqFlowController()Lcom/helpshift/support/controllers/FaqFlowController;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 451
    invoke-virtual {v0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->getFaqFlowController()Lcom/helpshift/support/controllers/FaqFlowController;

    move-result-object v0

    .line 452
    invoke-virtual {v0, p1}, Lcom/helpshift/support/controllers/FaqFlowController;->setRetainSearchFragmentState(Z)V

    :cond_0
    return-void
.end method

.method private setupEmbeddedToolbarView()V
    .locals 5

    .line 971
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->isEmbedded:Z

    if-nez v0, :cond_0

    return-void

    .line 976
    :cond_0
    iget v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->embeddedToolbarId:I

    if-nez v0, :cond_1

    return-void

    .line 984
    :cond_1
    invoke-direct {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->findToolbarViewInViewHierarchy(I)Landroidx/appcompat/widget/Toolbar;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->embeddedToolbarView:Landroidx/appcompat/widget/Toolbar;

    if-nez v0, :cond_2

    const-string v0, "Helpshift_SupportFrag"

    const-string v1, "Unable to retrieve toolbarView from dev provided toolbarId via ApiConfig"

    .line 986
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 992
    :cond_2
    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v0

    .line 993
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 994
    :goto_0
    invoke-interface {v0}, Landroid/view/Menu;->size()I

    move-result v4

    if-ge v3, v4, :cond_3

    .line 995
    invoke-interface {v0, v3}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 998
    :cond_3
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->embeddedToolbarView:Landroidx/appcompat/widget/Toolbar;

    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getMenuResourceId()I

    move-result v3

    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/Toolbar;->inflateMenu(I)V

    .line 999
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->embeddedToolbarView:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->attachMenuListeners(Landroid/view/Menu;)V

    .line 1002
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->embeddedToolbarView:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v0

    .line 1003
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/helpshift/support/fragments/SupportFragment;->fragmentMenuItems:Ljava/util/List;

    .line 1004
    :goto_1
    invoke-interface {v0}, Landroid/view/Menu;->size()I

    move-result v3

    if-ge v2, v3, :cond_5

    .line 1005
    invoke-interface {v0, v2}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    .line 1006
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 1007
    iget-object v4, p0, Lcom/helpshift/support/fragments/SupportFragment;->fragmentMenuItems:Ljava/util/List;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_5
    return-void
.end method

.method private setupHSToolbarView(Landroid/view/View;)V
    .locals 1

    .line 886
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->isEmbedded:Z

    if-eqz v0, :cond_0

    return-void

    .line 891
    :cond_0
    sget v0, Lcom/helpshift/R$id;->hs__toolbar:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    iput-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->hsToolbarView:Landroidx/appcompat/widget/Toolbar;

    const/4 v0, 0x0

    .line 892
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/Toolbar;->setVisibility(I)V

    .line 893
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getHSSupportActivity()Lcom/helpshift/support/activities/ParentActivity;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 895
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->hsToolbarView:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1, v0}, Lcom/helpshift/support/activities/ParentActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 898
    invoke-virtual {p1}, Lcom/helpshift/support/activities/ParentActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    .line 900
    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    :cond_1
    return-void
.end method

.method private showDynamicFormFragmentMenu()V
    .locals 1

    const/4 v0, 0x1

    .line 475
    invoke-direct {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setRetainSearchFragmentState(Z)V

    const/4 v0, 0x0

    .line 476
    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setContactUsMenuVisible(Z)V

    .line 477
    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setSearchMenuVisible(Z)V

    return-void
.end method

.method private showFaqFragmentMenu()V
    .locals 1

    .line 470
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->faqLoaded:Z

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setSearchMenuVisible(Z)V

    .line 471
    sget-object v0, Lcom/helpshift/support/ContactUsFilter$LOCATION;->ACTION_BAR:Lcom/helpshift/support/ContactUsFilter$LOCATION;

    invoke-static {v0}, Lcom/helpshift/support/ContactUsFilter;->showContactUs(Lcom/helpshift/support/ContactUsFilter$LOCATION;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setContactUsMenuVisible(Z)V

    return-void
.end method

.method private showQuestionListFragmentMenu()V
    .locals 1

    .line 430
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->faqLoaded:Z

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setSearchMenuVisible(Z)V

    .line 431
    sget-object v0, Lcom/helpshift/support/ContactUsFilter$LOCATION;->ACTION_BAR:Lcom/helpshift/support/ContactUsFilter$LOCATION;

    invoke-static {v0}, Lcom/helpshift/support/ContactUsFilter;->showContactUs(Lcom/helpshift/support/ContactUsFilter$LOCATION;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setContactUsMenuVisible(Z)V

    return-void
.end method

.method private showSectionPagerFragmentMenu()V
    .locals 1

    const/4 v0, 0x1

    .line 435
    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setSearchMenuVisible(Z)V

    .line 436
    sget-object v0, Lcom/helpshift/support/ContactUsFilter$LOCATION;->ACTION_BAR:Lcom/helpshift/support/ContactUsFilter$LOCATION;

    invoke-static {v0}, Lcom/helpshift/support/ContactUsFilter;->showContactUs(Lcom/helpshift/support/ContactUsFilter$LOCATION;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setContactUsMenuVisible(Z)V

    return-void
.end method

.method private showSingleQuestionFragmentMenu()V
    .locals 1

    .line 440
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->isScreenLarge()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 441
    invoke-direct {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setRetainSearchFragmentState(Z)V

    const/4 v0, 0x0

    .line 442
    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setSearchMenuVisible(Z)V

    .line 444
    :cond_0
    sget-object v0, Lcom/helpshift/support/ContactUsFilter$LOCATION;->QUESTION_ACTION_BAR:Lcom/helpshift/support/ContactUsFilter$LOCATION;

    invoke-static {v0}, Lcom/helpshift/support/ContactUsFilter;->showContactUs(Lcom/helpshift/support/ContactUsFilter$LOCATION;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setContactUsMenuVisible(Z)V

    return-void
.end method

.method private showToolbarElevationLollipop(Z)V
    .locals 1

    if-eqz p1, :cond_0

    .line 682
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    const/high16 v0, 0x40800000    # 4.0f

    invoke-static {p1, v0}, Lcom/helpshift/util/Styles;->dpToPx(Landroid/content/Context;F)F

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 683
    :goto_0
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->isEmbedded:Z

    if-eqz v0, :cond_1

    .line 684
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->embeddedToolbarView:Landroidx/appcompat/widget/Toolbar;

    if-eqz v0, :cond_2

    .line 685
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/Toolbar;->setElevation(F)V

    goto :goto_1

    .line 689
    :cond_1
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getHSActivityActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 691
    invoke-virtual {v0, p1}, Landroidx/appcompat/app/ActionBar;->setElevation(F)V

    :cond_2
    :goto_1
    return-void
.end method

.method private showToolbarElevationPreLollipop(Z)V
    .locals 2

    .line 697
    invoke-virtual {p0, p0}, Lcom/helpshift/support/fragments/SupportFragment;->getActivity(Landroidx/fragment/app/Fragment;)Landroid/app/Activity;

    move-result-object v0

    sget v1, Lcom/helpshift/R$id;->flow_fragment_container:I

    .line 698
    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    .line 702
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v1, Lcom/helpshift/R$drawable;->hs__actionbar_compat_shadow:I

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 703
    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 706
    :cond_0
    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v1, 0x0

    invoke-direct {p1, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private startLiveUpdates()V
    .locals 2

    .line 577
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-string v1, "HSConversationFragment"

    .line 578
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/conversations/ConversationalFragment;

    if-eqz v0, :cond_0

    .line 580
    invoke-virtual {v0}, Lcom/helpshift/support/conversations/ConversationalFragment;->startLiveUpdates()V

    :cond_0
    return-void
.end method

.method private stopLiveUpdates()V
    .locals 2

    .line 586
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-string v1, "HSConversationFragment"

    .line 587
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/conversations/ConversationalFragment;

    if-eqz v0, :cond_0

    .line 589
    invoke-virtual {v0}, Lcom/helpshift/support/conversations/ConversationalFragment;->stopLiveUpdates()V

    :cond_0
    return-void
.end method

.method private updateBadgeIcon()V
    .locals 5

    .line 509
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->contactUsMenuItem:Landroid/view/MenuItem;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroid/view/MenuItem;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 510
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->contactUsMenuItem:Landroid/view/MenuItem;

    invoke-static {v0}, Lcom/helpshift/views/HSMenuItemCompat;->getActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 512
    sget v1, Lcom/helpshift/R$id;->hs__notification_badge:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 513
    sget v2, Lcom/helpshift/R$id;->hs__notification_badge_padding:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 514
    iget v2, p0, Lcom/helpshift/support/fragments/SupportFragment;->newMessageCount:I

    const/4 v3, 0x0

    const/16 v4, 0x8

    if-eqz v2, :cond_0

    .line 515
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 516
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 517
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 520
    :cond_0
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 521
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method private updateMessageBatchCount(Ljava/lang/Integer;)V
    .locals 0

    .line 742
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->newMessageCount:I

    .line 743
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->updateBadgeIcon()V

    return-void
.end method


# virtual methods
.method public addVisibleFragment(Ljava/lang/String;)V
    .locals 1

    .line 347
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->visibleFragments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 348
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->refreshMenu()V

    return-void
.end method

.method public askForReadStoragePermission()V
    .locals 3

    .line 1176
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-string v1, "HSConversationFragment"

    .line 1177
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/conversations/BaseConversationFragment;

    if-nez v0, :cond_0

    .line 1180
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-string v1, "HSNewConversationFragment"

    .line 1181
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/conversations/BaseConversationFragment;

    :cond_0
    if-eqz v0, :cond_1

    const/4 v1, 0x1

    const/4 v2, 0x2

    .line 1184
    invoke-virtual {v0, v1, v2}, Lcom/helpshift/support/conversations/BaseConversationFragment;->requestPermission(ZI)V

    :cond_1
    return-void
.end method

.method public exitSdkSession()V
    .locals 1

    .line 713
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    instance-of v0, v0, Lcom/helpshift/support/activities/ParentActivity;

    if-eqz v0, :cond_0

    .line 714
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    goto :goto_0

    .line 717
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/helpshift/support/util/FragmentUtil;->removeFragment(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V

    :goto_0
    return-void
.end method

.method public getSupportController()Lcom/helpshift/support/controllers/SupportController;
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportController:Lcom/helpshift/support/controllers/SupportController;

    return-object v0
.end method

.method public hideBottomSheetViewContainer()V
    .locals 3

    .line 1303
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->bottomSheetContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    const-string v0, "Helpshift_SupportFrag"

    const-string v2, "hideBottomSheetViewContainer called"

    .line 1306
    invoke-static {v0, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1309
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->bottomSheetContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 1310
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->bottomSheetContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 1313
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportUIContainer:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    const/16 v2, 0x12c

    invoke-direct {p0, v0, v1, v2}, Lcom/helpshift/support/fragments/SupportFragment;->animateViewBottomMarginChange(Landroid/view/View;II)V

    return-void
.end method

.method public isParentViewBottomSheetDialogFragment()Z
    .locals 4

    .line 1036
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->isEmbedded:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 1041
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    const/4 v2, 0x5

    :goto_0
    add-int/lit8 v3, v2, -0x1

    if-lez v2, :cond_2

    if-eqz v0, :cond_2

    .line 1044
    instance-of v2, v0, Lcom/google/android/material/bottomsheet/BottomSheetDialogFragment;

    if-eqz v2, :cond_1

    const/4 v0, 0x1

    return v0

    .line 1048
    :cond_1
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    move v2, v3

    goto :goto_0

    :cond_2
    return v1
.end method

.method public launchAttachmentPicker(Landroid/os/Bundle;)V
    .locals 1

    .line 723
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getImagePicker()Lcom/helpshift/support/widget/AttachmentPicker;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/helpshift/support/widget/AttachmentPicker;->launchPicker(Landroid/os/Bundle;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 804
    invoke-super {p0, p1, p2, p3}, Lcom/helpshift/support/fragments/MainFragment;->onActivityResult(IILandroid/content/Intent;)V

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    :cond_0
    if-eqz p3, :cond_1

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 808
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getImagePicker()Lcom/helpshift/support/widget/AttachmentPicker;

    move-result-object p2

    invoke-virtual {p2, p1, p3}, Lcom/helpshift/support/widget/AttachmentPicker;->onAttachmentPickRequestResult(ILandroid/content/Intent;)V

    :cond_1
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 4

    const/4 v0, 0x1

    .line 154
    :try_start_0
    invoke-super {p0, p1}, Lcom/helpshift/support/fragments/MainFragment;->onAttach(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object p1

    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/helpshift/common/platform/Platform;->setUIContext(Ljava/lang/Object;)V

    .line 163
    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setRetainInstance(Z)V

    .line 164
    iget-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportController:Lcom/helpshift/support/controllers/SupportController;

    if-nez p1, :cond_0

    .line 165
    new-instance p1, Lcom/helpshift/support/controllers/SupportController;

    .line 166
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v2

    .line 167
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    invoke-direct {p1, v1, p0, v2, v3}, Lcom/helpshift/support/controllers/SupportController;-><init>(Landroid/content/Context;Lcom/helpshift/support/contracts/SupportScreenView;Landroidx/fragment/app/FragmentManager;Landroid/os/Bundle;)V

    iput-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportController:Lcom/helpshift/support/controllers/SupportController;

    goto :goto_0

    .line 170
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/helpshift/support/controllers/SupportController;->onFragmentManagerUpdate(Landroidx/fragment/app/FragmentManager;)V

    .line 172
    :goto_0
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->isChangingConfigurations()Z

    move-result p1

    if-nez p1, :cond_1

    .line 173
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/helpshift/CoreApi;->getConversationInboxPoller()Lcom/helpshift/conversation/ConversationInboxPoller;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/helpshift/conversation/ConversationInboxPoller;->startAppPoller(Z)V

    :cond_1
    return-void

    :catch_0
    move-exception p1

    const-string v1, "Helpshift_SupportFrag"

    const-string v2, "Caught exception in SupportFragment.onAttach()"

    .line 157
    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 158
    iput-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->isNoOpMode:Z

    return-void
.end method

.method public onAttachmentPickerResultFailure(ILjava/lang/Long;)V
    .locals 4

    const/4 v0, -0x5

    const/4 v1, 0x0

    if-eq p1, v0, :cond_4

    const/4 v0, -0x4

    if-eq p1, v0, :cond_3

    const/4 v0, -0x3

    if-eq p1, v0, :cond_2

    const/4 p2, -0x2

    if-eq p1, p2, :cond_1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_0

    goto :goto_0

    .line 1207
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getView()Landroid/view/View;

    move-result-object p1

    sget p2, Lcom/helpshift/R$string;->hs__screenshot_cloud_attach_error:I

    invoke-static {p1, p2, v1}, Lcom/helpshift/support/util/SnackbarUtil;->showSnackbar(Landroid/view/View;II)V

    goto :goto_0

    .line 1202
    :cond_1
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getView()Landroid/view/View;

    move-result-object p1

    sget p2, Lcom/helpshift/R$string;->hs__file_type_unsupported:I

    invoke-static {p1, p2, v1}, Lcom/helpshift/support/util/SnackbarUtil;->showSnackbar(Landroid/view/View;II)V

    goto :goto_0

    .line 1213
    :cond_2
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/helpshift/R$string;->hs__screenshot_limit_error:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 1214
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    long-to-float p2, v2

    const/high16 v2, 0x49800000    # 1048576.0f

    div-float/2addr p2, v2

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    aput-object p2, v0, v1

    .line 1213
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 1215
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getView()Landroid/view/View;

    move-result-object p2

    invoke-static {p2, p1, v1}, Lcom/helpshift/support/util/SnackbarUtil;->showSnackbar(Landroid/view/View;Ljava/lang/CharSequence;I)V

    goto :goto_0

    .line 1199
    :cond_3
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getView()Landroid/view/View;

    move-result-object p1

    sget p2, Lcom/helpshift/R$string;->hs__network_error_msg:I

    invoke-static {p1, p2, v1}, Lcom/helpshift/support/util/SnackbarUtil;->showSnackbar(Landroid/view/View;II)V

    goto :goto_0

    .line 1220
    :cond_4
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getView()Landroid/view/View;

    move-result-object p1

    sget p2, Lcom/helpshift/R$string;->hs__screenshot_upload_error_msg:I

    invoke-static {p1, p2, v1}, Lcom/helpshift/support/util/SnackbarUtil;->showSnackbar(Landroid/view/View;II)V

    :goto_0
    return-void
.end method

.method public onAttachmentPickerResultSuccess(Lcom/helpshift/conversation/dto/AttachmentPickerFile;Landroid/os/Bundle;)V
    .locals 2

    .line 1192
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getSupportController()Lcom/helpshift/support/controllers/SupportController;

    move-result-object v0

    sget-object v1, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$LaunchSource;->GALLERY_APP:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$LaunchSource;

    invoke-virtual {v0, p1, p2, v1}, Lcom/helpshift/support/controllers/SupportController;->startScreenshotPreviewFragment(Lcom/helpshift/conversation/dto/AttachmentPickerFile;Landroid/os/Bundle;Lcom/helpshift/support/fragments/AttachmentPreviewFragment$LaunchSource;)V

    return-void
.end method

.method public onBackPressed()Z
    .locals 6

    .line 612
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    .line 614
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/fragment/app/Fragment;

    if-eqz v2, :cond_0

    .line 615
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->isVisible()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 616
    instance-of v3, v2, Lcom/helpshift/support/fragments/FaqFlowFragment;

    if-nez v3, :cond_2

    instance-of v3, v2, Lcom/helpshift/support/conversations/BaseConversationFragment;

    if-eqz v3, :cond_1

    goto :goto_0

    .line 635
    :cond_1
    instance-of v3, v2, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    if-eqz v3, :cond_0

    .line 636
    check-cast v2, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    invoke-virtual {v2}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->deleteAttachmentLocalCopy()V

    return v1

    .line 617
    :cond_2
    :goto_0
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v3

    .line 618
    invoke-virtual {v3}, Landroidx/fragment/app/FragmentManager;->getBackStackEntryCount()I

    move-result v4

    const/4 v5, 0x1

    if-lez v4, :cond_3

    .line 619
    invoke-virtual {v3}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    return v5

    .line 623
    :cond_3
    instance-of v3, v2, Lcom/helpshift/support/conversations/ConversationalFragment;

    if-eqz v3, :cond_0

    .line 624
    check-cast v2, Lcom/helpshift/support/conversations/ConversationalFragment;

    .line 625
    invoke-virtual {v2}, Lcom/helpshift/support/conversations/ConversationalFragment;->onBackPressed()Z

    move-result v0

    if-eqz v0, :cond_4

    return v5

    .line 629
    :cond_4
    invoke-virtual {v2}, Lcom/helpshift/support/conversations/ConversationalFragment;->stopLiveUpdates()V

    :cond_5
    return v1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 769
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    sget v0, Lcom/helpshift/R$id;->button_retry:I

    if-ne p1, v0, :cond_0

    .line 770
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    invoke-static {p1}, Lcom/helpshift/support/util/FragmentUtil;->getFaqFlowFragment(Landroidx/fragment/app/FragmentManager;)Lcom/helpshift/support/fragments/FaqFlowFragment;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 772
    invoke-virtual {p1}, Lcom/helpshift/support/fragments/FaqFlowFragment;->retryGetSections()V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 831
    invoke-super {p0, p1}, Lcom/helpshift/support/fragments/MainFragment;->onCreate(Landroid/os/Bundle;)V

    .line 834
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "toolbarId"

    .line 836
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->embeddedToolbarId:I

    const/4 v0, 0x0

    const-string v1, "is_embedded"

    .line 837
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->isEmbedded:Z

    .line 841
    :cond_0
    iget p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->embeddedToolbarId:I

    if-nez p1, :cond_1

    const/4 p1, 0x1

    .line 842
    invoke-virtual {p0, p1}, Lcom/helpshift/support/fragments/SupportFragment;->setHasOptionsMenu(Z)V

    :cond_1
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1

    .line 1165
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getMenuResourceId()I

    move-result v0

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 1166
    invoke-direct {p0, p1}, Lcom/helpshift/support/fragments/SupportFragment;->attachMenuListeners(Landroid/view/Menu;)V

    .line 1167
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->menuItemEventListener:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1168
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->menuItemEventListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/fragments/IMenuItemEventListener;

    invoke-interface {v0}, Lcom/helpshift/support/fragments/IMenuItemEventListener;->onCreateOptionMenuCalled()V

    .line 1170
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/helpshift/support/fragments/MainFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 850
    sget p3, Lcom/helpshift/R$layout;->hs__support_fragment:I

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDataFetched(Ljava/lang/Integer;)V
    .locals 0

    .line 748
    invoke-direct {p0, p1}, Lcom/helpshift/support/fragments/SupportFragment;->updateMessageBatchCount(Ljava/lang/Integer;)V

    return-void
.end method

.method public bridge synthetic onDataFetched(Ljava/lang/Object;)V
    .locals 0

    .line 96
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/helpshift/support/fragments/SupportFragment;->onDataFetched(Ljava/lang/Integer;)V

    return-void
.end method

.method public onDestroyView()V
    .locals 3

    .line 1129
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/util/SnackbarUtil;->hideSnackbar(Landroid/view/View;)V

    .line 1131
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->embeddedToolbarView:Landroidx/appcompat/widget/Toolbar;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->fragmentMenuItems:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 1132
    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v0

    .line 1133
    iget-object v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->fragmentMenuItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 1134
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {v0, v2}, Landroid/view/Menu;->removeItem(I)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1139
    iput-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->viewFaqsLoadError:Landroid/view/View;

    .line 1140
    iput-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->viewFaqsLoading:Landroid/view/View;

    .line 1141
    iput-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->viewNoFaqs:Landroid/view/View;

    .line 1143
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onDestroyView()V

    return-void
.end method

.method public onDetach()V
    .locals 2

    .line 1149
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->isNoOpMode:Z

    if-eqz v0, :cond_0

    .line 1151
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onDetach()V

    return-void

    .line 1155
    :cond_0
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/helpshift/common/platform/Platform;->setUIContext(Ljava/lang/Object;)V

    .line 1156
    invoke-static {}, Lcom/helpshift/util/LocaleContextUtil;->restoreApplicationLocale()V

    .line 1157
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1158
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getConversationInboxPoller()Lcom/helpshift/conversation/ConversationInboxPoller;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/conversation/ConversationInboxPoller;->startAppPoller(Z)V

    .line 1160
    :cond_1
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onDetach()V

    return-void
.end method

.method public onFailure(Ljava/lang/Integer;)V
    .locals 0

    return-void
.end method

.method public bridge synthetic onFailure(Ljava/lang/Object;)V
    .locals 0

    .line 96
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/helpshift/support/fragments/SupportFragment;->onFailure(Ljava/lang/Integer;)V

    return-void
.end method

.method public onFaqsLoaded()V
    .locals 3

    const/4 v0, 0x1

    .line 356
    iput-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->faqLoaded:Z

    .line 357
    iget-boolean v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->menuItemsPrepared:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->visibleFragments:Ljava/util/List;

    const-class v2, Lcom/helpshift/support/compositions/FaqFragment;

    .line 358
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->visibleFragments:Ljava/util/List;

    const-class v2, Lcom/helpshift/support/fragments/QuestionListFragment;

    .line 359
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 360
    :cond_0
    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setSearchMenuVisible(Z)V

    :cond_1
    return-void
.end method

.method public onFocusChanged(Z)V
    .locals 3

    .line 601
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 603
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    .line 604
    instance-of v2, v1, Lcom/helpshift/support/conversations/ConversationalFragment;

    if-eqz v2, :cond_0

    .line 605
    check-cast v1, Lcom/helpshift/support/conversations/ConversationalFragment;

    invoke-virtual {v1, p1}, Lcom/helpshift/support/conversations/ConversationalFragment;->onFocusChanged(Z)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 2

    .line 275
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    .line 277
    sget v0, Lcom/helpshift/R$id;->hs__contact_us:I

    const/4 v1, 0x1

    if-ne p1, v0, :cond_0

    .line 278
    iget-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportController:Lcom/helpshift/support/controllers/SupportController;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/helpshift/support/controllers/SupportController;->onContactUsClicked(Ljava/lang/String;)V

    goto :goto_0

    .line 281
    :cond_0
    sget v0, Lcom/helpshift/R$id;->hs__action_done:I

    if-ne p1, v0, :cond_1

    .line 282
    iget-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportController:Lcom/helpshift/support/controllers/SupportController;

    invoke-virtual {p1}, Lcom/helpshift/support/controllers/SupportController;->actionDone()V

    goto :goto_0

    .line 285
    :cond_1
    sget v0, Lcom/helpshift/R$id;->hs__start_new_conversation:I

    if-ne p1, v0, :cond_2

    .line 286
    sget-object p1, Lcom/helpshift/support/fragments/HSMenuItemType;->START_NEW_CONVERSATION:Lcom/helpshift/support/fragments/HSMenuItemType;

    invoke-direct {p0, p1}, Lcom/helpshift/support/fragments/SupportFragment;->sendMenuEventClickEvent(Lcom/helpshift/support/fragments/HSMenuItemType;)V

    goto :goto_0

    .line 289
    :cond_2
    sget v0, Lcom/helpshift/R$id;->hs__attach_screenshot:I

    if-ne p1, v0, :cond_3

    .line 290
    sget-object p1, Lcom/helpshift/support/fragments/HSMenuItemType;->SCREENSHOT_ATTACHMENT:Lcom/helpshift/support/fragments/HSMenuItemType;

    invoke-direct {p0, p1}, Lcom/helpshift/support/fragments/SupportFragment;->sendMenuEventClickEvent(Lcom/helpshift/support/fragments/HSMenuItemType;)V

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public onNewIntent(Landroid/os/Bundle;)V
    .locals 1

    .line 732
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->isForeground:Z

    if-eqz v0, :cond_0

    .line 733
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportController:Lcom/helpshift/support/controllers/SupportController;

    invoke-virtual {v0, p1}, Lcom/helpshift/support/controllers/SupportController;->onNewIntent(Landroid/os/Bundle;)V

    goto :goto_0

    .line 736
    :cond_0
    iput-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->newIntentData:Landroid/os/Bundle;

    .line 738
    :goto_0
    iget-boolean p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->isForeground:Z

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->handleNewIntent:Z

    return-void
.end method

.method public onPause()V
    .locals 1

    .line 210
    invoke-virtual {p0, p0}, Lcom/helpshift/support/fragments/SupportFragment;->getActivity(Landroidx/fragment/app/Fragment;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_0

    .line 211
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->stopLiveUpdates()V

    .line 213
    :cond_0
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onPause()V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 3

    .line 815
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 817
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    if-eqz v1, :cond_0

    .line 819
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->isVisible()Z

    move-result v2

    if-eqz v2, :cond_0

    instance-of v2, v1, Lcom/helpshift/support/conversations/BaseConversationFragment;

    if-eqz v2, :cond_0

    .line 821
    invoke-virtual {v1, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    return-void

    .line 826
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lcom/helpshift/support/fragments/MainFragment;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 1106
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onResume()V

    .line 1107
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportController:Lcom/helpshift/support/controllers/SupportController;

    invoke-virtual {v0}, Lcom/helpshift/support/controllers/SupportController;->start()V

    .line 1108
    sget v0, Lcom/helpshift/R$string;->hs__help_header:I

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->setToolbarTitle(Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 1109
    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->showToolbarElevation(Z)V

    .line 1110
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getConversationController()Lcom/helpshift/conversation/domainmodel/ConversationController;

    move-result-object v0

    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1, p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Lcom/helpshift/conversation/domainmodel/ConversationController;->fetchConversationUpdatesListenerReference:Ljava/util/concurrent/atomic/AtomicReference;

    .line 1112
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->startLiveUpdates()V

    .line 1114
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getNotificationCountSync()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->updateMessageBatchCount(Ljava/lang/Integer;)V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1119
    invoke-super {p0, p1}, Lcom/helpshift/support/fragments/MainFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 1120
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportController:Lcom/helpshift/support/controllers/SupportController;

    if-eqz v0, :cond_0

    .line 1121
    invoke-virtual {v0, p1}, Lcom/helpshift/support/controllers/SupportController;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 1123
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getImagePicker()Lcom/helpshift/support/widget/AttachmentPicker;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/helpshift/support/widget/AttachmentPicker;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method public onStart()V
    .locals 3

    .line 179
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onStart()V

    .line 181
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_0

    .line 182
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->quitSupportFragment()V

    return-void

    .line 186
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "Helpshift_SupportFrag"

    const-string v1, "Helpshift session began."

    .line 187
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    invoke-static {}, Lcom/helpshift/support/HSSearch;->init()V

    .line 189
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "support_mode"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-nez v0, :cond_1

    .line 192
    sget-object v0, Lcom/helpshift/analytics/AnalyticsEventType;->LIBRARY_OPENED:Lcom/helpshift/analytics/AnalyticsEventType;

    goto :goto_0

    .line 195
    :cond_1
    sget-object v0, Lcom/helpshift/analytics/AnalyticsEventType;->LIBRARY_OPENED_DECOMP:Lcom/helpshift/analytics/AnalyticsEventType;

    .line 197
    :goto_0
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v1

    invoke-interface {v1}, Lcom/helpshift/CoreApi;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;)V

    .line 199
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->handleNewIntent:Z

    if-eqz v0, :cond_2

    .line 200
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportController:Lcom/helpshift/support/controllers/SupportController;

    iget-object v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->newIntentData:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Lcom/helpshift/support/controllers/SupportController;->onNewIntent(Landroid/os/Bundle;)V

    .line 201
    iput-boolean v2, p0, Lcom/helpshift/support/fragments/SupportFragment;->handleNewIntent:Z

    .line 203
    :cond_2
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->onSDKSessionStarted()V

    :cond_3
    const/4 v0, 0x1

    .line 205
    iput-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->isForeground:Z

    return-void
.end method

.method public onStop()V
    .locals 3

    .line 218
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Helpshift_SupportFrag"

    const-string v1, "Helpshift session ended."

    .line 219
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    .line 221
    invoke-static {}, Lcom/helpshift/support/HSSearch;->deinit()V

    .line 222
    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object v1

    sget-object v2, Lcom/helpshift/analytics/AnalyticsEventType;->LIBRARY_QUIT:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {v1, v2}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;)V

    const/4 v1, 0x0

    .line 223
    iput-boolean v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->isForeground:Z

    .line 224
    invoke-interface {v0}, Lcom/helpshift/CoreApi;->sendAnalyticsEvent()V

    .line 225
    invoke-interface {v0}, Lcom/helpshift/CoreApi;->onSDKSessionEnded()V

    .line 227
    :cond_0
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getConversationController()Lcom/helpshift/conversation/domainmodel/ConversationController;

    move-result-object v0

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/helpshift/conversation/domainmodel/ConversationController;->fetchConversationUpdatesListenerReference:Ljava/util/concurrent/atomic/AtomicReference;

    .line 228
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onStop()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1

    .line 855
    invoke-super {p0, p1, p2}, Lcom/helpshift/support/fragments/MainFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 856
    sget p2, Lcom/helpshift/R$id;->view_no_faqs:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/support/fragments/SupportFragment;->viewNoFaqs:Landroid/view/View;

    .line 857
    sget p2, Lcom/helpshift/R$id;->view_faqs_loading:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/support/fragments/SupportFragment;->viewFaqsLoading:Landroid/view/View;

    .line 858
    sget p2, Lcom/helpshift/R$id;->view_faqs_load_error:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/support/fragments/SupportFragment;->viewFaqsLoadError:Landroid/view/View;

    .line 859
    sget p2, Lcom/helpshift/R$id;->button_retry:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    .line 860
    invoke-virtual {p2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 862
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p2

    invoke-interface {p2}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object p2

    invoke-virtual {p2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->isHelpshiftBrandingDisabled()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 863
    sget p2, Lcom/helpshift/R$id;->hs_logo:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    const/16 v0, 0x8

    .line 864
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 867
    :cond_0
    sget p2, Lcom/helpshift/R$id;->hs__bottom_sheet_container:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/FrameLayout;

    iput-object p2, p0, Lcom/helpshift/support/fragments/SupportFragment;->bottomSheetContainer:Landroid/widget/FrameLayout;

    .line 868
    sget p2, Lcom/helpshift/R$id;->hs__support_ui_parent_container:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportUIContainer:Landroid/widget/LinearLayout;

    .line 870
    iget-boolean p2, p0, Lcom/helpshift/support/fragments/SupportFragment;->isEmbedded:Z

    if-eqz p2, :cond_1

    .line 871
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->setupEmbeddedToolbarView()V

    goto :goto_0

    .line 874
    :cond_1
    invoke-direct {p0, p1}, Lcom/helpshift/support/fragments/SupportFragment;->setupHSToolbarView(Landroid/view/View;)V

    :goto_0
    return-void
.end method

.method public onViewStateRestored(Landroid/os/Bundle;)V
    .locals 1

    .line 1095
    invoke-super {p0, p1}, Lcom/helpshift/support/fragments/MainFragment;->onViewStateRestored(Landroid/os/Bundle;)V

    if-eqz p1, :cond_1

    .line 1097
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportController:Lcom/helpshift/support/controllers/SupportController;

    if-eqz v0, :cond_0

    .line 1098
    invoke-virtual {v0, p1}, Lcom/helpshift/support/controllers/SupportController;->onViewStateRestored(Landroid/os/Bundle;)V

    .line 1100
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getImagePicker()Lcom/helpshift/support/widget/AttachmentPicker;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/helpshift/support/widget/AttachmentPicker;->onViewStateRestored(Landroid/os/Bundle;)V

    :cond_1
    return-void
.end method

.method public refreshMenu()V
    .locals 6

    .line 365
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->menuItemsPrepared:Z

    if-eqz v0, :cond_c

    .line 366
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->hideAllMenuItems()V

    .line 367
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->setMenuItemColors()V

    .line 368
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->visibleFragments:Ljava/util/List;

    monitor-enter v0

    .line 369
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->visibleFragments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 370
    const-class v3, Lcom/helpshift/support/compositions/FaqFragment;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 371
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->showFaqFragmentMenu()V

    goto :goto_0

    .line 373
    :cond_1
    const-class v3, Lcom/helpshift/support/fragments/SearchFragment;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 374
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->restoreSearchMenuItem()V

    goto :goto_0

    .line 376
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-class v4, Lcom/helpshift/support/fragments/SingleQuestionFragment;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 377
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->showSingleQuestionFragmentMenu()V

    goto :goto_0

    .line 379
    :cond_3
    const-class v3, Lcom/helpshift/support/compositions/SectionPagerFragment;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 380
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->showSectionPagerFragmentMenu()V

    goto :goto_0

    .line 382
    :cond_4
    const-class v3, Lcom/helpshift/support/fragments/QuestionListFragment;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 383
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->showQuestionListFragmentMenu()V

    goto :goto_0

    .line 385
    :cond_5
    const-class v3, Lcom/helpshift/support/conversations/NewConversationFragment;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    const-class v3, Lcom/helpshift/support/conversations/ConversationalFragment;

    .line 386
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    goto :goto_1

    .line 389
    :cond_6
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-class v5, Lcom/helpshift/support/fragments/SingleQuestionFragment;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v5, 0x2

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 390
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->restoreSingleQuestionDoneModeFragmentMenu()V

    goto/16 :goto_0

    .line 392
    :cond_7
    const-class v3, Lcom/helpshift/support/fragments/DynamicFormFragment;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 393
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->showDynamicFormFragmentMenu()V

    goto/16 :goto_0

    .line 395
    :cond_8
    const-class v3, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    const-class v3, Lcom/helpshift/support/conversations/AuthenticationFailureFragment;

    .line 396
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 398
    :cond_9
    invoke-direct {p0, v4}, Lcom/helpshift/support/fragments/SupportFragment;->setRetainSearchFragmentState(Z)V

    const/4 v2, 0x0

    .line 399
    invoke-virtual {p0, v2}, Lcom/helpshift/support/fragments/SupportFragment;->setSearchMenuVisible(Z)V

    .line 400
    invoke-virtual {p0, v2}, Lcom/helpshift/support/fragments/SupportFragment;->setContactUsMenuVisible(Z)V

    goto/16 :goto_0

    .line 387
    :cond_a
    :goto_1
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->restoreConversationFragmentMenu()V

    goto/16 :goto_0

    .line 403
    :cond_b
    monitor-exit v0

    goto :goto_2

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_c
    :goto_2
    return-void
.end method

.method public registerToolbarMenuEventsListener(Lcom/helpshift/support/fragments/IMenuItemEventListener;)V
    .locals 1

    .line 757
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->menuItemEventListener:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method removeHSToolbarHeader(Landroid/view/View;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 958
    sget v0, Lcom/helpshift/R$id;->custom_header_layout:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    const/16 v0, 0x8

    .line 960
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public removeVisibleFragment(Ljava/lang/String;)V
    .locals 1

    .line 352
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->visibleFragments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public resetNewMessageCount()V
    .locals 1

    const/4 v0, 0x0

    .line 528
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/helpshift/support/fragments/SupportFragment;->updateMessageBatchCount(Ljava/lang/Integer;)V

    return-void
.end method

.method public resetToolbarImportanceForAccessibility()V
    .locals 2

    .line 1257
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-ge v0, v1, :cond_0

    return-void

    .line 1261
    :cond_0
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->isEmbedded:Z

    if-eqz v0, :cond_1

    .line 1262
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->embeddedToolbarView:Landroidx/appcompat/widget/Toolbar;

    if-eqz v0, :cond_2

    .line 1263
    iget v1, p0, Lcom/helpshift/support/fragments/SupportFragment;->embeddedToolbarViewImportanceForAccessibility:I

    .line 1264
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/Toolbar;->setImportantForAccessibility(I)V

    goto :goto_0

    .line 1268
    :cond_1
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->hsToolbarView:Landroidx/appcompat/widget/Toolbar;

    if-eqz v0, :cond_2

    const/4 v1, 0x0

    .line 1269
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/Toolbar;->setImportantForAccessibility(I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public setContactUsMenuVisible(Z)V
    .locals 1

    .line 481
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->searchMenuItem:Landroid/view/MenuItem;

    invoke-static {v0}, Lcom/helpshift/views/HSMenuItemCompat;->isActionViewExpanded(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 482
    iget-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->contactUsMenuItem:Landroid/view/MenuItem;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_0

    .line 485
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->contactUsMenuItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 487
    :goto_0
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->updateBadgeIcon()V

    return-void
.end method

.method public setSearchListeners(Lcom/helpshift/support/controllers/FaqFlowController;)V
    .locals 1

    .line 310
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->menuItemsPrepared:Z

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    .line 312
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getRetainedChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/util/FragmentUtil;->getFaqFlowFragment(Landroidx/fragment/app/FragmentManager;)Lcom/helpshift/support/fragments/FaqFlowFragment;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 314
    invoke-virtual {v0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->getFaqFlowController()Lcom/helpshift/support/controllers/FaqFlowController;

    move-result-object p1

    :cond_0
    if-eqz p1, :cond_1

    .line 319
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->searchMenuItem:Landroid/view/MenuItem;

    invoke-static {v0, p1}, Lcom/helpshift/views/HSMenuItemCompat;->setOnActionExpandListener(Landroid/view/MenuItem;Landroid/view/MenuItem$OnActionExpandListener;)V

    .line 320
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->searchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Landroidx/appcompat/widget/SearchView$OnQueryTextListener;)V

    :cond_1
    return-void
.end method

.method public setSearchMenuQuery(Ljava/lang/String;)V
    .locals 2

    .line 499
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->searchMenuItem:Landroid/view/MenuItem;

    invoke-static {v0}, Lcom/helpshift/views/HSMenuItemCompat;->isActionViewExpanded(Landroid/view/MenuItem;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 500
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->searchMenuItem:Landroid/view/MenuItem;

    invoke-static {v0}, Lcom/helpshift/views/HSMenuItemCompat;->expandActionView(Landroid/view/MenuItem;)V

    .line 503
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 504
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->searchView:Landroidx/appcompat/widget/SearchView;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    :cond_1
    return-void
.end method

.method public setSearchMenuVisible(Z)V
    .locals 2

    .line 491
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->searchMenuItem:Landroid/view/MenuItem;

    invoke-static {v0}, Lcom/helpshift/views/HSMenuItemCompat;->isActionViewExpanded(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->visibleFragments:Ljava/util/List;

    const-class v1, Lcom/helpshift/support/fragments/SearchFragment;

    .line 492
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 493
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->searchMenuItem:Landroid/view/MenuItem;

    invoke-static {v0}, Lcom/helpshift/views/HSMenuItemCompat;->collapseActionView(Landroid/view/MenuItem;)V

    .line 495
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->searchMenuItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public setToolbarImportanceForAccessibility(I)V
    .locals 2

    .line 1232
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-ge v0, v1, :cond_0

    return-void

    .line 1236
    :cond_0
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->isEmbedded:Z

    if-eqz v0, :cond_1

    .line 1237
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->embeddedToolbarView:Landroidx/appcompat/widget/Toolbar;

    if-eqz v0, :cond_2

    .line 1240
    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->getImportantForAccessibility()I

    move-result v0

    iput v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->embeddedToolbarViewImportanceForAccessibility:I

    .line 1241
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->embeddedToolbarView:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/Toolbar;->setImportantForAccessibility(I)V

    goto :goto_0

    .line 1246
    :cond_1
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->hsToolbarView:Landroidx/appcompat/widget/Toolbar;

    if-eqz v0, :cond_2

    .line 1247
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/Toolbar;->setImportantForAccessibility(I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public setToolbarTitleAndHeader(Ljava/lang/String;)V
    .locals 2

    .line 651
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->isEmbedded:Z

    if-eqz v0, :cond_0

    .line 652
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->embeddedToolbarView:Landroidx/appcompat/widget/Toolbar;

    if-eqz v0, :cond_2

    .line 653
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 657
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getHSActivityActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 659
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->isConversationFragmentVisible()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 660
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getHeaderTitle()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 661
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/support/fragments/SupportFragment;->setUpHSToolbarHeader(Landroid/view/View;)V

    goto :goto_0

    .line 664
    :cond_1
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/helpshift/support/fragments/SupportFragment;->removeHSToolbarHeader(Landroid/view/View;)V

    .line 665
    invoke-virtual {v0, p1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public setUpHSToolbarHeader(Landroid/view/View;)V
    .locals 5

    .line 935
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    .line 936
    sget v1, Lcom/helpshift/R$id;->custom_header_layout:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 937
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->isConversationFragmentVisible()Z

    move-result v2

    const/16 v3, 0x8

    if-eqz v2, :cond_1

    if-eqz p1, :cond_1

    .line 938
    sget v2, Lcom/helpshift/R$id;->hs__header_title:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/helpshift/views/HSTextView;

    .line 939
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SupportFragment;->getHeaderTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/helpshift/views/HSTextView;->setText(Ljava/lang/CharSequence;)V

    .line 940
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->isConversationHeaderEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 941
    sget v2, Lcom/helpshift/R$id;->hs__header_avatar_image:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/helpshift/views/CircleImageView;

    .line 942
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getConversationHeaderImageLocalPath()Ljava/lang/String;

    move-result-object v0

    .line 943
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, p1, v0}, Lcom/helpshift/support/conversations/messages/AvatarImageLoader;->loadConversationHeaderAvatarImage(Landroid/content/Context;Lcom/helpshift/views/CircleImageView;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 944
    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 947
    :cond_0
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 951
    :cond_1
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public shouldRefreshMenu()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public showBottomSheetViewContainer(Landroid/view/View;I)V
    .locals 2

    const-string v0, "Helpshift_SupportFrag"

    if-eqz p1, :cond_1

    if-gez p2, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "showBottomSheetViewContainer called"

    .line 1288
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1290
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->bottomSheetContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 1291
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->bottomSheetContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 1292
    iget-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->bottomSheetContainer:Landroid/widget/FrameLayout;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 1295
    iget-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->supportUIContainer:Landroid/widget/LinearLayout;

    const/16 v0, 0x12c

    invoke-direct {p0, p1, p2, v0}, Lcom/helpshift/support/fragments/SupportFragment;->animateViewBottomMarginChange(Landroid/view/View;II)V

    return-void

    :cond_1
    :goto_0
    const-string p1, "showBottomSheetViewContainer called with invalid data"

    .line 1284
    invoke-static {v0, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public showToolbarElevation(Z)V
    .locals 2

    .line 672
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 673
    invoke-direct {p0, p1}, Lcom/helpshift/support/fragments/SupportFragment;->showToolbarElevationLollipop(Z)V

    goto :goto_0

    .line 676
    :cond_0
    invoke-direct {p0, p1}, Lcom/helpshift/support/fragments/SupportFragment;->showToolbarElevationPreLollipop(Z)V

    :goto_0
    return-void
.end method

.method public unRegisterSearchListener()V
    .locals 2

    .line 303
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->menuItemsPrepared:Z

    if-eqz v0, :cond_0

    .line 304
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->searchMenuItem:Landroid/view/MenuItem;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/helpshift/views/HSMenuItemCompat;->setOnActionExpandListener(Landroid/view/MenuItem;Landroid/view/MenuItem$OnActionExpandListener;)V

    .line 305
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->searchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Landroidx/appcompat/widget/SearchView$OnQueryTextListener;)V

    :cond_0
    return-void
.end method

.method public unRegisterToolbarMenuEventsListener(Lcom/helpshift/support/fragments/IMenuItemEventListener;)V
    .locals 1

    .line 761
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->menuItemEventListener:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    .line 762
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_0

    const/4 p1, 0x0

    .line 763
    iput-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->menuItemEventListener:Ljava/lang/ref/WeakReference;

    :cond_0
    return-void
.end method

.method public updateFaqLoadingUI(I)V
    .locals 2

    .line 532
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->viewNoFaqs:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 533
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->viewFaqsLoading:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 534
    iget-object v0, p0, Lcom/helpshift/support/fragments/SupportFragment;->viewFaqsLoadError:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    const/4 v1, 0x3

    if-eq p1, v1, :cond_0

    goto :goto_0

    .line 546
    :cond_0
    iget-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->viewFaqsLoadError:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 543
    :cond_1
    iget-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->viewNoFaqs:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 538
    :cond_2
    iget-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->viewFaqsLoading:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public updateMenuItemVisibility(Lcom/helpshift/support/fragments/HSMenuItemType;Z)V
    .locals 1

    .line 789
    sget-object v0, Lcom/helpshift/support/fragments/SupportFragment$3;->$SwitchMap$com$helpshift$support$fragments$HSMenuItemType:[I

    invoke-virtual {p1}, Lcom/helpshift/support/fragments/HSMenuItemType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 796
    :cond_0
    iget-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->attachImageMenuItem:Landroid/view/MenuItem;

    if-eqz p1, :cond_2

    .line 797
    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_0

    .line 791
    :cond_1
    iget-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment;->startNewConversationMenuItem:Landroid/view/MenuItem;

    if-eqz p1, :cond_2

    .line 792
    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_2
    :goto_0
    return-void
.end method
