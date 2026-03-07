.class Lcom/helpshift/support/imageloader/DisplayImageTask;
.super Ljava/lang/Object;
.source "DisplayImageTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private bitmap:Landroid/graphics/Bitmap;

.field private callback:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/helpshift/support/imageloader/ImageLoaderCallback;",
            ">;"
        }
    .end annotation
.end field

.field private target:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/graphics/Bitmap;Ljava/lang/ref/WeakReference;Ljava/lang/ref/WeakReference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/ImageView;",
            ">;",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/helpshift/support/imageloader/ImageLoaderCallback;",
            ">;)V"
        }
    .end annotation

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/helpshift/support/imageloader/DisplayImageTask;->bitmap:Landroid/graphics/Bitmap;

    .line 19
    iput-object p2, p0, Lcom/helpshift/support/imageloader/DisplayImageTask;->target:Ljava/lang/ref/WeakReference;

    .line 20
    iput-object p3, p0, Lcom/helpshift/support/imageloader/DisplayImageTask;->callback:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 25
    iget-object v0, p0, Lcom/helpshift/support/imageloader/DisplayImageTask;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/support/imageloader/DisplayImageTask;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 26
    iget-object v0, p0, Lcom/helpshift/support/imageloader/DisplayImageTask;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/helpshift/support/imageloader/DisplayImageTask;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/imageloader/DisplayImageTask;->callback:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 29
    iget-object v0, p0, Lcom/helpshift/support/imageloader/DisplayImageTask;->callback:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/imageloader/ImageLoaderCallback;

    invoke-interface {v0}, Lcom/helpshift/support/imageloader/ImageLoaderCallback;->onSuccess()V

    :cond_1
    return-void
.end method
