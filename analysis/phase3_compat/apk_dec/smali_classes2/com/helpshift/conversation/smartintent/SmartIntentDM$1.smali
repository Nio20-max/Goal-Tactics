.class Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;
.super Lcom/helpshift/common/domain/F;
.source "SmartIntentDM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/smartintent/SmartIntentDM;->fetchSmartIntentTreeFromServer(Lcom/helpshift/account/domainmodel/UserDM;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

.field final synthetic val$userDM:Lcom/helpshift/account/domainmodel/UserDM;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)V
    .locals 0

    .line 190
    iput-object p1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iput-object p2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 7

    const-string v0, "Helpshift_SmartIntDM"

    .line 194
    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$000()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$100(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 196
    new-instance v2, Lcom/helpshift/common/domain/network/GETNetwork;

    iget-object v3, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v3}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$200(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/common/domain/Domain;

    move-result-object v3

    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$300(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/common/platform/Platform;

    move-result-object v4

    const-string v5, "/intent-trees/"

    invoke-direct {v2, v5, v3, v4}, Lcom/helpshift/common/domain/network/GETNetwork;-><init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 197
    new-instance v3, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;

    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$300(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/common/platform/Platform;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 198
    new-instance v2, Lcom/helpshift/common/domain/network/ETagNetwork;

    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$300(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/common/platform/Platform;

    move-result-object v4

    invoke-direct {v2, v3, v4, v1}, Lcom/helpshift/common/domain/network/ETagNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;Ljava/lang/String;)V

    .line 199
    new-instance v3, Lcom/helpshift/common/domain/network/GuardOKNetwork;

    invoke-direct {v3, v2}, Lcom/helpshift/common/domain/network/GuardOKNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    const/4 v2, 0x0

    .line 204
    :try_start_0
    new-instance v4, Lcom/helpshift/common/platform/network/RequestData;

    iget-object v5, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v6, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    .line 205
    invoke-static {v5, v6}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$400(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/common/platform/network/RequestData;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/helpshift/common/platform/network/RequestData;-><init>(Lcom/helpshift/common/platform/network/RequestData;)V

    invoke-interface {v3, v4}, Lcom/helpshift/common/domain/network/Network;->makeRequest(Lcom/helpshift/common/platform/network/RequestData;)Lcom/helpshift/common/platform/network/Response;

    move-result-object v2
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v3, 0x1

    .line 213
    :try_start_1
    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$300(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/common/platform/Platform;

    move-result-object v4

    invoke-interface {v4}, Lcom/helpshift/common/platform/Platform;->getResponseParser()Lcom/helpshift/common/platform/network/ResponseParser;

    move-result-object v4

    iget-object v2, v2, Lcom/helpshift/common/platform/network/Response;->responseString:Ljava/lang/String;

    .line 214
    invoke-interface {v4, v2}, Lcom/helpshift/common/platform/network/ResponseParser;->parseSmartIntentTree(Ljava/lang/String;)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    move-result-object v2

    .line 215
    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    .line 216
    invoke-static {v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$300(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/common/platform/Platform;

    move-result-object v4

    invoke-static {v4}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeInMillis(Lcom/helpshift/common/platform/Platform;)J

    move-result-wide v4

    iput-wide v4, v2, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->lastRefreshedAt:J

    .line 218
    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$500(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    move-result-object v4

    iget-object v5, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-interface {v4, v5}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->deleteTreeAndModel(Lcom/helpshift/account/domainmodel/UserDM;)Z

    .line 220
    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$500(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    move-result-object v4

    iget-object v5, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-interface {v4, v5, v2}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->insertTree(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 222
    iget-object v2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {v2, v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$600(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)V

    goto :goto_1

    .line 226
    :cond_0
    iget-object v2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v2, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$700(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Ljava/lang/String;)V

    .line 227
    iget-object v2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {v2, v4}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$800(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)V
    :try_end_1
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v2

    goto :goto_0

    :catch_1
    move-exception v2

    goto :goto_2

    :catchall_0
    move-exception v0

    goto/16 :goto_4

    :catch_2
    move-exception v3

    move-object v2, v3

    const/4 v3, 0x0

    :goto_0
    if-eqz v3, :cond_1

    .line 264
    :try_start_2
    iget-object v3, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v3, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$700(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Ljava/lang/String;)V

    :cond_1
    const-string v1, "Generic error while fetching smart intent tree : "

    .line 267
    invoke-static {v0, v1, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 268
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {v0, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$800(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 272
    :goto_1
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v0}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1200(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Ljava/util/Set;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_3

    :catch_3
    move-exception v3

    move-object v2, v3

    const/4 v3, 0x0

    :goto_2
    if-eqz v3, :cond_2

    .line 233
    :try_start_3
    iget-object v3, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v3, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$700(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Ljava/lang/String;)V

    .line 236
    :cond_2
    iget-object v1, v2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    instance-of v1, v1, Lcom/helpshift/common/exception/NetworkException;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const-string v3, "Error while fetching smart intent tree : "

    if-eqz v1, :cond_5

    .line 237
    :try_start_4
    iget-object v1, v2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    check-cast v1, Lcom/helpshift/common/exception/NetworkException;

    .line 238
    iget v4, v1, Lcom/helpshift/common/exception/NetworkException;->serverStatusCode:I

    sget-object v5, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->CONTENT_UNCHANGED:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_3

    .line 240
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {v0, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$900(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)V

    .line 241
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {v0, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$600(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)V

    goto :goto_1

    .line 243
    :cond_3
    iget v1, v1, Lcom/helpshift/common/exception/NetworkException;->serverStatusCode:I

    sget-object v4, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->CONTENT_NOT_FOUND:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v1, v4, :cond_4

    const-string v1, "Smart intent tree data not exist on server : "

    .line 244
    invoke-static {v0, v1, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 246
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {v0, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1000(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)Z

    .line 248
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {v0, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1100(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)V

    goto :goto_1

    .line 252
    :cond_4
    invoke-static {v0, v3, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 253
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {v0, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$800(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)V

    goto :goto_1

    .line 257
    :cond_5
    invoke-static {v0, v3, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 258
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-static {v0, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$800(Lcom/helpshift/conversation/smartintent/SmartIntentDM;Lcom/helpshift/account/domainmodel/UserDM;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    :goto_3
    return-void

    .line 272
    :goto_4
    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    invoke-static {v1}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;->access$1200(Lcom/helpshift/conversation/smartintent/SmartIntentDM;)Ljava/util/Set;

    move-result-object v1

    iget-object v2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v2}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 273
    throw v0
.end method
