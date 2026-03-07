.class public Lcom/helpshift/conversation/smartintent/SmartIntentDM;
.super Ljava/lang/Object;
.source "SmartIntentDM.java"


# static fields
.field private static SI_MODEL_ROUTE_ETAG_SUFFIX:Ljava/lang/String; = "smart_intent_model_route"

.field private static SI_TREE_ROUTE_ETAG_SUFFIX:Ljava/lang/String; = "smart_intent_tree_route"

.field private static final TAG:Ljava/lang/String; = "Helpshift_SmartIntDM"


# instance fields
.field private callback:Lcom/helpshift/conversation/smartintent/SmartIntentDMCallback;

.field private domain:Lcom/helpshift/common/domain/Domain;

.field private inProgressModelFetchRequests:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private inProgressTreeFetchRequests:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private platform:Lcom/helpshift/common/platform/Platform;

.field private searchManager:Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;

.field private smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V
    .locals 1

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->inProgressTreeFetchRequests:Ljava/util/Set;

    .line 53
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 54
    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->inProgressModelFetchRequests:Ljava/util/Set;

    .line 61
    iput-object p2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->domain:Lcom/helpshift/common/domain/Domain;

    .line 62
    iput-object p1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 63
    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getSmartIntentDAO()Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    .line 64
    new-instance p2, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;

    invoke-direct {p2, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;-><init>(Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;)V

    iput-object p2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->searchManager:Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 44
    sget-object v0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->SI_TREE_ROUTE_ETAG_SUFFIX:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 44
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->getKeyToStoreETag(Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1000(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)Z
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->deleteTreeAndModel(Lcom/helpshift/account/domainmodel/UserDM;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1100(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->notifyTreeUnAvailableCallback(Lcom/helpshift/account/domainmodel/UserDM;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Ljava/util/Set;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->inProgressTreeFetchRequests:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic access$1300()Ljava/lang/String;
    .locals 1

    .line 44
    sget-object v0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->SI_MODEL_ROUTE_ETAG_SUFFIX:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Lcom/helpshift/common/platform/network/RequestData;
    .locals 0

    .line 44
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->getIntentModelRequestData(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Lcom/helpshift/common/platform/network/RequestData;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1500(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)V
    .locals 0

    .line 44
    invoke-direct {p0}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->handleModelRefreshSuccess()V

    return-void
.end method

.method static synthetic access$1600(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->handleModelRefreshFailure(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/helpshift/conversation/smartintent/SmartIntentDM;J)V
    .locals 0

    .line 44
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->updateLastSuccessfulModelFetchTime(J)V

    return-void
.end method

.method static synthetic access$1800(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Z
    .locals 0

    .line 44
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->deleteModel(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1900(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Ljava/util/Set;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->inProgressModelFetchRequests:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic access$200(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/common/domain/Domain;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->domain:Lcom/helpshift/common/domain/Domain;

    return-object p0
.end method

.method static synthetic access$300(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/common/platform/Platform;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->platform:Lcom/helpshift/common/platform/Platform;

    return-object p0
.end method

.method static synthetic access$400(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/common/platform/network/RequestData;
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->getIntentTreeRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/common/platform/network/RequestData;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    return-object p0
.end method

.method static synthetic access$600(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->handleTreeRefreshSuccess(Lcom/helpshift/account/domainmodel/UserDM;)V

    return-void
.end method

.method static synthetic access$700(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Ljava/lang/String;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->clearETagFromStorage(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->handleTreeRefreshFailure(Lcom/helpshift/account/domainmodel/UserDM;)V

    return-void
.end method

.method static synthetic access$900(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->updateLastSuccessfulTreeFetchTime(Lcom/helpshift/account/domainmodel/UserDM;)V

    return-void
.end method

.method private clearETagFromStorage(Ljava/lang/String;)V
    .locals 1

    .line 578
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getNetworkRequestDAO()Lcom/helpshift/common/platform/network/NetworkRequestDAO;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/helpshift/common/platform/network/NetworkRequestDAO;->removeETag(Ljava/lang/String;)V

    return-void
.end method

.method private deleteModel(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Z
    .locals 2

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 571
    :cond_0
    sget-object v0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->SI_MODEL_ROUTE_ETAG_SUFFIX:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->getKeyToStoreETag(Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->clearETagFromStorage(Ljava/lang/String;)V

    .line 574
    iget-object p1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    iget-object p2, p2, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->localId:Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-interface {p1, v0, v1}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->deleteModel(J)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method private deleteTreeAndModel(Lcom/helpshift/account/domainmodel/UserDM;)Z
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 553
    :cond_0
    sget-object v0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->SI_TREE_ROUTE_ETAG_SUFFIX:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->getKeyToStoreETag(Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->clearETagFromStorage(Ljava/lang/String;)V

    .line 554
    sget-object v0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->SI_MODEL_ROUTE_ETAG_SUFFIX:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->getKeyToStoreETag(Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->clearETagFromStorage(Ljava/lang/String;)V

    .line 556
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->deleteTreeAndModel(Lcom/helpshift/account/domainmodel/UserDM;)Z

    move-result p1

    return p1
.end method

.method private getIntentModelRequestData(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Lcom/helpshift/common/platform/network/RequestData;
    .locals 1

    .line 524
    invoke-static {p1}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->getUserRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Ljava/util/HashMap;

    move-result-object p1

    .line 525
    iget p2, p2, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->version:I

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    const-string v0, "tree_version"

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 526
    new-instance p2, Lcom/helpshift/common/platform/network/RequestData;

    invoke-direct {p2, p1}, Lcom/helpshift/common/platform/network/RequestData;-><init>(Ljava/util/Map;)V

    return-object p2
.end method

.method private getIntentTreeRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/common/platform/network/RequestData;
    .locals 2

    .line 345
    invoke-static {p1}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->getUserRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Ljava/util/HashMap;

    move-result-object p1

    .line 346
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getAppId()Ljava/lang/String;

    move-result-object v0

    const-string v1, "platform_id"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    new-instance v0, Lcom/helpshift/common/platform/network/RequestData;

    invoke-direct {v0, p1}, Lcom/helpshift/common/platform/network/RequestData;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method private getKeyToStoreETag(Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 582
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "_"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private handleModelRefreshFailure(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
    .locals 0

    .line 515
    invoke-virtual {p0, p1, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->checkAndDeleteCachedModel(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Z

    return-void
.end method

.method private handleModelRefreshSuccess()V
    .locals 0

    return-void
.end method

.method private handleTreeRefreshFailure(Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 1

    .line 313
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->checkAndDeleteCachedTree(Lcom/helpshift/account/domainmodel/UserDM;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 316
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->getTree(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 320
    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->notifyTreeAvailableCallback(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    goto :goto_1

    .line 323
    :cond_1
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->notifyTreeUnAvailableCallback(Lcom/helpshift/account/domainmodel/UserDM;)V

    :goto_1
    return-void
.end method

.method private handleTreeRefreshSuccess(Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 1

    .line 282
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->getTree(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 284
    invoke-direct {p0, p1, v0}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->notifyTreeAvailableCallback(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    goto :goto_0

    .line 288
    :cond_0
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->deleteTreeAndModel(Lcom/helpshift/account/domainmodel/UserDM;)Z

    .line 289
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->notifyTreeUnAvailableCallback(Lcom/helpshift/account/domainmodel/UserDM;)V

    :goto_0
    return-void
.end method

.method private notifyTreeAvailableCallback(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
    .locals 2

    const-string v0, "Helpshift_SmartIntDM"

    const-string v1, "Smart intent tree available"

    .line 328
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->callback:Lcom/helpshift/conversation/smartintent/SmartIntentDMCallback;

    if-eqz v0, :cond_0

    .line 330
    invoke-interface {v0, p1, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentDMCallback;->onTreeAvailable(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    .line 334
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->refreshSmartIntentSearchModel(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    return-void
.end method

.method private notifyTreeUnAvailableCallback(Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 2

    const-string v0, "Helpshift_SmartIntDM"

    const-string v1, "Smart intent tree unavailable"

    .line 338
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 339
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->callback:Lcom/helpshift/conversation/smartintent/SmartIntentDMCallback;

    if-eqz v0, :cond_0

    .line 340
    invoke-interface {v0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDMCallback;->onTreeUnAvailable(Lcom/helpshift/account/domainmodel/UserDM;)V

    :cond_0
    return-void
.end method

.method private updateLastSuccessfulModelFetchTime(J)V
    .locals 3

    .line 519
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeInMillis(Lcom/helpshift/common/platform/Platform;)J

    move-result-wide v0

    .line 520
    iget-object v2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    invoke-interface {v2, p1, p2, v0, v1}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->updateModelLastRefreshedAtTime(JJ)Z

    return-void
.end method

.method private updateLastSuccessfulTreeFetchTime(Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 3

    .line 294
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeInMillis(Lcom/helpshift/common/platform/Platform;)J

    move-result-wide v0

    .line 295
    iget-object v2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    invoke-interface {v2, p1, v0, v1}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->updateTreeLastRefreshedAtTime(Lcom/helpshift/account/domainmodel/UserDM;J)Z

    return-void
.end method


# virtual methods
.method checkAndDeleteCachedModel(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Z
    .locals 6

    .line 488
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    iget-object v1, p2, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->localId:Ljava/lang/Long;

    .line 489
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->getModelWithoutWordProbabilities(J)Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 496
    :cond_0
    iget-wide v2, v0, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->lastRefreshedAt:J

    .line 497
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeInMillis(Lcom/helpshift/common/platform/Platform;)J

    move-result-wide v4

    sub-long/2addr v4, v2

    .line 501
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->domain:Lcom/helpshift/common/domain/Domain;

    .line 502
    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getSmartIntentClientCacheExpiryInterval()J

    move-result-wide v2

    cmp-long v0, v4, v2

    if-ltz v0, :cond_1

    .line 505
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->deleteModel(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Z

    move-result p1

    return p1

    :cond_1
    return v1
.end method

.method checkAndDeleteCachedTree(Lcom/helpshift/account/domainmodel/UserDM;)Z
    .locals 6

    .line 139
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->getTree(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 146
    :cond_0
    iget-wide v2, v0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->lastRefreshedAt:J

    .line 147
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeInMillis(Lcom/helpshift/common/platform/Platform;)J

    move-result-wide v4

    sub-long/2addr v4, v2

    .line 151
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->domain:Lcom/helpshift/common/domain/Domain;

    .line 152
    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getSmartIntentClientCacheExpiryInterval()J

    move-result-wide v2

    cmp-long v0, v4, v2

    if-ltz v0, :cond_1

    .line 155
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->deleteTreeAndModel(Lcom/helpshift/account/domainmodel/UserDM;)Z

    move-result p1

    return p1

    :cond_1
    return v1
.end method

.method public clearUserData(Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 0

    .line 539
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->deleteTreeAndModel(Lcom/helpshift/account/domainmodel/UserDM;)Z

    return-void
.end method

.method fetchSmartIntentModelFromServer(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
    .locals 2

    .line 392
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->isModelFetchRequestInProgress(Lcom/helpshift/account/domainmodel/UserDM;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 397
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->inProgressModelFetchRequests:Ljava/util/Set;

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 399
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;

    invoke-direct {v1, p0, p2, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;-><init>(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;Lcom/helpshift/account/domainmodel/UserDM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public fetchSmartIntentTreeFromServer(Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 2

    .line 183
    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->isTreeFetchRequestInProgress(Lcom/helpshift/account/domainmodel/UserDM;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 188
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->inProgressTreeFetchRequests:Ljava/util/Set;

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 190
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;-><init>(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public getSmartIntentTree(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;
    .locals 1

    .line 358
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->getTree(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    move-result-object p1

    return-object p1
.end method

.method public isModelFetchRequestInProgress(Lcom/helpshift/account/domainmodel/UserDM;)Z
    .locals 1

    .line 174
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->inProgressModelFetchRequests:Ljava/util/Set;

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public isSmartIntentModelAvailable(J)Z
    .locals 6

    .line 372
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    invoke-interface {v0, p1, p2}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->getModelWithoutWordProbabilities(J)Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;

    move-result-object p1

    const/4 p2, 0x0

    if-nez p1, :cond_0

    return p2

    .line 378
    :cond_0
    iget-wide v0, p1, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->lastRefreshedAt:J

    .line 379
    iget-object p1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getSmartIntentModelRefreshInterval()J

    move-result-wide v2

    .line 382
    iget-object p1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {p1}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeInMillis(Lcom/helpshift/common/platform/Platform;)J

    move-result-wide v4

    sub-long/2addr v4, v0

    cmp-long p1, v4, v2

    if-gez p1, :cond_1

    const/4 p2, 0x1

    :cond_1
    return p2
.end method

.method public isSmartIntentTreeAvailable(Lcom/helpshift/account/domainmodel/UserDM;)Z
    .locals 7

    .line 118
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    invoke-interface {v0, p1}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->getTree(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 124
    :cond_0
    iget-wide v1, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->lastRefreshedAt:J

    .line 125
    iget-object p1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->domain:Lcom/helpshift/common/domain/Domain;

    .line 126
    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getSmartIntentTreeRefreshInterval()J

    move-result-wide v3

    .line 129
    iget-object p1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {p1}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeInMillis(Lcom/helpshift/common/platform/Platform;)J

    move-result-wide v5

    sub-long/2addr v5, v1

    cmp-long p1, v5, v3

    if-gez p1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method public isTreeFetchRequestInProgress(Lcom/helpshift/account/domainmodel/UserDM;)Z
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->inProgressTreeFetchRequests:Ljava/util/Set;

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public match(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;Ljava/lang/String;)Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;
    .locals 1

    .line 530
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->searchManager:Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->match(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;Ljava/lang/String;)Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    move-result-object p1

    return-object p1
.end method

.method public refreshSmartIntentSearchModel(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
    .locals 2

    .line 304
    iget-object v0, p2, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->localId:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->isSmartIntentModelAvailable(J)Z

    move-result v0

    if-nez v0, :cond_0

    .line 305
    invoke-virtual {p0, p1, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->fetchSmartIntentModelFromServer(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    :cond_0
    return-void
.end method

.method public registerSmartIntentDMCallback(Lcom/helpshift/conversation/smartintent/SmartIntentDMCallback;)V
    .locals 0

    .line 166
    iput-object p1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->callback:Lcom/helpshift/conversation/smartintent/SmartIntentDMCallback;

    return-void
.end method

.method public shouldShowSmartIntent(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z
    .locals 3

    .line 82
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    .line 84
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->isSmartIntentsEnabled()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return v2

    :cond_0
    const-string v1, "conversationPrefillText"

    .line 89
    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    return v2

    .line 94
    :cond_1
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->shouldAutoFillPreissueFirstMessage()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "initialUserMessageToAutoSendInPreissue"

    .line 95
    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v2

    .line 99
    :cond_2
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getConversationInboxManagerDM()Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;

    move-result-object v0

    .line 100
    invoke-virtual {v0}, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->getActiveConversationInboxDM()Lcom/helpshift/conversation/domainmodel/ConversationController;

    move-result-object v0

    .line 101
    invoke-virtual {v0}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getConversationManager()Lcom/helpshift/conversation/activeconversation/ConversationManager;

    move-result-object v0

    .line 103
    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->isSynced(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 104
    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->containsAtleastOneUserMessage(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result p1

    if-nez p1, :cond_3

    const/4 v2, 0x1

    :cond_3
    return v2
.end method

.method public unregisterSmartIntentDMCallback()V
    .locals 1

    const/4 v0, 0x0

    .line 354
    iput-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->callback:Lcom/helpshift/conversation/smartintent/SmartIntentDMCallback;

    return-void
.end method
