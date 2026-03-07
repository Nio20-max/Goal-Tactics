.class Lcom/helpshift/support/imageloader/FilePathBitmapProvider;
.super Ljava/lang/Object;
.source "FilePathBitmapProvider.java"

# interfaces
.implements Lcom/helpshift/support/imageloader/BitmapProvider;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_FilePthPrvdr"


# instance fields
.field private path:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/helpshift/support/imageloader/FilePathBitmapProvider;->path:Ljava/lang/String;

    return-void
.end method

.method private static getExifRotation(Ljava/lang/String;)I
    .locals 3

    const/4 v0, 0x0

    .line 74
    :try_start_0
    invoke-static {p0}, Lcom/helpshift/util/AndroidFileUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    const-string v2, "jpeg"

    .line 75
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 76
    new-instance v1, Landroid/media/ExifInterface;

    invoke-direct {v1, p0}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    const-string p0, "Orientation"

    const/4 v2, 0x1

    .line 77
    invoke-virtual {v1, p0, v2}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x6

    if-ne p0, v1, :cond_0

    const/16 p0, 0x5a

    return p0

    :cond_0
    const/4 v1, 0x3

    if-ne p0, v1, :cond_1

    const/16 p0, 0xb4

    return p0

    :cond_1
    const/16 v1, 0x8

    if-ne p0, v1, :cond_2

    const/16 p0, 0x10e

    return p0

    :cond_2
    return v0

    :catch_0
    move-exception p0

    const-string v1, ""

    const-string v2, "Exception in getting exif rotation"

    .line 94
    invoke-static {v1, v2, p0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3
    return v0
.end method


# virtual methods
.method protected decodeFile(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .locals 0

    .line 61
    invoke-static {p1, p2}, Lcom/helpshift/util/ImageUtil;->decodeFile(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method public getBitmap(IZLcom/helpshift/util/Callback;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ",
            "Lcom/helpshift/util/Callback<",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 29
    iget-object p2, p0, Lcom/helpshift/support/imageloader/FilePathBitmapProvider;->path:Ljava/lang/String;

    invoke-virtual {p0, p2, p1}, Lcom/helpshift/support/imageloader/FilePathBitmapProvider;->decodeFile(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 39
    iget-object p1, p0, Lcom/helpshift/support/imageloader/FilePathBitmapProvider;->path:Ljava/lang/String;

    invoke-static {p1}, Lcom/helpshift/support/imageloader/FilePathBitmapProvider;->getExifRotation(Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_0

    .line 41
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    int-to-float p1, p1

    .line 42
    invoke-virtual {v5, p1}, Landroid/graphics/Matrix;->preRotate(F)Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 44
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x0

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 46
    :cond_0
    invoke-interface {p3, v0}, Lcom/helpshift/util/Callback;->onSuccess(Ljava/lang/Object;)V

    .line 47
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Image loaded from filepath: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/helpshift/support/imageloader/FilePathBitmapProvider;->path:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Helpshift_FilePthPrvdr"

    invoke-static {p2, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 50
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Error in creating bitmap for given file path: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/helpshift/support/imageloader/FilePathBitmapProvider;->path:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p3, p1}, Lcom/helpshift/util/Callback;->onFailure(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public getSource()Ljava/lang/String;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/helpshift/support/imageloader/FilePathBitmapProvider;->path:Ljava/lang/String;

    return-object v0
.end method
