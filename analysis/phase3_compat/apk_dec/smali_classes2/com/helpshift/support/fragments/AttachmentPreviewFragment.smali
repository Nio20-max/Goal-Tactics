.class public Lcom/helpshift/support/fragments/AttachmentPreviewFragment;
.super Lcom/helpshift/support/fragments/MainFragment;
.source "AttachmentPreviewFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/helpshift/common/domain/AttachmentFileManagerDM$Listener;
.implements Lcom/helpshift/conversation/activeconversation/AttachmentPreviewRenderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/fragments/AttachmentPreviewFragment$Modes;,
        Lcom/helpshift/support/fragments/AttachmentPreviewFragment$LaunchSource;,
        Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;
    }
.end annotation


# static fields
.field public static final FRAGMENT_TAG:Ljava/lang/String; = "AttachmentPreviewFragment"

.field public static final KEY_ATTACHMENT_MODE:Ljava/lang/String; = "key_attachment_mode"

.field public static final KEY_ATTACHMENT_TYPE:Ljava/lang/String; = "key_attachment_type"

.field public static final KEY_MESSAGE_REFERS_ID:Ljava/lang/String; = "key_refers_id"

.field private static final screenType:Lcom/helpshift/support/util/AppSessionConstants$Screen;


# instance fields
.field private attachmentFileNameView:Landroid/widget/TextView;

.field private attachmentFileSizeView:Landroid/widget/TextView;

.field private attachmentFileTypeView:Landroid/widget/TextView;

.field private attachmentMessageRefersId:Ljava/lang/String;

.field attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

.field private attachmentPickerType:I

.field private attachmentPreviewListener:Lcom/helpshift/support/contracts/AttachmentPreviewListener;

.field private attachmentPreviewVM:Lcom/helpshift/conversation/viewmodel/AttachmentPreviewVM;

.field private buttonsContainer:Landroid/view/View;

.field private genericAttachmentPreview:Landroid/view/View;

.field launchSource:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$LaunchSource;

.field private mode:I

.field progressBar:Landroid/widget/ProgressBar;

.field private screenshotPreview:Landroid/widget/ImageView;

.field private secondaryButton:Landroid/widget/Button;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 49
    sget-object v0, Lcom/helpshift/support/util/AppSessionConstants$Screen;->SCREENSHOT_PREVIEW:Lcom/helpshift/support/util/AppSessionConstants$Screen;

    sput-object v0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->screenType:Lcom/helpshift/support/util/AppSessionConstants$Screen;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Lcom/helpshift/support/fragments/MainFragment;-><init>()V

    return-void
.end method

.method private static getSendIconAsDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 96
    sget v0, Lcom/helpshift/R$attr;->hs__messageSendIcon:I

    invoke-static {p0, v0}, Lcom/helpshift/support/util/Styles;->getResourceIdForAttribute(Landroid/content/Context;I)I

    move-result v0

    .line 100
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const v1, 0x1010039

    .line 101
    invoke-static {p0, v0, v1}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    return-object v0
.end method

.method public static newInstance(Lcom/helpshift/support/contracts/AttachmentPreviewListener;)Lcom/helpshift/support/fragments/AttachmentPreviewFragment;
    .locals 1

    .line 65
    new-instance v0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    invoke-direct {v0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;-><init>()V

    .line 66
    iput-object p0, v0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPreviewListener:Lcom/helpshift/support/contracts/AttachmentPreviewListener;

    return-object v0
.end method

.method private setAttachmentPreview()V
    .locals 2

    .line 202
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 203
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    if-nez v0, :cond_1

    .line 204
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPreviewListener:Lcom/helpshift/support/contracts/AttachmentPreviewListener;

    if-eqz v0, :cond_0

    .line 205
    invoke-interface {v0}, Lcom/helpshift/support/contracts/AttachmentPreviewListener;->removeAttachmentPreviewFragment()V

    :cond_0
    return-void

    .line 209
    :cond_1
    iget-object v0, v0, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->filePath:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 211
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    iget-object v0, v0, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->filePath:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->renderPreview(Ljava/lang/String;)V

    goto :goto_0

    .line 213
    :cond_2
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    iget-object v0, v0, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->transientUri:Ljava/lang/Object;

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    .line 216
    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->toggleProgressBarViewsVisibility(Z)V

    .line 217
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getAttachmentFileManagerDM()Lcom/helpshift/common/domain/AttachmentFileManagerDM;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    invoke-virtual {v0, v1, p0}, Lcom/helpshift/common/domain/AttachmentFileManagerDM;->compressAndCopyAttachment(Lcom/helpshift/conversation/dto/AttachmentPickerFile;Lcom/helpshift/common/domain/AttachmentFileManagerDM$Listener;)V

    :cond_3
    :goto_0
    return-void
.end method

.method private static setSecondaryButtonTextAndDrawable(Landroid/widget/Button;I)V
    .locals 3

    .line 71
    invoke-virtual {p0}, Landroid/widget/Button;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq p1, v1, :cond_2

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    const/4 v1, 0x3

    if-eq p1, v1, :cond_0

    const-string p1, ""

    goto :goto_0

    .line 82
    :cond_0
    sget p1, Lcom/helpshift/R$string;->hs__send_msg_btn:I

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 83
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->getSendIconAsDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_1

    .line 79
    :cond_1
    sget p1, Lcom/helpshift/R$string;->hs__screenshot_remove:I

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 76
    :cond_2
    sget p1, Lcom/helpshift/R$string;->hs__screenshot_add:I

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_0
    move-object v0, v2

    .line 89
    :goto_1
    invoke-virtual {p0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    if-eqz v0, :cond_3

    .line 91
    invoke-virtual {p0, v0, v2, v2, v2}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_3
    return-void
.end method


# virtual methods
.method public deleteAttachmentLocalCopy()V
    .locals 2

    .line 196
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->launchSource:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$LaunchSource;

    sget-object v1, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$LaunchSource;->GALLERY_APP:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$LaunchSource;

    if-ne v0, v1, :cond_0

    .line 197
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getAttachmentFileManagerDM()Lcom/helpshift/common/domain/AttachmentFileManagerDM;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/AttachmentFileManagerDM;->deleteAttachmentLocalCopy(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    :cond_0
    return-void
.end method

.method public onAuthenticationFailure()V
    .locals 1

    .line 334
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/fragments/SupportFragment;

    invoke-virtual {v0}, Lcom/helpshift/support/fragments/SupportFragment;->getSupportController()Lcom/helpshift/support/controllers/SupportController;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 336
    invoke-virtual {v0}, Lcom/helpshift/support/controllers/SupportController;->onAuthenticationFailure()V

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 255
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    .line 256
    sget v0, Lcom/helpshift/R$id;->secondary_button:I

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-ne p1, v0, :cond_3

    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    if-eqz v0, :cond_3

    .line 257
    iget p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->mode:I

    if-eq p1, v1, :cond_2

    if-eq p1, v2, :cond_1

    const/4 v1, 0x3

    if-eq p1, v1, :cond_0

    goto :goto_0

    .line 262
    :cond_0
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPreviewListener:Lcom/helpshift/support/contracts/AttachmentPreviewListener;

    iget-object v1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentMessageRefersId:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/helpshift/support/contracts/AttachmentPreviewListener;->sendAttachment(Lcom/helpshift/conversation/dto/AttachmentPickerFile;Ljava/lang/String;)V

    goto :goto_0

    .line 266
    :cond_1
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/helpshift/CoreApi;->getAttachmentFileManagerDM()Lcom/helpshift/common/domain/AttachmentFileManagerDM;

    move-result-object p1

    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    invoke-virtual {p1, v0}, Lcom/helpshift/common/domain/AttachmentFileManagerDM;->deleteAttachmentLocalCopy(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    .line 267
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPreviewListener:Lcom/helpshift/support/contracts/AttachmentPreviewListener;

    invoke-interface {p1}, Lcom/helpshift/support/contracts/AttachmentPreviewListener;->removeAttachment()V

    goto :goto_0

    .line 259
    :cond_2
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPreviewListener:Lcom/helpshift/support/contracts/AttachmentPreviewListener;

    invoke-interface {p1, v0}, Lcom/helpshift/support/contracts/AttachmentPreviewListener;->addAttachment(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    goto :goto_0

    .line 271
    :cond_3
    sget v0, Lcom/helpshift/R$id;->change:I

    if-ne p1, v0, :cond_5

    .line 272
    iget p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->mode:I

    if-ne p1, v2, :cond_4

    .line 273
    iput v1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->mode:I

    .line 275
    :cond_4
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/helpshift/CoreApi;->getAttachmentFileManagerDM()Lcom/helpshift/common/domain/AttachmentFileManagerDM;

    move-result-object p1

    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    invoke-virtual {p1, v0}, Lcom/helpshift/common/domain/AttachmentFileManagerDM;->deleteAttachmentLocalCopy(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    const/4 p1, 0x0

    .line 276
    iput-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    .line 277
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 278
    iget v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->mode:I

    const-string v1, "key_attachment_mode"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 279
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentMessageRefersId:Ljava/lang/String;

    const-string v1, "key_refers_id"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    iget v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerType:I

    const-string v1, "key_attachment_type"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 281
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPreviewListener:Lcom/helpshift/support/contracts/AttachmentPreviewListener;

    invoke-interface {v0, p1}, Lcom/helpshift/support/contracts/AttachmentPreviewListener;->changeAttachment(Landroid/os/Bundle;)V

    :cond_5
    :goto_0
    return-void
.end method

.method public onCompressAndCopyFailure(Lcom/helpshift/common/exception/RootAPIException;)V
    .locals 1

    .line 287
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 288
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    new-instance v0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$1;

    invoke-direct {v0, p0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$1;-><init>(Lcom/helpshift/support/fragments/AttachmentPreviewFragment;)V

    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onCompressAndCopySuccess(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V
    .locals 2

    .line 302
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 303
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    new-instance v1, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$2;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$2;-><init>(Lcom/helpshift/support/fragments/AttachmentPreviewFragment;Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 124
    sget p3, Lcom/helpshift/R$layout;->hs__attachment_preview_fragment:I

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDestroyView()V
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPreviewVM:Lcom/helpshift/conversation/viewmodel/AttachmentPreviewVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/AttachmentPreviewVM;->unregisterRenderer()V

    .line 161
    invoke-static {}, Lcom/helpshift/support/imageloader/ImageLoader;->getInstance()Lcom/helpshift/support/imageloader/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/support/imageloader/ImageLoader;->cancelAll()V

    .line 162
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onDestroyView()V

    return-void
.end method

.method public onPause()V
    .locals 1

    .line 174
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/util/SnackbarUtil;->hideSnackbar(Landroid/view/View;)V

    .line 175
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 150
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onResume()V

    .line 151
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->secondaryButton:Landroid/widget/Button;

    iget v1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->mode:I

    invoke-static {v0, v1}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->setSecondaryButtonTextAndDrawable(Landroid/widget/Button;I)V

    .line 152
    invoke-direct {p0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->setAttachmentPreview()V

    .line 153
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->getView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 154
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 155
    sget v0, Lcom/helpshift/R$string;->hs__preview_header:I

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->setToolbarTitle(Ljava/lang/String;)V

    return-void
.end method

.method public onStart()V
    .locals 3

    .line 167
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onStart()V

    .line 168
    invoke-static {}, Lcom/helpshift/support/storage/IMAppSessionStorage;->getInstance()Lcom/helpshift/support/storage/IMAppSessionStorage;

    move-result-object v0

    sget-object v1, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->screenType:Lcom/helpshift/support/util/AppSessionConstants$Screen;

    const-string v2, "current_open_screen"

    invoke-virtual {v0, v2, v1}, Lcom/helpshift/support/storage/IMAppSessionStorage;->set(Ljava/lang/String;Ljava/io/Serializable;)Z

    return-void
.end method

.method public onStop()V
    .locals 3

    .line 180
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onStop()V

    .line 181
    invoke-static {}, Lcom/helpshift/support/storage/IMAppSessionStorage;->getInstance()Lcom/helpshift/support/storage/IMAppSessionStorage;

    move-result-object v0

    const-string v1, "current_open_screen"

    .line 182
    invoke-virtual {v0, v1}, Lcom/helpshift/support/storage/IMAppSessionStorage;->get(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/util/AppSessionConstants$Screen;

    if-eqz v0, :cond_0

    .line 183
    sget-object v2, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->screenType:Lcom/helpshift/support/util/AppSessionConstants$Screen;

    invoke-virtual {v0, v2}, Lcom/helpshift/support/util/AppSessionConstants$Screen;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 184
    invoke-static {}, Lcom/helpshift/support/storage/IMAppSessionStorage;->getInstance()Lcom/helpshift/support/storage/IMAppSessionStorage;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/helpshift/support/storage/IMAppSessionStorage;->removeKey(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    .line 129
    invoke-super {p0, p1, p2}, Lcom/helpshift/support/fragments/MainFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 130
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p2

    invoke-interface {p2, p0}, Lcom/helpshift/CoreApi;->getAttachmentPreviewModel(Lcom/helpshift/conversation/activeconversation/AttachmentPreviewRenderer;)Lcom/helpshift/conversation/viewmodel/AttachmentPreviewVM;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPreviewVM:Lcom/helpshift/conversation/viewmodel/AttachmentPreviewVM;

    .line 131
    sget p2, Lcom/helpshift/R$id;->screenshot_preview:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->screenshotPreview:Landroid/widget/ImageView;

    .line 132
    sget p2, Lcom/helpshift/R$id;->generic_attachment_preview:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->genericAttachmentPreview:Landroid/view/View;

    .line 133
    sget p2, Lcom/helpshift/R$id;->attachment_file_name:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentFileNameView:Landroid/widget/TextView;

    .line 134
    sget p2, Lcom/helpshift/R$id;->attachment_file_type:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentFileTypeView:Landroid/widget/TextView;

    .line 135
    sget p2, Lcom/helpshift/R$id;->attachment_file_size:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentFileSizeView:Landroid/widget/TextView;

    .line 137
    sget p2, Lcom/helpshift/R$id;->change:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    .line 138
    invoke-virtual {p2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    sget p2, Lcom/helpshift/R$id;->secondary_button:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->secondaryButton:Landroid/widget/Button;

    .line 141
    invoke-virtual {p2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 143
    sget p2, Lcom/helpshift/R$id;->screenshot_loading_indicator:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ProgressBar;

    iput-object p2, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->progressBar:Landroid/widget/ProgressBar;

    .line 145
    sget p2, Lcom/helpshift/R$id;->button_containers:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->buttonsContainer:Landroid/view/View;

    return-void
.end method

.method renderPreview(Ljava/lang/String;)V
    .locals 4

    .line 224
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    iget v0, v0, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->attachmentType:I

    const/16 v1, 0x8

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v2, :cond_0

    .line 225
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->genericAttachmentPreview:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 226
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->screenshotPreview:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 227
    invoke-static {}, Lcom/helpshift/support/imageloader/ImageLoader;->getInstance()Lcom/helpshift/support/imageloader/ImageLoader;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->screenshotPreview:Landroid/widget/ImageView;

    .line 229
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/helpshift/R$drawable;->hs__placeholder_image:I

    .line 230
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/4 v3, -0x1

    .line 227
    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/helpshift/support/imageloader/ImageLoader;->loadImageWithoutSampling(Ljava/lang/String;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;I)V

    goto :goto_0

    .line 234
    :cond_0
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->genericAttachmentPreview:Landroid/view/View;

    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 235
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->screenshotPreview:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 236
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentFileNameView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    iget-object v0, v0, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 237
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    iget-object p1, p1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileName:Ljava/lang/String;

    invoke-static {p1}, Lcom/helpshift/util/AndroidFileUtil;->getFileExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 239
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    const-string v1, ""

    if-nez v0, :cond_1

    const-string v0, "."

    .line 240
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 241
    sget v0, Lcom/helpshift/R$string;->hs__file_type:I

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p1, v1, v3

    invoke-virtual {p0, v0, v1}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 247
    :cond_1
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentFileTypeView:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 249
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentFileSizeView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    iget-object v0, v0, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileSize:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    long-to-double v0, v0

    invoke-static {v0, v1}, Lcom/helpshift/util/AttachmentFileSize;->getFormattedFileSize(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method public setAttachmentPreviewListener(Lcom/helpshift/support/contracts/AttachmentPreviewListener;)V
    .locals 0

    .line 117
    iput-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPreviewListener:Lcom/helpshift/support/contracts/AttachmentPreviewListener;

    return-void
.end method

.method public setParams(Landroid/os/Bundle;Lcom/helpshift/conversation/dto/AttachmentPickerFile;Lcom/helpshift/support/fragments/AttachmentPreviewFragment$LaunchSource;)V
    .locals 1

    const-string v0, "key_attachment_mode"

    .line 108
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->mode:I

    const-string v0, "key_refers_id"

    .line 109
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentMessageRefersId:Ljava/lang/String;

    const-string v0, "key_attachment_type"

    .line 110
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerType:I

    .line 111
    iput-object p2, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    .line 112
    iput-object p3, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->launchSource:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$LaunchSource;

    .line 113
    invoke-direct {p0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->setAttachmentPreview()V

    return-void
.end method

.method public shouldRefreshMenu()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method toggleProgressBarViewsVisibility(Z)V
    .locals 2

    const/4 v0, 0x0

    const/16 v1, 0x8

    if-eqz p1, :cond_0

    .line 315
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 316
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->buttonsContainer:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 317
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->screenshotPreview:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 318
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->genericAttachmentPreview:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 321
    :cond_0
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {p1, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 322
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->buttonsContainer:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 323
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    iget p1, p1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->attachmentType:I

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 324
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->screenshotPreview:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    .line 327
    :cond_1
    iget-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->genericAttachmentPreview:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    return-void
.end method
