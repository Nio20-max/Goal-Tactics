.class public Lcom/helpshift/conversation/activeconversation/ConversationManager;
.super Ljava/lang/Object;
.source "ConversationManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_ConvManager"


# instance fields
.field private conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

.field domain:Lcom/helpshift/common/domain/Domain;

.field platform:Lcom/helpshift/common/platform/Platform;

.field private sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

.field userDM:Lcom/helpshift/account/domainmodel/UserDM;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 0

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    .line 135
    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    .line 136
    iput-object p3, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    .line 137
    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    .line 138
    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 0

    .line 123
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->deleteOptionsForAdminMessageWithOptionsInput(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-void
.end method

.method private addMessageToDBAndGlobalList(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 2

    .line 251
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {v0, p2}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 252
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {p2, v0, v1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 253
    invoke-virtual {p2, p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->addObserver(Ljava/util/Observer;)V

    .line 254
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {p1, p2}, Lcom/helpshift/util/HSObservableList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addMessageToDbAndUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 1

    .line 617
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {v0, p2}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 618
    invoke-virtual {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addMessageToUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void
.end method

.method private canAutoRetryMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;)Z
    .locals 2

    .line 1331
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->canAutoRetryMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 1335
    :cond_0
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;->isRetriable()Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    .line 1343
    :cond_1
    instance-of v0, p2, Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;

    if-nez v0, :cond_2

    instance-of p2, p2, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;

    if-eqz p2, :cond_3

    :cond_2
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    .line 1345
    invoke-static {p2, p1}, Lcom/helpshift/conversation/ConversationUtil;->isResolutionQuestionExpired(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result p1

    if-eqz p1, :cond_3

    return v1

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method private deleteOptionsForAdminMessageWithOptionsInput(Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;)V
    .locals 2

    .line 237
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->referredMessageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_TEXT_WITH_OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v0, v1, :cond_0

    .line 238
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->serverId:Ljava/lang/String;

    .line 240
    invoke-interface {v0, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->readMessage(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;

    .line 241
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->options:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 242
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    :cond_0
    return-void
.end method

.method private deleteOptionsForAdminMessageWithOptionsInput(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 3

    .line 1095
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    .line 1097
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_TEXT_WITH_OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    invoke-interface {v0, v1, v2, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->readMessages(JLcom/helpshift/conversation/activeconversation/message/MessageType;)Ljava/util/List;

    move-result-object p1

    .line 1098
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1099
    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->options:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    goto :goto_0

    .line 1101
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessages(Ljava/util/List;)Z

    return-void
.end method

.method private getMessageDMForUpdate(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Ljava/util/Map;Ljava/util/Map;Lcom/helpshift/conversation/activeconversation/ConversationUpdate;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;",
            "Lcom/helpshift/conversation/activeconversation/ConversationUpdate;",
            ")",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;"
        }
    .end annotation

    .line 973
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 974
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    goto :goto_0

    .line 976
    :cond_0
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->createdRequestId:Ljava/lang/String;

    invoke-interface {p3, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 977
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->createdRequestId:Ljava/lang/String;

    invoke-interface {p3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 978
    iget-object p2, p4, Lcom/helpshift/conversation/activeconversation/ConversationUpdate;->localIdsForResolvedRequestIds:Ljava/util/List;

    iget-object p3, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    .line 979
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method private getRouteForSendingMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/lang/String;
    .locals 3

    .line 947
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    const-string v1, "/messages/"

    if-eqz v0, :cond_0

    .line 948
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/preissues/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getPreIssueId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 951
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/issues/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getIssueId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method private handleConversationErrorUpdate(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/common/exception/RootAPIException;)Z
    .locals 2

    .line 1491
    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->CONVERSATION_ARCHIVED:Lcom/helpshift/common/exception/NetworkException;

    if-ne v0, v1, :cond_0

    .line 1492
    sget-object p2, Lcom/helpshift/conversation/dto/IssueState;->ARCHIVED:Lcom/helpshift/conversation/dto/IssueState;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateIssueStatus(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/IssueState;)V

    goto :goto_0

    .line 1494
    :cond_0
    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->USER_PRE_CONDITION_FAILED:Lcom/helpshift/common/exception/NetworkException;

    if-ne v0, v1, :cond_1

    .line 1495
    sget-object p2, Lcom/helpshift/conversation/dto/IssueState;->AUTHOR_MISMATCH:Lcom/helpshift/conversation/dto/IssueState;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateIssueStatus(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/IssueState;)V

    goto :goto_0

    .line 1497
    :cond_1
    iget-object p2, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v0, Lcom/helpshift/common/exception/NetworkException;->CONVERSATION_REOPEN_EXPIRED:Lcom/helpshift/common/exception/NetworkException;

    if-ne p2, v0, :cond_2

    .line 1498
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->markConversationStateToResolutionExpired(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    :goto_0
    const/4 p1, 0x1

    goto :goto_1

    :cond_2
    const/4 p1, 0x0

    :goto_1
    return p1
.end method

.method private markMessagesAsSeen(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 1572
    invoke-static {p2}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 1576
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->readAt:Ljava/lang/String;

    .line 1577
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->seenAtMessageCursor:Ljava/lang/String;

    .line 1580
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {v2}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->getUserRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Ljava/util/HashMap;

    move-result-object v2

    const-string v3, "read_at"

    .line 1581
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "mc"

    .line 1582
    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "md_state"

    const-string v1, "read"

    .line 1583
    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1585
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->getRouteForSendingMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/lang/String;

    move-result-object p1

    .line 1587
    :try_start_0
    new-instance v0, Lcom/helpshift/common/domain/network/PUTNetwork;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v0, p1, v1, v3}, Lcom/helpshift/common/domain/network/PUTNetwork;-><init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 1588
    new-instance p1, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;

    invoke-direct {p1, v0}, Lcom/helpshift/common/domain/network/AuthenticationFailureNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 1589
    new-instance v0, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v0, p1, v1}, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 1590
    new-instance p1, Lcom/helpshift/common/domain/network/FailedAPICallNetworkDecorator;

    invoke-direct {p1, v0}, Lcom/helpshift/common/domain/network/FailedAPICallNetworkDecorator;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 1591
    new-instance v0, Lcom/helpshift/common/domain/network/GuardOKNetwork;

    invoke-direct {v0, p1}, Lcom/helpshift/common/domain/network/GuardOKNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 1592
    new-instance p1, Lcom/helpshift/common/platform/network/RequestData;

    invoke-direct {p1, v2}, Lcom/helpshift/common/platform/network/RequestData;-><init>(Ljava/util/Map;)V

    invoke-interface {v0, p1}, Lcom/helpshift/common/domain/network/Network;->makeRequest(Lcom/helpshift/common/platform/network/RequestData;)Lcom/helpshift/common/platform/network/Response;
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 1595
    iget-object v0, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->INVALID_AUTH_TOKEN:Lcom/helpshift/common/exception/NetworkException;

    if-eq v0, v1, :cond_3

    iget-object v0, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->AUTH_TOKEN_NOT_PROVIDED:Lcom/helpshift/common/exception/NetworkException;

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 1599
    :cond_1
    iget-object v0, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->NON_RETRIABLE:Lcom/helpshift/common/exception/NetworkException;

    if-ne v0, v1, :cond_2

    goto :goto_1

    .line 1600
    :cond_2
    throw p1

    .line 1597
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object p1, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    invoke-virtual {v0, v1, p1}, Lcom/helpshift/account/AuthenticationFailureDM;->notifyAuthenticationFailure(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/exception/ExceptionType;)V

    .line 1605
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    const/4 v1, 0x1

    .line 1606
    iput-boolean v1, v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isMessageSeenSynced:Z

    goto :goto_2

    .line 1608
    :cond_4
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {p1, p2}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessages(Ljava/util/List;)Z

    return-void
.end method

.method private markSeenMessagesAsRead(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/Set;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/util/Set<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1541
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object v0

    .line 1542
    iget-object v0, v0, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 1544
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1545
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1547
    iget-object v3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v3}, Lcom/helpshift/util/HSObservableList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1548
    iget-object v5, v4, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    if-eqz v5, :cond_0

    .line 1549
    iget-object v5, v4, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    invoke-interface {v1, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1552
    :cond_1
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_2
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    .line 1553
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    if-eqz v3, :cond_2

    .line 1555
    iput-object v0, v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->readAt:Ljava/lang/String;

    const/4 v4, 0x1

    .line 1556
    iput v4, v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->deliveryState:I

    .line 1557
    iget-object v4, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageCursor:Ljava/lang/String;

    iput-object v4, v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->seenAtMessageCursor:Ljava/lang/String;

    .line 1558
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1562
    :cond_3
    invoke-static {v2}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result p2

    if-eqz p2, :cond_4

    return-void

    .line 1566
    :cond_4
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {p2, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessages(Ljava/util/List;)Z

    .line 1567
    invoke-direct {p0, p1, v2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->markMessagesAsSeen(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;)V

    return-void
.end method

.method private populateMessageDMLookup(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/Map;Ljava/util/Map;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 898
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 899
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/helpshift/conversation/dao/ConversationDAO;->readMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v1

    .line 900
    invoke-virtual {v1}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 901
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 902
    iget-object v3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v3}, Lcom/helpshift/util/HSObservableList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 904
    iget-object v5, v4, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    if-eqz v5, :cond_0

    .line 905
    iget-object v5, v4, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    invoke-interface {v2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 908
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 909
    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    if-nez v4, :cond_2

    .line 911
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 914
    :cond_2
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 917
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 920
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->getMessagesLocalIdToPendingRequestIdMap(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/util/Map;

    move-result-object p1

    .line 922
    :cond_4
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 923
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 924
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 925
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    invoke-interface {p2, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 928
    :cond_5
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    if-eqz v2, :cond_4

    .line 929
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    if-eqz p1, :cond_4

    .line 931
    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 933
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {p3, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_6
    return-void
.end method

.method private sendAttachmentMessageInternal(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V
    .locals 2

    .line 1281
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    new-instance v1, Lcom/helpshift/conversation/activeconversation/ConversationManager$10;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager$10;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    invoke-virtual {p2, v0, p1, v1}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->uploadAttachment(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;Lcom/helpshift/util/Callback;)V

    return-void
.end method

.method private sendGenericAttachment(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V
    .locals 13

    .line 1686
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object v0

    .line 1687
    iget-object v1, v0, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    .line 1688
    iget-object v0, v0, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 1689
    iget-object v0, p2, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileSize:Ljava/lang/Long;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    const/4 v8, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p2, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileSize:Ljava/lang/Long;

    .line 1691
    invoke-virtual {v0}, Ljava/lang/Long;->intValue()I

    move-result v0

    move v8, v0

    .line 1692
    :goto_0
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v1, "mobile"

    const-string v2, ""

    invoke-direct {v7, v1, v2, v0}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    .line 1693
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    const/4 v3, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    iget-object v11, p2, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileName:Ljava/lang/String;

    const/4 v12, 0x0

    move-object v2, v0

    invoke-direct/range {v2 .. v12}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 1703
    iget-object p2, p2, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->filePath:Ljava/lang/String;

    iput-object p2, v0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->filePath:Ljava/lang/String;

    .line 1704
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->shouldEnableMessagesClick(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result p2

    invoke-virtual {v0, p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->updateState(Z)V

    .line 1705
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object p2, v0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 1706
    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addMessageToDbAndUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 1707
    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendAttachmentMessageInternal(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V

    return-void
.end method

.method private sendMessageWithAutoRetry(Lcom/helpshift/common/domain/F;)V
    .locals 2

    .line 258
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/activeconversation/ConversationManager$3;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager$3;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/common/domain/F;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method private sendReOpenRejectedMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;ILjava/lang/String;Ljava/lang/String;)V
    .locals 10

    .line 213
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object v0

    .line 214
    iget-object v1, v0, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    .line 215
    iget-object v0, v0, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 216
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v1, "mobile"

    const-string v2, ""

    invoke-direct {v7, v1, v2, v0}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    .line 217
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;

    const/4 v3, 0x0

    const/4 v9, 0x1

    move-object v2, v0

    move-object v8, p4

    invoke-direct/range {v2 .. v9}, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;I)V

    .line 220
    iput p2, v0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->reason:I

    .line 221
    iput-object p3, v0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->openConversationId:Ljava/lang/String;

    .line 222
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object p2, v0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 223
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object p3, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v0, p2, p3}, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 225
    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addMessageToDBAndGlobalList(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 227
    new-instance p2, Lcom/helpshift/conversation/activeconversation/ConversationManager$2;

    invoke-direct {p2, p0, v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager$2;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    invoke-direct {p0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendMessageWithAutoRetry(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method private sendScreenshotMessageInternal(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;Z)V
    .locals 2

    .line 1253
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    new-instance v1, Lcom/helpshift/conversation/activeconversation/ConversationManager$9;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager$9;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    invoke-virtual {p2, v0, p1, p3, v1}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->uploadImage(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;ZLcom/helpshift/util/Callback;)V

    return-void
.end method

.method private sendTextMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;)V
    .locals 2

    .line 1195
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {p2, v0, p1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->send(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)V

    .line 1199
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p2, v0, :cond_2

    .line 1200
    sget-object p2, Lcom/helpshift/conversation/dto/IssueState;->WAITING_FOR_AGENT:Lcom/helpshift/conversation/dto/IssueState;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateIssueStatus(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/IssueState;)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 1204
    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->CONVERSATION_ARCHIVED:Lcom/helpshift/common/exception/NetworkException;

    if-ne v0, v1, :cond_0

    .line 1205
    sget-object p2, Lcom/helpshift/conversation/dto/IssueState;->ARCHIVED:Lcom/helpshift/conversation/dto/IssueState;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateIssueStatus(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/IssueState;)V

    goto :goto_0

    .line 1207
    :cond_0
    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->USER_PRE_CONDITION_FAILED:Lcom/helpshift/common/exception/NetworkException;

    if-ne v0, v1, :cond_1

    .line 1208
    sget-object p2, Lcom/helpshift/conversation/dto/IssueState;->AUTHOR_MISMATCH:Lcom/helpshift/conversation/dto/IssueState;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateIssueStatus(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/IssueState;)V

    goto :goto_0

    .line 1210
    :cond_1
    iget-object v0, p2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->CONVERSATION_REOPEN_EXPIRED:Lcom/helpshift/common/exception/NetworkException;

    if-ne v0, v1, :cond_3

    .line 1211
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->markConversationStateToResolutionExpired(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    :cond_2
    :goto_0
    return-void

    .line 1214
    :cond_3
    throw p2
.end method

.method private setCSATState(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/states/ConversationCSATState;)V
    .locals 2

    .line 1798
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    if-eq v0, p2, :cond_0

    .line 1799
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Update CSAT state : Conversation : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", state : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1800
    invoke-virtual {p2}, Lcom/helpshift/conversation/states/ConversationCSATState;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ConvManager"

    .line 1799
    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1802
    :cond_0
    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    .line 1805
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {p2, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->updateConversationWithoutMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-void
.end method

.method private updateMessageClickableState(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Z)V
    .locals 1

    .line 331
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    if-eqz v0, :cond_0

    .line 332
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->updateState(Z)V

    goto :goto_0

    .line 334
    :cond_0
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    if-eqz v0, :cond_1

    .line 335
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->setAttachmentButtonClickable(Z)V

    goto :goto_0

    .line 337
    :cond_1
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    if-eqz v0, :cond_2

    .line 338
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->updateState(Z)V

    goto :goto_0

    .line 340
    :cond_2
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    if-eqz v0, :cond_3

    .line 341
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->updateState(Z)V

    :cond_3
    :goto_0
    return-void
.end method


# virtual methods
.method addMessageToUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 2

    .line 622
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {p2, v0, v1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 623
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isUISupportedMessage()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 624
    invoke-virtual {p2, p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->addObserver(Ljava/util/Observer;)V

    .line 625
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v0, p2}, Lcom/helpshift/util/HSObservableList;->add(Ljava/lang/Object;)Z

    .line 626
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-static {p1}, Lcom/helpshift/conversation/ConversationUtil;->sortMessagesBasedOnCreatedAt(Ljava/util/List;)V

    :cond_0
    return-void
.end method

.method public addPreissueFirstUserMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;)V
    .locals 8

    const-string v0, "Helpshift_ConvManager"

    const-string v1, "Adding first user message to DB and UI."

    .line 1133
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1134
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object v0

    .line 1135
    iget-object v1, v0, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    .line 1136
    iget-object v0, v0, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 1137
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v1, "mobile"

    const-string v2, ""

    invoke-direct {v7, v1, v2, v0}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    .line 1138
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    move-object v2, v0

    move-object v3, p2

    invoke-direct/range {v2 .. v7}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V

    .line 1139
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v0, p2, v1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 1140
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object p2, v0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 1144
    sget-object p2, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENDING:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {v0, p2}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    .line 1147
    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addMessageToDbAndUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void
.end method

.method public addPreissueFirstUserMessageViaSmartIntent(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "Helpshift_ConvManager"

    const-string v1, "Adding first user message via smart intent to DB and UI."

    .line 1158
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1159
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object v0

    .line 1160
    iget-object v1, v0, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    .line 1161
    iget-object v0, v0, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 1162
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;

    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v2, "mobile"

    const-string v3, ""

    invoke-direct {v7, v2, v3, v1}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    move-object v2, v0

    move-object v3, p2

    invoke-direct/range {v2 .. v7}, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;-><init>(Ljava/util/List;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V

    .line 1165
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v0, p2, v1}, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 1166
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object p2, v0, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 1170
    sget-object p2, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENDING:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {v0, p2}, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    .line 1173
    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addMessageToDbAndUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void
.end method

.method public canAutoRetryMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z
    .locals 2

    .line 1312
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->ARCHIVED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, v1, :cond_1

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->AUTHOR_MISMATCH:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public checkAndReopen(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;ILjava/lang/String;Z)V
    .locals 10

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p3, v1, :cond_0

    .line 153
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->serverId:Ljava/lang/String;

    invoke-direct {p0, p1, v1, v0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendReOpenRejectedMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_0
    if-eqz p5, :cond_1

    const/4 p3, 0x4

    .line 158
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->serverId:Ljava/lang/String;

    invoke-direct {p0, p1, p3, v0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendReOpenRejectedMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 162
    :cond_1
    iget-object p5, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    invoke-static {p5}, Lcom/helpshift/conversation/ConversationUtil;->isInProgressState(Lcom/helpshift/conversation/dto/IssueState;)Z

    move-result p5

    if-nez p5, :cond_4

    iget-object p5, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    const/4 v3, 0x2

    if-ne p5, v2, :cond_2

    if-ne p3, v3, :cond_2

    goto :goto_0

    :cond_2
    if-eqz p4, :cond_3

    .line 172
    iget-object p3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    .line 173
    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_3

    .line 174
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->serverId:Ljava/lang/String;

    invoke-direct {p0, p1, v3, p4, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendReOpenRejectedMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 180
    :cond_3
    sget-object p3, Lcom/helpshift/conversation/dto/IssueState;->WAITING_FOR_AGENT:Lcom/helpshift/conversation/dto/IssueState;

    iput-object p3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    const/4 p3, 0x0

    .line 181
    iput-boolean p3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isConversationEndedDelegateSent:Z

    .line 182
    iget-object p3, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {p3, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->updateConversationWithoutMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 185
    iget-object p3, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {p3}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object p3

    .line 186
    iget-object p4, p3, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    move-object v4, p4

    check-cast v4, Ljava/lang/String;

    .line 187
    iget-object p3, p3, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast p3, Ljava/lang/Long;

    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 188
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object p3, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string p4, "mobile"

    const-string p5, ""

    invoke-direct {v7, p4, p5, p3}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    .line 189
    new-instance p3, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;

    const/4 v3, 0x0

    iget-object v8, p2, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->serverId:Ljava/lang/String;

    const/4 v9, 0x1

    move-object v2, p3

    invoke-direct/range {v2 .. v9}, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;I)V

    .line 192
    iget-object p4, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object p4, p3, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 193
    iget-object p4, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object p5, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {p3, p4, p5}, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 195
    invoke-direct {p0, p1, p3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addMessageToDBAndGlobalList(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 198
    invoke-virtual {p2, v1}, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->setAnsweredAndNotify(Z)V

    .line 199
    iget-object p4, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {p4, p2}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 201
    new-instance p2, Lcom/helpshift/conversation/activeconversation/ConversationManager$1;

    invoke-direct {p2, p0, p3, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager$1;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    invoke-direct {p0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendMessageWithAutoRetry(Lcom/helpshift/common/domain/F;)V

    goto :goto_1

    :cond_4
    :goto_0
    const/4 p3, 0x3

    .line 168
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->serverId:Ljava/lang/String;

    invoke-direct {p0, p1, p3, v0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendReOpenRejectedMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;ILjava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public clearRedactedAttachmentsResources(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 775
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 779
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/activeconversation/ConversationManager$6;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager$6;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public clearRequestIdForPendingCreateConversationCalls(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 2382
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 2385
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getNetworkRequestDAO()Lcom/helpshift/common/platform/network/NetworkRequestDAO;

    move-result-object v0

    const-string v1, "/issues/"

    const-string v2, "issue_default_unique_key"

    .line 2386
    invoke-interface {v0, v1, v2}, Lcom/helpshift/common/platform/network/NetworkRequestDAO;->getPendingRequestId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2388
    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v3}, Lcom/helpshift/common/platform/Platform;->getNetworkRequestDAO()Lcom/helpshift/common/platform/network/NetworkRequestDAO;

    move-result-object v3

    const-string v4, "/preissues/"

    const-string v5, "preissue_default_unique_key"

    .line 2389
    invoke-interface {v3, v4, v5}, Lcom/helpshift/common/platform/network/NetworkRequestDAO;->getPendingRequestId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v0, :cond_1

    if-eqz v3, :cond_4

    .line 2392
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 2393
    iget-object v7, v6, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdRequestId:Ljava/lang/String;

    if-eqz v7, :cond_2

    .line 2394
    iget-object v7, v6, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdRequestId:Ljava/lang/String;

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 2395
    iget-object v6, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v6}, Lcom/helpshift/common/platform/Platform;->getNetworkRequestDAO()Lcom/helpshift/common/platform/network/NetworkRequestDAO;

    move-result-object v6

    invoke-interface {v6, v1, v2}, Lcom/helpshift/common/platform/network/NetworkRequestDAO;->deletePendingRequestId(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 2398
    :cond_3
    iget-object v6, v6, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdRequestId:Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 2399
    iget-object v6, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v6}, Lcom/helpshift/common/platform/Platform;->getNetworkRequestDAO()Lcom/helpshift/common/platform/network/NetworkRequestDAO;

    move-result-object v6

    invoke-interface {v6, v4, v5}, Lcom/helpshift/common/platform/network/NetworkRequestDAO;->deletePendingRequestId(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    return-void
.end method

.method public clearRequestIdForPendingSendMessageCalls(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 2409
    invoke-static {p2}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 2412
    :cond_0
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->getRouteForSendingMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/lang/String;

    move-result-object v0

    .line 2413
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->getMessagesLocalIdToPendingRequestIdMap(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/util/Map;

    move-result-object p1

    if-nez p1, :cond_1

    return-void

    .line 2418
    :cond_1
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 2419
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v1}, Lcom/helpshift/common/platform/Platform;->getNetworkRequestDAO()Lcom/helpshift/common/platform/network/NetworkRequestDAO;

    move-result-object v1

    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    .line 2420
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 2419
    invoke-interface {v1, v0, p2}, Lcom/helpshift/common/platform/network/NetworkRequestDAO;->deletePendingRequestId(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public containsAtleastOneUserMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z
    .locals 4

    .line 2178
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    .line 2179
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2182
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {p1}, Lcom/helpshift/util/HSObservableList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 2183
    invoke-virtual {v2}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isUISupportedMessage()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2184
    instance-of v3, v2, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    if-eqz v3, :cond_1

    return v1

    .line 2187
    :cond_1
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2189
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    return v1

    :cond_2
    const/4 p1, 0x0

    return p1

    :cond_3
    return v1
.end method

.method public deleteCachedAttachmentFiles(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 6

    .line 2209
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->readMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object p1

    .line 2210
    invoke-virtual {p1}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 2211
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2212
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 2213
    instance-of v2, v1, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    const/4 v3, 0x0

    const-string v4, "Helpshift_ConvManager"

    if-eqz v2, :cond_1

    .line 2214
    move-object v2, v1

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    .line 2216
    :try_start_0
    invoke-virtual {v2}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->getFilePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/helpshift/util/FileUtil;->deleteFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 2217
    iput-object v3, v2, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->filePath:Ljava/lang/String;

    .line 2218
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    const-string v5, "Exception while deleting ScreenshotMessageDM file"

    .line 2222
    invoke-static {v4, v5, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 2225
    :cond_1
    instance-of v2, v1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    if-eqz v2, :cond_2

    .line 2226
    move-object v2, v1

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    .line 2228
    :try_start_1
    invoke-virtual {v2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->getFilePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/helpshift/util/FileUtil;->deleteFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 2229
    iput-object v3, v2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->filePath:Ljava/lang/String;

    .line 2230
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v2

    const-string v5, "Exception while deleting UserAttachmentMessageDM file"

    .line 2234
    invoke-static {v4, v5, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2237
    :cond_2
    :goto_1
    instance-of v2, v1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    if-eqz v2, :cond_0

    .line 2238
    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    .line 2240
    :try_start_2
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v2, v2, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->filePath:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/FileUtil;->deleteFile(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2241
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iput-object v3, v2, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->filePath:Ljava/lang/String;

    .line 2242
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    :catch_2
    move-exception v1

    const-string v2, "Exception while deleting AdminActionCardMessageDM file"

    .line 2246
    invoke-static {v4, v2, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 2252
    :cond_3
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {p1, v0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessages(Ljava/util/List;)Z

    return-void
.end method

.method public downloadAvatarImage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 2

    .line 2493
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/activeconversation/ConversationManager$14;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager$14;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public dropCustomMetaData()V
    .locals 2

    .line 2170
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getMetaDataDM()Lcom/helpshift/meta/MetaDataDM;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/meta/MetaDataDM;->setCustomMetaDataCallable(Lcom/helpshift/meta/RootMetaDataCallable;)V

    .line 2171
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getMetaDataDM()Lcom/helpshift/meta/MetaDataDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/meta/MetaDataDM;->clearCustomMetaData()V

    return-void
.end method

.method public evaluateBotControlMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/Collection;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/util/Collection<",
            "+",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 816
    invoke-interface/range {p2 .. p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 817
    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    .line 819
    sget-object v5, Lcom/helpshift/conversation/activeconversation/ConversationManager$16;->$SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType:[I

    invoke-virtual {v4}, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ordinal()I

    move-result v4

    aget v4, v5, v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_0

    goto :goto_0

    .line 824
    :cond_0
    iget-object v4, v0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v4}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object v4

    .line 825
    iget-object v5, v4, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    move-object v8, v5

    check-cast v8, Ljava/lang/String;

    .line 826
    iget-object v4, v4, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    .line 827
    check-cast v3, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;

    .line 829
    new-instance v11, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v4, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v5, "mobile"

    const-string v6, ""

    invoke-direct {v11, v5, v6, v4}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    .line 830
    new-instance v4, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;

    iget-object v14, v3, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->botInfo:Ljava/lang/String;

    iget-object v15, v3, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;->serverId:Ljava/lang/String;

    const/16 v16, 0x1

    const-string v7, "Unsupported bot input"

    const-string v12, "bot_cancelled"

    const-string v13, "unsupported_bot_input"

    move-object v6, v4

    invoke-direct/range {v6 .. v16}, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 838
    iget-object v3, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object v3, v4, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 839
    invoke-direct {v0, v1, v4}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addMessageToDbAndUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 842
    new-instance v3, Lcom/helpshift/conversation/activeconversation/ConversationManager$7;

    invoke-direct {v3, v0, v4, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager$7;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    invoke-direct {v0, v3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendMessageWithAutoRetry(Lcom/helpshift/common/domain/F;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public evaluateBotExecutionState(Ljava/util/List;Z)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;Z)Z"
        }
    .end annotation

    if-eqz p1, :cond_3

    .line 993
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 999
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_0
    if-ltz v0, :cond_3

    .line 1000
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1001
    iget-object v3, v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    .line 1003
    sget-object v4, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_BOT_CONTROL:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v4, v3, :cond_2

    .line 1004
    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;

    .line 1005
    iget-object v3, v2, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->actionType:Ljava/lang/String;

    const-string v4, "bot_started"

    .line 1006
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    return v1

    :cond_1
    const-string v4, "bot_ended"

    .line 1009
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1010
    iget-boolean p1, v2, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->hasNextBot:Z

    return p1

    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_3
    :goto_1
    return p2
.end method

.method public filterMessagesOlderThanLastMessageInDb(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z
    .locals 5

    .line 536
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->getOldestMessageCursor(J)Ljava/lang/String;

    move-result-object v0

    .line 539
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 540
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    .line 542
    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/helpshift/conversation/util/predicate/MessagePredicates;->olderThanLastDbMessagePredicate(J)Lcom/helpshift/util/Predicate;

    move-result-object v0

    .line 541
    invoke-static {v1, v0}, Lcom/helpshift/util/Filters;->filter(Ljava/util/List;Lcom/helpshift/util/Predicate;)Ljava/util/List;

    move-result-object v0

    .line 543
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v1}, Lcom/helpshift/util/HSObservableList;->size()I

    move-result v1

    .line 544
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-eqz v1, :cond_0

    if-nez v3, :cond_0

    const/4 v2, 0x1

    :cond_0
    if-eq v1, v3, :cond_1

    .line 547
    invoke-virtual {p1, v0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->setMessageDMs(Ljava/util/List;)V

    :cond_1
    return v2
.end method

.method public getLatestUnansweredBotMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 8

    .line 2031
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v0}, Lcom/helpshift/util/HSObservableList;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_0
    const/4 v2, 0x0

    if-ltz v0, :cond_7

    .line 2032
    iget-object v3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v3, v0}, Lcom/helpshift/util/HSObservableList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 2035
    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v5, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_BOT_CONTROL:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v4, v5, :cond_0

    return-object v2

    .line 2039
    :cond_0
    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v5, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_TEXT_WITH_TEXT_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-eq v4, v5, :cond_2

    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v5, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_TEXT_WITH_OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-eq v4, v5, :cond_2

    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v5, Lcom/helpshift/conversation/activeconversation/message/MessageType;->FAQ_LIST_WITH_OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-eq v4, v5, :cond_2

    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v5, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_RESOLUTION_QUESTION_MESSAGE:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-eq v4, v5, :cond_2

    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v5, Lcom/helpshift/conversation/activeconversation/message/MessageType;->OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-eq v4, v5, :cond_2

    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v5, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_CSAT_MESSAGE:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v4, v5, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_2
    :goto_1
    const/4 v4, 0x0

    add-int/2addr v0, v1

    .line 2052
    :goto_2
    iget-object v5, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v5}, Lcom/helpshift/util/HSObservableList;->size()I

    move-result v5

    if-ge v0, v5, :cond_5

    .line 2053
    iget-object v5, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v5, v0}, Lcom/helpshift/util/HSObservableList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 2054
    iget-object v6, v5, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->USER_RESP_FOR_OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-eq v6, v7, :cond_3

    iget-object v6, v5, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->USER_RESP_FOR_TEXT_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v6, v7, :cond_4

    .line 2057
    :cond_3
    check-cast v5, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    .line 2058
    iget-object v6, v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    invoke-virtual {v5}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->getReferredMessageId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    goto :goto_3

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_5
    const/4 v1, 0x0

    :goto_3
    if-eqz v1, :cond_6

    goto :goto_4

    :cond_6
    move-object v2, v3

    :cond_7
    :goto_4
    return-object v2
.end method

.method public getMessagesLocalIdToPendingRequestIdMap(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 940
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getNetworkRequestDAO()Lcom/helpshift/common/platform/network/NetworkRequestDAO;

    move-result-object v0

    .line 941
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->getRouteForSendingMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/helpshift/common/platform/network/NetworkRequestDAO;->getPendingRequestIdMapForRoute(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method public getUnSeenMessageCount(Lcom/helpshift/conversation/activeconversation/model/Conversation;)I
    .locals 5

    .line 2256
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->shouldOpen(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 2260
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v0, v2, v3}, Lcom/helpshift/conversation/dao/ConversationDAO;->readMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v0

    .line 2261
    invoke-virtual {v0}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_2

    .line 2264
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 2265
    invoke-virtual {v2}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isUISupportedMessage()Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->deliveryState:I

    const/4 v4, 0x1

    if-eq v3, v4, :cond_1

    .line 2266
    sget-object v3, Lcom/helpshift/conversation/activeconversation/ConversationManager$16;->$SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType:[I

    iget-object v4, v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    invoke-virtual {v4}, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 2268
    :pswitch_1
    instance-of v3, v2, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    if-eqz v3, :cond_1

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    iget-boolean v2, v2, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->isMessageEmpty:Z

    if-nez v2, :cond_1

    :pswitch_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2291
    :cond_2
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldIncrementMessageCount:Z

    if-eqz p1, :cond_3

    add-int/lit8 v1, v1, 0x1

    :cond_3
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public handleAdminSuggestedQuestionRead(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 2160
    new-instance v6, Lcom/helpshift/conversation/activeconversation/ConversationManager$13;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p2

    move-object v3, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/helpshift/conversation/activeconversation/ConversationManager$13;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v6}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendMessageWithAutoRetry(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public handleAppReviewRequestClick(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;)V
    .locals 2

    .line 1613
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    .line 1614
    invoke-virtual {p2, v0, v1}, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->handleRequestReviewClick(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1616
    new-instance v1, Lcom/helpshift/conversation/activeconversation/ConversationManager$11;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager$11;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;)V

    invoke-direct {p0, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendMessageWithAutoRetry(Lcom/helpshift/common/domain/F;)V

    :cond_0
    return-void
.end method

.method public handleConversationEnded(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 1084
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/activeconversation/ConversationManager$8;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager$8;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public handlePreIssueCreationSuccess(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 2298
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->lastUserActivityTime:J

    .line 2299
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendMessageAddedEventOnPreissueCreation(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-void
.end method

.method public hasBotSwitchedToAnotherBotInPollerResponse(Ljava/util/Collection;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 2081
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 2085
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 2090
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p1

    const/4 v2, 0x1

    sub-int/2addr p1, v2

    const/4 v3, 0x0

    :goto_0
    if-ltz p1, :cond_3

    .line 2091
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 2092
    iget-object v5, v4, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    .line 2094
    sget-object v6, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_BOT_CONTROL:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v6, v5, :cond_2

    .line 2095
    check-cast v4, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;

    .line 2096
    iget-object v4, v4, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->actionType:Ljava/lang/String;

    const-string v5, "bot_ended"

    .line 2097
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    return v3

    :cond_1
    const-string v5, "bot_started"

    .line 2102
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/4 v3, 0x1

    :cond_2
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    :cond_3
    :goto_1
    return v0
.end method

.method public initializeHistoryMessageListForUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V
    .locals 4

    .line 1909
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->removeFeedbackMessagesFromConversations(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 1911
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v0}, Lcom/helpshift/util/HSObservableList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1912
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v1, v2, v3}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 1913
    invoke-virtual {p0, v1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessageOnConversationUpdate(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Z)V

    .line 1914
    invoke-virtual {p0, p1, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateAcceptedRequestForReopenMessageDMs(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public initializeIssueStatusForUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 1120
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v1, :cond_0

    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    .line 1121
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->shouldShowConversationResolutionQuestion()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 1122
    invoke-virtual {p0, p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->markConversationResolutionStatus(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    :cond_0
    return-void
.end method

.method public initializeMessagesForUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V
    .locals 6

    .line 1841
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-static {v0}, Lcom/helpshift/conversation/ConversationUtil;->sortMessagesBasedOnCreatedAt(Ljava/util/List;)V

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_5

    .line 1845
    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    .line 1846
    invoke-virtual {p0, v2, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->evaluateBotExecutionState(Ljava/util/List;Z)Z

    move-result v0

    iput-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInBetweenBotExecution:Z

    .line 1847
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v0}, Lcom/helpshift/util/HSObservableList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1848
    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v2, v3, v4}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 1849
    instance-of v3, v2, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;

    if-eqz v3, :cond_0

    .line 1850
    move-object v3, v2

    check-cast v3, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;

    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v3, v4}, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;->downloadThumbnailImage(Lcom/helpshift/common/platform/Platform;)V

    .line 1852
    :cond_0
    instance-of v3, v2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    if-eqz v3, :cond_1

    .line 1853
    move-object v3, v2

    check-cast v3, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v3, v4}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->downloadImage(Lcom/helpshift/common/platform/Platform;)V

    .line 1855
    :cond_1
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->shouldEnableMessagesClick(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessageOnConversationUpdate(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Z)V

    .line 1856
    invoke-virtual {p0, p1, v2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateAcceptedRequestForReopenMessageDMs(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    goto :goto_0

    .line 1858
    :cond_2
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v0}, Lcom/helpshift/util/HSObservableList;->size()I

    move-result v0

    if-lez v0, :cond_8

    .line 1859
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result v0

    if-nez v0, :cond_3

    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    if-eqz v0, :cond_8

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v2, :cond_8

    .line 1862
    :cond_3
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v2}, Lcom/helpshift/util/HSObservableList;->size()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-virtual {v0, v2}, Lcom/helpshift/util/HSObservableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1863
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v3, Lcom/helpshift/conversation/activeconversation/message/MessageType;->USER_RESP_FOR_OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-eq v2, v3, :cond_4

    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v3, Lcom/helpshift/conversation/activeconversation/message/MessageType;->USER_RESP_FOR_TEXT_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-eq v2, v3, :cond_4

    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v3, Lcom/helpshift/conversation/activeconversation/message/MessageType;->USER_RESP_FOR_CSAT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v2, v3, :cond_8

    .line 1866
    :cond_4
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->getLatestUnansweredBotMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object v2

    .line 1872
    iget-boolean v3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInBetweenBotExecution:Z

    if-eqz v3, :cond_8

    if-nez v2, :cond_8

    .line 1873
    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    invoke-virtual {v0, v1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->updateState(Z)V

    goto :goto_2

    .line 1879
    :cond_5
    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v2}, Lcom/helpshift/util/HSObservableList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1880
    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v5, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v3, v4, v5}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 1881
    instance-of v4, v3, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;

    if-eqz v4, :cond_6

    .line 1882
    move-object v4, v3

    check-cast v4, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;

    iget-object v5, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v4, v5}, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;->downloadThumbnailImage(Lcom/helpshift/common/platform/Platform;)V

    .line 1884
    :cond_6
    instance-of v4, v3, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    if-eqz v4, :cond_7

    .line 1885
    move-object v4, v3

    check-cast v4, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    iget-object v5, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v4, v5}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->downloadImage(Lcom/helpshift/common/platform/Platform;)V

    .line 1887
    :cond_7
    invoke-virtual {p0, v3, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessageOnConversationUpdate(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Z)V

    goto :goto_1

    .line 1893
    :cond_8
    :goto_2
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v0}, Lcom/helpshift/util/HSObservableList;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 1894
    :cond_9
    :goto_3
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 1895
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1896
    instance-of v3, v2, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    if-eqz v3, :cond_9

    if-eqz p2, :cond_a

    .line 1897
    iget-object v3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    .line 1898
    invoke-virtual {v3, v2}, Lcom/helpshift/util/HSObservableList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    iget-object v3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v3}, Lcom/helpshift/util/HSObservableList;->size()I

    move-result v3

    sub-int/2addr v3, v1

    if-eq v2, v3, :cond_9

    .line 1899
    :cond_a
    invoke-interface {v0}, Ljava/util/ListIterator;->remove()V

    goto :goto_3

    :cond_b
    return-void
.end method

.method public isConversationActionable(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 2461
    :cond_0
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->isSynced(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v1

    if-nez v1, :cond_1

    return v0

    .line 2466
    :cond_1
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    .line 2467
    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2468
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result v1

    if-eqz v1, :cond_2

    return v2

    .line 2473
    :cond_2
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v3, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v1, v3, :cond_3

    goto :goto_0

    .line 2479
    :cond_3
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p1, v1, :cond_4

    if-eqz p2, :cond_4

    return v2

    :cond_4
    return v0

    :cond_5
    :goto_0
    return v2
.end method

.method public isSynced(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z
    .locals 1

    .line 1943
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public markConversationCSATStateToExpired(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 354
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    sget-object v1, Lcom/helpshift/conversation/states/ConversationCSATState;->EXPIRED:Lcom/helpshift/conversation/states/ConversationCSATState;

    if-ne v0, v1, :cond_0

    return-void

    .line 359
    :cond_0
    sget-object v0, Lcom/helpshift/conversation/states/ConversationCSATState;->EXPIRED:Lcom/helpshift/conversation/states/ConversationCSATState;

    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->setCSATState(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/states/ConversationCSATState;)V

    .line 362
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendCSATExpiryEvent(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-void
.end method

.method public markConversationResolutionStatus(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V
    .locals 9

    .line 403
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object v0

    .line 404
    iget-object v1, v0, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    .line 405
    iget-object v0, v0, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    if-eqz p2, :cond_0

    .line 407
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendConfirmationAcceptedMessageAndDelegates(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 409
    sget-object p2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateIssueStatus(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/IssueState;)V

    goto :goto_0

    .line 413
    :cond_0
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object p2, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->SYSTEM:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v0, "mobile"

    const-string v1, ""

    invoke-direct {v7, v0, v1, p2}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    .line 414
    new-instance p2, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;

    const/4 v8, 0x1

    const-string v3, "Did not accept the solution"

    move-object v2, p2

    invoke-direct/range {v2 .. v8}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;I)V

    .line 416
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 418
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addMessageToDbAndUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 421
    new-instance v0, Lcom/helpshift/conversation/activeconversation/ConversationManager$4;

    invoke-direct {v0, p0, p2, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager$4;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    invoke-direct {p0, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendMessageWithAutoRetry(Lcom/helpshift/common/domain/F;)V

    .line 441
    sget-object p2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateIssueStatus(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/IssueState;)V

    .line 444
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 445
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    const-string v1, "id"

    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 447
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    const-string v0, "acid"

    invoke-interface {p2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    :cond_1
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object p1

    sget-object v0, Lcom/helpshift/analytics/AnalyticsEventType;->RESOLUTION_REJECTED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {p1, v0, p2}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    .line 451
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object p1

    const-string p2, "User rejected the solution"

    invoke-virtual {p1, p2}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->userRepliedToConversation(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public markConversationStateToResolutionExpired(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 381
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_EXPIRED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v1, :cond_0

    return-void

    .line 385
    :cond_0
    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_EXPIRED:Lcom/helpshift/conversation/dto/IssueState;

    invoke-virtual {p0, p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateIssueStatus(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/IssueState;)V

    .line 387
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendResolutionQuestionExpiryEvent(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 390
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->handleConversationEnded(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-void
.end method

.method public markMessagesAsSeen(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 5

    .line 1508
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->readMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v0

    .line 1509
    invoke-virtual {v0}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1510
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 1511
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1512
    iget v3, v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->deliveryState:I

    const/4 v4, 0x1

    if-eq v3, v4, :cond_0

    .line 1513
    sget-object v3, Lcom/helpshift/conversation/activeconversation/ConversationManager$16;->$SwitchMap$com$helpshift$conversation$activeconversation$message$MessageType:[I

    iget-object v4, v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    invoke-virtual {v4}, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 1527
    :pswitch_0
    iget-object v2, v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->localId:Ljava/lang/Long;

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1533
    :cond_1
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v0

    if-nez v0, :cond_2

    return-void

    .line 1537
    :cond_2
    invoke-direct {p0, p1, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->markSeenMessagesAsRead(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/Set;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public mergeIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;ZLcom/helpshift/conversation/activeconversation/ConversationUpdate;)V
    .locals 4

    .line 561
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 562
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 564
    iget-boolean v2, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldAllowNewConversationCreation:Z

    if-eqz v2, :cond_0

    .line 565
    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->CLOSED:Lcom/helpshift/conversation/dto/IssueState;

    goto :goto_0

    .line 567
    :cond_0
    iget-boolean v2, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    if-eqz v2, :cond_1

    goto :goto_0

    .line 570
    :cond_1
    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v2, :cond_3

    .line 573
    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v3, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v2, v3, :cond_2

    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v3, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v2, v3, :cond_2

    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v3, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_EXPIRED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v2, v3, :cond_2

    goto :goto_0

    :cond_2
    move-object v0, v1

    .line 584
    :cond_3
    :goto_0
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageCursor:Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 586
    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageCursor:Ljava/lang/String;

    .line 588
    :cond_4
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    .line 589
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    .line 590
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    .line 591
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->title:Ljava/lang/String;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->title:Ljava/lang/String;

    .line 592
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->publishId:Ljava/lang/String;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->publishId:Ljava/lang/String;

    .line 593
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdAt:Ljava/lang/String;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdAt:Ljava/lang/String;

    .line 594
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getEpochCreatedAtTime()J

    move-result-wide v1

    iput-wide v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->epochCreatedAtTime:J

    .line 595
    iget-boolean v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    iput-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    .line 596
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->resolutionExpiryAt:Ljava/lang/Long;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->resolutionExpiryAt:Ljava/lang/Long;

    .line 597
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatExpiryAt:Ljava/lang/Long;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatExpiryAt:Ljava/lang/Long;

    .line 598
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->updatedAt:Ljava/lang/String;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->updatedAt:Ljava/lang/String;

    .line 599
    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 600
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    iput-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    .line 601
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldAllowNewConversationCreation:Z

    iput-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldAllowNewConversationCreation:Z

    .line 605
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    sget-object v1, Lcom/helpshift/conversation/states/ConversationCSATState;->SUBMITTED_SYNCED:Lcom/helpshift/conversation/states/ConversationCSATState;

    if-ne v0, v1, :cond_5

    .line 606
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    goto :goto_1

    .line 608
    :cond_5
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0, p1}, Lcom/helpshift/conversation/ConversationUtil;->isCSATTimerExpired(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 610
    sget-object v0, Lcom/helpshift/conversation/states/ConversationCSATState;->EXPIRED:Lcom/helpshift/conversation/states/ConversationCSATState;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    .line 612
    :cond_6
    :goto_1
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {p0, p1, p3, p2, p4}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessageDMs(Lcom/helpshift/conversation/activeconversation/model/Conversation;ZLjava/util/List;Lcom/helpshift/conversation/activeconversation/ConversationUpdate;)V

    return-void
.end method

.method public mergePreIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/model/Conversation;ZLcom/helpshift/conversation/activeconversation/ConversationUpdate;)V
    .locals 3

    .line 1021
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 1023
    sget-object v1, Lcom/helpshift/conversation/activeconversation/ConversationManager$16;->$SwitchMap$com$helpshift$conversation$dto$IssueState:[I

    invoke-virtual {v0}, Lcom/helpshift/conversation/dto/IssueState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x4

    if-eq v1, v2, :cond_1

    const/4 v2, 0x5

    if-eq v1, v2, :cond_0

    goto :goto_0

    .line 1033
    :cond_0
    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    goto :goto_0

    .line 1025
    :cond_1
    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->COMPLETED_ISSUE_CREATED:Lcom/helpshift/conversation/dto/IssueState;

    .line 1027
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    .line 1040
    :goto_0
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageCursor:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 1042
    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageCursor:Ljava/lang/String;

    .line 1044
    :cond_2
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    .line 1045
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    .line 1046
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    .line 1047
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->title:Ljava/lang/String;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->title:Ljava/lang/String;

    .line 1048
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->publishId:Ljava/lang/String;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->publishId:Ljava/lang/String;

    .line 1049
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdAt:Ljava/lang/String;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdAt:Ljava/lang/String;

    .line 1050
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getEpochCreatedAtTime()J

    move-result-wide v1

    iput-wide v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->epochCreatedAtTime:J

    .line 1051
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->updatedAt:Ljava/lang/String;

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->updatedAt:Ljava/lang/String;

    .line 1052
    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 1053
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {p0, p1, p3, p2, p4}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessageDMs(Lcom/helpshift/conversation/activeconversation/model/Conversation;ZLjava/util/List;Lcom/helpshift/conversation/activeconversation/ConversationUpdate;)V

    return-void
.end method

.method public refreshConversationOnIssueStateUpdate(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 4

    .line 283
    sget-object v0, Lcom/helpshift/conversation/activeconversation/ConversationManager$16;->$SwitchMap$com$helpshift$conversation$dto$IssueState:[I

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    invoke-virtual {v1}, Lcom/helpshift/conversation/dto/IssueState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    goto/16 :goto_2

    .line 306
    :cond_0
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->handleConversationEnded(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    goto :goto_2

    .line 286
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 287
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/helpshift/conversation/dao/ConversationDAO;->readMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v1

    .line 288
    invoke-virtual {v1}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 289
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 290
    instance-of v3, v2, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    if-eqz v3, :cond_2

    iget-object v3, v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    if-nez v3, :cond_2

    .line 291
    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 294
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 295
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    .line 296
    iget-object v2, v2, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->body:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n"

    .line 297
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 299
    :cond_4
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getConversationInboxDAO()Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    move-result-object v0

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v2}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 301
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 299
    invoke-interface {v0, v2, v3, v1}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->saveConversationArchivalPrefillText(JLjava/lang/String;)V

    .line 302
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->handleConversationEnded(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 309
    :goto_2
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessagesOnIssueStatusUpdate(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-void
.end method

.method public removeFeedbackMessagesFromConversations(Lcom/helpshift/conversation/activeconversation/ViewableConversation;)V
    .locals 1

    .line 1931
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getAllConversations()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 1932
    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->removeFeedbackMessagesFromConversations(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public removeFeedbackMessagesFromConversations(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 1919
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->CLOSED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, v1, :cond_0

    return-void

    .line 1922
    :cond_0
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {p1}, Lcom/helpshift/util/HSObservableList;->listIterator()Ljava/util/ListIterator;

    move-result-object p1

    .line 1923
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1924
    invoke-interface {p1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    iget-boolean v0, v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isFeedbackMessage:Z

    if-eqz v0, :cond_1

    .line 1925
    invoke-interface {p1}, Ljava/util/ListIterator;->remove()V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public retryMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 1

    .line 1239
    instance-of v0, p2, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    if-eqz v0, :cond_0

    .line 1240
    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendTextMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;)V

    goto :goto_0

    .line 1242
    :cond_0
    instance-of v0, p2, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    if-eqz v0, :cond_1

    .line 1243
    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendScreenshotMessageInternal(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;Z)V

    goto :goto_0

    .line 1245
    :cond_1
    instance-of v0, p2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    if-eqz v0, :cond_2

    .line 1246
    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendAttachmentMessageInternal(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public retryMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V
    .locals 11

    .line 1354
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->readMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v0

    .line 1355
    invoke-virtual {v0}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1356
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1357
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1358
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 1359
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1360
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1362
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v7, 0x1

    if-eqz v6, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1363
    iget-object v8, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v9, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v6, v8, v9}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 1365
    instance-of v8, v6, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;

    if-eqz v8, :cond_1

    move-object v8, v6

    check-cast v8, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;

    .line 1366
    invoke-direct {p0, p1, v8}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->canAutoRetryMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 1367
    invoke-interface {v1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1370
    :cond_1
    iget-object v8, v6, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->readAt:Ljava/lang/String;

    invoke-static {v8}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_2

    iget-boolean v8, v6, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isMessageSeenSynced:Z

    if-nez v8, :cond_2

    .line 1371
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1374
    :cond_2
    instance-of v8, v6, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;

    if-eqz v8, :cond_3

    .line 1375
    iget-object v8, v6, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    move-object v9, v6

    check-cast v9, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;

    invoke-interface {v3, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1378
    :cond_3
    instance-of v8, v6, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;

    if-eqz v8, :cond_4

    .line 1379
    move-object v8, v6

    check-cast v8, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;

    .line 1380
    invoke-virtual {v8}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;->isSuggestionsReadEventPending()Z

    move-result v9

    if-eqz v9, :cond_4

    .line 1381
    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1385
    :cond_4
    instance-of v8, v6, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    if-eqz v8, :cond_0

    .line 1386
    check-cast v6, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    .line 1387
    iget-boolean v8, v6, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->isNewConversationStarted:Z

    if-eqz v8, :cond_0

    iget-object v8, v6, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->serverId:Ljava/lang/String;

    invoke-static {v8}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    iget v8, v6, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->messageSyncState:I

    if-ne v8, v7, :cond_0

    .line 1389
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1395
    :cond_5
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;

    .line 1398
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->canAutoRetryMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v6

    if-nez v6, :cond_7

    return-void

    .line 1404
    :cond_7
    invoke-direct {p0, p1, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->canAutoRetryMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;)Z

    move-result v6

    if-nez v6, :cond_8

    goto :goto_1

    .line 1409
    :cond_8
    :try_start_0
    iget-object v6, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1, v6, p1}, Lcom/helpshift/conversation/activeconversation/message/AutoRetriableMessageDM;->send(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)V

    .line 1410
    instance-of v6, v1, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;

    if-eqz v6, :cond_6

    .line 1411
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1414
    move-object v8, v1

    check-cast v8, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;

    .line 1416
    iget-object v9, v8, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;->referredMessageId:Ljava/lang/String;

    .line 1417
    invoke-interface {v3, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 1418
    invoke-interface {v3, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;

    .line 1419
    iget-object v10, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v9, v10}, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->handleAcceptedReviewSuccess(Lcom/helpshift/common/platform/Platform;)V

    .line 1422
    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_9
    if-eqz p2, :cond_6

    .line 1428
    invoke-interface {v6, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1429
    invoke-virtual {p0, p1, v8}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addMessageToUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    const/4 v1, 0x0

    .line 1430
    invoke-virtual {p0, p1, v7, v6, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessageDMs(Lcom/helpshift/conversation/activeconversation/model/Conversation;ZLjava/util/List;Lcom/helpshift/conversation/activeconversation/ConversationUpdate;)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    .line 1435
    invoke-direct {p0, p1, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->handleConversationErrorUpdate(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/common/exception/RootAPIException;)Z

    move-result v6

    if-nez v6, :cond_6

    iget-object v6, v1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v8, Lcom/helpshift/common/exception/NetworkException;->NON_RETRIABLE:Lcom/helpshift/common/exception/NetworkException;

    if-ne v6, v8, :cond_a

    goto :goto_1

    .line 1437
    :cond_a
    throw v1

    .line 1444
    :cond_b
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 1445
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1446
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->readAt:Ljava/lang/String;

    .line 1447
    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-nez v3, :cond_c

    .line 1449
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1451
    :cond_c
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1452
    invoke-interface {p2, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 1456
    :cond_d
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1458
    :try_start_1
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-direct {p0, p1, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->markMessagesAsSeen(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;)V
    :try_end_1
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    :catch_1
    move-exception v1

    .line 1461
    iget-object v2, v1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v3, Lcom/helpshift/common/exception/NetworkException;->NON_RETRIABLE:Lcom/helpshift/common/exception/NetworkException;

    if-ne v2, v3, :cond_e

    goto :goto_3

    .line 1462
    :cond_e
    throw v1

    .line 1468
    :cond_f
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_4
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;

    .line 1469
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0, p1, v1}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;->sendSuggestionReadEvent(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;Lcom/helpshift/account/domainmodel/UserDM;)V

    goto :goto_4

    .line 1472
    :cond_10
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_5
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    .line 1474
    :try_start_2
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0, v1, p1}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->send(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;)V
    :try_end_2
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_5

    :catch_2
    move-exception v1

    .line 1477
    invoke-direct {p0, p1, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->handleConversationErrorUpdate(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/common/exception/RootAPIException;)Z

    move-result v2

    if-nez v2, :cond_12

    iget-object v2, v1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v3, Lcom/helpshift/common/exception/NetworkException;->NON_RETRIABLE:Lcom/helpshift/common/exception/NetworkException;

    if-ne v2, v3, :cond_11

    goto :goto_6

    .line 1483
    :cond_11
    throw v1

    :cond_12
    :goto_6
    const/4 v1, 0x3

    .line 1479
    iput v1, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->messageSyncState:I

    .line 1480
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {v1, v0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    goto :goto_5

    :cond_13
    return-void
.end method

.method public sendAttachment(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/AttachmentPickerFile;Ljava/lang/String;)V
    .locals 2

    .line 1639
    iget v0, p2, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->attachmentType:I

    const/4 v1, 0x1

    if-ne v1, v0, :cond_0

    .line 1640
    invoke-virtual {p0, p1, p2, p3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendScreenshot(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/AttachmentPickerFile;Ljava/lang/String;)V

    goto :goto_0

    .line 1643
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendGenericAttachment(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    :goto_0
    return-void
.end method

.method public sendCSATBotResponse(Lcom/helpshift/conversation/activeconversation/model/Conversation;IZLcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    .line 2503
    iget-object v3, v0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v3}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object v3

    .line 2504
    iget-object v4, v3, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    .line 2505
    iget-object v3, v3, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    if-eqz p3, :cond_0

    .line 2509
    iget-object v3, v2, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    iget-object v3, v3, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->startNewConversationLabel:Ljava/lang/String;

    const-string v7, "{}"

    move/from16 v10, p2

    move-object v11, v7

    goto :goto_1

    .line 2512
    :cond_0
    iget-object v3, v2, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    iget-object v3, v3, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->ratings:Ljava/util/List;

    const/4 v7, 0x0

    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;

    .line 2513
    iget-object v7, v2, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    iget-object v7, v7, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->ratings:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;

    .line 2514
    iget v9, v8, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->value:I

    move/from16 v10, p2

    if-ne v9, v10, :cond_1

    move-object v3, v8

    goto :goto_0

    :cond_2
    move/from16 v10, p2

    .line 2520
    :goto_0
    iget-object v7, v3, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->title:Ljava/lang/String;

    .line 2521
    iget-object v3, v3, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->jsonData:Ljava/lang/String;

    move-object v11, v3

    move-object v3, v7

    .line 2525
    :goto_1
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v8, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v9, "mobile"

    const-string v12, ""

    invoke-direct {v7, v9, v12, v8}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    .line 2526
    new-instance v14, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    iget-object v8, v2, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    iget-object v12, v8, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->botInfo:Ljava/lang/String;

    iget-object v13, v2, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->serverId:Ljava/lang/String;

    const/4 v15, 0x1

    move-object v2, v14

    move/from16 v8, p2

    move/from16 v9, p3

    move-object v10, v12

    move-object v12, v13

    move v13, v15

    invoke-direct/range {v2 .. v13}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;IZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 2534
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object v2, v14, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->conversationLocalId:Ljava/lang/Long;

    const/4 v2, 0x1

    .line 2538
    invoke-virtual {v14, v2}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->updateState(Z)V

    .line 2539
    invoke-direct {v0, v1, v14}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addMessageToDbAndUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    if-nez p3, :cond_3

    .line 2542
    invoke-direct {v0, v1, v14}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendTextMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;)V

    goto :goto_2

    .line 2545
    :cond_3
    new-instance v2, Lcom/helpshift/conversation/activeconversation/ConversationManager$15;

    invoke-direct {v2, v0, v14, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager$15;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    invoke-direct {v0, v2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendMessageWithAutoRetry(Lcom/helpshift/common/domain/F;)V

    :goto_2
    return-void
.end method

.method public sendCSATExpiryEvent(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 3

    .line 366
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "type"

    const-string v2, "csat"

    .line 367
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getIssueId()Ljava/lang/String;

    move-result-object p1

    const-string v1, "id"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object p1

    sget-object v1, Lcom/helpshift/analytics/AnalyticsEventType;->TIMER_EXPIRED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {p1, v1, v0}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    return-void
.end method

.method public sendCSATSurvey(Lcom/helpshift/conversation/activeconversation/model/Conversation;ILjava/lang/String;)V
    .locals 1

    const/4 v0, 0x5

    if-le p2, v0, :cond_0

    const/4 p2, 0x5

    goto :goto_0

    :cond_0
    if-gez p2, :cond_1

    const/4 p2, 0x0

    .line 1718
    :cond_1
    :goto_0
    iput p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatRating:I

    if-eqz p3, :cond_2

    .line 1720
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p3

    .line 1722
    :cond_2
    iput-object p3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatFeedback:Ljava/lang/String;

    .line 1723
    sget-object p2, Lcom/helpshift/conversation/states/ConversationCSATState;->SUBMITTED_NOT_SYNCED:Lcom/helpshift/conversation/states/ConversationCSATState;

    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->setCSATState(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/states/ConversationCSATState;)V

    .line 1726
    new-instance p2, Lcom/helpshift/conversation/activeconversation/ConversationManager$12;

    invoke-direct {p2, p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager$12;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    invoke-direct {p0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendMessageWithAutoRetry(Lcom/helpshift/common/domain/F;)V

    .line 1734
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object p2

    iget p3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatRating:I

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatFeedback:Ljava/lang/String;

    invoke-virtual {p2, p3, p1}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->userCompletedCustomerSatisfactionSurvey(ILjava/lang/String;)V

    return-void
.end method

.method public sendCSATSurveyInternal(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 9

    .line 1740
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0, p1}, Lcom/helpshift/conversation/ConversationUtil;->isCSATTimerExpired(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1741
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->markConversationCSATStateToExpired(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-void

    .line 1745
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/issues/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/customer-survey/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1747
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {v0}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->getUserRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Ljava/util/HashMap;

    move-result-object v0

    .line 1748
    iget v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatRating:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "rating"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1749
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatFeedback:Ljava/lang/String;

    const-string v2, "feedback"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x0

    .line 1754
    new-instance v3, Lcom/helpshift/common/domain/network/POSTNetwork;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v3, v6, v2, v4}, Lcom/helpshift/common/domain/network/POSTNetwork;-><init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 1755
    new-instance v5, Lcom/helpshift/common/domain/idempotent/SuccessOrNonRetriableStatusCodeIdempotentPolicy;

    invoke-direct {v5}, Lcom/helpshift/common/domain/idempotent/SuccessOrNonRetriableStatusCodeIdempotentPolicy;-><init>()V

    .line 1756
    new-instance v8, Lcom/helpshift/common/domain/network/IdempotentNetwork;

    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v7, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    move-object v2, v8

    invoke-direct/range {v2 .. v7}, Lcom/helpshift/common/domain/network/IdempotentNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/idempotent/IdempotentPolicy;Ljava/lang/String;Ljava/lang/String;)V

    .line 1758
    new-instance v2, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;

    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v2, v8, v3}, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 1759
    new-instance v3, Lcom/helpshift/common/domain/network/GuardAgainstCSATExpiryNetwork;

    iget-object v4, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v3, v2, v4}, Lcom/helpshift/common/domain/network/GuardAgainstCSATExpiryNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 1760
    new-instance v2, Lcom/helpshift/common/domain/network/FailedAPICallNetworkDecorator;

    invoke-direct {v2, v3}, Lcom/helpshift/common/domain/network/FailedAPICallNetworkDecorator;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 1761
    new-instance v3, Lcom/helpshift/common/domain/network/GuardOKNetwork;

    invoke-direct {v3, v2}, Lcom/helpshift/common/domain/network/GuardOKNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 1765
    :try_start_0
    new-instance v2, Lcom/helpshift/common/platform/network/RequestData;

    invoke-direct {v2, v0}, Lcom/helpshift/common/platform/network/RequestData;-><init>(Ljava/util/Map;)V

    .line 1766
    invoke-interface {v3, v2}, Lcom/helpshift/common/domain/network/Network;->makeRequest(Lcom/helpshift/common/platform/network/RequestData;)Lcom/helpshift/common/platform/network/Response;

    .line 1767
    sget-object v0, Lcom/helpshift/conversation/states/ConversationCSATState;->SUBMITTED_SYNCED:Lcom/helpshift/conversation/states/ConversationCSATState;
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    .line 1791
    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->setCSATState(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/states/ConversationCSATState;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 1771
    :try_start_1
    iget-object v2, v0, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v3, Lcom/helpshift/common/exception/NetworkException;->CSAT_EXPIRED:Lcom/helpshift/common/exception/NetworkException;

    if-ne v2, v3, :cond_2

    .line 1772
    sget-object v1, Lcom/helpshift/conversation/states/ConversationCSATState;->EXPIRED:Lcom/helpshift/conversation/states/ConversationCSATState;

    .line 1774
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendCSATExpiryEvent(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_1

    .line 1791
    invoke-direct {p0, p1, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->setCSATState(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/states/ConversationCSATState;)V

    :cond_1
    :goto_0
    return-void

    .line 1777
    :cond_2
    :try_start_2
    iget-object v2, v0, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v3, Lcom/helpshift/common/exception/NetworkException;->INVALID_AUTH_TOKEN:Lcom/helpshift/common/exception/NetworkException;

    if-eq v2, v3, :cond_3

    iget-object v2, v0, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v3, Lcom/helpshift/common/exception/NetworkException;->AUTH_TOKEN_NOT_PROVIDED:Lcom/helpshift/common/exception/NetworkException;

    if-eq v2, v3, :cond_3

    .line 1782
    iget-object v2, v0, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v3, Lcom/helpshift/common/exception/NetworkException;->NON_RETRIABLE:Lcom/helpshift/common/exception/NetworkException;

    if-ne v2, v3, :cond_4

    .line 1783
    sget-object v1, Lcom/helpshift/conversation/states/ConversationCSATState;->SUBMITTED_SYNCED:Lcom/helpshift/conversation/states/ConversationCSATState;

    goto :goto_1

    .line 1779
    :cond_3
    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v2}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object v2

    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v4, v0, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    invoke-virtual {v2, v3, v4}, Lcom/helpshift/account/AuthenticationFailureDM;->notifyAuthenticationFailure(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/common/exception/ExceptionType;)V

    .line 1785
    :cond_4
    :goto_1
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_2
    if-eqz v1, :cond_5

    .line 1791
    invoke-direct {p0, p1, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->setCSATState(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/states/ConversationCSATState;)V

    .line 1793
    :cond_5
    throw v0
.end method

.method public sendConfirmationAcceptedMessageAndDelegates(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 9

    .line 457
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object v0

    .line 458
    iget-object v1, v0, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    .line 459
    iget-object v0, v0, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 460
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v1, "mobile"

    const-string v2, ""

    invoke-direct {v7, v1, v2, v0}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    .line 461
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;

    const-string v3, "Accepted the solution"

    const/4 v8, 0x1

    move-object v2, v0

    invoke-direct/range {v2 .. v8}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;I)V

    .line 464
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 465
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object v1, v0, Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 467
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {v1, v0}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 470
    new-instance v1, Lcom/helpshift/conversation/activeconversation/ConversationManager$5;

    invoke-direct {v1, p0, v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager$5;-><init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    invoke-direct {p0, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendMessageWithAutoRetry(Lcom/helpshift/common/domain/F;)V

    .line 491
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 492
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    const-string v2, "id"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 493
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 494
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    const-string v1, "acid"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    :cond_0
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object p1

    sget-object v1, Lcom/helpshift/analytics/AnalyticsEventType;->RESOLUTION_ACCEPTED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {p1, v1, v0}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    .line 498
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object p1

    const-string v0, "User accepted the solution"

    invoke-virtual {p1, v0}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->userRepliedToConversation(Ljava/lang/String;)V

    return-void
.end method

.method public sendConversationEndedDelegate(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 1

    .line 1105
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isConversationEndedDelegateSent:Z

    if-nez v0, :cond_0

    .line 1107
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->conversationEnded()V

    const/4 v0, 0x1

    .line 1109
    iput-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isConversationEndedDelegateSent:Z

    .line 1110
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->updateConversationWithoutMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    :cond_0
    return-void
.end method

.method public sendConversationPostedEvent(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 3

    .line 2200
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 2201
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    const-string v2, "id"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2202
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2203
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    const-string v1, "acid"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2205
    :cond_0
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object p1

    sget-object v1, Lcom/helpshift/analytics/AnalyticsEventType;->CONVERSATION_POSTED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {p1, v1, v0}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    return-void
.end method

.method public sendMessageAddedEventOnPreissueCreation(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 3

    .line 2305
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 2306
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2307
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    const-string v2, "acid"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2312
    :cond_0
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {p1}, Lcom/helpshift/util/HSObservableList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 2313
    instance-of v1, v1, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;

    if-eqz v1, :cond_1

    const-string p1, "si"

    goto :goto_0

    :cond_2
    const-string p1, "txt"

    :goto_0
    const-string v1, "type"

    .line 2318
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2319
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object p1

    sget-object v1, Lcom/helpshift/analytics/AnalyticsEventType;->MESSAGE_ADDED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {p1, v1, v0}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    return-void
.end method

.method public sendOptionInputMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;Z)V
    .locals 10

    .line 2114
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object v0

    .line 2115
    iget-object v1, v0, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    .line 2116
    iget-object v0, v0, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    if-eqz p4, :cond_0

    .line 2120
    iget-object p3, p2, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    iget-object p3, p3, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->skipLabel:Ljava/lang/String;

    goto :goto_0

    .line 2124
    :cond_0
    iget-object p3, p3, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;->title:Ljava/lang/String;

    :goto_0
    move-object v3, p3

    .line 2127
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object p3, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v0, "mobile"

    const-string v1, ""

    invoke-direct {v7, v0, v1, p3}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    .line 2128
    new-instance p3, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;

    move-object v2, p3

    move-object v8, p2

    move v9, p4

    invoke-direct/range {v2 .. v9}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;Z)V

    .line 2132
    iget-object p4, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object p4, p3, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;->conversationLocalId:Ljava/lang/Long;

    const/4 p4, 0x1

    .line 2136
    invoke-virtual {p3, p4}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;->updateState(Z)V

    .line 2137
    invoke-direct {p0, p1, p3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addMessageToDbAndUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 2138
    invoke-direct {p0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->deleteOptionsForAdminMessageWithOptionsInput(Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;)V

    .line 2139
    invoke-direct {p0, p1, p3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendTextMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;)V

    return-void
.end method

.method public sendResolutionQuestionExpiryEvent(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 3

    .line 395
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "type"

    const-string v2, "reopen"

    .line 396
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getIssueId()Ljava/lang/String;

    move-result-object p1

    const-string v1, "id"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object p1

    sget-object v1, Lcom/helpshift/analytics/AnalyticsEventType;->TIMER_EXPIRED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {p1, v1, v0}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    return-void
.end method

.method public sendScreenshot(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/AttachmentPickerFile;Ljava/lang/String;)V
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    .line 1649
    iget-object v4, v0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v4}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object v4

    .line 1650
    iget-object v5, v4, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    move-object v8, v5

    check-cast v8, Ljava/lang/String;

    .line 1651
    iget-object v4, v4, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    .line 1652
    new-instance v11, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v4, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v5, "mobile"

    const-string v6, ""

    invoke-direct {v11, v5, v6, v4}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    .line 1653
    new-instance v4, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    const/4 v7, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object v6, v4

    invoke-direct/range {v6 .. v17}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 1662
    iget-object v5, v2, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->originalFileName:Ljava/lang/String;

    iput-object v5, v4, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->fileName:Ljava/lang/String;

    .line 1663
    iget-object v5, v2, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->filePath:Ljava/lang/String;

    iput-object v5, v4, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->filePath:Ljava/lang/String;

    .line 1664
    invoke-virtual {v4, v3}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->setRefersMessageId(Ljava/lang/String;)V

    .line 1665
    invoke-virtual/range {p0 .. p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->shouldEnableMessagesClick(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v5

    invoke-virtual {v4, v5}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->updateState(Z)V

    .line 1666
    iget-object v5, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object v5, v4, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 1667
    invoke-direct {v0, v1, v4}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addMessageToDbAndUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    const/4 v5, 0x1

    if-eqz v3, :cond_1

    .line 1669
    iget-object v6, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v6}, Lcom/helpshift/util/HSObservableList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1670
    iget-object v8, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    if-eqz v8, :cond_0

    iget-object v8, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    .line 1671
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    iget-object v8, v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v9, Lcom/helpshift/conversation/activeconversation/message/MessageType;->REQUESTED_SCREENSHOT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v8, v9, :cond_0

    .line 1673
    check-cast v7, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    .line 1675
    iget-object v3, v0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v7, v3, v5}, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->setIsAnswered(Lcom/helpshift/common/platform/Platform;Z)V

    .line 1680
    :cond_1
    iget-boolean v2, v2, Lcom/helpshift/conversation/dto/AttachmentPickerFile;->isFileCompressionAndCopyingDone:Z

    xor-int/2addr v2, v5

    invoke-direct {v0, v1, v4, v2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendScreenshotMessageInternal(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;Z)V

    return-void
.end method

.method public sendTextMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;)V
    .locals 8

    .line 1177
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object v0

    .line 1178
    iget-object v1, v0, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    .line 1179
    iget-object v0, v0, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 1180
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v1, "mobile"

    const-string v2, ""

    invoke-direct {v7, v1, v2, v0}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    .line 1181
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    move-object v2, v0

    move-object v3, p2

    invoke-direct/range {v2 .. v7}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V

    .line 1182
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object p2, v0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 1183
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->shouldEnableMessagesClick(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result p2

    invoke-virtual {v0, p2}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->updateState(Z)V

    .line 1186
    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addMessageToDbAndUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 1189
    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendTextMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;)V

    return-void
.end method

.method public sendTextMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;Z)V
    .locals 10

    .line 1222
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeForStorage(Lcom/helpshift/common/platform/Platform;)Lcom/helpshift/util/ValuePair;

    move-result-object v0

    .line 1223
    iget-object v1, v0, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    .line 1224
    iget-object v0, v0, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 1225
    new-instance v7, Lcom/helpshift/conversation/activeconversation/message/Author;

    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v1, "mobile"

    const-string v2, ""

    invoke-direct {v7, v1, v2, v0}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V

    .line 1226
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;

    move-object v2, v0

    move-object v3, p2

    move-object v8, p3

    move v9, p4

    invoke-direct/range {v2 .. v9}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;Z)V

    .line 1229
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object p2, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->conversationLocalId:Ljava/lang/Long;

    const/4 p2, 0x1

    .line 1233
    invoke-virtual {v0, p2}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->updateState(Z)V

    .line 1234
    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addMessageToDbAndUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 1235
    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendTextMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;)V

    return-void
.end method

.method public setEnableMessageClickOnResolutionRejected(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V
    .locals 1

    .line 1059
    iput-boolean p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->enableMessageClickOnResolutionRejected:Z

    .line 1060
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p2, v0, :cond_0

    .line 1061
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessagesOnIssueStatusUpdate(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    :cond_0
    return-void
.end method

.method public setShouldIncrementMessageCount(Lcom/helpshift/conversation/activeconversation/model/Conversation;ZZ)V
    .locals 1

    .line 1819
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldIncrementMessageCount:Z

    if-eq v0, p2, :cond_0

    .line 1820
    iput-boolean p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldIncrementMessageCount:Z

    if-eqz p3, :cond_0

    .line 1822
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {p2, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->updateConversationWithoutMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    :cond_0
    return-void
.end method

.method public setStartNewConversationButtonClicked(Lcom/helpshift/conversation/activeconversation/model/Conversation;ZZ)V
    .locals 0

    .line 1811
    iput-boolean p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isStartNewConversationClicked:Z

    if-eqz p3, :cond_0

    .line 1813
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {p2, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->updateConversationWithoutMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    :cond_0
    return-void
.end method

.method public shouldEnableMessagesClick(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z
    .locals 3

    .line 2324
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInBetweenBotExecution:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 2330
    :cond_0
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    .line 2333
    :cond_1
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, v2, :cond_3

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, v2, :cond_3

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_EXPIRED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, v2, :cond_3

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->ARCHIVED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, v2, :cond_3

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, v2, :cond_3

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->CLOSED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v2, :cond_2

    goto :goto_0

    .line 2341
    :cond_2
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v2, :cond_3

    .line 2342
    iget-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->enableMessageClickOnResolutionRejected:Z

    :cond_3
    :goto_0
    return v1
.end method

.method public shouldOpen(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z
    .locals 4

    .line 1960
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v1, "conversationalIssueFiling"

    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1961
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    .line 1962
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    .line 1969
    :cond_0
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    return v2

    .line 1974
    :cond_1
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 1976
    iget-boolean v3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    if-eqz v3, :cond_2

    goto :goto_4

    .line 1980
    :cond_2
    sget-object v3, Lcom/helpshift/conversation/dto/IssueState;->CLOSED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, v3, :cond_9

    sget-object v3, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v3, :cond_3

    goto :goto_2

    .line 1985
    :cond_3
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result v3

    if-eqz v3, :cond_4

    :goto_0
    const/4 v1, 0x1

    goto :goto_4

    .line 1988
    :cond_4
    sget-object v3, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, v3, :cond_8

    sget-object v3, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, v3, :cond_8

    sget-object v3, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_EXPIRED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v0, v3, :cond_8

    sget-object v3, Lcom/helpshift/conversation/dto/IssueState;->ARCHIVED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v3, :cond_5

    goto :goto_1

    .line 1994
    :cond_5
    sget-object v3, Lcom/helpshift/conversation/dto/IssueState;->REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v3, :cond_a

    .line 1999
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isStartNewConversationClicked:Z

    if-eqz v0, :cond_6

    goto :goto_4

    .line 2002
    :cond_6
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    if-nez v0, :cond_7

    goto :goto_0

    .line 2012
    :cond_7
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    .line 2013
    invoke-static {v0, p1}, Lcom/helpshift/conversation/ConversationUtil;->getUserMessageCountForConversationLocalId(Lcom/helpshift/conversation/dao/ConversationDAO;Ljava/lang/Long;)I

    move-result p1

    if-lez p1, :cond_a

    goto :goto_0

    .line 1992
    :cond_8
    :goto_1
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isStartNewConversationClicked:Z

    goto :goto_3

    .line 1983
    :cond_9
    :goto_2
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isStartNewConversationClicked:Z

    :goto_3
    xor-int/lit8 v1, p1, 0x1

    :cond_a
    :goto_4
    return v1
.end method

.method public shouldShowCSATInFooter(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z
    .locals 2

    .line 1066
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 1075
    :cond_0
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    sget-object v0, Lcom/helpshift/conversation/states/ConversationCSATState;->NONE:Lcom/helpshift/conversation/states/ConversationCSATState;

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v0, "customerSatisfactionSurvey"

    .line 1076
    invoke-virtual {p1, v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public updateAcceptedRequestForReopenMessageDMs(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 2

    .line 861
    instance-of v0, p2, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    if-eqz v0, :cond_0

    .line 862
    move-object v0, p2

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    .line 864
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->isAnswered()Z

    move-result v1

    if-nez v1, :cond_1

    .line 865
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->unansweredRequestForReopenMessageDMs:Ljava/util/Map;

    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    .line 866
    invoke-interface {p1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 869
    :cond_0
    instance-of v0, p2, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;

    if-eqz v0, :cond_1

    .line 870
    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;

    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->referredMessageId:Ljava/lang/String;

    .line 871
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->unansweredRequestForReopenMessageDMs:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 872
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->unansweredRequestForReopenMessageDMs:Ljava/util/Map;

    .line 873
    invoke-interface {p1, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    .line 874
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {p1, p2, v0}, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    const/4 p2, 0x1

    .line 875
    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->setAnsweredAndNotify(Z)V

    .line 876
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {p2, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public updateConversationExpiryProperties(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    .line 2436
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0, p1}, Lcom/helpshift/conversation/ConversationUtil;->isResolutionQuestionExpired(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2437
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->markConversationStateToResolutionExpired(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 2441
    :cond_1
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0, p1}, Lcom/helpshift/conversation/ConversationUtil;->isCSATTimerExpired(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2442
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->markConversationCSATStateToExpired(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    :cond_2
    return-void
.end method

.method public updateIsAutoFilledPreissueFlag(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V
    .locals 0

    .line 2369
    iput-boolean p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isAutoFilledPreIssue:Z

    .line 2370
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {p2, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->updateConversationWithoutMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-void
.end method

.method public updateIssueStatus(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/dto/IssueState;)V
    .locals 2

    .line 510
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, p2, :cond_0

    return-void

    .line 513
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Changing conversation status from: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", new status: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", for: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ConvManager"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 515
    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 517
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->refreshConversationOnIssueStateUpdate(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 520
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {p2, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->updateConversationWithoutMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 523
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->conversationDMListener:Lcom/helpshift/conversation/activeconversation/ConversationDMListener;

    if-eqz p2, :cond_1

    .line 524
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->conversationDMListener:Lcom/helpshift/conversation/activeconversation/ConversationDMListener;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    invoke-interface {p2, p1}, Lcom/helpshift/conversation/activeconversation/ConversationDMListener;->onIssueStatusChange(Lcom/helpshift/conversation/dto/IssueState;)V

    :cond_1
    return-void
.end method

.method public updateLastUserActivityTime(Lcom/helpshift/conversation/activeconversation/model/Conversation;J)V
    .locals 1

    .line 1828
    iput-wide p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->lastUserActivityTime:J

    .line 1829
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    .line 1830
    invoke-interface {v0, p1, p2, p3}, Lcom/helpshift/conversation/dao/ConversationDAO;->updateLastUserActivityTimeInConversation(Ljava/lang/Long;J)V

    return-void
.end method

.method public updateMessageDMs(Lcom/helpshift/conversation/activeconversation/model/Conversation;ZLjava/util/List;Lcom/helpshift/conversation/activeconversation/ConversationUpdate;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Z",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;",
            "Lcom/helpshift/conversation/activeconversation/ConversationUpdate;",
            ")V"
        }
    .end annotation

    if-nez p4, :cond_0

    .line 646
    new-instance p4, Lcom/helpshift/conversation/activeconversation/ConversationUpdate;

    invoke-direct {p4}, Lcom/helpshift/conversation/activeconversation/ConversationUpdate;-><init>()V

    .line 650
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 651
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 652
    invoke-direct {p0, p1, v0, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->populateMessageDMLookup(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/Map;Ljava/util/Map;)V

    .line 655
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 656
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 658
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 660
    invoke-direct {p0, v4, v0, v1, p4}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->getMessageDMForUpdate(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Ljava/util/Map;Ljava/util/Map;Lcom/helpshift/conversation/activeconversation/ConversationUpdate;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object v5

    if-eqz v5, :cond_7

    .line 664
    instance-of v6, v5, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    if-eqz v6, :cond_1

    .line 665
    invoke-virtual {v5, v4}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 666
    move-object v4, v5

    check-cast v4, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    sget-object v6, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {v4, v6}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    goto :goto_2

    .line 668
    :cond_1
    instance-of v6, v5, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    if-eqz v6, :cond_2

    .line 669
    invoke-virtual {v5, v4}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 670
    move-object v4, v5

    check-cast v4, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    sget-object v6, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {v4, v6}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    .line 672
    iget-boolean v4, v5, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isRedacted:Z

    if-eqz v4, :cond_6

    .line 673
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 676
    :cond_2
    instance-of v6, v5, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    if-eqz v6, :cond_3

    .line 677
    invoke-virtual {v5, v4}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 678
    move-object v4, v5

    check-cast v4, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    sget-object v6, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    .line 679
    invoke-virtual {v4, v6}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    .line 681
    iget-boolean v4, v5, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isRedacted:Z

    if-eqz v4, :cond_6

    .line 682
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 685
    :cond_3
    instance-of v6, v5, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;

    if-nez v6, :cond_5

    instance-of v6, v5, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    if-eqz v6, :cond_4

    goto :goto_1

    .line 694
    :cond_4
    invoke-virtual {v5, v4}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->mergeAndNotify(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    goto :goto_2

    .line 687
    :cond_5
    :goto_1
    invoke-virtual {v5, v4}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->mergeAndNotify(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 689
    iget-boolean v4, v5, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isRedacted:Z

    if-eqz v4, :cond_6

    .line 690
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 696
    :cond_6
    :goto_2
    iget-object v4, p4, Lcom/helpshift/conversation/activeconversation/ConversationUpdate;->updatedMessageDMs:Ljava/util/List;

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 701
    :cond_7
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 706
    :cond_8
    invoke-virtual {p0, v3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->clearRedactedAttachmentsResources(Ljava/util/List;)V

    .line 709
    invoke-static {v2}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result p3

    if-eqz p3, :cond_9

    return-void

    .line 714
    :cond_9
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_3
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 715
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v0, v1, v3}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 716
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object v1, v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 727
    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    if-eqz v1, :cond_a

    .line 728
    move-object v1, v0

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    sget-object v3, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {v1, v3}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    goto :goto_4

    .line 730
    :cond_a
    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    if-eqz v1, :cond_b

    .line 731
    move-object v1, v0

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    sget-object v3, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {v1, v3}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    goto :goto_4

    .line 733
    :cond_b
    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    if-eqz v1, :cond_c

    .line 734
    move-object v1, v0

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    sget-object v3, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {v1, v3}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    .line 738
    :cond_c
    :goto_4
    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->addObserver(Ljava/util/Observer;)V

    goto :goto_3

    :cond_d
    if-eqz p2, :cond_10

    .line 743
    invoke-static {v2}, Lcom/helpshift/conversation/ConversationUtil;->sortMessagesBasedOnCreatedAt(Ljava/util/List;)V

    .line 744
    iget-boolean p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInBetweenBotExecution:Z

    .line 745
    invoke-virtual {p0, v2, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->evaluateBotExecutionState(Ljava/util/List;Z)Z

    move-result p2

    iput-boolean p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInBetweenBotExecution:Z

    .line 748
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {p2, v2}, Lcom/helpshift/util/HSObservableList;->addAll(Ljava/util/Collection;)Z

    .line 752
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_5
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_11

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 754
    instance-of v0, p3, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;

    if-eqz v0, :cond_e

    .line 755
    move-object v0, p3

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v0, v1}, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;->downloadThumbnailImage(Lcom/helpshift/common/platform/Platform;)V

    .line 757
    :cond_e
    instance-of v0, p3, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    if-eqz v0, :cond_f

    .line 758
    move-object v0, p3

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v0, v1}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->downloadImage(Lcom/helpshift/common/platform/Platform;)V

    .line 760
    :cond_f
    invoke-virtual {p0, p1, p3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateAcceptedRequestForReopenMessageDMs(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    goto :goto_5

    .line 764
    :cond_10
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {p2, v2}, Lcom/helpshift/util/HSObservableList;->addAll(Ljava/util/Collection;)Z

    .line 768
    :cond_11
    iget-object p2, p4, Lcom/helpshift/conversation/activeconversation/ConversationUpdate;->newMessageDMs:Ljava/util/List;

    invoke-interface {p2, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 769
    invoke-virtual {p0, p1, v2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->evaluateBotControlMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/Collection;)V

    return-void
.end method

.method updateMessageOnConversationUpdate(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Z)V
    .locals 0

    .line 322
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessageClickableState(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Z)V

    .line 323
    instance-of p2, p1, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    if-eqz p2, :cond_0

    .line 324
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    .line 325
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->checkAndReDownloadImageIfNotExist(Lcom/helpshift/common/platform/Platform;)V

    :cond_0
    return-void
.end method

.method public updateMessagesClickOnBotSwitch(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V
    .locals 1

    .line 2150
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {p1}, Lcom/helpshift/util/HSObservableList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 2151
    invoke-direct {p0, v0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessageClickableState(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Z)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public updateMessagesOnIssueStatusUpdate(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 2

    .line 313
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->shouldEnableMessagesClick(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v0

    .line 314
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {p1}, Lcom/helpshift/util/HSObservableList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 315
    invoke-virtual {p0, v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessageOnConversationUpdate(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Z)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public updateSmartIntentData(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 2375
    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentTreeId:Ljava/lang/String;

    .line 2376
    iput-object p3, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentIds:Ljava/util/List;

    .line 2377
    iput-object p4, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentUserQuery:Ljava/lang/String;

    .line 2378
    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager;->conversationDAO:Lcom/helpshift/conversation/dao/ConversationDAO;

    invoke-interface {p2, p1}, Lcom/helpshift/conversation/dao/ConversationDAO;->updateConversationWithoutMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-void
.end method

.method public updateStateBasedOnMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 3

    .line 2349
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v1, :cond_3

    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    if-nez v0, :cond_3

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    if-eqz v0, :cond_3

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    .line 2350
    invoke-virtual {v0}, Lcom/helpshift/util/HSObservableList;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 2351
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v0}, Lcom/helpshift/util/HSObservableList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    :goto_0
    if-ltz v0, :cond_1

    .line 2353
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    .line 2355
    invoke-virtual {v1, v0}, Lcom/helpshift/util/HSObservableList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    instance-of v2, v1, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;

    if-nez v2, :cond_0

    instance-of v2, v1, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    if-eqz v2, :cond_1

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 2359
    :cond_1
    instance-of v0, v1, Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;

    if-eqz v0, :cond_2

    .line 2360
    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    goto :goto_1

    .line 2362
    :cond_2
    instance-of v0, v1, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;

    if-eqz v0, :cond_3

    .line 2363
    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    :cond_3
    :goto_1
    return-void
.end method
