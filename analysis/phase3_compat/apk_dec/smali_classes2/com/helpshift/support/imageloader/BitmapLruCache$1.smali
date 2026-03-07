.class Lcom/helpshift/support/imageloader/BitmapLruCache$1;
.super Landroidx/collection/LruCache;
.source "BitmapLruCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/imageloader/BitmapLruCache;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/collection/LruCache<",
        "Ljava/lang/String;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/imageloader/BitmapLruCache;


# direct methods
.method constructor <init>(Lcom/helpshift/support/imageloader/BitmapLruCache;I)V
    .locals 0

    .line 31
    iput-object p1, p0, Lcom/helpshift/support/imageloader/BitmapLruCache$1;->this$0:Lcom/helpshift/support/imageloader/BitmapLruCache;

    invoke-direct {p0, p2}, Landroidx/collection/LruCache;-><init>(I)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 31
    check-cast p1, Ljava/lang/String;

    check-cast p2, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/support/imageloader/BitmapLruCache$1;->sizeOf(Ljava/lang/String;Landroid/graphics/Bitmap;)I

    move-result p1

    return p1
.end method

.method protected sizeOf(Ljava/lang/String;Landroid/graphics/Bitmap;)I
    .locals 0

    .line 34
    invoke-static {p2}, Landroidx/core/graphics/BitmapCompat;->getAllocationByteCount(Landroid/graphics/Bitmap;)I

    move-result p1

    return p1
.end method
