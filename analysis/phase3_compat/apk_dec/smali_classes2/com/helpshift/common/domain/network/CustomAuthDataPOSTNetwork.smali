.class public Lcom/helpshift/common/domain/network/CustomAuthDataPOSTNetwork;
.super Lcom/helpshift/common/domain/network/POSTNetwork;
.source "CustomAuthDataPOSTNetwork.java"


# instance fields
.field private customAuthData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/helpshift/common/domain/Domain;",
            "Lcom/helpshift/common/platform/Platform;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 27
    invoke-direct {p0, p1, p2, p3}, Lcom/helpshift/common/domain/network/POSTNetwork;-><init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 28
    iput-object p4, p0, Lcom/helpshift/common/domain/network/CustomAuthDataPOSTNetwork;->customAuthData:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method protected getQuery(Ljava/util/Map;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "UTF-8"

    .line 39
    iget-object v1, p0, Lcom/helpshift/common/domain/network/CustomAuthDataPOSTNetwork;->customAuthData:Ljava/util/Map;

    invoke-interface {p1, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 40
    invoke-static {p1}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->cleanData(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 42
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 43
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 45
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 46
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 49
    sget-object v0, Lcom/helpshift/common/exception/NetworkException;->UNSUPPORTED_ENCODING_EXCEPTION:Lcom/helpshift/common/exception/NetworkException;

    invoke-static {p1, v0}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1

    :cond_0
    const-string p1, "&"

    .line 53
    invoke-static {p1, v1}, Lcom/helpshift/util/StringUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method getRequest(Lcom/helpshift/common/platform/network/RequestData;)Lcom/helpshift/common/platform/network/Request;
    .locals 4

    .line 33
    new-instance v0, Lcom/helpshift/common/platform/network/POSTRequest;

    invoke-virtual {p0}, Lcom/helpshift/common/domain/network/CustomAuthDataPOSTNetwork;->getURL()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lcom/helpshift/common/platform/network/RequestData;->body:Ljava/util/Map;

    invoke-static {v2}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->cleanData(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/helpshift/common/domain/network/CustomAuthDataPOSTNetwork;->getQuery(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    .line 34
    invoke-virtual {p1}, Lcom/helpshift/common/platform/network/RequestData;->getRequestId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, p1}, Lcom/helpshift/common/domain/network/CustomAuthDataPOSTNetwork;->getHeaders(Ljava/lang/String;Lcom/helpshift/common/platform/network/RequestData;)Ljava/util/List;

    move-result-object p1

    const/16 v3, 0x1388

    invoke-direct {v0, v1, v2, p1, v3}, Lcom/helpshift/common/platform/network/POSTRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;I)V

    return-object v0
.end method
