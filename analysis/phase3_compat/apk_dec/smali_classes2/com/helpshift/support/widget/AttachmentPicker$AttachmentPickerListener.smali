.class public interface abstract Lcom/helpshift/support/widget/AttachmentPicker$AttachmentPickerListener;
.super Ljava/lang/Object;
.source "AttachmentPicker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/widget/AttachmentPicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "AttachmentPickerListener"
.end annotation


# virtual methods
.method public abstract askForReadStoragePermission()V
.end method

.method public abstract onAttachmentPickerResultFailure(ILjava/lang/Long;)V
.end method

.method public abstract onAttachmentPickerResultSuccess(Lcom/helpshift/conversation/dto/AttachmentPickerFile;Landroid/os/Bundle;)V
.end method
