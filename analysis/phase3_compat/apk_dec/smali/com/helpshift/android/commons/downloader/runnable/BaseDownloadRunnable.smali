.class public abstract Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;
.super Ljava/lang/Object;
.source "BaseDownloadRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field protected static final DOWNLOAD_MANAGER_DB_KEY:Ljava/lang/String; = "kDownloadManagerCachedFiles"

.field private static final TAG:Ljava/lang/String; = "Helpshift_DownloadRun"


# instance fields
.field private networkAuthDataFetcher:Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;

.field private onDownloadFinishListener:Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;

.field private onProgressChangedListener:Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;

.field protected requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;


# direct methods
.method constructor <init>(Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    .line 50
    iput-object p2, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->networkAuthDataFetcher:Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;

    .line 51
    iput-object p3, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->onProgressChangedListener:Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;

    .line 52
    iput-object p4, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->onDownloadFinishListener:Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;

    return-void
.end method

.method private buildUrl()Ljava/net/URL;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/net/URISyntaxException;,
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 171
    iget-object v0, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-boolean v0, v0, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->isSecured:Z

    if-eqz v0, :cond_0

    .line 172
    iget-object v0, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v0, v0, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    iget-object v1, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->networkAuthDataFetcher:Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;

    invoke-static {v0, v1}, Lcom/helpshift/android/commons/downloader/util/AttachmentNetworkUtil;->buildSecureURL(Ljava/lang/String;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;)Ljava/net/URL;

    move-result-object v0

    return-object v0

    .line 175
    :cond_0
    new-instance v0, Ljava/net/URL;

    new-instance v1, Ljava/net/URI;

    iget-object v2, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v2, v2, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private fixSSLSocketProtocols(Ljavax/net/ssl/HttpsURLConnection;)V
    .locals 4

    .line 181
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-gt v0, v1, :cond_0

    .line 185
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "TLSv1.2"

    .line 186
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 189
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const-string v2, "SSLv3"

    .line 190
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    invoke-virtual {p1}, Ljavax/net/ssl/HttpsURLConnection;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v2

    .line 193
    new-instance v3, Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;

    invoke-direct {v3, v2, v0, v1}, Lcom/helpshift/android/commons/downloader/HelpshiftSSLSocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;Ljava/util/List;Ljava/util/List;)V

    .line 194
    invoke-virtual {p1, v3}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected abstract clearCache()V
.end method

.method closeFileStream(Ljava/io/Closeable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 200
    invoke-interface {p1}, Ljava/io/Closeable;->close()V

    :cond_0
    return-void
.end method

.method protected abstract getAlreadyDownloadedBytes()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation
.end method

.method protected abstract isGzipSupported()Z
.end method

.method notifyDownloadFinish(ZLjava/lang/Object;ILjava/lang/String;)V
    .locals 6

    .line 211
    iget-object v0, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->onDownloadFinishListener:Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;

    if-eqz v0, :cond_0

    .line 212
    iget-object v1, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v2, v1, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    move v1, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-interface/range {v0 .. v5}, Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;->onDownloadFinish(ZLjava/lang/String;Ljava/lang/Object;ILjava/lang/String;)V

    :cond_0
    return-void
.end method

.method notifyProgressChange(I)V
    .locals 2

    .line 205
    iget-object v0, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->onProgressChangedListener:Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;

    if-eqz v0, :cond_0

    .line 206
    iget-object v1, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v1, v1, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;->onProgressChanged(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method protected abstract processHttpResponse(Ljava/io/InputStream;IILjava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public run()V
    .locals 13

    const-string v0, "Exception in closing download response"

    const-string v1, "route"

    .line 57
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Starting download : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v3, v3, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Helpshift_DownloadRun"

    invoke-static {v3, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0xa

    .line 58
    invoke-static {v2}, Landroid/os/Process;->setThreadPriority(I)V

    const-string v2, ""

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 62
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v6

    if-nez v6, :cond_7

    .line 65
    invoke-direct {p0}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->buildUrl()Ljava/net/URL;

    move-result-object v6

    const-string v7, "https"

    .line 68
    invoke-virtual {v6}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 69
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v6

    check-cast v6, Ljavax/net/ssl/HttpsURLConnection;

    .line 70
    move-object v7, v6

    check-cast v7, Ljavax/net/ssl/HttpsURLConnection;

    invoke-direct {p0, v7}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->fixSSLSocketProtocols(Ljavax/net/ssl/HttpsURLConnection;)V

    goto :goto_0

    .line 73
    :cond_0
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v6

    check-cast v6, Ljava/net/HttpURLConnection;

    .line 75
    :goto_0
    iget-object v7, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v7, v7, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->etag:Ljava/lang/String;

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v7, v7, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->etag:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_1

    const-string v7, "If-None-Match"

    .line 76
    iget-object v8, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v8, v8, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->etag:Ljava/lang/String;

    invoke-virtual {v6, v7, v8}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    :cond_1
    invoke-virtual {v6, v4}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_e
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_d
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_c
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_a

    const/4 v7, 0x0

    .line 86
    :try_start_1
    invoke-virtual {p0}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->getAlreadyDownloadedBytes()J

    move-result-wide v8

    const-string v10, "Range"

    .line 87
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "bytes="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v8, "-"

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v10, v8}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v8
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/16 v9, 0x1a0

    if-eq v8, v9, :cond_5

    const/16 v9, 0x130

    if-ne v8, v9, :cond_2

    .line 101
    :try_start_2
    invoke-virtual {p0, v5, v7, v8, v2}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->notifyDownloadFinish(ZLjava/lang/Object;ILjava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 138
    :try_start_3
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_9
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_8
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_7
    .catch Ljava/security/GeneralSecurityException; {:try_start_3 .. :try_end_3} :catch_6
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5

    return-void

    .line 105
    :cond_2
    :try_start_4
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    .line 106
    invoke-virtual {p0}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->isGzipSupported()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 107
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v9

    const-string v10, "Content-Encoding"

    .line 108
    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    if-eqz v9, :cond_3

    .line 109
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    if-lez v10, :cond_3

    .line 110
    invoke-interface {v9, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    const-string v10, "gzip"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 111
    new-instance v9, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v9, v7}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    move-object v7, v9

    .line 115
    :cond_3
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v9

    const-string v10, "Etag"

    .line 116
    invoke-virtual {v6, v10}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 118
    invoke-virtual {p0, v7, v9, v8, v2}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->processHttpResponse(Ljava/io/InputStream;IILjava/lang/String;)V

    .line 120
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v7, :cond_4

    .line 130
    :try_start_5
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_9
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_5} :catch_8
    .catch Ljava/security/GeneralSecurityException; {:try_start_5 .. :try_end_5} :catch_6
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_1

    :catch_0
    move-exception v7

    .line 133
    :try_start_6
    invoke-virtual {p0, v5, v7, v8, v2}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->notifyDownloadFinish(ZLjava/lang/Object;ILjava/lang/String;)V

    new-array v9, v4, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    .line 134
    iget-object v10, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v10, v10, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    .line 135
    invoke-static {v1, v10}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromString(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v10

    aput-object v10, v9, v5

    .line 134
    invoke-static {v3, v0, v7, v9}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    .line 138
    :cond_4
    :goto_1
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_6
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/net/MalformedURLException; {:try_start_6 .. :try_end_6} :catch_8
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_7
    .catch Ljava/security/GeneralSecurityException; {:try_start_6 .. :try_end_6} :catch_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    goto/16 :goto_a

    .line 96
    :cond_5
    :try_start_7
    invoke-virtual {p0}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->clearCache()V

    .line 97
    new-instance v9, Ljava/io/IOException;

    const-string v10, "Requested Range Not Satisfiable, failed with 416 status"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :catch_1
    move-exception v9

    goto :goto_2

    :catchall_0
    move-exception v9

    const/4 v8, 0x0

    goto :goto_3

    :catch_2
    move-exception v9

    const/4 v8, 0x0

    .line 123
    :goto_2
    :try_start_8
    invoke-virtual {p0, v5, v9, v8, v2}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->notifyDownloadFinish(ZLjava/lang/Object;ILjava/lang/String;)V

    const-string v10, "Exception in download"

    new-array v11, v4, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    .line 124
    iget-object v12, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v12, v12, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    .line 125
    invoke-static {v1, v12}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromString(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v12

    aput-object v12, v11, v5

    .line 124
    invoke-static {v3, v10, v9, v11}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    if-eqz v7, :cond_4

    .line 130
    :try_start_9
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_9} :catch_9
    .catch Ljava/net/MalformedURLException; {:try_start_9 .. :try_end_9} :catch_8
    .catch Ljava/security/GeneralSecurityException; {:try_start_9 .. :try_end_9} :catch_6
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5

    goto :goto_1

    :catch_3
    move-exception v7

    .line 133
    :try_start_a
    invoke-virtual {p0, v5, v7, v8, v2}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->notifyDownloadFinish(ZLjava/lang/Object;ILjava/lang/String;)V

    new-array v9, v4, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    .line 134
    iget-object v10, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v10, v10, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    .line 135
    invoke-static {v1, v10}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromString(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v10

    aput-object v10, v9, v5

    .line 134
    invoke-static {v3, v0, v7, v9}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_9
    .catch Ljava/net/MalformedURLException; {:try_start_a .. :try_end_a} :catch_8
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_7
    .catch Ljava/security/GeneralSecurityException; {:try_start_a .. :try_end_a} :catch_6
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_5

    goto :goto_1

    :catchall_1
    move-exception v9

    :goto_3
    if-eqz v7, :cond_6

    .line 130
    :try_start_b
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_4
    .catch Ljava/lang/InterruptedException; {:try_start_b .. :try_end_b} :catch_9
    .catch Ljava/net/MalformedURLException; {:try_start_b .. :try_end_b} :catch_8
    .catch Ljava/security/GeneralSecurityException; {:try_start_b .. :try_end_b} :catch_6
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_5

    goto :goto_4

    :catch_4
    move-exception v7

    .line 133
    :try_start_c
    invoke-virtual {p0, v5, v7, v8, v2}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->notifyDownloadFinish(ZLjava/lang/Object;ILjava/lang/String;)V

    new-array v10, v4, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    .line 134
    iget-object v11, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v11, v11, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    .line 135
    invoke-static {v1, v11}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromString(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v11

    aput-object v11, v10, v5

    .line 134
    invoke-static {v3, v0, v7, v10}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    .line 138
    :cond_6
    :goto_4
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 139
    throw v9
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_c} :catch_9
    .catch Ljava/net/MalformedURLException; {:try_start_c .. :try_end_c} :catch_8
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_7
    .catch Ljava/security/GeneralSecurityException; {:try_start_c .. :try_end_c} :catch_6
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_5

    :catch_5
    move-exception v0

    goto :goto_5

    :catch_6
    move-exception v0

    goto :goto_6

    :catch_7
    move-exception v0

    goto :goto_7

    :catch_8
    move-exception v0

    goto :goto_8

    :catch_9
    move-exception v0

    goto :goto_9

    .line 63
    :cond_7
    :try_start_d
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0
    :try_end_d
    .catch Ljava/lang/InterruptedException; {:try_start_d .. :try_end_d} :catch_e
    .catch Ljava/net/MalformedURLException; {:try_start_d .. :try_end_d} :catch_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_c
    .catch Ljava/security/GeneralSecurityException; {:try_start_d .. :try_end_d} :catch_b
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_a

    :catch_a
    move-exception v0

    const/4 v8, 0x0

    .line 159
    :goto_5
    invoke-virtual {p0, v5, v0, v8, v2}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->notifyDownloadFinish(ZLjava/lang/Object;ILjava/lang/String;)V

    new-array v2, v4, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    .line 160
    iget-object v4, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v4, v4, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    invoke-static {v1, v4}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromString(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v1

    aput-object v1, v2, v5

    const-string v1, "Unknown Exception"

    invoke-static {v3, v1, v0, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    goto :goto_a

    :catch_b
    move-exception v0

    const/4 v8, 0x0

    .line 155
    :goto_6
    invoke-virtual {p0, v5, v0, v8, v2}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->notifyDownloadFinish(ZLjava/lang/Object;ILjava/lang/String;)V

    new-array v2, v4, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    .line 156
    iget-object v4, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v4, v4, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    invoke-static {v1, v4}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromString(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v1

    aput-object v1, v2, v5

    const-string v1, "GeneralSecurityException"

    invoke-static {v3, v1, v0, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    goto :goto_a

    :catch_c
    move-exception v0

    const/4 v8, 0x0

    .line 151
    :goto_7
    invoke-virtual {p0, v5, v0, v8, v2}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->notifyDownloadFinish(ZLjava/lang/Object;ILjava/lang/String;)V

    new-array v2, v4, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    .line 152
    iget-object v4, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v4, v4, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    invoke-static {v1, v4}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromString(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v1

    aput-object v1, v2, v5

    const-string v1, "Exception IO"

    invoke-static {v3, v1, v0, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    goto :goto_a

    :catch_d
    move-exception v0

    const/4 v8, 0x0

    .line 147
    :goto_8
    invoke-virtual {p0, v5, v0, v8, v2}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->notifyDownloadFinish(ZLjava/lang/Object;ILjava/lang/String;)V

    new-array v2, v4, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    .line 148
    iget-object v4, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v4, v4, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    invoke-static {v1, v4}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromString(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v1

    aput-object v1, v2, v5

    const-string v1, "MalformedURLException"

    invoke-static {v3, v1, v0, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    goto :goto_a

    :catch_e
    move-exception v0

    const/4 v8, 0x0

    .line 142
    :goto_9
    invoke-virtual {p0, v5, v0, v8, v2}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->notifyDownloadFinish(ZLjava/lang/Object;ILjava/lang/String;)V

    new-array v2, v4, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    .line 143
    iget-object v4, p0, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;->requestInfo:Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;

    iget-object v4, v4, Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;->url:Ljava/lang/String;

    invoke-static {v1, v4}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromString(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v1

    aput-object v1, v2, v5

    const-string v1, "Exception Interrupted"

    invoke-static {v3, v1, v0, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    .line 144
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :goto_a
    return-void
.end method
