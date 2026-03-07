.class Lcom/helpshift/common/domain/AttachmentFileManagerDM$1;
.super Lcom/helpshift/common/domain/F;
.source "AttachmentFileManagerDM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/common/domain/AttachmentFileManagerDM;->compressAndCopyAttachment(Lcom/helpshift/conversation/dto/AttachmentPickerFile;Lcom/helpshift/common/domain/AttachmentFileManagerDM$Listener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/common/domain/AttachmentFileManagerDM;

.field final synthetic val$attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

.field final synthetic val$listener:Lcom/helpshift/common/domain/AttachmentFileManagerDM$Listener;


# direct methods
.method constructor <init>(Lcom/helpshift/common/domain/AttachmentFileManagerDM;Lcom/helpshift/conversation/dto/AttachmentPickerFile;Lcom/helpshift/common/domain/AttachmentFileManagerDM$Listener;)V
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/helpshift/common/domain/AttachmentFileManagerDM$1;->this$0:Lcom/helpshift/common/domain/AttachmentFileManagerDM;

    iput-object p2, p0, Lcom/helpshift/common/domain/AttachmentFileManagerDM$1;->val$attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    iput-object p3, p0, Lcom/helpshift/common/domain/AttachmentFileManagerDM$1;->val$listener:Lcom/helpshift/common/domain/AttachmentFileManagerDM$Listener;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 2

    .line 38
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/common/domain/AttachmentFileManagerDM$1;->this$0:Lcom/helpshift/common/domain/AttachmentFileManagerDM;

    iget-object v0, v0, Lcom/helpshift/common/domain/AttachmentFileManagerDM;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v1, p0, Lcom/helpshift/common/domain/AttachmentFileManagerDM$1;->val$attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    invoke-interface {v0, v1}, Lcom/helpshift/common/platform/Platform;->compressAndCopyAttachment(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    .line 39
    iget-object v0, p0, Lcom/helpshift/common/domain/AttachmentFileManagerDM$1;->val$listener:Lcom/helpshift/common/domain/AttachmentFileManagerDM$Listener;

    iget-object v1, p0, Lcom/helpshift/common/domain/AttachmentFileManagerDM$1;->val$attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    invoke-interface {v0, v1}, Lcom/helpshift/common/domain/AttachmentFileManagerDM$Listener;->onCompressAndCopySuccess(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 42
    iget-object v1, p0, Lcom/helpshift/common/domain/AttachmentFileManagerDM$1;->val$listener:Lcom/helpshift/common/domain/AttachmentFileManagerDM$Listener;

    invoke-interface {v1, v0}, Lcom/helpshift/common/domain/AttachmentFileManagerDM$Listener;->onCompressAndCopyFailure(Lcom/helpshift/common/exception/RootAPIException;)V

    .line 43
    throw v0
.end method
