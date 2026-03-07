.class public final Lcom/helpshift/support/HSApiData;
.super Ljava/lang/Object;
.source "HSApiData.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "Helpshift_ApiData"

.field private static final faqIndexLock:Ljava/lang/Object;

.field private static final flatFaqListSyncLock:Ljava/lang/Object;

.field public static observers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/helpshift/support/HSFaqSyncStatusEvents;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private failedApiKeys:Ljava/util/Iterator;

.field faqDAO:Lcom/helpshift/support/storage/FaqDAO;

.field private flatFaqList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/helpshift/support/Faq;",
            ">;"
        }
    .end annotation
.end field

.field sectionDAO:Lcom/helpshift/support/storage/SectionDAO;

.field public storage:Lcom/helpshift/support/HSStorage;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 62
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/helpshift/support/HSApiData;->flatFaqListSyncLock:Ljava/lang/Object;

    .line 69
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/helpshift/support/HSApiData;->faqIndexLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 67
    iput-object v0, p0, Lcom/helpshift/support/HSApiData;->failedApiKeys:Ljava/util/Iterator;

    .line 68
    iput-object v0, p0, Lcom/helpshift/support/HSApiData;->flatFaqList:Ljava/util/ArrayList;

    .line 72
    new-instance v0, Lcom/helpshift/support/HSStorage;

    invoke-direct {v0, p1}, Lcom/helpshift/support/HSStorage;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    .line 73
    invoke-static {}, Lcom/helpshift/support/storage/SectionsDataSource;->getInstance()Lcom/helpshift/support/storage/SectionsDataSource;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/HSApiData;->sectionDAO:Lcom/helpshift/support/storage/SectionDAO;

    .line 74
    invoke-static {}, Lcom/helpshift/support/storage/FaqsDataSource;->getInstance()Lcom/helpshift/support/storage/FaqsDataSource;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/HSApiData;->faqDAO:Lcom/helpshift/support/storage/FaqDAO;

    return-void
.end method

.method protected static addFaqSyncStatusObserver(Lcom/helpshift/support/HSFaqSyncStatusEvents;)V
    .locals 1

    .line 78
    sget-object v0, Lcom/helpshift/support/HSApiData;->observers:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/helpshift/support/HSApiData;->observers:Ljava/util/ArrayList;

    .line 82
    :cond_0
    sget-object v0, Lcom/helpshift/support/HSApiData;->observers:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private getAndStoreSections(Landroid/os/Handler;Landroid/os/Handler;Lcom/helpshift/support/FaqTagFilter;)V
    .locals 2

    .line 130
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getFaqDM()Lcom/helpshift/faq/FaqsDM;

    move-result-object v0

    new-instance v1, Lcom/helpshift/support/HSApiData$1;

    invoke-direct {v1, p0, p1, p3, p2}, Lcom/helpshift/support/HSApiData$1;-><init>(Lcom/helpshift/support/HSApiData;Landroid/os/Handler;Lcom/helpshift/support/FaqTagFilter;Landroid/os/Handler;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/faq/FaqsDM;->fetchFaqs(Lcom/helpshift/util/FetchDataFromThread;)V

    return-void
.end method

.method private getQuestionAsync(Ljava/lang/String;Ljava/lang/String;ZLandroid/os/Handler;Landroid/os/Handler;)V
    .locals 8

    .line 562
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getFaqDM()Lcom/helpshift/faq/FaqsDM;

    move-result-object v0

    new-instance v7, Lcom/helpshift/support/HSApiData$5;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p4

    move v4, p3

    move-object v5, p5

    move-object v6, p1

    invoke-direct/range {v1 .. v6}, Lcom/helpshift/support/HSApiData$5;-><init>(Lcom/helpshift/support/HSApiData;Landroid/os/Handler;ZLandroid/os/Handler;Ljava/lang/String;)V

    invoke-virtual {v0, v7, p1, p2, p3}, Lcom/helpshift/faq/FaqsDM;->fetchQuestion(Lcom/helpshift/util/FetchDataFromThread;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method protected static removeFaqSyncStatusObserver(Lcom/helpshift/support/HSFaqSyncStatusEvents;)V
    .locals 1

    .line 86
    sget-object v0, Lcom/helpshift/support/HSApiData;->observers:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 87
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method protected static signalFaqsUpdated()V
    .locals 2

    .line 92
    sget-object v0, Lcom/helpshift/support/HSApiData;->observers:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 93
    :goto_0
    sget-object v1, Lcom/helpshift/support/HSApiData;->observers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 94
    sget-object v1, Lcom/helpshift/support/HSApiData;->observers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/support/HSFaqSyncStatusEvents;

    if-eqz v1, :cond_0

    .line 96
    invoke-interface {v1}, Lcom/helpshift/support/HSFaqSyncStatusEvents;->faqsUpdated()V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method protected static signalSearchIndexesUpdated()V
    .locals 2

    .line 103
    sget-object v0, Lcom/helpshift/support/HSApiData;->observers:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 104
    :goto_0
    sget-object v1, Lcom/helpshift/support/HSApiData;->observers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 105
    sget-object v1, Lcom/helpshift/support/HSApiData;->observers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/support/HSFaqSyncStatusEvents;

    if-eqz v1, :cond_0

    .line 107
    invoke-interface {v1}, Lcom/helpshift/support/HSFaqSyncStatusEvents;->searchIndexesUpdated()V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private updateFlatList()V
    .locals 4

    .line 114
    invoke-virtual {p0}, Lcom/helpshift/support/HSApiData;->getSections()Ljava/util/ArrayList;

    move-result-object v0

    .line 115
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    .line 116
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 117
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/support/Section;

    .line 118
    invoke-virtual {v3}, Lcom/helpshift/support/Section;->getPublishId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/helpshift/support/HSApiData;->getFaqsDataForSection(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 119
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 122
    :cond_0
    sget-object v0, Lcom/helpshift/support/HSApiData;->flatFaqListSyncLock:Ljava/lang/Object;

    monitor-enter v0

    .line 123
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v2, p0, Lcom/helpshift/support/HSApiData;->flatFaqList:Ljava/util/ArrayList;

    .line 124
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method clearETagsForFaqs()V
    .locals 4

    .line 658
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->faqDAO:Lcom/helpshift/support/storage/FaqDAO;

    invoke-interface {v0}, Lcom/helpshift/support/storage/FaqDAO;->getAllFaqPublishIds()Ljava/util/List;

    move-result-object v0

    .line 659
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 660
    invoke-virtual {p0, v1}, Lcom/helpshift/support/HSApiData;->getQuestionRoute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 661
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object v2

    invoke-interface {v2}, Lcom/helpshift/common/platform/Platform;->getNetworkRequestDAO()Lcom/helpshift/common/platform/network/NetworkRequestDAO;

    move-result-object v2

    const-string v3, ""

    invoke-interface {v2, v1, v3}, Lcom/helpshift/common/platform/network/NetworkRequestDAO;->storeETag(Ljava/lang/String;Ljava/lang/String;)V

    .line 662
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {v2, v1}, Lcom/helpshift/model/SdkInfoModel;->clearEtag(Ljava/lang/String;)V

    goto :goto_0

    .line 664
    :cond_0
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getNetworkRequestDAO()Lcom/helpshift/common/platform/network/NetworkRequestDAO;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "/faqs/"

    invoke-interface {v0, v2, v1}, Lcom/helpshift/common/platform/network/NetworkRequestDAO;->storeETag(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public getAllFaqs(Lcom/helpshift/support/FaqTagFilter;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/support/FaqTagFilter;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/support/Faq;",
            ">;"
        }
    .end annotation

    .line 350
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->flatFaqList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 351
    invoke-direct {p0}, Lcom/helpshift/support/HSApiData;->updateFlatList()V

    goto :goto_1

    .line 354
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/support/Faq;

    .line 355
    invoke-virtual {v1}, Lcom/helpshift/support/Faq;->clearSearchTerms()V

    goto :goto_0

    :cond_1
    :goto_1
    if-eqz p1, :cond_2

    .line 360
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/helpshift/support/HSApiData;->faqDAO:Lcom/helpshift/support/storage/FaqDAO;

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/helpshift/support/HSApiData;->flatFaqList:Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v1, v2, p1}, Lcom/helpshift/support/storage/FaqDAO;->getFilteredFaqs(Ljava/util/List;Lcom/helpshift/support/FaqTagFilter;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0

    .line 363
    :cond_2
    iget-object p1, p0, Lcom/helpshift/support/HSApiData;->flatFaqList:Ljava/util/ArrayList;

    return-object p1
.end method

.method protected getFaqsDataForSection(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/helpshift/support/Faq;",
            ">;"
        }
    .end annotation

    .line 269
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 271
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/support/HSApiData;->faqDAO:Lcom/helpshift/support/storage/FaqDAO;

    invoke-interface {v1, p1}, Lcom/helpshift/support/storage/FaqDAO;->getFaqsDataForSection(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, p1

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v1, "Helpshift_ApiData"

    const-string v2, "Database exception in getting faqs for section"

    .line 274
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-object v0
.end method

.method public getFaqsForSection(Ljava/lang/String;Lcom/helpshift/support/FaqTagFilter;)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/helpshift/support/FaqTagFilter;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/helpshift/support/Faq;",
            ">;"
        }
    .end annotation

    .line 258
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 260
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/support/HSApiData;->faqDAO:Lcom/helpshift/support/storage/FaqDAO;

    invoke-interface {v1, p1, p2}, Lcom/helpshift/support/storage/FaqDAO;->getFaqsForSection(Ljava/lang/String;Lcom/helpshift/support/FaqTagFilter;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, p1

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "Helpshift_ApiData"

    const-string v1, "Database exception in getting faqs for section"

    .line 263
    invoke-static {p2, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-object v0
.end method

.method protected getPopulatedSections(Lcom/helpshift/support/FaqTagFilter;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/support/FaqTagFilter;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/helpshift/support/Section;",
            ">;"
        }
    .end annotation

    .line 240
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 243
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/support/HSApiData;->sectionDAO:Lcom/helpshift/support/storage/SectionDAO;

    invoke-interface {v1, p1}, Lcom/helpshift/support/storage/SectionDAO;->getAllSections(Lcom/helpshift/support/FaqTagFilter;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "Helpshift_ApiData"

    const-string v3, "Database exception in getting sections data "

    .line 246
    invoke-static {v2, v3, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 248
    :goto_0
    invoke-virtual {p0, v0, p1}, Lcom/helpshift/support/HSApiData;->getPopulatedSections(Ljava/util/ArrayList;Lcom/helpshift/support/FaqTagFilter;)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1
.end method

.method public getPopulatedSections(Ljava/util/ArrayList;Lcom/helpshift/support/FaqTagFilter;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/helpshift/support/Section;",
            ">;",
            "Lcom/helpshift/support/FaqTagFilter;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/helpshift/support/Section;",
            ">;"
        }
    .end annotation

    .line 230
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 231
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 232
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/support/Section;

    invoke-virtual {p0, v2, p2}, Lcom/helpshift/support/HSApiData;->isSectionEmpty(Lcom/helpshift/support/Section;Lcom/helpshift/support/FaqTagFilter;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 233
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method getPublishIdFromSectionId(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 547
    invoke-virtual {p0}, Lcom/helpshift/support/HSApiData;->getSections()Ljava/util/ArrayList;

    move-result-object v0

    const-string v1, ""

    const/4 v2, 0x0

    .line 549
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 550
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/support/Section;

    .line 551
    invoke-virtual {v3}, Lcom/helpshift/support/Section;->getSectionId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 552
    invoke-virtual {v3}, Lcom/helpshift/support/Section;->getPublishId()Ljava/lang/String;

    move-result-object v1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method public getQuestion(Landroid/os/Handler;Landroid/os/Handler;ZZLjava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 600
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 601
    invoke-virtual {p2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    :cond_0
    if-eqz p4, :cond_1

    .line 609
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getFAQSuggestionsDAO()Lcom/helpshift/conversation/dao/FAQSuggestionsDAO;

    move-result-object v0

    invoke-interface {v0, p5, p6}, Lcom/helpshift/conversation/dao/FAQSuggestionsDAO;->getFAQ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/Faq;

    if-nez v0, :cond_2

    .line 611
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->faqDAO:Lcom/helpshift/support/storage/FaqDAO;

    invoke-interface {v0, p5, p6}, Lcom/helpshift/support/storage/FaqDAO;->getFaq(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/support/Faq;

    move-result-object v0

    goto :goto_0

    .line 615
    :cond_1
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->faqDAO:Lcom/helpshift/support/storage/FaqDAO;

    invoke-interface {v0, p5}, Lcom/helpshift/support/storage/FaqDAO;->getFaq(Ljava/lang/String;)Lcom/helpshift/support/Faq;

    move-result-object v0

    .line 619
    :cond_2
    :goto_0
    invoke-virtual {p1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 620
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 621
    invoke-virtual {p1, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    if-eqz v0, :cond_3

    if-eqz p3, :cond_4

    :cond_3
    move-object v0, p0

    move-object v1, p5

    move-object v2, p6

    move v3, p4

    move-object v4, p1

    move-object v5, p2

    .line 624
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/support/HSApiData;->getQuestionAsync(Ljava/lang/String;Ljava/lang/String;ZLandroid/os/Handler;Landroid/os/Handler;)V

    :cond_4
    return-void
.end method

.method getQuestionRoute(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 674
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/faqs/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getSection(Ljava/lang/String;)Lcom/helpshift/support/Section;
    .locals 1

    .line 520
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->sectionDAO:Lcom/helpshift/support/storage/SectionDAO;

    invoke-interface {v0, p1}, Lcom/helpshift/support/storage/SectionDAO;->getSection(Ljava/lang/String;)Lcom/helpshift/support/Section;

    move-result-object p1

    return-object p1
.end method

.method public getSection(Ljava/lang/String;Landroid/os/Handler;Landroid/os/Handler;Lcom/helpshift/support/FaqTagFilter;)V
    .locals 2

    .line 490
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 491
    invoke-virtual {p3}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    .line 495
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->sectionDAO:Lcom/helpshift/support/storage/SectionDAO;

    invoke-interface {v0, p1}, Lcom/helpshift/support/storage/SectionDAO;->getSection(Ljava/lang/String;)Lcom/helpshift/support/Section;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 497
    invoke-virtual {p2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 498
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 499
    invoke-virtual {p2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 501
    :cond_1
    new-instance v0, Lcom/helpshift/support/HSApiData$4;

    invoke-direct {v0, p0, p1, p2}, Lcom/helpshift/support/HSApiData$4;-><init>(Lcom/helpshift/support/HSApiData;Ljava/lang/String;Landroid/os/Handler;)V

    .line 512
    invoke-direct {p0, v0, p3, p4}, Lcom/helpshift/support/HSApiData;->getAndStoreSections(Landroid/os/Handler;Landroid/os/Handler;Lcom/helpshift/support/FaqTagFilter;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "Helpshift_ApiData"

    const-string p3, "Database exception in getting section data "

    .line 515
    invoke-static {p2, p3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public getSectionSync(Ljava/lang/String;Landroid/os/Handler;Landroid/os/Handler;)V
    .locals 1

    .line 525
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 526
    invoke-virtual {p3}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    .line 530
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->sectionDAO:Lcom/helpshift/support/storage/SectionDAO;

    invoke-interface {v0, p1}, Lcom/helpshift/support/storage/SectionDAO;->getSection(Ljava/lang/String;)Lcom/helpshift/support/Section;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 532
    invoke-virtual {p2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object p3

    .line 533
    iput-object p1, p3, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 534
    invoke-virtual {p2, p3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    .line 537
    :cond_1
    invoke-virtual {p3}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object p1

    .line 538
    invoke-virtual {p3, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "Helpshift_ApiData"

    const-string p3, "Database exception in getting section data "

    .line 542
    invoke-static {p2, p3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method protected getSections()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/helpshift/support/Section;",
            ">;"
        }
    .end annotation

    .line 219
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 221
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/support/HSApiData;->sectionDAO:Lcom/helpshift/support/storage/SectionDAO;

    invoke-interface {v1}, Lcom/helpshift/support/storage/SectionDAO;->getAllSections()Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "Helpshift_ApiData"

    const-string v3, "Database exception in getting sections data "

    .line 224
    invoke-static {v2, v3, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-object v0
.end method

.method public getSections(Landroid/os/Handler;Landroid/os/Handler;Lcom/helpshift/support/FaqTagFilter;)V
    .locals 3

    .line 193
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->sectionDAO:Lcom/helpshift/support/storage/SectionDAO;

    invoke-interface {v0, p3}, Lcom/helpshift/support/storage/SectionDAO;->getAllSections(Lcom/helpshift/support/FaqTagFilter;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Helpshift_ApiData"

    const-string v2, "Database exception in getting sections data "

    .line 196
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_0

    .line 205
    invoke-virtual {p1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 206
    sget v2, Lcom/helpshift/support/constants/GetSectionsCallBackStatus;->DATABASE_SUCCESS:I

    iput v2, v1, Landroid/os/Message;->what:I

    .line 207
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 208
    invoke-virtual {p1, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_1

    .line 211
    :cond_0
    invoke-virtual {p2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 212
    sget v1, Lcom/helpshift/support/constants/GetSectionsCallBackStatus;->DATABASE_FAILURE:I

    iput v1, v0, Landroid/os/Message;->what:I

    .line 213
    invoke-virtual {p2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 215
    :goto_1
    invoke-direct {p0, p1, p2, p3}, Lcom/helpshift/support/HSApiData;->getAndStoreSections(Landroid/os/Handler;Landroid/os/Handler;Lcom/helpshift/support/FaqTagFilter;)V

    return-void
.end method

.method protected isSectionEmpty(Lcom/helpshift/support/Section;Lcom/helpshift/support/FaqTagFilter;)Z
    .locals 0

    .line 253
    invoke-virtual {p1}, Lcom/helpshift/support/Section;->getPublishId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/support/HSApiData;->getFaqsForSection(Ljava/lang/String;Lcom/helpshift/support/FaqTagFilter;)Ljava/util/ArrayList;

    move-result-object p1

    .line 254
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    return p1
.end method

.method public loadIndex()V
    .locals 3

    .line 462
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/helpshift/support/HSApiData$3;

    invoke-direct {v1, p0}, Lcom/helpshift/support/HSApiData$3;-><init>(Lcom/helpshift/support/HSApiData;)V

    const-string v2, "HS-load-index"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 483
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 484
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public localFaqSearch(Ljava/lang/String;Lcom/helpshift/support/HSSearch$HS_SEARCH_OPTIONS;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/helpshift/support/HSSearch$HS_SEARCH_OPTIONS;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/helpshift/support/Faq;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 284
    invoke-virtual {p0, p1, p2, v0}, Lcom/helpshift/support/HSApiData;->localFaqSearch(Ljava/lang/String;Lcom/helpshift/support/HSSearch$HS_SEARCH_OPTIONS;Lcom/helpshift/support/FaqTagFilter;)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1
.end method

.method public localFaqSearch(Ljava/lang/String;Lcom/helpshift/support/HSSearch$HS_SEARCH_OPTIONS;Lcom/helpshift/support/FaqTagFilter;)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/helpshift/support/HSSearch$HS_SEARCH_OPTIONS;",
            "Lcom/helpshift/support/FaqTagFilter;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/helpshift/support/Faq;",
            ">;"
        }
    .end annotation

    .line 288
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->flatFaqList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 289
    invoke-direct {p0}, Lcom/helpshift/support/HSApiData;->updateFlatList()V

    goto :goto_1

    .line 292
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/support/Faq;

    .line 293
    invoke-virtual {v1}, Lcom/helpshift/support/Faq;->clearSearchTerms()V

    goto :goto_0

    .line 297
    :cond_1
    :goto_1
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 299
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 301
    iget-object v2, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v2}, Lcom/helpshift/support/HSStorage;->isCacheSearchIndexNull()Z

    move-result v2

    if-nez v2, :cond_6

    iget-object v2, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v2}, Lcom/helpshift/support/HSStorage;->getDBFlag()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 302
    iget-object v1, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v1}, Lcom/helpshift/support/HSStorage;->readIndex()Lcom/helpshift/support/model/FaqSearchIndex;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 306
    iget-object v2, v1, Lcom/helpshift/support/model/FaqSearchIndex;->fuzzyIndex:Ljava/util/Map;

    .line 309
    :cond_2
    invoke-static {p1, p2}, Lcom/helpshift/support/HSSearch;->queryDocs(Ljava/lang/String;Lcom/helpshift/support/HSSearch$HS_SEARCH_OPTIONS;)Ljava/util/ArrayList;

    move-result-object p2

    .line 310
    invoke-static {p1, v2}, Lcom/helpshift/support/HSSearch;->getFuzzyMatches(Ljava/lang/String;Ljava/util/Map;)Ljava/util/ArrayList;

    move-result-object p1

    .line 312
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_3
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string v2, "t"

    const-string v3, "f"

    if-eqz v1, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 313
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 314
    invoke-static {v3}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 315
    iget-object v4, p0, Lcom/helpshift/support/HSApiData;->flatFaqList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_3

    .line 316
    iget-object v4, p0, Lcom/helpshift/support/HSApiData;->flatFaqList:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/support/Faq;

    .line 317
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Lcom/helpshift/support/Faq;->addSearchTerms(Ljava/util/ArrayList;)V

    .line 318
    invoke-virtual {v0, v3}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 322
    :cond_4
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_5
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/HashMap;

    .line 323
    invoke-virtual {p2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 324
    invoke-static {v1}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 325
    iget-object v4, p0, Lcom/helpshift/support/HSApiData;->flatFaqList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_5

    .line 326
    iget-object v4, p0, Lcom/helpshift/support/HSApiData;->flatFaqList:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/support/Faq;

    .line 327
    invoke-virtual {p2, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Lcom/helpshift/support/Faq;->addSearchTerms(Ljava/util/ArrayList;)V

    .line 328
    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_6
    const/4 p1, 0x0

    .line 333
    :goto_4
    iget-object p2, p0, Lcom/helpshift/support/HSApiData;->flatFaqList:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p1, p2, :cond_8

    .line 334
    iget-object p2, p0, Lcom/helpshift/support/HSApiData;->flatFaqList:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/helpshift/support/Faq;

    .line 335
    iget-object v2, p2, Lcom/helpshift/support/Faq;->title:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 336
    invoke-virtual {v2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 337
    invoke-virtual {v0, p2}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    :cond_7
    add-int/lit8 p1, p1, 0x1

    goto :goto_4

    :cond_8
    if-eqz p3, :cond_9

    .line 343
    new-instance p1, Ljava/util/ArrayList;

    iget-object p2, p0, Lcom/helpshift/support/HSApiData;->faqDAO:Lcom/helpshift/support/storage/FaqDAO;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {p2, v1, p3}, Lcom/helpshift/support/storage/FaqDAO;->getFilteredFaqs(Ljava/util/List;Lcom/helpshift/support/FaqTagFilter;)Ljava/util/List;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p1

    .line 346
    :cond_9
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p1
.end method

.method public markFaqInDB(Ljava/lang/String;Z)V
    .locals 1

    .line 280
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->faqDAO:Lcom/helpshift/support/storage/FaqDAO;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Lcom/helpshift/support/storage/FaqDAO;->setIsHelpful(Ljava/lang/String;Ljava/lang/Boolean;)I

    return-void
.end method

.method protected resetReviewCounter()V
    .locals 6

    .line 419
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v0}, Lcom/helpshift/support/HSStorage;->getReviewCounter()I

    move-result v0

    .line 420
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v1

    invoke-interface {v1}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v1

    invoke-virtual {v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getPeriodicReview()Lcom/helpshift/configuration/response/PeriodicReview;

    move-result-object v1

    .line 421
    iget-object v1, v1, Lcom/helpshift/configuration/response/PeriodicReview;->type:Ljava/lang/String;

    const-string v2, "s"

    .line 422
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    .line 423
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    const-wide/16 v4, 0x3e8

    div-long/2addr v0, v4

    long-to-int v0, v0

    goto :goto_0

    :cond_0
    const-string v2, "l"

    .line 425
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x0

    .line 428
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v1, v0}, Lcom/helpshift/support/HSStorage;->setReviewCounter(I)V

    .line 429
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v0, v3}, Lcom/helpshift/support/HSStorage;->setLaunchReviewCounter(I)V

    return-void
.end method

.method sendErrorReports(Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/logger/model/LogModel;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_2

    .line 631
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 634
    :cond_0
    invoke-static {}, Lcom/helpshift/providers/CrossModuleDataProvider;->getCampaignModuleAPIs()Lcom/helpshift/providers/ICampaignsModuleAPIs;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 635
    invoke-interface {v0}, Lcom/helpshift/providers/ICampaignsModuleAPIs;->getDeviceIdentifier()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v0, ""

    :goto_0
    move-object v8, v0

    .line 636
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getErrorReportsDM()Lcom/helpshift/logger/ErrorReportsDM;

    move-result-object v1

    new-instance v2, Lcom/helpshift/support/HSApiData$6;

    invoke-direct {v2, p0}, Lcom/helpshift/support/HSApiData$6;-><init>(Lcom/helpshift/support/HSApiData;)V

    .line 649
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserManagerDM;->getActiveUser()Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object v4

    const-string v5, "3"

    const-string v6, "7.11.1"

    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v9, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    move-object v3, p1

    .line 636
    invoke-virtual/range {v1 .. v9}, Lcom/helpshift/logger/ErrorReportsDM;->sendErrorReport(Lcom/helpshift/util/FetchDataFromThread;Ljava/util/List;Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_2
    :goto_1
    return-void
.end method

.method protected shouldShowReviewPopup()Z
    .locals 7

    .line 370
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    const-string v1, "app_reviewed"

    .line 371
    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return v2

    :cond_0
    const-string v1, "reviewUrl"

    .line 375
    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 376
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    return v2

    .line 380
    :cond_1
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getPeriodicReview()Lcom/helpshift/configuration/response/PeriodicReview;

    move-result-object v0

    .line 381
    iget-boolean v1, v0, Lcom/helpshift/configuration/response/PeriodicReview;->isEnabled:Z

    if-eqz v1, :cond_5

    iget v1, v0, Lcom/helpshift/configuration/response/PeriodicReview;->interval:I

    if-gtz v1, :cond_2

    goto :goto_0

    .line 385
    :cond_2
    iget-object v1, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v1}, Lcom/helpshift/support/HSStorage;->getReviewCounter()I

    move-result v1

    .line 386
    iget-object v3, v0, Lcom/helpshift/configuration/response/PeriodicReview;->type:Ljava/lang/String;

    .line 387
    iget v0, v0, Lcom/helpshift/configuration/response/PeriodicReview;->interval:I

    const-string v4, "l"

    .line 388
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    if-ge v1, v0, :cond_4

    :cond_3
    const-string v4, "s"

    .line 389
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    if-eqz v1, :cond_5

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    div-long/2addr v3, v5

    int-to-long v5, v1

    sub-long/2addr v3, v5

    int-to-long v0, v0

    cmp-long v5, v3, v0

    if-ltz v5, :cond_5

    :cond_4
    const/4 v0, 0x1

    return v0

    :cond_5
    :goto_0
    return v2
.end method

.method startSearchIndexing()V
    .locals 3

    .line 180
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/helpshift/support/HSApiData$2;

    invoke-direct {v1, p0}, Lcom/helpshift/support/HSApiData$2;-><init>(Lcom/helpshift/support/HSApiData;)V

    const-string v2, "HS-search-index"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 186
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public storeFile(Ljava/lang/String;)V
    .locals 2

    .line 434
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v0}, Lcom/helpshift/support/HSStorage;->getStoredFiles()Lorg/json/JSONArray;

    move-result-object v0

    .line 435
    invoke-virtual {v0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 436
    iget-object p1, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {p1, v0}, Lcom/helpshift/support/HSStorage;->setStoredFiles(Lorg/json/JSONArray;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Helpshift_ApiData"

    const-string v1, "storeFile"

    .line 439
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method storeSections(Lorg/json/JSONArray;)V
    .locals 2

    .line 174
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Updating "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " FAQ sections in DB"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ApiData"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->sectionDAO:Lcom/helpshift/support/storage/SectionDAO;

    invoke-interface {v0}, Lcom/helpshift/support/storage/SectionDAO;->clearSectionsData()V

    .line 176
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->sectionDAO:Lcom/helpshift/support/storage/SectionDAO;

    invoke-interface {v0, p1}, Lcom/helpshift/support/storage/SectionDAO;->storeSections(Lorg/json/JSONArray;)V

    return-void
.end method

.method updateIndex()V
    .locals 3

    .line 446
    sget-object v0, Lcom/helpshift/support/HSApiData;->faqIndexLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    const-string v1, "Helpshift_ApiData"

    const-string v2, "Updating search indexes."

    .line 447
    invoke-static {v1, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 448
    iget-object v1, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v1}, Lcom/helpshift/support/HSStorage;->deleteIndex()V

    .line 449
    invoke-direct {p0}, Lcom/helpshift/support/HSApiData;->updateFlatList()V

    .line 451
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/helpshift/support/HSApiData;->flatFaqList:Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v1}, Lcom/helpshift/support/HSSearch;->indexDocuments(Ljava/util/ArrayList;)Lcom/helpshift/support/model/FaqSearchIndex;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 453
    iget-object v2, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v2, v1}, Lcom/helpshift/support/HSStorage;->storeIndex(Lcom/helpshift/support/model/FaqSearchIndex;)V

    .line 456
    :cond_0
    invoke-static {}, Lcom/helpshift/support/HSApiData;->signalSearchIndexesUpdated()V

    const-string v1, "Helpshift_ApiData"

    const-string v2, "Search index update finished."

    .line 457
    invoke-static {v1, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 458
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected updateReviewCounter()V
    .locals 5

    .line 397
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v0}, Lcom/helpshift/support/HSStorage;->getReviewCounter()I

    move-result v0

    .line 398
    iget-object v1, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v1}, Lcom/helpshift/support/HSStorage;->getLaunchReviewCounter()I

    move-result v1

    if-nez v0, :cond_0

    .line 402
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    const-wide/16 v3, 0x3e8

    div-long/2addr v1, v3

    long-to-int v2, v1

    goto :goto_0

    :cond_0
    move v2, v0

    move v0, v1

    :goto_0
    add-int/lit8 v0, v0, 0x1

    .line 406
    iget-object v1, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v1, v0}, Lcom/helpshift/support/HSStorage;->setLaunchReviewCounter(I)V

    .line 408
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getPeriodicReview()Lcom/helpshift/configuration/response/PeriodicReview;

    move-result-object v0

    .line 409
    iget-object v0, v0, Lcom/helpshift/configuration/response/PeriodicReview;->type:Ljava/lang/String;

    const-string v1, "l"

    .line 410
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 411
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v0}, Lcom/helpshift/support/HSStorage;->getLaunchReviewCounter()I

    move-result v2

    .line 413
    :cond_1
    iget-object v0, p0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v0, v2}, Lcom/helpshift/support/HSStorage;->setReviewCounter(I)V

    return-void
.end method
