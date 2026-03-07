.class Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;
.super Ljava/lang/Object;
.source "LoadAndDisplayImageTask.java"

# interfaces
.implements Ljava/util/concurrent/Callable;
.implements Lcom/helpshift/util/Callback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Void;",
        ">;",
        "Lcom/helpshift/util/Callback<",
        "Landroid/graphics/Bitmap;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_DisplyImgTsk"


# instance fields
.field private callback:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/helpshift/support/imageloader/ImageLoaderCallback;",
            ">;"
        }
    .end annotation
.end field

.field private future:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field private final isHardwareAccelerated:Z

.field private lruCache:Lcom/helpshift/support/imageloader/BitmapLruCache;

.field private mainThreadHandler:Landroid/os/Handler;

.field private final provider:Lcom/helpshift/support/imageloader/BitmapProvider;

.field private target:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private final width:I


# direct methods
.method constructor <init>(Lcom/helpshift/support/imageloader/BitmapProvider;IZLandroid/widget/ImageView;Lcom/helpshift/support/imageloader/ImageLoaderCallback;Lcom/helpshift/support/imageloader/BitmapLruCache;Landroid/os/Handler;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->provider:Lcom/helpshift/support/imageloader/BitmapProvider;

    .line 39
    iput p2, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->width:I

    .line 40
    iput-boolean p3, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->isHardwareAccelerated:Z

    .line 41
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->target:Ljava/lang/ref/WeakReference;

    .line 42
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p5}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->callback:Ljava/lang/ref/WeakReference;

    .line 43
    iput-object p6, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->lruCache:Lcom/helpshift/support/imageloader/BitmapLruCache;

    .line 44
    iput-object p7, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->mainThreadHandler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 22
    invoke-virtual {p0}, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->call()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public final call()Ljava/lang/Void;
    .locals 3

    .line 53
    iget-object v0, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->provider:Lcom/helpshift/support/imageloader/BitmapProvider;

    iget v1, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->width:I

    iget-boolean v2, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->isHardwareAccelerated:Z

    invoke-interface {v0, v1, v2, p0}, Lcom/helpshift/support/imageloader/BitmapProvider;->getBitmap(IZLcom/helpshift/util/Callback;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public cancel()Z
    .locals 2

    .line 68
    iget-object v0, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->future:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 69
    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public getTarget()Landroid/widget/ImageView;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    return-object v0
.end method

.method isCancelled()Z
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->future:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public bridge synthetic onFailure(Ljava/lang/Object;)V
    .locals 0

    .line 22
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->onFailure(Ljava/lang/String;)V

    return-void
.end method

.method public onFailure(Ljava/lang/String;)V
    .locals 1

    const-string v0, "Helpshift_DisplyImgTsk"

    .line 84
    invoke-static {v0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    invoke-virtual {p0}, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->cancel()Z

    return-void
.end method

.method public onSuccess(Landroid/graphics/Bitmap;)V
    .locals 4

    .line 78
    iget-object v0, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->lruCache:Lcom/helpshift/support/imageloader/BitmapLruCache;

    iget-object v1, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->provider:Lcom/helpshift/support/imageloader/BitmapProvider;

    invoke-interface {v1}, Lcom/helpshift/support/imageloader/BitmapProvider;->getSource()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/helpshift/support/imageloader/BitmapLruCache;->set(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 79
    iget-object v0, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->mainThreadHandler:Landroid/os/Handler;

    new-instance v1, Lcom/helpshift/support/imageloader/DisplayImageTask;

    iget-object v2, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->target:Ljava/lang/ref/WeakReference;

    iget-object v3, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->callback:Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1, v2, v3}, Lcom/helpshift/support/imageloader/DisplayImageTask;-><init>(Landroid/graphics/Bitmap;Ljava/lang/ref/WeakReference;Ljava/lang/ref/WeakReference;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 22
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->onSuccess(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public submit(Ljava/util/concurrent/ExecutorService;)V
    .locals 2

    .line 59
    :try_start_0
    invoke-interface {p1, p0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/imageloader/LoadAndDisplayImageTask;->future:Ljava/util/concurrent/Future;
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Helpshift_DisplyImgTsk"

    const-string v1, "Rejected execution of image loader task"

    .line 62
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
