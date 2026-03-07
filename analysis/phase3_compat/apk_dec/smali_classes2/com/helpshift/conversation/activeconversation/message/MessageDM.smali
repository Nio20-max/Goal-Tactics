.class public abstract Lcom/helpshift/conversation/activeconversation/message/MessageDM;
.super Ljava/util/Observable;
.source "MessageDM.java"

# interfaces
.implements Lcom/helpshift/util/HSCloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;
    }
.end annotation


# static fields
.field public static final DELIVERY_STATE_READ:I = 0x1

.field public static final DELIVERY_STATE_SENT:I = 0x2

.field public static final DELIVERY_STATE_UNREAD:I = 0x0

.field private static final TAG:Ljava/lang/String; = "Helpshift_MessageDM"


# instance fields
.field public author:Lcom/helpshift/conversation/activeconversation/message/Author;

.field private avatarImageState:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

.field public body:Ljava/lang/String;

.field public conversationLocalId:Ljava/lang/Long;

.field private createdAt:Ljava/lang/String;

.field public createdRequestId:Ljava/lang/String;

.field public deliveryState:I

.field protected domain:Lcom/helpshift/common/domain/Domain;

.field private epochCreatedAtTime:J

.field public final isAdminMessage:Z

.field public isFeedbackMessage:Z

.field public isMessageSeenSynced:Z

.field public isRedacted:Z

.field public localId:Ljava/lang/Long;

.field public final messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

.field protected platform:Lcom/helpshift/common/platform/Platform;

.field public readAt:Ljava/lang/String;

.field public seenAtMessageCursor:Ljava/lang/String;

.field public serverId:Ljava/lang/String;

.field private final uiViewState:Lcom/helpshift/conversation/activeconversation/message/UIViewState;


# direct methods
.method protected constructor <init>(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 2

    .line 77
    invoke-direct {p0}, Ljava/util/Observable;-><init>()V

    .line 78
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isAdminMessage:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isAdminMessage:Z

    .line 79
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    .line 80
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->uiViewState:Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/UIViewState;->deepClone()Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->uiViewState:Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    .line 81
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    .line 82
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->body:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->body:Ljava/lang/String;

    .line 83
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    .line 84
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 85
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    .line 86
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->readAt:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->readAt:Ljava/lang/String;

    .line 87
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->seenAtMessageCursor:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->seenAtMessageCursor:Ljava/lang/String;

    .line 88
    iget v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->deliveryState:I

    iput v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->deliveryState:I

    .line 89
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isMessageSeenSynced:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isMessageSeenSynced:Z

    .line 90
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->createdRequestId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->createdRequestId:Ljava/lang/String;

    .line 91
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isRedacted:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isRedacted:Z

    .line 92
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    .line 93
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 94
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->createdAt:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->createdAt:Ljava/lang/String;

    .line 95
    iget-wide v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->epochCreatedAtTime:J

    iput-wide v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->epochCreatedAtTime:J

    .line 96
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->avatarImageState:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->avatarImageState:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    .line 97
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/Author;->deepClone()Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    .line 98
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isFeedbackMessage:Z

    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isFeedbackMessage:Z

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ZLcom/helpshift/conversation/activeconversation/message/MessageType;)V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/util/Observable;-><init>()V

    .line 64
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->body:Ljava/lang/String;

    .line 65
    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->createdAt:Ljava/lang/String;

    .line 66
    iput-wide p3, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->epochCreatedAtTime:J

    .line 67
    iput-object p5, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    .line 68
    iput-boolean p6, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isAdminMessage:Z

    .line 69
    iput-object p7, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    .line 72
    new-instance p1, Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    invoke-direct {p1}, Lcom/helpshift/conversation/activeconversation/message/UIViewState;-><init>()V

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->uiViewState:Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    .line 74
    invoke-direct {p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->updateAvatarImageState()V

    return-void
.end method

.method private updateAvatarImageState()V
    .locals 1

    .line 269
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/Author;->localAvatarImagePath:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 270
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;->AVATAR_IMAGE_NOT_PRESENT:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->avatarImageState:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    goto :goto_0

    .line 272
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/Author;->localAvatarImagePath:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/FileUtil;->doesFilePathExistAndCanRead(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 273
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;->AVATAR_IMAGE_DOWNLOADED:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->avatarImageState:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    goto :goto_0

    .line 276
    :cond_1
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;->AVATAR_IMAGE_DOWNLOAD_FAILED:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->avatarImageState:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    :goto_0
    return-void
.end method


# virtual methods
.method public abstract deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 35
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object v0

    return-object v0
.end method

.method public getAccessbilityMessageTime()Ljava/lang/String;
    .locals 4

    .line 134
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getLocaleProviderDM()Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;->getCurrentLocale()Ljava/util/Locale;

    move-result-object v0

    .line 135
    new-instance v1, Ljava/util/Date;

    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 136
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 137
    invoke-interface {v2}, Lcom/helpshift/common/platform/Platform;->getDevice()Lcom/helpshift/common/platform/Device;

    move-result-object v2

    invoke-interface {v2}, Lcom/helpshift/common/platform/Device;->is24HourFormat()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "H:mm"

    goto :goto_0

    :cond_0
    const-string v2, "h:mm a"

    .line 138
    :goto_0
    invoke-static {v2, v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getDateFormatter(Ljava/lang/String;Ljava/util/Locale;)Lcom/helpshift/util/HSSimpleDateFormat;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/helpshift/util/HSSimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "EEEE, MMMM dd, yyyy"

    .line 139
    invoke-static {v3, v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getDateFormatter(Ljava/lang/String;Ljava/util/Locale;)Lcom/helpshift/util/HSSimpleDateFormat;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/helpshift/util/HSSimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 140
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAuthorAvatarFallbackImage()Ljava/lang/String;
    .locals 2

    .line 291
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM$1;->$SwitchMap$com$helpshift$conversation$activeconversation$message$Author$AuthorRole:[I

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/message/Author;->role:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 302
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getConversationHeaderImageLocalPath()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, ""

    return-object v0

    .line 297
    :cond_1
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getConversationHeaderImageLocalPath()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 295
    :cond_2
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBotFallbackImageLocalPath()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 293
    :cond_3
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getAgentFallbackImageLocalPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAvatarImageState()Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;
    .locals 1

    .line 286
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->avatarImageState:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    return-object v0
.end method

.method public getCreatedAt()Ljava/lang/String;
    .locals 1

    .line 231
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->createdAt:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayedAuthorName()Ljava/lang/String;
    .locals 3

    .line 150
    iget-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isAdminMessage:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->isPersonalisedConversationEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 153
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getSystemMessageNickname()Ljava/lang/String;

    move-result-object v0

    .line 154
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object v2, v2, Lcom/helpshift/conversation/activeconversation/message/Author;->authorName:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 155
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/Author;->authorName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :cond_1
    move-object v1, v0

    :cond_2
    :goto_0
    return-object v1
.end method

.method public getEpochCreatedAtTime()J
    .locals 2

    .line 241
    iget-wide v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->epochCreatedAtTime:J

    return-wide v0
.end method

.method protected getIdempotentPolicy()Lcom/helpshift/common/domain/idempotent/IdempotentPolicy;
    .locals 1

    .line 250
    new-instance v0, Lcom/helpshift/common/domain/idempotent/SuccessOrNonRetriableStatusCodeIdempotentPolicy;

    invoke-direct {v0}, Lcom/helpshift/common/domain/idempotent/SuccessOrNonRetriableStatusCodeIdempotentPolicy;-><init>()V

    return-object v0
.end method

.method getIssueSendMessageRoute(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)Ljava/lang/String;
    .locals 2

    .line 223
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/issues/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getIssueId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/messages/"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method getPreIssueSendMessageRoute(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)Ljava/lang/String;
    .locals 2

    .line 218
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/preissues/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getPreIssueId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/messages/"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method getSendMessageNetwork(Ljava/lang/String;)Lcom/helpshift/common/domain/network/Network;
    .locals 7

    .line 205
    new-instance v1, Lcom/helpshift/common/domain/network/POSTNetwork;

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v1, p1, v0, v2}, Lcom/helpshift/common/domain/network/POSTNetwork;-><init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 206
    new-instance v6, Lcom/helpshift/common/domain/network/IdempotentNetwork;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getIdempotentPolicy()Lcom/helpshift/common/domain/idempotent/IdempotentPolicy;

    move-result-object v3

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    .line 207
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move-object v0, v6

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/helpshift/common/domain/network/IdempotentNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/idempotent/IdempotentPolicy;Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    new-instance p1, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {p1, v6, v0}, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 209
    new-instance v0, Lcom/helpshift/common/domain/network/UserPreConditionsFailedNetwork;

    invoke-direct {v0, p1}, Lcom/helpshift/common/domain/network/UserPreConditionsFailedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 210
    new-instance p1, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;

    invoke-direct {p1, v0}, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 211
    new-instance v0, Lcom/helpshift/common/domain/network/GuardAgainstConversationReOpenExpiryNetwork;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v0, p1, v1}, Lcom/helpshift/common/domain/network/GuardAgainstConversationReOpenExpiryNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 213
    new-instance p1, Lcom/helpshift/common/domain/network/GuardAgainstConversationArchivalNetwork;

    invoke-direct {p1, v0}, Lcom/helpshift/common/domain/network/GuardAgainstConversationArchivalNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 214
    new-instance v0, Lcom/helpshift/common/domain/network/GuardOKNetwork;

    invoke-direct {v0, p1}, Lcom/helpshift/common/domain/network/GuardOKNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    return-object v0
.end method

.method public getSubText()Ljava/lang/String;
    .locals 5

    .line 107
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getLocaleProviderDM()Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;

    move-result-object v0

    .line 108
    invoke-virtual {v0}, Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;->getCurrentLocale()Ljava/util/Locale;

    move-result-object v0

    :try_start_0
    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

    const-string v2, "GMT"

    .line 111
    invoke-static {v1, v0, v2}, Lcom/helpshift/common/util/HSDateFormatSpec;->getDateFormatter(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;)Lcom/helpshift/util/HSSimpleDateFormat;

    move-result-object v1

    .line 112
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getCreatedAt()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/helpshift/util/HSSimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 115
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    const-string v3, "Helpshift_MessageDM"

    const-string v4, "getSubText : ParseException"

    .line 116
    invoke-static {v3, v4, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v1, v2

    .line 118
    :goto_0
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 119
    invoke-interface {v2}, Lcom/helpshift/common/platform/Platform;->getDevice()Lcom/helpshift/common/platform/Device;

    move-result-object v2

    invoke-interface {v2}, Lcom/helpshift/common/platform/Device;->is24HourFormat()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "H:mm"

    goto :goto_1

    :cond_0
    const-string v2, "h:mm a"

    .line 120
    :goto_1
    invoke-static {v2, v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getDateFormatter(Ljava/lang/String;Ljava/util/Locale;)Lcom/helpshift/util/HSSimpleDateFormat;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/helpshift/util/HSSimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 123
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getDisplayedAuthorName()Ljava/lang/String;

    move-result-object v1

    .line 124
    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 125
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method public getSystemMessageNickname()Ljava/lang/String;
    .locals 1

    .line 162
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getSystemMessageNickname()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUiViewState()Lcom/helpshift/conversation/activeconversation/message/UIViewState;
    .locals 1

    .line 227
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->uiViewState:Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    return-object v0
.end method

.method public abstract isUISupportedMessage()Z
.end method

.method public merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 2

    .line 177
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->body:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->body:Ljava/lang/String;

    .line 178
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getCreatedAt()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->createdAt:Ljava/lang/String;

    .line 179
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->epochCreatedAtTime:J

    .line 180
    iget-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isAdminMessage:Z

    if-eqz v0, :cond_0

    .line 185
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/Author;->localAvatarImagePath:Ljava/lang/String;

    .line 186
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iput-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    .line 187
    iput-object v0, v1, Lcom/helpshift/conversation/activeconversation/message/Author;->localAvatarImagePath:Ljava/lang/String;

    goto :goto_0

    .line 190
    :cond_0
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    .line 192
    :goto_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 193
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    .line 195
    :cond_1
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->createdRequestId:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 196
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->createdRequestId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->createdRequestId:Ljava/lang/String;

    .line 198
    :cond_2
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isRedacted:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isRedacted:Z

    .line 199
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isFeedbackMessage:Z

    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isFeedbackMessage:Z

    return-void
.end method

.method public mergeAndNotify(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 0

    .line 172
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 173
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->notifyUpdated()V

    return-void
.end method

.method public notifyUpdated()V
    .locals 0

    .line 167
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->setChanged()V

    .line 168
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->notifyObservers()V

    return-void
.end method

.method public setAvatarImageState(Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;)V
    .locals 0

    .line 281
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->avatarImageState:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    .line 282
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->notifyUpdated()V

    return-void
.end method

.method public setCreatedAt(Ljava/lang/String;)V
    .locals 1

    .line 235
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 236
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->createdAt:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V
    .locals 0

    .line 102
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    .line 103
    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    return-void
.end method

.method public setEpochCreatedAtTime(J)V
    .locals 0

    .line 245
    iput-wide p1, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->epochCreatedAtTime:J

    return-void
.end method

.method public shouldShowAvatar()Z
    .locals 1

    .line 257
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->isAvatarEnabledInChatFeed()Z

    move-result v0

    return v0
.end method

.method public shouldShowPersonalisedAgentAvatar()Z
    .locals 1

    .line 261
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->isPersonalisedAgentEnabled()Z

    move-result v0

    return v0
.end method

.method public shouldShowPersonalisedBotAvatar()Z
    .locals 1

    .line 265
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->isPersonalisedBotEnabled()Z

    move-result v0

    return v0
.end method
