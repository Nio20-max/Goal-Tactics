.class public Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;
.source "UserAttachmentMessageDM.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;
    }
.end annotation


# instance fields
.field progressPercentage:I

.field public state:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;


# direct methods
.method public constructor <init>(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V
    .locals 1

    .line 51
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;)V

    const/4 v0, 0x0

    .line 39
    iput v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->progressPercentage:I

    .line 52
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    .line 53
    iget p1, p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->progressPercentage:I

    iput p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->progressPercentage:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 13

    .line 46
    sget-object v12, Lcom/helpshift/conversation/activeconversation/message/MessageType;->USER_ATTACHMENT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const/4 v10, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide/from16 v3, p3

    move-object/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move/from16 v11, p10

    invoke-direct/range {v0 .. v12}, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLcom/helpshift/conversation/activeconversation/message/MessageType;)V

    const/4 v0, 0x0

    move-object v1, p0

    .line 39
    iput v0, v1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->progressPercentage:I

    return-void
.end method

.method private getProgressSize()Ljava/lang/String;
    .locals 5

    .line 239
    iget v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->progressPercentage:I

    if-lez v0, :cond_0

    .line 240
    iget v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->size:I

    iget v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->progressPercentage:I

    mul-int v0, v0, v1

    int-to-double v0, v0

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    div-double/2addr v0, v2

    .line 241
    iget v2, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->size:I

    int-to-double v2, v2

    cmpg-double v4, v0, v2

    if-gez v4, :cond_0

    .line 242
    invoke-virtual {p0, v0, v1}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getFormattedFileSize(D)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 255
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 36
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object v0

    return-object v0
.end method

.method public getFilePath()Ljava/lang/String;
    .locals 1

    .line 223
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->filePath:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/FileUtil;->doesFilePathExistAndCanRead(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 224
    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->filePath:Ljava/lang/String;

    .line 226
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->filePath:Ljava/lang/String;

    return-object v0
.end method

.method public getProgressAndFileSize()Ljava/lang/String;
    .locals 2

    .line 230
    invoke-direct {p0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getProgressSize()Ljava/lang/String;

    move-result-object v0

    .line 231
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 232
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getFormattedFileSize()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 234
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getFormattedFileSize()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public handleClick(Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;)V
    .locals 6

    .line 57
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    if-ne v0, v1, :cond_0

    if-eqz p1, :cond_0

    .line 58
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getFilePath()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->contentType:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;->launchAttachment(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 61
    :cond_0
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->DOWNLOAD_NOT_STARTED:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    if-ne p1, v0, :cond_1

    const/4 p1, 0x0

    .line 62
    iput p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->progressPercentage:I

    .line 63
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->DOWNLOADING:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    .line 64
    new-instance p1, Lcom/helpshift/downloader/AdminFileInfo;

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->attachmentUrl:Ljava/lang/String;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->fileName:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->contentType:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->isSecureAttachment:Z

    invoke-direct {p1, v0, v1, v2, v3}, Lcom/helpshift/downloader/AdminFileInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 66
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getDownloader()Lcom/helpshift/downloader/SupportDownloader;

    move-result-object v0

    sget-object v1, Lcom/helpshift/downloader/SupportDownloader$StorageDirType;->INTERNAL_ONLY:Lcom/helpshift/downloader/SupportDownloader$StorageDirType;

    new-instance v2, Lcom/helpshift/common/domain/network/AuthDataProvider;

    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v5, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->attachmentUrl:Ljava/lang/String;

    invoke-direct {v2, v3, v4, v5}, Lcom/helpshift/common/domain/network/AuthDataProvider;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;Ljava/lang/String;)V

    new-instance v3, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$1;

    invoke-direct {v3, p0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$1;-><init>(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V

    .line 67
    invoke-interface {v0, p1, v1, v2, v3}, Lcom/helpshift/downloader/SupportDownloader;->startDownload(Lcom/helpshift/downloader/AdminFileInfo;Lcom/helpshift/downloader/SupportDownloader$StorageDirType;Lcom/helpshift/common/domain/network/AuthDataProvider;Lcom/helpshift/downloader/SupportDownloadStateChangeListener;)V

    :cond_1
    return-void
.end method

.method public isUISupportedMessage()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V
    .locals 0

    .line 196
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    .line 197
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->notifyUpdated()V

    return-void
.end method

.method public updateState(Z)V
    .locals 2

    .line 201
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->serverId:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 202
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->SENDING:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 205
    iget-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->isRejected:Z

    if-nez p1, :cond_1

    .line 206
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->UNSENT_RETRYABLE:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    goto :goto_0

    .line 209
    :cond_1
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->UNSENT_NOT_RETRYABLE:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    goto :goto_0

    .line 213
    :cond_2
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getFilePath()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 214
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    goto :goto_0

    .line 217
    :cond_3
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->DOWNLOAD_NOT_STARTED:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    :goto_0
    return-void
.end method

.method public uploadAttachment(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;Lcom/helpshift/util/Callback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/account/domainmodel/UserDM;",
            "Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;",
            "Lcom/helpshift/util/Callback<",
            "Ljava/lang/Void;",
            "Lcom/helpshift/common/exception/RootAPIException;",
            ">;)V"
        }
    .end annotation

    .line 96
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getIssueId()Ljava/lang/String;

    move-result-object v0

    .line 97
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 101
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getFilePath()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 104
    :cond_0
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->SENDING:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    .line 106
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAttachmentUploadThreader()Lcom/helpshift/common/domain/Threader;

    move-result-object v0

    new-instance v1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$2;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$2;-><init>(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;Lcom/helpshift/util/Callback;)V

    invoke-interface {v0, v1}, Lcom/helpshift/common/domain/Threader;->thread(Lcom/helpshift/common/domain/F;)Lcom/helpshift/common/domain/F;

    move-result-object p1

    .line 111
    invoke-virtual {p1}, Lcom/helpshift/common/domain/F;->f()V

    return-void

    .line 98
    :cond_1
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "UserAttachmentMessageDM send called with conversation in pre issue mode."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method uploadAttachmentInternal(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;Lcom/helpshift/util/Callback;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/account/domainmodel/UserDM;",
            "Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;",
            "Lcom/helpshift/util/Callback<",
            "Ljava/lang/Void;",
            "Lcom/helpshift/common/exception/RootAPIException;",
            ">;)V"
        }
    .end annotation

    .line 120
    invoke-static {p1}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->getUserRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "body"

    const-string v2, "Attachment sent"

    .line 121
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "type"

    const-string v2, "at"

    .line 122
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getFilePath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "filePath"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->fileName:Ljava/lang/String;

    const-string v3, "originalFileName"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getIssueSendMessageRoute(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)Ljava/lang/String;

    move-result-object v8

    .line 128
    new-instance v5, Lcom/helpshift/common/domain/network/UploadNetwork;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v5, v8, v2, v3}, Lcom/helpshift/common/domain/network/UploadNetwork;-><init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 129
    new-instance v2, Lcom/helpshift/common/domain/network/IdempotentNetwork;

    iget-object v6, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getIdempotentPolicy()Lcom/helpshift/common/domain/idempotent/IdempotentPolicy;

    move-result-object v7

    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->localId:Ljava/lang/Long;

    .line 130
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    move-object v4, v2

    invoke-direct/range {v4 .. v9}, Lcom/helpshift/common/domain/network/IdempotentNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/idempotent/IdempotentPolicy;Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    new-instance v3, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;

    invoke-direct {v3, v2}, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 132
    new-instance v2, Lcom/helpshift/common/domain/network/GuardAgainstConversationReOpenExpiryNetwork;

    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v2, v3, v4}, Lcom/helpshift/common/domain/network/GuardAgainstConversationReOpenExpiryNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 133
    new-instance v3, Lcom/helpshift/common/domain/network/GuardAgainstConversationArchivalNetwork;

    invoke-direct {v3, v2}, Lcom/helpshift/common/domain/network/GuardAgainstConversationArchivalNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 134
    new-instance v2, Lcom/helpshift/common/platform/network/RequestData;

    invoke-direct {v2, v0}, Lcom/helpshift/common/platform/network/RequestData;-><init>(Ljava/util/Map;)V

    .line 135
    new-instance v0, Lcom/helpshift/common/domain/network/GuardOKNetwork;

    invoke-direct {v0, v3}, Lcom/helpshift/common/domain/network/GuardOKNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 136
    invoke-virtual {v0, v2}, Lcom/helpshift/common/domain/network/GuardOKNetwork;->makeRequest(Lcom/helpshift/common/platform/network/RequestData;)Lcom/helpshift/common/platform/network/Response;

    move-result-object v0

    .line 138
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 139
    invoke-interface {v2}, Lcom/helpshift/common/platform/Platform;->getResponseParser()Lcom/helpshift/common/platform/network/ResponseParser;

    move-result-object v2

    iget-object v0, v0, Lcom/helpshift/common/platform/network/Response;->responseString:Ljava/lang/String;

    invoke-interface {v2, v0}, Lcom/helpshift/common/platform/network/ResponseParser;->parseUserAttachmentMessageDM(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    move-result-object v0

    .line 140
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->serverId:Ljava/lang/String;

    iput-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->serverId:Ljava/lang/String;

    .line 141
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iput-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    .line 142
    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 143
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    .line 144
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 145
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->notifyUpdated()V

    .line 148
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v2, "id"

    .line 149
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getIssueId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getAnalyticConversationId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "acid"

    .line 152
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getAnalyticConversationId()Ljava/lang/String;

    move-result-object p2

    .line 151
    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-string p2, "url"

    .line 154
    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object p2

    sget-object v1, Lcom/helpshift/analytics/AnalyticsEventType;->MESSAGE_ADDED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {p2, v1, v0}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    .line 156
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object p2

    const-string v0, "User sent an attachment"

    invoke-virtual {p2, v0}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->userRepliedToConversation(Ljava/lang/String;)V

    if-eqz p3, :cond_1

    const/4 p2, 0x0

    .line 159
    invoke-interface {p3, p2}, Lcom/helpshift/util/Callback;->onSuccess(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 163
    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->UNHANDLED_STATUS_CODE:Lcom/helpshift/common/exception/NetworkException;

    if-ne v0, v1, :cond_2

    .line 164
    invoke-virtual {p2}, Lcom/helpshift/common/exception/RootAPIException;->getServerStatusCode()I

    move-result v0

    sget-object v1, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->UNSUPPORTED_MEDIA_TYPE:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_2

    const/4 p1, 0x1

    .line 165
    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->isRejected:Z

    .line 166
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->UNSENT_NOT_RETRYABLE:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    .line 167
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p1

    invoke-interface {p1, p0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 168
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->notifyUpdated()V

    :cond_1
    :goto_0
    return-void

    .line 171
    :cond_2
    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->INVALID_AUTH_TOKEN:Lcom/helpshift/common/exception/NetworkException;

    if-eq v0, v1, :cond_3

    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->AUTH_TOKEN_NOT_PROVIDED:Lcom/helpshift/common/exception/NetworkException;

    if-ne v0, v1, :cond_4

    .line 173
    :cond_3
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object v0

    iget-object v1, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    .line 174
    invoke-virtual {v0, p1, v1}, Lcom/helpshift/account/AuthenticationFailureDM;->notifyAuthenticationFailure(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/exception/ExceptionType;)V

    .line 177
    :cond_4
    iget-object p1, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v0, Lcom/helpshift/common/exception/NetworkException;->CONVERSATION_REOPEN_EXPIRED:Lcom/helpshift/common/exception/NetworkException;

    if-ne p1, v0, :cond_5

    .line 178
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->UNSENT_NOT_RETRYABLE:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    goto :goto_1

    .line 180
    :cond_5
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->serverId:Ljava/lang/String;

    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 184
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->UNSENT_RETRYABLE:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    :cond_6
    :goto_1
    if-eqz p3, :cond_7

    .line 188
    invoke-interface {p3, p2}, Lcom/helpshift/util/Callback;->onFailure(Ljava/lang/Object;)V

    .line 190
    :cond_7
    invoke-static {p2}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method
