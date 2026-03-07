.class Lcom/helpshift/support/fragments/AttachmentPreviewFragment$1;
.super Ljava/lang/Object;
.source "AttachmentPreviewFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->onCompressAndCopyFailure(Lcom/helpshift/common/exception/RootAPIException;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/fragments/AttachmentPreviewFragment;


# direct methods
.method constructor <init>(Lcom/helpshift/support/fragments/AttachmentPreviewFragment;)V
    .locals 0

    .line 288
    iput-object p1, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$1;->this$0:Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 291
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$1;->this$0:Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    iget-object v0, v0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->progressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 292
    iget-object v0, p0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$1;->this$0:Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    invoke-virtual {v0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->getView()Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/helpshift/R$string;->hs__screenshot_cloud_attach_error:I

    const/4 v2, -0x2

    invoke-static {v0, v1, v2}, Lcom/helpshift/support/util/SnackbarUtil;->showSnackbar(Landroid/view/View;II)V

    return-void
.end method
