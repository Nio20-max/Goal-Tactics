.class public Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;
.source "AdminAttachmentMessageDM.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;
    }
.end annotation


# instance fields
.field downloadProgress:I

.field public state:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;)V
    .locals 1

    .line 33
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;)V

    const/4 v0, 0x0

    .line 21
    iput v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->downloadProgress:I

    .line 34
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    .line 35
    iget p1, p1, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->downloadProgress:I

    iput p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->downloadProgress:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 14

    move-object v13, p0

    .line 26
    sget-object v12, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_ATTACHMENT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const/4 v10, 0x1

    move-object v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-wide/from16 v3, p4

    move-object/from16 v5, p6

    move/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    move-object/from16 v9, p10

    move/from16 v11, p11

    invoke-direct/range {v0 .. v12}, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLcom/helpshift/conversation/activeconversation/message/MessageType;)V

    const/4 v0, 0x0

    .line 21
    iput v0, v13, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->downloadProgress:I

    move-object v0, p1

    .line 28
    iput-object v0, v13, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->serverId:Ljava/lang/String;

    .line 29
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->updateState()V

    return-void
.end method

.method static synthetic access$003(Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 18
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->filePath:Ljava/lang/String;

    return-object p1
.end method


# virtual methods
.method public checkAndGetFilePath()Ljava/lang/String;
    .locals 3

    .line 126
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->filePath:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->isValidUriPath(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 127
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->filePath:Ljava/lang/String;

    invoke-interface {v0, v2}, Lcom/helpshift/common/platform/Platform;->canReadFileAtUri(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 128
    iput-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->filePath:Ljava/lang/String;

    .line 129
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;->DOWNLOAD_NOT_STARTED:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    goto :goto_0

    .line 132
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->filePath:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/FileUtil;->doesFilePathExistAndCanRead(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 133
    iput-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->filePath:Ljava/lang/String;

    .line 134
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;->DOWNLOAD_NOT_STARTED:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    .line 136
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->filePath:Ljava/lang/String;

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;
    .locals 1

    .line 146
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 18
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 18
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public getDownloadProgressAndFileSize()Ljava/lang/String;
    .locals 2

    .line 61
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->getDownloadedProgressSize()Ljava/lang/String;

    move-result-object v0

    .line 62
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 63
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->getFormattedFileSize()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 65
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->getFormattedFileSize()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDownloadedProgressSize()Ljava/lang/String;
    .locals 5

    .line 70
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;->DOWNLOADING:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->downloadProgress:I

    if-lez v0, :cond_0

    .line 72
    iget v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->size:I

    iget v1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->downloadProgress:I

    mul-int v0, v0, v1

    int-to-double v0, v0

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    div-double/2addr v0, v2

    .line 73
    iget v2, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->size:I

    int-to-double v2, v2

    cmpg-double v4, v0, v2

    if-gez v4, :cond_0

    .line 74
    invoke-virtual {p0, v0, v1}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->getFormattedFileSize(D)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public handleClick(Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;)V
    .locals 6

    .line 90
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;->DOWNLOADED:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    if-ne v0, v1, :cond_0

    if-eqz p1, :cond_1

    .line 92
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->checkAndGetFilePath()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->contentType:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;->launchAttachment(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 95
    :cond_0
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;->DOWNLOAD_NOT_STARTED:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    if-ne p1, v0, :cond_1

    .line 96
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;->DOWNLOADING:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;)V

    .line 97
    new-instance p1, Lcom/helpshift/downloader/AdminFileInfo;

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->attachmentUrl:Ljava/lang/String;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->fileName:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->contentType:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->isSecureAttachment:Z

    invoke-direct {p1, v0, v1, v2, v3}, Lcom/helpshift/downloader/AdminFileInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 98
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getDownloader()Lcom/helpshift/downloader/SupportDownloader;

    move-result-object v0

    sget-object v1, Lcom/helpshift/downloader/SupportDownloader$StorageDirType;->EXTERNAL_ONLY:Lcom/helpshift/downloader/SupportDownloader$StorageDirType;

    new-instance v2, Lcom/helpshift/common/domain/network/AuthDataProvider;

    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v5, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->attachmentUrl:Ljava/lang/String;

    invoke-direct {v2, v3, v4, v5}, Lcom/helpshift/common/domain/network/AuthDataProvider;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;Ljava/lang/String;)V

    new-instance v3, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$1;

    invoke-direct {v3, p0}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$1;-><init>(Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;)V

    .line 99
    invoke-interface {v0, p1, v1, v2, v3}, Lcom/helpshift/downloader/SupportDownloader;->startDownload(Lcom/helpshift/downloader/AdminFileInfo;Lcom/helpshift/downloader/SupportDownloader$StorageDirType;Lcom/helpshift/common/domain/network/AuthDataProvider;Lcom/helpshift/downloader/SupportDownloadStateChangeListener;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public isUISupportedMessage()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isWriteStoragePermissionRequired()Z
    .locals 2

    .line 81
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;->DOWNLOAD_NOT_STARTED:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V
    .locals 0

    .line 40
    invoke-super {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 46
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->filePath:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->isValidUriPath(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 47
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->updateState()V

    :cond_0
    return-void
.end method

.method setState(Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;)V
    .locals 0

    .line 85
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    .line 86
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->notifyUpdated()V

    return-void
.end method

.method public updateState()V
    .locals 1

    .line 52
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->checkAndGetFilePath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 53
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;->DOWNLOADED:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    goto :goto_0

    .line 56
    :cond_0
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;->DOWNLOAD_NOT_STARTED:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    :goto_0
    return-void
.end method
