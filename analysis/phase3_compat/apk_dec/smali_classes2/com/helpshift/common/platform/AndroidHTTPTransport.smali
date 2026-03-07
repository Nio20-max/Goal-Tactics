.class public Lcom/helpshift/common/platform/AndroidHTTPTransport;
.super Ljava/lang/Object;
.source "AndroidHTTPTransport.java"

# interfaces
.implements Lcom/helpshift/common/platform/network/HTTPTransport;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_HTTPTrnsport"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private closeHelpshiftSSLSocketFactorySockets(Ljavax/net/ssl/HttpsURLConnection;)V
    .locals 2

    .line 211
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-gt v0, v1, :cond_0

    if-eqz p1, :cond_0

    .line 214
    invoke-virtual {p1}, Ljavax/net/ssl/HttpsURLConnection;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object p1

    .line 215
    instance-of v0, p1, Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;

    if-eqz v0, :cond_0

    .line 216
    check-cast p1, Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;

    .line 218
    invoke-virtual {p1}, Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;->closeSockets()V

    :cond_0
    return-void
.end method

.method private fixSSLSocketProtocols(Ljavax/net/ssl/HttpsURLConnection;)V
    .locals 4

    .line 191
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-gt v0, v1, :cond_0

    .line 195
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "TLSv1.2"

    .line 196
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 199
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const-string v2, "SSLv3"

    .line 200
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 202
    invoke-virtual {p1}, Ljavax/net/ssl/HttpsURLConnection;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v2

    .line 203
    new-instance v3, Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;

    invoke-direct {v3, v2, v0, v1}, Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;Ljava/util/List;Ljava/util/List;)V

    .line 204
    invoke-virtual {p1, v3}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    :cond_0
    return-void
.end method

.method private isInvalidKeyForHeader(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "filePath"

    .line 224
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "originalFileName"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private makeNetworkRequest(Lcom/helpshift/common/platform/network/Request;)Lcom/helpshift/common/platform/network/Response;
    .locals 17

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v3, "Error in finally closing resources"

    const-string v4, "Helpshift_HTTPTrnsport"

    const-string v5, "Network error"

    :try_start_0
    const-string v7, "https://"

    .line 66
    sget-object v8, Lcom/helpshift/common/domain/network/NetworkConstants;->scheme:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_31
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_30
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_2f
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_0 .. :try_end_0} :catch_2e
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_0 .. :try_end_0} :catch_2d
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2c
    .catchall {:try_start_0 .. :try_end_0} :catchall_7

    if-eqz v7, :cond_0

    .line 67
    :try_start_1
    new-instance v7, Ljava/net/URL;

    iget-object v8, v2, Lcom/helpshift/common/platform/network/Request;->url:Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v7

    check-cast v7, Ljavax/net/ssl/HttpsURLConnection;
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_b
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_a
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_9
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_1 .. :try_end_1} :catch_8
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 68
    :try_start_2
    move-object v8, v7

    check-cast v8, Ljavax/net/ssl/HttpsURLConnection;

    invoke-direct {v1, v8}, Lcom/helpshift/common/platform/AndroidHTTPTransport;->fixSSLSocketProtocols(Ljavax/net/ssl/HttpsURLConnection;)V
    :try_end_2
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/net/SocketException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_d

    :catchall_0
    move-exception v0

    move-object v2, v0

    const/4 v6, 0x0

    goto :goto_b

    :catch_0
    move-exception v0

    move-object v6, v7

    const/4 v9, 0x0

    :goto_0
    const/4 v11, 0x0

    :goto_1
    move-object v7, v0

    goto/16 :goto_1f

    :catch_1
    move-exception v0

    move-object v6, v7

    const/4 v9, 0x0

    :goto_2
    const/4 v11, 0x0

    :goto_3
    move-object v7, v0

    goto/16 :goto_20

    :catch_2
    move-exception v0

    move-object v6, v7

    const/4 v9, 0x0

    :goto_4
    const/4 v11, 0x0

    :goto_5
    move-object v7, v0

    goto/16 :goto_21

    :catch_3
    move-exception v0

    goto :goto_6

    :catch_4
    move-exception v0

    :goto_6
    move-object v6, v7

    const/4 v9, 0x0

    :goto_7
    const/4 v11, 0x0

    :goto_8
    move-object v7, v0

    goto/16 :goto_23

    :catch_5
    move-exception v0

    move-object v6, v7

    const/4 v9, 0x0

    :goto_9
    const/4 v11, 0x0

    :goto_a
    move-object v7, v0

    goto/16 :goto_24

    :catchall_1
    move-exception v0

    move-object v2, v0

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_b
    const/4 v9, 0x0

    goto/16 :goto_26

    :catch_6
    move-exception v0

    move-object v7, v0

    const/4 v6, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    goto/16 :goto_1f

    :catch_7
    move-exception v0

    move-object v7, v0

    const/4 v6, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    goto/16 :goto_20

    :catch_8
    move-exception v0

    move-object v7, v0

    const/4 v6, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    goto/16 :goto_21

    :catch_9
    move-exception v0

    goto :goto_c

    :catch_a
    move-exception v0

    :goto_c
    move-object v7, v0

    const/4 v6, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    goto/16 :goto_23

    :catch_b
    move-exception v0

    move-object v7, v0

    const/4 v6, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    goto/16 :goto_24

    .line 71
    :cond_0
    :try_start_3
    new-instance v7, Ljava/net/URL;

    iget-object v8, v2, Lcom/helpshift/common/platform/network/Request;->url:Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v7

    check-cast v7, Ljava/net/HttpURLConnection;
    :try_end_3
    .catch Ljava/net/UnknownHostException; {:try_start_3 .. :try_end_3} :catch_31
    .catch Ljava/net/SocketException; {:try_start_3 .. :try_end_3} :catch_30
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_2f
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_3 .. :try_end_3} :catch_2e
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_3 .. :try_end_3} :catch_2d
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2c
    .catchall {:try_start_3 .. :try_end_3} :catchall_7

    .line 74
    :goto_d
    :try_start_4
    iget-object v8, v2, Lcom/helpshift/common/platform/network/Request;->method:Lcom/helpshift/common/platform/network/Method;

    invoke-virtual {v8}, Lcom/helpshift/common/platform/network/Method;->name()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 75
    iget v8, v2, Lcom/helpshift/common/platform/network/Request;->timeout:I

    invoke-virtual {v7, v8}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 76
    iget-object v8, v2, Lcom/helpshift/common/platform/network/Request;->headers:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_e
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9
    :try_end_4
    .catch Ljava/net/UnknownHostException; {:try_start_4 .. :try_end_4} :catch_2b
    .catch Ljava/net/SocketException; {:try_start_4 .. :try_end_4} :catch_2a
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_4} :catch_29
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_4 .. :try_end_4} :catch_28
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_4 .. :try_end_4} :catch_27
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_26
    .catchall {:try_start_4 .. :try_end_4} :catchall_6

    if-eqz v9, :cond_1

    :try_start_5
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/helpshift/common/platform/network/KeyValuePair;

    .line 77
    iget-object v10, v9, Lcom/helpshift/common/platform/network/KeyValuePair;->key:Ljava/lang/String;

    iget-object v9, v9, Lcom/helpshift/common/platform/network/KeyValuePair;->value:Ljava/lang/String;

    invoke-virtual {v7, v10, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/net/UnknownHostException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/net/SocketException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_e

    .line 80
    :cond_1
    :try_start_6
    iget-object v8, v2, Lcom/helpshift/common/platform/network/Request;->method:Lcom/helpshift/common/platform/network/Method;

    sget-object v9, Lcom/helpshift/common/platform/network/Method;->POST:Lcom/helpshift/common/platform/network/Method;
    :try_end_6
    .catch Ljava/net/UnknownHostException; {:try_start_6 .. :try_end_6} :catch_2b
    .catch Ljava/net/SocketException; {:try_start_6 .. :try_end_6} :catch_2a
    .catch Ljava/lang/SecurityException; {:try_start_6 .. :try_end_6} :catch_29
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_6 .. :try_end_6} :catch_28
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_6 .. :try_end_6} :catch_27
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_26
    .catchall {:try_start_6 .. :try_end_6} :catchall_6

    if-eq v8, v9, :cond_3

    :try_start_7
    iget-object v8, v2, Lcom/helpshift/common/platform/network/Request;->method:Lcom/helpshift/common/platform/network/Method;

    sget-object v9, Lcom/helpshift/common/platform/network/Method;->PUT:Lcom/helpshift/common/platform/network/Method;
    :try_end_7
    .catch Ljava/net/UnknownHostException; {:try_start_7 .. :try_end_7} :catch_5
    .catch Ljava/net/SocketException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/lang/SecurityException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    if-ne v8, v9, :cond_2

    goto :goto_f

    :cond_2
    const/4 v9, 0x0

    goto :goto_11

    .line 83
    :cond_3
    :goto_f
    :try_start_8
    iget-object v8, v2, Lcom/helpshift/common/platform/network/Request;->method:Lcom/helpshift/common/platform/network/Method;

    sget-object v9, Lcom/helpshift/common/platform/network/Method;->PUT:Lcom/helpshift/common/platform/network/Method;
    :try_end_8
    .catch Ljava/net/UnknownHostException; {:try_start_8 .. :try_end_8} :catch_2b
    .catch Ljava/net/SocketException; {:try_start_8 .. :try_end_8} :catch_2a
    .catch Ljava/lang/SecurityException; {:try_start_8 .. :try_end_8} :catch_29
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_8 .. :try_end_8} :catch_28
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_8 .. :try_end_8} :catch_27
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_26
    .catchall {:try_start_8 .. :try_end_8} :catchall_6

    if-ne v8, v9, :cond_4

    .line 84
    :try_start_9
    move-object v8, v2

    check-cast v8, Lcom/helpshift/common/platform/network/PUTRequest;

    iget-object v8, v8, Lcom/helpshift/common/platform/network/PUTRequest;->query:Ljava/lang/String;
    :try_end_9
    .catch Ljava/net/UnknownHostException; {:try_start_9 .. :try_end_9} :catch_5
    .catch Ljava/net/SocketException; {:try_start_9 .. :try_end_9} :catch_4
    .catch Ljava/lang/SecurityException; {:try_start_9 .. :try_end_9} :catch_3
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_9 .. :try_end_9} :catch_2
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_9 .. :try_end_9} :catch_1
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_10

    .line 87
    :cond_4
    :try_start_a
    move-object v8, v2

    check-cast v8, Lcom/helpshift/common/platform/network/POSTRequest;

    iget-object v8, v8, Lcom/helpshift/common/platform/network/POSTRequest;->query:Ljava/lang/String;

    :goto_10
    const/4 v9, 0x1

    .line 90
    invoke-virtual {v7, v9}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 91
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v9
    :try_end_a
    .catch Ljava/net/UnknownHostException; {:try_start_a .. :try_end_a} :catch_2b
    .catch Ljava/net/SocketException; {:try_start_a .. :try_end_a} :catch_2a
    .catch Ljava/lang/SecurityException; {:try_start_a .. :try_end_a} :catch_29
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_a .. :try_end_a} :catch_28
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_a .. :try_end_a} :catch_27
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_26
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 92
    :try_start_b
    new-instance v10, Ljava/io/BufferedWriter;

    new-instance v11, Ljava/io/OutputStreamWriter;

    const-string v12, "UTF-8"

    invoke-direct {v11, v9, v12}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v10, v11}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 93
    invoke-virtual {v10, v8}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 94
    invoke-virtual {v10}, Ljava/io/BufferedWriter;->flush()V

    .line 95
    invoke-virtual {v10}, Ljava/io/BufferedWriter;->close()V

    .line 96
    invoke-virtual {v9}, Ljava/io/OutputStream;->flush()V

    .line 99
    :goto_11
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v8

    .line 100
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 101
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v11

    .line 102
    invoke-interface {v11}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_5
    :goto_12
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13
    :try_end_b
    .catch Ljava/net/UnknownHostException; {:try_start_b .. :try_end_b} :catch_25
    .catch Ljava/net/SocketException; {:try_start_b .. :try_end_b} :catch_24
    .catch Ljava/lang/SecurityException; {:try_start_b .. :try_end_b} :catch_23
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_b .. :try_end_b} :catch_22
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_b .. :try_end_b} :catch_21
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_20
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    const/4 v14, 0x0

    if-eqz v13, :cond_6

    :try_start_c
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 103
    invoke-static {v13}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_5

    .line 104
    new-instance v15, Lcom/helpshift/common/platform/network/KeyValuePair;

    invoke-interface {v11, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v6, v16

    check-cast v6, Ljava/util/List;

    invoke-interface {v6, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-direct {v15, v13, v6}, Lcom/helpshift/common/platform/network/KeyValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v10, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_c
    .catch Ljava/net/UnknownHostException; {:try_start_c .. :try_end_c} :catch_11
    .catch Ljava/net/SocketException; {:try_start_c .. :try_end_c} :catch_10
    .catch Ljava/lang/SecurityException; {:try_start_c .. :try_end_c} :catch_f
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_c .. :try_end_c} :catch_e
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_c .. :try_end_c} :catch_d
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    goto :goto_12

    :catchall_2
    move-exception v0

    move-object v2, v0

    const/4 v6, 0x0

    goto/16 :goto_26

    :catch_c
    move-exception v0

    move-object v6, v7

    goto/16 :goto_0

    :catch_d
    move-exception v0

    move-object v6, v7

    goto/16 :goto_2

    :catch_e
    move-exception v0

    move-object v6, v7

    goto/16 :goto_4

    :catch_f
    move-exception v0

    goto :goto_13

    :catch_10
    move-exception v0

    :goto_13
    move-object v6, v7

    goto/16 :goto_7

    :catch_11
    move-exception v0

    move-object v6, v7

    goto/16 :goto_9

    :cond_6
    const/16 v6, 0xc8

    if-lt v8, v6, :cond_a

    const/16 v6, 0x12c

    if-ge v8, v6, :cond_a

    .line 109
    :try_start_d
    new-instance v6, Ljava/io/BufferedInputStream;

    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v12

    invoke-direct {v6, v12}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    const-string v12, "Content-Encoding"

    .line 111
    invoke-interface {v11, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;
    :try_end_d
    .catch Ljava/net/UnknownHostException; {:try_start_d .. :try_end_d} :catch_25
    .catch Ljava/net/SocketException; {:try_start_d .. :try_end_d} :catch_24
    .catch Ljava/lang/SecurityException; {:try_start_d .. :try_end_d} :catch_23
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_d .. :try_end_d} :catch_22
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_d .. :try_end_d} :catch_21
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_20
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    if-eqz v11, :cond_7

    .line 112
    :try_start_e
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v12

    if-lez v12, :cond_7

    .line 113
    invoke-interface {v11, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    const-string v12, "gzip"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 114
    new-instance v11, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v11, v6}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_e
    .catch Ljava/net/UnknownHostException; {:try_start_e .. :try_end_e} :catch_11
    .catch Ljava/net/SocketException; {:try_start_e .. :try_end_e} :catch_10
    .catch Ljava/lang/SecurityException; {:try_start_e .. :try_end_e} :catch_f
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_e .. :try_end_e} :catch_e
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_e .. :try_end_e} :catch_d
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_c
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    move-object v6, v11

    .line 116
    :cond_7
    :try_start_f
    invoke-direct {v1, v6}, Lcom/helpshift/common/platform/AndroidHTTPTransport;->readInputStream(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v11

    .line 117
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 118
    new-instance v6, Lcom/helpshift/common/platform/network/Response;

    invoke-direct {v6, v8, v11, v10}, Lcom/helpshift/common/platform/network/Response;-><init>(ILjava/lang/String;Ljava/util/List;)V
    :try_end_f
    .catch Ljava/net/UnknownHostException; {:try_start_f .. :try_end_f} :catch_25
    .catch Ljava/net/SocketException; {:try_start_f .. :try_end_f} :catch_24
    .catch Ljava/lang/SecurityException; {:try_start_f .. :try_end_f} :catch_23
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_f .. :try_end_f} :catch_22
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_f .. :try_end_f} :catch_21
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_20
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    const/4 v11, 0x0

    .line 156
    invoke-static {v11}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 157
    invoke-static {v9}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 160
    :try_start_10
    instance-of v2, v7, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v2, :cond_8

    .line 161
    move-object v2, v7

    check-cast v2, Ljavax/net/ssl/HttpsURLConnection;

    invoke-direct {v1, v2}, Lcom/helpshift/common/platform/AndroidHTTPTransport;->closeHelpshiftSSLSocketFactorySockets(Ljavax/net/ssl/HttpsURLConnection;)V

    :cond_8
    if-eqz v7, :cond_9

    .line 164
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_12

    goto :goto_14

    :catch_12
    move-exception v0

    move-object v2, v0

    .line 168
    invoke-static {v4, v3, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_9
    :goto_14
    return-object v6

    :cond_a
    const/4 v11, 0x0

    .line 121
    :try_start_11
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Api : "

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v12, v2, Lcom/helpshift/common/platform/network/Request;->url:Ljava/lang/String;

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, " \t Status : "

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, "\t Thread : "

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 121
    invoke-static {v4, v6}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v6
    :try_end_11
    .catch Ljava/net/UnknownHostException; {:try_start_11 .. :try_end_11} :catch_1f
    .catch Ljava/net/SocketException; {:try_start_11 .. :try_end_11} :catch_1e
    .catch Ljava/lang/SecurityException; {:try_start_11 .. :try_end_11} :catch_1d
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_11 .. :try_end_11} :catch_1c
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_11 .. :try_end_11} :catch_1b
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_1a
    .catchall {:try_start_11 .. :try_end_11} :catchall_4

    .line 125
    :try_start_12
    invoke-direct {v1, v6}, Lcom/helpshift/common/platform/AndroidHTTPTransport;->readInputStream(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v11

    .line 127
    new-instance v12, Lcom/helpshift/common/platform/network/Response;

    invoke-direct {v12, v8, v11, v10}, Lcom/helpshift/common/platform/network/Response;-><init>(ILjava/lang/String;Ljava/util/List;)V
    :try_end_12
    .catch Ljava/net/UnknownHostException; {:try_start_12 .. :try_end_12} :catch_19
    .catch Ljava/net/SocketException; {:try_start_12 .. :try_end_12} :catch_18
    .catch Ljava/lang/SecurityException; {:try_start_12 .. :try_end_12} :catch_17
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_12 .. :try_end_12} :catch_16
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_12 .. :try_end_12} :catch_15
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_14
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    .line 156
    invoke-static {v6}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 157
    invoke-static {v9}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 160
    :try_start_13
    instance-of v2, v7, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v2, :cond_b

    .line 161
    move-object v2, v7

    check-cast v2, Ljavax/net/ssl/HttpsURLConnection;

    invoke-direct {v1, v2}, Lcom/helpshift/common/platform/AndroidHTTPTransport;->closeHelpshiftSSLSocketFactorySockets(Ljavax/net/ssl/HttpsURLConnection;)V

    :cond_b
    if-eqz v7, :cond_c

    .line 164
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_13

    goto :goto_15

    :catch_13
    move-exception v0

    move-object v2, v0

    .line 168
    invoke-static {v4, v3, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_c
    :goto_15
    return-object v12

    :catchall_3
    move-exception v0

    move-object v2, v0

    goto/16 :goto_26

    :catch_14
    move-exception v0

    move-object v11, v6

    goto :goto_18

    :catch_15
    move-exception v0

    move-object v11, v6

    goto :goto_19

    :catch_16
    move-exception v0

    move-object v11, v6

    goto :goto_1a

    :catch_17
    move-exception v0

    goto :goto_16

    :catch_18
    move-exception v0

    :goto_16
    move-object v11, v6

    goto :goto_1c

    :catch_19
    move-exception v0

    move-object v11, v6

    goto :goto_1d

    :catchall_4
    move-exception v0

    goto :goto_17

    :catch_1a
    move-exception v0

    goto :goto_18

    :catch_1b
    move-exception v0

    goto :goto_19

    :catch_1c
    move-exception v0

    goto :goto_1a

    :catch_1d
    move-exception v0

    goto :goto_1c

    :catch_1e
    move-exception v0

    goto :goto_1c

    :catch_1f
    move-exception v0

    goto :goto_1d

    :catchall_5
    move-exception v0

    const/4 v11, 0x0

    :goto_17
    move-object v2, v0

    goto/16 :goto_25

    :catch_20
    move-exception v0

    const/4 v11, 0x0

    :goto_18
    move-object v6, v7

    goto/16 :goto_1

    :catch_21
    move-exception v0

    const/4 v11, 0x0

    :goto_19
    move-object v6, v7

    goto/16 :goto_3

    :catch_22
    move-exception v0

    const/4 v11, 0x0

    :goto_1a
    move-object v6, v7

    goto/16 :goto_5

    :catch_23
    move-exception v0

    goto :goto_1b

    :catch_24
    move-exception v0

    :goto_1b
    const/4 v11, 0x0

    :goto_1c
    move-object v6, v7

    goto/16 :goto_8

    :catch_25
    move-exception v0

    const/4 v11, 0x0

    :goto_1d
    move-object v6, v7

    goto/16 :goto_a

    :catchall_6
    move-exception v0

    const/4 v11, 0x0

    move-object v2, v0

    move-object v6, v11

    move-object v9, v6

    goto/16 :goto_26

    :catch_26
    move-exception v0

    const/4 v11, 0x0

    move-object v6, v7

    move-object v9, v11

    goto/16 :goto_1

    :catch_27
    move-exception v0

    const/4 v11, 0x0

    move-object v6, v7

    move-object v9, v11

    goto/16 :goto_3

    :catch_28
    move-exception v0

    const/4 v11, 0x0

    move-object v6, v7

    move-object v9, v11

    goto/16 :goto_5

    :catch_29
    move-exception v0

    goto :goto_1e

    :catch_2a
    move-exception v0

    :goto_1e
    const/4 v11, 0x0

    move-object v6, v7

    move-object v9, v11

    goto/16 :goto_8

    :catch_2b
    move-exception v0

    const/4 v11, 0x0

    move-object v6, v7

    move-object v9, v11

    goto/16 :goto_a

    :catchall_7
    move-exception v0

    const/4 v11, 0x0

    move-object v2, v0

    move-object v6, v11

    move-object v7, v6

    move-object v9, v7

    goto :goto_26

    :catch_2c
    move-exception v0

    const/4 v11, 0x0

    move-object v7, v0

    move-object v6, v11

    move-object v9, v6

    .line 151
    :goto_1f
    :try_start_14
    sget-object v8, Lcom/helpshift/common/exception/NetworkException;->GENERIC:Lcom/helpshift/common/exception/NetworkException;

    .line 152
    iget-object v2, v2, Lcom/helpshift/common/platform/network/Request;->url:Ljava/lang/String;

    iput-object v2, v8, Lcom/helpshift/common/exception/NetworkException;->route:Ljava/lang/String;

    .line 153
    invoke-static {v7, v8, v5}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v2

    throw v2

    :catch_2d
    move-exception v0

    const/4 v11, 0x0

    move-object v7, v0

    move-object v6, v11

    move-object v9, v6

    .line 146
    :goto_20
    sget-object v8, Lcom/helpshift/common/exception/NetworkException;->SSL_HANDSHAKE:Lcom/helpshift/common/exception/NetworkException;

    .line 147
    iget-object v2, v2, Lcom/helpshift/common/platform/network/Request;->url:Ljava/lang/String;

    iput-object v2, v8, Lcom/helpshift/common/exception/NetworkException;->route:Ljava/lang/String;

    .line 148
    invoke-static {v7, v8, v5}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v2

    throw v2

    :catch_2e
    move-exception v0

    const/4 v11, 0x0

    move-object v7, v0

    move-object v6, v11

    move-object v9, v6

    .line 141
    :goto_21
    sget-object v8, Lcom/helpshift/common/exception/NetworkException;->SSL_PEER_UNVERIFIED:Lcom/helpshift/common/exception/NetworkException;

    .line 142
    iget-object v2, v2, Lcom/helpshift/common/platform/network/Request;->url:Ljava/lang/String;

    iput-object v2, v8, Lcom/helpshift/common/exception/NetworkException;->route:Ljava/lang/String;

    .line 143
    invoke-static {v7, v8, v5}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v2

    throw v2

    :catch_2f
    move-exception v0

    goto :goto_22

    :catch_30
    move-exception v0

    :goto_22
    const/4 v11, 0x0

    move-object v7, v0

    move-object v6, v11

    move-object v9, v6

    .line 136
    :goto_23
    sget-object v8, Lcom/helpshift/common/exception/NetworkException;->NO_CONNECTION:Lcom/helpshift/common/exception/NetworkException;

    .line 137
    iget-object v2, v2, Lcom/helpshift/common/platform/network/Request;->url:Ljava/lang/String;

    iput-object v2, v8, Lcom/helpshift/common/exception/NetworkException;->route:Ljava/lang/String;

    .line 138
    invoke-static {v7, v8, v5}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v2

    throw v2

    :catch_31
    move-exception v0

    const/4 v11, 0x0

    move-object v7, v0

    move-object v6, v11

    move-object v9, v6

    .line 131
    :goto_24
    sget-object v8, Lcom/helpshift/common/exception/NetworkException;->UNKNOWN_HOST:Lcom/helpshift/common/exception/NetworkException;

    .line 132
    iget-object v2, v2, Lcom/helpshift/common/platform/network/Request;->url:Ljava/lang/String;

    iput-object v2, v8, Lcom/helpshift/common/exception/NetworkException;->route:Ljava/lang/String;

    .line 133
    invoke-static {v7, v8, v5}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v2

    throw v2
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_8

    :catchall_8
    move-exception v0

    move-object v2, v0

    move-object v7, v6

    :goto_25
    move-object v6, v11

    .line 156
    :goto_26
    invoke-static {v6}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 157
    invoke-static {v9}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 160
    :try_start_15
    instance-of v5, v7, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v5, :cond_d

    .line 161
    move-object v5, v7

    check-cast v5, Ljavax/net/ssl/HttpsURLConnection;

    invoke-direct {v1, v5}, Lcom/helpshift/common/platform/AndroidHTTPTransport;->closeHelpshiftSSLSocketFactorySockets(Ljavax/net/ssl/HttpsURLConnection;)V

    :cond_d
    if-eqz v7, :cond_e

    .line 164
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_32

    goto :goto_27

    :catch_32
    move-exception v0

    move-object v5, v0

    .line 168
    invoke-static {v4, v3, v5}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 170
    :cond_e
    :goto_27
    throw v2
.end method

.method private readInputStream(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 177
    :cond_0
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 178
    new-instance p1, Ljava/io/BufferedReader;

    invoke-direct {p1, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 179
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 182
    :goto_0
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 183
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 185
    :cond_1
    invoke-virtual {v0}, Ljava/io/InputStreamReader;->close()V

    .line 186
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private upload(Lcom/helpshift/common/platform/network/UploadRequest;)Lcom/helpshift/common/platform/network/Response;
    .locals 20

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v3, "Error in finally closing resources"

    const-string v4, "Helpshift_HTTPTrnsport"

    const-string v5, "Upload error"

    .line 234
    :try_start_0
    new-instance v7, Ljava/net/URL;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_72
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_71
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_70
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_0 .. :try_end_0} :catch_6f
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_0 .. :try_end_0} :catch_6e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6d
    .catchall {:try_start_0 .. :try_end_0} :catchall_f

    :try_start_1
    iget-object v8, v2, Lcom/helpshift/common/platform/network/UploadRequest;->url:Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    const-string v8, "--"

    const-string v9, "*****"

    const-string v10, "\r\n"

    const-string v11, "https://"

    .line 239
    sget-object v12, Lcom/helpshift/common/domain/network/NetworkConstants;->scheme:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_6c
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_6b
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_6a
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_1 .. :try_end_1} :catch_69
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_1 .. :try_end_1} :catch_68
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_6d
    .catchall {:try_start_1 .. :try_end_1} :catchall_f

    if-eqz v11, :cond_0

    .line 240
    :try_start_2
    invoke-virtual {v7}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v7

    check-cast v7, Ljavax/net/ssl/HttpsURLConnection;
    :try_end_2
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_b
    .catch Ljava/net/SocketException; {:try_start_2 .. :try_end_2} :catch_a
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_9
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_2 .. :try_end_2} :catch_8
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_2 .. :try_end_2} :catch_7
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_6
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 241
    :try_start_3
    move-object v11, v7

    check-cast v11, Ljavax/net/ssl/HttpsURLConnection;

    invoke-direct {v1, v11}, Lcom/helpshift/common/platform/AndroidHTTPTransport;->fixSSLSocketProtocols(Ljavax/net/ssl/HttpsURLConnection;)V
    :try_end_3
    .catch Ljava/net/UnknownHostException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/net/SocketException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_f

    :catchall_0
    move-exception v0

    move-object v2, v0

    move-object v6, v3

    goto :goto_1

    :catch_0
    move-exception v0

    move-object v6, v3

    move-object/from16 v17, v5

    goto :goto_4

    :catch_1
    move-exception v0

    move-object v6, v3

    move-object v8, v5

    goto :goto_6

    :catch_2
    move-exception v0

    move-object v6, v3

    move-object v8, v5

    goto :goto_8

    :catch_3
    move-exception v0

    goto :goto_0

    :catch_4
    move-exception v0

    :goto_0
    move-object v6, v3

    move-object v8, v5

    goto :goto_b

    :catch_5
    move-exception v0

    move-object v6, v3

    move-object v8, v5

    goto :goto_d

    :catchall_1
    move-exception v0

    move-object v2, v0

    move-object v6, v3

    const/4 v7, 0x0

    :goto_1
    const/4 v10, 0x0

    const/4 v12, 0x0

    :goto_2
    const/4 v13, 0x0

    :goto_3
    const/16 v16, 0x0

    goto/16 :goto_68

    :catch_6
    move-exception v0

    move-object v6, v3

    move-object/from16 v17, v5

    const/4 v7, 0x0

    :goto_4
    const/4 v10, 0x0

    const/4 v12, 0x0

    :goto_5
    const/4 v13, 0x0

    const/16 v16, 0x0

    move-object v3, v0

    goto/16 :goto_56

    :catch_7
    move-exception v0

    move-object v6, v3

    move-object v8, v5

    const/4 v7, 0x0

    :goto_6
    const/4 v10, 0x0

    const/4 v12, 0x0

    :goto_7
    const/4 v13, 0x0

    const/16 v16, 0x0

    move-object v3, v0

    goto/16 :goto_5a

    :catch_8
    move-exception v0

    move-object v6, v3

    move-object v8, v5

    const/4 v7, 0x0

    :goto_8
    const/4 v10, 0x0

    const/4 v12, 0x0

    :goto_9
    const/4 v13, 0x0

    const/16 v16, 0x0

    move-object v3, v0

    goto/16 :goto_5e

    :catch_9
    move-exception v0

    goto :goto_a

    :catch_a
    move-exception v0

    :goto_a
    move-object v6, v3

    move-object v8, v5

    const/4 v7, 0x0

    :goto_b
    const/4 v10, 0x0

    const/4 v12, 0x0

    :goto_c
    const/4 v13, 0x0

    const/16 v16, 0x0

    move-object v3, v0

    goto/16 :goto_63

    :catch_b
    move-exception v0

    move-object v6, v3

    move-object v8, v5

    const/4 v7, 0x0

    :goto_d
    const/4 v10, 0x0

    const/4 v12, 0x0

    :goto_e
    const/4 v13, 0x0

    const/16 v16, 0x0

    move-object v3, v0

    goto/16 :goto_67

    .line 244
    :cond_0
    :try_start_4
    invoke-virtual {v7}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v7

    check-cast v7, Ljava/net/HttpURLConnection;
    :try_end_4
    .catch Ljava/net/UnknownHostException; {:try_start_4 .. :try_end_4} :catch_6c
    .catch Ljava/net/SocketException; {:try_start_4 .. :try_end_4} :catch_6b
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_4} :catch_6a
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_4 .. :try_end_4} :catch_69
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_4 .. :try_end_4} :catch_68
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_6d
    .catchall {:try_start_4 .. :try_end_4} :catchall_f

    :goto_f
    const/4 v11, 0x1

    .line 246
    :try_start_5
    invoke-virtual {v7, v11}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 247
    invoke-virtual {v7, v11}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    const/4 v11, 0x0

    .line 248
    invoke-virtual {v7, v11}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 249
    iget-object v12, v2, Lcom/helpshift/common/platform/network/UploadRequest;->method:Lcom/helpshift/common/platform/network/Method;

    invoke-virtual {v12}, Lcom/helpshift/common/platform/network/Method;->name()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v7, v12}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 250
    iget v12, v2, Lcom/helpshift/common/platform/network/UploadRequest;->timeout:I

    invoke-virtual {v7, v12}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 251
    iget v12, v2, Lcom/helpshift/common/platform/network/UploadRequest;->timeout:I

    invoke-virtual {v7, v12}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 253
    iget-object v12, v2, Lcom/helpshift/common/platform/network/UploadRequest;->headers:Ljava/util/List;

    .line 254
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_10
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13
    :try_end_5
    .catch Ljava/net/UnknownHostException; {:try_start_5 .. :try_end_5} :catch_67
    .catch Ljava/net/SocketException; {:try_start_5 .. :try_end_5} :catch_66
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_5} :catch_65
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_5 .. :try_end_5} :catch_64
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_5 .. :try_end_5} :catch_63
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_62
    .catchall {:try_start_5 .. :try_end_5} :catchall_e

    if-eqz v13, :cond_1

    :try_start_6
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/helpshift/common/platform/network/KeyValuePair;

    .line 255
    iget-object v14, v13, Lcom/helpshift/common/platform/network/KeyValuePair;->key:Ljava/lang/String;

    iget-object v13, v13, Lcom/helpshift/common/platform/network/KeyValuePair;->value:Ljava/lang/String;

    invoke-virtual {v7, v14, v13}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/net/UnknownHostException; {:try_start_6 .. :try_end_6} :catch_5
    .catch Ljava/net/SocketException; {:try_start_6 .. :try_end_6} :catch_4
    .catch Ljava/lang/SecurityException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_10

    .line 258
    :cond_1
    :try_start_7
    new-instance v12, Ljava/io/DataOutputStream;

    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_7
    .catch Ljava/net/UnknownHostException; {:try_start_7 .. :try_end_7} :catch_67
    .catch Ljava/net/SocketException; {:try_start_7 .. :try_end_7} :catch_66
    .catch Ljava/lang/SecurityException; {:try_start_7 .. :try_end_7} :catch_65
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_7 .. :try_end_7} :catch_64
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_7 .. :try_end_7} :catch_63
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_62
    .catchall {:try_start_7 .. :try_end_7} :catchall_e

    .line 259
    :try_start_8
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 260
    iget-object v13, v2, Lcom/helpshift/common/platform/network/UploadRequest;->data:Ljava/util/Map;

    .line 262
    invoke-interface {v13}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_11
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15
    :try_end_8
    .catch Ljava/net/UnknownHostException; {:try_start_8 .. :try_end_8} :catch_61
    .catch Ljava/net/SocketException; {:try_start_8 .. :try_end_8} :catch_60
    .catch Ljava/lang/SecurityException; {:try_start_8 .. :try_end_8} :catch_5f
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_8 .. :try_end_8} :catch_5e
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_8 .. :try_end_8} :catch_5d
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5c
    .catchall {:try_start_8 .. :try_end_8} :catchall_d

    const-string v6, "Content-Length: "

    const-string v11, "Content-Disposition: form-data; name=\""

    if-eqz v15, :cond_3

    :try_start_9
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/Map$Entry;

    .line 263
    invoke-interface {v15}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v18, v14

    move-object/from16 v14, v17

    check-cast v14, Ljava/lang/String;

    .line 265
    invoke-direct {v1, v14}, Lcom/helpshift/common/platform/AndroidHTTPTransport;->isInvalidKeyForHeader(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_2

    .line 266
    invoke-interface {v15}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;
    :try_end_9
    .catch Ljava/net/UnknownHostException; {:try_start_9 .. :try_end_9} :catch_17
    .catch Ljava/net/SocketException; {:try_start_9 .. :try_end_9} :catch_16
    .catch Ljava/lang/SecurityException; {:try_start_9 .. :try_end_9} :catch_15
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_9 .. :try_end_9} :catch_14
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_9 .. :try_end_9} :catch_13
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_12
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    move-object/from16 v17, v5

    .line 267
    :try_start_a
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "\"; "

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v12, v5}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 269
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Content-Type: text/plain;charset=UTF-8"

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v12, v5}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 270
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v12, v5}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 271
    invoke-virtual {v12, v10}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 272
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v12, v5}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 273
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v12, v5}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/net/UnknownHostException; {:try_start_a .. :try_end_a} :catch_11
    .catch Ljava/net/SocketException; {:try_start_a .. :try_end_a} :catch_10
    .catch Ljava/lang/SecurityException; {:try_start_a .. :try_end_a} :catch_f
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_a .. :try_end_a} :catch_e
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_a .. :try_end_a} :catch_d
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_c
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    goto :goto_13

    :catch_c
    move-exception v0

    goto :goto_15

    :catch_d
    move-exception v0

    move-object v6, v3

    move-object/from16 v8, v17

    goto :goto_16

    :catch_e
    move-exception v0

    move-object v6, v3

    move-object/from16 v8, v17

    goto :goto_17

    :catch_f
    move-exception v0

    goto :goto_12

    :catch_10
    move-exception v0

    :goto_12
    move-object v6, v3

    move-object/from16 v8, v17

    goto :goto_19

    :catch_11
    move-exception v0

    move-object v6, v3

    move-object/from16 v8, v17

    goto :goto_1a

    :cond_2
    move-object/from16 v17, v5

    :goto_13
    move-object/from16 v5, v17

    move-object/from16 v14, v18

    const/4 v11, 0x0

    goto/16 :goto_11

    :catchall_2
    move-exception v0

    move-object v2, v0

    move-object v6, v3

    :goto_14
    const/4 v10, 0x0

    goto/16 :goto_2

    :catch_12
    move-exception v0

    move-object/from16 v17, v5

    :goto_15
    move-object v6, v3

    const/4 v10, 0x0

    goto/16 :goto_5

    :catch_13
    move-exception v0

    move-object v6, v3

    move-object v8, v5

    :goto_16
    const/4 v10, 0x0

    goto/16 :goto_7

    :catch_14
    move-exception v0

    move-object v6, v3

    move-object v8, v5

    :goto_17
    const/4 v10, 0x0

    goto/16 :goto_9

    :catch_15
    move-exception v0

    goto :goto_18

    :catch_16
    move-exception v0

    :goto_18
    move-object v6, v3

    move-object v8, v5

    :goto_19
    const/4 v10, 0x0

    goto/16 :goto_c

    :catch_17
    move-exception v0

    move-object v6, v3

    move-object v8, v5

    :goto_1a
    const/4 v10, 0x0

    goto/16 :goto_e

    :cond_3
    move-object/from16 v17, v5

    .line 276
    :try_start_b
    new-instance v5, Ljava/io/File;

    const-string v14, "filePath"

    invoke-interface {v13, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-direct {v5, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-string v14, "originalFileName"

    .line 277
    invoke-interface {v13, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    const-string v15, "sc"
    :try_end_b
    .catch Ljava/net/UnknownHostException; {:try_start_b .. :try_end_b} :catch_5b
    .catch Ljava/net/SocketException; {:try_start_b .. :try_end_b} :catch_5a
    .catch Ljava/lang/SecurityException; {:try_start_b .. :try_end_b} :catch_59
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_b .. :try_end_b} :catch_58
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_b .. :try_end_b} :catch_57
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_56
    .catchall {:try_start_b .. :try_end_b} :catchall_d

    move-object/from16 v18, v3

    :try_start_c
    const-string v3, "type"

    .line 278
    invoke-interface {v13, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_c
    .catch Ljava/net/UnknownHostException; {:try_start_c .. :try_end_c} :catch_55
    .catch Ljava/net/SocketException; {:try_start_c .. :try_end_c} :catch_54
    .catch Ljava/lang/SecurityException; {:try_start_c .. :try_end_c} :catch_53
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_c .. :try_end_c} :catch_52
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_c .. :try_end_c} :catch_51
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_50
    .catchall {:try_start_c .. :try_end_c} :catchall_c

    if-eqz v3, :cond_4

    :try_start_d
    const-string v3, "screenshot"
    :try_end_d
    .catch Ljava/net/UnknownHostException; {:try_start_d .. :try_end_d} :catch_1d
    .catch Ljava/net/SocketException; {:try_start_d .. :try_end_d} :catch_1c
    .catch Ljava/lang/SecurityException; {:try_start_d .. :try_end_d} :catch_1b
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_d .. :try_end_d} :catch_1a
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_d .. :try_end_d} :catch_19
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_18
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    goto :goto_21

    :catchall_3
    move-exception v0

    move-object v2, v0

    move-object/from16 v6, v18

    goto :goto_14

    :catch_18
    move-exception v0

    move-object v3, v0

    move-object/from16 v6, v18

    const/4 v10, 0x0

    const/4 v13, 0x0

    :goto_1b
    const/16 v16, 0x0

    goto/16 :goto_56

    :catch_19
    move-exception v0

    move-object v3, v0

    move-object/from16 v8, v17

    move-object/from16 v6, v18

    const/4 v10, 0x0

    const/4 v13, 0x0

    :goto_1c
    const/16 v16, 0x0

    goto/16 :goto_5a

    :catch_1a
    move-exception v0

    move-object v3, v0

    move-object/from16 v8, v17

    move-object/from16 v6, v18

    const/4 v10, 0x0

    const/4 v13, 0x0

    :goto_1d
    const/16 v16, 0x0

    goto/16 :goto_5e

    :catch_1b
    move-exception v0

    goto :goto_1e

    :catch_1c
    move-exception v0

    :goto_1e
    move-object v3, v0

    move-object/from16 v8, v17

    move-object/from16 v6, v18

    const/4 v10, 0x0

    const/4 v13, 0x0

    :goto_1f
    const/16 v16, 0x0

    goto/16 :goto_63

    :catch_1d
    move-exception v0

    move-object v3, v0

    move-object/from16 v8, v17

    move-object/from16 v6, v18

    const/4 v10, 0x0

    const/4 v13, 0x0

    :goto_20
    const/16 v16, 0x0

    goto/16 :goto_67

    :cond_4
    :try_start_e
    const-string v3, "attachment"
    :try_end_e
    .catch Ljava/net/UnknownHostException; {:try_start_e .. :try_end_e} :catch_55
    .catch Ljava/net/SocketException; {:try_start_e .. :try_end_e} :catch_54
    .catch Ljava/lang/SecurityException; {:try_start_e .. :try_end_e} :catch_53
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_e .. :try_end_e} :catch_52
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_e .. :try_end_e} :catch_51
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_50
    .catchall {:try_start_e .. :try_end_e} :catchall_c

    :goto_21
    if-nez v14, :cond_5

    .line 281
    :try_start_f
    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v14
    :try_end_f
    .catch Ljava/net/UnknownHostException; {:try_start_f .. :try_end_f} :catch_1d
    .catch Ljava/net/SocketException; {:try_start_f .. :try_end_f} :catch_1c
    .catch Ljava/lang/SecurityException; {:try_start_f .. :try_end_f} :catch_1b
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_f .. :try_end_f} :catch_1a
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_f .. :try_end_f} :catch_19
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_18
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    .line 284
    :cond_5
    :try_start_10
    new-instance v13, Ljava/io/FileInputStream;

    invoke-direct {v13, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_10
    .catch Ljava/net/UnknownHostException; {:try_start_10 .. :try_end_10} :catch_55
    .catch Ljava/net/SocketException; {:try_start_10 .. :try_end_10} :catch_54
    .catch Ljava/lang/SecurityException; {:try_start_10 .. :try_end_10} :catch_53
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_10 .. :try_end_10} :catch_52
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_10 .. :try_end_10} :catch_51
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_50
    .catchall {:try_start_10 .. :try_end_10} :catchall_c

    .line 285
    :try_start_11
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v15}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 286
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\"; filename=\""

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\""

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 288
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Content-Type: "

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v11, v2, Lcom/helpshift/common/platform/network/UploadRequest;->mimeType:Ljava/lang/String;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 289
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 290
    invoke-virtual {v12, v10}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 296
    invoke-virtual {v13}, Ljava/io/FileInputStream;->available()I

    move-result v3

    const/16 v5, 0x2000

    .line 298
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 299
    new-array v6, v3, [B

    const/4 v11, 0x0

    .line 302
    invoke-virtual {v13, v6, v11, v3}, Ljava/io/FileInputStream;->read([BII)I

    move-result v14
    :try_end_11
    .catch Ljava/net/UnknownHostException; {:try_start_11 .. :try_end_11} :catch_4f
    .catch Ljava/net/SocketException; {:try_start_11 .. :try_end_11} :catch_4e
    .catch Ljava/lang/SecurityException; {:try_start_11 .. :try_end_11} :catch_4d
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_11 .. :try_end_11} :catch_4c
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_11 .. :try_end_11} :catch_4b
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_4a
    .catchall {:try_start_11 .. :try_end_11} :catchall_b

    :goto_22
    if-lez v14, :cond_6

    .line 305
    :try_start_12
    invoke-virtual {v12, v6, v11, v3}, Ljava/io/DataOutputStream;->write([BII)V

    .line 306
    invoke-virtual {v13}, Ljava/io/FileInputStream;->available()I

    move-result v3

    .line 307
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 308
    invoke-virtual {v13, v6, v11, v3}, Ljava/io/FileInputStream;->read([BII)I

    move-result v14
    :try_end_12
    .catch Ljava/net/UnknownHostException; {:try_start_12 .. :try_end_12} :catch_23
    .catch Ljava/net/SocketException; {:try_start_12 .. :try_end_12} :catch_22
    .catch Ljava/lang/SecurityException; {:try_start_12 .. :try_end_12} :catch_21
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_12 .. :try_end_12} :catch_20
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_12 .. :try_end_12} :catch_1f
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_1e
    .catchall {:try_start_12 .. :try_end_12} :catchall_4

    goto :goto_22

    :catchall_4
    move-exception v0

    move-object v2, v0

    move-object/from16 v6, v18

    :goto_23
    const/4 v10, 0x0

    goto/16 :goto_3

    :catch_1e
    move-exception v0

    move-object v3, v0

    move-object/from16 v6, v18

    :goto_24
    const/4 v10, 0x0

    goto/16 :goto_1b

    :catch_1f
    move-exception v0

    move-object v3, v0

    move-object/from16 v8, v17

    move-object/from16 v6, v18

    :goto_25
    const/4 v10, 0x0

    goto/16 :goto_1c

    :catch_20
    move-exception v0

    move-object v3, v0

    move-object/from16 v8, v17

    move-object/from16 v6, v18

    :goto_26
    const/4 v10, 0x0

    goto/16 :goto_1d

    :catch_21
    move-exception v0

    goto :goto_27

    :catch_22
    move-exception v0

    :goto_27
    move-object v3, v0

    move-object/from16 v8, v17

    move-object/from16 v6, v18

    :goto_28
    const/4 v10, 0x0

    goto/16 :goto_1f

    :catch_23
    move-exception v0

    move-object v3, v0

    move-object/from16 v8, v17

    move-object/from16 v6, v18

    :goto_29
    const/4 v10, 0x0

    goto/16 :goto_20

    .line 311
    :cond_6
    :try_start_13
    invoke-virtual {v12, v10}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 312
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 313
    invoke-virtual {v12}, Ljava/io/DataOutputStream;->flush()V

    .line 315
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3
    :try_end_13
    .catch Ljava/net/UnknownHostException; {:try_start_13 .. :try_end_13} :catch_4f
    .catch Ljava/net/SocketException; {:try_start_13 .. :try_end_13} :catch_4e
    .catch Ljava/lang/SecurityException; {:try_start_13 .. :try_end_13} :catch_4d
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_13 .. :try_end_13} :catch_4c
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_13 .. :try_end_13} :catch_4b
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_4a
    .catchall {:try_start_13 .. :try_end_13} :catchall_b

    const/16 v5, 0xc8

    if-lt v3, v5, :cond_9

    const/16 v5, 0x12c

    if-ge v3, v5, :cond_9

    .line 318
    :try_start_14
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5
    :try_end_14
    .catch Ljava/net/UnknownHostException; {:try_start_14 .. :try_end_14} :catch_36
    .catch Ljava/net/SocketException; {:try_start_14 .. :try_end_14} :catch_35
    .catch Ljava/lang/SecurityException; {:try_start_14 .. :try_end_14} :catch_34
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_14 .. :try_end_14} :catch_33
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_14 .. :try_end_14} :catch_32
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_31
    .catchall {:try_start_14 .. :try_end_14} :catchall_7

    if-eqz v5, :cond_7

    .line 320
    :try_start_15
    invoke-direct {v1, v5}, Lcom/helpshift/common/platform/AndroidHTTPTransport;->readInputStream(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v6
    :try_end_15
    .catch Ljava/net/UnknownHostException; {:try_start_15 .. :try_end_15} :catch_29
    .catch Ljava/net/SocketException; {:try_start_15 .. :try_end_15} :catch_28
    .catch Ljava/lang/SecurityException; {:try_start_15 .. :try_end_15} :catch_27
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_15 .. :try_end_15} :catch_26
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_15 .. :try_end_15} :catch_25
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_24
    .catchall {:try_start_15 .. :try_end_15} :catchall_5

    goto :goto_2b

    :catchall_5
    move-exception v0

    move-object v2, v0

    move-object v10, v5

    move-object/from16 v6, v18

    goto/16 :goto_3

    :catch_24
    move-exception v0

    move-object v3, v0

    move-object/from16 v16, v5

    move-object/from16 v6, v18

    goto/16 :goto_2d

    :catch_25
    move-exception v0

    move-object v3, v0

    move-object/from16 v16, v5

    move-object/from16 v8, v17

    move-object/from16 v6, v18

    goto/16 :goto_2e

    :catch_26
    move-exception v0

    move-object v3, v0

    move-object/from16 v16, v5

    move-object/from16 v8, v17

    move-object/from16 v6, v18

    goto/16 :goto_2f

    :catch_27
    move-exception v0

    goto :goto_2a

    :catch_28
    move-exception v0

    :goto_2a
    move-object v3, v0

    move-object/from16 v16, v5

    move-object/from16 v8, v17

    move-object/from16 v6, v18

    goto/16 :goto_31

    :catch_29
    move-exception v0

    move-object v3, v0

    move-object/from16 v16, v5

    move-object/from16 v8, v17

    move-object/from16 v6, v18

    goto/16 :goto_32

    :cond_7
    const/4 v6, 0x0

    .line 322
    :goto_2b
    :try_start_16
    new-instance v8, Lcom/helpshift/common/platform/network/Response;

    const/4 v9, 0x0

    invoke-direct {v8, v3, v6, v9}, Lcom/helpshift/common/platform/network/Response;-><init>(ILjava/lang/String;Ljava/util/List;)V
    :try_end_16
    .catch Ljava/net/UnknownHostException; {:try_start_16 .. :try_end_16} :catch_30
    .catch Ljava/net/SocketException; {:try_start_16 .. :try_end_16} :catch_2f
    .catch Ljava/lang/SecurityException; {:try_start_16 .. :try_end_16} :catch_2e
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_16 .. :try_end_16} :catch_2d
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_16 .. :try_end_16} :catch_2c
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_2b
    .catchall {:try_start_16 .. :try_end_16} :catchall_6

    .line 357
    invoke-static {v13}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 358
    invoke-static {v12}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 359
    invoke-static {v5}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 360
    invoke-static {v9}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    if-eqz v7, :cond_8

    .line 363
    :try_start_17
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_2a

    goto :goto_2c

    :catch_2a
    move-exception v0

    move-object v2, v0

    move-object/from16 v6, v18

    .line 367
    invoke-static {v4, v6, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_8
    :goto_2c
    return-object v8

    :catchall_6
    move-exception v0

    move-object/from16 v6, v18

    move-object v2, v0

    move-object v10, v5

    goto/16 :goto_3

    :catch_2b
    move-exception v0

    move-object/from16 v6, v18

    move-object v3, v0

    move-object/from16 v16, v5

    :goto_2d
    const/4 v10, 0x0

    goto/16 :goto_56

    :catch_2c
    move-exception v0

    move-object/from16 v6, v18

    move-object v3, v0

    move-object/from16 v16, v5

    move-object/from16 v8, v17

    :goto_2e
    const/4 v10, 0x0

    goto/16 :goto_5a

    :catch_2d
    move-exception v0

    move-object/from16 v6, v18

    move-object v3, v0

    move-object/from16 v16, v5

    move-object/from16 v8, v17

    :goto_2f
    const/4 v10, 0x0

    goto/16 :goto_5e

    :catch_2e
    move-exception v0

    goto :goto_30

    :catch_2f
    move-exception v0

    :goto_30
    move-object/from16 v6, v18

    move-object v3, v0

    move-object/from16 v16, v5

    move-object/from16 v8, v17

    :goto_31
    const/4 v10, 0x0

    goto/16 :goto_63

    :catch_30
    move-exception v0

    move-object/from16 v6, v18

    move-object v3, v0

    move-object/from16 v16, v5

    move-object/from16 v8, v17

    :goto_32
    const/4 v10, 0x0

    goto/16 :goto_67

    :catchall_7
    move-exception v0

    move-object/from16 v6, v18

    move-object v2, v0

    goto/16 :goto_23

    :catch_31
    move-exception v0

    move-object/from16 v6, v18

    move-object v3, v0

    goto/16 :goto_24

    :catch_32
    move-exception v0

    move-object/from16 v6, v18

    move-object v3, v0

    move-object/from16 v8, v17

    goto/16 :goto_25

    :catch_33
    move-exception v0

    move-object/from16 v6, v18

    move-object v3, v0

    move-object/from16 v8, v17

    goto/16 :goto_26

    :catch_34
    move-exception v0

    goto :goto_33

    :catch_35
    move-exception v0

    :goto_33
    move-object/from16 v6, v18

    move-object v3, v0

    move-object/from16 v8, v17

    goto/16 :goto_28

    :catch_36
    move-exception v0

    move-object/from16 v6, v18

    move-object v3, v0

    move-object/from16 v8, v17

    goto/16 :goto_29

    :cond_9
    move-object/from16 v6, v18

    .line 326
    :try_start_18
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v5
    :try_end_18
    .catch Ljava/net/UnknownHostException; {:try_start_18 .. :try_end_18} :catch_49
    .catch Ljava/net/SocketException; {:try_start_18 .. :try_end_18} :catch_48
    .catch Ljava/lang/SecurityException; {:try_start_18 .. :try_end_18} :catch_47
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_18 .. :try_end_18} :catch_46
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_18 .. :try_end_18} :catch_45
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_44
    .catchall {:try_start_18 .. :try_end_18} :catchall_a

    .line 327
    :try_start_19
    invoke-direct {v1, v5}, Lcom/helpshift/common/platform/AndroidHTTPTransport;->readInputStream(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v8

    .line 328
    new-instance v9, Lcom/helpshift/common/platform/network/Response;
    :try_end_19
    .catch Ljava/net/UnknownHostException; {:try_start_19 .. :try_end_19} :catch_43
    .catch Ljava/net/SocketException; {:try_start_19 .. :try_end_19} :catch_42
    .catch Ljava/lang/SecurityException; {:try_start_19 .. :try_end_19} :catch_41
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_19 .. :try_end_19} :catch_40
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_19 .. :try_end_19} :catch_3f
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_3e
    .catchall {:try_start_19 .. :try_end_19} :catchall_9

    const/4 v10, 0x0

    :try_start_1a
    invoke-direct {v9, v3, v8, v10}, Lcom/helpshift/common/platform/network/Response;-><init>(ILjava/lang/String;Ljava/util/List;)V
    :try_end_1a
    .catch Ljava/net/UnknownHostException; {:try_start_1a .. :try_end_1a} :catch_3d
    .catch Ljava/net/SocketException; {:try_start_1a .. :try_end_1a} :catch_3c
    .catch Ljava/lang/SecurityException; {:try_start_1a .. :try_end_1a} :catch_3b
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_1a .. :try_end_1a} :catch_3a
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_1a .. :try_end_1a} :catch_39
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_38
    .catchall {:try_start_1a .. :try_end_1a} :catchall_8

    .line 357
    invoke-static {v13}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 358
    invoke-static {v12}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 359
    invoke-static {v10}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 360
    invoke-static {v5}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    if-eqz v7, :cond_a

    .line 363
    :try_start_1b
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_37

    goto :goto_34

    :catch_37
    move-exception v0

    move-object v2, v0

    .line 367
    invoke-static {v4, v6, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_a
    :goto_34
    return-object v9

    :catchall_8
    move-exception v0

    goto :goto_35

    :catch_38
    move-exception v0

    goto :goto_36

    :catch_39
    move-exception v0

    goto :goto_37

    :catch_3a
    move-exception v0

    goto :goto_38

    :catch_3b
    move-exception v0

    goto :goto_3a

    :catch_3c
    move-exception v0

    goto :goto_3a

    :catch_3d
    move-exception v0

    goto :goto_3b

    :catchall_9
    move-exception v0

    const/4 v10, 0x0

    :goto_35
    move-object v2, v0

    move-object/from16 v16, v5

    goto/16 :goto_68

    :catch_3e
    move-exception v0

    const/4 v10, 0x0

    :goto_36
    move-object v3, v0

    move-object/from16 v16, v10

    move-object v10, v5

    goto/16 :goto_56

    :catch_3f
    move-exception v0

    const/4 v10, 0x0

    :goto_37
    move-object v3, v0

    move-object/from16 v16, v10

    move-object/from16 v8, v17

    move-object v10, v5

    goto/16 :goto_5a

    :catch_40
    move-exception v0

    const/4 v10, 0x0

    :goto_38
    move-object v3, v0

    move-object/from16 v16, v10

    move-object/from16 v8, v17

    move-object v10, v5

    goto/16 :goto_5e

    :catch_41
    move-exception v0

    goto :goto_39

    :catch_42
    move-exception v0

    :goto_39
    const/4 v10, 0x0

    :goto_3a
    move-object v3, v0

    move-object/from16 v16, v10

    move-object/from16 v8, v17

    move-object v10, v5

    goto/16 :goto_63

    :catch_43
    move-exception v0

    const/4 v10, 0x0

    :goto_3b
    move-object v3, v0

    move-object/from16 v16, v10

    move-object/from16 v8, v17

    move-object v10, v5

    goto/16 :goto_67

    :catchall_a
    move-exception v0

    goto :goto_3c

    :catch_44
    move-exception v0

    goto :goto_3d

    :catch_45
    move-exception v0

    goto :goto_3e

    :catch_46
    move-exception v0

    goto :goto_3f

    :catch_47
    move-exception v0

    goto :goto_41

    :catch_48
    move-exception v0

    goto :goto_41

    :catch_49
    move-exception v0

    goto :goto_42

    :catchall_b
    move-exception v0

    move-object/from16 v6, v18

    :goto_3c
    const/4 v10, 0x0

    move-object v2, v0

    move-object/from16 v16, v10

    goto/16 :goto_68

    :catch_4a
    move-exception v0

    move-object/from16 v6, v18

    :goto_3d
    const/4 v10, 0x0

    move-object v3, v0

    move-object/from16 v16, v10

    goto/16 :goto_56

    :catch_4b
    move-exception v0

    move-object/from16 v6, v18

    :goto_3e
    const/4 v10, 0x0

    move-object v3, v0

    move-object/from16 v16, v10

    goto :goto_45

    :catch_4c
    move-exception v0

    move-object/from16 v6, v18

    :goto_3f
    const/4 v10, 0x0

    move-object v3, v0

    move-object/from16 v16, v10

    goto :goto_47

    :catch_4d
    move-exception v0

    goto :goto_40

    :catch_4e
    move-exception v0

    :goto_40
    move-object/from16 v6, v18

    :goto_41
    const/4 v10, 0x0

    move-object v3, v0

    move-object/from16 v16, v10

    goto/16 :goto_4a

    :catch_4f
    move-exception v0

    move-object/from16 v6, v18

    :goto_42
    const/4 v10, 0x0

    move-object v3, v0

    move-object/from16 v16, v10

    goto/16 :goto_4c

    :catchall_c
    move-exception v0

    move-object/from16 v6, v18

    goto/16 :goto_4d

    :catch_50
    move-exception v0

    move-object/from16 v6, v18

    goto/16 :goto_4e

    :catch_51
    move-exception v0

    move-object/from16 v6, v18

    goto :goto_44

    :catch_52
    move-exception v0

    move-object/from16 v6, v18

    goto :goto_46

    :catch_53
    move-exception v0

    goto :goto_43

    :catch_54
    move-exception v0

    :goto_43
    move-object/from16 v6, v18

    goto :goto_49

    :catch_55
    move-exception v0

    move-object/from16 v6, v18

    goto :goto_4b

    :catch_56
    move-exception v0

    move-object v6, v3

    goto :goto_4e

    :catch_57
    move-exception v0

    move-object v6, v3

    :goto_44
    const/4 v10, 0x0

    move-object v3, v0

    move-object v13, v10

    move-object/from16 v16, v13

    :goto_45
    move-object/from16 v8, v17

    goto/16 :goto_5a

    :catch_58
    move-exception v0

    move-object v6, v3

    :goto_46
    const/4 v10, 0x0

    move-object v3, v0

    move-object v13, v10

    move-object/from16 v16, v13

    :goto_47
    move-object/from16 v8, v17

    goto/16 :goto_5e

    :catch_59
    move-exception v0

    goto :goto_48

    :catch_5a
    move-exception v0

    :goto_48
    move-object v6, v3

    :goto_49
    const/4 v10, 0x0

    move-object v3, v0

    move-object v13, v10

    move-object/from16 v16, v13

    :goto_4a
    move-object/from16 v8, v17

    goto/16 :goto_63

    :catch_5b
    move-exception v0

    move-object v6, v3

    :goto_4b
    const/4 v10, 0x0

    move-object v3, v0

    move-object v13, v10

    move-object/from16 v16, v13

    :goto_4c
    move-object/from16 v8, v17

    goto/16 :goto_67

    :catchall_d
    move-exception v0

    move-object v6, v3

    :goto_4d
    const/4 v10, 0x0

    move-object v2, v0

    move-object v13, v10

    goto/16 :goto_53

    :catch_5c
    move-exception v0

    move-object v6, v3

    move-object/from16 v17, v5

    :goto_4e
    const/4 v10, 0x0

    move-object v3, v0

    move-object v13, v10

    goto/16 :goto_55

    :catch_5d
    move-exception v0

    move-object v6, v3

    const/4 v10, 0x0

    move-object v3, v0

    move-object v8, v5

    move-object v13, v10

    goto/16 :goto_59

    :catch_5e
    move-exception v0

    move-object v6, v3

    const/4 v10, 0x0

    move-object v3, v0

    move-object v8, v5

    move-object v13, v10

    goto/16 :goto_5d

    :catch_5f
    move-exception v0

    goto :goto_4f

    :catch_60
    move-exception v0

    :goto_4f
    move-object v6, v3

    const/4 v10, 0x0

    move-object v3, v0

    move-object v8, v5

    move-object v13, v10

    goto/16 :goto_62

    :catch_61
    move-exception v0

    move-object v6, v3

    const/4 v10, 0x0

    move-object v3, v0

    move-object v8, v5

    move-object v13, v10

    goto/16 :goto_66

    :catchall_e
    move-exception v0

    move-object v6, v3

    const/4 v10, 0x0

    move-object v2, v0

    move-object v12, v10

    goto/16 :goto_52

    :catch_62
    move-exception v0

    move-object v6, v3

    move-object/from16 v17, v5

    const/4 v10, 0x0

    move-object v3, v0

    move-object v12, v10

    goto/16 :goto_54

    :catch_63
    move-exception v0

    move-object v6, v3

    const/4 v10, 0x0

    move-object v3, v0

    move-object v8, v5

    move-object v12, v10

    goto/16 :goto_58

    :catch_64
    move-exception v0

    move-object v6, v3

    const/4 v10, 0x0

    move-object v3, v0

    move-object v8, v5

    move-object v12, v10

    goto/16 :goto_5c

    :catch_65
    move-exception v0

    goto :goto_50

    :catch_66
    move-exception v0

    :goto_50
    move-object v6, v3

    const/4 v10, 0x0

    move-object v3, v0

    move-object v8, v5

    move-object v12, v10

    goto/16 :goto_61

    :catch_67
    move-exception v0

    move-object v6, v3

    const/4 v10, 0x0

    move-object v3, v0

    move-object v8, v5

    move-object v12, v10

    goto/16 :goto_65

    :catch_68
    move-exception v0

    move-object v6, v3

    const/4 v10, 0x0

    move-object v3, v0

    move-object v8, v5

    goto :goto_57

    :catch_69
    move-exception v0

    move-object v6, v3

    const/4 v10, 0x0

    move-object v3, v0

    move-object v8, v5

    goto/16 :goto_5b

    :catch_6a
    move-exception v0

    goto :goto_51

    :catch_6b
    move-exception v0

    :goto_51
    move-object v6, v3

    const/4 v10, 0x0

    move-object v3, v0

    move-object v8, v5

    goto/16 :goto_60

    :catch_6c
    move-exception v0

    move-object v6, v3

    const/4 v10, 0x0

    move-object v3, v0

    move-object v8, v5

    goto/16 :goto_64

    :catchall_f
    move-exception v0

    move-object v6, v3

    const/4 v10, 0x0

    move-object v2, v0

    move-object v7, v10

    move-object v12, v7

    :goto_52
    move-object v13, v12

    :goto_53
    move-object/from16 v16, v13

    goto/16 :goto_68

    :catch_6d
    move-exception v0

    move-object v6, v3

    move-object/from16 v17, v5

    const/4 v10, 0x0

    move-object v3, v0

    move-object v7, v10

    move-object v12, v7

    :goto_54
    move-object v13, v12

    :goto_55
    move-object/from16 v16, v13

    .line 352
    :goto_56
    :try_start_1c
    sget-object v5, Lcom/helpshift/common/exception/NetworkException;->GENERIC:Lcom/helpshift/common/exception/NetworkException;

    .line 353
    iget-object v2, v2, Lcom/helpshift/common/platform/network/UploadRequest;->url:Ljava/lang/String;

    iput-object v2, v5, Lcom/helpshift/common/exception/NetworkException;->route:Ljava/lang/String;

    move-object/from16 v8, v17

    .line 354
    invoke-static {v3, v5, v8}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v2

    throw v2

    :catch_6e
    move-exception v0

    move-object v6, v3

    move-object v8, v5

    const/4 v10, 0x0

    move-object v3, v0

    :goto_57
    move-object v7, v10

    move-object v12, v7

    :goto_58
    move-object v13, v12

    :goto_59
    move-object/from16 v16, v13

    .line 347
    :goto_5a
    sget-object v5, Lcom/helpshift/common/exception/NetworkException;->SSL_HANDSHAKE:Lcom/helpshift/common/exception/NetworkException;

    .line 348
    iget-object v2, v2, Lcom/helpshift/common/platform/network/UploadRequest;->url:Ljava/lang/String;

    iput-object v2, v5, Lcom/helpshift/common/exception/NetworkException;->route:Ljava/lang/String;

    .line 349
    invoke-static {v3, v5, v8}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v2

    throw v2

    :catch_6f
    move-exception v0

    move-object v6, v3

    move-object v8, v5

    const/4 v10, 0x0

    move-object v3, v0

    :goto_5b
    move-object v7, v10

    move-object v12, v7

    :goto_5c
    move-object v13, v12

    :goto_5d
    move-object/from16 v16, v13

    .line 342
    :goto_5e
    sget-object v5, Lcom/helpshift/common/exception/NetworkException;->SSL_PEER_UNVERIFIED:Lcom/helpshift/common/exception/NetworkException;

    .line 343
    iget-object v2, v2, Lcom/helpshift/common/platform/network/UploadRequest;->url:Ljava/lang/String;

    iput-object v2, v5, Lcom/helpshift/common/exception/NetworkException;->route:Ljava/lang/String;

    .line 344
    invoke-static {v3, v5, v8}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v2

    throw v2

    :catch_70
    move-exception v0

    goto :goto_5f

    :catch_71
    move-exception v0

    :goto_5f
    move-object v6, v3

    move-object v8, v5

    const/4 v10, 0x0

    move-object v3, v0

    :goto_60
    move-object v7, v10

    move-object v12, v7

    :goto_61
    move-object v13, v12

    :goto_62
    move-object/from16 v16, v13

    .line 337
    :goto_63
    sget-object v5, Lcom/helpshift/common/exception/NetworkException;->NO_CONNECTION:Lcom/helpshift/common/exception/NetworkException;

    .line 338
    iget-object v2, v2, Lcom/helpshift/common/platform/network/UploadRequest;->url:Ljava/lang/String;

    iput-object v2, v5, Lcom/helpshift/common/exception/NetworkException;->route:Ljava/lang/String;

    .line 339
    invoke-static {v3, v5, v8}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v2

    throw v2

    :catch_72
    move-exception v0

    move-object v6, v3

    move-object v8, v5

    const/4 v10, 0x0

    move-object v3, v0

    :goto_64
    move-object v7, v10

    move-object v12, v7

    :goto_65
    move-object v13, v12

    :goto_66
    move-object/from16 v16, v13

    .line 332
    :goto_67
    sget-object v5, Lcom/helpshift/common/exception/NetworkException;->UNKNOWN_HOST:Lcom/helpshift/common/exception/NetworkException;

    .line 333
    iget-object v2, v2, Lcom/helpshift/common/platform/network/UploadRequest;->url:Ljava/lang/String;

    iput-object v2, v5, Lcom/helpshift/common/exception/NetworkException;->route:Ljava/lang/String;

    .line 334
    invoke-static {v3, v5, v8}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v2

    throw v2
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_10

    :catchall_10
    move-exception v0

    move-object v2, v0

    move-object/from16 v19, v16

    move-object/from16 v16, v10

    move-object/from16 v10, v19

    .line 357
    :goto_68
    invoke-static {v13}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 358
    invoke-static {v12}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 359
    invoke-static {v10}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 360
    invoke-static/range {v16 .. v16}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    if-eqz v7, :cond_b

    .line 363
    :try_start_1d
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1d} :catch_73

    goto :goto_69

    :catch_73
    move-exception v0

    move-object v3, v0

    .line 367
    invoke-static {v4, v6, v3}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 369
    :cond_b
    :goto_69
    throw v2
.end method


# virtual methods
.method public makeRequest(Lcom/helpshift/common/platform/network/Request;)Lcom/helpshift/common/platform/network/Response;
    .locals 1

    .line 53
    instance-of v0, p1, Lcom/helpshift/common/platform/network/UploadRequest;

    if-eqz v0, :cond_0

    .line 54
    check-cast p1, Lcom/helpshift/common/platform/network/UploadRequest;

    invoke-direct {p0, p1}, Lcom/helpshift/common/platform/AndroidHTTPTransport;->upload(Lcom/helpshift/common/platform/network/UploadRequest;)Lcom/helpshift/common/platform/network/Response;

    move-result-object p1

    return-object p1

    .line 57
    :cond_0
    invoke-direct {p0, p1}, Lcom/helpshift/common/platform/AndroidHTTPTransport;->makeNetworkRequest(Lcom/helpshift/common/platform/network/Request;)Lcom/helpshift/common/platform/network/Response;

    move-result-object p1

    return-object p1
.end method
