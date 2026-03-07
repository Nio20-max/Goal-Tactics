.class public Lcom/ironsource/sdk/precache/DownloadManager;
.super Ljava/lang/Object;
.source "DownloadManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ironsource/sdk/precache/DownloadManager$Result;,
        Lcom/ironsource/sdk/precache/DownloadManager$FileWorkerThread;,
        Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;,
        Lcom/ironsource/sdk/precache/DownloadManager$OnPreCacheCompletion;,
        Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;
    }
.end annotation


# static fields
.field public static final CAMPAIGNS:Ljava/lang/String; = "campaigns"

.field public static final FILE_ALREADY_EXIST:Ljava/lang/String; = "file_already_exist"

.field protected static final FILE_NOT_FOUND_EXCEPTION:Ljava/lang/String; = "file not found exception"

.field public static final GLOBAL_ASSETS:Ljava/lang/String; = "globalAssets"

.field protected static final HTTP_EMPTY_RESPONSE:Ljava/lang/String; = "http empty response"

.field protected static final HTTP_ERROR_CODE:Ljava/lang/String; = "http error code"

.field protected static final HTTP_NOT_FOUND:Ljava/lang/String; = "http not found"

.field protected static final HTTP_OK:Ljava/lang/String; = "http ok"

.field protected static final IO_EXCEPTION:Ljava/lang/String; = "io exception"

.field protected static final MALFORMED_URL_EXCEPTION:Ljava/lang/String; = "malformed url exception"

.field static final MESSAGE_EMPTY_URL:I = 0x3ef

.field static final MESSAGE_FILE_DOWNLOAD_FAIL:I = 0x3f9

.field static final MESSAGE_FILE_DOWNLOAD_SUCCESS:I = 0x3f8

.field static final MESSAGE_FILE_NOT_FOUND_EXCEPTION:I = 0x3fa

.field static final MESSAGE_GENERAL_HTTP_ERROR_CODE:I = 0x3f3

.field static final MESSAGE_HTTP_EMPTY_RESPONSE:I = 0x3ee

.field static final MESSAGE_HTTP_NOT_FOUND:I = 0x3ed

.field static final MESSAGE_INIT_BC_FAIL:I = 0x3f6

.field static final MESSAGE_IO_EXCEPTION:I = 0x3f1

.field static final MESSAGE_MALFORMED_URL_EXCEPTION:I = 0x3ec

.field static final MESSAGE_NUM_OF_BANNERS_TO_CACHE:I = 0x3f5

.field static final MESSAGE_NUM_OF_BANNERS_TO_INIT_SUCCESS:I = 0x3f4

.field static final MESSAGE_OUT_OF_MEMORY_EXCEPTION:I = 0x3fb

.field static final MESSAGE_SOCKET_TIMEOUT_EXCEPTION:I = 0x3f0

.field static final MESSAGE_TMP_FILE_RENAME_FAILED:I = 0x3fc

.field static final MESSAGE_URI_SYNTAX_EXCEPTION:I = 0x3f2

.field static final MESSAGE_ZERO_CAMPAIGNS_TO_INIT_SUCCESS:I = 0x3f7

.field public static final NO_DISK_SPACE:Ljava/lang/String; = "no_disk_space"

.field public static final NO_NETWORK_CONNECTION:Ljava/lang/String; = "no_network_connection"

.field public static final OPERATION_TIMEOUT:I = 0x1388

.field protected static final OUT_OF_MEMORY_EXCEPTION:Ljava/lang/String; = "out of memory exception"

.field public static final SETTINGS:Ljava/lang/String; = "settings"

.field protected static final SOCKET_TIMEOUT_EXCEPTION:Ljava/lang/String; = "socket timeout exception"

.field public static final STORAGE_UNAVAILABLE:Ljava/lang/String; = "sotrage_unavailable"

.field private static final TAG:Ljava/lang/String; = "DownloadManager"

.field private static final TEMP_DIR_FOR_FILES:Ljava/lang/String; = "temp"

.field private static final TEMP_PREFIX_FOR_FILES:Ljava/lang/String; = "tmp_"

.field private static final UNABLE_TO_CREATE_FOLDER:Ljava/lang/String; = "unable_to_create_folder"

.field protected static final URI_SYNTAX_EXCEPTION:Ljava/lang/String; = "uri syntax exception"

.field public static final UTF8_CHARSET:Ljava/lang/String; = "UTF-8"

.field private static mDownloadManager:Lcom/ironsource/sdk/precache/DownloadManager;


# instance fields
.field private mCacheRootDirectory:Ljava/lang/String;

.field private mDownloadHandler:Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;

.field private mMobileControllerThread:Ljava/lang/Thread;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p1, p0, Lcom/ironsource/sdk/precache/DownloadManager;->mCacheRootDirectory:Ljava/lang/String;

    .line 90
    invoke-virtual {p0}, Lcom/ironsource/sdk/precache/DownloadManager;->getDownloadHandler()Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;

    move-result-object p1

    iput-object p1, p0, Lcom/ironsource/sdk/precache/DownloadManager;->mDownloadHandler:Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;

    .line 92
    iget-object p1, p0, Lcom/ironsource/sdk/precache/DownloadManager;->mCacheRootDirectory:Ljava/lang/String;

    const-string v0, "temp"

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/IronSourceStorageUtils;->deleteFolder(Ljava/lang/String;Ljava/lang/String;)Z

    .line 93
    iget-object p1, p0, Lcom/ironsource/sdk/precache/DownloadManager;->mCacheRootDirectory:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/IronSourceStorageUtils;->makeDir(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method static getBytes(Ljava/io/InputStream;)[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 512
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v1, 0x2000

    new-array v2, v1, [B

    :goto_0
    const/4 v3, 0x0

    .line 515
    invoke-virtual {p0, v2, v3, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_0

    .line 516
    invoke-virtual {v0, v2, v3, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 518
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 519
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method

.method public static declared-synchronized getInstance(Ljava/lang/String;)Lcom/ironsource/sdk/precache/DownloadManager;
    .locals 2

    const-class v0, Lcom/ironsource/sdk/precache/DownloadManager;

    monitor-enter v0

    .line 97
    :try_start_0
    sget-object v1, Lcom/ironsource/sdk/precache/DownloadManager;->mDownloadManager:Lcom/ironsource/sdk/precache/DownloadManager;

    if-nez v1, :cond_0

    .line 98
    new-instance v1, Lcom/ironsource/sdk/precache/DownloadManager;

    invoke-direct {v1, p0}, Lcom/ironsource/sdk/precache/DownloadManager;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/ironsource/sdk/precache/DownloadManager;->mDownloadManager:Lcom/ironsource/sdk/precache/DownloadManager;

    .line 100
    :cond_0
    sget-object p0, Lcom/ironsource/sdk/precache/DownloadManager;->mDownloadManager:Lcom/ironsource/sdk/precache/DownloadManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public downloadFile(Lcom/ironsource/sdk/data/SSAFile;)V
    .locals 4

    .line 173
    new-instance v0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;

    iget-object v1, p0, Lcom/ironsource/sdk/precache/DownloadManager;->mDownloadHandler:Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;

    iget-object v2, p0, Lcom/ironsource/sdk/precache/DownloadManager;->mCacheRootDirectory:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/ironsource/sdk/precache/DownloadManager;->getTempFilesDirectory()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;-><init>(Lcom/ironsource/sdk/data/SSAFile;Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    new-instance p1, Ljava/lang/Thread;

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public downloadMobileControllerFile(Lcom/ironsource/sdk/data/SSAFile;)V
    .locals 4

    .line 178
    new-instance v0, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;

    iget-object v1, p0, Lcom/ironsource/sdk/precache/DownloadManager;->mDownloadHandler:Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;

    iget-object v2, p0, Lcom/ironsource/sdk/precache/DownloadManager;->mCacheRootDirectory:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/ironsource/sdk/precache/DownloadManager;->getTempFilesDirectory()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/ironsource/sdk/precache/DownloadManager$SingleFileWorkerThread;-><init>(Lcom/ironsource/sdk/data/SSAFile;Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    new-instance p1, Ljava/lang/Thread;

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object p1, p0, Lcom/ironsource/sdk/precache/DownloadManager;->mMobileControllerThread:Ljava/lang/Thread;

    .line 180
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method getDownloadHandler()Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;
    .locals 1

    .line 145
    new-instance v0, Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;

    invoke-direct {v0}, Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;-><init>()V

    return-object v0
.end method

.method getTempFilesDirectory()Ljava/lang/String;
    .locals 2

    .line 508
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/ironsource/sdk/precache/DownloadManager;->mCacheRootDirectory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "temp"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isMobileControllerThreadLive()Z
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/ironsource/sdk/precache/DownloadManager;->mMobileControllerThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public declared-synchronized release()V
    .locals 2

    monitor-enter p0

    const/4 v0, 0x0

    .line 165
    :try_start_0
    sput-object v0, Lcom/ironsource/sdk/precache/DownloadManager;->mDownloadManager:Lcom/ironsource/sdk/precache/DownloadManager;

    .line 166
    iget-object v1, p0, Lcom/ironsource/sdk/precache/DownloadManager;->mDownloadHandler:Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;

    if-eqz v1, :cond_0

    .line 167
    invoke-virtual {v1}, Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;->release()V

    .line 168
    iput-object v0, p0, Lcom/ironsource/sdk/precache/DownloadManager;->mDownloadHandler:Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setOnPreCacheCompletion(Lcom/ironsource/sdk/precache/DownloadManager$OnPreCacheCompletion;)V
    .locals 1

    .line 158
    iget-object v0, p0, Lcom/ironsource/sdk/precache/DownloadManager;->mDownloadHandler:Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/precache/DownloadManager$DownloadHandler;->setOnPreCacheCompletion(Lcom/ironsource/sdk/precache/DownloadManager$OnPreCacheCompletion;)V

    return-void
.end method
