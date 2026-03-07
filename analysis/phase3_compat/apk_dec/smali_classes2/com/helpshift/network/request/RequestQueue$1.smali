.class Lcom/helpshift/network/request/RequestQueue$1;
.super Ljava/lang/Object;
.source "RequestQueue.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/network/request/RequestQueue;->add(Lcom/helpshift/network/request/Request;)Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/network/request/RequestQueue;

.field final synthetic val$request:Lcom/helpshift/network/request/Request;


# direct methods
.method constructor <init>(Lcom/helpshift/network/request/RequestQueue;Lcom/helpshift/network/request/Request;)V
    .locals 0

    .line 55
    iput-object p1, p0, Lcom/helpshift/network/request/RequestQueue$1;->this$0:Lcom/helpshift/network/request/RequestQueue;

    iput-object p2, p0, Lcom/helpshift/network/request/RequestQueue$1;->val$request:Lcom/helpshift/network/request/Request;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "HS_RequestQueue"

    .line 60
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/network/request/RequestQueue$1;->this$0:Lcom/helpshift/network/request/RequestQueue;

    iget-object v1, v1, Lcom/helpshift/network/request/RequestQueue;->network:Lcom/helpshift/network/Network;

    iget-object v2, p0, Lcom/helpshift/network/request/RequestQueue$1;->val$request:Lcom/helpshift/network/request/Request;

    invoke-interface {v1, v2}, Lcom/helpshift/network/Network;->performRequest(Lcom/helpshift/network/request/Request;)Lcom/helpshift/network/response/NetworkResponse;

    move-result-object v1

    .line 62
    iget v2, v1, Lcom/helpshift/network/response/NetworkResponse;->statusCode:I

    const/16 v3, 0x12c

    if-lt v2, v3, :cond_0

    .line 63
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Api result : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/helpshift/network/request/RequestQueue$1;->val$request:Lcom/helpshift/network/request/Request;

    iget-object v3, v3, Lcom/helpshift/network/request/Request;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", Status : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v1, Lcom/helpshift/network/response/NetworkResponse;->statusCode:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    :cond_0
    iget-boolean v2, v1, Lcom/helpshift/network/response/NetworkResponse;->notModified:Z

    if-eqz v2, :cond_2

    .line 69
    iget-object v1, p0, Lcom/helpshift/network/request/RequestQueue$1;->val$request:Lcom/helpshift/network/request/Request;

    invoke-virtual {v1}, Lcom/helpshift/network/request/Request;->hasHadResponseDelivered()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x0

    return-object v0

    .line 73
    :cond_1
    new-instance v1, Lcom/helpshift/network/errors/NetworkError;

    sget-object v2, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->CONTENT_UNCHANGED:Ljava/lang/Integer;

    invoke-direct {v1, v2}, Lcom/helpshift/network/errors/NetworkError;-><init>(Ljava/lang/Integer;)V

    throw v1

    .line 76
    :cond_2
    iget-object v2, p0, Lcom/helpshift/network/request/RequestQueue$1;->val$request:Lcom/helpshift/network/request/Request;

    invoke-virtual {v2, v1}, Lcom/helpshift/network/request/Request;->parseNetworkResponse(Lcom/helpshift/network/response/NetworkResponse;)Lcom/helpshift/network/response/Response;

    move-result-object v1

    .line 77
    iget-object v2, p0, Lcom/helpshift/network/request/RequestQueue$1;->this$0:Lcom/helpshift/network/request/RequestQueue;

    iget-object v2, v2, Lcom/helpshift/network/request/RequestQueue;->delivery:Lcom/helpshift/network/response/ResponseDelivery;

    iget-object v3, p0, Lcom/helpshift/network/request/RequestQueue$1;->val$request:Lcom/helpshift/network/request/Request;

    invoke-interface {v2, v3, v1}, Lcom/helpshift/network/response/ResponseDelivery;->postResponse(Lcom/helpshift/network/request/Request;Lcom/helpshift/network/response/Response;)V
    :try_end_0
    .catch Lcom/helpshift/network/errors/NetworkError; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Throwable;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const/4 v5, 0x2

    new-array v5, v5, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    .line 81
    iget-object v6, p0, Lcom/helpshift/network/request/RequestQueue$1;->val$request:Lcom/helpshift/network/request/Request;

    iget-object v6, v6, Lcom/helpshift/network/request/Request;->url:Ljava/lang/String;

    const-string v7, "route"

    .line 82
    invoke-static {v7, v6}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromString(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v6

    aput-object v6, v5, v4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    invoke-virtual {v1}, Lcom/helpshift/network/errors/NetworkError;->getReason()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, ""

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v6, "reason"

    invoke-static {v6, v4}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromString(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v4

    aput-object v4, v5, v2

    const-string v2, "Network error"

    .line 81
    invoke-static {v0, v2, v3, v5}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    .line 84
    iget-object v0, p0, Lcom/helpshift/network/request/RequestQueue$1;->this$0:Lcom/helpshift/network/request/RequestQueue;

    iget-object v2, p0, Lcom/helpshift/network/request/RequestQueue$1;->val$request:Lcom/helpshift/network/request/Request;

    invoke-virtual {v0, v2, v1}, Lcom/helpshift/network/request/RequestQueue;->parseAndDeliverNetworkError(Lcom/helpshift/network/request/Request;Lcom/helpshift/network/errors/NetworkError;)V

    return-object v1
.end method
