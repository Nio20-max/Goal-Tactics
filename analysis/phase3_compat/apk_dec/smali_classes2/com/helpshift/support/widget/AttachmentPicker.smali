.class public Lcom/helpshift/support/widget/AttachmentPicker;
.super Ljava/lang/Object;
.source "AttachmentPicker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/widget/AttachmentPicker$AttachmentPickerListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroidx/fragment/app/Fragment;",
        ":",
        "Lcom/helpshift/support/widget/AttachmentPicker$AttachmentPickerListener;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final ATTACHMENT_FILE_NOT_FOUND:I = -0x1

.field public static final ATTACHMENT_FILE_SIZE_LIMIT_EXCEEDED:I = -0x3

.field public static final INVALID_URI:I = -0x5

.field private static final MAX_ATTACHMENT_FILE_SIZE_LIMIT:J = 0x1900000L

.field public static final NO_APPS_TO_OPEN_ATTACHMENTS_INTENT:I = -0x4

.field private static final TAG:Ljava/lang/String; = "Helpshift_AttPicker"

.field public static final UNSUPPORTED_ATTACHMENT_TYPE:I = -0x2


# instance fields
.field private final KEY_EXTRA_DATA:Ljava/lang/String;

.field private attachmentPickerListenerRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final context:Landroid/content/Context;

.field private final device:Lcom/helpshift/common/platform/Device;

.field private extraData:Landroid/os/Bundle;

.field private sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

.field private selectedAttachmentTypeOption:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/helpshift/common/platform/Device;Landroidx/fragment/app/Fragment;Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/helpshift/common/platform/Device;",
            "TT;",
            "Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;",
            ")V"
        }
    .end annotation

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "key_extra_data"

    .line 50
    iput-object v0, p0, Lcom/helpshift/support/widget/AttachmentPicker;->KEY_EXTRA_DATA:Ljava/lang/String;

    .line 63
    iput-object p1, p0, Lcom/helpshift/support/widget/AttachmentPicker;->context:Landroid/content/Context;

    .line 64
    iput-object p2, p0, Lcom/helpshift/support/widget/AttachmentPicker;->device:Lcom/helpshift/common/platform/Device;

    .line 65
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/helpshift/support/widget/AttachmentPicker;->attachmentPickerListenerRef:Ljava/lang/ref/WeakReference;

    .line 66
    iput-object p4, p0, Lcom/helpshift/support/widget/AttachmentPicker;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    return-void
.end method

.method private createAttachmentPickerFileFromUri(Landroid/net/Uri;)Lcom/helpshift/conversation/dto/AttachmentPickerFile;
    .locals 8

    .line 181
    iget-object v0, p0, Lcom/helpshift/support/widget/AttachmentPicker;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, v0

    move-object v2, p1

    .line 182
    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 187
    :try_start_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "_display_name"

    .line 188
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 189
    invoke-virtual {v0, p1}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 190
    invoke-static {v3}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 191
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_0
    const-string v4, "_size"

    .line 193
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    .line 194
    invoke-interface {v1, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v5

    if-nez v5, :cond_3

    .line 195
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_3

    .line 198
    :try_start_1
    invoke-static {v4}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v4

    :try_start_2
    const-string v5, "Helpshift_AttPicker"

    .line 201
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error getting size due to "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    if-eqz v1, :cond_1

    .line 209
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 211
    :cond_1
    throw p1

    :cond_2
    move-object v0, v2

    move-object v3, v0

    :cond_3
    :goto_0
    if-eqz v1, :cond_4

    .line 209
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 212
    :cond_4
    new-instance v1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    invoke-direct {v1, p1, v3, v2}, Lcom/helpshift/conversation/dto/AttachmentPickerFile;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Long;)V

    .line 215
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_5

    const-string p1, "image/"

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_5

    const/4 p1, 0x1

    .line 216
    iput p1, v1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->attachmentType:I

    goto :goto_1

    .line 219
    :cond_5
    iget p1, p0, Lcom/helpshift/support/widget/AttachmentPicker;->selectedAttachmentTypeOption:I

    iput p1, v1, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->attachmentType:I

    :goto_1
    return-object v1
.end method

.method private getSelectedAttachmentTypeOption()I
    .locals 2

    .line 280
    iget-object v0, p0, Lcom/helpshift/support/widget/AttachmentPicker;->extraData:Landroid/os/Bundle;

    const-string v1, "key_attachment_type"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private isAttachmentWhiteListed(Landroid/net/Uri;)Z
    .locals 3

    .line 225
    iget-object v0, p0, Lcom/helpshift/support/widget/AttachmentPicker;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getWhiteListAttachmentMimeTypes()Ljava/util/List;

    move-result-object v0

    const-string v1, "*/*"

    .line 226
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    return v2

    .line 230
    :cond_0
    iget-object v1, p0, Lcom/helpshift/support/widget/AttachmentPicker;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 231
    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "application/octet-stream"

    .line 232
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 234
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p1}, Lcom/helpshift/util/HSPattern;->isValidMime(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :cond_2
    :goto_0
    return v2
.end method

.method private isUriValid(Landroid/net/Uri;)Z
    .locals 1

    .line 177
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p1

    const-string v0, "content"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method private processUriForAttachment(Landroid/net/Uri;)V
    .locals 8

    .line 141
    invoke-direct {p0, p1}, Lcom/helpshift/support/widget/AttachmentPicker;->isUriValid(Landroid/net/Uri;)Z

    move-result v0

    const-string v1, "Attachment picker file invalid mime type, returning failure"

    const/4 v2, 0x0

    const-string v3, "Helpshift_AttPicker"

    if-eqz v0, :cond_4

    .line 142
    invoke-direct {p0, p1}, Lcom/helpshift/support/widget/AttachmentPicker;->isAttachmentWhiteListed(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 143
    iget-object v0, p0, Lcom/helpshift/support/widget/AttachmentPicker;->context:Landroid/content/Context;

    invoke-static {p1, v0}, Lcom/helpshift/util/AndroidFileUtil;->doesFileFromUriExistAndCanRead(Landroid/net/Uri;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 145
    invoke-direct {p0, p1}, Lcom/helpshift/support/widget/AttachmentPicker;->createAttachmentPickerFileFromUri(Landroid/net/Uri;)Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    move-result-object v0

    .line 146
    iget-object v1, v0, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileSize:Ljava/lang/Long;

    if-eqz v1, :cond_1

    .line 147
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const-wide/32 v6, 0x1900000

    cmp-long v2, v4, v6

    if-lez v2, :cond_1

    iget v2, v0, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->attachmentType:I

    const/4 v4, 0x1

    if-ne v2, v4, :cond_0

    iget-object v2, p0, Lcom/helpshift/support/widget/AttachmentPicker;->context:Landroid/content/Context;

    .line 148
    invoke-static {p1, v2}, Lcom/helpshift/util/ImageUtil;->isResizableImage(Landroid/net/Uri;Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 153
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Attachment picker file size limit exceeded (in bytes): "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", returning failure"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x3

    .line 156
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 155
    invoke-direct {p0, p1, v0}, Lcom/helpshift/support/widget/AttachmentPicker;->sendAttachmentPickerResultFailureCallback(ILjava/lang/Long;)V

    goto :goto_1

    .line 149
    :cond_1
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Attachment picker result success, path: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentPicker;->extraData:Landroid/os/Bundle;

    invoke-direct {p0, v0, p1}, Lcom/helpshift/support/widget/AttachmentPicker;->sendAttachmentPickerResultSuccessCallback(Lcom/helpshift/conversation/dto/AttachmentPickerFile;Landroid/os/Bundle;)V

    goto :goto_1

    :cond_2
    const-string p1, "Attachment picker file reading error, returning failure"

    .line 160
    invoke-static {v3, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x1

    .line 161
    invoke-direct {p0, p1, v2}, Lcom/helpshift/support/widget/AttachmentPicker;->sendAttachmentPickerResultFailureCallback(ILjava/lang/Long;)V

    goto :goto_1

    .line 165
    :cond_3
    invoke-static {v3, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x2

    .line 166
    invoke-direct {p0, p1, v2}, Lcom/helpshift/support/widget/AttachmentPicker;->sendAttachmentPickerResultFailureCallback(ILjava/lang/Long;)V

    goto :goto_1

    .line 170
    :cond_4
    invoke-static {v3, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x5

    .line 171
    invoke-direct {p0, p1, v2}, Lcom/helpshift/support/widget/AttachmentPicker;->sendAttachmentPickerResultFailureCallback(ILjava/lang/Long;)V

    :goto_1
    return-void
.end method

.method private sendAttachmentPickerResultFailureCallback(ILjava/lang/Long;)V
    .locals 1

    .line 249
    iget-object v0, p0, Lcom/helpshift/support/widget/AttachmentPicker;->attachmentPickerListenerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_0

    .line 251
    check-cast v0, Lcom/helpshift/support/widget/AttachmentPicker$AttachmentPickerListener;

    invoke-interface {v0, p1, p2}, Lcom/helpshift/support/widget/AttachmentPicker$AttachmentPickerListener;->onAttachmentPickerResultFailure(ILjava/lang/Long;)V

    :cond_0
    return-void
.end method

.method private sendAttachmentPickerResultSuccessCallback(Lcom/helpshift/conversation/dto/AttachmentPickerFile;Landroid/os/Bundle;)V
    .locals 1

    .line 241
    iget-object v0, p0, Lcom/helpshift/support/widget/AttachmentPicker;->attachmentPickerListenerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_0

    .line 243
    check-cast v0, Lcom/helpshift/support/widget/AttachmentPicker$AttachmentPickerListener;

    invoke-interface {v0, p1, p2}, Lcom/helpshift/support/widget/AttachmentPicker$AttachmentPickerListener;->onAttachmentPickerResultSuccess(Lcom/helpshift/conversation/dto/AttachmentPickerFile;Landroid/os/Bundle;)V

    :cond_0
    return-void
.end method

.method private startActivityForResult(Landroid/content/Intent;I)V
    .locals 2

    .line 258
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/support/widget/AttachmentPicker;->attachmentPickerListenerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_0

    .line 259
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 260
    invoke-virtual {v0, p1, p2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 264
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Error occurred while starting app for handling attachment pick intent "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Helpshift_AttPicker"

    invoke-static {p2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x4

    const/4 p2, 0x0

    .line 265
    invoke-direct {p0, p1, p2}, Lcom/helpshift/support/widget/AttachmentPicker;->sendAttachmentPickerResultFailureCallback(ILjava/lang/Long;)V

    :cond_0
    :goto_0
    return-void
.end method


# virtual methods
.method public launchPicker(Landroid/os/Bundle;)V
    .locals 3

    .line 70
    iput-object p1, p0, Lcom/helpshift/support/widget/AttachmentPicker;->extraData:Landroid/os/Bundle;

    .line 71
    invoke-direct {p0}, Lcom/helpshift/support/widget/AttachmentPicker;->getSelectedAttachmentTypeOption()I

    move-result p1

    iput p1, p0, Lcom/helpshift/support/widget/AttachmentPicker;->selectedAttachmentTypeOption:I

    const-string p1, "Helpshift_AttPicker"

    const-string v0, "Checking permission before launching attachment picker"

    .line 73
    invoke-static {p1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    sget-object v0, Lcom/helpshift/support/widget/AttachmentPicker$1;->$SwitchMap$com$helpshift$common$platform$Device$PermissionState:[I

    iget-object v1, p0, Lcom/helpshift/support/widget/AttachmentPicker;->device:Lcom/helpshift/common/platform/Device;

    sget-object v2, Lcom/helpshift/common/platform/Device$PermissionType;->READ_STORAGE:Lcom/helpshift/common/platform/Device$PermissionType;

    invoke-interface {v1, v2}, Lcom/helpshift/common/platform/Device;->checkPermission(Lcom/helpshift/common/platform/Device$PermissionType;)Lcom/helpshift/common/platform/Device$PermissionState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/helpshift/common/platform/Device$PermissionState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "READ_STORAGE permission is not granted but can be requested"

    .line 98
    invoke-static {p1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentPicker;->attachmentPickerListenerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/fragment/app/Fragment;

    if-eqz p1, :cond_3

    .line 102
    check-cast p1, Lcom/helpshift/support/widget/AttachmentPicker$AttachmentPickerListener;

    invoke-interface {p1}, Lcom/helpshift/support/widget/AttachmentPicker$AttachmentPickerListener;->askForReadStoragePermission()V

    goto :goto_0

    :cond_1
    const-string v0, "READ_STORAGE permission is not granted and can\'t be requested, starting alternate flow"

    .line 86
    invoke-static {p1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentPicker;->context:Landroid/content/Context;

    iget v0, p0, Lcom/helpshift/support/widget/AttachmentPicker;->selectedAttachmentTypeOption:I

    iget-object v2, p0, Lcom/helpshift/support/widget/AttachmentPicker;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    .line 94
    invoke-virtual {v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getWhiteListAttachmentMimeTypes()Ljava/util/List;

    move-result-object v2

    .line 90
    invoke-static {p1, v0, v1, v2}, Lcom/helpshift/util/AttachmentDataProvider;->getIntentForAttachmentType(Landroid/content/Context;IILjava/util/List;)Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1, v1}, Lcom/helpshift/support/widget/AttachmentPicker;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 77
    :cond_2
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentPicker;->context:Landroid/content/Context;

    iget v0, p0, Lcom/helpshift/support/widget/AttachmentPicker;->selectedAttachmentTypeOption:I

    iget-object v2, p0, Lcom/helpshift/support/widget/AttachmentPicker;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    .line 81
    invoke-virtual {v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getWhiteListAttachmentMimeTypes()Ljava/util/List;

    move-result-object v2

    .line 77
    invoke-static {p1, v0, v1, v2}, Lcom/helpshift/util/AttachmentDataProvider;->getIntentForAttachmentType(Landroid/content/Context;IILjava/util/List;)Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1, v1}, Lcom/helpshift/support/widget/AttachmentPicker;->startActivityForResult(Landroid/content/Intent;I)V

    :cond_3
    :goto_0
    return-void
.end method

.method public onAttachmentPickRequestResult(ILandroid/content/Intent;)V
    .locals 4

    .line 119
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "Helpshift_AttPicker"

    const/4 v2, 0x1

    if-ne p1, v2, :cond_0

    const-string p1, "Processing attachment uri with flow when permissions are available"

    .line 121
    invoke-static {v1, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    invoke-direct {p0, v0}, Lcom/helpshift/support/widget/AttachmentPicker;->processUriForAttachment(Landroid/net/Uri;)V

    goto :goto_0

    :cond_0
    const/4 v3, 0x2

    if-ne p1, v3, :cond_2

    const-string p1, "Processing attachment uri with flow when permissions are not available"

    .line 125
    invoke-static {v1, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    invoke-virtual {p2}, Landroid/content/Intent;->getFlags()I

    move-result p1

    and-int/2addr p1, v2

    .line 128
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt p2, v1, :cond_1

    .line 129
    iget-object p2, p0, Lcom/helpshift/support/widget/AttachmentPicker;->context:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    invoke-virtual {p2, v0, p1}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V

    .line 131
    :cond_1
    invoke-direct {p0, v0}, Lcom/helpshift/support/widget/AttachmentPicker;->processUriForAttachment(Landroid/net/Uri;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 270
    iget-object v0, p0, Lcom/helpshift/support/widget/AttachmentPicker;->extraData:Landroid/os/Bundle;

    const-string v1, "key_extra_data"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public onViewStateRestored(Landroid/os/Bundle;)V
    .locals 2

    const-string v0, "key_extra_data"

    .line 274
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 275
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/widget/AttachmentPicker;->extraData:Landroid/os/Bundle;

    :cond_0
    return-void
.end method
