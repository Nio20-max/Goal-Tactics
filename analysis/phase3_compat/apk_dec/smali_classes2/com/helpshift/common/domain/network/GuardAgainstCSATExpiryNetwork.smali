.class public Lcom/helpshift/common/domain/network/GuardAgainstCSATExpiryNetwork;
.super Ljava/lang/Object;
.source "GuardAgainstCSATExpiryNetwork.java"

# interfaces
.implements Lcom/helpshift/common/domain/network/Network;


# instance fields
.field private final network:Lcom/helpshift/common/domain/network/Network;

.field private final responseParser:Lcom/helpshift/common/platform/network/ResponseParser;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/helpshift/common/domain/network/GuardAgainstCSATExpiryNetwork;->network:Lcom/helpshift/common/domain/network/Network;

    .line 24
    invoke-interface {p2}, Lcom/helpshift/common/platform/Platform;->getResponseParser()Lcom/helpshift/common/platform/network/ResponseParser;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/common/domain/network/GuardAgainstCSATExpiryNetwork;->responseParser:Lcom/helpshift/common/platform/network/ResponseParser;

    return-void
.end method


# virtual methods
.method public makeRequest(Lcom/helpshift/common/platform/network/RequestData;)Lcom/helpshift/common/platform/network/Response;
    .locals 2

    .line 29
    iget-object v0, p0, Lcom/helpshift/common/domain/network/GuardAgainstCSATExpiryNetwork;->network:Lcom/helpshift/common/domain/network/Network;

    invoke-interface {v0, p1}, Lcom/helpshift/common/domain/network/Network;->makeRequest(Lcom/helpshift/common/platform/network/RequestData;)Lcom/helpshift/common/platform/network/Response;

    move-result-object p1

    .line 30
    iget v0, p1, Lcom/helpshift/common/platform/network/Response;->status:I

    const/16 v1, 0x19a

    if-ne v0, v1, :cond_1

    .line 35
    iget-object v0, p0, Lcom/helpshift/common/domain/network/GuardAgainstCSATExpiryNetwork;->responseParser:Lcom/helpshift/common/platform/network/ResponseParser;

    iget-object v1, p1, Lcom/helpshift/common/platform/network/Response;->responseString:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/helpshift/common/platform/network/ResponseParser;->parseErrorMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "csat timer expired"

    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 37
    sget-object v0, Lcom/helpshift/common/exception/NetworkException;->CSAT_EXPIRED:Lcom/helpshift/common/exception/NetworkException;

    invoke-static {p1, v0}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1

    :cond_1
    :goto_0
    return-object p1
.end method
