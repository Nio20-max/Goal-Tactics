.class public Lcom/helpshift/network/BasicNetwork;
.super Ljava/lang/Object;
.source "BasicNetwork.java"

# interfaces
.implements Lcom/helpshift/network/Network;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_BasicNetwork"


# instance fields
.field protected final httpStack:Lcom/helpshift/network/HttpStack;


# direct methods
.method public constructor <init>(Lcom/helpshift/network/HttpStack;)V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lcom/helpshift/network/BasicNetwork;->httpStack:Lcom/helpshift/network/HttpStack;

    return-void
.end method

.method protected static convertHeaders([Lcom/helpshift/network/Header;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/helpshift/network/Header;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 58
    new-instance v0, Ljava/util/TreeMap;

    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 59
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p0, v2

    .line 60
    iget-object v4, v3, Lcom/helpshift/network/Header;->name:Ljava/lang/String;

    iget-object v3, v3, Lcom/helpshift/network/Header;->value:Ljava/lang/String;

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method


# virtual methods
.method protected entityToBytes(Lcom/helpshift/network/HttpEntity;)[B
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/helpshift/network/errors/NetworkError;
        }
    .end annotation

    const-string v0, "Error occurred when calling consumingContent"

    const-string v1, "Helpshift_BasicNetwork"

    .line 155
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 158
    :try_start_0
    iget-object v3, p1, Lcom/helpshift/network/HttpEntity;->content:Ljava/io/InputStream;

    if-eqz v3, :cond_1

    const/16 v4, 0x2000

    new-array v4, v4, [B

    .line 164
    :goto_0
    invoke-virtual {v3, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_0

    const/4 v6, 0x0

    .line 165
    invoke-virtual {v2, v4, v6, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 167
    :cond_0
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    :try_start_1
    invoke-virtual {p1}, Lcom/helpshift/network/HttpEntity;->consumeContent()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 177
    invoke-static {v1, v0, p1}, Lcom/helpshift/util/HSLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 179
    :goto_1
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    return-object v3

    .line 160
    :cond_1
    :try_start_2
    new-instance v3, Lcom/helpshift/network/errors/NetworkError;

    sget-object v4, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->SERVER_ERROR:Ljava/lang/Integer;

    invoke-direct {v3, v4}, Lcom/helpshift/network/errors/NetworkError;-><init>(Ljava/lang/Integer;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception v3

    .line 172
    :try_start_3
    invoke-virtual {p1}, Lcom/helpshift/network/HttpEntity;->consumeContent()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2

    :catch_1
    move-exception p1

    .line 177
    invoke-static {v1, v0, p1}, Lcom/helpshift/util/HSLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 179
    :goto_2
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 180
    throw v3
.end method

.method public performRequest(Lcom/helpshift/network/request/Request;)Lcom/helpshift/network/response/NetworkResponse;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/helpshift/network/errors/NetworkError;
        }
    .end annotation

    const-string v0, "ETag"

    :cond_0
    :goto_0
    const/4 v1, 0x0

    .line 72
    :try_start_0
    iget-object v2, p0, Lcom/helpshift/network/BasicNetwork;->httpStack:Lcom/helpshift/network/HttpStack;

    invoke-interface {v2, p1}, Lcom/helpshift/network/HttpStack;->performRequest(Lcom/helpshift/network/request/Request;)Lcom/helpshift/network/HttpResponse;

    move-result-object v1

    .line 73
    invoke-virtual {v1}, Lcom/helpshift/network/HttpResponse;->getStatusLine()Lcom/helpshift/network/StatusLine;

    move-result-object v2

    .line 74
    invoke-virtual {v2}, Lcom/helpshift/network/StatusLine;->getStatusCode()I

    move-result v4

    .line 76
    invoke-virtual {v1}, Lcom/helpshift/network/HttpResponse;->getAllHeaders()[Lcom/helpshift/network/Header;

    move-result-object v2

    invoke-static {v2}, Lcom/helpshift/network/BasicNetwork;->convertHeaders([Lcom/helpshift/network/Header;)Ljava/util/Map;

    move-result-object v8

    if-eqz v8, :cond_1

    .line 78
    invoke-interface {v8, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 79
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iget-object v5, p1, Lcom/helpshift/network/request/Request;->url:Ljava/lang/String;

    invoke-virtual {v2, v3, v5}, Lcom/helpshift/model/SdkInfoModel;->addEtag(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const/16 v2, 0x130

    if-ne v4, v2, :cond_3

    .line 83
    new-instance v0, Lcom/helpshift/network/response/NetworkResponse;

    const/16 v6, 0x130

    const/4 v7, 0x0

    const/4 v9, 0x1

    .line 84
    invoke-virtual {p1}, Lcom/helpshift/network/request/Request;->getSequence()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    move-object v5, v0

    invoke-direct/range {v5 .. v10}, Lcom/helpshift/network/response/NetworkResponse;-><init>(I[BLjava/util/Map;ZLjava/lang/Integer;)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lcom/helpshift/exceptions/InstallException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_2

    .line 147
    invoke-virtual {v1}, Lcom/helpshift/network/HttpResponse;->getHelpshiftSSLSocketFactory()Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 148
    invoke-virtual {v1}, Lcom/helpshift/network/HttpResponse;->getHelpshiftSSLSocketFactory()Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;->closeSockets()V

    :cond_2
    return-object v0

    .line 87
    :cond_3
    :try_start_1
    invoke-virtual {v1}, Lcom/helpshift/network/HttpResponse;->getEntity()Lcom/helpshift/network/HttpEntity;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 88
    invoke-virtual {v1}, Lcom/helpshift/network/HttpResponse;->getEntity()Lcom/helpshift/network/HttpEntity;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/helpshift/network/BasicNetwork;->entityToBytes(Lcom/helpshift/network/HttpEntity;)[B

    move-result-object v2

    :goto_1
    move-object v5, v2

    goto :goto_2

    .line 90
    :cond_4
    iget v2, p1, Lcom/helpshift/network/request/Request;->method:I

    if-nez v2, :cond_f

    const/4 v2, 0x0

    new-array v2, v2, [B

    goto :goto_1

    :goto_2
    const/16 v2, 0xc8

    if-lt v4, v2, :cond_6

    const/16 v2, 0x12c

    if-gt v4, v2, :cond_6

    .line 97
    new-instance v0, Lcom/helpshift/network/response/NetworkResponse;

    const/4 v7, 0x0

    invoke-virtual {p1}, Lcom/helpshift/network/request/Request;->getSequence()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object v3, v0

    move-object v6, v8

    move-object v8, v2

    invoke-direct/range {v3 .. v8}, Lcom/helpshift/network/response/NetworkResponse;-><init>(I[BLjava/util/Map;ZLjava/lang/Integer;)V
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Lcom/helpshift/exceptions/InstallException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_5

    .line 147
    invoke-virtual {v1}, Lcom/helpshift/network/HttpResponse;->getHelpshiftSSLSocketFactory()Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 148
    invoke-virtual {v1}, Lcom/helpshift/network/HttpResponse;->getHelpshiftSSLSocketFactory()Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;->closeSockets()V

    :cond_5
    return-object v0

    :cond_6
    const/16 v2, 0x1a6

    if-ne v4, v2, :cond_9

    if-eqz v8, :cond_8

    .line 101
    :try_start_2
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    .line 102
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 103
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    const-string v4, "HS-UEpoch"

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    goto :goto_3

    .line 104
    :cond_7
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    .line 105
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/common/util/HSDateFormatSpec;->calculateTimeDelta(Ljava/lang/String;)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/helpshift/model/SdkInfoModel;->setServerTimeDelta(Ljava/lang/Float;)V

    .line 110
    :cond_8
    new-instance v0, Lcom/helpshift/network/errors/NetworkError;

    sget-object v2, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->TIMESTAMP_MISMATCH:Ljava/lang/Integer;

    invoke-direct {v0, v2}, Lcom/helpshift/network/errors/NetworkError;-><init>(Ljava/lang/Integer;)V

    throw v0

    :cond_9
    const/16 v2, 0x19d

    if-eq v4, v2, :cond_e

    const/16 v2, 0x193

    if-eq v4, v2, :cond_d

    const/16 v2, 0x191

    if-eq v4, v2, :cond_d

    const/16 v2, 0x190

    const/16 v3, 0x1f4

    if-lt v4, v2, :cond_b

    if-lt v4, v3, :cond_a

    goto :goto_4

    .line 119
    :cond_a
    new-instance v0, Lcom/helpshift/network/errors/NetworkError;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/helpshift/network/errors/NetworkError;-><init>(Ljava/lang/Integer;)V

    throw v0
    :try_end_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Lcom/helpshift/exceptions/InstallException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_b
    :goto_4
    if-ge v4, v3, :cond_c

    if-eqz v1, :cond_0

    .line 147
    invoke-virtual {v1}, Lcom/helpshift/network/HttpResponse;->getHelpshiftSSLSocketFactory()Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 148
    invoke-virtual {v1}, Lcom/helpshift/network/HttpResponse;->getHelpshiftSSLSocketFactory()Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;->closeSockets()V

    goto/16 :goto_0

    .line 122
    :cond_c
    :try_start_3
    new-instance v0, Lcom/helpshift/network/errors/NetworkError;

    sget-object v2, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->SERVER_ERROR:Ljava/lang/Integer;

    invoke-direct {v0, v2}, Lcom/helpshift/network/errors/NetworkError;-><init>(Ljava/lang/Integer;)V

    throw v0

    .line 116
    :cond_d
    new-instance v0, Lcom/helpshift/network/errors/NetworkError;

    sget-object v2, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->UNAUTHORIZED_ACCESS:Ljava/lang/Integer;

    invoke-direct {v0, v2}, Lcom/helpshift/network/errors/NetworkError;-><init>(Ljava/lang/Integer;)V

    throw v0

    .line 113
    :cond_e
    new-instance v0, Lcom/helpshift/network/errors/NetworkError;

    sget-object v2, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->ENTITY_TOO_LARGE:Ljava/lang/Integer;

    invoke-direct {v0, v2}, Lcom/helpshift/network/errors/NetworkError;-><init>(Ljava/lang/Integer;)V

    throw v0

    .line 94
    :cond_f
    new-instance v0, Lcom/helpshift/network/errors/NetworkError;

    sget-object v2, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->CONTENT_NOT_FOUND:Ljava/lang/Integer;

    invoke-direct {v0, v2}, Lcom/helpshift/network/errors/NetworkError;-><init>(Ljava/lang/Integer;)V

    throw v0
    :try_end_3
    .catch Ljava/net/SocketTimeoutException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Lcom/helpshift/exceptions/InstallException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception p1

    goto :goto_5

    :catch_0
    move-exception p1

    if-nez v1, :cond_10

    .line 140
    :try_start_4
    new-instance v0, Lcom/helpshift/network/errors/NetworkError;

    sget-object v2, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->NO_CONNECTION:Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v2, p1}, Lcom/helpshift/network/errors/NetworkError;-><init>(Ljava/lang/Integer;Ljava/lang/String;)V

    throw v0

    .line 143
    :cond_10
    new-instance v0, Lcom/helpshift/network/errors/NetworkError;

    invoke-direct {v0, p1}, Lcom/helpshift/network/errors/NetworkError;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 136
    :catch_1
    new-instance p1, Lcom/helpshift/network/errors/NetworkError;

    sget-object v0, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->NO_CONNECTION:Ljava/lang/Integer;

    invoke-direct {p1, v0}, Lcom/helpshift/network/errors/NetworkError;-><init>(Ljava/lang/Integer;)V

    throw p1

    :catch_2
    move-exception p1

    .line 133
    new-instance v0, Lcom/helpshift/network/errors/NetworkError;

    invoke-direct {v0, p1}, Lcom/helpshift/network/errors/NetworkError;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :catch_3
    move-exception v0

    .line 130
    new-instance v2, Lcom/helpshift/network/errors/NetworkError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bad URL "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/helpshift/network/request/Request;->url:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1, v0}, Lcom/helpshift/network/errors/NetworkError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 127
    :catch_4
    new-instance p1, Lcom/helpshift/network/errors/NetworkError;

    sget-object v0, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->REQUEST_TIMEOUT:Ljava/lang/Integer;

    invoke-direct {p1, v0}, Lcom/helpshift/network/errors/NetworkError;-><init>(Ljava/lang/Integer;)V

    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :goto_5
    if-eqz v1, :cond_11

    .line 147
    invoke-virtual {v1}, Lcom/helpshift/network/HttpResponse;->getHelpshiftSSLSocketFactory()Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 148
    invoke-virtual {v1}, Lcom/helpshift/network/HttpResponse;->getHelpshiftSSLSocketFactory()Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;->closeSockets()V

    .line 150
    :cond_11
    throw p1
.end method
