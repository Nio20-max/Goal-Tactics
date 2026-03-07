.class public Lcom/helpshift/support/conversations/NewConversationFragment;
.super Lcom/helpshift/support/conversations/BaseConversationFragment;
.source "NewConversationFragment.java"

# interfaces
.implements Lcom/helpshift/support/conversations/NewConversationRouter;
.implements Landroid/view/MenuItem$OnMenuItemClickListener;
.implements Lcom/helpshift/support/fragments/IMenuItemEventListener;


# static fields
.field public static final FRAGMENT_TAG:Ljava/lang/String; = "HSNewConversationFragment"

.field public static final SEARCH_PERFORMED:Ljava/lang/String; = "search_performed"

.field public static final SHOULD_DROP_META:Ljava/lang/String; = "dropMeta"

.field public static final SOURCE_SEARCH_QUERY:Ljava/lang/String; = "source_search_query"


# instance fields
.field private descriptionField:Lcom/google/android/material/textfield/TextInputEditText;

.field newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

.field private renderer:Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;

.field private selectedImageFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

.field private shouldUpdateAttachment:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/helpshift/support/conversations/BaseConversationFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/support/conversations/NewConversationFragment;)Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->renderer:Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;

    return-object p0
.end method

.method private addTopMarginToView(Landroid/view/View;)V
    .locals 4

    .line 333
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    .line 335
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 336
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/helpshift/R$dimen;->hs__formBasedFieldsMarginTop:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    float-to-int v0, v0

    .line 337
    iget v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    :cond_0
    return-void
.end method

.method private addViewStateObservers()V
    .locals 3

    .line 100
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getDomain()Lcom/helpshift/common/domain/Domain;

    move-result-object v0

    .line 103
    iget-object v1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v1}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getDescriptionViewState()Lcom/helpshift/widget/TextViewState;

    move-result-object v1

    new-instance v2, Lcom/helpshift/support/conversations/NewConversationFragment$1;

    invoke-direct {v2, p0}, Lcom/helpshift/support/conversations/NewConversationFragment$1;-><init>(Lcom/helpshift/support/conversations/NewConversationFragment;)V

    invoke-virtual {v1, v0, v2}, Lcom/helpshift/widget/TextViewState;->subscribe(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/widget/HSObserver;)V

    .line 113
    iget-object v1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v1}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getProgressBarViewState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v1

    new-instance v2, Lcom/helpshift/support/conversations/NewConversationFragment$2;

    invoke-direct {v2, p0}, Lcom/helpshift/support/conversations/NewConversationFragment$2;-><init>(Lcom/helpshift/support/conversations/NewConversationFragment;)V

    invoke-virtual {v1, v0, v2}, Lcom/helpshift/widget/BaseViewState;->subscribe(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/widget/HSObserver;)V

    .line 122
    iget-object v1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v1}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getStartConversationButtonState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v1

    new-instance v2, Lcom/helpshift/support/conversations/NewConversationFragment$3;

    invoke-direct {v2, p0}, Lcom/helpshift/support/conversations/NewConversationFragment$3;-><init>(Lcom/helpshift/support/conversations/NewConversationFragment;)V

    invoke-virtual {v1, v0, v2}, Lcom/helpshift/widget/BaseViewState;->subscribe(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/widget/HSObserver;)V

    .line 131
    iget-object v1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v1}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getAttachImageButtonViewState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v1

    new-instance v2, Lcom/helpshift/support/conversations/NewConversationFragment$4;

    invoke-direct {v2, p0}, Lcom/helpshift/support/conversations/NewConversationFragment$4;-><init>(Lcom/helpshift/support/conversations/NewConversationFragment;)V

    invoke-virtual {v1, v0, v2}, Lcom/helpshift/widget/BaseViewState;->subscribe(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/widget/HSObserver;)V

    .line 140
    iget-object v1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v1}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getImageAttachmentViewState()Lcom/helpshift/widget/ImageAttachmentViewState;

    move-result-object v1

    new-instance v2, Lcom/helpshift/support/conversations/NewConversationFragment$5;

    invoke-direct {v2, p0}, Lcom/helpshift/support/conversations/NewConversationFragment$5;-><init>(Lcom/helpshift/support/conversations/NewConversationFragment;)V

    invoke-virtual {v1, v0, v2}, Lcom/helpshift/widget/ImageAttachmentViewState;->subscribe(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/widget/HSObserver;)V

    .line 150
    iget-object v1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v1}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getNameViewState()Lcom/helpshift/widget/TextViewState;

    move-result-object v1

    new-instance v2, Lcom/helpshift/support/conversations/NewConversationFragment$6;

    invoke-direct {v2, p0}, Lcom/helpshift/support/conversations/NewConversationFragment$6;-><init>(Lcom/helpshift/support/conversations/NewConversationFragment;)V

    invoke-virtual {v1, v0, v2}, Lcom/helpshift/widget/TextViewState;->subscribe(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/widget/HSObserver;)V

    .line 160
    iget-object v1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v1}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getEmailViewState()Lcom/helpshift/widget/TextViewState;

    move-result-object v1

    new-instance v2, Lcom/helpshift/support/conversations/NewConversationFragment$7;

    invoke-direct {v2, p0}, Lcom/helpshift/support/conversations/NewConversationFragment$7;-><init>(Lcom/helpshift/support/conversations/NewConversationFragment;)V

    invoke-virtual {v1, v0, v2}, Lcom/helpshift/widget/TextViewState;->subscribe(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/widget/HSObserver;)V

    .line 170
    iget-object v1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v1}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getProfileFormViewState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v1

    new-instance v2, Lcom/helpshift/support/conversations/NewConversationFragment$8;

    invoke-direct {v2, p0}, Lcom/helpshift/support/conversations/NewConversationFragment$8;-><init>(Lcom/helpshift/support/conversations/NewConversationFragment;)V

    invoke-virtual {v1, v0, v2}, Lcom/helpshift/widget/BaseViewState;->subscribe(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/widget/HSObserver;)V

    return-void
.end method

.method private initialize(Landroid/view/View;)V
    .locals 20

    move-object/from16 v14, p0

    move-object/from16 v0, p1

    move-object/from16 v15, p0

    .line 242
    sget v1, Lcom/helpshift/R$id;->hs__conversationDetailWrapper:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/textfield/TextInputLayout;

    move-object v2, v1

    const/4 v3, 0x0

    .line 243
    invoke-virtual {v1, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setHintEnabled(Z)V

    .line 244
    invoke-virtual {v1, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setHintAnimationEnabled(Z)V

    .line 245
    sget v1, Lcom/helpshift/R$id;->hs__conversationDetail:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v1, v14, Lcom/helpshift/support/conversations/NewConversationFragment;->descriptionField:Lcom/google/android/material/textfield/TextInputEditText;

    .line 247
    sget v1, Lcom/helpshift/R$id;->hs__usernameWrapper:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/textfield/TextInputLayout;

    move-object v4, v1

    .line 248
    invoke-virtual {v1, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setHintEnabled(Z)V

    .line 249
    invoke-virtual {v1, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setHintAnimationEnabled(Z)V

    .line 250
    sget v1, Lcom/helpshift/R$id;->hs__username:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/textfield/TextInputEditText;

    move-object v5, v1

    .line 252
    sget v6, Lcom/helpshift/R$id;->hs__emailWrapper:I

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Lcom/google/android/material/textfield/TextInputLayout;

    move-object v6, v7

    .line 253
    invoke-virtual {v7, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setHintEnabled(Z)V

    .line 254
    invoke-virtual {v7, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setHintAnimationEnabled(Z)V

    .line 255
    sget v7, Lcom/helpshift/R$id;->hs__email:I

    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    move-object v13, v7

    check-cast v13, Lcom/google/android/material/textfield/TextInputEditText;

    move-object v7, v13

    .line 259
    invoke-direct {v14, v1}, Lcom/helpshift/support/conversations/NewConversationFragment;->addTopMarginToView(Landroid/view/View;)V

    .line 260
    invoke-direct {v14, v13}, Lcom/helpshift/support/conversations/NewConversationFragment;->addTopMarginToView(Landroid/view/View;)V

    .line 262
    sget v8, Lcom/helpshift/R$id;->progress_bar:I

    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ProgressBar;

    .line 263
    sget v9, Lcom/helpshift/R$id;->hs__screenshot:I

    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/ImageView;

    .line 264
    sget v10, Lcom/helpshift/R$id;->attachment_file_name:I

    invoke-virtual {v0, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 265
    sget v11, Lcom/helpshift/R$id;->attachment_file_size:I

    invoke-virtual {v0, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    .line 266
    sget v12, Lcom/helpshift/R$id;->screenshot_view_container:I

    invoke-virtual {v0, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroidx/cardview/widget/CardView;

    const v3, 0x102001a

    .line 267
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    move-object v3, v13

    move-object v13, v0

    .line 269
    new-instance v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;

    move-object/from16 p1, v0

    invoke-virtual/range {p0 .. p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getContext()Landroid/content/Context;

    move-result-object v17

    move-object/from16 v18, v1

    move-object/from16 v1, v17

    move-object/from16 v17, v3

    iget-object v3, v14, Lcom/helpshift/support/conversations/NewConversationFragment;->descriptionField:Lcom/google/android/material/textfield/TextInputEditText;

    move-object/from16 v19, v17

    .line 282
    invoke-virtual/range {p0 .. p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getView()Landroid/view/View;

    move-result-object v16

    move-object/from16 v14, v16

    .line 284
    invoke-virtual/range {p0 .. p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getSupportFragment()Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object v16

    invoke-direct/range {v0 .. v16}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;-><init>(Landroid/content/Context;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputEditText;Landroid/widget/ProgressBar;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/TextView;Landroidx/cardview/widget/CardView;Landroid/widget/ImageButton;Landroid/view/View;Lcom/helpshift/support/conversations/NewConversationRouter;Lcom/helpshift/support/fragments/IToolbarMenuItemRenderer;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragment;->renderer:Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;

    .line 285
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v1

    iget-object v2, v0, Lcom/helpshift/support/conversations/NewConversationFragment;->renderer:Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;

    invoke-interface {v1, v2}, Lcom/helpshift/CoreApi;->getNewConversationViewModel(Lcom/helpshift/conversation/viewmodel/NewConversationRenderer;)Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    move-result-object v1

    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    .line 288
    iget-boolean v2, v0, Lcom/helpshift/support/conversations/NewConversationFragment;->shouldUpdateAttachment:Z

    if-eqz v2, :cond_0

    .line 289
    iget-object v2, v0, Lcom/helpshift/support/conversations/NewConversationFragment;->selectedImageFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    invoke-virtual {v1, v2}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->setImageAttachment(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    const/4 v1, 0x0

    .line 290
    iput-boolean v1, v0, Lcom/helpshift/support/conversations/NewConversationFragment;->shouldUpdateAttachment:Z

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 293
    :goto_0
    iget-object v2, v0, Lcom/helpshift/support/conversations/NewConversationFragment;->descriptionField:Lcom/google/android/material/textfield/TextInputEditText;

    new-instance v3, Lcom/helpshift/support/conversations/NewConversationFragment$9;

    invoke-direct {v3, v0}, Lcom/helpshift/support/conversations/NewConversationFragment$9;-><init>(Lcom/helpshift/support/conversations/NewConversationFragment;)V

    invoke-virtual {v2, v3}, Lcom/google/android/material/textfield/TextInputEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 300
    new-instance v2, Lcom/helpshift/support/conversations/NewConversationFragment$10;

    invoke-direct {v2, v0}, Lcom/helpshift/support/conversations/NewConversationFragment$10;-><init>(Lcom/helpshift/support/conversations/NewConversationFragment;)V

    move-object/from16 v3, v18

    invoke-virtual {v3, v2}, Lcom/google/android/material/textfield/TextInputEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 307
    new-instance v2, Lcom/helpshift/support/conversations/NewConversationFragment$11;

    invoke-direct {v2, v0}, Lcom/helpshift/support/conversations/NewConversationFragment$11;-><init>(Lcom/helpshift/support/conversations/NewConversationFragment;)V

    move-object/from16 v7, v19

    invoke-virtual {v7, v2}, Lcom/google/android/material/textfield/TextInputEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 314
    invoke-virtual/range {p0 .. p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_1

    const-string v3, "source_search_query"

    .line 316
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 317
    iget-object v4, v0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v4, v3}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->setSearchQuery(Ljava/lang/String;)V

    const-string v3, "dropMeta"

    .line 319
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    .line 320
    iget-object v3, v0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v3, v2}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->setShouldDropCustomMetadata(Z)V

    .line 322
    invoke-virtual/range {p0 .. p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "search_performed"

    invoke-virtual {v2, v3, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 323
    iget-object v2, v0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v2, v1}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->setWasSearchPerformed(Z)V

    :cond_1
    return-void
.end method

.method public static newInstance(Landroid/os/Bundle;)Lcom/helpshift/support/conversations/NewConversationFragment;
    .locals 1

    .line 66
    new-instance v0, Lcom/helpshift/support/conversations/NewConversationFragment;

    invoke-direct {v0}, Lcom/helpshift/support/conversations/NewConversationFragment;-><init>()V

    .line 67
    invoke-virtual {v0, p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private removeViewStateObservers()V
    .locals 1

    .line 181
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getDescriptionViewState()Lcom/helpshift/widget/TextViewState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/widget/TextViewState;->unsubscribe()V

    .line 182
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getProgressBarViewState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/widget/BaseViewState;->unsubscribe()V

    .line 183
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getStartConversationButtonState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/widget/BaseViewState;->unsubscribe()V

    .line 184
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getAttachImageButtonViewState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/widget/BaseViewState;->unsubscribe()V

    .line 185
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getImageAttachmentViewState()Lcom/helpshift/widget/ImageAttachmentViewState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/widget/ImageAttachmentViewState;->unsubscribe()V

    .line 186
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getNameViewState()Lcom/helpshift/widget/TextViewState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/widget/TextViewState;->unsubscribe()V

    .line 187
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getEmailViewState()Lcom/helpshift/widget/TextViewState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/widget/TextViewState;->unsubscribe()V

    .line 188
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getProfileFormViewState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/widget/BaseViewState;->unsubscribe()V

    return-void
.end method

.method private setViewListeners(Landroid/view/View;)V
    .locals 2

    .line 347
    sget v0, Lcom/helpshift/R$id;->hs__conversationDetail:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->descriptionField:Lcom/google/android/material/textfield/TextInputEditText;

    .line 348
    new-instance v1, Lcom/helpshift/support/conversations/NewConversationFragment$12;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/NewConversationFragment$12;-><init>(Lcom/helpshift/support/conversations/NewConversationFragment;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x102001a

    .line 363
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    const/16 v1, 0x8

    .line 364
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 365
    sget v1, Lcom/helpshift/R$id;->hs__screenshot:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    .line 366
    new-instance v1, Lcom/helpshift/support/conversations/NewConversationFragment$13;

    invoke-direct {v1, p0}, Lcom/helpshift/support/conversations/NewConversationFragment$13;-><init>(Lcom/helpshift/support/conversations/NewConversationFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 372
    new-instance v0, Lcom/helpshift/support/conversations/NewConversationFragment$14;

    invoke-direct {v0, p0}, Lcom/helpshift/support/conversations/NewConversationFragment$14;-><init>(Lcom/helpshift/support/conversations/NewConversationFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public exitNewConversationView()V
    .locals 1

    .line 429
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getSupportFragment()Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/support/fragments/SupportFragment;->exitSdkSession()V

    return-void
.end method

.method protected getAttachmentMode()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected getToolbarTitle()Ljava/lang/String;
    .locals 1

    .line 203
    sget v0, Lcom/helpshift/R$string;->hs__new_conversation_header:I

    invoke-virtual {p0, v0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getViewName()Lcom/helpshift/support/util/AppSessionConstants$Screen;
    .locals 1

    .line 198
    sget-object v0, Lcom/helpshift/support/util/AppSessionConstants$Screen;->NEW_CONVERSATION:Lcom/helpshift/support/util/AppSessionConstants$Screen;

    return-object v0
.end method

.method public handleScreenshotAction(Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;Lcom/helpshift/conversation/dto/AttachmentPickerFile;)Z
    .locals 1

    .line 391
    sget-object v0, Lcom/helpshift/support/conversations/NewConversationFragment$15;->$SwitchMap$com$helpshift$support$fragments$AttachmentPreviewFragment$AttachmentAction:[I

    invoke-virtual {p1}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 p2, 0x2

    if-eq p1, p2, :cond_0

    const/4 p1, 0x0

    return p1

    .line 404
    :cond_0
    iget-object p1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    const/4 p2, 0x0

    if-nez p1, :cond_1

    .line 405
    iput-object p2, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->selectedImageFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    .line 406
    iput-boolean v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->shouldUpdateAttachment:Z

    goto :goto_0

    .line 409
    :cond_1
    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->setImageAttachment(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    :goto_0
    return v0

    .line 394
    :cond_2
    iget-object p1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    if-nez p1, :cond_3

    .line 395
    iput-object p2, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->selectedImageFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    .line 396
    iput-boolean v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->shouldUpdateAttachment:Z

    goto :goto_1

    .line 399
    :cond_3
    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->setImageAttachment(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    :goto_1
    return v0
.end method

.method public onAuthenticationFailure()V
    .locals 1

    .line 451
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getSupportController()Lcom/helpshift/support/controllers/SupportController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/support/controllers/SupportController;->onAuthenticationFailure()V

    return-void
.end method

.method public onCreateOptionMenuCalled()V
    .locals 2

    .line 456
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->renderer:Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;

    iget-object v1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    .line 457
    invoke-virtual {v1}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getStartConversationButtonState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/helpshift/widget/BaseViewState;->isVisible()Z

    move-result v1

    .line 456
    invoke-virtual {v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->updateStartConversationButton(Z)V

    .line 458
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->renderer:Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;

    iget-object v1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    .line 459
    invoke-virtual {v1}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->getAttachImageButtonViewState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/helpshift/widget/BaseViewState;->isVisible()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->updateImageAttachmentButton(Z)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 74
    sget p3, Lcom/helpshift/R$layout;->hs__new_conversation_fragment:I

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDestroyView()V
    .locals 2

    .line 228
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getSupportFragment()Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/helpshift/support/fragments/SupportFragment;->unRegisterToolbarMenuEventsListener(Lcom/helpshift/support/fragments/IMenuItemEventListener;)V

    .line 229
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    iget-object v1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->renderer:Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;

    invoke-virtual {v0, v1}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->unregisterRenderer(Lcom/helpshift/conversation/viewmodel/NewConversationRenderer;)V

    .line 230
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->setConversationViewState(I)V

    .line 231
    invoke-super {p0}, Lcom/helpshift/support/conversations/BaseConversationFragment;->onDestroyView()V

    return-void
.end method

.method public onMenuItemClicked(Lcom/helpshift/support/fragments/HSMenuItemType;)V
    .locals 3

    .line 464
    sget-object v0, Lcom/helpshift/support/conversations/NewConversationFragment$15;->$SwitchMap$com$helpshift$support$fragments$HSMenuItemType:[I

    invoke-virtual {p1}, Lcom/helpshift/support/fragments/HSMenuItemType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v1, 0x2

    if-eq p1, v1, :cond_0

    goto :goto_0

    .line 469
    :cond_0
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 470
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getAttachmentMode()I

    move-result v1

    const-string v2, "key_attachment_mode"

    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const/4 v1, 0x0

    const-string v2, "key_refers_id"

    .line 471
    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "key_attachment_type"

    .line 472
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 473
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getSupportFragment()Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/helpshift/support/fragments/SupportFragment;->launchAttachmentPicker(Landroid/os/Bundle;)V

    goto :goto_0

    .line 466
    :cond_1
    iget-object p1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {p1}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->showSearchOrStartNewConversation()V

    :goto_0
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 236
    invoke-direct {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->removeViewStateObservers()V

    .line 237
    invoke-super {p0}, Lcom/helpshift/support/conversations/BaseConversationFragment;->onPause()V

    .line 238
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->descriptionField:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-static {v0, v1}, Lcom/helpshift/util/KeyboardUtil;->hideKeyboard(Landroid/content/Context;Landroid/view/View;)V

    return-void
.end method

.method protected onPermissionGranted(I)V
    .locals 2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 210
    :cond_0
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 211
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getAttachmentMode()I

    move-result v0

    const-string v1, "key_attachment_mode"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const/4 v0, 0x1

    const-string v1, "key_attachment_type"

    .line 212
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 213
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getSupportFragment()Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/helpshift/support/fragments/SupportFragment;->launchAttachmentPicker(Landroid/os/Bundle;)V

    :goto_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 88
    invoke-super {p0}, Lcom/helpshift/support/conversations/BaseConversationFragment;->onResume()V

    .line 89
    invoke-direct {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->addViewStateObservers()V

    .line 90
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_0

    .line 91
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object v0

    sget-object v1, Lcom/helpshift/analytics/AnalyticsEventType;->REPORTED_ISSUE:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {v0, v1}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;)V

    .line 93
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->descriptionField:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputEditText;->requestFocus()Z

    .line 94
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->descriptionField:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-static {v0, v1}, Lcom/helpshift/util/KeyboardUtil;->showKeyboard(Landroid/content/Context;Landroid/view/View;)V

    .line 95
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->setConversationViewState(I)V

    return-void
.end method

.method public onStart()V
    .locals 1

    .line 80
    invoke-super {p0}, Lcom/helpshift/support/conversations/BaseConversationFragment;->onStart()V

    .line 81
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_0

    .line 82
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getConversationController()Lcom/helpshift/conversation/domainmodel/ConversationController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->deleteCachedFilesForResolvedConversations()V

    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    .line 220
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/NewConversationFragment;->initialize(Landroid/view/View;)V

    .line 221
    invoke-super {p0, p1, p2}, Lcom/helpshift/support/conversations/BaseConversationFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 222
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getSupportFragment()Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p2

    invoke-virtual {p2, p0}, Lcom/helpshift/support/fragments/SupportFragment;->registerToolbarMenuEventsListener(Lcom/helpshift/support/fragments/IMenuItemEventListener;)V

    .line 223
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/NewConversationFragment;->setViewListeners(Landroid/view/View;)V

    return-void
.end method

.method public showAttachmentPreviewScreenFromDraft(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V
    .locals 3

    .line 440
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "key_attachment_mode"

    const/4 v2, 0x2

    .line 441
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "key_refers_id"

    const/4 v2, 0x0

    .line 442
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "key_attachment_type"

    const/4 v2, 0x1

    .line 443
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 444
    iput v2, p1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->attachmentType:I

    .line 445
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getSupportController()Lcom/helpshift/support/controllers/SupportController;

    move-result-object v1

    sget-object v2, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$LaunchSource;->ATTACHMENT_DRAFT:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$LaunchSource;

    invoke-virtual {v1, p1, v0, v2}, Lcom/helpshift/support/controllers/SupportController;->startScreenshotPreviewFragment(Lcom/helpshift/conversation/dto/AttachmentPickerFile;Landroid/os/Bundle;Lcom/helpshift/support/fragments/AttachmentPreviewFragment$LaunchSource;)V

    return-void
.end method

.method public showConversationScreen()V
    .locals 1

    .line 434
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 435
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getSupportController()Lcom/helpshift/support/controllers/SupportController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/support/controllers/SupportController;->startConversationFlow()V

    :cond_0
    return-void
.end method

.method public showSearchResultFragment(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/helpshift/support/Faq;",
            ">;)V"
        }
    .end annotation

    .line 422
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "search_fragment_results"

    .line 423
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 424
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragment;->getSupportController()Lcom/helpshift/support/controllers/SupportController;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/helpshift/support/controllers/SupportController;->showConversationSearchResultFragment(Landroid/os/Bundle;)V

    return-void
.end method

.method public startNewConversation()V
    .locals 1

    .line 417
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragment;->newConversationVM:Lcom/helpshift/conversation/viewmodel/NewConversationVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/NewConversationVM;->startNewConversation()V

    return-void
.end method
