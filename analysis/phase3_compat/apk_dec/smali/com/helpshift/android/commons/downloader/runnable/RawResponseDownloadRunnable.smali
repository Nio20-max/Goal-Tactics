.class public Lcom/helpshift/android/commons/downloader/runnable/RawResponseDownloadRunnable;
.super Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;
.source "RawResponseDownloadRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_RawDownRun"


# direct methods
.method public constructor <init>(Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/helpshift/android/commons/downloader/runnable/BaseDownloadRunnable;-><init>(Lcom/helpshift/android/commons/downloader/contracts/DownloadRequestedFileInfo;Lcom/helpshift/android/commons/downloader/contracts/NetworkAuthDataFetcher;Lcom/helpshift/android/commons/downloader/contracts/OnProgressChangedListener;Lcom/helpshift/android/commons/downloader/contracts/OnDownloadFinishListener;)V

    return-void
.end method


# virtual methods
.method protected clearCache()V
    .locals 0

    return-void
.end method

.method protected getAlreadyDownloadedBytes()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method protected isGzipSupported()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected processHttpResponse(Ljava/io/InputStream;IILjava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    new-instance p2, Ljava/io/InputStreamReader;

    invoke-direct {p2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 49
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, p2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 53
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 54
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 61
    :cond_0
    :goto_1
    invoke-virtual {p0, v0}, Lcom/helpshift/android/commons/downloader/runnable/RawResponseDownloadRunnable;->closeFileStream(Ljava/io/Closeable;)V

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_4

    :catch_0
    move-exception p2

    :try_start_1
    const-string v1, "Helpshift_RawDownRun"

    const-string v2, "IO Exception while reading response"

    .line 58
    invoke-static {v1, v2, p2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :goto_2
    const/4 p2, 0x1

    .line 66
    :try_start_2
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 67
    invoke-virtual {p0, p2, v0, p3, p4}, Lcom/helpshift/android/commons/downloader/runnable/RawResponseDownloadRunnable;->notifyDownloadFinish(ZLjava/lang/Object;ILjava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    .line 71
    :catch_1
    :try_start_3
    new-instance v0, Lorg/json/JSONArray;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 72
    invoke-virtual {p0, p2, v0, p3, p4}, Lcom/helpshift/android/commons/downloader/runnable/RawResponseDownloadRunnable;->notifyDownloadFinish(ZLjava/lang/Object;ILjava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_3

    .line 75
    :catch_2
    invoke-virtual {p0, p2, p1, p3, p4}, Lcom/helpshift/android/commons/downloader/runnable/RawResponseDownloadRunnable;->notifyDownloadFinish(ZLjava/lang/Object;ILjava/lang/String;)V

    :goto_3
    return-void

    .line 61
    :goto_4
    invoke-virtual {p0, v0}, Lcom/helpshift/android/commons/downloader/runnable/RawResponseDownloadRunnable;->closeFileStream(Ljava/io/Closeable;)V

    .line 62
    throw p1
.end method
