.class Lcom/helpshift/support/imageloader/URLBitmapProvider$1;
.super Ljava/lang/Object;
.source "URLBitmapProvider.java"

# interfaces
.implements Lcom/helpshift/downloader/SupportDownloadStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/imageloader/URLBitmapProvider;->getBitmap(IZLcom/helpshift/util/Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/imageloader/URLBitmapProvider;

.field final synthetic val$listener:Lcom/helpshift/util/Callback;

.field final synthetic val$width:I


# direct methods
.method constructor <init>(Lcom/helpshift/support/imageloader/URLBitmapProvider;Lcom/helpshift/util/Callback;I)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider$1;->this$0:Lcom/helpshift/support/imageloader/URLBitmapProvider;

    iput-object p2, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider$1;->val$listener:Lcom/helpshift/util/Callback;

    iput p3, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider$1;->val$width:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/String;I)V
    .locals 2

    .line 44
    iget-object p2, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider$1;->val$listener:Lcom/helpshift/util/Callback;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unable to load image from: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1}, Lcom/helpshift/util/Callback;->onFailure(Ljava/lang/Object;)V

    return-void
.end method

.method public onProgressChange(Ljava/lang/String;I)V
    .locals 0

    return-void
.end method

.method public onSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 49
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Image downloaded from url: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " cached at path: "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p3, "Helpshift_URLBtmpPrvdr"

    invoke-static {p3, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    iget-object p1, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider$1;->val$listener:Lcom/helpshift/util/Callback;

    iget p3, p0, Lcom/helpshift/support/imageloader/URLBitmapProvider$1;->val$width:I

    invoke-static {p2, p3}, Lcom/helpshift/util/ImageUtil;->decodeFile(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/helpshift/util/Callback;->onSuccess(Ljava/lang/Object;)V

    return-void
.end method
