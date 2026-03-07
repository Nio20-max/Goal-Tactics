.class public Lcom/helpshift/conversation/viewmodel/MessageListVM;
.super Ljava/lang/Object;
.source "MessageListVM.java"


# instance fields
.field protected final domain:Lcom/helpshift/common/domain/Domain;

.field messageListVMCallback:Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;

.field protected final platform:Lcom/helpshift/common/platform/Platform;

.field private timeZoneOffSet:J

.field private uiConversationLocalIdMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Lcom/helpshift/conversation/activeconversation/UIConversation;",
            ">;"
        }
    .end annotation
.end field

.field uiMessageDMs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiConversationLocalIdMap:Ljava/util/Map;

    .line 47
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 48
    iput-object p2, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->domain:Lcom/helpshift/common/domain/Domain;

    .line 49
    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getDevice()Lcom/helpshift/common/platform/Device;

    move-result-object p1

    invoke-interface {p1}, Lcom/helpshift/common/platform/Device;->getTimeZoneOffSet()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->timeZoneOffSet:J

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/conversation/viewmodel/MessageListVM;I)Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getItemAtPosition(I)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/helpshift/conversation/viewmodel/MessageListVM;Ljava/util/List;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->appendUIMessages(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$200(Lcom/helpshift/conversation/viewmodel/MessageListVM;Ljava/util/List;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->insertUIMessages(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$300(Lcom/helpshift/conversation/viewmodel/MessageListVM;Ljava/util/List;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->notifyNewUIMessagesAdded(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$400(Lcom/helpshift/conversation/viewmodel/MessageListVM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isSystemMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$500(Lcom/helpshift/conversation/viewmodel/MessageListVM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;ZZ)Ljava/util/List;
    .locals 0

    .line 36
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->buildSystemMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;ZZ)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private appendUIMessages(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 528
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    .line 529
    invoke-direct {p0, v1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getItemAtPosition(I)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object v2

    const/4 v3, 0x1

    .line 530
    invoke-direct {p0, p1, v2, v3}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->insertSystemMessageDMs(Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/MessageDM;Z)Ljava/util/List;

    move-result-object p1

    .line 532
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 533
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    .line 534
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v3

    invoke-virtual {p0, v2, v1, v4}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->checkAndUpdateGroupByTime(Ljava/util/List;II)Lcom/helpshift/util/ValuePair;

    move-result-object v1

    .line 535
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->messageListVMCallback:Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;

    if-eqz v2, :cond_0

    .line 536
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-interface {v2, v0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;->appendMessages(II)V

    if-eqz v1, :cond_0

    .line 538
    iget-object p1, v1, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ge p1, v0, :cond_0

    .line 540
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->messageListVMCallback:Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;

    sub-int/2addr v0, p1

    invoke-interface {v1, p1, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;->updateMessages(II)V

    :cond_0
    return-void
.end method

.method private buildSystemDividerMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_4

    if-nez p2, :cond_0

    goto :goto_2

    .line 246
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isDifferentConversationMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result v1

    if-nez v1, :cond_1

    return-object v0

    .line 260
    :cond_1
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getUIConversation(J)Lcom/helpshift/conversation/activeconversation/UIConversation;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    .line 261
    iget-boolean v0, v0, Lcom/helpshift/conversation/activeconversation/UIConversation;->isRedacted:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_3

    .line 269
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getIssueStateForMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Lcom/helpshift/conversation/dto/IssueState;

    move-result-object p1

    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p1, v0, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    .line 271
    :goto_1
    invoke-direct {p0, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getDateFromMessageDM(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Ljava/util/Date;

    move-result-object p1

    invoke-direct {p0, p1, v1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->generateConversationDividerMessage(Ljava/util/Date;Z)Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;

    move-result-object p1

    .line 272
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;->conversationLocalId:Ljava/lang/Long;

    return-object p1

    :cond_4
    :goto_2
    return-object v0
.end method

.method private buildSystemMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;ZZ)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            "ZZ)",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;",
            ">;"
        }
    .end annotation

    if-nez p2, :cond_0

    .line 293
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    return-object p1

    .line 295
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 297
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->buildSystemDividerMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 299
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 302
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isDifferentConversationMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result v1

    .line 303
    invoke-direct {p0, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getDateFromMessageDM(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Ljava/util/Date;

    move-result-object v2

    .line 304
    iget-object v3, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {p0, v3, v4}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getUIConversation(J)Lcom/helpshift/conversation/activeconversation/UIConversation;

    move-result-object v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_2

    .line 305
    iget-boolean v6, v3, Lcom/helpshift/conversation/activeconversation/UIConversation;->isRedacted:Z

    if-eqz v6, :cond_2

    const/4 v6, 0x1

    goto :goto_0

    :cond_2
    const/4 v6, 0x0

    :goto_0
    if-nez v6, :cond_7

    if-nez v1, :cond_4

    if-eqz p3, :cond_3

    goto :goto_1

    .line 343
    :cond_3
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isMessagesDayDifferent(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result p1

    if-eqz p1, :cond_7

    .line 344
    invoke-direct {p0, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isSystemDateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result p1

    if-nez p1, :cond_7

    .line 345
    iget-object p1, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    invoke-direct {p0, v2, p3, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->generateSystemDateMessageDM(Ljava/util/Date;ZLjava/lang/Long;)Lcom/helpshift/conversation/activeconversation/message/SystemDateMessageDM;

    move-result-object p1

    .line 348
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/message/SystemDateMessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 349
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_4
    :goto_1
    if-eqz v3, :cond_6

    if-eqz p4, :cond_5

    .line 319
    iget-boolean p1, v3, Lcom/helpshift/conversation/activeconversation/UIConversation;->isInPreIssueMode:Z

    if-nez p1, :cond_5

    iget-object p1, v3, Lcom/helpshift/conversation/activeconversation/UIConversation;->publishId:Ljava/lang/String;

    .line 321
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_5

    goto :goto_2

    :cond_5
    const/4 v4, 0x0

    :goto_2
    if-eqz v4, :cond_6

    .line 324
    iget-object p1, v3, Lcom/helpshift/conversation/activeconversation/UIConversation;->publishId:Ljava/lang/String;

    iget-object p4, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 325
    invoke-direct {p0, p1, v2, p3, p4}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->generateSystemPublishIdMessageDM(Ljava/lang/String;Ljava/util/Date;ZLjava/lang/Long;)Lcom/helpshift/conversation/activeconversation/message/SystemPublishIdMessageDM;

    move-result-object p1

    .line 329
    iget-object p3, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    iput-object p3, p1, Lcom/helpshift/conversation/activeconversation/message/SystemPublishIdMessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 330
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 p3, 0x0

    .line 337
    :cond_6
    iget-object p1, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    invoke-direct {p0, v2, p3, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->generateSystemDateMessageDM(Ljava/util/Date;ZLjava/lang/Long;)Lcom/helpshift/conversation/activeconversation/message/SystemDateMessageDM;

    move-result-object p1

    .line 340
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/message/SystemDateMessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 341
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_7
    :goto_3
    return-object v0
.end method

.method private canGroupMessagesByTime(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_b

    if-nez p2, :cond_0

    goto/16 :goto_1

    .line 792
    :cond_0
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->body:Ljava/lang/String;

    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    return v0

    .line 797
    :cond_1
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isUserMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-direct {p0, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isUserMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 798
    :cond_2
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isAdminMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-direct {p0, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isAdminMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_1

    .line 803
    :cond_3
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v1

    .line 804
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v3

    .line 803
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isMinuteDifferent(JJ)Z

    move-result v1

    if-eqz v1, :cond_4

    return v0

    .line 809
    :cond_4
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isUserMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_6

    .line 810
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isUserMessageSent(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-direct {p0, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isUserMessageSent(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result p1

    if-eqz p1, :cond_5

    const/4 v0, 0x1

    :cond_5
    return v0

    .line 820
    :cond_6
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getDisplayedAuthorName()Ljava/lang/String;

    move-result-object v1

    .line 821
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getDisplayedAuthorName()Ljava/lang/String;

    move-result-object v3

    .line 822
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/Author;->authorId:Ljava/lang/String;

    .line 823
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/Author;->authorId:Ljava/lang/String;

    .line 824
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_8

    invoke-static {p2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    goto :goto_0

    .line 834
    :cond_7
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_8
    :goto_0
    if-nez v1, :cond_a

    if-nez v3, :cond_9

    const/4 v0, 0x1

    :cond_9
    return v0

    .line 830
    :cond_a
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_b
    :goto_1
    return v0
.end method

.method private containsAdminMessages(Ljava/util/List;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)Z"
        }
    .end annotation

    .line 573
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 574
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isAdminMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private declared-synchronized filterUIMessages(Ljava/util/Collection;)Ljava/util/List;
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

    monitor-enter p0

    .line 158
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_0

    .line 160
    monitor-exit p0

    return-object v0

    .line 163
    :cond_0
    :try_start_1
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 164
    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isUISupportedMessage()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 165
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 168
    :cond_2
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private findBinaryIndex(JII)I
    .locals 5

    sub-int v0, p4, p3

    .line 727
    div-int/lit8 v0, v0, 0x2

    add-int/2addr v0, p3

    if-ne p3, v0, :cond_2

    .line 729
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v0

    .line 730
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    invoke-virtual {v2}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v2

    cmp-long v4, p1, v0

    if-gez v4, :cond_0

    return p3

    :cond_0
    cmp-long p3, p1, v2

    if-ltz p3, :cond_1

    add-int/lit8 p4, p4, 0x1

    :cond_1
    return p4

    .line 742
    :cond_2
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v1

    cmp-long v3, v1, p1

    if-gtz v3, :cond_3

    .line 744
    invoke-direct {p0, p1, p2, v0, p4}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->findBinaryIndex(JII)I

    move-result p1

    return p1

    .line 747
    :cond_3
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->findBinaryIndex(JII)I

    move-result p1

    return p1
.end method

.method private findBinaryIndexIntoUIList(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)I
    .locals 4

    .line 710
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 716
    :cond_0
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v2

    add-int/lit8 p1, v0, -0x1

    invoke-direct {p0, v2, v3, v1, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->findBinaryIndex(JII)I

    move-result p1

    if-gez p1, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    if-le p1, v0, :cond_2

    goto :goto_0

    :cond_2
    move v0, p1

    :goto_0
    return v0
.end method

.method private generateConversationDividerMessage(Ljava/util/Date;Z)Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;
    .locals 3

    .line 372
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 373
    sget-object p1, Lcom/helpshift/common/util/HSDateFormatSpec;->STORAGE_TIME_FORMAT:Lcom/helpshift/util/HSSimpleDateFormat;

    invoke-virtual {p1, v0}, Lcom/helpshift/util/HSSimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    .line 374
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;

    .line 375
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getEpochTimeForSystemMessage(Ljava/lang/String;)J

    move-result-wide v1

    invoke-direct {v0, p1, v1, v2, p2}, Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;-><init>(Ljava/lang/String;JZ)V

    .line 376
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    return-object v0
.end method

.method private generateSystemDateMessageDM(Ljava/util/Date;ZLjava/lang/Long;)Lcom/helpshift/conversation/activeconversation/message/SystemDateMessageDM;
    .locals 3

    .line 360
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 361
    sget-object p1, Lcom/helpshift/common/util/HSDateFormatSpec;->STORAGE_TIME_FORMAT:Lcom/helpshift/util/HSSimpleDateFormat;

    invoke-virtual {p1, v0}, Lcom/helpshift/util/HSSimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    .line 362
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/SystemDateMessageDM;

    .line 363
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getEpochTimeForSystemMessage(Ljava/lang/String;)J

    move-result-wide v1

    invoke-direct {v0, p1, v1, v2, p2}, Lcom/helpshift/conversation/activeconversation/message/SystemDateMessageDM;-><init>(Ljava/lang/String;JZ)V

    .line 365
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/conversation/activeconversation/message/SystemDateMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 366
    iput-object p3, v0, Lcom/helpshift/conversation/activeconversation/message/SystemDateMessageDM;->conversationLocalId:Ljava/lang/Long;

    return-object v0
.end method

.method private generateSystemPublishIdMessageDM(Ljava/lang/String;Ljava/util/Date;ZLjava/lang/Long;)Lcom/helpshift/conversation/activeconversation/message/SystemPublishIdMessageDM;
    .locals 7

    .line 383
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 384
    sget-object p2, Lcom/helpshift/common/util/HSDateFormatSpec;->STORAGE_TIME_FORMAT:Lcom/helpshift/util/HSSimpleDateFormat;

    invoke-virtual {p2, v0}, Lcom/helpshift/util/HSSimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    .line 385
    new-instance p2, Lcom/helpshift/conversation/activeconversation/message/SystemPublishIdMessageDM;

    .line 386
    invoke-direct {p0, v3}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getEpochTimeForSystemMessage(Ljava/lang/String;)J

    move-result-wide v4

    move-object v1, p2

    move-object v2, p1

    move v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/helpshift/conversation/activeconversation/message/SystemPublishIdMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JZ)V

    .line 388
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object p3, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {p2, p1, p3}, Lcom/helpshift/conversation/activeconversation/message/SystemPublishIdMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 389
    iput-object p4, p2, Lcom/helpshift/conversation/activeconversation/message/SystemPublishIdMessageDM;->conversationLocalId:Ljava/lang/Long;

    return-object p2
.end method

.method private getDateFromMessageDM(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Ljava/util/Date;
    .locals 3

    .line 399
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method private getEpochTimeForSystemMessage(Ljava/lang/String;)J
    .locals 4

    .line 395
    invoke-static {p1}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method private getIssueStateForMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Lcom/helpshift/conversation/dto/IssueState;
    .locals 2

    if-nez p1, :cond_0

    .line 196
    sget-object p1, Lcom/helpshift/conversation/dto/IssueState;->UNKNOWN:Lcom/helpshift/conversation/dto/IssueState;

    return-object p1

    .line 198
    :cond_0
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getUIConversation(J)Lcom/helpshift/conversation/activeconversation/UIConversation;

    move-result-object p1

    if-nez p1, :cond_1

    .line 200
    sget-object p1, Lcom/helpshift/conversation/dto/IssueState;->UNKNOWN:Lcom/helpshift/conversation/dto/IssueState;

    return-object p1

    .line 202
    :cond_1
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/UIConversation;->issueState:Lcom/helpshift/conversation/dto/IssueState;

    return-object p1
.end method

.method private getItemAtPosition(I)Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    if-ltz p1, :cond_1

    .line 703
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 706
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private getSortMessagesComparator()Ljava/util/Comparator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    .line 438
    new-instance v0, Lcom/helpshift/conversation/viewmodel/MessageListVM$1;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/viewmodel/MessageListVM$1;-><init>(Lcom/helpshift/conversation/viewmodel/MessageListVM;)V

    return-object v0
.end method

.method private declared-synchronized groupConversationRedactedMessages(Ljava/util/List;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 119
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 120
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 121
    monitor-exit p0

    return-object v0

    .line 126
    :cond_0
    :try_start_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v3, v1

    const/4 v4, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 127
    instance-of v6, v5, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;

    if-eqz v6, :cond_1

    add-int/lit8 v4, v4, 0x1

    .line 129
    check-cast v5, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;

    move-object v3, v5

    goto :goto_0

    :cond_1
    if-eqz v3, :cond_2

    .line 133
    iput v4, v3, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;->contiguousRedactedConversationsCount:I

    .line 134
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v3, v1

    const/4 v4, 0x0

    .line 140
    :cond_2
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    if-eqz v3, :cond_4

    .line 145
    iput v4, v3, Lcom/helpshift/conversation/activeconversation/message/SystemRedactedConversationMessageDM;->contiguousRedactedConversationsCount:I

    .line 146
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 148
    :cond_4
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized insertSystemMessageDMs(Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/MessageDM;Z)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            "Z)",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 210
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 212
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->domain:Lcom/helpshift/common/domain/Domain;

    .line 213
    invoke-virtual {v1}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v1

    const-string v2, "showConversationInfoScreen"

    invoke-virtual {v1, v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez p3, :cond_0

    if-nez p2, :cond_0

    const/4 p3, 0x1

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    .line 217
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 219
    invoke-direct {p0, p2, v3, p3, v1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->buildSystemMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;ZZ)Ljava/util/List;

    move-result-object p2

    .line 223
    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 226
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object p2, v3

    const/4 p3, 0x0

    goto :goto_1

    .line 230
    :cond_1
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private insertSystemMessageDMsForLatestEmptyConversation(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/UIConversation;",
            ">;)V"
        }
    .end annotation

    .line 79
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-static {v0}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 83
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 84
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 85
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/UIConversation;

    .line 86
    iget-wide v3, p1, Lcom/helpshift/conversation/activeconversation/UIConversation;->localID:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 90
    invoke-virtual {v3, v1}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 91
    iget-object v1, v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {p0, v3, v4}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getUIConversation(J)Lcom/helpshift/conversation/activeconversation/UIConversation;

    move-result-object v1

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    .line 92
    iget-boolean v1, v1, Lcom/helpshift/conversation/activeconversation/UIConversation;->isRedacted:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_2

    .line 98
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getIssueStateForMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Lcom/helpshift/conversation/dto/IssueState;

    move-result-object v0

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v0, v1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    .line 100
    :goto_1
    new-instance v0, Ljava/util/Date;

    iget-wide v4, p1, Lcom/helpshift/conversation/activeconversation/UIConversation;->epochCreateTime:J

    invoke-direct {v0, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 101
    invoke-direct {p0, v0, v2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->generateConversationDividerMessage(Ljava/util/Date;Z)Lcom/helpshift/conversation/activeconversation/message/SystemDividerMessageDM;

    move-result-object v1

    .line 102
    iget-wide v4, p1, Lcom/helpshift/conversation/activeconversation/UIConversation;->localID:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-direct {p0, v0, v3, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->generateSystemDateMessageDM(Ljava/util/Date;ZLjava/lang/Long;)Lcom/helpshift/conversation/activeconversation/message/SystemDateMessageDM;

    move-result-object p1

    .line 103
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    return-void
.end method

.method private insertUIMessages(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 552
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 553
    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->insertUIMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    goto :goto_0

    .line 557
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->notifyMessageListVMRefreshAll()V

    return-void
.end method

.method private isAdminMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z
    .locals 0

    .line 757
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isAdminMessage:Z

    return p1
.end method

.method private isDayDifferent(JJ)Z
    .locals 2

    .line 419
    iget-wide v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->timeZoneOffSet:J

    add-long/2addr p1, v0

    add-long/2addr p3, v0

    const-wide/32 v0, 0x5265c00

    .line 422
    div-long/2addr p1, v0

    .line 423
    div-long/2addr p3, v0

    cmp-long v0, p1, p3

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isDifferentConversationMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z
    .locals 0

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 184
    :cond_0
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    invoke-virtual {p1, p2}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method private isMessagesDayDifferent(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z
    .locals 2

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 415
    :cond_0
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide p1

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isDayDifferent(JJ)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method private isMinuteDifferent(JJ)Z
    .locals 2

    .line 428
    iget-wide v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->timeZoneOffSet:J

    add-long/2addr p1, v0

    add-long/2addr p3, v0

    const-wide/32 v0, 0xea60

    .line 432
    div-long/2addr p1, v0

    .line 433
    div-long/2addr p3, v0

    cmp-long v0, p1, p3

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isSystemDateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z
    .locals 0

    .line 407
    instance-of p1, p1, Lcom/helpshift/conversation/activeconversation/message/SystemDateMessageDM;

    return p1
.end method

.method private isSystemMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z
    .locals 0

    .line 403
    instance-of p1, p1, Lcom/helpshift/conversation/activeconversation/message/SystemMessageDM;

    return p1
.end method

.method private isUserMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z
    .locals 1

    .line 753
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isAdminMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isSystemMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isUserMessageSent(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 767
    :cond_0
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/MessageType;->USER_TEXT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    const/4 v3, 0x1

    if-eq v1, v2, :cond_3

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/MessageType;->USER_RESP_FOR_TEXT_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-eq v1, v2, :cond_3

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/MessageType;->USER_RESP_FOR_OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v1, v2, :cond_1

    goto :goto_0

    .line 772
    :cond_1
    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->messageType:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/MessageType;->SCREENSHOT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    if-ne v1, v2, :cond_2

    .line 773
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    if-ne p1, v1, :cond_2

    const/4 v0, 0x1

    :cond_2
    return v0

    .line 770
    :cond_3
    :goto_0
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->getState()Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    move-result-object p1

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    if-ne p1, v1, :cond_4

    const/4 v0, 0x1

    :cond_4
    return v0
.end method

.method private notifyNewUIMessagesAdded(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 516
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->containsAdminMessages(Ljava/util/List;)Z

    move-result p1

    .line 517
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->messageListVMCallback:Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    .line 519
    invoke-interface {v0}, Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;->newAdminMessagesAdded()V

    goto :goto_0

    .line 522
    :cond_0
    invoke-interface {v0}, Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;->newUserMessagesAdded()V

    :cond_1
    :goto_0
    return-void
.end method

.method private updateMessageGroupViewState(Lcom/helpshift/conversation/activeconversation/message/MessageDM;ZZ)Z
    .locals 3

    .line 850
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getUiViewState()Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    .line 859
    new-instance p1, Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    invoke-direct {p1, v1, v2}, Lcom/helpshift/conversation/activeconversation/message/UIViewState;-><init>(ZZ)V

    goto :goto_1

    .line 868
    :cond_0
    new-instance p2, Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isUserMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result p1

    invoke-direct {p2, v1, p1}, Lcom/helpshift/conversation/activeconversation/message/UIViewState;-><init>(ZZ)V

    goto :goto_0

    :cond_1
    if-eqz p3, :cond_2

    .line 879
    new-instance p2, Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isAdminMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result p1

    invoke-direct {p2, v2, p1}, Lcom/helpshift/conversation/activeconversation/message/UIViewState;-><init>(ZZ)V

    :goto_0
    move-object p1, p2

    goto :goto_1

    .line 886
    :cond_2
    new-instance p1, Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    invoke-direct {p1, v2, v1}, Lcom/helpshift/conversation/activeconversation/message/UIViewState;-><init>(ZZ)V

    .line 891
    :goto_1
    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/message/UIViewState;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    return v2

    .line 895
    :cond_3
    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/message/UIViewState;->updateViewState(Lcom/helpshift/conversation/activeconversation/message/UIViewState;)V

    return v1
.end method


# virtual methods
.method public addMessages(Ljava/util/Collection;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 494
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->processAddedMessages(Ljava/util/Collection;)Ljava/util/List;

    move-result-object p1

    .line 496
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 497
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/MessageListVM$2;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM$2;-><init>(Lcom/helpshift/conversation/viewmodel/MessageListVM;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    :cond_0
    return-void
.end method

.method checkAndPrependSystemMessagesBeforeFirstMessage()V
    .locals 2

    .line 1074
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/MessageListVM$4;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/MessageListVM$4;-><init>(Lcom/helpshift/conversation/viewmodel/MessageListVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method checkAndUpdateGroupByDate(I)Z
    .locals 9

    .line 1001
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getItemAtPosition(I)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object v0

    add-int/lit8 v1, p1, 0x1

    .line 1002
    invoke-direct {p0, v1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getItemAtPosition(I)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object v1

    .line 1004
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isSystemDateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_1

    if-eqz v1, :cond_0

    .line 1005
    invoke-direct {p0, v1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isSystemDateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1006
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 p1, p1, -0x1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1011
    :goto_0
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getItemAtPosition(I)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object v1

    add-int/lit8 v4, p1, -0x1

    .line 1012
    invoke-direct {p0, v4}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getItemAtPosition(I)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object v4

    if-eqz v4, :cond_5

    if-eqz v1, :cond_5

    .line 1014
    invoke-direct {p0, v1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isSystemDateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_2

    .line 1018
    :cond_2
    invoke-direct {p0, v4, v1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isMessagesDayDifferent(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1019
    new-instance v0, Ljava/util/Date;

    .line 1020
    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v4

    invoke-direct {v0, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 1021
    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v8, v4, v6

    if-nez v8, :cond_3

    const/4 v2, 0x1

    :cond_3
    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->conversationLocalId:Ljava/lang/Long;

    .line 1020
    invoke-direct {p0, v0, v2, v1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->generateSystemDateMessageDM(Ljava/util/Date;ZLjava/lang/Long;)Lcom/helpshift/conversation/activeconversation/message/SystemDateMessageDM;

    move-result-object v0

    .line 1023
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v1, p1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_1

    :cond_4
    move v3, v0

    :goto_1
    return v3

    :cond_5
    :goto_2
    return v0
.end method

.method declared-synchronized checkAndUpdateGroupByTime(Ljava/util/List;II)Lcom/helpshift/util/ValuePair;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;II)",
            "Lcom/helpshift/util/ValuePair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 928
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    .line 929
    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    move-result p2

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    .line 930
    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v3, 0x0

    if-ge p3, p2, :cond_0

    .line 933
    monitor-exit p0

    return-object v3

    :cond_0
    const/4 v4, -0x1

    if-lez p2, :cond_3

    add-int/lit8 v5, p2, -0x1

    .line 941
    :try_start_1
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 944
    invoke-virtual {p0, v5}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isGroupFirstMessageAtIndex(I)Z

    move-result v7

    .line 945
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    invoke-direct {p0, v6, v8}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->canGroupMessagesByTime(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result v8

    if-nez v8, :cond_1

    const/4 v9, 0x1

    goto :goto_0

    :cond_1
    const/4 v9, 0x0

    .line 946
    :goto_0
    invoke-direct {p0, v6, v7, v9}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->updateMessageGroupViewState(Lcom/helpshift/conversation/activeconversation/message/MessageDM;ZZ)Z

    move-result v6

    if-eqz v6, :cond_2

    move v6, v5

    goto :goto_1

    :cond_2
    const/4 v5, -0x1

    const/4 v6, -0x1

    :goto_1
    xor-int/lit8 v7, v8, 0x1

    goto :goto_2

    :cond_3
    const/4 v5, -0x1

    const/4 v6, -0x1

    const/4 v7, 0x1

    :goto_2
    if-gt p2, p3, :cond_8

    .line 956
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    if-ne p2, v0, :cond_4

    .line 959
    invoke-direct {p0, v8, v7, v2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->updateMessageGroupViewState(Lcom/helpshift/conversation/activeconversation/message/MessageDM;ZZ)Z

    move-result v8

    goto :goto_3

    :cond_4
    add-int/lit8 v9, p2, 0x1

    .line 964
    invoke-interface {p1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 965
    invoke-direct {p0, v8, v9}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->canGroupMessagesByTime(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 966
    invoke-direct {p0, v8, v7, v1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->updateMessageGroupViewState(Lcom/helpshift/conversation/activeconversation/message/MessageDM;ZZ)Z

    move-result v8

    const/4 v7, 0x0

    goto :goto_3

    .line 973
    :cond_5
    invoke-direct {p0, v8, v7, v2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->updateMessageGroupViewState(Lcom/helpshift/conversation/activeconversation/message/MessageDM;ZZ)Z

    move-result v8

    const/4 v7, 0x1

    :goto_3
    if-eqz v8, :cond_7

    if-ne v5, v4, :cond_6

    move v5, p2

    :cond_6
    move v6, p2

    :cond_7
    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    :cond_8
    if-eq v5, v4, :cond_9

    .line 988
    new-instance v3, Lcom/helpshift/util/ValuePair;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-direct {v3, p1, p2}, Lcom/helpshift/util/ValuePair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 990
    :cond_9
    monitor-exit p0

    return-object v3

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public copyOfUIMessageDMs()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    .line 1182
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 1183
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0

    .line 1186
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public getLastUIMessage()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 2

    .line 1190
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 1192
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    add-int/lit8 v0, v0, -0x1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public declared-synchronized getUIConversation(J)Lcom/helpshift/conversation/activeconversation/UIConversation;
    .locals 1

    monitor-enter p0

    .line 1163
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiConversationLocalIdMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/UIConversation;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getUiMessageDMs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    .line 1042
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    return-object v0
.end method

.method public initializeMessageList(Ljava/util/List;Ljava/util/List;ZLcom/helpshift/conversation/viewmodel/MessageListVMCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/UIConversation;",
            ">;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;Z",
            "Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;",
            ")V"
        }
    .end annotation

    .line 59
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->updateUIConversationOrder(Ljava/util/List;)V

    .line 61
    invoke-virtual {p0, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->processAddedMessages(Ljava/util/Collection;)Ljava/util/List;

    move-result-object p2

    .line 63
    invoke-direct {p0, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->groupConversationRedactedMessages(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    const/4 v0, 0x0

    .line 64
    invoke-direct {p0, p2, v0, p3}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->insertSystemMessageDMs(Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/MessageDM;Z)Ljava/util/List;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    .line 65
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->insertSystemMessageDMsForLatestEmptyConversation(Ljava/util/List;)V

    .line 67
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    const/4 p3, 0x0

    invoke-virtual {p0, p1, p3, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->checkAndUpdateGroupByTime(Ljava/util/List;II)Lcom/helpshift/util/ValuePair;

    .line 70
    iput-object p4, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->messageListVMCallback:Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;

    return-void
.end method

.method public insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 2

    if-eqz p1, :cond_1

    .line 588
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isUISupportedMessage()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 592
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/MessageListVM$3;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM$3;-><init>(Lcom/helpshift/conversation/viewmodel/MessageListVM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    :cond_1
    :goto_0
    return-void
.end method

.method insertUIMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 2

    .line 566
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->findBinaryIndexIntoUIList(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)I

    move-result v0

    .line 567
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v1, v0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 568
    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->checkAndUpdateGroupByDate(I)Z

    .line 569
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    add-int/lit8 v1, v0, -0x1

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, p1, v1, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->checkAndUpdateGroupByTime(Ljava/util/List;II)Lcom/helpshift/util/ValuePair;

    return-void
.end method

.method isGroupFirstMessageAtIndex(I)Z
    .locals 3

    if-gez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 v0, 0x1

    if-nez p1, :cond_1

    return v0

    .line 913
    :cond_1
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 914
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    sub-int/2addr p1, v0

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 915
    invoke-direct {p0, p1, v1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->canGroupMessagesByTime(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Z

    move-result p1

    xor-int/2addr p1, v0

    return p1
.end method

.method isMessageAtCorrectPosition(I)Z
    .locals 8

    .line 684
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getItemAtPosition(I)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    add-int/lit8 v2, p1, -0x1

    .line 689
    invoke-direct {p0, v2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getItemAtPosition(I)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 690
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v4

    invoke-virtual {v2}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v6

    cmp-long v2, v4, v6

    if-gez v2, :cond_1

    return v3

    :cond_1
    add-int/2addr p1, v1

    .line 694
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getItemAtPosition(I)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 695
    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v4

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getEpochCreatedAtTime()J

    move-result-wide v6

    cmp-long p1, v4, v6

    if-lez p1, :cond_2

    return v3

    :cond_2
    return v1
.end method

.method notifyMessageListUpdate(Lcom/helpshift/util/ValuePair;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/util/ValuePair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    return-void

    .line 673
    :cond_0
    iget-object v0, p1, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 674
    iget-object v1, p1, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int/2addr v1, v0

    add-int/lit8 v1, v1, 0x1

    .line 675
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->messageListVMCallback:Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;

    if-eqz v2, :cond_1

    if-lez v0, :cond_1

    if-lez v1, :cond_1

    iget-object p1, p1, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    .line 678
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge p1, v2, :cond_1

    .line 679
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->messageListVMCallback:Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;

    invoke-interface {p1, v0, v1}, Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;->updateMessages(II)V

    :cond_1
    return-void
.end method

.method notifyMessageListVMRefreshAll()V
    .locals 1

    .line 661
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->messageListVMCallback:Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;

    if-eqz v0, :cond_0

    .line 662
    invoke-interface {v0}, Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;->refreshAll()V

    :cond_0
    return-void
.end method

.method notifyUIMessageListUpdated()V
    .locals 1

    .line 1238
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->messageListVMCallback:Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;

    if-eqz v0, :cond_0

    .line 1239
    invoke-interface {v0}, Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;->onUIMessageListUpdated()V

    :cond_0
    return-void
.end method

.method public prependMessages(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;Z)V"
        }
    .end annotation

    .line 1046
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-nez p2, :cond_0

    .line 1048
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->checkAndPrependSystemMessagesBeforeFirstMessage()V

    :cond_0
    return-void

    .line 1054
    :cond_1
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->filterUIMessages(Ljava/util/Collection;)Ljava/util/List;

    move-result-object p1

    .line 1056
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getSortMessagesComparator()Ljava/util/Comparator;

    move-result-object v0

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1057
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->groupConversationRedactedMessages(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    const/4 v0, 0x0

    .line 1059
    invoke-direct {p0, p1, v0, p2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->insertSystemMessageDMs(Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/MessageDM;Z)Ljava/util/List;

    move-result-object p1

    const/4 p2, 0x0

    .line 1060
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->checkAndUpdateGroupByTime(Ljava/util/List;II)Lcom/helpshift/util/ValuePair;

    .line 1062
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->prependMessagesInternal(Ljava/util/List;)V

    return-void
.end method

.method prependMessagesInternal(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 1112
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1115
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;-><init>(Lcom/helpshift/conversation/viewmodel/MessageListVM;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method protected processAddedMessages(Ljava/util/Collection;)Ljava/util/List;
    .locals 1
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

    .line 485
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->filterUIMessages(Ljava/util/Collection;)Ljava/util/List;

    move-result-object p1

    .line 486
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->getSortMessagesComparator()Ljava/util/Comparator;

    move-result-object v0

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-object p1
.end method

.method public remove(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 1201
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->filterUIMessages(Ljava/util/Collection;)Ljava/util/List;

    move-result-object p1

    .line 1203
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1207
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/MessageListVM$6;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM$6;-><init>(Lcom/helpshift/conversation/viewmodel/MessageListVM;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public unregisterMessageListVMCallback()V
    .locals 1

    const/4 v0, 0x0

    .line 1033
    iput-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->messageListVMCallback:Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;

    return-void
.end method

.method public declared-synchronized updateUIConversationOrder(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/UIConversation;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    .line 1171
    :try_start_0
    invoke-static {p1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 1172
    monitor-exit p0

    return-void

    .line 1175
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiConversationLocalIdMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 1176
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/UIConversation;

    .line 1177
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiConversationLocalIdMap:Ljava/util/Map;

    iget-wide v2, v0, Lcom/helpshift/conversation/activeconversation/UIConversation;->localID:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1179
    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method updateUIMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 5

    .line 620
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return-void

    .line 627
    :cond_0
    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->isMessageAtCorrectPosition(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 628
    invoke-virtual {p0, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->checkAndUpdateGroupByDate(I)Z

    move-result p1

    .line 629
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    add-int/lit8 v2, v0, -0x1

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v1, v2, v3}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->checkAndUpdateGroupByTime(Ljava/util/List;II)Lcom/helpshift/util/ValuePair;

    move-result-object v1

    if-eqz p1, :cond_1

    .line 631
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->notifyMessageListVMRefreshAll()V

    goto :goto_1

    :cond_1
    if-eqz v1, :cond_2

    .line 637
    iget-object p1, v1, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 638
    iget-object v1, v1, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    move v4, v0

    move v0, p1

    move p1, v4

    goto :goto_0

    :cond_2
    move p1, v0

    .line 641
    :goto_0
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->messageListVMCallback:Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;

    if-eqz v1, :cond_4

    if-gt v0, p1, :cond_4

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    .line 642
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge p1, v1, :cond_4

    .line 643
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->messageListVMCallback:Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;

    sub-int/2addr p1, v0

    add-int/lit8 p1, p1, 0x1

    invoke-interface {v1, v0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;->updateMessages(II)V

    goto :goto_1

    .line 649
    :cond_3
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 v1, v0, -0x1

    .line 650
    invoke-virtual {p0, v1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->checkAndUpdateGroupByDate(I)Z

    .line 651
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v2, v1, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->checkAndUpdateGroupByTime(Ljava/util/List;II)Lcom/helpshift/util/ValuePair;

    .line 654
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->insertUIMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 656
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->notifyMessageListVMRefreshAll()V

    :cond_4
    :goto_1
    return-void
.end method
