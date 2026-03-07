.class public Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;
.super Ljava/lang/Object;
.source "ConversationalFragmentRenderer.java"

# interfaces
.implements Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;


# static fields
.field private static final OPTIONS_PICKER_PEEK_HEIGHT:I = 0x8e


# instance fields
.field addAttachmentButton:Landroid/widget/ImageButton;

.field attachmentPicker:Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;

.field bottomSheetBehavior:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field confirmationBoxView:Landroid/view/View;

.field context:Landroid/content/Context;

.field conversationalFragmentRouter:Lcom/helpshift/support/conversations/ConversationalFragmentRouter;

.field isAvatarEnabledInChatFeed:Z

.field isHSBrandingDisabled:Z

.field lastMessageItemDecor:Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

.field listPickerHostWindow:Landroid/view/Window;

.field menuItemRenderer:Lcom/helpshift/support/fragments/IToolbarMenuItemRenderer;

.field messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

.field messagesRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field networkErrorFooter:Landroid/widget/LinearLayout;

.field parentView:Landroid/view/View;

.field pickerAdapter:Lcom/helpshift/support/conversations/picker/PickerAdapter;

.field pickerBackView:Landroid/widget/ImageView;

.field pickerBottomSheet:Lcom/helpshift/views/bottomsheet/HSBottomSheet;

.field pickerClearView:Landroid/widget/ImageView;

.field pickerCollapseView:Landroid/widget/ImageView;

.field pickerCollapsedHeader:Landroid/view/View;

.field pickerCollapsedHeaderText:Landroid/widget/TextView;

.field pickerCollapsedShadow:Landroid/view/View;

.field pickerEmptySearchResultsView:Landroid/view/View;

.field pickerExpandView:Landroid/widget/ImageView;

.field pickerExpandedHeader:Landroid/view/View;

.field pickerExpandedHeaderText:Landroid/widget/TextView;

.field pickerExpandedShadow:Landroid/view/View;

.field pickerHeaderSearchView:Landroid/widget/EditText;

.field pickerOptionsRecycler:Landroidx/recyclerview/widget/RecyclerView;

.field pickerSearchView:Landroid/widget/ImageView;

.field replyBoxView:Landroid/view/View;

.field replyButton:Landroid/widget/ImageButton;

.field replyField:Landroid/widget/EditText;

.field replyValidationFailedView:Landroid/widget/TextView;

.field scrollIndicator:Landroid/view/View;

.field scrollJumpButton:Landroid/view/View;

.field skipBubbleTextView:Landroid/widget/TextView;

.field skipOutterBubble:Landroid/widget/LinearLayout;

.field smartIntentRenderer:Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;

.field unreadMessagesIndicatorDot:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/view/Window;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Landroid/view/View;ZZLandroid/view/View;Landroid/view/View;Lcom/helpshift/support/fragments/IToolbarMenuItemRenderer;Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;Lcom/helpshift/support/conversations/ConversationalFragmentRouter;)V
    .locals 0

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 147
    iput-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    .line 148
    iput-boolean p6, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->isHSBrandingDisabled:Z

    .line 149
    iput-boolean p7, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->isAvatarEnabledInChatFeed:Z

    .line 150
    iput-object p2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->listPickerHostWindow:Landroid/view/Window;

    .line 151
    iput-object p3, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 152
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;

    move-result-object p2

    .line 153
    instance-of p3, p2, Landroidx/recyclerview/widget/SimpleItemAnimator;

    if-eqz p3, :cond_0

    .line 155
    check-cast p2, Landroidx/recyclerview/widget/SimpleItemAnimator;

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/SimpleItemAnimator;->setSupportsChangeAnimations(Z)V

    .line 157
    :cond_0
    iput-object p4, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    .line 158
    sget p2, Lcom/helpshift/R$id;->replyBoxLayout:I

    invoke-virtual {p4, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyBoxView:Landroid/view/View;

    .line 159
    sget p3, Lcom/helpshift/R$id;->hs__messageText:I

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/EditText;

    iput-object p2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    .line 160
    iget-object p2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyBoxView:Landroid/view/View;

    sget p3, Lcom/helpshift/R$id;->hs__sendMessageBtn:I

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageButton;

    iput-object p2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyButton:Landroid/widget/ImageButton;

    .line 161
    iget-object p2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyBoxView:Landroid/view/View;

    sget p3, Lcom/helpshift/R$id;->hs__addAttachmentBtn:I

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageButton;

    iput-object p2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->addAttachmentButton:Landroid/widget/ImageButton;

    .line 162
    sget p2, Lcom/helpshift/R$attr;->hs__messageSendIcon:I

    invoke-static {p1, p2}, Lcom/helpshift/support/util/Styles;->getResourceIdForAttribute(Landroid/content/Context;I)I

    move-result p2

    .line 167
    iget-object p3, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyButton:Landroid/widget/ImageButton;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 168
    sget p1, Lcom/helpshift/R$id;->scroll_jump_button:I

    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->scrollJumpButton:Landroid/view/View;

    .line 170
    iput-object p5, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->confirmationBoxView:Landroid/view/View;

    .line 171
    iput-object p12, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->conversationalFragmentRouter:Lcom/helpshift/support/conversations/ConversationalFragmentRouter;

    .line 172
    iput-object p10, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->menuItemRenderer:Lcom/helpshift/support/fragments/IToolbarMenuItemRenderer;

    .line 173
    iput-object p11, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->smartIntentRenderer:Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;

    .line 174
    iput-object p8, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->scrollIndicator:Landroid/view/View;

    .line 175
    iput-object p9, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->unreadMessagesIndicatorDot:Landroid/view/View;

    .line 176
    sget p1, Lcom/helpshift/R$id;->skipBubbleTextView:I

    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->skipBubbleTextView:Landroid/widget/TextView;

    .line 177
    sget p1, Lcom/helpshift/R$id;->skipOuterBubble:I

    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->skipOutterBubble:Landroid/widget/LinearLayout;

    .line 178
    sget p1, Lcom/helpshift/R$id;->errorReplyTextView:I

    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyValidationFailedView:Landroid/widget/TextView;

    .line 179
    sget p1, Lcom/helpshift/R$id;->networkErrorFooter:I

    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->networkErrorFooter:Landroid/widget/LinearLayout;

    .line 180
    iput-object p12, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->conversationalFragmentRouter:Lcom/helpshift/support/conversations/ConversationalFragmentRouter;

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V
    .locals 0

    .line 87
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->onOptionPickerCollapsed()V

    return-void
.end method

.method static synthetic access$100(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V
    .locals 0

    .line 87
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->onOptionPickerExpanded()V

    return-void
.end method

.method private calculatePickerBottomOffset(ZI)I
    .locals 1

    .line 466
    iget-boolean v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->isHSBrandingDisabled:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/16 v0, 0xe

    :goto_0
    sub-int/2addr p2, v0

    if-eqz p1, :cond_1

    add-int/lit8 p2, p2, -0x4

    :cond_1
    return p2
.end method

.method private changeMenuItemVisibility(Lcom/helpshift/support/fragments/HSMenuItemType;Z)V
    .locals 1

    .line 1419
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->menuItemRenderer:Lcom/helpshift/support/fragments/IToolbarMenuItemRenderer;

    if-eqz v0, :cond_0

    .line 1420
    invoke-interface {v0, p1, p2}, Lcom/helpshift/support/fragments/IToolbarMenuItemRenderer;->updateMenuItemVisibility(Lcom/helpshift/support/fragments/HSMenuItemType;Z)V

    :cond_0
    return-void
.end method

.method private createRecyclerViewLastItemDecor()V
    .locals 1

    .line 896
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->lastMessageItemDecor:Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

    if-eqz v0, :cond_0

    return-void

    .line 901
    :cond_0
    new-instance v0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$14;

    invoke-direct {v0, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$14;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    iput-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->lastMessageItemDecor:Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

    return-void
.end method

.method private disableAccessibilityForMessageList()V
    .locals 2

    .line 556
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    if-eqz v0, :cond_0

    const/4 v1, 0x4

    .line 557
    invoke-virtual {v0, v1}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 559
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->conversationalFragmentRouter:Lcom/helpshift/support/conversations/ConversationalFragmentRouter;

    .line 560
    invoke-interface {v0, v1}, Lcom/helpshift/support/conversations/ConversationalFragmentRouter;->setToolbarImportanceForAccessibility(I)V

    :cond_0
    return-void
.end method

.method private handleSkipButtonRenderingForPicker(ZLjava/lang/String;)V
    .locals 0

    if-nez p1, :cond_0

    .line 478
    invoke-static {p2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 479
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->setPickerOptionsInputSkipListener()V

    .line 480
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->skipBubbleTextView:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 481
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showSkipButton()V

    goto :goto_0

    .line 484
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideSkipButton()V

    :goto_0
    return-void
.end method

.method private hideAttachmentPicker()V
    .locals 1

    .line 870
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->attachmentPicker:Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;

    if-eqz v0, :cond_0

    .line 871
    invoke-virtual {v0}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->dismissAttachmentPicker()V

    :cond_0
    return-void
.end method

.method private hideScrollJumperView()V
    .locals 2

    .line 1396
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->scrollIndicator:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1397
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->unreadMessagesIndicatorDot:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private initBottomSheetCallback()V
    .locals 2

    .line 489
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBottomSheet:Lcom/helpshift/views/bottomsheet/HSBottomSheet;

    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$3;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$3;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/views/bottomsheet/HSBottomSheet;->addBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    return-void
.end method

.method private initPickerViews(Ljava/lang/String;)V
    .locals 6

    .line 684
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBottomSheet:Lcom/helpshift/views/bottomsheet/HSBottomSheet;

    invoke-virtual {v0}, Lcom/helpshift/views/bottomsheet/HSBottomSheet;->getBottomSheetBehaviour()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->bottomSheetBehavior:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 685
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBottomSheet:Lcom/helpshift/views/bottomsheet/HSBottomSheet;

    invoke-virtual {v0}, Lcom/helpshift/views/bottomsheet/HSBottomSheet;->getBottomSheetContentView()Landroid/view/View;

    move-result-object v0

    .line 686
    sget v1, Lcom/helpshift/R$id;->hs__picker_collapsed_shadow:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapsedShadow:Landroid/view/View;

    .line 687
    sget v1, Lcom/helpshift/R$id;->hs__picker_expanded_shadow:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerExpandedShadow:Landroid/view/View;

    .line 688
    sget v1, Lcom/helpshift/R$id;->hs__optionsList:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerOptionsRecycler:Landroidx/recyclerview/widget/RecyclerView;

    .line 689
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 691
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v5}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 690
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 692
    sget v1, Lcom/helpshift/R$id;->hs__picker_action_search:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerSearchView:Landroid/widget/ImageView;

    .line 693
    sget v1, Lcom/helpshift/R$id;->hs__picker_action_clear:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerClearView:Landroid/widget/ImageView;

    .line 694
    sget v1, Lcom/helpshift/R$id;->hs__picker_action_collapse:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapseView:Landroid/widget/ImageView;

    .line 695
    sget v1, Lcom/helpshift/R$id;->hs__picker_action_back:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBackView:Landroid/widget/ImageView;

    .line 696
    sget v1, Lcom/helpshift/R$id;->hs__picker_header_search:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerHeaderSearchView:Landroid/widget/EditText;

    .line 697
    sget v1, Lcom/helpshift/R$id;->hs__expanded_picker_header_text:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerExpandedHeaderText:Landroid/widget/TextView;

    .line 698
    sget v1, Lcom/helpshift/R$id;->hs__picker_expanded_header:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerExpandedHeader:Landroid/view/View;

    .line 699
    sget v1, Lcom/helpshift/R$id;->hs__picker_collapsed_header:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapsedHeader:Landroid/view/View;

    .line 700
    sget v1, Lcom/helpshift/R$id;->hs__collapsed_picker_header_text:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapsedHeaderText:Landroid/widget/TextView;

    .line 701
    sget v1, Lcom/helpshift/R$id;->hs__empty_picker_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerEmptySearchResultsView:Landroid/view/View;

    .line 702
    sget v1, Lcom/helpshift/R$id;->hs__picker_action_expand:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerExpandView:Landroid/widget/ImageView;

    .line 704
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerExpandedHeaderText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 705
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapsedHeaderText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 708
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    .line 709
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/helpshift/R$string;->hs__picker_options_expand_header_voice_over:I

    new-array v2, v4, [Ljava/lang/Object;

    aput-object p1, v2, v5

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 711
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapsedHeader:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 712
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapsedHeaderText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 715
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerSearchView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget v1, Lcom/helpshift/R$attr;->hs__expandedPickerIconColor:I

    invoke-static {p1, v0, v1}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    .line 716
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBackView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget v1, Lcom/helpshift/R$attr;->hs__expandedPickerIconColor:I

    invoke-static {p1, v0, v1}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    .line 717
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapseView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget v1, Lcom/helpshift/R$attr;->hs__expandedPickerIconColor:I

    invoke-static {p1, v0, v1}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    .line 718
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerClearView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget v1, Lcom/helpshift/R$attr;->hs__expandedPickerIconColor:I

    invoke-static {p1, v0, v1}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    .line 719
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerExpandView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget v1, Lcom/helpshift/R$attr;->hs__collapsedPickerIconColor:I

    invoke-static {p1, v0, v1}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    return-void
.end method

.method private launchAttachmentIntentInternal(Landroid/content/Intent;Landroid/net/Uri;)V
    .locals 1

    .line 1156
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    .line 1159
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/helpshift/CoreApi;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->isDelegateRegistered()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1165
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/helpshift/CoreApi;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object p1

    .line 1166
    invoke-virtual {p1}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->getDelegate()Lcom/helpshift/delegate/RootDelegate;

    move-result-object p1

    .line 1167
    instance-of v0, p1, Lcom/helpshift/support/Support$Delegate;

    if-eqz v0, :cond_0

    .line 1168
    check-cast p1, Lcom/helpshift/support/Support$Delegate;

    .line 1169
    invoke-interface {p1, p2}, Lcom/helpshift/support/Support$Delegate;->displayAttachmentFile(Landroid/net/Uri;)V

    goto :goto_0

    .line 1172
    :cond_0
    sget-object p1, Lcom/helpshift/common/exception/PlatformException;->NO_APPS_FOR_OPENING_ATTACHMENT:Lcom/helpshift/common/exception/PlatformException;

    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showErrorView(Lcom/helpshift/common/exception/ExceptionType;)V

    goto :goto_0

    .line 1176
    :cond_1
    sget-object p1, Lcom/helpshift/common/exception/PlatformException;->NO_APPS_FOR_OPENING_ATTACHMENT:Lcom/helpshift/common/exception/PlatformException;

    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showErrorView(Lcom/helpshift/common/exception/ExceptionType;)V

    :goto_0
    return-void
.end method

.method private launchAttachmentIntentInternal(Landroid/content/Intent;Ljava/io/File;)V
    .locals 1

    .line 1187
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    .line 1190
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/helpshift/CoreApi;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->isDelegateRegistered()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1191
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/helpshift/CoreApi;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->displayAttachmentFile(Ljava/io/File;)V

    goto :goto_0

    .line 1194
    :cond_0
    sget-object p1, Lcom/helpshift/common/exception/PlatformException;->NO_APPS_FOR_OPENING_ATTACHMENT:Lcom/helpshift/common/exception/PlatformException;

    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showErrorView(Lcom/helpshift/common/exception/ExceptionType;)V

    :goto_0
    return-void
.end method

.method private onOptionPickerCollapsed()V
    .locals 4

    .line 581
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapsedShadow:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 582
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapsedShadow:Landroid/view/View;

    iget-object v2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    sget v3, Lcom/helpshift/R$color;->hs__color_40000000:I

    .line 583
    invoke-static {v2, v3}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v2

    sget-object v3, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 582
    invoke-static {v0, v2, v1, v3}, Lcom/helpshift/util/Styles;->setGradientBackground(Landroid/view/View;IILandroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 589
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showPickerContent()V

    .line 593
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->resetPickerSearchViewToNormalHeader()V

    .line 595
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapsedHeader:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 596
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerExpandedHeader:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 599
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerOptionsRecycler:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 601
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->resetAccessibilityForMessageList()V

    return-void
.end method

.method private onOptionPickerExpanded()V
    .locals 5

    .line 541
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapsedShadow:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 542
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerExpandedShadow:Landroid/view/View;

    iget-object v2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    sget v3, Lcom/helpshift/R$color;->hs__color_40000000:I

    .line 543
    invoke-static {v2, v3}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v2

    sget-object v3, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v4, 0x0

    .line 542
    invoke-static {v0, v2, v4, v3}, Lcom/helpshift/util/Styles;->setGradientBackground(Landroid/view/View;IILandroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 546
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerExpandedHeader:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 547
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapsedHeader:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 549
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->disableAccessibilityForMessageList()V

    return-void
.end method

.method private registerListeners()V
    .locals 2

    .line 605
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerHeaderSearchView:Landroid/widget/EditText;

    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$4;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$4;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 614
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerHeaderSearchView:Landroid/widget/EditText;

    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$5;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$5;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 625
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerSearchView:Landroid/widget/ImageView;

    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$6;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$6;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 640
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBackView:Landroid/widget/ImageView;

    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$7;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$7;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 647
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerClearView:Landroid/widget/ImageView;

    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$8;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$8;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 655
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapseView:Landroid/widget/ImageView;

    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$9;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$9;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 663
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapsedHeader:Landroid/view/View;

    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$10;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$10;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private renderForTextInput(Lcom/helpshift/conversation/activeconversation/message/input/TextInput;)V
    .locals 4

    .line 961
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 962
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 965
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->inputLabel:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 966
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    sget v3, Lcom/helpshift/R$id;->replyBoxLabelLayout:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 967
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 968
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyBoxView:Landroid/view/View;

    sget v3, Lcom/helpshift/R$id;->replyFieldLabel:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 969
    iget-object v3, p1, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->inputLabel:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 973
    :cond_0
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->placeholder:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, ""

    goto :goto_0

    :cond_1
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->placeholder:Ljava/lang/String;

    .line 974
    :goto_0
    iget-object v3, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    const/high16 v0, 0x20000

    .line 978
    iget v3, p1, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->keyboard:I

    if-eq v3, v1, :cond_5

    const/4 v1, 0x2

    if-eq v3, v1, :cond_4

    const/4 v1, 0x3

    if-eq v3, v1, :cond_3

    const/4 v1, 0x4

    if-eq v3, v1, :cond_2

    .line 1005
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->resetReplyFieldToNormalTextInput()V

    goto :goto_1

    .line 990
    :cond_2
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideKeyboard()V

    .line 995
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 996
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$16;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$16;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v0, 0x0

    goto :goto_1

    :cond_3
    const v0, 0x22002

    goto :goto_1

    :cond_4
    const v0, 0x20021

    goto :goto_1

    :cond_5
    const v0, 0x24001

    .line 1009
    :goto_1
    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setInputType(I)V

    .line 1012
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->required:Z

    if-nez v0, :cond_6

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->skipLabel:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 1014
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->setTextInputSkipListener()V

    .line 1015
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->skipBubbleTextView:Landroid/widget/TextView;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->skipLabel:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1016
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showSkipButton()V

    goto :goto_2

    .line 1019
    :cond_6
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideSkipButton()V

    .line 1022
    :goto_2
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyBoxView:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private resetAccessibilityForMessageList()V
    .locals 2

    .line 572
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 573
    invoke-virtual {v0, v1}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 575
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->conversationalFragmentRouter:Lcom/helpshift/support/conversations/ConversationalFragmentRouter;

    invoke-interface {v0}, Lcom/helpshift/support/conversations/ConversationalFragmentRouter;->resetToolbarImportanceForAccessibility()V

    :cond_0
    return-void
.end method

.method private resetReplyFieldToNormalTextInput()V
    .locals 2

    .line 726
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    const v1, 0x24001

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 729
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    sget v1, Lcom/helpshift/R$string;->hs__chat_hint:I

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(I)V

    return-void
.end method

.method private setBottomOffset(Landroid/view/View;I)V
    .locals 4

    .line 373
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    .line 374
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    .line 375
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    .line 377
    iget-object v3, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    int-to-float p2, p2

    invoke-static {v3, p2}, Lcom/helpshift/util/Styles;->dpToPx(Landroid/content/Context;F)F

    move-result p2

    float-to-int p2, p2

    .line 378
    invoke-virtual {p1, v0, v2, v1, p2}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method private setPaddingForReplyField(Z)V
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1088
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v1, Lcom/helpshift/R$dimen;->activity_horizontal_margin_medium:I

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    float-to-int p1, p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 1090
    :goto_0
    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    invoke-virtual {v1, p1, v0, v0, v0}, Landroid/widget/EditText;->setPadding(IIII)V

    return-void
.end method

.method private setPickerOptionsInputSkipListener()V
    .locals 2

    .line 885
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->skipBubbleTextView:Landroid/widget/TextView;

    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$13;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$13;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private setTextInputSkipListener()V
    .locals 2

    .line 876
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->skipBubbleTextView:Landroid/widget/TextView;

    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$12;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$12;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private showEmptyPickerView()V
    .locals 2

    .line 398
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerEmptySearchResultsView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-nez v0, :cond_0

    .line 399
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerEmptySearchResultsView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 402
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerOptionsRecycler:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->isShown()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 403
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerOptionsRecycler:Landroidx/recyclerview/widget/RecyclerView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method private showPickerContent()V
    .locals 2

    .line 388
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerEmptySearchResultsView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 389
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerEmptySearchResultsView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 392
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerOptionsRecycler:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->isShown()Z

    move-result v0

    if-nez v0, :cond_1

    .line 393
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerOptionsRecycler:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method private showScrollJumperView(Z)V
    .locals 2

    .line 1383
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->scrollIndicator:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    if-eqz p1, :cond_0

    .line 1385
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->unreadMessagesIndicatorDot:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1386
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    sget v0, Lcom/helpshift/R$string;->hs__jump_button_with_new_message_voice_over:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 1389
    :cond_0
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->unreadMessagesIndicatorDot:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 1390
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    sget v0, Lcom/helpshift/R$string;->hs__jump_button_voice_over:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 1392
    :goto_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->scrollJumpButton:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private showSendReplyUI(Lcom/helpshift/conversation/activeconversation/message/input/Input;)V
    .locals 1

    if-nez p1, :cond_0

    .line 836
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->setMessagesViewBottomPadding()V

    .line 837
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyBoxView:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 840
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    sget v0, Lcom/helpshift/R$id;->replyBoxLabelLayout:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    const/16 v0, 0x8

    .line 841
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 844
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 845
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 846
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->resetReplyFieldToNormalTextInput()V

    .line 847
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideSkipButton()V

    return-void

    .line 852
    :cond_0
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    if-eqz v0, :cond_1

    .line 853
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->renderForTextInput(Lcom/helpshift/conversation/activeconversation/message/input/TextInput;)V

    .line 858
    :cond_1
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->setMessagesViewBottomPadding()V

    return-void
.end method


# virtual methods
.method public appendMessages(II)V
    .locals 1

    .line 1039
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

    if-nez v0, :cond_0

    return-void

    .line 1043
    :cond_0
    invoke-virtual {v0, p1, p2}, Lcom/helpshift/support/conversations/MessagesAdapter;->onItemRangeInserted(II)V

    return-void
.end method

.method createDatePickerForReplyField()Landroid/app/DatePickerDialog;
    .locals 7

    .line 921
    new-instance v2, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$15;

    invoke-direct {v2, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$15;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    .line 934
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 936
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 937
    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 938
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v3

    invoke-interface {v3}, Lcom/helpshift/CoreApi;->getLocaleProviderDM()Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;

    move-result-object v3

    invoke-virtual {v3}, Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;->getCurrentLocale()Ljava/util/Locale;

    move-result-object v3

    const-string v4, "EEEE, MMMM dd, yyyy"

    .line 940
    invoke-static {v4, v3}, Lcom/helpshift/common/util/HSDateFormatSpec;->getDateFormatter(Ljava/lang/String;Ljava/util/Locale;)Lcom/helpshift/util/HSSimpleDateFormat;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/helpshift/util/HSSimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 941
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 949
    :catch_0
    :cond_0
    new-instance v6, Landroid/app/DatePickerDialog;

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v3, 0x1

    .line 951
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v4, 0x2

    .line 952
    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    const/4 v5, 0x5

    .line 953
    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;Landroid/app/DatePickerDialog$OnDateSetListener;III)V

    return-object v6
.end method

.method public destroy()V
    .locals 2

    const/4 v0, 0x1

    .line 820
    invoke-virtual {p0, v0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideListPicker(Z)V

    .line 822
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->smartIntentRenderer:Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;->dismissSmartIntentUI(Z)V

    .line 824
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideAttachmentPicker()V

    const/4 v0, 0x0

    .line 826
    iput-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->conversationalFragmentRouter:Lcom/helpshift/support/conversations/ConversationalFragmentRouter;

    return-void
.end method

.method public disableSendReplyButton()V
    .locals 3

    .line 1112
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyButton:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1113
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$attr;->hs__reply_button_disabled_alpha:I

    .line 1114
    invoke-static {v0, v2}, Lcom/helpshift/support/util/Styles;->getInt(Landroid/content/Context;I)I

    move-result v0

    .line 1115
    iget-object v2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyButton:Landroid/widget/ImageButton;

    invoke-static {v2, v0}, Lcom/helpshift/support/util/Styles;->setImageAlpha(Landroid/widget/ImageButton;I)V

    .line 1116
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyButton:Landroid/widget/ImageButton;

    invoke-virtual {v2}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-static {v0, v2, v1}, Lcom/helpshift/support/util/Styles;->setSendMessageButtonIconColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Z)V

    return-void
.end method

.method public enableSendReplyButton()V
    .locals 3

    .line 1105
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyButton:Landroid/widget/ImageButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1106
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyButton:Landroid/widget/ImageButton;

    const/16 v2, 0xff

    invoke-static {v0, v2}, Lcom/helpshift/support/util/Styles;->setImageAlpha(Landroid/widget/ImageButton;I)V

    .line 1107
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyButton:Landroid/widget/ImageButton;

    invoke-virtual {v2}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-static {v0, v2, v1}, Lcom/helpshift/support/util/Styles;->setSendMessageButtonIconColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Z)V

    return-void
.end method

.method public getReply()Ljava/lang/String;
    .locals 1

    .line 1121
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSmartIntentUserQuery()Ljava/lang/String;
    .locals 1

    .line 776
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->smartIntentRenderer:Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;

    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;->getReply()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public handleBackPressedForListPicker()Z
    .locals 2

    .line 531
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBottomSheet:Lcom/helpshift/views/bottomsheet/HSBottomSheet;

    if-eqz v0, :cond_0

    .line 532
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->bottomSheetBehavior:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    invoke-virtual {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->getState()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 533
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->bottomSheetBehavior:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hideAgentTypingIndicator()V
    .locals 2

    .line 1294
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 1295
    invoke-virtual {v0, v1}, Lcom/helpshift/support/conversations/MessagesAdapter;->setAgentTypingIndicatorVisibility(Z)V

    :cond_0
    return-void
.end method

.method public hideKeyboard()V
    .locals 2

    .line 1363
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    invoke-static {v0, v1}, Lcom/helpshift/util/KeyboardUtil;->hideKeyboard(Landroid/content/Context;Landroid/view/View;)V

    return-void
.end method

.method public hideListPicker(Z)V
    .locals 2

    .line 332
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->bottomSheetBehavior:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBottomSheet:Lcom/helpshift/views/bottomsheet/HSBottomSheet;

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    if-eqz p1, :cond_1

    const/4 p1, 0x1

    .line 337
    invoke-virtual {v0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setHideable(Z)V

    .line 338
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBottomSheet:Lcom/helpshift/views/bottomsheet/HSBottomSheet;

    invoke-virtual {p1}, Lcom/helpshift/views/bottomsheet/HSBottomSheet;->removeAllBottomSheetCallbacks()V

    .line 339
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBottomSheet:Lcom/helpshift/views/bottomsheet/HSBottomSheet;

    new-instance v0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$2;

    invoke-direct {v0, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$2;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {p1, v0}, Lcom/helpshift/views/bottomsheet/HSBottomSheet;->addBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 353
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->bottomSheetBehavior:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    goto :goto_0

    .line 356
    :cond_1
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->removePickerViewFromWindow()V

    .line 359
    :goto_0
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->resetAccessibilityForMessageList()V

    .line 361
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideKeyboard()V

    .line 362
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->setBottomOffset(Landroid/view/View;I)V

    .line 363
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideSkipButton()V

    :cond_2
    :goto_1
    return-void
.end method

.method public hideNetworkErrorFooter()V
    .locals 2

    .line 318
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->networkErrorFooter:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method

.method public hidePickerClearButton()V
    .locals 2

    .line 517
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerClearView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 518
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerClearView:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public hideReplyValidationFailedError()V
    .locals 2

    .line 287
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyValidationFailedView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method public hideSendReplyUI()V
    .locals 2

    .line 863
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, v1, v1}, Landroidx/recyclerview/widget/RecyclerView;->setPadding(IIII)V

    .line 864
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyBoxView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 865
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideSkipButton()V

    .line 866
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideAttachmentPicker()V

    return-void
.end method

.method public hideSkipButton()V
    .locals 2

    .line 219
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->skipOutterBubble:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 220
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->lastMessageItemDecor:Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    return-void
.end method

.method public hideSmartIntentReplyValidationFailedError()V
    .locals 1

    .line 786
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->smartIntentRenderer:Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;

    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;->hideReplyValidationFailedError()V

    return-void
.end method

.method public hideSmartIntentView()V
    .locals 2

    .line 754
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideKeyboard()V

    .line 756
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->smartIntentRenderer:Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;->dismissSmartIntentUI(Z)V

    .line 758
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->resetAccessibilityForMessageList()V

    return-void
.end method

.method public initializeMessages(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 1027
    new-instance v0, Lcom/helpshift/support/conversations/MessagesAdapter;

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    iget-boolean v2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->isAvatarEnabledInChatFeed:Z

    iget-object v3, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->conversationalFragmentRouter:Lcom/helpshift/support/conversations/ConversationalFragmentRouter;

    invoke-direct {v0, v1, p1, v2, v3}, Lcom/helpshift/support/conversations/MessagesAdapter;-><init>(Landroid/content/Context;Ljava/util/List;ZLcom/helpshift/support/conversations/messages/MessagesAdapterClickListener;)V

    iput-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

    .line 1030
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    invoke-direct {p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    .line 1031
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->setStackFromEnd(Z)V

    .line 1032
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 1033
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method public isReplyBoxVisible()Z
    .locals 1

    .line 1308
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyBoxView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public launchAttachment(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1212
    invoke-static {p1}, Lcom/helpshift/android/commons/downloader/HsUriUtils;->isValidUriPath(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "android.intent.action.VIEW"

    if-eqz v0, :cond_0

    .line 1213
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 1214
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 1215
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1216
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 1217
    invoke-direct {p0, v0, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->launchAttachmentIntentInternal(Landroid/content/Intent;Landroid/net/Uri;)V

    goto :goto_1

    .line 1220
    :cond_0
    invoke-static {p1}, Lcom/helpshift/util/FileUtil;->validateAndCreateFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 1224
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt v0, v2, :cond_1

    .line 1225
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    invoke-static {v0, p1, p2}, Lcom/helpshift/util/IntentUtil;->createFileProviderIntent(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    goto :goto_0

    .line 1228
    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1229
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    .line 1230
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    move-object p2, v0

    .line 1232
    :goto_0
    invoke-direct {p0, p2, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->launchAttachmentIntentInternal(Landroid/content/Intent;Ljava/io/File;)V

    goto :goto_1

    .line 1235
    :cond_2
    sget-object p1, Lcom/helpshift/common/exception/PlatformException;->FILE_NOT_FOUND:Lcom/helpshift/common/exception/PlatformException;

    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showErrorView(Lcom/helpshift/common/exception/ExceptionType;)V

    :goto_1
    return-void
.end method

.method public launchScreenshotAttachment(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1201
    invoke-static {p1}, Lcom/helpshift/util/FileUtil;->validateAndCreateFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 1203
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    invoke-static {v0, p1, p2}, Lcom/helpshift/util/IntentUtil;->createFileProviderIntent(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    invoke-direct {p0, p2, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->launchAttachmentIntentInternal(Landroid/content/Intent;Ljava/io/File;)V

    goto :goto_0

    .line 1206
    :cond_0
    sget-object p1, Lcom/helpshift/common/exception/PlatformException;->FILE_NOT_FOUND:Lcom/helpshift/common/exception/PlatformException;

    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showErrorView(Lcom/helpshift/common/exception/ExceptionType;)V

    :goto_0
    return-void
.end method

.method public notifyRefreshList()V
    .locals 1

    .line 1367
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

    if-eqz v0, :cond_0

    .line 1368
    invoke-virtual {v0}, Lcom/helpshift/support/conversations/MessagesAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method public onAuthenticationFailure()V
    .locals 1

    .line 1301
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->conversationalFragmentRouter:Lcom/helpshift/support/conversations/ConversationalFragmentRouter;

    if-eqz v0, :cond_0

    .line 1302
    invoke-interface {v0}, Lcom/helpshift/support/conversations/ConversationalFragmentRouter;->onAuthenticationFailure()V

    :cond_0
    return-void
.end method

.method public onFocusChanged(Z)V
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    .line 736
    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideListPicker(Z)V

    .line 739
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->smartIntentRenderer:Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;->dismissSmartIntentUI(Z)V

    :cond_0
    return-void
.end method

.method public openActionLink(Ljava/lang/String;)V
    .locals 2

    .line 804
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 805
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "origin"

    const-string v1, "helpshift"

    .line 807
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 810
    :try_start_0
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 813
    :catch_0
    sget-object p1, Lcom/helpshift/common/exception/PlatformException;->NO_APPS_FOR_OPENING_ATTACHMENT:Lcom/helpshift/common/exception/PlatformException;

    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showErrorView(Lcom/helpshift/common/exception/ExceptionType;)V

    :goto_0
    return-void
.end method

.method public openAppReviewStore(Ljava/lang/String;)V
    .locals 2

    .line 1247
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1248
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1250
    :try_start_0
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1253
    :catch_0
    sget-object p1, Lcom/helpshift/common/exception/PlatformException;->NO_APPS_FOR_OPENING_ATTACHMENT:Lcom/helpshift/common/exception/PlatformException;

    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showErrorView(Lcom/helpshift/common/exception/ExceptionType;)V

    :goto_0
    return-void
.end method

.method public openFreshConversationScreen(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1282
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->conversationalFragmentRouter:Lcom/helpshift/support/conversations/ConversationalFragmentRouter;

    invoke-interface {v0, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRouter;->openFreshConversationScreen(Ljava/util/Map;)V

    return-void
.end method

.method public removeMessages(II)V
    .locals 1

    .line 1064
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

    if-nez v0, :cond_0

    return-void

    .line 1068
    :cond_0
    invoke-virtual {v0, p1, p2}, Lcom/helpshift/support/conversations/MessagesAdapter;->onItemRangeRemoved(II)V

    return-void
.end method

.method removePickerViewFromWindow()V
    .locals 1

    .line 367
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBottomSheet:Lcom/helpshift/views/bottomsheet/HSBottomSheet;

    invoke-virtual {v0}, Lcom/helpshift/views/bottomsheet/HSBottomSheet;->remove()V

    const/4 v0, 0x0

    .line 368
    iput-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBottomSheet:Lcom/helpshift/views/bottomsheet/HSBottomSheet;

    return-void
.end method

.method public requestReplyFieldFocus()V
    .locals 1

    .line 1353
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    return-void
.end method

.method resetPickerSearchViewToNormalHeader()V
    .locals 4

    .line 672
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerHeaderSearchView:Landroid/widget/EditText;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    .line 673
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerExpandedHeaderText:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 674
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerHeaderSearchView:Landroid/widget/EditText;

    const-string v3, ""

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 675
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBackView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 676
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapseView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 677
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerClearView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 678
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerSearchView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 679
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideKeyboard()V

    .line 680
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBottomSheet:Lcom/helpshift/views/bottomsheet/HSBottomSheet;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/views/bottomsheet/HSBottomSheet;->setDraggable(Z)V

    return-void
.end method

.method public scrollToBottom()V
    .locals 2

    .line 1403
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

    if-nez v0, :cond_0

    return-void

    .line 1407
    :cond_0
    invoke-virtual {v0}, Lcom/helpshift/support/conversations/MessagesAdapter;->getItemCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 1409
    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    :cond_1
    return-void
.end method

.method protected setMessagesViewBottomPadding()V
    .locals 3

    .line 1414
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    const/high16 v1, 0x41400000    # 12.0f

    invoke-static {v0, v1}, Lcom/helpshift/util/Styles;->dpToPx(Landroid/content/Context;F)F

    move-result v0

    float-to-int v0, v0

    .line 1415
    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2, v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setPadding(IIII)V

    return-void
.end method

.method public setReply(Ljava/lang/String;)V
    .locals 1

    .line 1126
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1127
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setSelection(I)V

    return-void
.end method

.method public setReplyboxListeners()V
    .locals 2

    .line 1313
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$17;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$17;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1322
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$18;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$18;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 1331
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyButton:Landroid/widget/ImageButton;

    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$19;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$19;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1340
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->addAttachmentButton:Landroid/widget/ImageButton;

    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$20;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$20;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setSmartIntentReply(Ljava/lang/String;)V
    .locals 1

    .line 1440
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->smartIntentRenderer:Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;->setReply(Ljava/lang/String;)V

    return-void
.end method

.method public showAgentTypingIndicator()V
    .locals 2

    .line 1287
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 1288
    invoke-virtual {v0, v1}, Lcom/helpshift/support/conversations/MessagesAdapter;->setAgentTypingIndicatorVisibility(Z)V

    :cond_0
    return-void
.end method

.method public showAttachmentPicker(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 791
    new-instance v0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->attachmentPicker:Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;

    .line 792
    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$11;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$11;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    .line 793
    invoke-virtual {v0, v1}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->setListener(Lcom/helpshift/support/widget/AttachmentTypeOptionPicker$OnAttachmentTypeOptionClickListener;)V

    .line 799
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->attachmentPicker:Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->addAttachmentButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1, p1}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->showAttachmentPicker(Landroid/view/View;Ljava/util/List;)V

    return-void
.end method

.method public showCSATSubmittedView()V
    .locals 3

    .line 1275
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/helpshift/R$string;->hs__csat_submit_toast:I

    .line 1276
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 1275
    invoke-static {v0, v1, v2}, Lcom/helpshift/support/util/SnackbarUtil;->showSnackbar(Landroid/view/View;Ljava/lang/CharSequence;I)V

    return-void
.end method

.method public showEmptyListPickerView()V
    .locals 0

    .line 384
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showEmptyPickerView()V

    return-void
.end method

.method public showErrorView(Lcom/helpshift/common/exception/ExceptionType;)V
    .locals 1

    .line 1242
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    invoke-static {p1, v0}, Lcom/helpshift/support/util/SnackbarUtil;->showSnackbar(Lcom/helpshift/common/exception/ExceptionType;Landroid/view/View;)V

    return-void
.end method

.method public showKeyboard()V
    .locals 2

    .line 1358
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyField:Landroid/widget/EditText;

    invoke-static {v0, v1}, Lcom/helpshift/util/KeyboardUtil;->showKeyboard(Landroid/content/Context;Landroid/view/View;)V

    return-void
.end method

.method public showListPicker(Ljava/util/List;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/viewmodel/OptionUIModel;",
            ">;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 410
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBottomSheet:Lcom/helpshift/views/bottomsheet/HSBottomSheet;

    if-eqz v0, :cond_0

    .line 416
    invoke-direct {p0, p3, p4}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->handleSkipButtonRenderingForPicker(ZLjava/lang/String;)V

    return-void

    .line 420
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/util/Styles;->isTablet(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    const v1, 0x3f4ccccd    # 0.8f

    goto :goto_0

    :cond_1
    const/high16 v1, 0x3f800000    # 1.0f

    .line 424
    :goto_0
    new-instance v2, Lcom/helpshift/views/bottomsheet/HSBottomSheet$Builder;

    iget-object v3, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->listPickerHostWindow:Landroid/view/Window;

    invoke-direct {v2, v3}, Lcom/helpshift/views/bottomsheet/HSBottomSheet$Builder;-><init>(Landroid/view/Window;)V

    sget v3, Lcom/helpshift/R$layout;->hs__picker_layout:I

    .line 425
    invoke-virtual {v2, v3}, Lcom/helpshift/views/bottomsheet/HSBottomSheet$Builder;->contentView(I)Lcom/helpshift/views/bottomsheet/HSBottomSheet$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 426
    invoke-virtual {v2, v3}, Lcom/helpshift/views/bottomsheet/HSBottomSheet$Builder;->referenceView(Landroid/view/View;)Lcom/helpshift/views/bottomsheet/HSBottomSheet$Builder;

    move-result-object v2

    const/4 v3, 0x1

    .line 427
    invoke-virtual {v2, v3}, Lcom/helpshift/views/bottomsheet/HSBottomSheet$Builder;->enableDimAnimation(Z)Lcom/helpshift/views/bottomsheet/HSBottomSheet$Builder;

    move-result-object v2

    .line 428
    invoke-virtual {v2, v1}, Lcom/helpshift/views/bottomsheet/HSBottomSheet$Builder;->dimOpacity(F)Lcom/helpshift/views/bottomsheet/HSBottomSheet$Builder;

    move-result-object v1

    .line 429
    invoke-virtual {v1}, Lcom/helpshift/views/bottomsheet/HSBottomSheet$Builder;->inflateAndBuild()Lcom/helpshift/views/bottomsheet/HSBottomSheet;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBottomSheet:Lcom/helpshift/views/bottomsheet/HSBottomSheet;

    .line 430
    invoke-direct {p0, p2}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->initPickerViews(Ljava/lang/String;)V

    .line 431
    iget-object p2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->bottomSheetBehavior:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    const/high16 v2, 0x430e0000    # 142.0f

    invoke-static {v1, v2}, Lcom/helpshift/util/Styles;->dpToPx(Landroid/content/Context;F)F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p2, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 432
    new-instance p2, Lcom/helpshift/support/conversations/picker/PickerAdapter;

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->conversationalFragmentRouter:Lcom/helpshift/support/conversations/ConversationalFragmentRouter;

    invoke-direct {p2, p1, v1}, Lcom/helpshift/support/conversations/picker/PickerAdapter;-><init>(Ljava/util/List;Lcom/helpshift/support/conversations/ConversationalFragmentRouter;)V

    iput-object p2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerAdapter:Lcom/helpshift/support/conversations/picker/PickerAdapter;

    .line 433
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerOptionsRecycler:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 436
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerCollapsedShadow:Landroid/view/View;

    iget-object p2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    sget v1, Lcom/helpshift/R$color;->hs__color_40000000:I

    .line 437
    invoke-static {p2, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p2

    const/4 v1, 0x0

    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 436
    invoke-static {p1, p2, v1, v2}, Lcom/helpshift/util/Styles;->setGradientBackground(Landroid/view/View;IILandroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 440
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideSendReplyUI()V

    .line 441
    invoke-direct {p0, p3, p4}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->handleSkipButtonRenderingForPicker(ZLjava/lang/String;)V

    .line 444
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideKeyboard()V

    const/16 p1, 0x8e

    .line 447
    invoke-direct {p0, v0, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->calculatePickerBottomOffset(ZI)I

    move-result p1

    .line 448
    iget-object p2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    invoke-direct {p0, p2, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->setBottomOffset(Landroid/view/View;I)V

    .line 450
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->registerListeners()V

    .line 451
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->initBottomSheetCallback()V

    .line 454
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showPickerContent()V

    .line 455
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerBottomSheet:Lcom/helpshift/views/bottomsheet/HSBottomSheet;

    invoke-virtual {p1}, Lcom/helpshift/views/bottomsheet/HSBottomSheet;->show()V

    return-void
.end method

.method public showNetworkErrorFooter(I)V
    .locals 7

    .line 291
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->networkErrorFooter:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 292
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->networkErrorFooter:Landroid/widget/LinearLayout;

    sget v2, Lcom/helpshift/R$id;->networkErrorFooterText:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 293
    iget-object v2, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->networkErrorFooter:Landroid/widget/LinearLayout;

    sget v3, Lcom/helpshift/R$id;->networkErrorProgressBar:I

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    .line 294
    iget-object v3, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->networkErrorFooter:Landroid/widget/LinearLayout;

    sget v4, Lcom/helpshift/R$id;->networkErrorIcon:I

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 296
    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 297
    iget-object v4, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    sget v5, Lcom/helpshift/R$drawable;->hs__network_error:I

    sget v6, Lcom/helpshift/R$attr;->hs__errorTextColor:I

    invoke-static {v4, v3, v5, v6}, Lcom/helpshift/util/Styles;->setDrawable(Landroid/content/Context;Landroid/view/View;II)V

    const/16 v4, 0x8

    .line 298
    invoke-virtual {v2, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 300
    iget-object v5, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const/4 v6, 0x1

    if-eq p1, v6, :cond_1

    const/4 v6, 0x2

    if-eq p1, v6, :cond_0

    goto :goto_0

    .line 307
    :cond_0
    sget p1, Lcom/helpshift/R$string;->hs__network_reconnecting_error:I

    invoke-virtual {v5, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 308
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 309
    invoke-virtual {v2, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    .line 303
    :cond_1
    sget p1, Lcom/helpshift/R$string;->hs__no_internet_error:I

    invoke-virtual {v5, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method public showOptionInput(Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;)V
    .locals 0

    if-nez p1, :cond_0

    .line 187
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->resetReplyFieldToNormalTextInput()V

    return-void

    .line 192
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideSendReplyUI()V

    .line 193
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideKeyboard()V

    .line 197
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->setMessagesViewBottomPadding()V

    return-void
.end method

.method public showPickerClearButton()V
    .locals 2

    .line 524
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerClearView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->isShown()Z

    move-result v0

    if-nez v0, :cond_0

    .line 525
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerClearView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public showReplyValidationFailedError(I)V
    .locals 5

    .line 225
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    .line 226
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 228
    :goto_0
    iget-object v4, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    if-eq p1, v3, :cond_7

    if-eq p1, v2, :cond_5

    const/4 v2, 0x3

    if-eq p1, v2, :cond_3

    const/4 v2, 0x4

    if-eq p1, v2, :cond_1

    const-string p1, ""

    goto :goto_1

    :cond_1
    if-eqz v0, :cond_2

    .line 250
    sget p1, Lcom/helpshift/R$string;->hs__landscape_date_input_validation_error:I

    invoke-virtual {v4, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 253
    :cond_2
    sget p1, Lcom/helpshift/R$string;->hs__date_input_validation_error:I

    invoke-virtual {v4, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_3
    if-eqz v0, :cond_4

    .line 241
    sget p1, Lcom/helpshift/R$string;->hs__landscape_number_input_validation_error:I

    invoke-virtual {v4, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 244
    :cond_4
    sget p1, Lcom/helpshift/R$string;->hs__number_input_validation_error:I

    invoke-virtual {v4, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_5
    if-eqz v0, :cond_6

    .line 232
    sget p1, Lcom/helpshift/R$string;->hs__landscape_email_input_validation_error:I

    invoke-virtual {v4, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 235
    :cond_6
    sget p1, Lcom/helpshift/R$string;->hs__email_input_validation_error:I

    invoke-virtual {v4, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 258
    :cond_7
    sget p1, Lcom/helpshift/R$string;->hs__conversation_detail_error:I

    invoke-virtual {v4, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_1
    if-eqz v0, :cond_8

    .line 264
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 266
    sget v1, Lcom/helpshift/R$string;->hs__landscape_input_validation_dialog_title:I

    invoke-virtual {v4, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 267
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 268
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const p1, 0x104000a

    .line 269
    new-instance v1, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$1;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer$1;-><init>(Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;)V

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 276
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    goto :goto_2

    .line 280
    :cond_8
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyValidationFailedView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 281
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->replyValidationFailedView:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_2
    return-void
.end method

.method public showSkipButton()V
    .locals 3

    .line 204
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    .line 205
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->skipBubbleTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    sget v2, Lcom/helpshift/R$attr;->hs__selectableOptionColor:I

    invoke-static {v0, v1, v2}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    .line 206
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->parentView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->skipOutterBubble:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const v2, 0x1010054

    invoke-static {v0, v1, v2}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    .line 207
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->skipOutterBubble:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 212
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->lastMessageItemDecor:Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 213
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->createRecyclerViewLastItemDecor()V

    .line 214
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->lastMessageItemDecor:Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    return-void
.end method

.method public showSmartIntentReplyValidationFailedError()V
    .locals 1

    .line 781
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->smartIntentRenderer:Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;

    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;->showReplyValidationFailedError()V

    return-void
.end method

.method public showSmartIntentView(Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;)V
    .locals 1

    .line 746
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideKeyboard()V

    .line 748
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->smartIntentRenderer:Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;->showSmartIntentUI(Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;)V

    return-void
.end method

.method public unregisterFragmentRenderer()V
    .locals 1

    .line 1426
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

    if-eqz v0, :cond_0

    .line 1427
    invoke-virtual {v0}, Lcom/helpshift/support/conversations/MessagesAdapter;->unregisterAdapterClickListener()V

    :cond_0
    return-void
.end method

.method public updateConversationFooterState(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V
    .locals 1

    .line 1258
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

    if-eqz v0, :cond_1

    .line 1259
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->NONE:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    if-eq p1, v0, :cond_0

    .line 1260
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideKeyboard()V

    .line 1262
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

    invoke-virtual {v0, p1}, Lcom/helpshift/support/conversations/MessagesAdapter;->setConversationFooterState(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V

    :cond_1
    return-void
.end method

.method public updateConversationResolutionQuestionUI(Z)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1133
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideKeyboard()V

    .line 1134
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->confirmationBoxView:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 1137
    :cond_0
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->confirmationBoxView:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public updateHistoryLoadingState(Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;)V
    .locals 1

    .line 1267
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

    if-eqz v0, :cond_0

    .line 1269
    invoke-virtual {v0, p1}, Lcom/helpshift/support/conversations/MessagesAdapter;->setHistoryLoadingState(Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;)V

    :cond_0
    return-void
.end method

.method public updateImageAttachmentButtonView(Z)V
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 1074
    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->addAttachmentButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto :goto_0

    .line 1077
    :cond_0
    iget-object v1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->addAttachmentButton:Landroid/widget/ImageButton;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 1078
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideAttachmentPicker()V

    .line 1079
    sget-object v1, Lcom/helpshift/support/fragments/HSMenuItemType;->SCREENSHOT_ATTACHMENT:Lcom/helpshift/support/fragments/HSMenuItemType;

    invoke-direct {p0, v1, v0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->changeMenuItemVisibility(Lcom/helpshift/support/fragments/HSMenuItemType;Z)V

    .line 1081
    :goto_0
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->setPaddingForReplyField(Z)V

    return-void
.end method

.method public updateListPickerOptions(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/viewmodel/OptionUIModel;",
            ">;)V"
        }
    .end annotation

    .line 323
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerAdapter:Lcom/helpshift/support/conversations/picker/PickerAdapter;

    if-eqz v0, :cond_0

    .line 324
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showPickerContent()V

    .line 325
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->pickerAdapter:Lcom/helpshift/support/conversations/picker/PickerAdapter;

    invoke-virtual {v0, p1}, Lcom/helpshift/support/conversations/picker/PickerAdapter;->dispatchUpdates(Ljava/util/List;)V

    :cond_0
    return-void
.end method

.method public updateMessages(II)V
    .locals 1

    .line 1049
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    .line 1053
    invoke-virtual {v0}, Lcom/helpshift/support/conversations/MessagesAdapter;->getMessageCount()I

    move-result v0

    if-ne p2, v0, :cond_1

    .line 1054
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

    invoke-virtual {p1}, Lcom/helpshift/support/conversations/MessagesAdapter;->notifyDataSetChanged()V

    goto :goto_0

    .line 1057
    :cond_1
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->messagesAdapter:Lcom/helpshift/support/conversations/MessagesAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/support/conversations/MessagesAdapter;->onItemRangeChanged(II)V

    :goto_0
    return-void
.end method

.method public updateScrollJumperView(ZZ)V
    .locals 0

    if-eqz p1, :cond_0

    .line 1374
    invoke-direct {p0, p2}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showScrollJumperView(Z)V

    goto :goto_0

    .line 1377
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideScrollJumperView()V

    :goto_0
    return-void
.end method

.method public updateSendReplyButton(Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 1096
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->enableSendReplyButton()V

    goto :goto_0

    .line 1099
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->disableSendReplyButton()V

    :goto_0
    return-void
.end method

.method public updateSendReplyUI(ZLcom/helpshift/conversation/activeconversation/message/input/Input;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 1144
    invoke-direct {p0, p2}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->showSendReplyUI(Lcom/helpshift/conversation/activeconversation/message/input/Input;)V

    goto :goto_0

    .line 1147
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->hideSendReplyUI()V

    :goto_0
    return-void
.end method

.method public updateSmartIntentClearSearchButton(Z)V
    .locals 1

    .line 1436
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->smartIntentRenderer:Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;->updateClearSearchButton(Z)V

    return-void
.end method

.method public updateSmartIntentReplyButton(ZZ)V
    .locals 1

    .line 1432
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->smartIntentRenderer:Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;

    invoke-interface {v0, p1, p2}, Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;->updateReplyButtonViewState(ZZ)V

    return-void
.end method

.method public updateSmartIntentView(Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;)V
    .locals 1

    .line 763
    iget-object v0, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->smartIntentRenderer:Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;->updateSmartIntentView(Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;)V

    .line 766
    iget-object p1, p0, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->smartIntentRenderer:Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;

    invoke-interface {p1}, Lcom/helpshift/conversation/activeconversation/SmartIntentRenderer;->isUIInExpandedMode()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 767
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->disableAccessibilityForMessageList()V

    goto :goto_0

    .line 770
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/support/conversations/ConversationalFragmentRenderer;->resetAccessibilityForMessageList()V

    :goto_0
    return-void
.end method
