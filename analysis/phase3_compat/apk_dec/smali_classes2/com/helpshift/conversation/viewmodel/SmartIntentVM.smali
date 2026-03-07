.class public Lcom/helpshift/conversation/viewmodel/SmartIntentVM;
.super Ljava/lang/Object;
.source "SmartIntentVM.java"

# interfaces
.implements Lcom/helpshift/conversation/smartintent/SmartIntentDMCallback;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_SmartVM"


# instance fields
.field private activeConversation:Lcom/helpshift/conversation/activeconversation/model/Conversation;

.field private backStackController:Lcom/helpshift/util/HSBackStackController;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/helpshift/util/HSBackStackController<",
            "Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;",
            ">;"
        }
    .end annotation
.end field

.field private cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

.field private callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

.field clearSearchViewState:Lcom/helpshift/widget/MutableBaseViewState;

.field private domain:Lcom/helpshift/common/domain/Domain;

.field private intentIdToSearchIntentUIModelMapping:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;",
            ">;>;"
        }
    .end annotation
.end field

.field private isInitialized:Z

.field private isShowingFakeTAI:Z

.field private lastSavedState:Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;

.field private lastSearchResultData:Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

.field private platform:Lcom/helpshift/common/platform/Platform;

.field replyButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

.field replyFieldViewState:Lcom/helpshift/widget/MutableReplyFieldViewState;

.field private skipSearchOnUserQueryChange:Z

.field private smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

.field private userDM:Lcom/helpshift/account/domainmodel/UserDM;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/model/Conversation;Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;)V
    .locals 2

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 57
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->isInitialized:Z

    .line 64
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->isShowingFakeTAI:Z

    const/4 v1, 0x0

    .line 65
    iput-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    .line 66
    iput-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->intentIdToSearchIntentUIModelMapping:Ljava/util/Map;

    .line 67
    iput-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSearchResultData:Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    .line 69
    new-instance v1, Lcom/helpshift/util/HSBackStackController;

    invoke-direct {v1}, Lcom/helpshift/util/HSBackStackController;-><init>()V

    iput-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    .line 79
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->skipSearchOnUserQueryChange:Z

    .line 84
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 85
    iput-object p2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->domain:Lcom/helpshift/common/domain/Domain;

    .line 86
    iput-object p5, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->activeConversation:Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 87
    iput-object p4, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    .line 88
    iput-object p3, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    .line 89
    iput-object p6, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    .line 91
    new-instance p1, Lcom/helpshift/widget/MutableBaseViewState;

    invoke-direct {p1}, Lcom/helpshift/widget/MutableBaseViewState;-><init>()V

    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->replyButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    .line 92
    new-instance p1, Lcom/helpshift/widget/MutableReplyFieldViewState;

    invoke-direct {p1}, Lcom/helpshift/widget/MutableReplyFieldViewState;-><init>()V

    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->replyFieldViewState:Lcom/helpshift/widget/MutableReplyFieldViewState;

    .line 93
    new-instance p1, Lcom/helpshift/widget/MutableBaseViewState;

    invoke-direct {p1}, Lcom/helpshift/widget/MutableBaseViewState;-><init>()V

    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->clearSearchViewState:Lcom/helpshift/widget/MutableBaseViewState;

    .line 94
    invoke-virtual {p1, v0}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    .line 97
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-virtual {p1, p0}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->registerSmartIntentDMCallback(Lcom/helpshift/conversation/smartintent/SmartIntentDMCallback;)V

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/conversation/viewmodel/SmartIntentVM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->handleTreeAvailable(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    return-void
.end method

.method static synthetic access$100(Lcom/helpshift/conversation/viewmodel/SmartIntentVM;)V
    .locals 0

    .line 49
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->handleTreeUnAvailable()V

    return-void
.end method

.method private buildSmartIntentCollapsedRootViewState(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;
    .locals 6

    .line 119
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 120
    iget-object v1, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->rootIntents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 121
    new-instance v3, Lcom/helpshift/conversation/smartintent/RootIntentUIModel;

    iget-object v4, v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->localId:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iget-object v2, v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->label:Ljava/lang/String;

    invoke-direct {v3, v4, v5, v2}, Lcom/helpshift/conversation/smartintent/RootIntentUIModel;-><init>(JLjava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 124
    :cond_0
    new-instance v1, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;

    iget-object v2, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->promptTitle:Ljava/lang/String;

    iget-object v3, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->textInputHint:Ljava/lang/String;

    iget-boolean p1, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->enforceIntentSelection:Z

    invoke-direct {v1, v2, v3, p1, v0}, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;)V

    return-object v1
.end method

.method private buildSmartIntentExpandedRootViewState(Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;)Lcom/helpshift/conversation/smartintent/SmartIntentExpandedRootViewState;
    .locals 4

    .line 132
    new-instance v0, Lcom/helpshift/conversation/smartintent/SmartIntentExpandedRootViewState;

    iget-object v1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;->promptTitle:Ljava/lang/String;

    iget-object v2, p1, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;->typingBoxHint:Ljava/lang/String;

    iget-boolean v3, p1, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;->enforceIntentSelection:Z

    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;->rootIntentUIModels:Ljava/util/List;

    invoke-direct {v0, v1, v2, v3, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentExpandedRootViewState;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;)V

    return-object v0
.end method

.method private buildSmartIntentLeafViewState(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;J)Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;
    .locals 8

    .line 140
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 142
    iget-object v0, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->rootIntents:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 143
    iget-object v2, v1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->localId:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long v4, v2, p2

    if-nez v4, :cond_0

    .line 144
    iget-object v0, v1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->label:Ljava/lang/String;

    .line 145
    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->children:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 146
    new-instance v3, Lcom/helpshift/conversation/smartintent/LeafIntentUIModel;

    iget-object v4, v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->localId:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iget-object v2, v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->label:Ljava/lang/String;

    invoke-direct {v3, v4, v5, v2}, Lcom/helpshift/conversation/smartintent/LeafIntentUIModel;-><init>(JLjava/lang/String;)V

    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const-string v0, ""

    :cond_2
    move-object v1, v0

    .line 152
    new-instance v7, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;

    iget-object v2, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->textInputHint:Ljava/lang/String;

    iget-boolean v3, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->enforceIntentSelection:Z

    move-object v0, v7

    move-wide v4, p2

    invoke-direct/range {v0 .. v6}, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;-><init>(Ljava/lang/String;Ljava/lang/String;ZJLjava/util/List;)V

    return-object v7
.end method

.method private convertToSearchIntentUIModelList(Ljava/util/List;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/util/ValuePair<",
            "Ljava/lang/String;",
            "Ljava/lang/Double;",
            ">;>;)",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;",
            ">;"
        }
    .end annotation

    .line 844
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->getIntentIdToSearchIntentUIModelIndex()Ljava/util/Map;

    move-result-object v0

    .line 846
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    if-nez v0, :cond_0

    return-object v1

    .line 853
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v2, 0x1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/util/ValuePair;

    .line 854
    iget-object v4, v3, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    .line 855
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 857
    invoke-static {v4}, Lcom/helpshift/util/ListUtils;->isNotEmpty(Ljava/util/List;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 858
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;

    .line 859
    invoke-virtual {v5}, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->deepClone()Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;

    move-result-object v5

    .line 860
    iput v2, v5, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->rank:I

    .line 861
    iget-object v6, v3, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Double;

    iput-object v6, v5, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->confidence:Ljava/lang/Double;

    .line 862
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method private createPreIssue(JLjava/lang/Integer;Ljava/lang/Double;)V
    .locals 3

    .line 331
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->getRootToLeafIntents(J)Ljava/util/List;

    move-result-object p1

    .line 332
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 333
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 334
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 335
    iget-object v2, v1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->serverId:Ljava/lang/String;

    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 336
    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->label:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 339
    :cond_0
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->serverId:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->replyFieldViewState:Lcom/helpshift/widget/MutableReplyFieldViewState;

    .line 342
    invoke-virtual {v2}, Lcom/helpshift/widget/MutableReplyFieldViewState;->getReplyText()Ljava/lang/String;

    move-result-object v2

    .line 339
    invoke-interface {p1, v1, p2, v0, v2}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->createPreIssueFromSmartIntentSelection(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    .line 345
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 346
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->activeConversation:Lcom/helpshift/conversation/activeconversation/model/Conversation;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    const-string v1, "acid"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    .line 347
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "leaf"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    invoke-static {p2}, Lcom/helpshift/util/ListUtils;->isNotEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 349
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 350
    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object v0

    invoke-interface {v0, p2}, Lcom/helpshift/common/platform/Jsonifier;->jsonifyListToJsonArray(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p2

    const-string v0, "iids"

    .line 349
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    if-eqz p4, :cond_2

    const-string p2, "cnf"

    .line 353
    invoke-interface {p1, p2, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    if-eqz p3, :cond_3

    const-string p2, "r"

    .line 356
    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    :cond_3
    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object p2

    sget-object p3, Lcom/helpshift/analytics/AnalyticsEventType;->SMART_INTENT_SELECTION:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {p2, p3, p1}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    return-void
.end method

.method private getIntentIdToSearchIntentUIModelIndex()Ljava/util/Map;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;",
            ">;>;"
        }
    .end annotation

    .line 805
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->intentIdToSearchIntentUIModelMapping:Ljava/util/Map;

    if-eqz v0, :cond_0

    return-object v0

    .line 809
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return-object v0

    .line 814
    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 815
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->rootIntents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 816
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 817
    iget-object v4, v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->children:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 818
    new-instance v6, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;

    iget-object v7, v5, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->localId:Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    iget-object v9, v5, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->label:Ljava/lang/String;

    iget-object v10, v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->label:Ljava/lang/String;

    invoke-direct {v6, v7, v8, v9, v10}, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    .line 822
    iget-object v5, v5, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->serverId:Ljava/lang/String;

    invoke-static {v6}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v0, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 823
    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 826
    :cond_2
    iget-object v2, v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->serverId:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 830
    :cond_3
    iput-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->intentIdToSearchIntentUIModelMapping:Ljava/util/Map;

    return-object v0
.end method

.method private getRootIntentDTO(J)Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;
    .locals 6

    .line 445
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 449
    :cond_0
    iget-object v0, v0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->rootIntents:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 450
    iget-object v3, v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->localId:Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    cmp-long v5, v3, p1

    if-nez v5, :cond_1

    return-object v2

    :cond_2
    return-object v1
.end method

.method private getRootToLeafIntents(J)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;"
        }
    .end annotation

    .line 427
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 429
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    if-nez v1, :cond_0

    return-object v0

    .line 432
    :cond_0
    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->rootIntents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 433
    iget-object v3, v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->children:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 434
    iget-object v5, v4, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->localId:Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    cmp-long v7, v5, p1

    if-nez v7, :cond_2

    .line 435
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 436
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    return-object v0
.end method

.method private getSearchAnalyticsData()Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 377
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 378
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->activeConversation:Lcom/helpshift/conversation/activeconversation/model/Conversation;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    const-string v2, "acid"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSearchResultData:Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    if-eqz v1, :cond_7

    iget-boolean v1, v1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->isSearchPerformed:Z

    if-nez v1, :cond_0

    goto/16 :goto_2

    .line 386
    :cond_0
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSearchResultData:Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->aiModelVersion:Ljava/lang/Integer;

    if-eqz v1, :cond_1

    .line 387
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSearchResultData:Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->aiModelVersion:Ljava/lang/Integer;

    const-string v2, "mv"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    :cond_1
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSearchResultData:Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->searchIntentLevel:Ljava/lang/Integer;

    if-eqz v1, :cond_2

    .line 392
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSearchResultData:Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->searchIntentLevel:Ljava/lang/Integer;

    const-string v2, "l"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    :cond_2
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSearchResultData:Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->searchAlgorithmType:Ljava/lang/Integer;

    if-eqz v1, :cond_4

    .line 398
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSearchResultData:Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->searchAlgorithmType:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x1

    const-string v3, "sa"

    if-ne v1, v2, :cond_3

    const-string v1, "ml"

    .line 399
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 401
    :cond_3
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSearchResultData:Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->searchAlgorithmType:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_4

    const-string v1, "ss"

    .line 403
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    :cond_4
    :goto_0
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSearchResultData:Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->searchResults:Ljava/util/List;

    if-eqz v1, :cond_7

    .line 410
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->getIntentIdToSearchIntentUIModelIndex()Ljava/util/Map;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_6

    .line 413
    iget-object v3, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSearchResultData:Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    iget-object v3, v3, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->searchResults:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_5
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/util/ValuePair;

    .line 414
    iget-object v4, v4, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 415
    invoke-static {v4}, Lcom/helpshift/util/ListUtils;->isNotEmpty(Ljava/util/List;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 416
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/2addr v2, v4

    goto :goto_1

    .line 420
    :cond_6
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "rc"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    :goto_2
    return-object v0
.end method

.method private handleRootIntentSelectedInternal(J)V
    .locals 2

    .line 305
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    .line 306
    invoke-virtual {v0, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->getSmartIntentTree(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    move-result-object v0

    .line 305
    invoke-direct {p0, v0, p1, p2}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->buildSmartIntentLeafViewState(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;J)Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;

    move-result-object p1

    .line 309
    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    invoke-virtual {p2}, Lcom/helpshift/util/HSBackStackController;->getTopItem()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

    .line 310
    instance-of v0, p2, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;

    if-eqz v0, :cond_0

    .line 311
    check-cast p2, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;

    .line 312
    invoke-direct {p0, p2}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->buildSmartIntentExpandedRootViewState(Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;)Lcom/helpshift/conversation/smartintent/SmartIntentExpandedRootViewState;

    move-result-object p2

    .line 313
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    invoke-virtual {v0, p2}, Lcom/helpshift/util/HSBackStackController;->addItem(Ljava/lang/Object;)Z

    .line 316
    :cond_0
    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    invoke-virtual {p2, p1}, Lcom/helpshift/util/HSBackStackController;->addItem(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 317
    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {p2, p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->updateSmartIntentView(Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;)V

    :cond_1
    return-void
.end method

.method private handleTreeAvailable(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
    .locals 1

    .line 716
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    const/4 v0, 0x0

    .line 717
    iput-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->intentIdToSearchIntentUIModelMapping:Ljava/util/Map;

    const/4 v0, 0x0

    .line 718
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->showFakeTypingIndicator(Z)V

    .line 719
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->showSmartIntentTreeInitialState(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    .line 722
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->sendTreeShownEvent(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    return-void
.end method

.method private handleTreeUnAvailable()V
    .locals 1

    .line 710
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->resetInternalStates()V

    const/4 v0, 0x0

    .line 711
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->showFakeTypingIndicator(Z)V

    .line 712
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->notifyShowReplyBox()V

    return-void
.end method

.method private notifyShowReplyBox()V
    .locals 1

    .line 756
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->showReplyFooterFromSmartIntent()V

    return-void
.end method

.method private resetInternalStates()V
    .locals 1

    const/4 v0, 0x0

    .line 462
    iput-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSavedState:Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;

    const/4 v0, 0x0

    .line 463
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->isShowingFakeTAI:Z

    .line 465
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->isInitialized:Z

    .line 467
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    invoke-virtual {v0}, Lcom/helpshift/util/HSBackStackController;->clear()V

    return-void
.end method

.method private restoreSmartIntentUIFromSavedState(Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;)V
    .locals 3

    const-string v0, "Helpshift_SmartVM"

    const-string v1, "Restoring smart intent UI state on rotation"

    .line 236
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    iget-boolean p1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;->isShowingTAI:Z

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    .line 239
    invoke-virtual {p1, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->isTreeFetchRequestInProgress(Lcom/helpshift/account/domainmodel/UserDM;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 241
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->showFakeTypingIndicator(Z)V

    .line 244
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->isInitialized:Z

    return-void

    .line 251
    :cond_0
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {p1, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->getSmartIntentTree(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    if-nez p1, :cond_1

    .line 254
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->handleTreeUnAvailable()V

    return-void

    .line 259
    :cond_1
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->showSmartIntentTreeInitialState(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    .line 262
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSavedState:Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;

    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;->selectedRootIntentLocalId:Ljava/lang/Long;

    if-eqz p1, :cond_2

    .line 263
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSavedState:Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;

    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;->selectedRootIntentLocalId:Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-direct {p0, v1, v2}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->handleRootIntentSelectedInternal(J)V

    goto :goto_0

    .line 265
    :cond_2
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSavedState:Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;

    iget-boolean p1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;->isBottomSheetInExpandedState:Z

    if-eqz p1, :cond_3

    .line 266
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->onSmartIntentBottomSheetExpanded()V

    .line 270
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSavedState:Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;

    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;->userTypedQuery:Ljava/lang/String;

    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 272
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSavedState:Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;

    iget-boolean p1, p1, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;->isSearchUIVisible:Z

    if-nez p1, :cond_4

    .line 273
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->skipSearchOnUserQueryChange:Z

    .line 275
    :cond_4
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->replyFieldViewState:Lcom/helpshift/widget/MutableReplyFieldViewState;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSavedState:Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;

    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;->userTypedQuery:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/helpshift/widget/MutableReplyFieldViewState;->setReplyText(Ljava/lang/String;)V

    .line 279
    :cond_5
    iput-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->isInitialized:Z

    return-void
.end method

.method private sendTreeShownEvent(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
    .locals 3

    .line 175
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 176
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->activeConversation:Lcom/helpshift/conversation/activeconversation/model/Conversation;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    const-string v2, "acid"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    iget-object v1, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->serverId:Ljava/lang/String;

    const-string v2, "itid"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    iget v1, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->version:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "itv"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    iget-boolean p1, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->enforceIntentSelection:Z

    .line 180
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    const-string v1, "eis"

    .line 179
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object p1

    sget-object v1, Lcom/helpshift/analytics/AnalyticsEventType;->SMART_INTENT_TREE_SHOWN:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {p1, v1, v0}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    return-void
.end method

.method private showFakeTypingIndicator(Z)V
    .locals 0

    .line 700
    iput-boolean p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->isShowingFakeTAI:Z

    if-eqz p1, :cond_0

    .line 702
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->showFakeTypingIndicatorFromSmartIntent()V

    goto :goto_0

    .line 705
    :cond_0
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->hideFakeTypingIndicatorFromSmartIntent()V

    :goto_0
    return-void
.end method

.method private showSmartIntentTreeInitialState(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
    .locals 2

    .line 161
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->buildSmartIntentCollapsedRootViewState(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;

    move-result-object v0

    .line 162
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    invoke-virtual {v1}, Lcom/helpshift/util/HSBackStackController;->clear()V

    .line 163
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    invoke-virtual {v1, v0}, Lcom/helpshift/util/HSBackStackController;->addItem(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 164
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {v1, v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->showSmartIntentUI(Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;)V

    .line 168
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->replyButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    iget-boolean p1, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->enforceIntentSelection:Z

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    .line 169
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->replyButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/helpshift/widget/MutableBaseViewState;->setEnabled(Z)V

    return-void
.end method

.method private updateConversationReplyFooter(Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 691
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->showReplyFooterFromSmartIntent()V

    goto :goto_0

    .line 694
    :cond_0
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->hideReplyFooterFromSmartIntent()V

    :goto_0
    return-void
.end method

.method private updateUIOnSearchResultChange(Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;Ljava/lang/String;)V
    .locals 4

    .line 593
    iget-boolean v0, p1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->isSearchPerformed:Z

    if-nez v0, :cond_1

    .line 605
    invoke-static {p2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSearchResultData:Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    if-eqz p2, :cond_0

    iget-boolean p2, p2, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->isSearchPerformed:Z

    if-eqz p2, :cond_0

    .line 606
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->getSearchAnalyticsData()Ljava/util/Map;

    move-result-object p2

    const/4 v0, 0x1

    .line 607
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "clr"

    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 608
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object v0

    sget-object v1, Lcom/helpshift/analytics/AnalyticsEventType;->SMART_INTENT_SEARCH_INTENT:Lcom/helpshift/analytics/AnalyticsEventType;

    .line 609
    invoke-virtual {v0, v1, p2}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    .line 616
    :cond_0
    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    const-class v0, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;

    .line 617
    invoke-virtual {p2, v0}, Lcom/helpshift/util/HSBackStackController;->popTopItem(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

    if-eqz p2, :cond_3

    .line 621
    iget-object p2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    invoke-virtual {p2}, Lcom/helpshift/util/HSBackStackController;->getTopItem()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

    if-eqz p2, :cond_3

    .line 623
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {v0, p2}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->updateSmartIntentView(Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;)V

    goto :goto_1

    .line 633
    :cond_1
    iget-object p2, p1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->searchResults:Ljava/util/List;

    invoke-static {p2}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 634
    new-instance p2, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;

    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    iget-object v0, v0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->emptySearchTitle:Ljava/lang/String;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->emptySearchDescription:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    iget-boolean v2, v2, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->enforceIntentSelection:Z

    .line 638
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    invoke-direct {p2, v0, v1, v2, v3}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;)V

    goto :goto_0

    .line 642
    :cond_2
    iget-object p2, p1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->searchResults:Ljava/util/List;

    .line 643
    invoke-direct {p0, p2}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->convertToSearchIntentUIModelList(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    .line 644
    new-instance v0, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->searchTitle:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    iget-boolean v2, v2, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->enforceIntentSelection:Z

    const-string v3, ""

    invoke-direct {v0, v1, v3, v2, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;)V

    move-object p2, v0

    .line 652
    :goto_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    const-class v1, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;

    invoke-virtual {v0, v1}, Lcom/helpshift/util/HSBackStackController;->popTopItem(Ljava/lang/Class;)Ljava/lang/Object;

    .line 654
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    invoke-virtual {v0, p2}, Lcom/helpshift/util/HSBackStackController;->addItem(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 655
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {v0, p2}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->updateSmartIntentView(Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;)V

    .line 660
    :cond_3
    :goto_1
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSearchResultData:Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    return-void
.end method


# virtual methods
.method public buildInstanceSaveState()Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;
    .locals 8

    .line 766
    iget-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->isShowingFakeTAI:Z

    if-eqz v0, :cond_0

    .line 767
    new-instance v0, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;-><init>(ZLjava/lang/Long;Ljava/lang/String;ZZ)V

    return-object v0

    .line 772
    :cond_0
    iget-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->isInitialized:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    invoke-virtual {v0}, Lcom/helpshift/util/HSBackStackController;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 776
    :cond_1
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->replyFieldViewState:Lcom/helpshift/widget/MutableReplyFieldViewState;

    invoke-virtual {v0}, Lcom/helpshift/widget/MutableReplyFieldViewState;->getReplyText()Ljava/lang/String;

    move-result-object v5

    .line 779
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    const-class v2, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;

    .line 780
    invoke-virtual {v0, v2}, Lcom/helpshift/util/HSBackStackController;->isTopItemOfType(Ljava/lang/Class;)Z

    move-result v0

    xor-int/lit8 v3, v0, 0x1

    .line 784
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    const-class v2, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;

    .line 785
    invoke-virtual {v0, v2}, Lcom/helpshift/util/HSBackStackController;->getLastItemOfType(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

    .line 786
    instance-of v2, v0, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;

    if-eqz v2, :cond_2

    .line 787
    check-cast v0, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;

    .line 788
    iget-wide v0, v0, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;->parentIntentId:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    :cond_2
    move-object v4, v1

    .line 791
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    const-class v1, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;

    .line 792
    invoke-virtual {v0, v1}, Lcom/helpshift/util/HSBackStackController;->isTopItemOfType(Ljava/lang/Class;)Z

    move-result v6

    .line 793
    new-instance v0, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;

    const/4 v7, 0x0

    move-object v2, v0

    invoke-direct/range {v2 .. v7}, Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;-><init>(ZLjava/lang/Long;Ljava/lang/String;ZZ)V

    return-object v0

    :cond_3
    :goto_0
    return-object v1
.end method

.method public getClearSearchButtonViewState()Lcom/helpshift/widget/BaseViewState;
    .locals 1

    .line 564
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->clearSearchViewState:Lcom/helpshift/widget/MutableBaseViewState;

    return-object v0
.end method

.method public getReplyButtonViewState()Lcom/helpshift/widget/BaseViewState;
    .locals 1

    .line 560
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->replyButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    return-object v0
.end method

.method public getReplyFieldViewState()Lcom/helpshift/widget/ReplyFieldViewState;
    .locals 1

    .line 568
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->replyFieldViewState:Lcom/helpshift/widget/MutableReplyFieldViewState;

    return-object v0
.end method

.method public handleBackPressedForSmartIntent()Z
    .locals 6

    .line 477
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    invoke-virtual {v0}, Lcom/helpshift/util/HSBackStackController;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    const-string v0, "Helpshift_SmartVM"

    const-string v2, "On user pressed back button"

    .line 480
    invoke-static {v0, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 483
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    const-class v2, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;

    invoke-virtual {v0, v2}, Lcom/helpshift/util/HSBackStackController;->isTopItemOfType(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    .line 488
    :cond_1
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    invoke-virtual {v0}, Lcom/helpshift/util/HSBackStackController;->popTopItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

    .line 490
    instance-of v2, v0, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    .line 492
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->getSearchAnalyticsData()Ljava/util/Map;

    move-result-object v0

    .line 493
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v4, "clr"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 494
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v2}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object v2

    sget-object v4, Lcom/helpshift/analytics/AnalyticsEventType;->SMART_INTENT_SEARCH_INTENT:Lcom/helpshift/analytics/AnalyticsEventType;

    .line 495
    invoke-virtual {v2, v4, v0}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    goto :goto_0

    .line 497
    :cond_2
    instance-of v2, v0, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;

    if-eqz v2, :cond_5

    const/4 v2, 0x0

    .line 499
    check-cast v0, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;

    .line 500
    iget-wide v4, v0, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;->parentIntentId:J

    invoke-direct {p0, v4, v5}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->getRootIntentDTO(J)Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 502
    iget-object v0, v0, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->serverId:Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 506
    :cond_3
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 507
    iget-object v4, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->activeConversation:Lcom/helpshift/conversation/activeconversation/model/Conversation;

    iget-object v4, v4, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    const-string v5, "acid"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 508
    invoke-static {v2}, Lcom/helpshift/util/ListUtils;->isNotEmpty(Ljava/util/List;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 509
    iget-object v4, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 510
    invoke-interface {v4}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object v4

    invoke-interface {v4, v2}, Lcom/helpshift/common/platform/Jsonifier;->jsonifyListToJsonArray(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    const-string v4, "iids"

    .line 509
    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 512
    :cond_4
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v2}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object v2

    sget-object v4, Lcom/helpshift/analytics/AnalyticsEventType;->SMART_INTENT_DESELECTION:Lcom/helpshift/analytics/AnalyticsEventType;

    .line 513
    invoke-virtual {v2, v4, v0}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    .line 517
    :cond_5
    :goto_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    invoke-virtual {v0}, Lcom/helpshift/util/HSBackStackController;->getTopItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

    if-eqz v0, :cond_6

    .line 519
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {v1, v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->updateSmartIntentView(Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;)V

    return v3

    :cond_6
    return v1
.end method

.method handleLeafIntentSelected(Lcom/helpshift/conversation/smartintent/LeafIntentUIModel;)V
    .locals 2

    .line 322
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "On user selected a leaf intent : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/helpshift/conversation/smartintent/LeafIntentUIModel;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_SmartVM"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->hideSmartIntentView()V

    .line 324
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->resetInternalStates()V

    .line 327
    iget-wide v0, p1, Lcom/helpshift/conversation/smartintent/LeafIntentUIModel;->localId:J

    const/4 p1, 0x0

    invoke-direct {p0, v0, v1, p1, p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->createPreIssue(JLjava/lang/Integer;Ljava/lang/Double;)V

    return-void
.end method

.method public handleRootIntentSelected(Lcom/helpshift/conversation/smartintent/RootIntentUIModel;)V
    .locals 3

    .line 283
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "On user selected a root intent : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/helpshift/conversation/smartintent/RootIntentUIModel;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_SmartVM"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    iget-wide v0, p1, Lcom/helpshift/conversation/smartintent/RootIntentUIModel;->localId:J

    invoke-direct {p0, v0, v1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->handleRootIntentSelectedInternal(J)V

    .line 287
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 288
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->activeConversation:Lcom/helpshift/conversation/activeconversation/model/Conversation;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/model/Conversation;->acid:Ljava/lang/String;

    const-string v2, "acid"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x0

    .line 289
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "leaf"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    iget-wide v1, p1, Lcom/helpshift/conversation/smartintent/RootIntentUIModel;->localId:J

    invoke-direct {p0, v1, v2}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->getRootIntentDTO(J)Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 292
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 293
    invoke-interface {v1}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object v1

    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->serverId:Ljava/lang/String;

    .line 294
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v1, p1}, Lcom/helpshift/common/platform/Jsonifier;->jsonifyListToJsonArray(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    const-string v1, "iids"

    .line 292
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    :cond_0
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object p1

    sget-object v1, Lcom/helpshift/analytics/AnalyticsEventType;->SMART_INTENT_SELECTION:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {p1, v1, v0}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    return-void
.end method

.method handleSearchIntentSelected(Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;)V
    .locals 3

    .line 363
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->hideSmartIntentView()V

    .line 364
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->resetInternalStates()V

    .line 367
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->getSearchAnalyticsData()Ljava/util/Map;

    move-result-object v0

    const/4 v1, 0x0

    .line 368
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "clr"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v1}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object v1

    sget-object v2, Lcom/helpshift/analytics/AnalyticsEventType;->SMART_INTENT_SEARCH_INTENT:Lcom/helpshift/analytics/AnalyticsEventType;

    .line 370
    invoke-virtual {v1, v2, v0}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    .line 373
    iget-wide v0, p1, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->localId:J

    iget v2, p1, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->rank:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->confidence:Ljava/lang/Double;

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->createPreIssue(JLjava/lang/Integer;Ljava/lang/Double;)V

    return-void
.end method

.method public isSmartIntentUIVisible()Z
    .locals 1

    .line 872
    iget-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->isInitialized:Z

    return v0
.end method

.method public onDestroy()V
    .locals 1

    .line 876
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->unregisterSmartIntentDMCallback()V

    return-void
.end method

.method public onNewConversationStarted(Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 0

    .line 107
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->activeConversation:Lcom/helpshift/conversation/activeconversation/model/Conversation;

    return-void
.end method

.method public onRestoreInstanceState(Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;)V
    .locals 0

    .line 800
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSavedState:Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;

    return-void
.end method

.method public onSmartIntentBottomSheetCollapsed()V
    .locals 2

    const-string v0, "Helpshift_SmartVM"

    const-string v1, "Smart intent bottom sheet state changed to collapsed mode"

    .line 529
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 531
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    const-class v1, Lcom/helpshift/conversation/smartintent/SmartIntentExpandedRootViewState;

    invoke-virtual {v0, v1}, Lcom/helpshift/util/HSBackStackController;->popTopItem(Ljava/lang/Class;)Ljava/lang/Object;

    .line 534
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    invoke-virtual {v0}, Lcom/helpshift/util/HSBackStackController;->getTopItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

    .line 535
    instance-of v1, v0, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;

    if-eqz v1, :cond_0

    .line 536
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {v1, v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->updateSmartIntentView(Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;)V

    :cond_0
    return-void
.end method

.method public onSmartIntentBottomSheetExpanded()V
    .locals 2

    const-string v0, "Helpshift_SmartVM"

    const-string v1, "Smart intent bottom sheet state changed to Expanded mode"

    .line 544
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 545
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    invoke-virtual {v0}, Lcom/helpshift/util/HSBackStackController;->getTopItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;

    .line 546
    instance-of v1, v0, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;

    if-eqz v1, :cond_0

    .line 547
    check-cast v0, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;

    .line 551
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->buildSmartIntentExpandedRootViewState(Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;)Lcom/helpshift/conversation/smartintent/SmartIntentExpandedRootViewState;

    move-result-object v0

    .line 553
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->backStackController:Lcom/helpshift/util/HSBackStackController;

    invoke-virtual {v1, v0}, Lcom/helpshift/util/HSBackStackController;->addItem(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 554
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {v1, v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->updateSmartIntentView(Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;)V

    :cond_0
    return-void
.end method

.method public onSmartIntentSendButtonClick(Ljava/lang/String;)V
    .locals 2

    .line 666
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->userVisibleCharacterCount(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->domain:Lcom/helpshift/common/domain/Domain;

    .line 667
    invoke-virtual {v1}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v1

    invoke-virtual {v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getMinimumConversationDescriptionLength()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 668
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->showSmartIntentReplyValidationFailedError()V

    return-void

    .line 672
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    invoke-interface {v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->hideSmartIntentView()V

    .line 673
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->resetInternalStates()V

    .line 674
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->callback:Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->serverId:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVMCallback;->createPreIssueFromSmartIntentSendButton(Ljava/lang/String;Ljava/lang/String;)V

    .line 677
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSearchResultData:Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    if-eqz p1, :cond_1

    iget-boolean p1, p1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->isSearchPerformed:Z

    if-eqz p1, :cond_1

    .line 678
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->getSearchAnalyticsData()Ljava/util/Map;

    move-result-object p1

    const/4 v0, 0x0

    .line 679
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "clr"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 680
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object v0

    sget-object v1, Lcom/helpshift/analytics/AnalyticsEventType;->SMART_INTENT_SEARCH_INTENT:Lcom/helpshift/analytics/AnalyticsEventType;

    .line 681
    invoke-virtual {v0, v1, p1}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    :cond_1
    return-void
.end method

.method public onSmartIntentTextChanged(Ljava/lang/CharSequence;)V
    .locals 4

    const-string v0, "Helpshift_SmartVM"

    const-string v1, "On user query change"

    .line 572
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p1, :cond_0

    const-string p1, ""

    goto :goto_0

    .line 573
    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    .line 574
    :goto_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->replyFieldViewState:Lcom/helpshift/widget/MutableReplyFieldViewState;

    invoke-virtual {v0, p1}, Lcom/helpshift/widget/MutableReplyFieldViewState;->setReplyText(Ljava/lang/String;)V

    .line 575
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    .line 576
    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->replyButtonViewState:Lcom/helpshift/widget/MutableBaseViewState;

    invoke-virtual {v2, v0}, Lcom/helpshift/widget/MutableBaseViewState;->setEnabled(Z)V

    .line 577
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->clearSearchViewState:Lcom/helpshift/widget/MutableBaseViewState;

    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    iget-boolean v2, v2, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->enforceIntentSelection:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    .line 580
    iget-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->skipSearchOnUserQueryChange:Z

    if-eqz v0, :cond_2

    .line 581
    iput-boolean v3, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->skipSearchOnUserQueryChange:Z

    return-void

    .line 586
    :cond_2
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    invoke-virtual {v0, v1, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->match(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;Ljava/lang/String;)Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 588
    invoke-direct {p0, v0, p1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->updateUIOnSearchResultChange(Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;Ljava/lang/String;)V

    :cond_3
    return-void
.end method

.method public onTreeAvailable(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
    .locals 1

    .line 728
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    .line 732
    :cond_0
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM$1;

    invoke-direct {v0, p0, p2}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM$1;-><init>(Lcom/helpshift/conversation/viewmodel/SmartIntentVM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    invoke-virtual {p1, v0}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public onTreeUnAvailable(Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 1

    .line 743
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    .line 747
    :cond_0
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM$2;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM$2;-><init>(Lcom/helpshift/conversation/viewmodel/SmartIntentVM;)V

    invoke-virtual {p1, v0}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public shouldShowSmartIntentFakeTypingIndicator()Z
    .locals 1

    .line 686
    iget-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->isShowingFakeTAI:Z

    return v0
.end method

.method public showSmartIntentUI()V
    .locals 4

    const-string v0, "Helpshift_SmartVM"

    const-string v1, "Showing smart intent UI"

    .line 188
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 190
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->updateConversationReplyFooter(Z)V

    .line 193
    iget-boolean v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->isInitialized:Z

    if-eqz v0, :cond_0

    return-void

    .line 198
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSavedState:Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 199
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->restoreSmartIntentUIFromSavedState(Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;)V

    .line 201
    iput-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->lastSavedState:Lcom/helpshift/conversation/smartintent/SmartIntentSavedState;

    return-void

    .line 206
    :cond_1
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0, v2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->isSmartIntentTreeAvailable(Lcom/helpshift/account/domainmodel/UserDM;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    .line 207
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v3, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0, v3}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->getSmartIntentTree(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    .line 208
    iput-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->intentIdToSearchIntentUIModelMapping:Ljava/util/Map;

    if-eqz v0, :cond_2

    .line 211
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->showSmartIntentTreeInitialState(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    .line 214
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    invoke-direct {p0, v0}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->sendTreeShownEvent(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    .line 217
    iput-boolean v2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->isInitialized:Z

    .line 220
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->cachedSmartIntentTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->refreshSmartIntentSearchModel(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    return-void

    .line 227
    :cond_2
    invoke-direct {p0, v2}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->showFakeTypingIndicator(Z)V

    .line 229
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v0, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->fetchSmartIntentTreeFromServer(Lcom/helpshift/account/domainmodel/UserDM;)V

    .line 232
    iput-boolean v2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->isInitialized:Z

    return-void
.end method
