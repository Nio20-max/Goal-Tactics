.class public Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;
.super Ljava/lang/Object;
.source "AvatarImageDownloader.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/common/platform/Platform;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 20
    invoke-static {p0, p1, p2, p3}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->insertOrUpdateUrlMetadata(Lcom/helpshift/common/platform/Platform;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$100(Lcom/helpshift/common/platform/Platform;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 0

    .line 20
    invoke-static {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->updateMessageDm(Lcom/helpshift/common/platform/Platform;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void
.end method

.method static synthetic access$200(Lcom/helpshift/common/platform/Platform;Ljava/lang/String;)V
    .locals 0

    .line 20
    invoke-static {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->updateLastFetchTimestampAndStatus(Lcom/helpshift/common/platform/Platform;Ljava/lang/String;)V

    return-void
.end method

.method public static downloadAgentFallbackImage(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V
    .locals 3

    .line 146
    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    .line 147
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getAgentFallbackImageUrl()Ljava/lang/String;

    move-result-object v1

    const-string v2, "agentFallbackImageUrl"

    invoke-static {p0, p1, v0, v1, v2}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->downloadAndSaveFallbackImage(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static downloadAndSaveFallbackImage(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 202
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader$2;

    invoke-direct {v0, p2}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader$2;-><init>(Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;)V

    invoke-static {p0, p1, p3, p4, v0}, Lcom/helpshift/common/util/DownloadUtil;->downloadFile(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;)V

    return-void
.end method

.method public static downloadAvatarImage(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 8

    .line 31
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    .line 32
    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v1

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/Author;->authorId:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getAvatarImageUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 33
    invoke-static {v4}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 35
    invoke-static {p0, v4}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->getUrlMetadata(Lcom/helpshift/common/platform/Platform;Ljava/lang/String;)Lcom/helpshift/common/domain/network/HSUrlMetadata;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 39
    iget-wide v0, v5, Lcom/helpshift/common/domain/network/HSUrlMetadata;->lastFetchTimestamp:J

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    if-eqz v5, :cond_1

    .line 40
    iget-boolean v2, v5, Lcom/helpshift/common/domain/network/HSUrlMetadata;->isLastFetchSuccessful:Z

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    .line 41
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v0

    .line 43
    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getAvatarCacheExpiry()J

    move-result-wide v0

    cmp-long v3, v6, v0

    if-lez v3, :cond_2

    const/4 v6, 0x1

    move-object v2, p0

    move-object v3, p1

    move-object v7, p2

    .line 44
    invoke-static/range {v2 .. v7}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->downloadAvatarImageInternal(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Ljava/lang/String;Lcom/helpshift/common/domain/network/HSUrlMetadata;ZLcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    goto :goto_2

    :cond_2
    if-eqz v2, :cond_3

    const/4 v6, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v7, p2

    .line 50
    invoke-static/range {v2 .. v7}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->downloadAvatarImageInternal(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Ljava/lang/String;Lcom/helpshift/common/domain/network/HSUrlMetadata;ZLcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    goto :goto_2

    .line 54
    :cond_3
    sget-object p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;->AVATAR_IMAGE_DOWNLOAD_FAILED:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    invoke-virtual {p2, p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->setAvatarImageState(Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;)V

    goto :goto_2

    .line 60
    :cond_4
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getAuthorAvatarFallbackImage()Ljava/lang/String;

    move-result-object p1

    .line 61
    invoke-static {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->updateMessageDm(Lcom/helpshift/common/platform/Platform;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 62
    sget-object p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;->AVATAR_IMAGE_DOWNLOADED:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    invoke-virtual {p2, p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->setAvatarImageState(Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;)V

    :goto_2
    return-void
.end method

.method private static downloadAvatarImageInternal(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Ljava/lang/String;Lcom/helpshift/common/domain/network/HSUrlMetadata;ZLcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 7

    .line 71
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;->AVATAR_IMAGE_DOWNLOADING:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    invoke-virtual {p5, v0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->setAvatarImageState(Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;)V

    if-eqz p3, :cond_0

    .line 72
    iget-object p3, p3, Lcom/helpshift/common/domain/network/HSUrlMetadata;->etag:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string p3, ""

    :goto_0
    move-object v5, p3

    .line 73
    new-instance v6, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader$1;

    invoke-direct {v6, p4, p0, p2, p5}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader$1;-><init>(ZLcom/helpshift/common/platform/Platform;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    move-object v0, p0

    move-object v1, p1

    move v2, p4

    move-object v3, p2

    move-object v4, p2

    .line 74
    invoke-static/range {v0 .. v6}, Lcom/helpshift/common/util/DownloadUtil;->downloadFile(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;)V

    return-void
.end method

.method public static downloadBotFallbackImage(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V
    .locals 3

    .line 158
    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    .line 159
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBotFallbackImageUrl()Ljava/lang/String;

    move-result-object v1

    const-string v2, "botFallbackImageUrl"

    invoke-static {p0, p1, v0, v1, v2}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->downloadAndSaveFallbackImage(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static downloadConversationHeaderImage(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V
    .locals 3

    .line 170
    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    .line 171
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getConversationHeaderImageUrl()Ljava/lang/String;

    move-result-object v1

    const-string v2, "headerImageUrl"

    invoke-static {p0, p1, v0, v1, v2}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->downloadAndSaveFallbackImage(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static getUrlMetadata(Lcom/helpshift/common/platform/Platform;Ljava/lang/String;)Lcom/helpshift/common/domain/network/HSUrlMetadata;
    .locals 0

    .line 124
    invoke-interface {p0}, Lcom/helpshift/common/platform/Platform;->getHSNetworkMetadataDAO()Lcom/helpshift/common/domain/network/dao/HSNetworkMetadataDAO;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/helpshift/common/domain/network/dao/HSNetworkMetadataDAO;->getMetadataOfUrl(Ljava/lang/String;)Lcom/helpshift/common/domain/network/HSUrlMetadata;

    move-result-object p0

    return-object p0
.end method

.method private static insertOrUpdateUrlMetadata(Lcom/helpshift/common/platform/Platform;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 7

    .line 129
    new-instance v6, Lcom/helpshift/common/domain/network/HSUrlMetadata;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    move-object v0, v6

    move-object v1, p1

    move-object v2, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/domain/network/HSUrlMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;JZ)V

    .line 130
    invoke-interface {p0}, Lcom/helpshift/common/platform/Platform;->getHSNetworkMetadataDAO()Lcom/helpshift/common/domain/network/dao/HSNetworkMetadataDAO;

    move-result-object p0

    invoke-interface {p0, p1, v6}, Lcom/helpshift/common/domain/network/dao/HSNetworkMetadataDAO;->insertOrUpdateMetadataForUrl(Ljava/lang/String;Lcom/helpshift/common/domain/network/HSUrlMetadata;)Z

    return-void
.end method

.method public static retryFallbackImagesDownload(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V
    .locals 2

    .line 184
    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    .line 185
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->isAvatarEnabledInChatFeed()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 186
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getAgentFallbackImageLocalPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 187
    invoke-static {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->downloadAgentFallbackImage(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V

    .line 189
    :cond_0
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBotFallbackImageLocalPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 190
    invoke-static {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->downloadBotFallbackImage(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V

    .line 192
    :cond_1
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getConversationHeaderImageLocalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 193
    invoke-static {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->downloadConversationHeaderImage(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V

    :cond_2
    return-void
.end method

.method private static updateLastFetchTimestampAndStatus(Lcom/helpshift/common/platform/Platform;Ljava/lang/String;)V
    .locals 3

    .line 134
    invoke-interface {p0}, Lcom/helpshift/common/platform/Platform;->getHSNetworkMetadataDAO()Lcom/helpshift/common/domain/network/dao/HSNetworkMetadataDAO;

    move-result-object p0

    .line 135
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-interface {p0, p1, v0, v1, v2}, Lcom/helpshift/common/domain/network/dao/HSNetworkMetadataDAO;->updateLastFetchTimestampAndFetchStateOfUrl(Ljava/lang/String;JZ)Z

    return-void
.end method

.method private static updateMessageDm(Lcom/helpshift/common/platform/Platform;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 1

    .line 118
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    .line 119
    iput-object p1, v0, Lcom/helpshift/conversation/activeconversation/message/Author;->localAvatarImagePath:Ljava/lang/String;

    .line 120
    invoke-interface {p0}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p0

    invoke-interface {p0, p2}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void
.end method
