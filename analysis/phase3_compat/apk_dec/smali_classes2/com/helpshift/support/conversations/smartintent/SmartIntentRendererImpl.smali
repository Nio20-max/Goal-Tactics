.class public Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;
.super Ljava/lang/Object;
.source "SmartIntentRendererImpl.java"

# interfaces
.implements Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;
.implements Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;


# instance fields
.field private adapter:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;

.field backButtonListener:Landroid/view/View$OnClickListener;

.field bottomSheetCollapseListener:Landroid/view/View$OnClickListener;

.field private bottomSheetToolbarButtonView:Landroid/widget/ImageView;

.field private clearSearch:Landroid/widget/ImageButton;

.field private collapseHeaderTitleView:Landroid/widget/TextView;

.field private collapseModeHeaderContainer:Landroid/view/View;

.field private collapsedShadowView:Landroid/view/View;

.field private context:Landroid/content/Context;

.field private crossButtonView:Landroid/widget/ImageView;

.field private editFieldView:Landroid/widget/EditText;

.field private emptySearchResultHintView:Landroid/widget/TextView;

.field private expandButtonView:Landroid/widget/ImageView;

.field private expandHeaderTitleView:Landroid/widget/TextView;

.field private expandModeHeaderContainer:Landroid/view/View;

.field private expandedShadowView:Landroid/view/View;

.field private isParentBottomSheetDialogFragment:Z

.field private lastViewState:Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

.field private recyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private replyButton:Landroid/widget/ImageButton;

.field private replyValidationFailedView:Landroid/widget/TextView;

.field private router:Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;

.field private scrollableViewContainer:Landroid/view/View;

.field private searchIcon:Landroid/widget/ImageView;

.field private slideDownAnimation:Landroid/view/animation/Animation;

.field private slideFromLeftAnimControl:Landroid/view/animation/LayoutAnimationController;

.field private slideFromRightAnimControl:Landroid/view/animation/LayoutAnimationController;

.field private viewToDim:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;Z)V
    .locals 1

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 294
    new-instance v0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$10;

    invoke-direct {v0, p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$10;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V

    iput-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->backButtonListener:Landroid/view/View$OnClickListener;

    .line 302
    new-instance v0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$11;

    invoke-direct {v0, p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$11;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V

    iput-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetCollapseListener:Landroid/view/View$OnClickListener;

    .line 97
    iput-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    .line 98
    iput-object p2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->router:Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;

    .line 99
    iput-boolean p3, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->isParentBottomSheetDialogFragment:Z

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;
    .locals 0

    .line 51
    iget-object p0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->router:Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;

    return-object p0
.end method

.method static synthetic access$100(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;Z)V
    .locals 0

    .line 51
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->onReplyFieldViewFocusedChanged(Z)V

    return-void
.end method

.method static synthetic access$1000(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;F)V
    .locals 0

    .line 51
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->handleBottomSheetSlideChange(F)V

    return-void
.end method

.method static synthetic access$200(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)Landroid/widget/EditText;
    .locals 0

    .line 51
    iget-object p0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$300(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V
    .locals 0

    .line 51
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->hideKeyboard()V

    return-void
.end method

.method static synthetic access$400(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V
    .locals 0

    .line 51
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->onBottomSheetToExpandButtonClicked()V

    return-void
.end method

.method static synthetic access$500(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;
    .locals 0

    .line 51
    iget-object p0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->lastViewState:Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

    return-object p0
.end method

.method static synthetic access$600(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)Landroid/view/animation/LayoutAnimationController;
    .locals 0

    .line 51
    iget-object p0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->slideFromLeftAnimControl:Landroid/view/animation/LayoutAnimationController;

    return-object p0
.end method

.method static synthetic access$700(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    .line 51
    iget-object p0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    return-object p0
.end method

.method static synthetic access$800(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V
    .locals 0

    .line 51
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->onBottomSheetToCollapseButtonClicked()V

    return-void
.end method

.method static synthetic access$900(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;I)V
    .locals 0

    .line 51
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->handleBottomSheetStateChange(I)V

    return-void
.end method

.method private bindCollapsedRootViewState(Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;)V
    .locals 5

    .line 346
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->hideKeyboard()V

    .line 349
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandModeHeaderContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 350
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseModeHeaderContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 352
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseHeaderTitleView:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;->promptTitle:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 353
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapsedShadowView:Landroid/view/View;

    invoke-static {v0, v1}, Lcom/helpshift/util/HSAnimationUtil;->fadeVisibilityIn(Landroid/view/View;I)V

    .line 356
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandHeaderTitleView:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;->promptTitle:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 359
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V

    .line 360
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->adapter:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p1, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;->rootIntentUIModels:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v2}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->updateIntentUIModels(Ljava/util/List;)V

    .line 363
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    iget-object v2, p1, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;->typingBoxHint:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 366
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->getBottomSheetBehaviour()Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;

    move-result-object v0

    .line 367
    invoke-virtual {v0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->getState()I

    move-result v2

    const/4 v3, 0x4

    if-eq v2, v3, :cond_0

    .line 368
    invoke-virtual {v0, v3}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->setState(I)V

    .line 372
    :cond_0
    iget-object v2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandButtonView:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const v4, 0x1010036

    invoke-static {v2, v3, v4}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    .line 376
    iget-boolean v2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->isParentBottomSheetDialogFragment:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    .line 377
    invoke-virtual {v0, v1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->setDraggable(Z)V

    goto :goto_0

    .line 380
    :cond_1
    invoke-virtual {v0, v3}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->setDraggable(Z)V

    .line 385
    :goto_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, Lcom/helpshift/R$string;->hs__picker_options_expand_header_voice_over:I

    new-array v3, v3, [Ljava/lang/Object;

    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;->promptTitle:Ljava/lang/String;

    aput-object p1, v3, v1

    invoke-virtual {v0, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 387
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseModeHeaderContainer:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private bindExpandedRootViewState(Lcom/helpshift/conversation/smartintent/SmartIntentExpandedRootViewState;)V
    .locals 5

    .line 421
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseModeHeaderContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 422
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandModeHeaderContainer:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 424
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetToolbarButtonView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 425
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetToolbarButtonView:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetCollapseListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 426
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetToolbarButtonView:Landroid/widget/ImageView;

    const/16 v3, 0x64

    const/4 v4, 0x0

    invoke-static {v0, v3, v4}, Lcom/helpshift/util/HSAnimationUtil;->rotate(Landroid/view/View;IF)V

    .line 428
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->crossButtonView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 429
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->emptySearchResultHintView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 430
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandHeaderTitleView:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentExpandedRootViewState;->promptTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 433
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetToolbarButtonView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const v3, 0x1010036

    invoke-static {v0, v1, v3}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    .line 437
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V

    .line 438
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->adapter:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p1, Lcom/helpshift/conversation/smartintent/SmartIntentExpandedRootViewState;->rootIntentUIModels:Ljava/util/List;

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->updateIntentUIModels(Ljava/util/List;)V

    .line 441
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentExpandedRootViewState;->typingBoxHint:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 444
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->getBottomSheetBehaviour()Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;

    move-result-object p1

    .line 445
    invoke-virtual {p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->getState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 446
    invoke-virtual {p1, v1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->setState(I)V

    .line 450
    :cond_0
    iget-boolean v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->isParentBottomSheetDialogFragment:Z

    if-eqz v0, :cond_1

    .line 451
    invoke-virtual {p1, v2}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->setDraggable(Z)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    .line 454
    invoke-virtual {p1, v0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->setDraggable(Z)V

    .line 458
    :goto_0
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetToolbarButtonView:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    sget v1, Lcom/helpshift/R$string;->hs__picker_options_list_collapse_btn_voice_over:I

    .line 459
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 458
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private bindLeafViewState(Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;)V
    .locals 4

    .line 494
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseModeHeaderContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 495
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandModeHeaderContainer:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 496
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetToolbarButtonView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 497
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->crossButtonView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 498
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->emptySearchResultHintView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 499
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandHeaderTitleView:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;->promptTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 501
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetToolbarButtonView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->backButtonListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 502
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetToolbarButtonView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandModeHeaderContainer:Landroid/view/View;

    .line 503
    invoke-static {v1}, Lcom/helpshift/util/HSViewUtil;->isViewDirectionRtl(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/high16 v1, -0x3d4c0000    # -90.0f

    goto :goto_0

    :cond_0
    const/high16 v1, 0x42b40000    # 90.0f

    :goto_0
    const/16 v3, 0x64

    .line 502
    invoke-static {v0, v3, v1}, Lcom/helpshift/util/HSAnimationUtil;->rotate(Landroid/view/View;IF)V

    .line 506
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetToolbarButtonView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const v3, 0x1010036

    invoke-static {v0, v1, v3}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    .line 510
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V

    .line 511
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->adapter:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p1, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;->leafIntentUIModels:Ljava/util/List;

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->updateIntentUIModels(Ljava/util/List;)V

    .line 514
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;->typingBoxHint:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 517
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->getBottomSheetBehaviour()Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;

    move-result-object p1

    .line 518
    invoke-virtual {p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->getState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    .line 519
    invoke-virtual {p1, v1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->setState(I)V

    .line 521
    :cond_1
    invoke-virtual {p1, v2}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->setDraggable(Z)V

    .line 524
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetToolbarButtonView:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    sget v1, Lcom/helpshift/R$string;->hs__picker_search_edit_back_btn_voice_over:I

    .line 525
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 524
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private bindSearchResultViewState(Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;)V
    .locals 5

    .line 561
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseModeHeaderContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 562
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandModeHeaderContainer:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 563
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetToolbarButtonView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 564
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->crossButtonView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 565
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandHeaderTitleView:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;->promptTitle:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 568
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->crossButtonView:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const v4, 0x1010036

    invoke-static {v0, v3, v4}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    .line 570
    iget-object v0, p1, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;->searchIntentUIModels:Ljava/util/List;

    invoke-static {v0}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 571
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->emptySearchResultHintView:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 572
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->emptySearchResultHintView:Landroid/widget/TextView;

    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;->emptySearchDescription:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 573
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V

    goto :goto_0

    .line 576
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->emptySearchResultHintView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 577
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V

    .line 579
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->adapter:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;

    new-instance v1, Ljava/util/ArrayList;

    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;->searchIntentUIModels:Ljava/util/List;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 580
    invoke-virtual {v0, v1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->updateIntentUIModels(Ljava/util/List;)V

    .line 584
    :goto_0
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->getBottomSheetBehaviour()Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;

    move-result-object p1

    .line 585
    invoke-virtual {p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->getState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    .line 586
    invoke-virtual {p1, v1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->setState(I)V

    .line 588
    :cond_1
    invoke-virtual {p1, v2}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->setDraggable(Z)V

    return-void
.end method

.method private calculateBottomSheetPeakHeight(I)I
    .locals 1

    mul-int/lit8 p1, p1, 0x40

    add-int/lit8 p1, p1, 0x70

    .line 683
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    int-to-float p1, p1

    invoke-static {v0, p1}, Lcom/helpshift/util/Styles;->dpToPx(Landroid/content/Context;F)F

    move-result p1

    float-to-int p1, p1

    .line 684
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/helpshift/util/ApplicationUtil;->getScreenHeight(Landroid/content/Context;)I

    move-result v0

    .line 687
    div-int/lit8 v0, v0, 0x2

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    return p1
.end method

.method private collapsedViewAnimations()V
    .locals 2

    .line 392
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseModeHeaderContainer:Landroid/view/View;

    invoke-static {v0}, Lcom/helpshift/util/HSViewUtil;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandModeHeaderContainer:Landroid/view/View;

    .line 393
    invoke-static {v0}, Lcom/helpshift/util/HSViewUtil;->isGone(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 396
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseModeHeaderContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/helpshift/util/HSAnimationUtil;->fadeVisibilityIn(Landroid/view/View;I)V

    .line 397
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandModeHeaderContainer:Landroid/view/View;

    invoke-static {v0, v1}, Lcom/helpshift/util/HSAnimationUtil;->fadeVisibilityGone(Landroid/view/View;I)V

    return-void
.end method

.method private disableSendReplyButton()V
    .locals 3

    .line 850
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyButton:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 851
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$attr;->hs__reply_button_disabled_alpha:I

    .line 852
    invoke-static {v0, v2}, Lcom/helpshift/support/util/Styles;->getInt(Landroid/content/Context;I)I

    move-result v0

    .line 853
    iget-object v2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyButton:Landroid/widget/ImageButton;

    invoke-static {v2, v0}, Lcom/helpshift/support/util/Styles;->setImageAlpha(Landroid/widget/ImageButton;I)V

    .line 854
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyButton:Landroid/widget/ImageButton;

    .line 855
    invoke-virtual {v2}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-static {v0, v2, v1}, Lcom/helpshift/support/util/Styles;->setSendMessageButtonIconColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Z)V

    return-void
.end method

.method private enableSendReplyButton()V
    .locals 3

    .line 840
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyButton:Landroid/widget/ImageButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 841
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyButton:Landroid/widget/ImageButton;

    const/16 v2, 0xff

    invoke-static {v0, v2}, Lcom/helpshift/support/util/Styles;->setImageAlpha(Landroid/widget/ImageButton;I)V

    .line 842
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyButton:Landroid/widget/ImageButton;

    .line 843
    invoke-virtual {v2}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-static {v0, v2, v1}, Lcom/helpshift/support/util/Styles;->setSendMessageButtonIconColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Z)V

    return-void
.end method

.method private expandViewAnimations()V
    .locals 3

    .line 464
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseModeHeaderContainer:Landroid/view/View;

    invoke-static {v0}, Lcom/helpshift/util/HSViewUtil;->isGone(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandModeHeaderContainer:Landroid/view/View;

    .line 465
    invoke-static {v0}, Lcom/helpshift/util/HSViewUtil;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 468
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseModeHeaderContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/helpshift/util/HSAnimationUtil;->fadeVisibilityGone(Landroid/view/View;I)V

    .line 469
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandModeHeaderContainer:Landroid/view/View;

    invoke-static {v0, v1}, Lcom/helpshift/util/HSAnimationUtil;->fadeVisibilityIn(Landroid/view/View;I)V

    .line 470
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetToolbarButtonView:Landroid/widget/ImageView;

    const/16 v1, 0x64

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/helpshift/util/HSAnimationUtil;->rotate(Landroid/view/View;IF)V

    return-void
.end method

.method private getBottomSheetBehaviorCallback()Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;
    .locals 1

    .line 597
    new-instance v0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$12;

    invoke-direct {v0, p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$12;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V

    return-object v0
.end method

.method private handleBottomSheetSlideChange(F)V
    .locals 5

    float-to-double v0, p1

    const-wide v2, 0x3fb999999999999aL    # 0.1

    cmpl-double v4, v0, v2

    if-lez v4, :cond_0

    .line 638
    iget-object v2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapsedShadowView:Landroid/view/View;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    const-wide v2, 0x3fd3333333333333L    # 0.3

    cmpl-double v4, v0, v2

    if-lez v4, :cond_2

    .line 646
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->isLeafViewState()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 647
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->leafViewAnimations()V

    goto :goto_0

    .line 650
    :cond_1
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandViewAnimations()V

    goto :goto_0

    .line 654
    :cond_2
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapsedViewAnimations()V

    .line 657
    :goto_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->viewToDim:Landroid/view/View;

    const/4 v1, 0x0

    const/high16 v2, -0x1000000

    invoke-static {v1, v2, p1}, Landroidx/core/graphics/ColorUtils;->blendARGB(IIF)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method private handleBottomSheetStateChange(I)V
    .locals 1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 621
    :cond_0
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->router:Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;

    invoke-interface {p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;->onSmartIntentBottomSheetCollapsed()V

    goto :goto_0

    .line 624
    :cond_1
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->router:Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;

    invoke-interface {p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;->onSmartIntentBottomSheetExpanded()V

    :goto_0
    return-void
.end method

.method private hideKeyboard()V
    .locals 2

    .line 873
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 874
    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/helpshift/util/KeyboardUtil;->hideKeyboard(Landroid/content/Context;Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method private isLeafViewState()Z
    .locals 1

    .line 883
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->lastViewState:Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

    instance-of v0, v0, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;

    return v0
.end method

.method private isViewInitialized()Z
    .locals 1

    .line 879
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->lastViewState:Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private leafViewAnimations()V
    .locals 3

    .line 530
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseModeHeaderContainer:Landroid/view/View;

    invoke-static {v0}, Lcom/helpshift/util/HSViewUtil;->isGone(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandModeHeaderContainer:Landroid/view/View;

    .line 531
    invoke-static {v0}, Lcom/helpshift/util/HSViewUtil;->isVisible(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 534
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseModeHeaderContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/helpshift/util/HSAnimationUtil;->fadeVisibilityGone(Landroid/view/View;I)V

    .line 535
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandModeHeaderContainer:Landroid/view/View;

    invoke-static {v0, v1}, Lcom/helpshift/util/HSAnimationUtil;->fadeVisibilityIn(Landroid/view/View;I)V

    .line 536
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetToolbarButtonView:Landroid/widget/ImageView;

    const/16 v1, 0x64

    iget-object v2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandModeHeaderContainer:Landroid/view/View;

    .line 537
    invoke-static {v2}, Lcom/helpshift/util/HSViewUtil;->isViewDirectionRtl(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/high16 v2, -0x3d4c0000    # -90.0f

    goto :goto_0

    :cond_1
    const/high16 v2, 0x42b40000    # 90.0f

    .line 536
    :goto_0
    invoke-static {v0, v1, v2}, Lcom/helpshift/util/HSAnimationUtil;->rotate(Landroid/view/View;IF)V

    return-void
.end method

.method private onBottomSheetToCollapseButtonClicked()V
    .locals 2

    .line 324
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapsedViewAnimations()V

    .line 325
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->getBottomSheetBehaviour()Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->setState(I)V

    return-void
.end method

.method private onBottomSheetToExpandButtonClicked()V
    .locals 2

    .line 319
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandViewAnimations()V

    .line 320
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->getBottomSheetBehaviour()Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->setState(I)V

    return-void
.end method

.method private onReplyFieldViewFocusedChanged(Z)V
    .locals 1

    if-eqz p1, :cond_0

    .line 311
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->getBottomSheetBehaviour()Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;

    move-result-object p1

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->setState(I)V

    goto :goto_0

    .line 314
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->hideKeyboard()V

    :goto_0
    return-void
.end method

.method private registerViewListeners()V
    .locals 2

    .line 208
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    new-instance v1, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$1;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$1;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 218
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setClickable(Z)V

    .line 219
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 220
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    new-instance v1, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$2;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$2;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 226
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    new-instance v1, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$3;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$3;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 233
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    new-instance v1, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$4;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$4;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 246
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandButtonView:Landroid/widget/ImageView;

    new-instance v1, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$5;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$5;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 253
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetToolbarButtonView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetCollapseListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 254
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyButton:Landroid/widget/ImageButton;

    new-instance v1, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$6;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$6;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 261
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->crossButtonView:Landroid/widget/ImageView;

    new-instance v1, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$7;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$7;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 274
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseModeHeaderContainer:Landroid/view/View;

    new-instance v1, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$8;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$8;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 281
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->clearSearch:Landroid/widget/ImageButton;

    new-instance v1, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$9;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$9;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public dismissSmartIntentUI(Z)V
    .locals 1

    const/4 v0, 0x0

    .line 692
    iput-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->lastViewState:Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

    if-eqz p1, :cond_0

    .line 693
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->scrollableViewContainer:Landroid/view/View;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->slideDownAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_0

    .line 694
    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 696
    :cond_0
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->router:Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;

    invoke-interface {p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;->removeSmartIntentViewFromBottomSheet()V

    return-void
.end method

.method public getBottomSheetBehaviour()Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;
    .locals 1

    .line 832
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->scrollableViewContainer:Landroid/view/View;

    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;

    return-object v0
.end method

.method public getReply()Ljava/lang/String;
    .locals 1

    .line 765
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->isViewInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 768
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hideReplyValidationFailedError()V
    .locals 2

    .line 787
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->isViewInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 788
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyValidationFailedView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public isUIInExpandedMode()Z
    .locals 1

    .line 887
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->lastViewState:Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

    instance-of v0, v0, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public onIntentSelected(Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;)V
    .locals 1

    .line 860
    instance-of v0, p1, Lcom/helpshift/conversation/smartintent/RootIntentUIModel;

    if-eqz v0, :cond_0

    .line 861
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->router:Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;

    check-cast p1, Lcom/helpshift/conversation/smartintent/RootIntentUIModel;

    invoke-interface {v0, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;->onRootIntentSelected(Lcom/helpshift/conversation/smartintent/RootIntentUIModel;)V

    goto :goto_0

    .line 863
    :cond_0
    instance-of v0, p1, Lcom/helpshift/conversation/smartintent/LeafIntentUIModel;

    if-eqz v0, :cond_1

    .line 864
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->router:Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;

    check-cast p1, Lcom/helpshift/conversation/smartintent/LeafIntentUIModel;

    invoke-interface {v0, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;->onLeafIntentSelected(Lcom/helpshift/conversation/smartintent/LeafIntentUIModel;)V

    goto :goto_0

    .line 866
    :cond_1
    instance-of v0, p1, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;

    if-eqz v0, :cond_2

    .line 867
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->router:Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;

    check-cast p1, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;

    invoke-interface {v0, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;->onSearchIntentSelected(Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;)V

    .line 869
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->slideFromRightAnimControl:Landroid/view/animation/LayoutAnimationController;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    return-void
.end method

.method public setReply(Ljava/lang/String;)V
    .locals 1

    .line 773
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->isViewInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 777
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 779
    invoke-static {p1, v0}, Lcom/helpshift/util/StringUtils;->isEqual(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 780
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 781
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setSelection(I)V

    :cond_1
    return-void
.end method

.method public showReplyValidationFailedError()V
    .locals 5

    .line 794
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->isViewInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 798
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->scrollableViewContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 800
    :goto_0
    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 801
    sget v4, Lcom/helpshift/R$string;->hs__conversation_detail_error:I

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    if-eqz v0, :cond_2

    .line 804
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    invoke-direct {v0, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 805
    sget v3, Lcom/helpshift/R$string;->hs__landscape_input_validation_dialog_title:I

    .line 806
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 807
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 808
    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const v1, 0x104000a

    .line 809
    new-instance v2, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$13;

    invoke-direct {v2, p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$13;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V

    .line 810
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 816
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_1

    .line 820
    :cond_2
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyValidationFailedView:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 821
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyValidationFailedView:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_1
    return-void
.end method

.method public showSmartIntentUI(Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;)V
    .locals 5

    .line 104
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    .line 105
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/helpshift/R$layout;->hs__smart_intents_container:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 106
    sget v1, Lcom/helpshift/R$id;->hs__si_scrollable_view_container:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->scrollableViewContainer:Landroid/view/View;

    .line 107
    sget v1, Lcom/helpshift/R$id;->hs__si_background_dim_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->viewToDim:Landroid/view/View;

    .line 108
    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$anim;->hs__slide_up:I

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    .line 109
    iget-object v2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->scrollableViewContainer:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 111
    sget v1, Lcom/helpshift/R$id;->hs__si_header_collapsed_view_container:I

    .line 112
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseModeHeaderContainer:Landroid/view/View;

    .line 113
    sget v1, Lcom/helpshift/R$id;->hs__si_collapsed_shadow:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapsedShadowView:Landroid/view/View;

    .line 114
    sget v1, Lcom/helpshift/R$id;->hs__si_header_collapsed_text:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseHeaderTitleView:Landroid/widget/TextView;

    .line 115
    sget v1, Lcom/helpshift/R$id;->hs__si_header_expand_button:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandButtonView:Landroid/widget/ImageView;

    .line 117
    sget v1, Lcom/helpshift/R$id;->hs__si_header_expanded_view_container:I

    .line 118
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandModeHeaderContainer:Landroid/view/View;

    .line 119
    sget v1, Lcom/helpshift/R$id;->hs__si_header_expanded_shadow:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandedShadowView:Landroid/view/View;

    .line 120
    sget v1, Lcom/helpshift/R$id;->hs__si_header_expanded_text:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandHeaderTitleView:Landroid/widget/TextView;

    .line 121
    sget v1, Lcom/helpshift/R$id;->hs__si_header_collapse_button:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bottomSheetToolbarButtonView:Landroid/widget/ImageView;

    .line 122
    sget v1, Lcom/helpshift/R$id;->hs__si_header_cross_button:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->crossButtonView:Landroid/widget/ImageView;

    .line 123
    sget v1, Lcom/helpshift/R$id;->hs__si_empty_search_result_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->emptySearchResultHintView:Landroid/widget/TextView;

    .line 126
    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$anim;->hs__slide_down:I

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->slideDownAnimation:Landroid/view/animation/Animation;

    .line 127
    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$anim;->hs__smart_intent_layout_from_right:I

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadLayoutAnimation(Landroid/content/Context;I)Landroid/view/animation/LayoutAnimationController;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->slideFromRightAnimControl:Landroid/view/animation/LayoutAnimationController;

    .line 128
    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$anim;->hs__smart_intent_layout_from_left:I

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadLayoutAnimation(Landroid/content/Context;I)Landroid/view/animation/LayoutAnimationController;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->slideFromLeftAnimControl:Landroid/view/animation/LayoutAnimationController;

    .line 131
    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapseModeHeaderContainer:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 132
    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandModeHeaderContainer:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 134
    sget v1, Lcom/helpshift/R$id;->hs__si_edit_text_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    .line 135
    sget v1, Lcom/helpshift/R$id;->hs__si_error_reply_text_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyValidationFailedView:Landroid/widget/TextView;

    .line 136
    sget v1, Lcom/helpshift/R$id;->hs__si_intents_recycler_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 137
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    iget-object v4, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    invoke-direct {v2, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 138
    new-instance v1, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;

    new-instance v2, Ljava/util/ArrayList;

    iget-object v4, p1, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;->rootIntentUIModels:Ljava/util/List;

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {v1, v2, p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;-><init>(Ljava/util/List;Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;)V

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->adapter:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;

    .line 141
    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->slideFromRightAnimControl:Landroid/view/animation/LayoutAnimationController;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    .line 142
    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->adapter:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 145
    sget v1, Lcom/helpshift/R$id;->hs__si_send_button_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyButton:Landroid/widget/ImageButton;

    .line 147
    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandModeHeaderContainer:Landroid/view/View;

    invoke-static {v1}, Lcom/helpshift/util/HSViewUtil;->isViewDirectionRtl(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 149
    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyButton:Landroid/widget/ImageButton;

    const/high16 v2, 0x43340000    # 180.0f

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setRotationY(F)V

    .line 155
    :cond_0
    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$attr;->hs__messageSendIcon:I

    .line 156
    invoke-static {v1, v2}, Lcom/helpshift/support/util/Styles;->getResourceIdForAttribute(Landroid/content/Context;I)I

    move-result v1

    .line 157
    iget-object v2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyButton:Landroid/widget/ImageButton;

    iget-object v4, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    .line 158
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 159
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->disableSendReplyButton()V

    .line 162
    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->collapsedShadowView:Landroid/view/View;

    iget-object v2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    sget v4, Lcom/helpshift/R$color;->hs__color_40000000:I

    .line 163
    invoke-static {v2, v4}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v2

    sget-object v4, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 162
    invoke-static {v1, v2, v3, v4}, Lcom/helpshift/util/Styles;->setGradientBackground(Landroid/view/View;IILandroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 167
    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->expandedShadowView:Landroid/view/View;

    iget-object v2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    sget v4, Lcom/helpshift/R$color;->hs__color_40000000:I

    .line 168
    invoke-static {v2, v4}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v2

    sget-object v4, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 167
    invoke-static {v1, v2, v3, v4}, Lcom/helpshift/util/Styles;->setGradientBackground(Landroid/view/View;IILandroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 173
    iget-object v1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;->rootIntentUIModels:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->calculateBottomSheetPeakHeight(I)I

    move-result v1

    .line 176
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->getBottomSheetBehaviour()Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;

    move-result-object v2

    .line 177
    invoke-virtual {v2, v1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->setPeekHeight(I)V

    .line 178
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->getBottomSheetBehaviorCallback()Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 181
    iget-object v2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->router:Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;

    invoke-interface {v2, v0, v1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;->showSmartIntentViewInBottomSheet(Landroid/view/View;I)V

    .line 183
    sget v1, Lcom/helpshift/R$id;->hs__si_clear_search_btn:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->clearSearch:Landroid/widget/ImageButton;

    .line 186
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bindCollapsedRootViewState(Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;)V

    .line 189
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->registerViewListeners()V

    .line 192
    iput-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->lastViewState:Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

    .line 194
    iget-boolean p1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;->enforceIntentSelection:Z

    if-eqz p1, :cond_1

    .line 195
    sget p1, Lcom/helpshift/R$id;->hs__smart_intent_replyfooter_search_image:I

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->searchIcon:Landroid/widget/ImageView;

    .line 200
    sget p1, Lcom/helpshift/R$drawable;->hs__action_search:I

    .line 201
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->searchIcon:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 202
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->searchIcon:Landroid/widget/ImageView;

    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 203
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->searchIcon:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->searchIcon:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const v1, 0x1010036

    invoke-static {p1, v0, v1}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    :cond_1
    return-void
.end method

.method public updateClearSearchButton(Z)V
    .locals 3

    .line 749
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->isViewInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    const/4 p1, 0x0

    goto :goto_0

    :cond_1
    const/16 p1, 0x8

    :goto_0
    if-nez p1, :cond_2

    .line 756
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->clearSearch:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->clearSearch:Landroid/widget/ImageButton;

    invoke-virtual {v1}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const v2, 0x1010036

    invoke-static {v0, v1, v2}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    .line 759
    :cond_2
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->clearSearch:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setVisibility(I)V

    return-void
.end method

.method public updateReplyButtonViewState(ZZ)V
    .locals 1

    .line 726
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->isViewInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 731
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyButton:Landroid/widget/ImageButton;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 732
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setImeOptions(I)V

    goto :goto_0

    .line 735
    :cond_1
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->replyButton:Landroid/widget/ImageButton;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 736
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->editFieldView:Landroid/widget/EditText;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setImeOptions(I)V

    :goto_0
    if-eqz p2, :cond_2

    .line 740
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->enableSendReplyButton()V

    goto :goto_1

    .line 743
    :cond_2
    invoke-direct {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->disableSendReplyButton()V

    :goto_1
    return-void
.end method

.method public updateSmartIntentView(Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;)V
    .locals 1

    .line 701
    iput-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->lastViewState:Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

    .line 702
    instance-of v0, p1, Lcom/helpshift/conversation/smartintent/SmartIntentExpandedRootViewState;

    if-eqz v0, :cond_0

    .line 703
    check-cast p1, Lcom/helpshift/conversation/smartintent/SmartIntentExpandedRootViewState;

    .line 705
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bindExpandedRootViewState(Lcom/helpshift/conversation/smartintent/SmartIntentExpandedRootViewState;)V

    goto :goto_0

    .line 707
    :cond_0
    instance-of v0, p1, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;

    if-eqz v0, :cond_1

    .line 708
    check-cast p1, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;

    .line 710
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bindCollapsedRootViewState(Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;)V

    goto :goto_0

    .line 712
    :cond_1
    instance-of v0, p1, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;

    if-eqz v0, :cond_2

    .line 713
    check-cast p1, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;

    .line 714
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bindLeafViewState(Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;)V

    goto :goto_0

    .line 716
    :cond_2
    instance-of v0, p1, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;

    if-eqz v0, :cond_3

    .line 717
    check-cast p1, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;

    .line 719
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->bindSearchResultViewState(Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;)V

    :cond_3
    :goto_0
    return-void
.end method
