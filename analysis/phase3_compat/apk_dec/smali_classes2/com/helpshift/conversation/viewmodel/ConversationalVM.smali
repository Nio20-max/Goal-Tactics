.class public Lcom/helpshift/conversation/viewmodel/ConversationalVM;
.super Ljava/lang/Object;
.source "ConversationalVM.java"

# interfaces
.implements Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;
.implements Lcom/helpshift/conversation/viewmodel/ListPickerVMCallback;
.implements Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;
.implements Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;
.implements Lcom/helpshift/account/AuthenticationFailureDM$AuthenticationFailureObserver;
.implements Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;


# static fields
.field public static final CREATE_NEW_PRE_ISSUE:Ljava/lang/String; = "create_new_pre_issue"

.field public static final NO_NETWORK_ERROR:I = 0x1

.field public static final POLL_FAILURE_ERROR:I = 0x2

.field private static final TAG:Ljava/lang/String; = "Helpshift_ConvsatnlVM"


# instance fields
.field attachImageButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

.field awaitingUserInputForBotStep:Z

.field private botMessageDM:Lcom/helpshift/conversation/activeconversation/message/MessageDM;

.field confirmationBoxViewState:Lcom/helpshift/widget/MutableBaseViewState;

.field final conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

.field conversationFooterViewState:Lcom/helpshift/widget/MutableConversationFooterViewState;

.field conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

.field domain:Lcom/helpshift/common/domain/Domain;

.field historyLoadingViewState:Lcom/helpshift/widget/MutableHistoryLoadingViewState;

.field protected isConversationRejected:Z

.field isInBetweenBotExecution:Z

.field isNetworkAvailable:Z

.field private isScreenCurrentlyVisible:Z

.field isShowingPollFailureError:Z

.field isUserReplyDraftClearedForBotChange:Z

.field private lastCSATRequestedEventId:Ljava/lang/String;

.field private lastCSATStartRatingEventId:Ljava/lang/String;

.field private listPickerVM:Lcom/helpshift/conversation/viewmodel/ListPickerVM;

.field messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

.field messageToAvatarTriggeredMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field platform:Lcom/helpshift/common/platform/Platform;

.field renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

.field replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

.field replyButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

.field replyFieldViewState:Lcom/helpshift/widget/MutableReplyFieldViewState;

.field private retainMessageBoxOnUI:Z

.field scrollJumperViewState:Lcom/helpshift/widget/MutableScrollJumperViewState;

.field final sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

.field private showConversationHistory:Z

.field private smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

.field private smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

.field public final viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

.field widgetGateway:Lcom/helpshift/widget/WidgetGateway;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/conversation/domainmodel/ConversationController;Lcom/helpshift/conversation/activeconversation/ViewableConversation;Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;ZZ)V
    .locals 8

    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 130
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isNetworkAvailable:Z

    .line 179
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageToAvatarTriggeredMap:Ljava/util/Map;

    const-string v0, ""

    .line 181
    iput-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->lastCSATStartRatingEventId:Ljava/lang/String;

    .line 182
    iput-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->lastCSATRequestedEventId:Ljava/lang/String;

    .line 188
    iput-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    .line 189
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 190
    iput-object p3, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    .line 191
    iput-object p4, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    .line 192
    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    .line 193
    iput-boolean p7, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->retainMessageBoxOnUI:Z

    .line 194
    iget-object p7, p3, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iput-object p7, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    .line 195
    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object p7

    invoke-virtual {p7, p0}, Lcom/helpshift/account/AuthenticationFailureDM;->registerListener(Lcom/helpshift/account/AuthenticationFailureDM$AuthenticationFailureObserver;)V

    .line 197
    new-instance p7, Lcom/helpshift/widget/WidgetGateway;

    invoke-direct {p7, v0, p3}, Lcom/helpshift/widget/WidgetGateway;-><init>(Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;Lcom/helpshift/conversation/domainmodel/ConversationController;)V

    iput-object p7, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->widgetGateway:Lcom/helpshift/widget/WidgetGateway;

    .line 198
    invoke-virtual {p4}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p7

    .line 201
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v0, p7}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateConversationExpiryProperties(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 204
    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserManagerDM;->getActiveUser()Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object v5

    .line 205
    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getSmartIntentDM()Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    move-result-object v4

    iput-object v4, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    .line 206
    new-instance v0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    move-object v1, v0

    move-object v2, p1

    move-object v3, p2

    move-object v6, p7

    move-object v7, p0

    invoke-direct/range {v1 .. v7}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;)V

    iput-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    .line 209
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->widgetGateway:Lcom/helpshift/widget/WidgetGateway;

    invoke-virtual {p1}, Lcom/helpshift/widget/WidgetGateway;->makeReplyFieldViewState()Lcom/helpshift/widget/MutableReplyFieldViewState;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyFieldViewState:Lcom/helpshift/widget/MutableReplyFieldViewState;

    .line 210
    new-instance p1, Lcom/helpshift/widget/MutableHistoryLoadingViewState;

    invoke-direct {p1}, Lcom/helpshift/widget/MutableHistoryLoadingViewState;-><init>()V

    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->historyLoadingViewState:Lcom/helpshift/widget/MutableHistoryLoadingViewState;

    .line 211
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->widgetGateway:Lcom/helpshift/widget/WidgetGateway;

    invoke-virtual {p1}, Lcom/helpshift/widget/WidgetGateway;->makeScrollJumperViewState()Lcom/helpshift/widget/MutableScrollJumperViewState;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->scrollJumperViewState:Lcom/helpshift/widget/MutableScrollJumperViewState;

    .line 212
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->shouldShowReplyBoxOnConversationRejected()Z

    move-result p1

    .line 213
    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    .line 214
    invoke-virtual {p2, p7, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->setEnableMessageClickOnResolutionRejected(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    .line 215
    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->widgetGateway:Lcom/helpshift/widget/WidgetGateway;

    .line 216
    invoke-virtual {p2, p7, p1}, Lcom/helpshift/widget/WidgetGateway;->makeConversationFooterViewState(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)Lcom/helpshift/widget/MutableConversationFooterViewState;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationFooterViewState:Lcom/helpshift/widget/MutableConversationFooterViewState;

    .line 220
    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->widgetGateway:Lcom/helpshift/widget/WidgetGateway;

    .line 221
    invoke-virtual {p4}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/helpshift/widget/WidgetGateway;->makeAttachImageButtonViewState(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/widget/MutableBaseViewState;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->attachImageButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    .line 223
    new-instance p2, Lcom/helpshift/widget/MutableBaseViewState;

    invoke-direct {p2}, Lcom/helpshift/widget/MutableBaseViewState;-><init>()V

    iput-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    .line 225
    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->widgetGateway:Lcom/helpshift/widget/WidgetGateway;

    .line 226
    invoke-virtual {p2, p7, p1}, Lcom/helpshift/widget/WidgetGateway;->makeReplyBoxViewState(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)Lcom/helpshift/widget/MutableReplyBoxViewState;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    .line 228
    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->widgetGateway:Lcom/helpshift/widget/WidgetGateway;

    invoke-virtual {p2, p7}, Lcom/helpshift/widget/WidgetGateway;->makeConfirmationBoxViewState(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/widget/MutableBaseViewState;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->confirmationBoxViewState:Lcom/helpshift/widget/MutableBaseViewState;

    .line 231
    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    invoke-virtual {p2}, Lcom/helpshift/widget/MutableReplyBoxViewState;->isVisible()Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, 0x2

    goto :goto_0

    :cond_0
    const/4 p2, -0x1

    .line 232
    :goto_0
    invoke-virtual {p3, p2}, Lcom/helpshift/conversation/domainmodel/ConversationController;->setConversationViewState(I)V

    if-nez p1, :cond_1

    .line 234
    iget-object p1, p7, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object p2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p1, p2, :cond_1

    .line 236
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p1, p7}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->handleConversationEnded(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 240
    :cond_1
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->retryFallbackAvatarImageDownload()V

    .line 243
    invoke-virtual {p4, p0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->setConversationVMCallback(Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;)V

    .line 246
    iput-object p5, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    .line 249
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p1, p4}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->removeFeedbackMessagesFromConversations(Lcom/helpshift/conversation/activeconversation/ViewableConversation;)V

    .line 251
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->initMessagesList()V

    .line 252
    iput-boolean p6, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showConversationHistory:Z

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Lcom/helpshift/common/exception/RootAPIException;)V
    .locals 0

    .line 122
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showErrorForNoNetwork(Lcom/helpshift/common/exception/RootAPIException;)V

    return-void
.end method

.method static synthetic access$100(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V
    .locals 0

    .line 122
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateUserInputState()V

    return-void
.end method

.method static synthetic access$200(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 0

    .line 122
    iget-object p0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->botMessageDM:Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    return-object p0
.end method

.method static synthetic access$300(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;)V
    .locals 0

    .line 122
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showOptions(Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;)V

    return-void
.end method

.method static synthetic access$400(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)Lcom/helpshift/conversation/viewmodel/ListPickerVM;
    .locals 0

    .line 122
    iget-object p0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->listPickerVM:Lcom/helpshift/conversation/viewmodel/ListPickerVM;

    return-object p0
.end method

.method static synthetic access$500(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V
    .locals 0

    .line 122
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateReplyBoxVisibility()V

    return-void
.end method

.method private addPreIssueFirstUserMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 739
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->clearUserReplyDraft()V

    .line 742
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->disableUserInputOptions()V

    .line 744
    invoke-static {p3}, Lcom/helpshift/util/ListUtils;->isNotEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 745
    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p2, p1, p3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addPreissueFirstUserMessageViaSmartIntent(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/util/List;)V

    goto :goto_0

    .line 749
    :cond_0
    iget-object p3, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p3, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->addPreissueFirstUserMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private clearNotifications()V
    .locals 2

    .line 2075
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 2076
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->clearNotification(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 2077
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->resetPushNotificationCount(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-void
.end method

.method private createOptionsBotMessage(Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;)Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 1640
    :cond_0
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;

    invoke-direct {v0, p1}, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;)V

    .line 1641
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v0, p1, v1}, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    return-object v0
.end method

.method private createOptionsBotMessage(Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;)Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 1649
    :cond_0
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;

    invoke-direct {v0, p1}, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;)V

    .line 1650
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v0, p1, v1}, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    return-object v0
.end method

.method private createOptionsBotMessage(Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;)Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 1631
    :cond_0
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;

    invoke-direct {v0, p1}, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;)V

    .line 1632
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v0, p1, v1}, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    return-object v0
.end method

.method private createPreIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 778
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateLastUserActivityTime()V

    .line 780
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v1, "conversationGreetingMessage"

    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 781
    iget-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isNetworkAvailable:Z

    if-nez v0, :cond_0

    .line 782
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "No internet connection."

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->onCreateConversationFailure(Ljava/lang/Exception;)V

    return-void

    .line 786
    :cond_0
    invoke-static {p3}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 788
    iget-object p3, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {p3, p1, v4, p2, p0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->createPreIssueViaConversationalFlow(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;)V

    goto :goto_0

    .line 792
    :cond_1
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    move-object v3, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p0

    invoke-virtual/range {v2 .. v7}, Lcom/helpshift/conversation/domainmodel/ConversationController;->createPreIssueViaSmartIntent(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/domainmodel/ConversationController$StartNewConversationListener;)V

    :goto_0
    return-void
.end method

.method private createPreIssueViaSmartIntent(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const-string v0, "Helpshift_ConvsatnlVM"

    const-string v1, "Trigger preissue creation via Smart intent"

    .line 755
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 756
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 757
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0, p1, p2, p4}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateSmartIntentData(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    .line 758
    invoke-direct {p0, v0, p4, p3}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->addPreIssueFirstUserMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/util/List;)V

    .line 759
    invoke-direct {p0, v0, p4, p3}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->createPreIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method private disableUserInputOptions()V
    .locals 2

    .line 1228
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    if-eqz v0, :cond_0

    .line 1229
    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->hideKeyboard()V

    .line 1233
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->attachImageButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    .line 1236
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->disableUserTextInput()V

    return-void
.end method

.method private disableUserTextInput()V
    .locals 2

    .line 1308
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableReplyBoxViewState;->setVisible(Z)V

    return-void
.end method

.method private evaluateBotMessages(Ljava/util/Collection;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    .line 1247
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 1248
    iget-boolean v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isInBetweenBotExecution:Z

    .line 1249
    invoke-direct {p0, p1, v1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->processMessagesForBots(Ljava/util/Collection;Z)Ljava/util/List;

    move-result-object p1

    .line 1251
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v2

    if-nez v2, :cond_1

    if-eqz v1, :cond_0

    .line 1254
    iget-boolean v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isInBetweenBotExecution:Z

    if-nez v2, :cond_0

    .line 1256
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    .line 1258
    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->shouldEnableMessagesClick(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v2

    .line 1256
    invoke-virtual {v1, v0, v2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessagesClickOnBotSwitch(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    .line 1259
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->removeOptionsMessageFromUI()V

    .line 1263
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->removeCSATBotFromUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 1265
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1272
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    invoke-virtual {v0}, Lcom/helpshift/widget/MutableReplyBoxViewState;->setStandardTextInput()V

    .line 1273
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$15;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$15;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    goto :goto_0

    .line 1287
    :cond_0
    iget-boolean v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isInBetweenBotExecution:Z

    if-eqz v2, :cond_1

    if-nez v1, :cond_1

    .line 1294
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessagesClickOnBotSwitch(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    .line 1299
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateUserInputState()V

    return-object p1
.end method

.method private generateSystemRedactedConversationMessageDM(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;
    .locals 5

    .line 472
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;

    .line 473
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getCreatedAt()Ljava/lang/String;

    move-result-object v1

    .line 474
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->getEpochCreatedAtTime()J

    move-result-wide v2

    const/4 v4, 0x1

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;-><init>(Ljava/lang/String;JI)V

    .line 476
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 477
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iput-object p1, v0, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;->conversationLocalId:Ljava/lang/Long;

    return-object v0
.end method

.method private getUIMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/util/List;
    .locals 2
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

    .line 482
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 487
    iget-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    if-eqz v1, :cond_0

    .line 488
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->generateSystemRedactedConversationMessageDM(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 491
    :cond_0
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->buildUIMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :goto_0
    return-object v0
.end method

.method private getUIMessagesForHistory(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/util/List;
    .locals 2
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

    .line 1783
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1788
    iget-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    if-eqz v1, :cond_0

    .line 1789
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->generateSystemRedactedConversationMessageDM(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1792
    :cond_0
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :goto_0
    return-object v0
.end method

.method private hideListPicker(Z)V
    .locals 2

    .line 1209
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$14;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$14;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Z)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method private incrementCreatedAt(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;J)V
    .locals 3

    .line 1656
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v1

    add-long/2addr v1, p3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 1657
    sget-object p2, Lcom/helpshift/common/util/HSDateFormatSpec;->STORAGE_TIME_FORMAT:Lcom/helpshift/util/HSSimpleDateFormat;

    invoke-virtual {p2, v0}, Lcom/helpshift/util/HSSimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p2

    .line 1658
    invoke-static {p2}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide p3

    .line 1659
    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->setCreatedAt(Ljava/lang/String;)V

    .line 1660
    invoke-virtual {p1, p3, p4}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->setEpochCreatedAtTime(J)V

    return-void
.end method

.method private loadHistoryMessagesInternal()V
    .locals 2

    .line 2251
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->historyLoadingViewState:Lcom/helpshift/widget/MutableHistoryLoadingViewState;

    invoke-virtual {v0}, Lcom/helpshift/widget/MutableHistoryLoadingViewState;->getState()Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;

    move-result-object v0

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;->LOADING:Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;

    if-ne v0, v1, :cond_0

    return-void

    .line 2256
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$26;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$26;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method private markMessagesAsSeenOnEntry()V
    .locals 3

    .line 347
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 348
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->isSynced(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 356
    :cond_0
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v2, Lcom/helpshift/conversation/viewmodel/ConversationalVM$2;

    invoke-direct {v2, p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$2;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    invoke-virtual {v1, v2}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method private markMessagesAsSeenOnExit()V
    .locals 3

    .line 319
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getAllConversations()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 322
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v1

    .line 323
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v2, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->isSynced(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 324
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 330
    :cond_0
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v2, Lcom/helpshift/conversation/viewmodel/ConversationalVM$1;

    invoke-direct {v2, p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$1;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Ljava/util/List;)V

    invoke-virtual {v1, v2}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method private notifyRendererForScrollToBottom()V
    .locals 2

    .line 2289
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$27;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$27;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method private processMessagesForBots(Ljava/util/Collection;Z)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;Z)",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    .line 513
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 515
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object p1

    .line 517
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    .line 518
    invoke-virtual {v1, v0, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->evaluateBotExecutionState(Ljava/util/List;Z)Z

    move-result p2

    iput-boolean p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isInBetweenBotExecution:Z

    const/4 v1, 0x0

    if-eqz p2, :cond_8

    .line 525
    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p2, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->getLatestUnansweredBotMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object p1

    .line 526
    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->botMessageDM:Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    const/4 v2, 0x1

    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    .line 531
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    iget-object v3, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->serverId:Ljava/lang/String;

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 532
    iput-boolean v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->awaitingUserInputForBotStep:Z

    return-object v0

    :cond_0
    if-eqz p1, :cond_5

    .line 537
    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v3, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_TEXT_WITH_OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-eq p2, v3, :cond_1

    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v3, Lcom/helpshift/conversation/activeconversation/message/MessageType;->FAQ_LIST_WITH_OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-eq p2, v3, :cond_1

    iget-object p2, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v3, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_RESOLUTION_QUESTION_MESSAGE:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne p2, v3, :cond_5

    .line 544
    :cond_1
    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p2

    const/4 v3, -0x1

    if-eq p2, v3, :cond_6

    .line 550
    iget-object v3, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v4, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_TEXT_WITH_OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v3, v4, :cond_2

    .line 551
    move-object v3, p1

    check-cast v3, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;

    .line 552
    invoke-direct {p0, v3}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->createOptionsBotMessage(Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;)Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;

    move-result-object v4

    .line 556
    iget v3, v3, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->attachmentCount:I

    add-int/2addr v3, v2

    int-to-long v5, v3

    invoke-direct {p0, v4, p1, v5, v6}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->incrementCreatedAt(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;J)V

    goto :goto_0

    .line 558
    :cond_2
    iget-object v3, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v4, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_RESOLUTION_QUESTION_MESSAGE:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v3, v4, :cond_3

    .line 559
    move-object v3, p1

    check-cast v3, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;

    .line 561
    invoke-direct {p0, v3}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->createOptionsBotMessage(Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;)Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;

    move-result-object v4

    .line 565
    iget v3, v3, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;->attachmentCount:I

    add-int/2addr v3, v2

    int-to-long v5, v3

    invoke-direct {p0, v4, p1, v5, v6}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->incrementCreatedAt(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;J)V

    goto :goto_0

    .line 568
    :cond_3
    move-object v3, p1

    check-cast v3, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;

    invoke-direct {p0, v3}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->createOptionsBotMessage(Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;)Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;

    move-result-object v4

    const-wide/16 v5, 0x1

    .line 571
    invoke-direct {p0, v4, p1, v5, v6}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->incrementCreatedAt(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;J)V

    .line 576
    :goto_0
    iget-object v3, v4, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    iget-object v3, v3, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->type:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    sget-object v5, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;->PILL:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    if-ne v3, v5, :cond_4

    add-int/2addr p2, v2

    .line 577
    invoke-interface {v0, p2, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 579
    :cond_4
    iput-object v4, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->botMessageDM:Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    goto :goto_1

    .line 583
    :cond_5
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->botMessageDM:Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    :cond_6
    :goto_1
    if-eqz p1, :cond_7

    .line 588
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->removeOptionsMessageFromUI()V

    .line 589
    iput-boolean v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->awaitingUserInputForBotStep:Z

    goto :goto_2

    .line 592
    :cond_7
    iput-boolean v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->awaitingUserInputForBotStep:Z

    goto :goto_2

    .line 596
    :cond_8
    iput-boolean v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->awaitingUserInputForBotStep:Z

    :goto_2
    return-object v0
.end method

.method private pushAnalyticsEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/analytics/AnalyticsEventType;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 2085
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    return-void
.end method

.method private removeCSATBotFromUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 4

    .line 627
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    if-eqz v0, :cond_3

    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    if-nez p1, :cond_0

    goto :goto_1

    .line 631
    :cond_0
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    invoke-virtual {p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->copyOfUIMessageDMs()Ljava/util/List;

    move-result-object p1

    .line 632
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 633
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 634
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 635
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v3, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_CSAT_MESSAGE:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v2, v3, :cond_1

    .line 636
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 639
    :cond_2
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    invoke-virtual {p1, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->remove(Ljava/util/List;)V

    :cond_3
    :goto_1
    return-void
.end method

.method private removeOptionsMessageFromUI()V
    .locals 5

    .line 604
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    if-nez v0, :cond_0

    return-void

    .line 608
    :cond_0
    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->copyOfUIMessageDMs()Ljava/util/List;

    move-result-object v0

    .line 609
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 610
    invoke-static {v0}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 611
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

    .line 612
    iget-object v3, v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v4, Lcom/helpshift/conversation/activeconversation/message/MessageType;->OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v3, v4, :cond_1

    .line 613
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 616
    :cond_2
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    invoke-virtual {v0, v1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->remove(Ljava/util/List;)V

    :cond_3
    const/4 v0, 0x0

    .line 623
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->hideListPicker(Z)V

    return-void
.end method

.method private resetIncrementMessageCountFlag()V
    .locals 4

    .line 2081
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->setShouldIncrementMessageCount(Lcom/helpshift/conversation/activeconversation/model/Conversation;ZZ)V

    return-void
.end method

.method private retryFallbackAvatarImageDownload()V
    .locals 2

    .line 2532
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$30;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$30;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method private sendCSATEvent(Lcom/helpshift/analytics/AnalyticsEventType;)V
    .locals 3

    .line 2010
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 2011
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    if-eqz v0, :cond_0

    .line 2012
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2013
    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    const-string v2, "acid"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2015
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object v0

    invoke-virtual {v0, p1, v1}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    return-void
.end method

.method private sendNormalTextMessage(Ljava/lang/String;)V
    .locals 2

    .line 898
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->clearReply()V

    .line 899
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$7;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$7;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method private setScreenVisibility(Z)V
    .locals 0

    .line 309
    iput-boolean p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isScreenCurrentlyVisible:Z

    return-void
.end method

.method private setUserCanReadMessages(Z)V
    .locals 1

    .line 313
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->setUserCanReadMessages(Z)V

    .line 314
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->isAgentTyping()Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->onAgentTypingUpdate(Z)V

    return-void
.end method

.method private shouldShowReplyBoxOnConversationRejected()Z
    .locals 1

    .line 2004
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getUserReplyText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    .line 2005
    invoke-virtual {v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->shouldPersistMessageBox()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->retainMessageBoxOnUI:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private showConfirmationBox()V
    .locals 2

    .line 2311
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableReplyBoxViewState;->setVisible(Z)V

    .line 2312
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateAttachmentButtonViewState()V

    .line 2313
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->confirmationBoxViewState:Lcom/helpshift/widget/MutableBaseViewState;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    .line 2314
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationFooterViewState:Lcom/helpshift/widget/MutableConversationFooterViewState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->NONE:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableConversationFooterViewState;->setState(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V

    return-void
.end method

.method private showErrorForNoNetwork(Lcom/helpshift/common/exception/RootAPIException;)V
    .locals 1

    .line 973
    iget-object p1, p1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    instance-of p1, p1, Lcom/helpshift/common/exception/NetworkException;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->isOnline()Z

    move-result p1

    if-nez p1, :cond_0

    .line 974
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v0, Lcom/helpshift/conversation/viewmodel/ConversationalVM$9;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$9;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {p1, v0}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    :cond_0
    return-void
.end method

.method private showListPicker(Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;)V
    .locals 2

    .line 1745
    new-instance v0, Lcom/helpshift/conversation/viewmodel/ListPickerVM;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-direct {v0, v1, p1, p0}, Lcom/helpshift/conversation/viewmodel/ListPickerVM;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;Lcom/helpshift/conversation/viewmodel/ListPickerVMCallback;)V

    iput-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->listPickerVM:Lcom/helpshift/conversation/viewmodel/ListPickerVM;

    .line 1746
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$23;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$23;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method private showMessageBox()V
    .locals 2

    .line 2304
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableReplyBoxViewState;->setVisible(Z)V

    .line 2305
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateAttachmentButtonViewState()V

    .line 2306
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->confirmationBoxViewState:Lcom/helpshift/widget/MutableBaseViewState;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    .line 2307
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationFooterViewState:Lcom/helpshift/widget/MutableConversationFooterViewState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->NONE:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableConversationFooterViewState;->setState(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V

    return-void
.end method

.method private showOptions(Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;)V
    .locals 2

    .line 1720
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->type:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;->PILL:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    if-ne v0, v1, :cond_0

    .line 1721
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->showOptionInput(Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;)V

    goto :goto_0

    .line 1724
    :cond_0
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showListPicker(Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;)V

    :goto_0
    return-void
.end method

.method private showUnreadMessagesIndicator()V
    .locals 2

    .line 2173
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->scrollJumperViewState:Lcom/helpshift/widget/MutableScrollJumperViewState;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableScrollJumperViewState;->setShouldShowUnreadMessagesIndicator(Z)V

    return-void
.end method

.method private updateAttachmentButtonViewState()V
    .locals 2

    .line 2318
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->resetDefaultMenuItemsVisibility()V

    .line 2320
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->attachImageButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    invoke-virtual {v0}, Lcom/helpshift/widget/MutableBaseViewState;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2321
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->attachImageButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    iget-boolean v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isConversationRejected:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    invoke-virtual {v1}, Lcom/helpshift/widget/MutableReplyBoxViewState;->isVisible()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    :cond_1
    return-void
.end method

.method private updateReplyBoxVisibility()V
    .locals 4

    .line 1672
    iget-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isInBetweenBotExecution:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    .line 1675
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->botMessageDM:Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    if-nez v0, :cond_0

    .line 1676
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableReplyBoxViewState;->setVisible(Z)V

    return-void

    .line 1679
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 1680
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    invoke-static {v2}, Lcom/helpshift/conversation/ConversationUtil;->isInProgressState(Lcom/helpshift/conversation/dto/IssueState;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v3, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v2, v3, :cond_6

    iget-boolean v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    if-eqz v0, :cond_6

    .line 1683
    :cond_1
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->botMessageDM:Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_TEXT_WITH_TEXT_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v0, v2, :cond_2

    .line 1684
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->botMessageDM:Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    .line 1685
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    invoke-virtual {v1, v0}, Lcom/helpshift/widget/MutableReplyBoxViewState;->setInput(Lcom/helpshift/conversation/activeconversation/message/input/Input;)V

    goto :goto_0

    .line 1687
    :cond_2
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->botMessageDM:Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/MessageType;->OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v0, v2, :cond_3

    .line 1689
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$22;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$22;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    goto :goto_0

    .line 1702
    :cond_3
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->botMessageDM:Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_CSAT_MESSAGE:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v0, v2, :cond_6

    .line 1703
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableReplyBoxViewState;->setVisible(Z)V

    goto :goto_0

    .line 1710
    :cond_4
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    invoke-virtual {v0}, Lcom/helpshift/widget/MutableReplyBoxViewState;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1711
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    invoke-virtual {v0}, Lcom/helpshift/widget/MutableReplyBoxViewState;->setStandardTextInput()V

    .line 1715
    :cond_5
    invoke-direct {p0, v1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->hideListPicker(Z)V

    :cond_6
    :goto_0
    return-void
.end method

.method private updateUserInputState()V
    .locals 5

    .line 1316
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 1318
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    .line 1319
    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ne v1, v2, :cond_1

    .line 1322
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->disableUserInputOptions()V

    :cond_0
    :goto_0
    const/4 v3, 0x0

    goto/16 :goto_2

    .line 1324
    :cond_1
    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v1, v2, :cond_2

    iget-boolean v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    if-eqz v2, :cond_0

    :cond_2
    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v1, v2, :cond_0

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->COMPLETED_ISSUE_CREATED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v1, v2, :cond_3

    goto :goto_0

    .line 1329
    :cond_3
    iget-boolean v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isInBetweenBotExecution:Z

    if-nez v2, :cond_6

    iget-boolean v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    if-eqz v2, :cond_4

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v1, v2, :cond_4

    goto :goto_1

    .line 1360
    :cond_4
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 1363
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->disableUserInputOptions()V

    goto :goto_2

    .line 1367
    :cond_5
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->shouldShowSmartIntentFakeTypingIndicator()Z

    move-result v3

    goto :goto_2

    .line 1332
    :cond_6
    :goto_1
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->attachImageButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    invoke-virtual {v1, v4}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    .line 1334
    iget-boolean v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->awaitingUserInputForBotStep:Z

    if-eqz v1, :cond_7

    goto :goto_0

    .line 1340
    :cond_7
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->disableUserInputOptions()V

    .line 1346
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    if-eqz v1, :cond_9

    .line 1348
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v1}, Lcom/helpshift/util/HSObservableList;->size()I

    move-result v1

    if-lez v1, :cond_9

    .line 1350
    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    sub-int/2addr v1, v3

    invoke-virtual {v0, v1}, Lcom/helpshift/util/HSObservableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1351
    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;

    if-nez v1, :cond_8

    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;

    if-eqz v1, :cond_9

    .line 1353
    :cond_8
    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    .line 1354
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->getState()Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    move-result-object v0

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    if-ne v0, v1, :cond_0

    .line 1370
    :cond_9
    :goto_2
    invoke-virtual {p0, v3}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showFakeTypingIndicator(Z)V

    return-void
.end method


# virtual methods
.method public add(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 0

    .line 2138
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->addAll(Ljava/util/Collection;)V

    return-void
.end method

.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0

    .line 122
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->add(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void
.end method

.method public addAll(Ljava/util/Collection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 1105
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "addAll called : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ConvsatnlVM"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1106
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 1109
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    .line 1110
    invoke-virtual {v1, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->hasBotSwitchedToAnotherBotInPollerResponse(Ljava/util/Collection;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 1113
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0, v2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateMessagesClickOnBotSwitch(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    .line 1117
    :cond_0
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->evaluateBotMessages(Ljava/util/Collection;)Ljava/util/List;

    move-result-object p1

    .line 1120
    iget-boolean v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isInBetweenBotExecution:Z

    if-eqz v1, :cond_1

    .line 1124
    iget-boolean v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isUserReplyDraftClearedForBotChange:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    .line 1125
    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->containsAtleastOneUserMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1126
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->clearUserReplyDraft()V

    const/4 v0, 0x1

    .line 1127
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isUserReplyDraftClearedForBotChange:Z

    goto :goto_0

    .line 1131
    :cond_1
    iput-boolean v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isUserReplyDraftClearedForBotChange:Z

    .line 1134
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    if-eqz v0, :cond_3

    .line 1135
    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->addMessages(Ljava/util/Collection;)V

    :cond_3
    return-void
.end method

.method public appendMessages(II)V
    .locals 1

    .line 2149
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    if-eqz v0, :cond_0

    .line 2150
    invoke-interface {v0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->appendMessages(II)V

    :cond_0
    return-void
.end method

.method protected buildUIMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/util/List;
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

    .line 497
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 498
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {v1, v2}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 503
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->shouldOpen(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 504
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->processMessagesForBots(Ljava/util/Collection;Z)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 507
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method clearReply()V
    .locals 2

    .line 887
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$6;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$6;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public clearUserReplyDraft()V
    .locals 2

    .line 405
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->saveUserReplyText(Ljava/lang/String;)V

    .line 406
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyFieldViewState:Lcom/helpshift/widget/MutableReplyFieldViewState;

    invoke-virtual {v0}, Lcom/helpshift/widget/MutableReplyFieldViewState;->clearReplyText()V

    return-void
.end method

.method public createPreIssueFromSmartIntentSelection(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 2420
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->createPreIssueViaSmartIntent(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    return-void
.end method

.method public createPreIssueFromSmartIntentSendButton(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 2425
    invoke-direct {p0, p1, v0, v0, p2}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->createPreIssueViaSmartIntent(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    return-void
.end method

.method createPreIssueViaConversationalFlow(Ljava/lang/String;)V
    .locals 2

    const-string v0, "Helpshift_ConvsatnlVM"

    const-string v1, "Trigger preissue creation via Conversational flow"

    .line 769
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 770
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    const/4 v1, 0x0

    .line 771
    invoke-direct {p0, v0, p1, v1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->addPreIssueFirstUserMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/util/List;)V

    .line 772
    invoke-direct {p0, v0, p1, v1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->createPreIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method createPreIssueViaUserRetry(Ljava/lang/String;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "Helpshift_ConvsatnlVM"

    const-string v1, "Trigger preissue creation via User retry"

    .line 763
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 764
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 765
    invoke-direct {p0, v0, p1, p2}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->createPreIssue(Lcom/helpshift/conversation/activeconversation/model/Conversation;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public downloadAvatarImage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 2

    .line 2553
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->isPersonalisedBotEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/Author;->role:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->BOT:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    if-eq v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    .line 2554
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->isPersonalisedAgentEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/Author;->role:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->AGENT:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    if-ne v0, v1, :cond_3

    .line 2555
    :cond_1
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageToAvatarTriggeredMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_2

    .line 2556
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_3

    .line 2557
    :cond_2
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageToAvatarTriggeredMap:Ljava/util/Map;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2558
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->downloadAvatarImage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    :cond_3
    return-void
.end method

.method public forceClickOnNewConversationButton()V
    .locals 1

    .line 2068
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    iget-boolean v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isStartNewConversationClicked:Z

    if-eqz v0, :cond_0

    .line 2069
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->onNewConversationButtonClicked()V

    :cond_0
    return-void
.end method

.method public getAttachImageButtonViewState()Lcom/helpshift/widget/BaseViewState;
    .locals 1

    .line 2363
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->attachImageButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    return-object v0
.end method

.method public getConfirmationBoxViewState()Lcom/helpshift/widget/BaseViewState;
    .locals 1

    .line 2371
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->confirmationBoxViewState:Lcom/helpshift/widget/MutableBaseViewState;

    return-object v0
.end method

.method public getConversationFooterViewState()Lcom/helpshift/widget/ConversationFooterViewState;
    .locals 1

    .line 2359
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationFooterViewState:Lcom/helpshift/widget/MutableConversationFooterViewState;

    return-object v0
.end method

.method public getHistoryLoadingViewState()Lcom/helpshift/widget/HistoryLoadingViewState;
    .locals 1

    .line 2351
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->historyLoadingViewState:Lcom/helpshift/widget/MutableHistoryLoadingViewState;

    return-object v0
.end method

.method public getReplyBoxViewState()Lcom/helpshift/widget/ReplyBoxViewState;
    .locals 1

    .line 2367
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    return-object v0
.end method

.method public getReplyButtonViewState()Lcom/helpshift/widget/BaseViewState;
    .locals 1

    .line 2375
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    return-object v0
.end method

.method public getReplyFieldViewState()Lcom/helpshift/widget/ReplyFieldViewState;
    .locals 1

    .line 2347
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyFieldViewState:Lcom/helpshift/widget/MutableReplyFieldViewState;

    return-object v0
.end method

.method public getScrollJumperViewState()Lcom/helpshift/widget/ScrollJumperViewState;
    .locals 1

    .line 2355
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->scrollJumperViewState:Lcom/helpshift/widget/MutableScrollJumperViewState;

    return-object v0
.end method

.method public getSmartIntentClearSearchButtonViewState()Lcom/helpshift/widget/BaseViewState;
    .locals 1

    .line 2483
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->getClearSearchButtonViewState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v0

    return-object v0
.end method

.method public getSmartIntentInstanceSaveState()Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;
    .locals 1

    .line 2502
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->buildInstanceSaveState()Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;

    move-result-object v0

    return-object v0
.end method

.method public getSmartIntentReplyButtonViewState()Lcom/helpshift/widget/BaseViewState;
    .locals 1

    .line 2479
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->getReplyButtonViewState()Lcom/helpshift/widget/BaseViewState;

    move-result-object v0

    return-object v0
.end method

.method public getSmartIntentReplyFieldViewState()Lcom/helpshift/widget/ReplyFieldViewState;
    .locals 1

    .line 2487
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->getReplyFieldViewState()Lcom/helpshift/widget/ReplyFieldViewState;

    move-result-object v0

    return-object v0
.end method

.method public getWhiteListedAttachmentTypes()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1975
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 1976
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getWhiteListAttachmentMimeTypes()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x2

    .line 1980
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    .line 1979
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x3

    .line 1981
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    if-eqz v1, :cond_4

    const-string v6, "*/*"

    .line 1978
    invoke-interface {v1, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_1

    .line 1984
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const-string v7, "image/"

    .line 1985
    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1986
    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    const-string v7, "video/"

    .line 1988
    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 1989
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1992
    :cond_3
    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1995
    :goto_0
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v6

    if-ne v6, v4, :cond_1

    goto :goto_2

    .line 1979
    :cond_4
    :goto_1
    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1980
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1981
    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2000
    :cond_5
    :goto_2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v1
.end method

.method public handleAdminAttachmentMessageClick(Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;)V
    .locals 1

    .line 1854
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->onAdminAttachmentMessageClicked(Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;)V

    return-void
.end method

.method public handleAdminSuggestedQuestionRead(Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1547
    invoke-static {p3}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1548
    iget-object v3, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 1549
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v7, Lcom/helpshift/conversation/viewmodel/ConversationalVM$21;

    move-object v1, v7

    move-object v2, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$21;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Ljava/lang/Long;Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v7}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    :cond_0
    return-void
.end method

.method public handleAppReviewRequestClick(Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;)V
    .locals 3

    .line 1024
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v1, "reviewUrl"

    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 1025
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1026
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->setAppReviewed(Z)V

    .line 1027
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    if-eqz v1, :cond_0

    .line 1028
    invoke-interface {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->openAppReviewStore(Ljava/lang/String;)V

    .line 1031
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->handleAppReviewRequestClick(Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;)V

    return-void
.end method

.method public handleBackPressedForSmartIntent()Z
    .locals 1

    .line 2467
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->handleBackPressedForSmartIntent()Z

    move-result v0

    return v0
.end method

.method handleConversationRejectedState()V
    .locals 3

    .line 1956
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 1957
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    const-string v2, ""

    invoke-virtual {v1, v2}, Lcom/helpshift/conversation/domainmodel/ConversationController;->saveUserReplyText(Ljava/lang/String;)V

    .line 1960
    iget-boolean v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    if-eqz v0, :cond_0

    .line 1961
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->REDACTED_STATE:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    goto :goto_0

    .line 1964
    :cond_0
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->REJECTED_MESSAGE:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    .line 1966
    :goto_0
    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showStartNewConversation(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V

    const/4 v0, 0x1

    .line 1967
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isConversationRejected:Z

    return-void
.end method

.method public handleIdempotentPreIssueCreationSuccess()V
    .locals 2

    .line 1507
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$19;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$19;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public handleLeafIntentSelected(Lcom/helpshift/conversation/smartintent/LeafIntentUIModel;)V
    .locals 1

    .line 289
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->handleLeafIntentSelected(Lcom/helpshift/conversation/smartintent/LeafIntentUIModel;)V

    return-void
.end method

.method public handleOptionSelected(Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;Z)V
    .locals 4

    .line 1159
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    if-nez v0, :cond_0

    return-void

    .line 1165
    :cond_0
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->type:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;->PILL:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_1

    .line 1169
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getUiMessageDMs()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 1170
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->remove(Ljava/util/List;)V

    .line 1174
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    sub-int/2addr v0, v2

    invoke-interface {v1, v0, v2}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->updateMessages(II)V

    .line 1178
    :cond_1
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateLastUserActivityTime()V

    .line 1180
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->type:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;->PILL:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    if-ne v0, v1, :cond_2

    .line 1182
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->disableUserInputOptions()V

    goto :goto_0

    .line 1184
    :cond_2
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->type:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;->PICKER:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    if-ne v0, v1, :cond_3

    .line 1185
    invoke-direct {p0, v2}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->hideListPicker(Z)V

    .line 1187
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$13;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$13;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;Z)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public handleOptionSelectedForPicker(Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;Z)V
    .locals 1

    const/4 v0, 0x0

    .line 1735
    iput-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->listPickerVM:Lcom/helpshift/conversation/viewmodel/ListPickerVM;

    .line 1736
    invoke-virtual {p0, p1, p2, p3}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->handleOptionSelected(Lcom/helpshift/conversation/activeconversation/message/OptionInputMessageDM;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;Z)V

    return-void
.end method

.method public handleOptionSelectedForPicker(Lcom/helpshift/conversation/viewmodel/OptionUIModel;Z)V
    .locals 1

    .line 1764
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->listPickerVM:Lcom/helpshift/conversation/viewmodel/ListPickerVM;

    if-eqz v0, :cond_0

    .line 1765
    invoke-virtual {v0, p1, p2}, Lcom/helpshift/conversation/viewmodel/ListPickerVM;->handleOptionSelectedForPicker(Lcom/helpshift/conversation/viewmodel/OptionUIModel;Z)V

    :cond_0
    return-void
.end method

.method public handlePreIssueCreationSuccess()V
    .locals 2

    .line 1466
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$18;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$18;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public handleRootIntentSelected(Lcom/helpshift/conversation/smartintent/RootIntentUIModel;)V
    .locals 1

    .line 280
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->handleRootIntentSelected(Lcom/helpshift/conversation/smartintent/RootIntentUIModel;)V

    return-void
.end method

.method public handleScreenshotMessageClick(Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;)V
    .locals 1

    .line 1016
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->onScreenshotMessageClicked(Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;)V

    return-void
.end method

.method public handleSearchIntentSelected(Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;)V
    .locals 1

    .line 298
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->handleSearchIntentSelected(Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;)V

    return-void
.end method

.method public handleStateChangeForIssueMode(Lcom/helpshift/conversation/dto/IssueState;)V
    .locals 6

    .line 1886
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Changing conversation status to: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ConvsatnlVM"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1887
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 1888
    invoke-static {p1}, Lcom/helpshift/conversation/ConversationUtil;->isInProgressState(Lcom/helpshift/conversation/dto/IssueState;)Z

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, -0x1

    if-eqz v1, :cond_0

    .line 1890
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showMessageBox()V

    const/4 p1, 0x0

    :goto_0
    const/4 v0, 0x0

    goto/16 :goto_5

    .line 1894
    :cond_0
    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p1, v1, :cond_4

    .line 1895
    iget-boolean p1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    if-eqz p1, :cond_1

    .line 1896
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->hideAllFooterWidgets()V

    goto :goto_1

    .line 1899
    :cond_1
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {p1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->shouldShowConversationResolutionQuestion()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1900
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showConfirmationBox()V

    .line 1905
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->scrollJumperViewState:Lcom/helpshift/widget/MutableScrollJumperViewState;

    invoke-virtual {p1}, Lcom/helpshift/widget/MutableScrollJumperViewState;->isVisible()Z

    move-result p1

    if-nez p1, :cond_3

    .line 1906
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->notifyRendererForScrollToBottom()V

    :cond_3
    const/4 p1, 0x1

    const/4 v0, 0x0

    const/4 v2, -0x1

    const/4 v3, 0x0

    goto/16 :goto_5

    .line 1909
    :cond_4
    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p1, v1, :cond_5

    .line 1911
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->handleConversationRejectedState()V

    const/4 p1, 0x1

    const/4 v0, 0x1

    :goto_2
    const/4 v2, -0x1

    goto :goto_5

    .line 1913
    :cond_5
    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq p1, v1, :cond_a

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_EXPIRED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p1, v1, :cond_6

    goto :goto_3

    .line 1928
    :cond_6
    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p1, v1, :cond_7

    .line 1929
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {p1, v4}, Lcom/helpshift/conversation/domainmodel/ConversationController;->setPersistMessageBox(Z)V

    .line 1930
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showMessageBox()V

    .line 1931
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p1, v0, v3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->setEnableMessageClickOnResolutionRejected(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    const/4 p1, 0x1

    goto :goto_0

    .line 1934
    :cond_7
    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->ARCHIVED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p1, v1, :cond_8

    .line 1935
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->ARCHIVAL_MESSAGE:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showStartNewConversation(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V

    goto :goto_4

    .line 1937
    :cond_8
    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->AUTHOR_MISMATCH:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p1, v1, :cond_9

    .line 1938
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->AUTHOR_MISMATCH:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showStartNewConversation(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V

    goto :goto_4

    .line 1940
    :cond_9
    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->CLOSED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p1, v1, :cond_c

    iget-boolean p1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    if-eqz p1, :cond_c

    .line 1941
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->START_NEW_CONVERSATION:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showStartNewConversation(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V

    goto :goto_4

    .line 1915
    :cond_a
    :goto_3
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    const-string v1, ""

    invoke-virtual {p1, v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->saveUserReplyText(Ljava/lang/String;)V

    .line 1916
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->shouldShowCSATInFooter(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result p1

    if-eqz p1, :cond_b

    .line 1917
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->CSAT_RATING:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showStartNewConversation(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V

    .line 1922
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->onCSATSurveyRequested()V

    goto :goto_4

    .line 1925
    :cond_b
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->START_NEW_CONVERSATION:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showStartNewConversation(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V

    :cond_c
    :goto_4
    const/4 p1, 0x1

    const/4 v0, 0x0

    goto :goto_2

    :goto_5
    if-eqz v3, :cond_d

    .line 1946
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateUIOnNewMessageReceived()V

    :cond_d
    if-eqz p1, :cond_e

    .line 1949
    invoke-virtual {p0, v4}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->onAgentTypingUpdate(Z)V

    .line 1951
    :cond_e
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {p1, v2}, Lcom/helpshift/conversation/domainmodel/ConversationController;->setConversationViewState(I)V

    .line 1952
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isConversationRejected:Z

    return-void
.end method

.method public handleUserAttachmentMessageClick(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V
    .locals 1

    .line 1020
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->onUserAttachmentMessageClicked(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V

    return-void
.end method

.method protected hideAllFooterWidgets()V
    .locals 2

    .line 2326
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableReplyBoxViewState;->setVisible(Z)V

    .line 2327
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateAttachmentButtonViewState()V

    .line 2328
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->confirmationBoxViewState:Lcom/helpshift/widget/MutableBaseViewState;

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    .line 2329
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationFooterViewState:Lcom/helpshift/widget/MutableConversationFooterViewState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->NONE:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableConversationFooterViewState;->setState(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V

    return-void
.end method

.method public hideFakeTypingIndicatorFromSmartIntent()V
    .locals 1

    const/4 v0, 0x0

    .line 2389
    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showFakeTypingIndicator(Z)V

    return-void
.end method

.method public hidePickerClearButton()V
    .locals 1

    .line 1776
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->hidePickerClearButton()V

    return-void
.end method

.method public hideReplyFooterFromSmartIntent()V
    .locals 2

    .line 2407
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$29;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$29;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public hideSmartIntentView()V
    .locals 2

    const-string v0, "Helpshift_ConvsatnlVM"

    const-string v1, "hideSmartIntentView called"

    .line 2453
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2454
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    if-eqz v0, :cond_0

    .line 2455
    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->hideSendReplyUI()V

    .line 2456
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->hideSmartIntentView()V

    :cond_0
    return-void
.end method

.method protected initMessagesList()V
    .locals 6

    .line 414
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    if-eqz v0, :cond_0

    .line 415
    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->unregisterMessageListVMCallback()V

    .line 418
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 424
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->initializeConversationsForUI()V

    .line 425
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->initializeIssueStatusForUI(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 426
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->hasMoreMessages()Z

    move-result v1

    .line 427
    new-instance v2, Lcom/helpshift/conversation/viewmodel/MessageListVM;

    iget-object v3, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v4, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-direct {v2, v3, v4}, Lcom/helpshift/conversation/viewmodel/MessageListVM;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V

    iput-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    .line 428
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v2}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getUIConversations()Ljava/util/List;

    move-result-object v2

    .line 431
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 432
    iget-object v4, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v4}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getAllConversations()Ljava/util/List;

    move-result-object v4

    .line 433
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 434
    invoke-direct {p0, v5}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->getUIMessages(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 437
    :cond_1
    iget-object v4, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    invoke-virtual {v4, v2, v3, v1, p0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->initializeMessageList(Ljava/util/List;Ljava/util/List;ZLcom/helpshift/conversation/viewmodel/MessageListVMCallback;)V

    .line 439
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    invoke-virtual {v2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getUiMessageDMs()Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->initializeMessages(Ljava/util/List;)V

    .line 441
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v1, p0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->registerMessagesObserver(Lcom/helpshift/util/HSListObserver;)V

    .line 442
    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v1, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isConversationRejected:Z

    .line 443
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->prefillReplyBox()V

    return-void
.end method

.method public isMessageBoxVisible()Z
    .locals 1

    .line 1042
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    invoke-virtual {v0}, Lcom/helpshift/widget/MutableReplyBoxViewState;->isVisible()Z

    move-result v0

    return v0
.end method

.method public isVisibleOnUI()Z
    .locals 1

    .line 1047
    iget-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isScreenCurrentlyVisible:Z

    return v0
.end method

.method public launchAttachment(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1868
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-interface {v0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->launchAttachment(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public launchScreenshotAttachment(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1037
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-interface {v0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->launchScreenshotAttachment(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public markConversationResolutionStatus(Z)V
    .locals 3

    .line 1872
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Sending resolution event : Accepted? "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ConvsatnlVM"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1875
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 1876
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v1, v2, :cond_0

    .line 1877
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->markConversationResolutionStatus(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    :cond_0
    return-void
.end method

.method public newAdminMessagesAdded()V
    .locals 0

    .line 2157
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateUIOnNewMessageReceived()V

    return-void
.end method

.method public newUserMessagesAdded()V
    .locals 0

    .line 2163
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->notifyRendererForScrollToBottom()V

    return-void
.end method

.method public onActionCardMessageClicked(Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V
    .locals 1

    .line 1862
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->onActionCardMessageClicked(Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V

    .line 1863
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->getUriAsStringForAction()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->openActionLink(Ljava/lang/String;)V

    return-void
.end method

.method public onAdminMessageLinkClickFailed()V
    .locals 2

    .line 1858
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    sget-object v1, Lcom/helpshift/common/exception/PlatformException;->NO_APPS_FOR_OPENING_ATTACHMENT:Lcom/helpshift/common/exception/PlatformException;

    invoke-interface {v0, v1}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->showErrorView(Lcom/helpshift/common/exception/ExceptionType;)V

    return-void
.end method

.method public onAdminMessageLinkClicked(Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 5

    const/4 v0, 0x0

    .line 2092
    :try_start_0
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 2095
    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    :cond_0
    move-object v1, v0

    .line 2100
    :goto_0
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 2101
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v2}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getAllConversations()Ljava/util/List;

    move-result-object v2

    .line 2103
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 2104
    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {v4, p2}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    move-object v0, v3

    .line 2109
    :cond_2
    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_6

    .line 2110
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    if-eqz v0, :cond_5

    .line 2112
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 2113
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    const-string v3, "preissue_id"

    invoke-interface {p2, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2115
    :cond_3
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 2116
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    const-string v3, "issue_id"

    invoke-interface {p2, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2118
    :cond_4
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 2119
    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    const-string v2, "acid"

    invoke-interface {p2, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    const-string v0, "p"

    .line 2122
    invoke-interface {p2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "u"

    .line 2123
    invoke-interface {p2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2124
    sget-object p1, Lcom/helpshift/analytics/AnalyticsEventType;->ADMIN_MESSAGE_DEEPLINK_CLICKED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->pushAnalyticsEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    :cond_6
    return-void
.end method

.method public onAgentTypingUpdate(Z)V
    .locals 2

    .line 1052
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$11;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$11;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Z)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public onAttachmentButtonClick()V
    .locals 2

    .line 1971
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->setPersistMessageBox(Z)V

    return-void
.end method

.method public onAuthenticationFailure()V
    .locals 2

    .line 2211
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$25;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$25;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public onCSATSurveyCancelled()V
    .locals 1

    .line 2048
    sget-object v0, Lcom/helpshift/analytics/AnalyticsEventType;->CANCEL_CSAT_RATING:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sendCSATEvent(Lcom/helpshift/analytics/AnalyticsEventType;)V

    return-void
.end method

.method public onCSATSurveyRequested()V
    .locals 1

    .line 2023
    sget-object v0, Lcom/helpshift/analytics/AnalyticsEventType;->CSAT_REQUESTED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sendCSATEvent(Lcom/helpshift/analytics/AnalyticsEventType;)V

    return-void
.end method

.method public onCSATSurveyRequestedFromBot(Ljava/lang/String;)V
    .locals 1

    .line 2027
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->lastCSATRequestedEventId:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2028
    sget-object v0, Lcom/helpshift/analytics/AnalyticsEventType;->CSAT_REQUESTED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sendCSATEvent(Lcom/helpshift/analytics/AnalyticsEventType;)V

    .line 2029
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->lastCSATRequestedEventId:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public onCSATSurveyStarted()V
    .locals 1

    .line 2019
    sget-object v0, Lcom/helpshift/analytics/AnalyticsEventType;->START_CSAT_RATING:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sendCSATEvent(Lcom/helpshift/analytics/AnalyticsEventType;)V

    return-void
.end method

.method public onCSATSurveyStartedFromBot(Ljava/lang/String;)V
    .locals 1

    .line 2057
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->lastCSATStartRatingEventId:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2058
    sget-object v0, Lcom/helpshift/analytics/AnalyticsEventType;->START_CSAT_RATING:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sendCSATEvent(Lcom/helpshift/analytics/AnalyticsEventType;)V

    .line 2059
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->lastCSATStartRatingEventId:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public onCSATSurveySubmitted(ILjava/lang/String;)V
    .locals 3

    .line 2034
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    if-eqz v0, :cond_0

    .line 2035
    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->showCSATSubmittedView()V

    .line 2037
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 2038
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result v1

    if-nez v1, :cond_1

    .line 2039
    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->START_NEW_CONVERSATION:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    invoke-virtual {p0, v1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showStartNewConversation(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V

    .line 2041
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Sending CSAT rating : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", feedback: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Helpshift_ConvsatnlVM"

    invoke-static {v2, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2042
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->sendCSATSurvey(Lcom/helpshift/conversation/activeconversation/model/Conversation;ILjava/lang/String;)V

    .line 2044
    sget-object p1, Lcom/helpshift/analytics/AnalyticsEventType;->CSAT_SUBMITTED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sendCSATEvent(Lcom/helpshift/analytics/AnalyticsEventType;)V

    return-void
.end method

.method public onConversationInboxPollFailure()V
    .locals 2

    const-string v0, "Helpshift_ConvsatnlVM"

    const-string v1, "On conversation inbox poll failure"

    .line 800
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 803
    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showFakeTypingIndicator(Z)V

    .line 813
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->isOnline()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->awaitingUserInputForBotStep:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    .line 815
    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->isSmartIntentUIVisible()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    .line 816
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isInBetweenBotExecution:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    .line 817
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 819
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$3;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$3;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    const/4 v0, 0x1

    .line 827
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isShowingPollFailureError:Z

    :cond_1
    return-void
.end method

.method public onConversationInboxPollSuccess()V
    .locals 2

    .line 833
    iget-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isShowingPollFailureError:Z

    if-eqz v0, :cond_0

    .line 834
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$4;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$4;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    const/4 v0, 0x0

    .line 842
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isShowingPollFailureError:Z

    :cond_0
    return-void
.end method

.method public onCreateConversationFailure(Ljava/lang/Exception;)V
    .locals 2

    const-string v0, "Helpshift_ConvsatnlVM"

    const-string v1, "Error filing a pre-issue"

    .line 1524
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1525
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v0, Lcom/helpshift/conversation/viewmodel/ConversationalVM$20;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$20;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {p1, v0}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public onCreateConversationSuccess(J)V
    .locals 0

    .line 1461
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->handlePreIssueCreationSuccess()V

    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 2379
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->resetLastNotificationCountFetchTime()V

    return-void
.end method

.method public onHistoryLoadingError()V
    .locals 2

    .line 1833
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->historyLoadingViewState:Lcom/helpshift/widget/MutableHistoryLoadingViewState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;->ERROR:Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableHistoryLoadingViewState;->setState(Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;)V

    return-void
.end method

.method public onHistoryLoadingStarted()V
    .locals 2

    .line 1838
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->historyLoadingViewState:Lcom/helpshift/widget/MutableHistoryLoadingViewState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;->LOADING:Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableHistoryLoadingViewState;->setState(Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;)V

    return-void
.end method

.method public onHistoryLoadingSuccess()V
    .locals 2

    .line 1828
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->historyLoadingViewState:Lcom/helpshift/widget/MutableHistoryLoadingViewState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;->NONE:Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableHistoryLoadingViewState;->setState(Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;)V

    return-void
.end method

.method public onIssueStatusChange(Lcom/helpshift/conversation/dto/IssueState;)V
    .locals 2

    .line 1424
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 1425
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->handleStateChangeForIssueMode(Lcom/helpshift/conversation/dto/IssueState;)V

    .line 1429
    iget-boolean p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isInBetweenBotExecution:Z

    if-eqz p1, :cond_0

    .line 1430
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->attachImageButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    invoke-virtual {p1, v1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    :cond_0
    return-void

    .line 1435
    :cond_1
    sget-object v0, Lcom/helpshift/conversation/viewmodel/ConversationalVM$33;->$SwitchMap$com$helpshift$conversation$dto$IssueState:[I

    invoke-virtual {p1}, Lcom/helpshift/conversation/dto/IssueState;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    goto :goto_0

    .line 1445
    :cond_2
    iput-boolean v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->awaitingUserInputForBotStep:Z

    .line 1446
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->removeOptionsMessageFromUI()V

    .line 1448
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->handleConversationRejectedState()V

    .line 1451
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateUIOnNewMessageReceived()V

    goto :goto_0

    .line 1438
    :cond_3
    iput-boolean v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->awaitingUserInputForBotStep:Z

    .line 1439
    sget-object p1, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->START_NEW_CONVERSATION:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showStartNewConversation(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V

    .line 1441
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateUIOnNewMessageReceived()V

    .line 1456
    :goto_0
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateUserInputState()V

    return-void
.end method

.method public onListPickerSearchQueryChange(Ljava/lang/String;)V
    .locals 1

    .line 1758
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->listPickerVM:Lcom/helpshift/conversation/viewmodel/ListPickerVM;

    if-eqz v0, :cond_0

    .line 1759
    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/viewmodel/ListPickerVM;->onListPickerSearchQueryChange(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onNetworkAvailable()V
    .locals 2

    .line 1375
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$16;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$16;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public onNetworkUnAvailable()V
    .locals 2

    .line 1394
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$17;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$17;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public onNewConversationButtonClicked()V
    .locals 5

    const/4 v0, 0x0

    .line 1575
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isInBetweenBotExecution:Z

    .line 1576
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->stopLiveUpdates()V

    .line 1577
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    .line 1578
    invoke-virtual {v2}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3, v3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->setStartNewConversationButtonClicked(Lcom/helpshift/conversation/activeconversation/model/Conversation;ZZ)V

    .line 1579
    iget-boolean v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showConversationHistory:Z

    if-eqz v1, :cond_1

    .line 1582
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->hideAllFooterWidgets()V

    .line 1585
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getOpenConversationWithMessages()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1590
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->createLocalPreIssueConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 1594
    :cond_0
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->onNewConversationStarted(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 1596
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->onNewConversationStarted(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 1599
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->pushChatScreenOpenAnalyticsEvent()V

    .line 1602
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->refreshVM()V

    .line 1603
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderMenuItems()V

    .line 1604
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->initMessagesList()V

    .line 1606
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->notifyRefreshList()V

    goto :goto_0

    .line 1620
    :cond_1
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1621
    iget-boolean v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showConversationHistory:Z

    iget-object v4, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {v4}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->shouldShowConversationHistory()Z

    move-result v4

    if-eq v2, v4, :cond_2

    const/4 v0, 0x1

    :cond_2
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v2, "create_new_pre_issue"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1622
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-interface {v0, v1}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->openFreshConversationScreen(Ljava/util/Map;)V

    :goto_0
    return-void
.end method

.method public onPause()V
    .locals 1

    const/4 v0, 0x0

    .line 265
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->setScreenVisibility(Z)V

    .line 266
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->setUserCanReadMessages(Z)V

    .line 267
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->markMessagesAsSeenOnExit()V

    .line 268
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->clearNotifications()V

    .line 269
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->resetIncrementMessageCountFlag()V

    .line 271
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->getReply()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->saveReplyText(Ljava/lang/String;)V

    return-void
.end method

.method public onRestoreSmartIntentInstanceState(Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;)V
    .locals 1

    .line 2506
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->onRestoreInstanceState(Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;)V

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 256
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->refreshVM()V

    .line 257
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderMenuItems()V

    const/4 v0, 0x1

    .line 258
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->setScreenVisibility(Z)V

    .line 259
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->setUserCanReadMessages(Z)V

    .line 260
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->markMessagesAsSeenOnEntry()V

    .line 261
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->clearNotifications()V

    return-void
.end method

.method public onScrollJumperViewClicked()V
    .locals 0

    .line 2222
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->notifyRendererForScrollToBottom()V

    return-void
.end method

.method public onScrolledToBottom()V
    .locals 2

    .line 2226
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->scrollJumperViewState:Lcom/helpshift/widget/MutableScrollJumperViewState;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableScrollJumperViewState;->setVisible(Z)V

    .line 2228
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->scrollJumperViewState:Lcom/helpshift/widget/MutableScrollJumperViewState;

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableScrollJumperViewState;->setShouldShowUnreadMessagesIndicator(Z)V

    return-void
.end method

.method public onScrolledToTop()V
    .locals 2

    .line 2237
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->historyLoadingViewState:Lcom/helpshift/widget/MutableHistoryLoadingViewState;

    invoke-virtual {v0}, Lcom/helpshift/widget/MutableHistoryLoadingViewState;->getState()Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;

    move-result-object v0

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;->NONE:Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;

    if-ne v0, v1, :cond_0

    .line 2238
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->loadHistoryMessagesInternal()V

    :cond_0
    return-void
.end method

.method public onScrolling()V
    .locals 2

    .line 2232
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->scrollJumperViewState:Lcom/helpshift/widget/MutableScrollJumperViewState;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableScrollJumperViewState;->setVisible(Z)V

    return-void
.end method

.method public onSendFeedBackClick(ILcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V
    .locals 3

    .line 2565
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getUiMessageDMs()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 2566
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->remove(Ljava/util/List;)V

    .line 2570
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    invoke-interface {v1, v0, v2}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->updateMessages(II)V

    .line 2571
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$31;

    invoke-direct {v1, p0, p1, p2}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$31;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;ILcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    .line 2584
    sget-object p1, Lcom/helpshift/analytics/AnalyticsEventType;->CSAT_SUBMITTED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sendCSATEvent(Lcom/helpshift/analytics/AnalyticsEventType;)V

    return-void
.end method

.method public onSkipClick()V
    .locals 3

    .line 1069
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateLastUserActivityTime()V

    .line 1071
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->botMessageDM:Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1072
    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    if-eqz v1, :cond_0

    .line 1076
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->clearUserReplyDraft()V

    .line 1079
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->disableUserInputOptions()V

    .line 1081
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v2, Lcom/helpshift/conversation/viewmodel/ConversationalVM$12;

    invoke-direct {v2, p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$12;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    invoke-virtual {v1, v2}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    .line 1100
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->hideSkipButton()V

    return-void
.end method

.method public onSmartIntentBottomSheetCollapsed()V
    .locals 1

    .line 2471
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->onSmartIntentBottomSheetCollapsed()V

    return-void
.end method

.method public onSmartIntentBottomSheetExpanded()V
    .locals 1

    .line 2475
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->onSmartIntentBottomSheetExpanded()V

    return-void
.end method

.method public onSmartIntentSendButtonClick()V
    .locals 2

    .line 2495
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    if-eqz v0, :cond_0

    .line 2496
    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->getSmartIntentUserQuery()Ljava/lang/String;

    move-result-object v0

    .line 2497
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->onSmartIntentSendButtonClick(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onSmartIntentTextChanged(Ljava/lang/CharSequence;)V
    .locals 1

    .line 2491
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->onSmartIntentTextChanged(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onStartNewConversationButtonClickFromCSATBot(Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V
    .locals 3

    .line 2589
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getUiMessageDMs()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 2590
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->remove(Ljava/util/List;)V

    .line 2594
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    invoke-interface {v1, v0, v2}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->updateMessages(II)V

    .line 2597
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$32;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$32;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    .line 2611
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->onNewConversationButtonClicked()V

    return-void
.end method

.method public onUIMessageListUpdated()V
    .locals 0

    .line 1665
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateReplyBoxVisibility()V

    return-void
.end method

.method protected prefillReplyBox()V
    .locals 3

    .line 448
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getUserReplyText()Ljava/lang/String;

    move-result-object v0

    .line 452
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v1

    .line 453
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v2, v1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->containsAtleastOneUserMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 454
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getConversationArchivalPrefillText()Ljava/lang/String;

    move-result-object v0

    .line 456
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 457
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v1, "conversationPrefillText"

    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    .line 466
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyFieldViewState:Lcom/helpshift/widget/MutableReplyFieldViewState;

    invoke-virtual {v1, v0}, Lcom/helpshift/widget/MutableReplyFieldViewState;->setReplyText(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public prependConversations(Ljava/util/List;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/model/Conversation;",
            ">;Z)V"
        }
    .end annotation

    .line 1800
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-nez p2, :cond_0

    .line 1807
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->prependMessages(Ljava/util/List;Z)V

    :cond_0
    return-void

    .line 1812
    :cond_1
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getUIConversations()Ljava/util/List;

    move-result-object v0

    .line 1815
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1816
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 1817
    invoke-direct {p0, v2}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->getUIMessagesForHistory(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 1820
    :cond_2
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    if-eqz p1, :cond_3

    .line 1821
    invoke-virtual {p1, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->updateUIConversationOrder(Ljava/util/List;)V

    .line 1822
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    invoke-virtual {p1, v1, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->prependMessages(Ljava/util/List;Z)V

    :cond_3
    return-void
.end method

.method public pushChatScreenOpenAnalyticsEvent()V
    .locals 5

    .line 2510
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 2511
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    .line 2512
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    .line 2513
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 2515
    iget-object v4, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    invoke-static {v4}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2516
    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    const-string v4, "acid"

    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2518
    :cond_0
    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "id"

    .line 2519
    invoke-virtual {v3, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2520
    sget-object v0, Lcom/helpshift/analytics/AnalyticsEventType;->OPEN_ISSUE:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-direct {p0, v0, v3}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->pushAnalyticsEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    goto :goto_0

    .line 2523
    :cond_1
    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "preissue_id"

    .line 2524
    invoke-virtual {v3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2526
    :cond_2
    sget-object v0, Lcom/helpshift/analytics/AnalyticsEventType;->REPORTED_ISSUE:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-direct {p0, v0, v3}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->pushAnalyticsEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    :goto_0
    return-void
.end method

.method public refreshAll()V
    .locals 1

    .line 2204
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    if-eqz v0, :cond_0

    .line 2205
    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->notifyRefreshList()V

    :cond_0
    return-void
.end method

.method public refreshVM()V
    .locals 5

    .line 644
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 647
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateConversationExpiryProperties(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 653
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->shouldShowReplyBoxOnConversationRejected()Z

    move-result v1

    .line 654
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->widgetGateway:Lcom/helpshift/widget/WidgetGateway;

    iget-object v3, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    invoke-virtual {v2, v3, v0, v1}, Lcom/helpshift/widget/WidgetGateway;->updateReplyBoxWidget(Lcom/helpshift/widget/MutableReplyBoxViewState;Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    .line 656
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->widgetGateway:Lcom/helpshift/widget/WidgetGateway;

    iget-object v3, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->confirmationBoxViewState:Lcom/helpshift/widget/MutableBaseViewState;

    invoke-virtual {v2, v3, v0}, Lcom/helpshift/widget/WidgetGateway;->updateConfirmationBoxViewState(Lcom/helpshift/widget/MutableBaseViewState;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    .line 657
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->widgetGateway:Lcom/helpshift/widget/WidgetGateway;

    iget-object v3, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationFooterViewState:Lcom/helpshift/widget/MutableConversationFooterViewState;

    invoke-virtual {v2, v3, v0, v1}, Lcom/helpshift/widget/WidgetGateway;->updateConversationFooterViewState(Lcom/helpshift/widget/MutableConversationFooterViewState;Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    .line 661
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    invoke-virtual {v1}, Lcom/helpshift/widget/MutableReplyBoxViewState;->isVisible()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x2

    goto :goto_0

    :cond_0
    const/4 v1, -0x1

    .line 662
    :goto_0
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v2, v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->setConversationViewState(I)V

    .line 665
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v1, p0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->registerMessagesObserver(Lcom/helpshift/util/HSListObserver;)V

    .line 668
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v1, p0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->setConversationVMCallback(Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;)V

    .line 672
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    const/4 v2, 0x1

    if-nez v1, :cond_1

    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    .line 673
    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getAllConversations()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v2, :cond_2

    .line 674
    :cond_1
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getConversationInboxPoller()Lcom/helpshift/conversation/ConversationInboxPoller;

    move-result-object v1

    invoke-virtual {v1}, Lcom/helpshift/conversation/ConversationInboxPoller;->startChatPoller()V

    .line 678
    :cond_2
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->isSynced(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    .line 679
    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->containsAtleastOneUserMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 680
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    iget-object v3, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-virtual {v3}, Lcom/helpshift/util/HSObservableList;->size()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-virtual {v1, v3}, Lcom/helpshift/util/HSObservableList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 681
    instance-of v2, v1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    if-eqz v2, :cond_4

    .line 682
    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    .line 683
    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->getState()Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    move-result-object v2

    sget-object v3, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    if-eq v2, v3, :cond_3

    .line 684
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/helpshift/widget/MutableReplyBoxViewState;->setVisible(Z)V

    .line 689
    :cond_3
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lcom/helpshift/conversation/domainmodel/ConversationController;->isPreissueCreationInProgress(J)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 690
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENDING:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserMessageState;)V

    :cond_4
    return-void

    .line 697
    :cond_5
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->isSynced(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 698
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->shouldAutoFillPreissueFirstMessage()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 700
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v3, "initialUserMessageToAutoSendInPreissue"

    invoke-virtual {v1, v3}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 701
    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, "Helpshift_ConvsatnlVM"

    const-string v4, "Auto-filing preissue with client set user message."

    .line 702
    invoke-static {v3, v4}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 703
    iget-object v3, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v3, v0, v2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateIsAutoFilledPreissueFlag(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    .line 704
    invoke-virtual {p0, v1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->createPreIssueViaConversationalFlow(Ljava/lang/String;)V

    return-void

    .line 711
    :cond_6
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->shouldShowSmartIntent(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 713
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->showSmartIntentUI()V

    return-void

    .line 717
    :cond_7
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->isSynced(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 719
    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->messageDMs:Lcom/helpshift/util/HSObservableList;

    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->evaluateBotMessages(Ljava/util/Collection;)Ljava/util/List;

    .line 725
    :cond_8
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateReplyBoxVisibility()V

    return-void
.end method

.method public renderMenuItems()V
    .locals 2

    .line 303
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyFieldViewState:Lcom/helpshift/widget/MutableReplyFieldViewState;

    invoke-virtual {v0}, Lcom/helpshift/widget/MutableReplyFieldViewState;->getReplyText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 304
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    invoke-virtual {v1, v0}, Lcom/helpshift/widget/MutableBaseViewState;->setEnabled(Z)V

    .line 305
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateAttachmentButtonViewState()V

    return-void
.end method

.method protected resetDefaultMenuItemsVisibility()V
    .locals 3

    .line 381
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->attachImageButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->widgetGateway:Lcom/helpshift/widget/WidgetGateway;

    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    .line 382
    invoke-virtual {v2}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/helpshift/widget/WidgetGateway;->getDefaultVisibilityForAttachImageButton(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v1

    .line 381
    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    return-void
.end method

.method public retryHistoryLoadingMessages()V
    .locals 2

    .line 2244
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->historyLoadingViewState:Lcom/helpshift/widget/MutableHistoryLoadingViewState;

    invoke-virtual {v0}, Lcom/helpshift/widget/MutableHistoryLoadingViewState;->getState()Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;

    move-result-object v0

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;->ERROR:Lcom/helpshift/conversation/activeconversation/message/HistoryLoadingState;

    if-ne v0, v1, :cond_0

    .line 2245
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->loadHistoryMessagesInternal()V

    :cond_0
    return-void
.end method

.method public retryMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 2

    .line 987
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$10;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$10;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public saveReplyText(Ljava/lang/String;)V
    .locals 3

    .line 388
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 389
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v2, "conversationPrefillText"

    invoke-virtual {v1, v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    .line 390
    invoke-virtual {v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getConversationArchivalPrefillText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    if-eqz v1, :cond_2

    .line 391
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->containsAtleastOneUserMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 392
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    const-string v0, ""

    invoke-virtual {p1, v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->saveUserReplyText(Ljava/lang/String;)V

    goto :goto_2

    .line 395
    :cond_2
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyFieldViewState:Lcom/helpshift/widget/MutableReplyFieldViewState;

    invoke-virtual {v0, p1}, Lcom/helpshift/widget/MutableReplyFieldViewState;->setReplyText(Ljava/lang/String;)V

    .line 396
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->saveUserReplyText(Ljava/lang/String;)V

    :goto_2
    return-void
.end method

.method public sendAttachment(Lcom/helpshift/conversation/dto/AttachmentPickerFile;Ljava/lang/String;)V
    .locals 2

    .line 1843
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$24;

    invoke-direct {v1, p0, p1, p2}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$24;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Lcom/helpshift/conversation/dto/AttachmentPickerFile;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public sendTextMessage()V
    .locals 3

    .line 876
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->getReply()Ljava/lang/String;

    move-result-object v0

    .line 878
    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 882
    :cond_0
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/helpshift/conversation/domainmodel/ConversationController;->setPersistMessageBox(Z)V

    .line 883
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sendTextMessage(Ljava/lang/String;)V

    return-void
.end method

.method protected sendTextMessage(Ljava/lang/String;)V
    .locals 3

    .line 910
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateLastUserActivityTime()V

    .line 912
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    .line 913
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->containsAtleastOneUserMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 915
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->userVisibleCharacterCount(Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getMinimumConversationDescriptionLength()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 916
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->showReplyValidationFailedError(I)V

    return-void

    .line 922
    :cond_0
    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 923
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->clearReply()V

    .line 924
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->createPreIssueViaConversationalFlow(Ljava/lang/String;)V

    return-void

    .line 929
    :cond_1
    iget-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->isInBetweenBotExecution:Z

    if-nez v0, :cond_2

    .line 930
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sendNormalTextMessage(Ljava/lang/String;)V

    return-void

    .line 935
    :cond_2
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->botMessageDM:Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 936
    instance-of v1, v0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    if-nez v1, :cond_3

    .line 937
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->sendNormalTextMessage(Ljava/lang/String;)V

    return-void

    .line 941
    :cond_3
    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    .line 942
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    .line 943
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    invoke-virtual {v2, p1}, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->validate(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 946
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    iget v0, v1, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->keyboard:I

    invoke-interface {p1, v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->showReplyValidationFailedError(I)V

    return-void

    .line 950
    :cond_4
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-interface {v1}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->hideReplyValidationFailedError()V

    .line 953
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->disableUserInputOptions()V

    .line 954
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->clearReply()V

    .line 956
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v2, Lcom/helpshift/conversation/viewmodel/ConversationalVM$8;

    invoke-direct {v2, p0, p1, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$8;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;)V

    invoke-virtual {v1, v2}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public setConversationViewState(I)V
    .locals 1

    .line 2064
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->setConversationViewState(I)V

    return-void
.end method

.method public shouldShowUnreadMessagesIndicator()Z
    .locals 1

    .line 401
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->scrollJumperViewState:Lcom/helpshift/widget/MutableScrollJumperViewState;

    invoke-virtual {v0}, Lcom/helpshift/widget/MutableScrollJumperViewState;->shouldShowUnreadMessagesIndicator()Z

    move-result v0

    return v0
.end method

.method public showEmptyListPickerView()V
    .locals 1

    .line 1741
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->showEmptyListPickerView()V

    return-void
.end method

.method showFakeTypingIndicator(Z)V
    .locals 2

    .line 852
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$5;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$5;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;Z)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public showFakeTypingIndicatorFromSmartIntent()V
    .locals 1

    const/4 v0, 0x1

    .line 2384
    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showFakeTypingIndicator(Z)V

    return-void
.end method

.method public showPickerClearButton()V
    .locals 1

    .line 1771
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->showPickerClearButton()V

    return-void
.end method

.method public showReplyFooterFromSmartIntent()V
    .locals 2

    .line 2395
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM$28;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM$28;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public showSmartIntentReplyValidationFailedError()V
    .locals 1

    .line 2430
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    if-eqz v0, :cond_0

    .line 2431
    invoke-interface {v0}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->showSmartIntentReplyValidationFailedError()V

    :cond_0
    return-void
.end method

.method public showSmartIntentUI(Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;)V
    .locals 2

    .line 2437
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "showSmartIntentUI : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ConvsatnlVM"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2438
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    if-eqz v0, :cond_0

    .line 2439
    invoke-interface {v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->showSmartIntentView(Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;)V

    :cond_0
    return-void
.end method

.method protected showStartNewConversation(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V
    .locals 2

    .line 2333
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyBoxViewState:Lcom/helpshift/widget/MutableReplyBoxViewState;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableReplyBoxViewState;->setVisible(Z)V

    .line 2334
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateAttachmentButtonViewState()V

    .line 2335
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->confirmationBoxViewState:Lcom/helpshift/widget/MutableBaseViewState;

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    .line 2336
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationFooterViewState:Lcom/helpshift/widget/MutableConversationFooterViewState;

    invoke-virtual {v0, p1}, Lcom/helpshift/widget/MutableConversationFooterViewState;->setState(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V

    return-void
.end method

.method public startLiveUpdates()V
    .locals 1

    .line 2129
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->startLiveUpdates()V

    return-void
.end method

.method public stopLiveUpdates()V
    .locals 1

    .line 2133
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->stopLiveUpdates()V

    return-void
.end method

.method public toggleReplySendButton(Z)V
    .locals 1

    .line 2340
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->replyButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    invoke-virtual {v0, p1}, Lcom/helpshift/widget/MutableBaseViewState;->setEnabled(Z)V

    return-void
.end method

.method public unregisterRenderer()V
    .locals 2

    .line 367
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->unregisterConversationVMCallback()V

    .line 369
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 370
    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->unregisterMessageListVMCallback()V

    .line 371
    iput-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    .line 373
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->smartIntentVM:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->onDestroy()V

    .line 375
    iput-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    .line 377
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/helpshift/account/AuthenticationFailureDM;->unregisterListener(Lcom/helpshift/account/AuthenticationFailureDM$AuthenticationFailureObserver;)V

    return-void
.end method

.method public update(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 2

    .line 1141
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "update called : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ConvsatnlVM"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1142
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->updateUserInputState()V

    .line 1144
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->messageListVM:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    if-nez v0, :cond_0

    return-void

    .line 1148
    :cond_0
    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void
.end method

.method public bridge synthetic update(Ljava/lang/Object;)V
    .locals 0

    .line 122
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->update(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void
.end method

.method public updateLastUserActivityTime()V
    .locals 4

    .line 2142
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->viewableConversation:Lcom/helpshift/conversation/activeconversation/ViewableConversation;

    .line 2143
    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/ViewableConversation;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v1

    .line 2144
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 2143
    invoke-virtual {v0, v1, v2, v3}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->updateLastUserActivityTime(Lcom/helpshift/conversation/activeconversation/model/Conversation;J)V

    return-void
.end method

.method public updateListPickerOptions(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/viewmodel/OptionUIModel;",
            ">;)V"
        }
    .end annotation

    .line 1730
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->updateListPickerOptions(Ljava/util/List;)V

    return-void
.end method

.method public updateMessages(II)V
    .locals 1

    .line 2197
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    if-eqz v0, :cond_0

    .line 2198
    invoke-interface {v0, p1, p2}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->updateMessages(II)V

    :cond_0
    return-void
.end method

.method public updateSmartIntentView(Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;)V
    .locals 2

    .line 2445
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateSmartIntentView : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ConvsatnlVM"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2446
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    if-eqz v0, :cond_0

    .line 2447
    invoke-interface {v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->updateSmartIntentView(Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;)V

    :cond_0
    return-void
.end method

.method protected updateTypingIndicatorStatus(Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 2274
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-interface {p1}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->showAgentTypingIndicator()V

    .line 2276
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->scrollJumperViewState:Lcom/helpshift/widget/MutableScrollJumperViewState;

    invoke-virtual {p1}, Lcom/helpshift/widget/MutableScrollJumperViewState;->isVisible()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 2279
    :cond_0
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->renderer:Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;

    invoke-interface {p1}, Lcom/helpshift/conversation/activeconversation/ConversationalRenderer;->hideAgentTypingIndicator()V

    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_1

    .line 2283
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->notifyRendererForScrollToBottom()V

    :cond_1
    return-void
.end method

.method protected updateUIOnNewMessageReceived()V
    .locals 1

    .line 2186
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->scrollJumperViewState:Lcom/helpshift/widget/MutableScrollJumperViewState;

    invoke-virtual {v0}, Lcom/helpshift/widget/MutableScrollJumperViewState;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2188
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->showUnreadMessagesIndicator()V

    goto :goto_0

    .line 2191
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->notifyRendererForScrollToBottom()V

    :goto_0
    return-void
.end method

.method public updateUnreadMessageCountIndicator(Z)V
    .locals 1

    .line 2300
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->scrollJumperViewState:Lcom/helpshift/widget/MutableScrollJumperViewState;

    invoke-virtual {v0, p1}, Lcom/helpshift/widget/MutableScrollJumperViewState;->setShouldShowUnreadMessagesIndicator(Z)V

    return-void
.end method
