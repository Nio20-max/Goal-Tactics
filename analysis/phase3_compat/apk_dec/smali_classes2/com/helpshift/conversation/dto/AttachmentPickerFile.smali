.class public Lcom/helpshift/conversation/dto/AttachmentPickerFile;
.super Ljava/lang/Object;
.source "AttachmentPickerFile.java"


# instance fields
.field public attachmentType:I

.field public filePath:Ljava/lang/String;

.field public isFileCompressionAndCopyingDone:Z

.field public final originalFileName:Ljava/lang/String;

.field public final originalFileSize:Ljava/lang/Long;

.field public transientUri:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->transientUri:Ljava/lang/Object;

    .line 45
    iput-object p2, p0, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileName:Ljava/lang/String;

    .line 46
    iput-object p3, p0, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileSize:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->filePath:Ljava/lang/String;

    .line 39
    iput-object p2, p0, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileName:Ljava/lang/String;

    .line 40
    iput-object p3, p0, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileSize:Ljava/lang/Long;

    return-void
.end method
