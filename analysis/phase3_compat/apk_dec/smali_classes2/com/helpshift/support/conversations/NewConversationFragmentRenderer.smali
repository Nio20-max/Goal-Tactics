.class public Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;
.super Ljava/lang/Object;
.source "NewConversationFragmentRenderer.java"

# interfaces
.implements Lcom/helpshift/conversation/viewmodel/NewConversationRenderer;


# instance fields
.field private final attachmentClearButton:Landroid/widget/ImageButton;

.field private final attachmentContainer:Landroidx/cardview/widget/CardView;

.field private final attachmentFileName:Landroid/widget/TextView;

.field private final attachmentFileSize:Landroid/widget/TextView;

.field private final attachmentImage:Landroid/widget/ImageView;

.field private final context:Landroid/content/Context;

.field private final descriptionField:Lcom/google/android/material/textfield/TextInputEditText;

.field private final descriptionFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

.field private final emailField:Lcom/google/android/material/textfield/TextInputEditText;

.field private final emailFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

.field private final menuItemRenderer:Lcom/helpshift/support/fragments/IToolbarMenuItemRenderer;

.field private final nameField:Lcom/google/android/material/textfield/TextInputEditText;

.field private final nameFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

.field private final newConversationRouter:Lcom/helpshift/support/conversations/NewConversationRouter;

.field private final parentView:Landroid/view/View;

.field private final progressBar:Landroid/widget/ProgressBar;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputEditText;Landroid/widget/ProgressBar;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/TextView;Landroidx/cardview/widget/CardView;Landroid/widget/ImageButton;Landroid/view/View;Lcom/helpshift/support/conversations/NewConversationRouter;Lcom/helpshift/support/fragments/IToolbarMenuItemRenderer;)V
    .locals 2

    move-object v0, p0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v1, p1

    .line 70
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->context:Landroid/content/Context;

    move-object v1, p2

    .line 71
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->descriptionFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

    move-object v1, p3

    .line 72
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->descriptionField:Lcom/google/android/material/textfield/TextInputEditText;

    move-object v1, p4

    .line 73
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->nameFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

    move-object v1, p5

    .line 74
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->nameField:Lcom/google/android/material/textfield/TextInputEditText;

    move-object v1, p6

    .line 75
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->emailFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

    move-object v1, p7

    .line 76
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->emailField:Lcom/google/android/material/textfield/TextInputEditText;

    move-object v1, p8

    .line 77
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->progressBar:Landroid/widget/ProgressBar;

    move-object v1, p9

    .line 78
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->attachmentImage:Landroid/widget/ImageView;

    move-object v1, p10

    .line 79
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->attachmentFileName:Landroid/widget/TextView;

    move-object v1, p11

    .line 80
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->attachmentFileSize:Landroid/widget/TextView;

    move-object v1, p12

    .line 81
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->attachmentContainer:Landroidx/cardview/widget/CardView;

    move-object v1, p13

    .line 82
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->attachmentClearButton:Landroid/widget/ImageButton;

    move-object/from16 v1, p14

    .line 83
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->parentView:Landroid/view/View;

    move-object/from16 v1, p15

    .line 84
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->newConversationRouter:Lcom/helpshift/support/conversations/NewConversationRouter;

    move-object/from16 v1, p16

    .line 85
    iput-object v1, v0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->menuItemRenderer:Lcom/helpshift/support/fragments/IToolbarMenuItemRenderer;

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;)Landroid/widget/TextView;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->attachmentFileName:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$100(Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;)Landroid/widget/TextView;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->attachmentFileSize:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;)Landroid/widget/ImageView;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->attachmentImage:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;)Landroid/widget/ImageButton;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->attachmentClearButton:Landroid/widget/ImageButton;

    return-object p0
.end method

.method static synthetic access$400(Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;)Landroidx/cardview/widget/CardView;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->attachmentContainer:Landroidx/cardview/widget/CardView;

    return-object p0
.end method

.method private changeMenuItemVisibility(Lcom/helpshift/support/fragments/HSMenuItemType;Z)V
    .locals 1

    .line 388
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->menuItemRenderer:Lcom/helpshift/support/fragments/IToolbarMenuItemRenderer;

    if-eqz v0, :cond_0

    .line 389
    invoke-interface {v0, p1, p2}, Lcom/helpshift/support/fragments/IToolbarMenuItemRenderer;->updateMenuItemVisibility(Lcom/helpshift/support/fragments/HSMenuItemType;Z)V

    :cond_0
    return-void
.end method

.method private getText(I)Ljava/lang/String;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private setError(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V
    .locals 1

    .line 383
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorEnabled(Z)V

    .line 384
    invoke-virtual {p1, p2}, Lcom/google/android/material/textfield/TextInputLayout;->setError(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public clearDescriptionError()V
    .locals 2

    .line 109
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->descriptionFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->setError(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public clearEmailError()V
    .locals 2

    .line 139
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->emailFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->setError(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public clearNameError()V
    .locals 2

    .line 124
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->nameFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->setError(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public disableImageAttachmentClickable()V
    .locals 0

    return-void
.end method

.method public enableImageAttachmentClickable()V
    .locals 0

    return-void
.end method

.method public exit()V
    .locals 1

    .line 323
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->newConversationRouter:Lcom/helpshift/support/conversations/NewConversationRouter;

    invoke-interface {v0}, Lcom/helpshift/support/conversations/NewConversationRouter;->exitNewConversationView()V

    return-void
.end method

.method public gotoConversation(J)V
    .locals 0

    .line 318
    iget-object p1, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->newConversationRouter:Lcom/helpshift/support/conversations/NewConversationRouter;

    invoke-interface {p1}, Lcom/helpshift/support/conversations/NewConversationRouter;->showConversationScreen()V

    return-void
.end method

.method public hideImageAttachmentButton()V
    .locals 2

    .line 144
    sget-object v0, Lcom/helpshift/support/fragments/HSMenuItemType;->SCREENSHOT_ATTACHMENT:Lcom/helpshift/support/fragments/HSMenuItemType;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->changeMenuItemVisibility(Lcom/helpshift/support/fragments/HSMenuItemType;Z)V

    return-void
.end method

.method public hideImageAttachmentContainer()V
    .locals 2

    .line 183
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->attachmentContainer:Landroidx/cardview/widget/CardView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroidx/cardview/widget/CardView;->setVisibility(I)V

    .line 184
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->attachmentImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 185
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->attachmentClearButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    return-void
.end method

.method public hideProfileForm()V
    .locals 2

    .line 236
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->nameField:Lcom/google/android/material/textfield/TextInputEditText;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setVisibility(I)V

    .line 237
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->emailField:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setVisibility(I)V

    return-void
.end method

.method public hideProgressBar()V
    .locals 2

    .line 348
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->progressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method

.method public hideStartConversationButton()V
    .locals 2

    .line 313
    sget-object v0, Lcom/helpshift/support/fragments/HSMenuItemType;->START_NEW_CONVERSATION:Lcom/helpshift/support/fragments/HSMenuItemType;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->changeMenuItemVisibility(Lcom/helpshift/support/fragments/HSMenuItemType;Z)V

    return-void
.end method

.method public onAuthenticationFailure()V
    .locals 1

    .line 379
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->newConversationRouter:Lcom/helpshift/support/conversations/NewConversationRouter;

    invoke-interface {v0}, Lcom/helpshift/support/conversations/NewConversationRouter;->onAuthenticationFailure()V

    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 1

    .line 212
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->descriptionField:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0, p1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 213
    iget-object p1, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->descriptionField:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/TextInputEditText;->setSelection(I)V

    return-void
.end method

.method public setEmail(Ljava/lang/String;)V
    .locals 1

    .line 224
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->emailField:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0, p1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 225
    iget-object p1, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->emailField:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/TextInputEditText;->setSelection(I)V

    return-void
.end method

.method public setEmailRequired()V
    .locals 2

    .line 242
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->emailField:Lcom/google/android/material/textfield/TextInputEditText;

    sget v1, Lcom/helpshift/R$string;->hs__email_required_hint:I

    invoke-direct {p0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->getText(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setHint(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 1

    .line 218
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->nameField:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0, p1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 219
    iget-object p1, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->nameField:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/TextInputEditText;->setSelection(I)V

    return-void
.end method

.method public showAttachmentPreviewScreenFromDraft(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V
    .locals 1

    .line 328
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->newConversationRouter:Lcom/helpshift/support/conversations/NewConversationRouter;

    invoke-interface {v0, p1}, Lcom/helpshift/support/conversations/NewConversationRouter;->showAttachmentPreviewScreenFromDraft(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    return-void
.end method

.method public showConversationStartedMessage()V
    .locals 3

    .line 353
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->context:Landroid/content/Context;

    sget v1, Lcom/helpshift/R$string;->hs__conversation_started_message:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/helpshift/views/HSToast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    .line 356
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public showDescriptionEmptyError()V
    .locals 2

    .line 94
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->descriptionFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

    sget v1, Lcom/helpshift/R$string;->hs__conversation_detail_error:I

    invoke-direct {p0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->getText(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->setError(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public showDescriptionLessThanMinimumError()V
    .locals 2

    .line 99
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->descriptionFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

    sget v1, Lcom/helpshift/R$string;->hs__description_invalid_length_error:I

    invoke-direct {p0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->getText(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->setError(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public showDescriptionOnlySpecialCharactersError()V
    .locals 2

    .line 104
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->descriptionFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

    sget v1, Lcom/helpshift/R$string;->hs__invalid_description_error:I

    invoke-direct {p0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->getText(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->setError(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public showEmailEmptyError()V
    .locals 2

    .line 134
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->emailFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

    sget v1, Lcom/helpshift/R$string;->hs__invalid_email_error:I

    invoke-direct {p0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->getText(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->setError(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public showEmailInvalidError()V
    .locals 2

    .line 129
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->emailFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

    sget v1, Lcom/helpshift/R$string;->hs__invalid_email_error:I

    invoke-direct {p0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->getText(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->setError(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public showErrorView(Lcom/helpshift/common/exception/ExceptionType;)V
    .locals 1

    .line 374
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->parentView:Landroid/view/View;

    invoke-static {p1, v0}, Lcom/helpshift/support/util/SnackbarUtil;->showSnackbar(Lcom/helpshift/common/exception/ExceptionType;Landroid/view/View;)V

    return-void
.end method

.method public showImageAttachmentButton()V
    .locals 2

    .line 149
    sget-object v0, Lcom/helpshift/support/fragments/HSMenuItemType;->SCREENSHOT_ATTACHMENT:Lcom/helpshift/support/fragments/HSMenuItemType;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->changeMenuItemVisibility(Lcom/helpshift/support/fragments/HSMenuItemType;Z)V

    return-void
.end method

.method public showImageAttachmentContainer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 4

    .line 160
    invoke-static {}, Lcom/helpshift/support/imageloader/ImageLoader;->getInstance()Lcom/helpshift/support/imageloader/ImageLoader;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->attachmentImage:Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->context:Landroid/content/Context;

    .line 162
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/helpshift/R$drawable;->hs__placeholder_image:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    new-instance v3, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer$1;

    invoke-direct {v3, p0, p2, p3}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer$1;-><init>(Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;Ljava/lang/String;Ljava/lang/Long;)V

    .line 161
    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/helpshift/support/imageloader/ImageLoader;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;Lcom/helpshift/support/imageloader/ImageLoaderCallback;)V

    return-void
.end method

.method public showNameEmptyError()V
    .locals 2

    .line 114
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->nameFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

    sget v1, Lcom/helpshift/R$string;->hs__username_blank_error:I

    invoke-direct {p0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->getText(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->setError(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public showNameOnlySpecialCharactersError()V
    .locals 2

    .line 119
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->nameFieldWrapper:Lcom/google/android/material/textfield/TextInputLayout;

    sget v1, Lcom/helpshift/R$string;->hs__username_blank_error:I

    invoke-direct {p0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->getText(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->setError(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public showProfileForm()V
    .locals 2

    .line 230
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->nameField:Lcom/google/android/material/textfield/TextInputEditText;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setVisibility(I)V

    .line 231
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->emailField:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setVisibility(I)V

    return-void
.end method

.method public showProgressBar()V
    .locals 2

    .line 333
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->progressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method

.method public showSearchResultFragment(Ljava/util/ArrayList;)V
    .locals 1

    .line 369
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->newConversationRouter:Lcom/helpshift/support/conversations/NewConversationRouter;

    invoke-interface {v0, p1}, Lcom/helpshift/support/conversations/NewConversationRouter;->showSearchResultFragment(Ljava/util/ArrayList;)V

    return-void
.end method

.method public showStartConversationButton()V
    .locals 2

    .line 308
    sget-object v0, Lcom/helpshift/support/fragments/HSMenuItemType;->START_NEW_CONVERSATION:Lcom/helpshift/support/fragments/HSMenuItemType;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->changeMenuItemVisibility(Lcom/helpshift/support/fragments/HSMenuItemType;Z)V

    return-void
.end method

.method public updateDescriptionErrorState(Lcom/helpshift/widget/TextViewState$TextViewStatesError;)V
    .locals 1

    .line 261
    sget-object v0, Lcom/helpshift/widget/TextViewState$TextViewStatesError;->EMPTY:Lcom/helpshift/widget/TextViewState$TextViewStatesError;

    invoke-virtual {v0, p1}, Lcom/helpshift/widget/TextViewState$TextViewStatesError;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 262
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->showDescriptionEmptyError()V

    goto :goto_0

    .line 264
    :cond_0
    sget-object v0, Lcom/helpshift/widget/TextViewState$TextViewStatesError;->ONLY_SPECIAL_CHARACTERS:Lcom/helpshift/widget/TextViewState$TextViewStatesError;

    .line 265
    invoke-virtual {v0, p1}, Lcom/helpshift/widget/TextViewState$TextViewStatesError;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 266
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->showDescriptionOnlySpecialCharactersError()V

    goto :goto_0

    .line 268
    :cond_1
    sget-object v0, Lcom/helpshift/widget/TextViewState$TextViewStatesError;->LESS_THAN_MINIMUM_LENGTH:Lcom/helpshift/widget/TextViewState$TextViewStatesError;

    .line 269
    invoke-virtual {v0, p1}, Lcom/helpshift/widget/TextViewState$TextViewStatesError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 270
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->showDescriptionLessThanMinimumError()V

    goto :goto_0

    .line 273
    :cond_2
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->clearDescriptionError()V

    :goto_0
    return-void
.end method

.method public updateEmailErrorState(Lcom/helpshift/widget/TextViewState$TextViewStatesError;Z)V
    .locals 1

    .line 292
    sget-object v0, Lcom/helpshift/widget/TextViewState$TextViewStatesError;->INVALID_EMAIL:Lcom/helpshift/widget/TextViewState$TextViewStatesError;

    invoke-virtual {v0, p1}, Lcom/helpshift/widget/TextViewState$TextViewStatesError;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 293
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->showEmailInvalidError()V

    goto :goto_0

    .line 295
    :cond_0
    sget-object v0, Lcom/helpshift/widget/TextViewState$TextViewStatesError;->EMPTY:Lcom/helpshift/widget/TextViewState$TextViewStatesError;

    invoke-virtual {v0, p1}, Lcom/helpshift/widget/TextViewState$TextViewStatesError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 296
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->showEmailEmptyError()V

    goto :goto_0

    .line 299
    :cond_1
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->clearEmailError()V

    :goto_0
    if-eqz p2, :cond_2

    .line 302
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->setEmailRequired()V

    :cond_2
    return-void
.end method

.method public updateImageAttachmentButton(Z)V
    .locals 1

    .line 154
    sget-object v0, Lcom/helpshift/support/fragments/HSMenuItemType;->SCREENSHOT_ATTACHMENT:Lcom/helpshift/support/fragments/HSMenuItemType;

    invoke-direct {p0, v0, p1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->changeMenuItemVisibility(Lcom/helpshift/support/fragments/HSMenuItemType;Z)V

    return-void
.end method

.method public updateImageAttachmentClick(Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 203
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->enableImageAttachmentClickable()V

    goto :goto_0

    .line 206
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->disableImageAttachmentClickable()V

    :goto_0
    return-void
.end method

.method public updateImageAttachmentPickerFile(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V
    .locals 2

    if-eqz p1, :cond_1

    .line 190
    iget-object v0, p1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->filePath:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 194
    :cond_0
    iget-object v0, p1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->filePath:Ljava/lang/String;

    iget-object v1, p1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileName:Ljava/lang/String;

    iget-object p1, p1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileSize:Ljava/lang/Long;

    invoke-virtual {p0, v0, v1, p1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->showImageAttachmentContainer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_1

    .line 191
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->hideImageAttachmentContainer()V

    :goto_1
    return-void
.end method

.method public updateNameErrorState(Lcom/helpshift/widget/TextViewState$TextViewStatesError;)V
    .locals 1

    .line 279
    sget-object v0, Lcom/helpshift/widget/TextViewState$TextViewStatesError;->EMPTY:Lcom/helpshift/widget/TextViewState$TextViewStatesError;

    invoke-virtual {v0, p1}, Lcom/helpshift/widget/TextViewState$TextViewStatesError;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 280
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->showNameEmptyError()V

    goto :goto_0

    .line 282
    :cond_0
    sget-object v0, Lcom/helpshift/widget/TextViewState$TextViewStatesError;->ONLY_SPECIAL_CHARACTERS:Lcom/helpshift/widget/TextViewState$TextViewStatesError;

    invoke-virtual {v0, p1}, Lcom/helpshift/widget/TextViewState$TextViewStatesError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 283
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->showNameOnlySpecialCharactersError()V

    goto :goto_0

    .line 286
    :cond_1
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->clearNameError()V

    :goto_0
    return-void
.end method

.method public updateProfileForm(Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 247
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->showProfileForm()V

    goto :goto_0

    .line 250
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->hideProfileForm()V

    :goto_0
    return-void
.end method

.method public updateProgressBarVisibility(Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 339
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->showProgressBar()V

    goto :goto_0

    .line 342
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->hideProgressBar()V

    :goto_0
    return-void
.end method

.method public updateStartConversationButton(Z)V
    .locals 1

    .line 256
    sget-object v0, Lcom/helpshift/support/fragments/HSMenuItemType;->START_NEW_CONVERSATION:Lcom/helpshift/support/fragments/HSMenuItemType;

    invoke-direct {p0, v0, p1}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->changeMenuItemVisibility(Lcom/helpshift/support/fragments/HSMenuItemType;Z)V

    return-void
.end method
