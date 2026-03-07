.class final Lcom/helpshift/util/HSLinkify$3;
.super Landroid/text/style/URLSpan;
.source "HSLinkify.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/util/HSLinkify;->getURLSpanWithClickListener(Ljava/lang/String;Lcom/helpshift/util/HSLinkify$LinkClickListener;)Landroid/text/style/URLSpan;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$linkClickListener:Lcom/helpshift/util/HSLinkify$LinkClickListener;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/helpshift/util/HSLinkify$LinkClickListener;Ljava/lang/String;)V
    .locals 0

    .line 475
    iput-object p2, p0, Lcom/helpshift/util/HSLinkify$3;->val$linkClickListener:Lcom/helpshift/util/HSLinkify$LinkClickListener;

    iput-object p3, p0, Lcom/helpshift/util/HSLinkify$3;->val$url:Ljava/lang/String;

    invoke-direct {p0, p1}, Landroid/text/style/URLSpan;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 480
    :try_start_0
    invoke-super {p0, p1}, Landroid/text/style/URLSpan;->onClick(Landroid/view/View;)V

    .line 483
    iget-object p1, p0, Lcom/helpshift/util/HSLinkify$3;->val$linkClickListener:Lcom/helpshift/util/HSLinkify$LinkClickListener;

    if-eqz p1, :cond_0

    .line 484
    iget-object v0, p0, Lcom/helpshift/util/HSLinkify$3;->val$url:Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/helpshift/util/HSLinkify$LinkClickListener;->onLinkClicked(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Helpshift_HSlnkfy"

    const-string v1, "Error in handling link click."

    .line 488
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 489
    iget-object p1, p0, Lcom/helpshift/util/HSLinkify$3;->val$linkClickListener:Lcom/helpshift/util/HSLinkify$LinkClickListener;

    if-eqz p1, :cond_0

    .line 490
    invoke-interface {p1}, Lcom/helpshift/util/HSLinkify$LinkClickListener;->onLinkClickFailed()V

    :cond_0
    :goto_0
    return-void
.end method
