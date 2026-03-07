.class Lcom/helpshift/support/imageloader/UriBitmapProvider$1;
.super Ljava/lang/Object;
.source "UriBitmapProvider.java"

# interfaces
.implements Landroid/graphics/ImageDecoder$OnHeaderDecodedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/imageloader/UriBitmapProvider;->getBitmap(IZLcom/helpshift/util/Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/imageloader/UriBitmapProvider;

.field final synthetic val$isHardwareAccelerated:Z

.field final synthetic val$width:I


# direct methods
.method constructor <init>(Lcom/helpshift/support/imageloader/UriBitmapProvider;IZ)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/helpshift/support/imageloader/UriBitmapProvider$1;->this$0:Lcom/helpshift/support/imageloader/UriBitmapProvider;

    iput p2, p0, Lcom/helpshift/support/imageloader/UriBitmapProvider$1;->val$width:I

    iput-boolean p3, p0, Lcom/helpshift/support/imageloader/UriBitmapProvider$1;->val$isHardwareAccelerated:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHeaderDecoded(Landroid/graphics/ImageDecoder;Landroid/graphics/ImageDecoder$ImageInfo;Landroid/graphics/ImageDecoder$Source;)V
    .locals 3

    .line 46
    invoke-virtual {p2}, Landroid/graphics/ImageDecoder$ImageInfo;->getSize()Landroid/util/Size;

    move-result-object p2

    .line 47
    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    move-result p3

    .line 48
    invoke-virtual {p2}, Landroid/util/Size;->getHeight()I

    move-result p2

    .line 51
    iget v0, p0, Lcom/helpshift/support/imageloader/UriBitmapProvider$1;->val$width:I

    const/4 v1, 0x4

    if-lez v0, :cond_1

    if-lez p3, :cond_1

    if-lez p2, :cond_1

    .line 52
    invoke-static {p3, p2, v0}, Lcom/helpshift/util/ImageUtil;->calculateReqHeight(III)I

    move-result v0

    .line 53
    iget v2, p0, Lcom/helpshift/support/imageloader/UriBitmapProvider$1;->val$width:I

    .line 54
    invoke-static {p3, p2, v2, v0}, Lcom/helpshift/util/ImageUtil;->calculateInSampleSize(IIII)I

    move-result p2

    if-ge p2, v1, :cond_0

    add-int/lit8 p2, p2, 0x1

    :cond_0
    move v1, p2

    .line 68
    :cond_1
    iget-boolean p2, p0, Lcom/helpshift/support/imageloader/UriBitmapProvider$1;->val$isHardwareAccelerated:Z

    if-nez p2, :cond_2

    const/4 p2, 0x1

    .line 69
    invoke-virtual {p1, p2}, Landroid/graphics/ImageDecoder;->setAllocator(I)V

    .line 71
    :cond_2
    invoke-virtual {p1, v1}, Landroid/graphics/ImageDecoder;->setTargetSampleSize(I)V

    return-void
.end method
