.class public Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/ImageAttachmentMessageDM;
.source "ScreenshotMessageDM.java"


# instance fields
.field public refersMessageId:Ljava/lang/String;

.field public state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;)V
    .locals 1

    .line 52
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/ImageAttachmentMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/ImageAttachmentMessageDM;)V

    .line 53
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->refersMessageId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->refersMessageId:Ljava/lang/String;

    .line 54
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V
    .locals 14

    .line 47
    sget-object v13, Lcom/helpshift/conversation/activeconversation/message/MessageType;->SCREENSHOT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const/4 v11, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p2

    move-wide/from16 v3, p3

    move-object/from16 v5, p5

    move-object/from16 v6, p9

    move-object/from16 v7, p8

    move-object/from16 v8, p7

    move-object/from16 v9, p6

    move/from16 v10, p10

    move/from16 v12, p11

    invoke-direct/range {v0 .. v13}, Lcom/helpshift/conversation/activeconversation/message/ImageAttachmentMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZZLcom/helpshift/conversation/activeconversation/message/MessageType;)V

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;Lcom/helpshift/util/Callback;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1, p2, p3}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->uploadImageInternal(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;Lcom/helpshift/util/Callback;)V

    return-void
.end method

.method static synthetic access$103(Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 39
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/ImageAttachmentMessageDM;->filePath:Ljava/lang/String;

    return-object p1
.end method

.method private uploadImageInternal(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;Lcom/helpshift/util/Callback;)V
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

    .line 99
    invoke-static {p1}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->getUserRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "body"

    const-string v2, "Screenshot sent"

    .line 100
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "type"

    const-string v2, "sc"

    .line 101
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->getFilePath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "filePath"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->fileName:Ljava/lang/String;

    const-string v3, "originalFileName"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->refersMessageId:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 106
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->refersMessageId:Ljava/lang/String;

    const-string v3, "refers"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    :cond_0
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->getIssueSendMessageRoute(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)Ljava/lang/String;

    move-result-object v8

    .line 111
    new-instance v5, Lcom/helpshift/common/domain/network/UploadNetwork;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v5, v8, v2, v3}, Lcom/helpshift/common/domain/network/UploadNetwork;-><init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 112
    new-instance v2, Lcom/helpshift/common/domain/network/IdempotentNetwork;

    iget-object v6, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->getIdempotentPolicy()Lcom/helpshift/common/domain/idempotent/IdempotentPolicy;

    move-result-object v7

    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->localId:Ljava/lang/Long;

    .line 113
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    move-object v4, v2

    invoke-direct/range {v4 .. v9}, Lcom/helpshift/common/domain/network/IdempotentNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/idempotent/IdempotentPolicy;Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    new-instance v3, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;

    invoke-direct {v3, v2}, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 115
    new-instance v2, Lcom/helpshift/common/domain/network/GuardAgainstConversationReOpenExpiryNetwork;

    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v2, v3, v4}, Lcom/helpshift/common/domain/network/GuardAgainstConversationReOpenExpiryNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 116
    new-instance v3, Lcom/helpshift/common/domain/network/GuardAgainstConversationArchivalNetwork;

    invoke-direct {v3, v2}, Lcom/helpshift/common/domain/network/GuardAgainstConversationArchivalNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 117
    new-instance v2, Lcom/helpshift/common/platform/network/RequestData;

    invoke-direct {v2, v0}, Lcom/helpshift/common/platform/network/RequestData;-><init>(Ljava/util/Map;)V

    .line 118
    new-instance v0, Lcom/helpshift/common/domain/network/GuardOKNetwork;

    invoke-direct {v0, v3}, Lcom/helpshift/common/domain/network/GuardOKNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 119
    invoke-virtual {v0, v2}, Lcom/helpshift/common/domain/network/GuardOKNetwork;->makeRequest(Lcom/helpshift/common/platform/network/RequestData;)Lcom/helpshift/common/platform/network/Response;

    move-result-object v0

    .line 121
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 122
    invoke-interface {v2}, Lcom/helpshift/common/platform/Platform;->getResponseParser()Lcom/helpshift/common/platform/network/ResponseParser;

    move-result-object v2

    iget-object v0, v0, Lcom/helpshift/common/platform/network/Response;->responseString:Ljava/lang/String;

    invoke-interface {v2, v0}, Lcom/helpshift/common/platform/network/ResponseParser;->parseScreenshotMessageDM(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    move-result-object v0

    .line 123
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->serverId:Ljava/lang/String;

    iput-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->serverId:Ljava/lang/String;

    .line 124
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iput-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    .line 125
    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 126
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    .line 127
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 128
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->notifyUpdated()V

    .line 131
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v2, "id"

    .line 132
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getIssueId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getAnalyticConversationId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "acid"

    .line 135
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getAnalyticConversationId()Ljava/lang/String;

    move-result-object p2

    .line 134
    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    const-string p2, "url"

    .line 137
    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object p2

    sget-object v1, Lcom/helpshift/analytics/AnalyticsEventType;->MESSAGE_ADDED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {p2, v1, v0}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    .line 139
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object p2

    const-string v0, "User sent a screenshot"

    invoke-virtual {p2, v0}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->userRepliedToConversation(Ljava/lang/String;)V

    if-eqz p3, :cond_2

    const/4 p2, 0x0

    .line 142
    invoke-interface {p3, p2}, Lcom/helpshift/util/Callback;->onSuccess(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 146
    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->UNHANDLED_STATUS_CODE:Lcom/helpshift/common/exception/NetworkException;

    if-ne v0, v1, :cond_3

    .line 147
    invoke-virtual {p2}, Lcom/helpshift/common/exception/RootAPIException;->getServerStatusCode()I

    move-result v0

    sget-object v1, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->UNSUPPORTED_MEDIA_TYPE:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_3

    const/4 p1, 0x1

    .line 148
    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->isRejected:Z

    .line 149
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->UNSENT_NOT_RETRYABLE:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    .line 150
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p1

    invoke-interface {p1, p0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 151
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->notifyUpdated()V

    :cond_2
    :goto_0
    return-void

    .line 154
    :cond_3
    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->INVALID_AUTH_TOKEN:Lcom/helpshift/common/exception/NetworkException;

    if-eq v0, v1, :cond_4

    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->AUTH_TOKEN_NOT_PROVIDED:Lcom/helpshift/common/exception/NetworkException;

    if-ne v0, v1, :cond_5

    .line 156
    :cond_4
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object v0

    iget-object v1, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    .line 157
    invoke-virtual {v0, p1, v1}, Lcom/helpshift/account/AuthenticationFailureDM;->notifyAuthenticationFailure(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/exception/ExceptionType;)V

    .line 160
    :cond_5
    iget-object p1, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v0, Lcom/helpshift/common/exception/NetworkException;->CONVERSATION_REOPEN_EXPIRED:Lcom/helpshift/common/exception/NetworkException;

    if-ne p1, v0, :cond_6

    .line 161
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->UNSENT_NOT_RETRYABLE:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    goto :goto_1

    .line 163
    :cond_6
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->serverId:Ljava/lang/String;

    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_7

    .line 167
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->UNSENT_RETRYABLE:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    :cond_7
    :goto_1
    if-eqz p3, :cond_8

    .line 171
    invoke-interface {p3, p2}, Lcom/helpshift/util/Callback;->onFailure(Ljava/lang/Object;)V

    .line 173
    :cond_8
    invoke-static {p2}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method


# virtual methods
.method public checkAndReDownloadImageIfNotExist(Lcom/helpshift/common/platform/Platform;)V
    .locals 6

    .line 209
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->getFilePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/util/FileUtil;->doesFilePathExistAndCanRead(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 210
    new-instance v0, Lcom/helpshift/downloader/AdminFileInfo;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->attachmentUrl:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->fileName:Ljava/lang/String;

    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->contentType:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->isSecureAttachment:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/helpshift/downloader/AdminFileInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 211
    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getDownloader()Lcom/helpshift/downloader/SupportDownloader;

    move-result-object v1

    sget-object v2, Lcom/helpshift/downloader/SupportDownloader$StorageDirType;->INTERNAL_ONLY:Lcom/helpshift/downloader/SupportDownloader$StorageDirType;

    new-instance v3, Lcom/helpshift/common/domain/network/AuthDataProvider;

    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v5, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->attachmentUrl:Ljava/lang/String;

    invoke-direct {v3, v4, p1, v5}, Lcom/helpshift/common/domain/network/AuthDataProvider;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;Ljava/lang/String;)V

    new-instance v4, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM$2;

    invoke-direct {v4, p0, p1}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM$2;-><init>(Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;Lcom/helpshift/common/platform/Platform;)V

    .line 212
    invoke-interface {v1, v0, v2, v3, v4}, Lcom/helpshift/downloader/SupportDownloader;->startDownload(Lcom/helpshift/downloader/AdminFileInfo;Lcom/helpshift/downloader/SupportDownloader$StorageDirType;Lcom/helpshift/common/domain/network/AuthDataProvider;Lcom/helpshift/downloader/SupportDownloadStateChangeListener;)V

    :cond_0
    return-void
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 39
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;
    .locals 1

    .line 241
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 39
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public getFilePath()Ljava/lang/String;
    .locals 1

    .line 202
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->filePath:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/FileUtil;->doesFilePathExistAndCanRead(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 203
    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->filePath:Ljava/lang/String;

    .line 205
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->filePath:Ljava/lang/String;

    return-object v0
.end method

.method public handleClick(Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;)V
    .locals 2

    .line 62
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    if-ne v0, v1, :cond_0

    if-eqz p1, :cond_0

    .line 63
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->getFilePath()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->contentType:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;->launchScreenshotAttachment(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public isUISupportedMessage()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public setRefersMessageId(Ljava/lang/String;)V
    .locals 0

    .line 58
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->refersMessageId:Ljava/lang/String;

    return-void
.end method

.method public setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V
    .locals 0

    .line 180
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    .line 181
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->notifyUpdated()V

    return-void
.end method

.method public updateState(Z)V
    .locals 2

    .line 185
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->serverId:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 186
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENDING:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 189
    iget-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->isRejected:Z

    if-nez p1, :cond_1

    .line 190
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->UNSENT_RETRYABLE:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    goto :goto_0

    .line 193
    :cond_1
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->UNSENT_NOT_RETRYABLE:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    goto :goto_0

    .line 197
    :cond_2
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    :goto_0
    return-void
.end method

.method public uploadImage(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;ZLcom/helpshift/util/Callback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/account/domainmodel/UserDM;",
            "Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;",
            "Z",
            "Lcom/helpshift/util/Callback<",
            "Ljava/lang/Void;",
            "Lcom/helpshift/common/exception/RootAPIException;",
            ">;)V"
        }
    .end annotation

    .line 71
    invoke-interface {p2}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getIssueId()Ljava/lang/String;

    move-result-object v0

    .line 72
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 76
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->getFilePath()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-eqz p3, :cond_1

    .line 81
    iget-object p3, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->getFilePath()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p3, v0}, Lcom/helpshift/common/platform/Platform;->compressAndStoreScreenshot(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->filePath:Ljava/lang/String;

    .line 82
    iget-object p3, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p3}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p3

    invoke-interface {p3, p0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 84
    :cond_1
    sget-object p3, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENDING:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {p0, p3}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    .line 86
    iget-object p3, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p3}, Lcom/helpshift/common/domain/Domain;->getAttachmentUploadThreader()Lcom/helpshift/common/domain/Threader;

    move-result-object p3

    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM$1;

    invoke-direct {v0, p0, p1, p2, p4}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM$1;-><init>(Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;Lcom/helpshift/util/Callback;)V

    invoke-interface {p3, v0}, Lcom/helpshift/common/domain/Threader;->thread(Lcom/helpshift/common/domain/F;)Lcom/helpshift/common/domain/F;

    move-result-object p1

    .line 91
    invoke-virtual {p1}, Lcom/helpshift/common/domain/F;->f()V

    return-void

    .line 73
    :cond_2
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "ScreenshotMessageDM send called with conversation in pre issue mode."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
