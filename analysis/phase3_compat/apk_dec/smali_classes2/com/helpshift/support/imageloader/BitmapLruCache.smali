.class Lcom/helpshift/support/imageloader/BitmapLruCache;
.super Ljava/lang/Object;
.source "BitmapLruCache.java"


# static fields
.field private static final CACHE_SIZE:I = 0x800000

.field private static final MEMORY_FRACTION:F = 0.15f

.field private static final TAG:Ljava/lang/String; = "Helpshift_BtmpLruCache"


# instance fields
.field private final cache:Landroidx/collection/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/LruCache<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 2

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v0

    long-to-float v0, v0

    const v1, 0x3e19999a    # 0.15f

    mul-float v0, v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    const/high16 v1, 0x800000

    if-lt v0, v1, :cond_0

    const/high16 v0, 0x800000

    .line 31
    :cond_0
    new-instance v1, Lcom/helpshift/support/imageloader/BitmapLruCache$1;

    invoke-direct {v1, p0, v0}, Lcom/helpshift/support/imageloader/BitmapLruCache$1;-><init>(Lcom/helpshift/support/imageloader/BitmapLruCache;I)V

    iput-object v1, p0, Lcom/helpshift/support/imageloader/BitmapLruCache;->cache:Landroidx/collection/LruCache;

    return-void
.end method

.method private maxSize()I
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/helpshift/support/imageloader/BitmapLruCache;->cache:Landroidx/collection/LruCache;

    invoke-virtual {v0}, Landroidx/collection/LruCache;->maxSize()I

    move-result v0

    return v0
.end method


# virtual methods
.method clear()V
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/helpshift/support/imageloader/BitmapLruCache;->cache:Landroidx/collection/LruCache;

    invoke-virtual {v0}, Landroidx/collection/LruCache;->evictAll()V

    return-void
.end method

.method public get(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 2

    if-eqz p1, :cond_0

    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Bitmap loaded from cache with key: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_BtmpLruCache"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    iget-object v0, p0, Lcom/helpshift/support/imageloader/BitmapLruCache;->cache:Landroidx/collection/LruCache;

    invoke-virtual {v0, p1}, Landroidx/collection/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method set(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 2

    .line 50
    invoke-static {p2}, Landroidx/core/graphics/BitmapCompat;->getAllocationByteCount(Landroid/graphics/Bitmap;)I

    move-result v0

    .line 55
    invoke-direct {p0}, Lcom/helpshift/support/imageloader/BitmapLruCache;->maxSize()I

    move-result v1

    if-le v0, v1, :cond_0

    .line 56
    iget-object p2, p0, Lcom/helpshift/support/imageloader/BitmapLruCache;->cache:Landroidx/collection/LruCache;

    invoke-virtual {p2, p1}, Landroidx/collection/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/imageloader/BitmapLruCache;->cache:Landroidx/collection/LruCache;

    invoke-virtual {v0, p1, p2}, Landroidx/collection/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
