.class public Lcom/helpshift/util/AttachmentDataProvider;
.super Ljava/lang/Object;
.source "AttachmentDataProvider.java"


# static fields
.field public static final PICK_ATTACHMENT_REQUEST_ID:I = 0x1

.field public static final PICK_ATTACHMENT_WITHOUT_PERMISSIONS_REQUEST_ID:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getIntentForAttachmentType(Landroid/content/Context;IILjava/util/List;)Landroid/content/Intent;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "II",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 34
    invoke-static {p0, p2}, Lcom/helpshift/util/AttachmentDataProvider;->getIntentForImage(Landroid/content/Context;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    .line 37
    invoke-static {p0, p2}, Lcom/helpshift/util/AttachmentDataProvider;->getIntentForVideo(Landroid/content/Context;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 p0, 0x3

    if-ne p1, p0, :cond_2

    .line 40
    invoke-static {p2, p3}, Lcom/helpshift/util/AttachmentDataProvider;->getIntentForDocument(ILjava/util/List;)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getIntentForDocument(ILjava/util/List;)Landroid/content/Intent;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    const/16 v0, 0x13

    const-string v1, "android.intent.extra.LOCAL_ONLY"

    const-string v2, "*/*"

    const/4 v3, 0x1

    const/4 v4, 0x2

    if-ne p0, v4, :cond_0

    .line 48
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p0, v0, :cond_0

    .line 50
    new-instance p0, Landroid/content/Intent;

    const-string v4, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {p0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 51
    invoke-virtual {p0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 52
    invoke-virtual {p0, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 53
    invoke-virtual {p0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    goto :goto_0

    .line 56
    :cond_0
    new-instance p0, Landroid/content/Intent;

    const-string v4, "android.intent.action.GET_CONTENT"

    invoke-direct {p0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 57
    invoke-virtual {p0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 58
    invoke-virtual {p0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 60
    :goto_0
    invoke-static {p1}, Lcom/helpshift/util/AttachmentDataProvider;->getMIMEForDocument(Ljava/util/List;)Ljava/util/Set;

    move-result-object p1

    .line 61
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v0, :cond_2

    .line 62
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 64
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 65
    aput-object v2, v0, v1

    add-int/2addr v1, v3

    goto :goto_1

    :cond_1
    const-string p1, "android.intent.extra.MIME_TYPES"

    .line 68
    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2

    :cond_2
    const-string v0, "|"

    .line 72
    invoke-static {v0, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    :goto_2
    return-object p0
.end method

.method private static getIntentForImage(Landroid/content/Context;I)Landroid/content/Intent;
    .locals 2

    .line 78
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v1, "image/*"

    invoke-static {p0, v1, v0, p1}, Lcom/helpshift/util/AttachmentDataProvider;->getIntentForMedia(Landroid/content/Context;Ljava/lang/String;Landroid/net/Uri;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private static getIntentForMedia(Landroid/content/Context;Ljava/lang/String;Landroid/net/Uri;I)Landroid/content/Intent;
    .locals 3

    const-string v0, "android.intent.extra.LOCAL_ONLY"

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-ne p3, v2, :cond_0

    .line 87
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt p3, v2, :cond_0

    .line 89
    new-instance p0, Landroid/content/Intent;

    const-string p2, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {p0, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 90
    invoke-virtual {p0, p1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 91
    invoke-virtual {p0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 92
    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    goto :goto_0

    .line 95
    :cond_0
    new-instance p3, Landroid/content/Intent;

    const-string v2, "android.intent.action.PICK"

    invoke-direct {p3, v2, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 97
    invoke-virtual {p3, p2, p1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 98
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    invoke-virtual {p3, p0}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object p0

    if-nez p0, :cond_1

    .line 99
    new-instance p0, Landroid/content/Intent;

    const-string p2, "android.intent.action.GET_CONTENT"

    invoke-direct {p0, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 100
    invoke-virtual {p0, p1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 101
    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    goto :goto_0

    :cond_1
    move-object p0, p3

    :goto_0
    return-object p0
.end method

.method private static getIntentForVideo(Landroid/content/Context;I)Landroid/content/Intent;
    .locals 2

    .line 82
    sget-object v0, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v1, "video/*"

    invoke-static {p0, v1, v0, p1}, Lcom/helpshift/util/AttachmentDataProvider;->getIntentForMedia(Landroid/content/Context;Ljava/lang/String;Landroid/net/Uri;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private static getMIMEForDocument(Ljava/util/List;)Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 108
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 109
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "image/"

    .line 111
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "video/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 113
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const-string p0, "application/octet-stream"

    .line 118
    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
