.class public Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;
.super Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;
.source "AdminActionCardMessageDM.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;
    }
.end annotation


# static fields
.field private static final MAX_RETRY_ATTEMPT:I = 0x3


# instance fields
.field public actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

.field public final originalMessageServerId:Ljava/lang/String;

.field private retryAttempts:I

.field public state:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;


# direct methods
.method public constructor <init>(Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V
    .locals 1

    .line 39
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;)V

    .line 40
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->deepClone()Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    .line 41
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;

    .line 42
    iget v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->retryAttempts:I

    iput v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->retryAttempts:I

    .line 43
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->originalMessageServerId:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->originalMessageServerId:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/model/ActionCard;)V
    .locals 9

    move-object v8, p0

    .line 31
    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_ACTION_CARD:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V

    move-object/from16 v0, p8

    .line 32
    iput-object v0, v8, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    move-object/from16 v0, p7

    .line 33
    iput-object v0, v8, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->originalMessageServerId:Ljava/lang/String;

    const/4 v0, 0x0

    .line 34
    iput v0, v8, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->retryAttempts:I

    .line 35
    invoke-direct {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->updateState()V

    return-void
.end method

.method private downloadImageInternal(Lcom/helpshift/common/platform/Platform;)V
    .locals 6

    .line 78
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;->IMAGE_DOWNLOADING:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;

    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;)V

    .line 79
    new-instance v0, Lcom/helpshift/downloader/AdminFileInfo;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->imageUrl:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-boolean v2, v2, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->isSecure:Z

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v3, v2}, Lcom/helpshift/downloader/AdminFileInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 80
    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getDownloader()Lcom/helpshift/downloader/SupportDownloader;

    move-result-object v1

    sget-object v2, Lcom/helpshift/downloader/SupportDownloader$StorageDirType;->INTERNAL_ONLY:Lcom/helpshift/downloader/SupportDownloader$StorageDirType;

    new-instance v3, Lcom/helpshift/common/domain/network/AuthDataProvider;

    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v5, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v5, v5, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->imageUrl:Ljava/lang/String;

    invoke-direct {v3, v4, p1, v5}, Lcom/helpshift/common/domain/network/AuthDataProvider;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;Ljava/lang/String;)V

    new-instance v4, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$1;

    invoke-direct {v4, p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$1;-><init>(Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;Lcom/helpshift/common/platform/Platform;)V

    .line 81
    invoke-interface {v1, v0, v2, v3, v4}, Lcom/helpshift/downloader/SupportDownloader;->startDownload(Lcom/helpshift/downloader/AdminFileInfo;Lcom/helpshift/downloader/SupportDownloader$StorageDirType;Lcom/helpshift/common/domain/network/AuthDataProvider;Lcom/helpshift/downloader/SupportDownloadStateChangeListener;)V

    return-void
.end method

.method private updateState()V
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->imageUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 57
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;->IMAGE_NOT_PRESENT:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;

    goto :goto_0

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->filePath:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/FileUtil;->doesFilePathExistAndCanRead(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 60
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;->IMAGE_DOWNLOADED:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;

    goto :goto_0

    .line 63
    :cond_1
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;->DOWNLOAD_NOT_STARTED:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;

    :goto_0
    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;
    .locals 1

    .line 154
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;
    .locals 1

    .line 22
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 22
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 22
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    move-result-object v0

    return-object v0
.end method

.method public downloadImage(Lcom/helpshift/common/platform/Platform;)V
    .locals 2

    .line 68
    iget v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->retryAttempts:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    return-void

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;->DOWNLOAD_NOT_STARTED:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;

    if-ne v0, v1, :cond_1

    .line 72
    iget v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->retryAttempts:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->retryAttempts:I

    .line 73
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->downloadImageInternal(Lcom/helpshift/common/platform/Platform;)V

    :cond_1
    return-void
.end method

.method public getUriAsStringForAction()Ljava/lang/String;
    .locals 3

    .line 133
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->action:Lcom/helpshift/conversation/activeconversation/model/Action;

    .line 134
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionType:Lcom/helpshift/conversation/activeconversation/model/ActionType;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/model/ActionType;->CALL:Lcom/helpshift/conversation/activeconversation/model/ActionType;

    if-ne v1, v2, :cond_0

    .line 135
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "tel:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionData:Ljava/util/Map;

    const-string v2, "phone_number"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 137
    :cond_0
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionType:Lcom/helpshift/conversation/activeconversation/model/ActionType;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/model/ActionType;->LINK:Lcom/helpshift/conversation/activeconversation/model/ActionType;

    if-ne v1, v2, :cond_1

    .line 138
    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionData:Ljava/util/Map;

    const-string v1, "url"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public handleClick(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)V
    .locals 4

    .line 110
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->action:Lcom/helpshift/conversation/activeconversation/model/Action;

    .line 111
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionType:Lcom/helpshift/conversation/activeconversation/model/ActionType;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/model/ActionType;->CALL:Lcom/helpshift/conversation/activeconversation/model/ActionType;

    if-ne v1, v2, :cond_0

    .line 112
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionData:Ljava/util/Map;

    const-string v2, "phone_number"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_0

    .line 114
    :cond_0
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionType:Lcom/helpshift/conversation/activeconversation/model/ActionType;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/model/ActionType;->LINK:Lcom/helpshift/conversation/activeconversation/model/ActionType;

    if-ne v1, v2, :cond_1

    .line 115
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionData:Ljava/util/Map;

    const-string v2, "url"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string v1, ""

    .line 117
    :goto_0
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v2}, Lcom/helpshift/common/domain/Domain;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object v2

    iget-object v3, v0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionType:Lcom/helpshift/conversation/activeconversation/model/ActionType;

    invoke-virtual {v2, v3, v1}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->userClickOnAction(Lcom/helpshift/conversation/activeconversation/model/ActionType;Ljava/lang/String;)V

    .line 121
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 122
    invoke-interface {p1}, Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;->getIssueId()Ljava/lang/String;

    move-result-object p1

    const-string v2, "issue_id"

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->originalMessageServerId:Ljava/lang/String;

    const-string v2, "mid"

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    iget-object p1, v0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionSHA:Ljava/lang/String;

    const-string v2, "a"

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    iget-object p1, v0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionType:Lcom/helpshift/conversation/activeconversation/model/ActionType;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/ActionType;->getValue()Ljava/lang/String;

    move-result-object p1

    const-string v0, "type"

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object p1

    sget-object v0, Lcom/helpshift/analytics/AnalyticsEventType;->ACTION_CARD_CLICKED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {p1, v0, v1}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    return-void
.end method

.method public isActionCardTitleVisible()Z
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->title:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 1

    .line 145
    invoke-super {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 146
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    if-eqz v0, :cond_0

    .line 147
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    .line 148
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    :cond_0
    return-void
.end method

.method public setState(Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;)V
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;

    .line 48
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->notifyUpdated()V

    return-void
.end method
