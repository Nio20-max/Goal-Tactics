.class Lcom/helpshift/support/fragments/AttachmentPreviewFragment$2;
.super Ljava/lang/Object;
.source "AttachmentPreviewFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->onCompressAndCopySuccess(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

.field final synthetic val$imagePickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;


# direct methods
.method constructor <init>(Lcom/helpshift/support/fragments/AttachmentPreviewFragment;Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V
    .locals 0

    .line 303
    iput-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$2;->this$0:Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    iput-object p2, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$2;->val$imagePickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 306
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$2;->this$0:Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->toggleProgressBarViewsVisibility(Z)V

    .line 307
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$2;->this$0:Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    iget-object v1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$2;->val$imagePickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    iget-object v1, v1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->filePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->renderPreview(Ljava/lang/String;)V

    return-void
.end method
