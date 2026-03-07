.class Lcom/helpshift/support/imageloader/UriBitmapProvider;
.super Ljava/lang/Object;
.source "UriBitmapProvider.java"

# interfaces
.implements Lcom/helpshift/support/imageloader/BitmapProvider;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_UriBtmpPrvdr"


# instance fields
.field private fileUri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Landroid/net/Uri;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/helpshift/support/imageloader/UriBitmapProvider;->fileUri:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public getBitmap(IZLcom/helpshift/util/Callback;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ",
            "Lcom/helpshift/util/Callback<",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 36
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 39
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/support/imageloader/UriBitmapProvider;->fileUri:Landroid/net/Uri;

    invoke-static {v0, v1}, Landroid/graphics/ImageDecoder;->createSource(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/ImageDecoder$Source;

    move-result-object v0

    .line 40
    new-instance v1, Lcom/helpshift/support/imageloader/UriBitmapProvider$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/helpshift/support/imageloader/UriBitmapProvider$1;-><init>(Lcom/helpshift/support/imageloader/UriBitmapProvider;IZ)V

    const-string p1, "Helpshift_UriBtmpPrvdr"

    .line 74
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Image downloaded from file URI: "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/helpshift/support/imageloader/UriBitmapProvider;->fileUri:Landroid/net/Uri;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    invoke-static {v0, v1}, Landroid/graphics/ImageDecoder;->decodeBitmap(Landroid/graphics/ImageDecoder$Source;Landroid/graphics/ImageDecoder$OnHeaderDecodedListener;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-interface {p3, p1}, Lcom/helpshift/util/Callback;->onSuccess(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 79
    :catch_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Error while building bitmap from uri: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/helpshift/support/imageloader/UriBitmapProvider;->fileUri:Landroid/net/Uri;

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p3, p1}, Lcom/helpshift/util/Callback;->onFailure(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public getSource()Ljava/lang/String;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/helpshift/support/imageloader/UriBitmapProvider;->fileUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
