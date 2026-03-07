.class public final Lcom/helpshift/support/imageloader/ImageLoader;
.super Ljava/lang/Object;
.source "ImageLoader.java"


# static fields
.field private static mInstance:Lcom/helpshift/support/imageloader/ImageLoader;


# instance fields
.field private final imageLoaderExecutor:Ljava/util/concurrent/ExecutorService;

.field private lruCache:Lcom/helpshift/support/imageloader/BitmapLruCache;

.field private final mainThreadHandler:Landroid/os/Handler;

.field private final viewToActionMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/widget/ImageView;",
            "Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/helpshift/support/imageloader/ImageLoader;->viewToActionMap:Ljava/util/Map;

    .line 38
    iput-object p1, p0, Lcom/helpshift/support/imageloader/ImageLoader;->imageLoaderExecutor:Ljava/util/concurrent/ExecutorService;

    .line 39
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/helpshift/support/imageloader/ImageLoader;->mainThreadHandler:Landroid/os/Handler;

    .line 40
    new-instance p1, Lcom/helpshift/support/imageloader/BitmapLruCache;

    invoke-direct {p1}, Lcom/helpshift/support/imageloader/BitmapLruCache;-><init>()V

    iput-object p1, p0, Lcom/helpshift/support/imageloader/ImageLoader;->lruCache:Lcom/helpshift/support/imageloader/BitmapLruCache;

    return-void
.end method

.method private cancelExistingRequest(Landroid/widget/ImageView;)V
    .locals 1

    .line 202
    iget-object v0, p0, Lcom/helpshift/support/imageloader/ImageLoader;->viewToActionMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;

    if-eqz p1, :cond_0

    .line 204
    invoke-virtual {p1}, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->cancel()Z

    :cond_0
    return-void
.end method

.method private getBitmapProvider(Ljava/lang/String;)Lcom/helpshift/support/imageloader/BitmapProvider;
    .locals 4

    if-eqz p1, :cond_2

    .line 131
    invoke-static {p1}, Lcom/helpshift/android/commons/downloader/HsUriUtils;->isValidUriPath(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    new-instance v0, Lcom/helpshift/support/imageloader/UriBitmapProvider;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/helpshift/support/imageloader/UriBitmapProvider;-><init>(Landroid/net/Uri;)V

    goto :goto_0

    .line 134
    :cond_0
    invoke-direct {p0, p1}, Lcom/helpshift/support/imageloader/ImageLoader;->isValidUrl(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 135
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getDownloader()Lcom/helpshift/downloader/SupportDownloader;

    move-result-object v0

    .line 136
    new-instance v1, Lcom/helpshift/support/imageloader/URLBitmapProvider;

    .line 137
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v2

    invoke-interface {v2}, Lcom/helpshift/CoreApi;->getDomain()Lcom/helpshift/common/domain/Domain;

    move-result-object v2

    .line 138
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object v3

    invoke-direct {v1, p1, v0, v2, v3}, Lcom/helpshift/support/imageloader/URLBitmapProvider;-><init>(Ljava/lang/String;Lcom/helpshift/downloader/SupportDownloader;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    move-object v0, v1

    goto :goto_0

    .line 141
    :cond_1
    new-instance v0, Lcom/helpshift/support/imageloader/FilePathBitmapProvider;

    invoke-direct {v0, p1}, Lcom/helpshift/support/imageloader/FilePathBitmapProvider;-><init>(Ljava/lang/String;)V

    :goto_0
    return-object v0

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public static declared-synchronized getInstance()Lcom/helpshift/support/imageloader/ImageLoader;
    .locals 10

    const-class v0, Lcom/helpshift/support/imageloader/ImageLoader;

    monitor-enter v0

    .line 220
    :try_start_0
    sget-object v1, Lcom/helpshift/support/imageloader/ImageLoader;->mInstance:Lcom/helpshift/support/imageloader/ImageLoader;

    if-nez v1, :cond_0

    .line 221
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v3, 0x1

    const/4 v4, 0x3

    const-wide/16 v5, 0xa

    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v8, Lcom/helpshift/support/imageloader/LIFOLinkedBlockingDeque;

    invoke-direct {v8}, Lcom/helpshift/support/imageloader/LIFOLinkedBlockingDeque;-><init>()V

    new-instance v9, Lcom/helpshift/common/domain/HSThreadFactory;

    const-string v2, "image-loader"

    invoke-direct {v9, v2}, Lcom/helpshift/common/domain/HSThreadFactory;-><init>(Ljava/lang/String;)V

    move-object v2, v1

    invoke-direct/range {v2 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 228
    new-instance v2, Lcom/helpshift/support/imageloader/ImageLoader;

    invoke-direct {v2, v1}, Lcom/helpshift/support/imageloader/ImageLoader;-><init>(Ljava/util/concurrent/ExecutorService;)V

    sput-object v2, Lcom/helpshift/support/imageloader/ImageLoader;->mInstance:Lcom/helpshift/support/imageloader/ImageLoader;

    .line 230
    :cond_0
    sget-object v1, Lcom/helpshift/support/imageloader/ImageLoader;->mInstance:Lcom/helpshift/support/imageloader/ImageLoader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private isValidUrl(Ljava/lang/String;)Z
    .locals 1

    .line 183
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "https://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "http://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private loadBitmap(Ljava/lang/String;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;Lcom/helpshift/support/imageloader/ImageLoaderCallback;I)V
    .locals 8

    .line 156
    invoke-direct {p0, p2}, Lcom/helpshift/support/imageloader/ImageLoader;->cancelExistingRequest(Landroid/widget/ImageView;)V

    if-eqz p3, :cond_0

    .line 158
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    if-nez p1, :cond_1

    return-void

    .line 163
    :cond_1
    iget-object p3, p0, Lcom/helpshift/support/imageloader/ImageLoader;->lruCache:Lcom/helpshift/support/imageloader/BitmapLruCache;

    invoke-virtual {p3, p1}, Lcom/helpshift/support/imageloader/BitmapLruCache;->get(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p3

    if-eqz p3, :cond_3

    .line 165
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    if-eqz p4, :cond_2

    .line 167
    invoke-interface {p4}, Lcom/helpshift/support/imageloader/ImageLoaderCallback;->onSuccess()V

    :cond_2
    return-void

    .line 171
    :cond_3
    invoke-direct {p0, p1}, Lcom/helpshift/support/imageloader/ImageLoader;->getBitmapProvider(Ljava/lang/String;)Lcom/helpshift/support/imageloader/BitmapProvider;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 173
    new-instance p1, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;

    .line 174
    invoke-virtual {p2}, Landroid/widget/ImageView;->isHardwareAccelerated()Z

    move-result v3

    iget-object v6, p0, Lcom/helpshift/support/imageloader/ImageLoader;->lruCache:Lcom/helpshift/support/imageloader/BitmapLruCache;

    iget-object v7, p0, Lcom/helpshift/support/imageloader/ImageLoader;->mainThreadHandler:Landroid/os/Handler;

    move-object v0, p1

    move v2, p5

    move-object v4, p2

    move-object v5, p4

    invoke-direct/range {v0 .. v7}, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;-><init>(Lcom/helpshift/support/imageloader/BitmapProvider;IZLandroid/widget/ImageView;Lcom/helpshift/support/imageloader/ImageLoaderCallback;Lcom/helpshift/support/imageloader/BitmapLruCache;Landroid/os/Handler;)V

    .line 176
    iget-object p3, p0, Lcom/helpshift/support/imageloader/ImageLoader;->viewToActionMap:Ljava/util/Map;

    invoke-interface {p3, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    iget-object p2, p0, Lcom/helpshift/support/imageloader/ImageLoader;->imageLoaderExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {p1, p2}, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->submit(Ljava/util/concurrent/ExecutorService;)V

    :cond_4
    return-void
.end method


# virtual methods
.method public cancelAll()V
    .locals 2

    .line 212
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/helpshift/support/imageloader/ImageLoader;->viewToActionMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 213
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;

    .line 214
    invoke-virtual {v1}, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->getTarget()Landroid/widget/ImageView;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/helpshift/support/imageloader/ImageLoader;->cancelExistingRequest(Landroid/widget/ImageView;)V

    goto :goto_0

    .line 216
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/imageloader/ImageLoader;->viewToActionMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method public destroy()V
    .locals 1

    .line 190
    invoke-virtual {p0}, Lcom/helpshift/support/imageloader/ImageLoader;->cancelAll()V

    .line 191
    iget-object v0, p0, Lcom/helpshift/support/imageloader/ImageLoader;->lruCache:Lcom/helpshift/support/imageloader/BitmapLruCache;

    invoke-virtual {v0}, Lcom/helpshift/support/imageloader/BitmapLruCache;->clear()V

    .line 192
    iget-object v0, p0, Lcom/helpshift/support/imageloader/ImageLoader;->imageLoaderExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    const/4 v0, 0x0

    .line 193
    sput-object v0, Lcom/helpshift/support/imageloader/ImageLoader;->mInstance:Lcom/helpshift/support/imageloader/ImageLoader;

    return-void
.end method

.method public load(Ljava/lang/String;Landroid/widget/ImageView;)V
    .locals 1

    const/4 v0, 0x0

    .line 50
    invoke-virtual {p0, p1, p2, v0}, Lcom/helpshift/support/imageloader/ImageLoader;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V
    .locals 1

    const/4 v0, 0x0

    .line 61
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/helpshift/support/imageloader/ImageLoader;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;Lcom/helpshift/support/imageloader/ImageLoaderCallback;)V

    return-void
.end method

.method public load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;ILcom/helpshift/support/imageloader/ImageLoaderCallback;)V
    .locals 6

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p5

    move v5, p4

    .line 92
    invoke-direct/range {v0 .. v5}, Lcom/helpshift/support/imageloader/ImageLoader;->loadBitmap(Ljava/lang/String;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;Lcom/helpshift/support/imageloader/ImageLoaderCallback;I)V

    return-void
.end method

.method public load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;Lcom/helpshift/support/imageloader/ImageLoaderCallback;)V
    .locals 6

    .line 75
    invoke-virtual {p2}, Landroid/widget/ImageView;->getWidth()I

    move-result v4

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/helpshift/support/imageloader/ImageLoader;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;ILcom/helpshift/support/imageloader/ImageLoaderCallback;)V

    return-void
.end method

.method public loadImageWithoutSampling(Ljava/lang/String;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;I)V
    .locals 8

    .line 103
    invoke-direct {p0, p2}, Lcom/helpshift/support/imageloader/ImageLoader;->cancelExistingRequest(Landroid/widget/ImageView;)V

    if-eqz p3, :cond_0

    .line 105
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    if-nez p1, :cond_1

    return-void

    .line 110
    :cond_1
    iget-object p3, p0, Lcom/helpshift/support/imageloader/ImageLoader;->lruCache:Lcom/helpshift/support/imageloader/BitmapLruCache;

    invoke-virtual {p3, p1}, Lcom/helpshift/support/imageloader/BitmapLruCache;->get(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p3

    if-eqz p3, :cond_2

    .line 112
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void

    .line 115
    :cond_2
    new-instance v1, Lcom/helpshift/support/imageloader/AvatarFilePathBitmapProvider;

    invoke-direct {v1, p1}, Lcom/helpshift/support/imageloader/AvatarFilePathBitmapProvider;-><init>(Ljava/lang/String;)V

    .line 117
    new-instance p1, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;

    .line 118
    invoke-virtual {p2}, Landroid/widget/ImageView;->isHardwareAccelerated()Z

    move-result v3

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/helpshift/support/imageloader/ImageLoader;->lruCache:Lcom/helpshift/support/imageloader/BitmapLruCache;

    iget-object v7, p0, Lcom/helpshift/support/imageloader/ImageLoader;->mainThreadHandler:Landroid/os/Handler;

    move-object v0, p1

    move v2, p4

    move-object v4, p2

    invoke-direct/range {v0 .. v7}, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;-><init>(Lcom/helpshift/support/imageloader/BitmapProvider;IZLandroid/widget/ImageView;Lcom/helpshift/support/imageloader/ImageLoaderCallback;Lcom/helpshift/support/imageloader/BitmapLruCache;Landroid/os/Handler;)V

    .line 120
    iget-object p3, p0, Lcom/helpshift/support/imageloader/ImageLoader;->viewToActionMap:Ljava/util/Map;

    invoke-interface {p3, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    iget-object p2, p0, Lcom/helpshift/support/imageloader/ImageLoader;->imageLoaderExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {p1, p2}, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->submit(Ljava/util/concurrent/ExecutorService;)V

    return-void
.end method
