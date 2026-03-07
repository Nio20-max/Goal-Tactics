.class public Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;
.super Ljava/lang/Object;
.source "DBPollerDataUpdater.java"

# interfaces
.implements Lcom/helpshift/conversation/pollersync/updater/PollerDataUpdater;


# static fields
.field private static final TAG:Ljava/lang/String; = "HS_DBPollerDataUpdater"


# instance fields
.field private conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

.field private conversationDataMerger:Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;

.field private messagesDataMerger:Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;

.field private platform:Lcom/helpshift/common/platform/Platform;

.field private syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

.field private userDM:Lcom/helpshift/account/domainmodel/UserDM;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->platform:Lcom/helpshift/common/platform/Platform;

    .line 53
    iput-object p3, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    .line 54
    new-instance p3, Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;

    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object p2

    invoke-direct {p3, p1, p2}, Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;)V

    iput-object p3, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->conversationDataMerger:Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;

    .line 55
    new-instance p2, Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;

    invoke-direct {p2, p4}, Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;-><init>(Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V

    iput-object p2, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->messagesDataMerger:Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;

    .line 56
    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    .line 57
    iput-object p4, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    return-void
.end method

.method private checkAndUpdateCSATStateToExpired(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 1

    .line 212
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0, p1}, Lcom/helpshift/conversation/ConversationUtil;->isCSATTimerExpired(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 213
    sget-object v0, Lcom/helpshift/conversation/states/ConversationCSATState;->EXPIRED:Lcom/helpshift/conversation/states/ConversationCSATState;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    :cond_0
    return-void
.end method

.method private checkAndUpdateLastUserActivityTime(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 178
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 181
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->lastUserActivityTime:J

    :cond_0
    return-void
.end method

.method private checkAndUpdateStartNewConversationClickedFlag(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V
    .locals 2

    .line 222
    sget-object v0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater$1;->$SwitchMap$com$helpshift$conversation$dto$IssueState:[I

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    invoke-virtual {v1}, Lcom/helpshift/conversation/dto/IssueState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    if-eqz p2, :cond_0

    .line 229
    iget-boolean p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    if-eqz p2, :cond_1

    :cond_0
    const/4 p2, 0x1

    const/4 v1, 0x1

    .line 231
    :cond_1
    :goto_0
    iput-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isStartNewConversationClicked:Z

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private checkAndUpdateStateToClosed(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 1

    .line 168
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldAllowNewConversationCreation:Z

    if-eqz v0, :cond_0

    .line 169
    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->CLOSED:Lcom/helpshift/conversation/dto/IssueState;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    :cond_0
    return-void
.end method

.method private checkAndUpdateStateToResolutionAccepted(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 188
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v1, :cond_1

    .line 189
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    if-eqz v0, :cond_1

    .line 190
    :cond_0
    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    :cond_1
    return-void
.end method

.method private checkAndUpdateStateToResolutionExpired(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 1

    .line 201
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0, p1}, Lcom/helpshift/conversation/ConversationUtil;->isResolutionQuestionExpired(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 202
    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_EXPIRED:Lcom/helpshift/conversation/dto/IssueState;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    :cond_0
    return-void
.end method

.method private deleteLocalMessagesForPreIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 3

    .line 122
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->deleteMessagesForConversation(J)Z

    return-void
.end method

.method private readConversationsWithoutMessagesFromDB()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;
        }
    .end annotation

    .line 140
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    .line 141
    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationsWithoutMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v0

    .line 142
    invoke-virtual {v0}, Lcom/helpshift/common/dao/DAOResult;->isSuccess()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 145
    invoke-virtual {v0}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0

    .line 143
    :cond_0
    new-instance v0, Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;

    const-string v1, "Exception occurred while reading conversations from DB"

    invoke-direct {v0, v1}, Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readMessagesFromDB(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;
        }
    .end annotation

    .line 149
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->readMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object p1

    .line 150
    invoke-virtual {p1}, Lcom/helpshift/common/dao/DAOResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 153
    invoke-virtual {p1}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    return-object p1

    .line 151
    :cond_0
    new-instance p1, Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;

    const-string v0, "Exception occurred while reading messages from DB"

    invoke-direct {p1, v0}, Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private setUserLocalId(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 174
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    return-void
.end method

.method private writeToDB(Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;
        }
    .end annotation

    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Writing data to DAO, updated conversations size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;->updatedConversations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HS_DBPollerDataUpdater"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v2, p1, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;->messagesDiffMap:Ljava/util/Map;

    iget-object v3, p1, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;->updatedConversations:Ljava/util/List;

    invoke-interface {v0, v2, v3}, Lcom/helpshift/conversation/dao/ConversationDAO;->updateConversations(Ljava/util/Map;Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Writing data to DAO, new conversations size: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p1, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;->newConversations:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    iget-object v0, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object p1, p1, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;->newConversations:Ljava/util/List;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertConversations(Ljava/util/List;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 135
    :cond_0
    new-instance p1, Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;

    const-string v0, "Exception occurred while inserting conversations in DB"

    invoke-direct {p1, v0}, Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 130
    :cond_1
    new-instance p1, Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;

    const-string v0, "Exception occurred while updating conversations in DB"

    invoke-direct {p1, v0}, Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method deriveConversationPropertiesForNewConversations(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V
    .locals 0

    .line 158
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->setUserLocalId(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 159
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->checkAndUpdateLastUserActivityTime(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 160
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->checkAndUpdateStateToClosed(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 161
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->checkAndUpdateStateToResolutionExpired(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 162
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->checkAndUpdateStateToResolutionAccepted(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 163
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->checkAndUpdateStartNewConversationClickedFlag(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    .line 164
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->checkAndUpdateCSATStateToExpired(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-void
.end method

.method removeConvertedPreIssueConversations(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 242
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    return-void

    .line 249
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 252
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v1

    :goto_0
    if-ltz v2, :cond_3

    .line 253
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 257
    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v3

    if-nez v3, :cond_2

    add-int/lit8 v3, v2, -0x1

    :goto_1
    if-ltz v3, :cond_2

    .line 259
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 260
    iget-object v5, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-static {v5}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    iget-object v5, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    iget-object v6, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    .line 262
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    iget-object v5, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    iget-object v6, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    .line 263
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 264
    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    iget-object v3, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v1, v3}, Lcom/helpshift/util/HSObservableList;->addAll(Ljava/util/Collection;)Z

    .line 266
    invoke-interface {p1, v4}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_1
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    :cond_2
    :goto_2
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method public updateData(Ljava/util/List;)Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;)",
            "Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/helpshift/conversation/pollersync/exception/PollerSyncException;
        }
    .end annotation

    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Starting with updating the fetched data in DB, conversations size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HS_DBPollerDataUpdater"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 64
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 65
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 68
    invoke-direct {p0}, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->readConversationsWithoutMessagesFromDB()Ljava/util/List;

    move-result-object v4

    .line 69
    invoke-static {v4}, Lcom/helpshift/util/CloneUtil;->deepClone(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v5

    .line 70
    new-instance v6, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;

    iget-object v7, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->syncDataProvider:Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;

    invoke-direct {v6, v4, v7}, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;-><init>(Ljava/util/List;Lcom/helpshift/common/domain/idempotent/PollerSyncDataProvider;)V

    const/4 v4, 0x0

    const/4 v7, 0x0

    .line 74
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v8

    if-ge v7, v8, :cond_4

    .line 75
    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 77
    invoke-virtual {v6, v8}, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;->find(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/util/ValuePair;

    move-result-object v9

    if-nez v9, :cond_1

    const-string v9, "Matching conversation not found from DB, processing as new conversation"

    .line 80
    invoke-static {v1, v9}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v9

    const/4 v10, 0x1

    sub-int/2addr v9, v10

    if-ne v7, v9, :cond_0

    goto :goto_1

    :cond_0
    const/4 v10, 0x0

    .line 82
    :goto_1
    invoke-virtual {p0, v8, v10}, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->deriveConversationPropertiesForNewConversations(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    .line 83
    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_1
    const-string v10, "Matching conversation found from DB, processing as updated conversation"

    .line 87
    invoke-static {v1, v10}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    iget-object v10, v9, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    check-cast v10, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    .line 89
    iget-object v9, v9, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v9, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 90
    sget-object v11, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;->PREISSUE_REQUEST_ID:Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    if-ne v10, v11, :cond_2

    .line 91
    invoke-direct {p0, v9}, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->deleteLocalMessagesForPreIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 93
    :cond_2
    iget-object v10, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->conversationDataMerger:Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;

    invoke-virtual {v10, v9, v8}, Lcom/helpshift/conversation/pollersync/merger/ConversationDataMerger;->mergeProperties(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 94
    iget-object v10, v8, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-static {v10}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 95
    invoke-direct {p0, v9}, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->readMessagesFromDB(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/util/List;

    move-result-object v10

    .line 96
    iget-object v11, p0, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->messagesDataMerger:Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;

    iget-object v8, v8, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    .line 97
    invoke-virtual {v11, v9, v10, v8}, Lcom/helpshift/conversation/pollersync/merger/MessagesDataMerger;->mergeMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;Ljava/util/List;)Lcom/helpshift/conversation/pollersync/model/MessagesDiff;

    move-result-object v8

    .line 99
    invoke-interface {v3, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    :cond_3
    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 105
    :cond_4
    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->removeConvertedPreIssueConversations(Ljava/util/List;)V

    .line 107
    new-instance p1, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;

    invoke-direct {p1, v5, v0, v2, v3}, Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/Map;)V

    .line 111
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/pollersync/updater/DBPollerDataUpdater;->writeToDB(Lcom/helpshift/conversation/pollersync/model/ConversationsDiff;)V

    return-object p1
.end method
