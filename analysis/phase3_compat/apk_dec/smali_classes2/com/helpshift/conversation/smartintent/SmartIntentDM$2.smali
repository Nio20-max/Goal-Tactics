.class Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;
.super Lcom/helpshift/common/domain/F;
.source "SmartIntentDM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/smartintent/SmartIntentDM;->fetchSmartIntentModelFromServer(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

.field final synthetic val$siTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

.field final synthetic val$userDM:Lcom/helpshift/account/domainmodel/UserDM;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 0

    .line 399
    iput-object p1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iput-object p2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$siTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    iput-object p3, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 8

    const-string v0, "Helpshift_SmartIntDM"

    .line 402
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/intent-trees/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$siTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    iget-object v2, v2, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->serverId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/models/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 403
    iget-object v2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v3, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1300()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$100(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 405
    new-instance v3, Lcom/helpshift/common/domain/network/GETNetwork;

    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$200(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/common/domain/Domain;

    move-result-object v4

    iget-object v5, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v5}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$300(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/common/platform/Platform;

    move-result-object v5

    invoke-direct {v3, v1, v4, v5}, Lcom/helpshift/common/domain/network/GETNetwork;-><init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 406
    new-instance v1, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;

    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$300(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/common/platform/Platform;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 407
    new-instance v3, Lcom/helpshift/common/domain/network/ETagNetwork;

    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$300(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/common/platform/Platform;

    move-result-object v4

    invoke-direct {v3, v1, v4, v2}, Lcom/helpshift/common/domain/network/ETagNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;Ljava/lang/String;)V

    .line 408
    new-instance v1, Lcom/helpshift/common/domain/network/GuardOKNetwork;

    invoke-direct {v1, v3}, Lcom/helpshift/common/domain/network/GuardOKNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    const/4 v3, 0x0

    .line 413
    :try_start_0
    new-instance v4, Lcom/helpshift/common/platform/network/RequestData;

    iget-object v5, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v6, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v7, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$siTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    invoke-static {v5, v6, v7}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1400(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Lcom/helpshift/common/platform/network/RequestData;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/helpshift/common/platform/network/RequestData;-><init>(Lcom/helpshift/common/platform/network/RequestData;)V

    .line 414
    invoke-interface {v1, v4}, Lcom/helpshift/common/domain/network/Network;->makeRequest(Lcom/helpshift/common/platform/network/RequestData;)Lcom/helpshift/common/platform/network/Response;

    move-result-object v1

    const/4 v3, 0x1

    .line 420
    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    .line 421
    invoke-static {v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$300(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/common/platform/Platform;

    move-result-object v4

    invoke-interface {v4}, Lcom/helpshift/common/platform/Platform;->getResponseParser()Lcom/helpshift/common/platform/network/ResponseParser;

    move-result-object v4

    iget-object v1, v1, Lcom/helpshift/common/platform/network/Response;->responseString:Ljava/lang/String;

    invoke-interface {v4, v1}, Lcom/helpshift/common/platform/network/ResponseParser;->parseSmartIntentSearchModel(Ljava/lang/String;)Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;

    move-result-object v1

    .line 422
    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$300(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/common/platform/Platform;

    move-result-object v4

    invoke-static {v4}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeInMillis(Lcom/helpshift/common/platform/Platform;)J

    move-result-wide v4

    iput-wide v4, v1, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->lastRefreshedAt:J

    .line 424
    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$500(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    move-result-object v4

    iget-object v5, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$siTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    iget-object v5, v5, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->localId:Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-interface {v4, v5, v6}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->deleteModel(J)Z

    .line 426
    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$500(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    move-result-object v4

    iget-object v5, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$siTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    iget-object v5, v5, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->localId:Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-interface {v4, v5, v6, v1}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->insertModel(JLcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 428
    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1500(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)V

    goto :goto_0

    .line 432
    :cond_0
    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v1, v2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$700(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Ljava/lang/String;)V

    .line 433
    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v5, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$siTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    invoke-static {v1, v4, v5}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1600(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto/16 :goto_3

    :catch_0
    move-exception v1

    if-eqz v3, :cond_1

    .line 469
    :try_start_1
    iget-object v3, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v3, v2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$700(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Ljava/lang/String;)V

    :cond_1
    const-string v2, "Generic error while fetching smart intent model : "

    .line 471
    invoke-static {v0, v2, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 472
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$siTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    invoke-static {v0, v1, v2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1600(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 476
    :goto_0
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v0}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1900(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Ljava/util/Set;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto/16 :goto_2

    :catch_1
    move-exception v1

    if-eqz v3, :cond_2

    .line 439
    :try_start_2
    iget-object v3, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v3, v2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$700(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Ljava/lang/String;)V

    .line 442
    :cond_2
    iget-object v2, v1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    instance-of v2, v2, Lcom/helpshift/common/exception/NetworkException;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const-string v3, "Error while fetching smart intent model : "

    if-eqz v2, :cond_6

    .line 443
    :try_start_3
    iget-object v2, v1, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    check-cast v2, Lcom/helpshift/common/exception/NetworkException;

    .line 444
    iget v4, v2, Lcom/helpshift/common/exception/NetworkException;->serverStatusCode:I

    sget-object v5, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->CONTENT_UNCHANGED:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_3

    .line 446
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$siTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    iget-object v1, v1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->localId:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1700(Lcom/helpshift/conversation/smartintent/SmartIntentDM;J)V

    .line 447
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v0}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1500(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)V

    goto :goto_0

    .line 449
    :cond_3
    iget v4, v2, Lcom/helpshift/common/exception/NetworkException;->serverStatusCode:I

    sget-object v5, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->CONTENT_NOT_FOUND:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eq v4, v5, :cond_5

    iget v2, v2, Lcom/helpshift/common/exception/NetworkException;->serverStatusCode:I

    sget-object v4, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->CONFLICT:Ljava/lang/Integer;

    .line 450
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v2, v4, :cond_4

    goto :goto_1

    .line 457
    :cond_4
    invoke-static {v0, v3, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 458
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$siTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    invoke-static {v0, v1, v2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1600(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    goto :goto_0

    :cond_5
    :goto_1
    const-string v2, "Error smart intent model not exist or cached tree is not latest: "

    .line 452
    invoke-static {v0, v2, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 454
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$siTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    invoke-static {v0, v1, v2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1800(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Z

    goto :goto_0

    .line 462
    :cond_6
    invoke-static {v0, v3, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 463
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$siTree:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    invoke-static {v0, v1, v2}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1600(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    :goto_2
    return-void

    .line 476
    :goto_3
    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1900(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Ljava/util/Set;

    move-result-object v1

    iget-object v2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$2;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v2}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 477
    throw v0
.end method
