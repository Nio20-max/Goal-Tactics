.class public Lcom/helpshift/support/controllers/SupportController;
.super Ljava/lang/Object;
.source "SupportController.java"

# interfaces
.implements Lcom/helpshift/support/contracts/SearchResultListener;
.implements Lcom/helpshift/support/contracts/AttachmentPreviewListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_SupportContr"


# instance fields
.field private final KEY_CONVERSATION_ADD_TO_BACK_STACK:Ljava/lang/String;

.field private final KEY_CONVERSATION_BUNDLE:Ljava/lang/String;

.field private final KEY_SUPPORT_CONTROLLER_STARTED_STATE:Ljava/lang/String;

.field private final bundle:Landroid/os/Bundle;

.field private final context:Landroid/content/Context;

.field private conversationAddToBackStack:Z

.field private conversationBundle:Landroid/os/Bundle;

.field private fragmentManager:Landroidx/fragment/app/FragmentManager;

.field private isControllerStarted:Z

.field private searchPerformed:Z

.field private sourceSearchQuery:Ljava/lang/String;

.field private supportMode:I

.field private final supportScreenView:Lcom/helpshift/support/contracts/SupportScreenView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/helpshift/support/contracts/SupportScreenView;Landroidx/fragment/app/FragmentManager;Landroid/os/Bundle;)V
    .locals 1

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "key_support_controller_started"

    .line 75
    iput-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->KEY_SUPPORT_CONTROLLER_STARTED_STATE:Ljava/lang/String;

    const-string v0, "key_conversation_bundle"

    .line 76
    iput-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->KEY_CONVERSATION_BUNDLE:Ljava/lang/String;

    const-string v0, "key_conversation_add_to_back_stack"

    .line 77
    iput-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->KEY_CONVERSATION_ADD_TO_BACK_STACK:Ljava/lang/String;

    const/4 v0, 0x0

    .line 85
    iput-boolean v0, p0, Lcom/helpshift/support/controllers/SupportController;->searchPerformed:Z

    .line 91
    iput-object p1, p0, Lcom/helpshift/support/controllers/SupportController;->context:Landroid/content/Context;

    .line 92
    iput-object p2, p0, Lcom/helpshift/support/controllers/SupportController;->supportScreenView:Lcom/helpshift/support/contracts/SupportScreenView;

    .line 93
    iput-object p3, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    .line 94
    iput-object p4, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    return-void
.end method

.method private clearConversationStack()V
    .locals 5

    .line 672
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object v0

    .line 675
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    :goto_0
    if-ltz v1, :cond_3

    .line 676
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/Fragment;

    .line 679
    instance-of v4, v3, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    if-nez v4, :cond_0

    instance-of v4, v3, Lcom/helpshift/support/conversations/BaseConversationFragment;

    if-nez v4, :cond_0

    instance-of v4, v3, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;

    if-nez v4, :cond_0

    instance-of v4, v3, Lcom/helpshift/support/conversations/AuthenticationFailureFragment;

    if-eqz v4, :cond_2

    :cond_0
    if-nez v1, :cond_1

    .line 685
    iget-object v4, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-static {v4, v3}, Lcom/helpshift/support/util/FragmentUtil;->removeFragment(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V

    .line 690
    iget-object v4, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v4}, Landroidx/fragment/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 691
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 692
    iget-object v4, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/helpshift/support/util/FragmentUtil;->popBackStack(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_1

    .line 700
    :cond_1
    iget-object v4, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/helpshift/support/util/FragmentUtil;->popBackStack(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :cond_2
    :goto_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 707
    :cond_3
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v1, "HSConversationFragment"

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 709
    iget-object v1, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/helpshift/support/util/FragmentUtil;->popBackStackImmediate(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    const/4 v0, 0x1

    goto :goto_2

    :cond_4
    const/4 v0, 0x0

    :goto_2
    if-nez v0, :cond_5

    .line 713
    iput-boolean v2, p0, Lcom/helpshift/support/controllers/SupportController;->conversationAddToBackStack:Z

    :cond_5
    return-void
.end method

.method private handleCustomContactUsFlows()Z
    .locals 2

    .line 511
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getActiveConversation()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    if-nez v0, :cond_0

    .line 513
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-static {v0}, Lcom/helpshift/support/util/FragmentUtil;->getFaqFlowFragment(Landroidx/fragment/app/FragmentManager;)Lcom/helpshift/support/fragments/FaqFlowFragment;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 515
    invoke-virtual {v0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->getCustomContactUsFlows()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 516
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    .line 517
    invoke-virtual {p0, v0, v1}, Lcom/helpshift/support/controllers/SupportController;->startDynamicForm(Ljava/util/List;Z)V

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isDuplicateFAQScreenAlreadyOpen(Landroid/os/Bundle;)Z
    .locals 4

    .line 348
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-static {v0}, Lcom/helpshift/support/util/FragmentUtil;->getTopMostFragment(Landroidx/fragment/app/FragmentManager;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 349
    instance-of v1, v0, Lcom/helpshift/support/fragments/FaqFlowFragment;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 350
    check-cast v0, Lcom/helpshift/support/fragments/FaqFlowFragment;

    .line 351
    invoke-virtual {v0}, Lcom/helpshift/support/fragments/FaqFlowFragment;->getFaqFlowController()Lcom/helpshift/support/controllers/FaqFlowController;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 353
    invoke-virtual {v0}, Lcom/helpshift/support/controllers/FaqFlowController;->getTopMostFaqFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 354
    instance-of v1, v0, Lcom/helpshift/support/fragments/SingleQuestionFragment;

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    .line 355
    check-cast v0, Lcom/helpshift/support/fragments/SingleQuestionFragment;

    const-string v1, "questionPublishId"

    .line 356
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 357
    invoke-virtual {v0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getQuestionPublishId()Ljava/lang/String;

    move-result-object v0

    if-eqz p1, :cond_0

    .line 361
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v2, 0x1

    :cond_0
    return v2

    :cond_1
    return v3

    :cond_2
    return v2
.end method

.method private replaceConversationFlow(Landroid/os/Bundle;)V
    .locals 3

    const-string v0, "conversationIdInPush"

    .line 131
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 132
    iget-object v1, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    if-eqz v1, :cond_0

    const-string v2, "issueId"

    .line 133
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 136
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    .line 139
    iget-object v2, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v2}, Landroidx/fragment/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object v2

    if-eqz v0, :cond_1

    .line 145
    invoke-direct {p0}, Lcom/helpshift/support/controllers/SupportController;->clearConversationStack()V

    goto :goto_1

    .line 151
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 156
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/Fragment;

    .line 159
    instance-of v2, v0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    if-eqz v2, :cond_2

    return-void

    .line 163
    :cond_2
    instance-of v0, v0, Lcom/helpshift/support/conversations/BaseConversationFragment;

    xor-int/2addr v1, v0

    :cond_3
    :goto_1
    if-eqz v1, :cond_4

    .line 173
    iput-object p1, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    .line 174
    invoke-virtual {p0}, Lcom/helpshift/support/controllers/SupportController;->startConversationFlow()V

    :cond_4
    return-void
.end method

.method private sendTicketAvoidedEvent()V
    .locals 5

    .line 544
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-static {v0}, Lcom/helpshift/support/util/FragmentUtil;->getSingleQuestionFragment(Landroidx/fragment/app/FragmentManager;)Lcom/helpshift/support/fragments/SingleQuestionFragment;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 546
    invoke-virtual {v0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getQuestionId()Ljava/lang/String;

    move-result-object v0

    .line 547
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 548
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "id"

    .line 549
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 550
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserManagerDM;->getActiveUser()Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v0

    .line 552
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object v2

    invoke-interface {v2}, Lcom/helpshift/common/platform/Platform;->getConversationInboxDAO()Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-interface {v2, v3, v4}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->getDescriptionDetail(J)Lcom/helpshift/conversation/dto/ConversationDetailDTO;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 554
    iget-object v0, v0, Lcom/helpshift/conversation/dto/ConversationDetailDTO;->title:Ljava/lang/String;

    const-string v2, "str"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 556
    :cond_0
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object v0

    sget-object v2, Lcom/helpshift/analytics/AnalyticsEventType;->TICKET_AVOIDED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {v0, v2, v1}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    :cond_1
    return-void
.end method

.method private showAuthenticationFailureFragment()V
    .locals 9

    const-string v0, "Helpshift_SupportContr"

    const-string v1, "Starting authentication failure fragment"

    .line 291
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    invoke-static {}, Lcom/helpshift/support/conversations/AuthenticationFailureFragment;->newInstance()Lcom/helpshift/support/conversations/AuthenticationFailureFragment;

    move-result-object v4

    .line 295
    iget-boolean v0, p0, Lcom/helpshift/support/controllers/SupportController;->conversationAddToBackStack:Z

    if-eqz v0, :cond_0

    .line 296
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move-object v6, v0

    .line 299
    invoke-direct {p0}, Lcom/helpshift/support/controllers/SupportController;->clearConversationStack()V

    .line 300
    iget-object v2, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    sget v3, Lcom/helpshift/R$id;->flow_fragment_container:I

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v5, "HSAuthenticationFailureFragment"

    invoke-static/range {v2 .. v8}, Lcom/helpshift/support/util/FragmentUtil;->startFragment(Landroidx/fragment/app/FragmentManager;ILandroidx/fragment/app/Fragment;Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method private showConversationFragment(ZLjava/lang/Long;Ljava/util/Map;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/Long;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 397
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Starting conversation fragment: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_SupportContr"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p1, :cond_1

    if-nez p2, :cond_0

    return-void

    .line 405
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-string p2, "issueId"

    invoke-virtual {v0, p2, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 407
    :cond_1
    iget-object p2, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    const-string v0, "show_conv_history"

    invoke-virtual {p2, v0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 408
    invoke-interface {p3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 409
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    invoke-interface {p3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, p2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    .line 412
    :cond_2
    iget-object p1, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    invoke-static {p1}, Lcom/helpshift/support/conversations/ConversationalFragment;->newInstance(Landroid/os/Bundle;)Lcom/helpshift/support/conversations/ConversationalFragment;

    move-result-object v2

    const/4 p1, 0x0

    .line 414
    iget-boolean p2, p0, Lcom/helpshift/support/controllers/SupportController;->conversationAddToBackStack:Z

    if-eqz p2, :cond_3

    .line 415
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    .line 418
    invoke-direct {p0}, Lcom/helpshift/support/controllers/SupportController;->clearConversationStack()V

    :cond_3
    move-object v4, p1

    .line 420
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    sget v1, Lcom/helpshift/R$id;->flow_fragment_container:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v3, "HSConversationFragment"

    invoke-static/range {v0 .. v6}, Lcom/helpshift/support/util/FragmentUtil;->startFragment(Landroidx/fragment/app/FragmentManager;ILandroidx/fragment/app/Fragment;Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method private showNewConversationFragment()V
    .locals 8

    const-string v0, "Helpshift_SupportContr"

    const-string v1, "Starting new conversation fragment"

    .line 374
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    iget-boolean v1, p0, Lcom/helpshift/support/controllers/SupportController;->searchPerformed:Z

    const-string v2, "search_performed"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 376
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    iget-object v1, p0, Lcom/helpshift/support/controllers/SupportController;->sourceSearchQuery:Ljava/lang/String;

    const-string v2, "source_search_query"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    invoke-static {v0}, Lcom/helpshift/support/conversations/NewConversationFragment;->newInstance(Landroid/os/Bundle;)Lcom/helpshift/support/conversations/NewConversationFragment;

    move-result-object v3

    .line 379
    iget-boolean v0, p0, Lcom/helpshift/support/controllers/SupportController;->conversationAddToBackStack:Z

    if-eqz v0, :cond_0

    .line 380
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 383
    invoke-direct {p0}, Lcom/helpshift/support/controllers/SupportController;->clearConversationStack()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move-object v5, v0

    .line 385
    iget-object v1, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    sget v2, Lcom/helpshift/R$id;->flow_fragment_container:I

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v4, "HSNewConversationFragment"

    invoke-static/range {v1 .. v7}, Lcom/helpshift/support/util/FragmentUtil;->startFragment(Landroidx/fragment/app/FragmentManager;ILandroidx/fragment/app/Fragment;Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method private startConversationFlowInternal(Ljava/util/Map;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 225
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    if-nez v0, :cond_0

    .line 226
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    iput-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    .line 229
    :cond_0
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    const-string v1, "disableInAppConversation"

    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 230
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v1

    invoke-interface {v1}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v1

    invoke-virtual {v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->shouldShowConversationHistory()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    if-nez v0, :cond_1

    .line 234
    invoke-direct {p0, v3, v2, p1}, Lcom/helpshift/support/controllers/SupportController;->showConversationFragment(ZLjava/lang/Long;Ljava/util/Map;)V

    return-void

    .line 238
    :cond_1
    iget-object v1, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    const-string v4, "conversationIdInPush"

    const-wide/16 v5, 0x0

    invoke-virtual {v1, v4, v5, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    const/4 v1, 0x0

    cmp-long v9, v7, v5

    if-eqz v9, :cond_2

    .line 240
    iget-object v5, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    invoke-virtual {v5, v4}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 241
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v4

    invoke-interface {v4}, Lcom/helpshift/CoreApi;->getConversationController()Lcom/helpshift/conversation/domainmodel/ConversationController;

    move-result-object v4

    .line 242
    invoke-virtual {v4, v7, v8}, Lcom/helpshift/conversation/domainmodel/ConversationController;->shouldOpenConversationFromNotification(J)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 245
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-direct {p0, v1, v0, p1}, Lcom/helpshift/support/controllers/SupportController;->showConversationFragment(ZLjava/lang/Long;Ljava/util/Map;)V

    return-void

    :cond_2
    if-nez v0, :cond_3

    .line 252
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getActiveConversationOrPreIssue()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 254
    iget-object v2, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->localId:Ljava/lang/Long;

    :cond_3
    if-nez v2, :cond_7

    .line 259
    invoke-static {}, Lcom/helpshift/support/flows/CustomContactUsFlowListHolder;->getFlowList()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_6

    .line 260
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_0

    .line 269
    :cond_4
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    sub-int/2addr v0, v3

    .line 270
    invoke-virtual {p0}, Lcom/helpshift/support/controllers/SupportController;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroidx/fragment/app/FragmentManager;->getBackStackEntryAt(I)Landroidx/fragment/app/FragmentManager$BackStackEntry;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 272
    invoke-interface {v0}, Landroidx/fragment/app/FragmentManager$BackStackEntry;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 273
    const-class v1, Lcom/helpshift/support/conversations/ConversationalFragment;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 274
    iget-object v1, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    invoke-static {v1, v0}, Lcom/helpshift/support/util/FragmentUtil;->popBackStackImmediate(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 277
    :cond_5
    invoke-virtual {p0, p1, v3}, Lcom/helpshift/support/controllers/SupportController;->startDynamicForm(Ljava/util/List;Z)V

    goto :goto_1

    .line 261
    :cond_6
    :goto_0
    invoke-direct {p0}, Lcom/helpshift/support/controllers/SupportController;->showNewConversationFragment()V

    goto :goto_1

    .line 281
    :cond_7
    invoke-direct {p0, v1, v2, p1}, Lcom/helpshift/support/controllers/SupportController;->showConversationFragment(ZLjava/lang/Long;Ljava/util/Map;)V

    :goto_1
    return-void
.end method


# virtual methods
.method public actionDone()V
    .locals 6

    .line 526
    invoke-direct {p0}, Lcom/helpshift/support/controllers/SupportController;->sendTicketAvoidedEvent()V

    .line 528
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserManagerDM;->getActiveUser()Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v0

    .line 529
    new-instance v1, Lcom/helpshift/conversation/dto/ConversationDetailDTO;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    const-string v4, ""

    const/4 v5, 0x0

    invoke-direct {v1, v4, v2, v3, v5}, Lcom/helpshift/conversation/dto/ConversationDetailDTO;-><init>(Ljava/lang/String;JI)V

    .line 531
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object v2

    invoke-interface {v2}, Lcom/helpshift/common/platform/Platform;->getConversationInboxDAO()Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-interface {v2, v3, v4, v1}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->saveDescriptionDetail(JLcom/helpshift/conversation/dto/ConversationDetailDTO;)V

    .line 533
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object v1

    invoke-interface {v1}, Lcom/helpshift/common/platform/Platform;->getConversationInboxDAO()Lcom/helpshift/conversation/dao/ConversationInboxDAO;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const/4 v0, 0x0

    invoke-interface {v1, v2, v3, v0}, Lcom/helpshift/conversation/dao/ConversationInboxDAO;->saveImageAttachment(JLcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    .line 534
    invoke-virtual {p0}, Lcom/helpshift/support/controllers/SupportController;->getSupportMode()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 535
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->supportScreenView:Lcom/helpshift/support/contracts/SupportScreenView;

    invoke-interface {v0}, Lcom/helpshift/support/contracts/SupportScreenView;->exitSdkSession()V

    goto :goto_0

    .line 538
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/controllers/SupportController;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-class v1, Lcom/helpshift/support/conversations/NewConversationFragment;

    .line 539
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 538
    invoke-static {v0, v1}, Lcom/helpshift/support/util/FragmentUtil;->popBackStackImmediate(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public addAttachment(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V
    .locals 2

    .line 605
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    const-class v1, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/support/util/FragmentUtil;->popBackStack(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 606
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v1, "HSNewConversationFragment"

    .line 607
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/conversations/NewConversationFragment;

    if-eqz v0, :cond_0

    .line 609
    sget-object v1, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;->ADD:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    invoke-virtual {v0, v1, p1}, Lcom/helpshift/support/conversations/NewConversationFragment;->handleScreenshotAction(Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;Lcom/helpshift/conversation/dto/AttachmentPickerFile;)Z

    :cond_0
    return-void
.end method

.method public changeAttachment(Landroid/os/Bundle;)V
    .locals 2

    .line 635
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->supportScreenView:Lcom/helpshift/support/contracts/SupportScreenView;

    invoke-interface {v0, p1}, Lcom/helpshift/support/contracts/SupportScreenView;->launchAttachmentPicker(Landroid/os/Bundle;)V

    .line 638
    iget-object p1, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v0, "HSNewConversationFragment"

    .line 639
    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/helpshift/support/conversations/NewConversationFragment;

    if-eqz p1, :cond_0

    .line 641
    sget-object v0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;->REMOVE:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/helpshift/support/conversations/NewConversationFragment;->handleScreenshotAction(Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;Lcom/helpshift/conversation/dto/AttachmentPickerFile;)Z

    :cond_0
    return-void
.end method

.method public getFragmentManager()Landroidx/fragment/app/FragmentManager;
    .locals 1

    .line 490
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    return-object v0
.end method

.method public getSupportMode()I
    .locals 1

    .line 486
    iget v0, p0, Lcom/helpshift/support/controllers/SupportController;->supportMode:I

    return v0
.end method

.method public onAdminSuggestedQuestionSelected(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/support/fragments/SingleQuestionFragment$QuestionReadListener;)V
    .locals 3

    .line 588
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/helpshift/support/util/Styles;->isTablet(Landroid/content/Context;)Z

    move-result v0

    .line 589
    iget-object v1, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    const-string v2, "questionPublishId"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 590
    iget-object p1, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    const-string v1, "questionLanguage"

    invoke-virtual {p1, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 591
    iget-object p1, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    const-string p2, "questionSource"

    invoke-virtual {p1, p2, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 593
    new-instance p1, Landroid/os/Bundle;

    iget-object p2, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    invoke-direct {p1, p2}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    const-string p2, "decomp"

    const/4 p3, 0x1

    .line 594
    invoke-virtual {p1, p2, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 595
    iget-object p2, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    sget p3, Lcom/helpshift/R$id;->flow_fragment_container:I

    const/4 v1, 0x3

    .line 598
    invoke-static {p1, v1, v0, p4}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->newInstance(Landroid/os/Bundle;IZLcom/helpshift/support/fragments/SingleQuestionFragment$QuestionReadListener;)Lcom/helpshift/support/fragments/SingleQuestionFragment;

    move-result-object p1

    const/4 p4, 0x0

    const/4 v0, 0x0

    .line 595
    invoke-static {p2, p3, p1, p4, v0}, Lcom/helpshift/support/util/FragmentUtil;->startFragmentWithBackStack(Landroidx/fragment/app/FragmentManager;ILandroidx/fragment/app/Fragment;Ljava/lang/String;Z)V

    return-void
.end method

.method public onAuthenticationFailure()V
    .locals 0

    .line 286
    invoke-direct {p0}, Lcom/helpshift/support/controllers/SupportController;->showAuthenticationFailureFragment()V

    return-void
.end method

.method public onContactUsClicked(Ljava/lang/String;)V
    .locals 1

    .line 494
    invoke-direct {p0}, Lcom/helpshift/support/controllers/SupportController;->handleCustomContactUsFlows()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 498
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 499
    iput-object p1, p0, Lcom/helpshift/support/controllers/SupportController;->sourceSearchQuery:Ljava/lang/String;

    .line 502
    :cond_1
    iget-object p1, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/helpshift/support/controllers/SupportController;->startConversationFlow(Landroid/os/Bundle;Z)V

    return-void
.end method

.method public onConversationSetupCompleted()V
    .locals 1

    .line 761
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-direct {p0, v0}, Lcom/helpshift/support/controllers/SupportController;->startConversationFlowInternal(Ljava/util/Map;)V

    return-void
.end method

.method public onFragmentManagerUpdate(Landroidx/fragment/app/FragmentManager;)V
    .locals 0

    .line 98
    iput-object p1, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    return-void
.end method

.method public onNewIntent(Landroid/os/Bundle;)V
    .locals 3

    const-string v0, "support_mode"

    .line 651
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x4

    if-eq v0, v2, :cond_0

    .line 661
    invoke-static {}, Lcom/helpshift/support/flows/CustomContactUsFlowListHolder;->getFlowList()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v1, v0}, Lcom/helpshift/support/controllers/SupportController;->startFaqFlow(Landroid/os/Bundle;ZLjava/util/List;)V

    goto :goto_0

    :cond_0
    const-string v0, "flow_title"

    .line 658
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/helpshift/support/flows/DynamicFormFlowListHolder;->getFlowList()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0, v1}, Lcom/helpshift/support/controllers/SupportController;->startDynamicForm(Ljava/lang/String;Ljava/util/List;Z)V

    goto :goto_0

    .line 655
    :cond_1
    invoke-direct {p0, p1}, Lcom/helpshift/support/controllers/SupportController;->replaceConversationFlow(Landroid/os/Bundle;)V

    :goto_0
    return-void
.end method

.method public onQuestionSelected(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 563
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/helpshift/support/util/Styles;->isTablet(Landroid/content/Context;)Z

    move-result v0

    .line 564
    iget-object v1, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    const-string v2, "questionPublishId"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_0

    .line 566
    iget-object p1, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    const-string v1, "searchTerms"

    invoke-virtual {p1, v1, p2}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 568
    :cond_0
    iget-object p1, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    sget p2, Lcom/helpshift/R$id;->flow_fragment_container:I

    iget-object v1, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    const/4 v2, 0x2

    const/4 v3, 0x0

    .line 570
    invoke-static {v1, v2, v0, v3}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->newInstance(Landroid/os/Bundle;IZLcom/helpshift/support/fragments/SingleQuestionFragment$QuestionReadListener;)Lcom/helpshift/support/fragments/SingleQuestionFragment;

    move-result-object v0

    const/4 v1, 0x0

    .line 568
    invoke-static {p1, p2, v0, v3, v1}, Lcom/helpshift/support/util/FragmentUtil;->startFragmentWithBackStack(Landroidx/fragment/app/FragmentManager;ILandroidx/fragment/app/Fragment;Ljava/lang/String;Z)V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 718
    iget-boolean v0, p0, Lcom/helpshift/support/controllers/SupportController;->isControllerStarted:Z

    const-string v1, "key_support_controller_started"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 719
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    const-string v1, "key_conversation_bundle"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 720
    iget-boolean v0, p0, Lcom/helpshift/support/controllers/SupportController;->conversationAddToBackStack:Z

    const-string v1, "key_conversation_add_to_back_stack"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public onViewStateRestored(Landroid/os/Bundle;)V
    .locals 3

    .line 724
    iget-boolean v0, p0, Lcom/helpshift/support/controllers/SupportController;->isControllerStarted:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const-string v0, "key_support_controller_started"

    .line 728
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 729
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/helpshift/support/controllers/SupportController;->isControllerStarted:Z

    .line 730
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    const/4 v1, 0x0

    const-string v2, "support_mode"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/helpshift/support/controllers/SupportController;->supportMode:I

    .line 732
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    if-eqz v0, :cond_3

    const-string v1, "AttachmentPreviewFragment"

    .line 734
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    if-eqz v0, :cond_1

    .line 736
    invoke-virtual {v0, p0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->setAttachmentPreviewListener(Lcom/helpshift/support/contracts/AttachmentPreviewListener;)V

    .line 739
    :cond_1
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v1, "HSSearchResultFragment"

    .line 740
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/fragments/SearchResultFragment;

    if-eqz v0, :cond_2

    .line 742
    invoke-virtual {v0, p0}, Lcom/helpshift/support/fragments/SearchResultFragment;->setSearchResultListener(Lcom/helpshift/support/contracts/SearchResultListener;)V

    .line 745
    :cond_2
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v1, "HSDynamicFormFragment"

    .line 746
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/fragments/DynamicFormFragment;

    if-eqz v0, :cond_3

    .line 748
    invoke-virtual {v0, p0}, Lcom/helpshift/support/fragments/DynamicFormFragment;->setSupportController(Lcom/helpshift/support/controllers/SupportController;)V

    :cond_3
    const-string v0, "key_conversation_bundle"

    .line 753
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v1, "key_conversation_add_to_back_stack"

    .line 754
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 755
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    .line 756
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/helpshift/support/controllers/SupportController;->conversationAddToBackStack:Z

    :cond_4
    return-void
.end method

.method public removeAttachment()V
    .locals 3

    .line 625
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    const-class v1, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/support/util/FragmentUtil;->popBackStack(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 626
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v1, "HSNewConversationFragment"

    .line 627
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/conversations/NewConversationFragment;

    if-eqz v0, :cond_0

    .line 629
    sget-object v1, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;->REMOVE:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/support/conversations/NewConversationFragment;->handleScreenshotAction(Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;Lcom/helpshift/conversation/dto/AttachmentPickerFile;)Z

    :cond_0
    return-void
.end method

.method public removeAttachmentPreviewFragment()V
    .locals 2

    .line 647
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    const-class v1, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/support/util/FragmentUtil;->popBackStack(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public sendAnyway()V
    .locals 2

    .line 577
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object v0

    sget-object v1, Lcom/helpshift/analytics/AnalyticsEventType;->TICKET_AVOIDANCE_FAILED:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {v0, v1}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;)V

    .line 578
    invoke-virtual {p0}, Lcom/helpshift/support/controllers/SupportController;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-class v1, Lcom/helpshift/support/fragments/SearchResultFragment;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/support/util/FragmentUtil;->popBackStackImmediate(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 579
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v1, "HSNewConversationFragment"

    .line 580
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/conversations/NewConversationFragment;

    if-eqz v0, :cond_0

    .line 582
    invoke-virtual {v0}, Lcom/helpshift/support/conversations/NewConversationFragment;->startNewConversation()V

    :cond_0
    return-void
.end method

.method public sendAttachment(Lcom/helpshift/conversation/dto/AttachmentPickerFile;Ljava/lang/String;)V
    .locals 2

    .line 615
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    const-class v1, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/support/util/FragmentUtil;->popBackStack(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 616
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v1, "HSConversationFragment"

    .line 617
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/conversations/ConversationalFragment;

    if-eqz v0, :cond_0

    .line 619
    sget-object v1, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;->SEND:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    invoke-virtual {v0, v1, p1, p2}, Lcom/helpshift/support/conversations/ConversationalFragment;->handleAttachmentAction(Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;Lcom/helpshift/conversation/dto/AttachmentPickerFile;Ljava/lang/String;)Z

    :cond_0
    return-void
.end method

.method public setSearchPerformed(Z)V
    .locals 0

    .line 102
    iput-boolean p1, p0, Lcom/helpshift/support/controllers/SupportController;->searchPerformed:Z

    return-void
.end method

.method public showConversationSearchResultFragment(Landroid/os/Bundle;)V
    .locals 4

    .line 430
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    sget v1, Lcom/helpshift/R$id;->flow_fragment_container:I

    .line 432
    invoke-static {p1, p0}, Lcom/helpshift/support/fragments/SearchResultFragment;->newInstance(Landroid/os/Bundle;Lcom/helpshift/support/contracts/SearchResultListener;)Lcom/helpshift/support/fragments/SearchResultFragment;

    move-result-object p1

    const-string v2, "HSSearchResultFragment"

    const/4 v3, 0x0

    .line 430
    invoke-static {v0, v1, p1, v2, v3}, Lcom/helpshift/support/util/FragmentUtil;->startFragmentWithBackStack(Landroidx/fragment/app/FragmentManager;ILandroidx/fragment/app/Fragment;Ljava/lang/String;Z)V

    return-void
.end method

.method public showConversationSetupFragment()V
    .locals 9

    const-string v0, "Helpshift_SupportContr"

    const-string v1, "Starting conversation setup fragment."

    .line 310
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    invoke-static {}, Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;->newInstance()Lcom/helpshift/support/conversations/usersetup/ConversationSetupFragment;

    move-result-object v4

    .line 313
    iget-boolean v0, p0, Lcom/helpshift/support/controllers/SupportController;->conversationAddToBackStack:Z

    if-eqz v0, :cond_0

    .line 314
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 317
    invoke-direct {p0}, Lcom/helpshift/support/controllers/SupportController;->clearConversationStack()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move-object v6, v0

    .line 319
    iget-object v2, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    sget v3, Lcom/helpshift/R$id;->flow_fragment_container:I

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v5, "Helpshift_CnvStpFrgmnt"

    invoke-static/range {v2 .. v8}, Lcom/helpshift/support/util/FragmentUtil;->startFragment(Landroidx/fragment/app/FragmentManager;ILandroidx/fragment/app/Fragment;Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method public start()V
    .locals 4

    .line 106
    iget-boolean v0, p0, Lcom/helpshift/support/controllers/SupportController;->isControllerStarted:Z

    const/4 v1, 0x1

    if-nez v0, :cond_2

    .line 107
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    const-string v2, "support_mode"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/helpshift/support/controllers/SupportController;->supportMode:I

    if-eq v0, v1, :cond_1

    const/4 v2, 0x4

    if-eq v0, v2, :cond_0

    .line 116
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    invoke-static {}, Lcom/helpshift/support/flows/CustomContactUsFlowListHolder;->getFlowList()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0, v0, v3, v2}, Lcom/helpshift/support/controllers/SupportController;->startFaqFlow(Landroid/os/Bundle;ZLjava/util/List;)V

    goto :goto_0

    .line 113
    :cond_0
    invoke-static {}, Lcom/helpshift/support/flows/DynamicFormFlowListHolder;->getFlowList()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0, v3}, Lcom/helpshift/support/controllers/SupportController;->startDynamicForm(Ljava/util/List;Z)V

    goto :goto_0

    .line 110
    :cond_1
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    invoke-virtual {p0, v0, v3}, Lcom/helpshift/support/controllers/SupportController;->startConversationFlow(Landroid/os/Bundle;Z)V

    .line 120
    :cond_2
    :goto_0
    iput-boolean v1, p0, Lcom/helpshift/support/controllers/SupportController;->isControllerStarted:Z

    return-void
.end method

.method public startConversationFlow()V
    .locals 1

    .line 190
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0, v0}, Lcom/helpshift/support/controllers/SupportController;->startConversationFlow(Ljava/util/Map;)V

    return-void
.end method

.method public startConversationFlow(Landroid/os/Bundle;Z)V
    .locals 0

    .line 184
    iput-boolean p2, p0, Lcom/helpshift/support/controllers/SupportController;->conversationAddToBackStack:Z

    .line 185
    iput-object p1, p0, Lcom/helpshift/support/controllers/SupportController;->conversationBundle:Landroid/os/Bundle;

    .line 186
    invoke-virtual {p0}, Lcom/helpshift/support/controllers/SupportController;->startConversationFlow()V

    return-void
.end method

.method public startConversationFlow(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 198
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    .line 199
    new-instance v1, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;

    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object v2

    .line 200
    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getConfigFetchDM()Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;

    move-result-object v3

    .line 201
    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserManagerDM;->getActiveUserSetupDM()Lcom/helpshift/account/domainmodel/UserSetupDM;

    move-result-object v0

    invoke-direct {v1, v2, v3, v0}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;Lcom/helpshift/account/domainmodel/UserSetupDM;)V

    .line 203
    invoke-virtual {v1}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->getState()Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    move-result-object v0

    .line 209
    sget-object v1, Lcom/helpshift/support/controllers/SupportController$1;->$SwitchMap$com$helpshift$conversation$domainmodel$ConversationSetupDM$ConversationSetupState:[I

    invoke-virtual {v0}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->ordinal()I

    move-result v0

    aget v0, v1, v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 216
    :cond_0
    invoke-direct {p0, p1}, Lcom/helpshift/support/controllers/SupportController;->startConversationFlowInternal(Ljava/util/Map;)V

    goto :goto_0

    .line 213
    :cond_1
    invoke-virtual {p0}, Lcom/helpshift/support/controllers/SupportController;->showConversationSetupFragment()V

    :goto_0
    return-void
.end method

.method public startDynamicForm(ILjava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/helpshift/support/flows/Flow;",
            ">;Z)V"
        }
    .end annotation

    .line 478
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 479
    iget-object v1, p0, Lcom/helpshift/support/controllers/SupportController;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    const-string v1, "flow_title"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 481
    :cond_0
    invoke-virtual {p0, p2, p3}, Lcom/helpshift/support/controllers/SupportController;->startDynamicForm(Ljava/util/List;Z)V

    return-void
.end method

.method public startDynamicForm(Ljava/lang/String;Ljava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/helpshift/support/flows/Flow;",
            ">;Z)V"
        }
    .end annotation

    .line 470
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    const-string v1, "flow_title"

    .line 471
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    :cond_0
    invoke-virtual {p0, p2, p3}, Lcom/helpshift/support/controllers/SupportController;->startDynamicForm(Ljava/util/List;Z)V

    return-void
.end method

.method public startDynamicForm(Ljava/util/List;Z)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/support/flows/Flow;",
            ">;Z)V"
        }
    .end annotation

    .line 454
    iget-object v0, p0, Lcom/helpshift/support/controllers/SupportController;->bundle:Landroid/os/Bundle;

    invoke-static {v0, p1, p0}, Lcom/helpshift/support/fragments/DynamicFormFragment;->newInstance(Landroid/os/Bundle;Ljava/util/List;Lcom/helpshift/support/controllers/SupportController;)Lcom/helpshift/support/fragments/DynamicFormFragment;

    move-result-object v3

    if-eqz p2, :cond_0

    .line 457
    const-class p1, Lcom/helpshift/support/fragments/DynamicFormFragment;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    move-object v5, p1

    .line 459
    iget-object v1, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    sget v2, Lcom/helpshift/R$id;->flow_fragment_container:I

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v4, "HSDynamicFormFragment"

    invoke-static/range {v1 .. v7}, Lcom/helpshift/support/util/FragmentUtil;->startFragment(Landroidx/fragment/app/FragmentManager;ILandroidx/fragment/app/Fragment;Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method public startFaqFlow(Landroid/os/Bundle;ZLjava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "Z",
            "Ljava/util/List<",
            "Lcom/helpshift/support/flows/Flow;",
            ">;)V"
        }
    .end annotation

    .line 330
    invoke-direct {p0, p1}, Lcom/helpshift/support/controllers/SupportController;->isDuplicateFAQScreenAlreadyOpen(Landroid/os/Bundle;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 333
    :cond_0
    invoke-static {p1, p3}, Lcom/helpshift/support/fragments/FaqFlowFragment;->newInstance(Landroid/os/Bundle;Ljava/util/List;)Lcom/helpshift/support/fragments/FaqFlowFragment;

    move-result-object v3

    const/4 p1, 0x0

    if-eqz p2, :cond_1

    .line 336
    const-class p1, Lcom/helpshift/support/fragments/FaqFlowFragment;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    :cond_1
    move-object v5, p1

    .line 338
    iget-object v1, p0, Lcom/helpshift/support/controllers/SupportController;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    sget v2, Lcom/helpshift/R$id;->flow_fragment_container:I

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v4, "Helpshift_FaqFlowFrag"

    invoke-static/range {v1 .. v7}, Lcom/helpshift/support/util/FragmentUtil;->startFragment(Landroidx/fragment/app/FragmentManager;ILandroidx/fragment/app/Fragment;Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method public startScreenshotPreviewFragment(Lcom/helpshift/conversation/dto/AttachmentPickerFile;Landroid/os/Bundle;Lcom/helpshift/support/fragments/AttachmentPreviewFragment$LaunchSource;)V
    .locals 5

    .line 441
    invoke-virtual {p0}, Lcom/helpshift/support/controllers/SupportController;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/util/FragmentUtil;->getScreenshotPreviewFragment(Landroidx/fragment/app/FragmentManager;)Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    move-result-object v0

    if-nez v0, :cond_0

    .line 443
    invoke-static {p0}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->newInstance(Lcom/helpshift/support/contracts/AttachmentPreviewListener;)Lcom/helpshift/support/fragments/AttachmentPreviewFragment;

    move-result-object v0

    .line 444
    invoke-virtual {p0}, Lcom/helpshift/support/controllers/SupportController;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    sget v2, Lcom/helpshift/R$id;->flow_fragment_container:I

    const/4 v3, 0x0

    const-string v4, "AttachmentPreviewFragment"

    invoke-static {v1, v2, v0, v4, v3}, Lcom/helpshift/support/util/FragmentUtil;->startFragmentWithBackStack(Landroidx/fragment/app/FragmentManager;ILandroidx/fragment/app/Fragment;Ljava/lang/String;Z)V

    .line 450
    :cond_0
    invoke-virtual {v0, p2, p1, p3}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment;->setParams(Landroid/os/Bundle;Lcom/helpshift/conversation/dto/AttachmentPickerFile;Lcom/helpshift/support/fragments/AttachmentPreviewFragment$LaunchSource;)V

    return-void
.end method
