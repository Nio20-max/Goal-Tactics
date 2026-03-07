.class Lcom/helpshift/support/widget/AdminCSATBotView$1;
.super Ljava/lang/Object;
.source "AdminCSATBotView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/widget/AdminCSATBotView;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/widget/AdminCSATBotView;


# direct methods
.method constructor <init>(Lcom/helpshift/support/widget/AdminCSATBotView;)V
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/helpshift/support/widget/AdminCSATBotView$1;->this$0:Lcom/helpshift/support/widget/AdminCSATBotView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 50
    iget-object p1, p0, Lcom/helpshift/support/widget/AdminCSATBotView$1;->this$0:Lcom/helpshift/support/widget/AdminCSATBotView;

    invoke-static {p1}, Lcom/helpshift/support/widget/AdminCSATBotView;->access$000(Lcom/helpshift/support/widget/AdminCSATBotView;)Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 51
    iget-object p1, p0, Lcom/helpshift/support/widget/AdminCSATBotView$1;->this$0:Lcom/helpshift/support/widget/AdminCSATBotView;

    invoke-static {p1}, Lcom/helpshift/support/widget/AdminCSATBotView;->access$000(Lcom/helpshift/support/widget/AdminCSATBotView;)Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;

    move-result-object p1

    iget-object v0, p0, Lcom/helpshift/support/widget/AdminCSATBotView$1;->this$0:Lcom/helpshift/support/widget/AdminCSATBotView;

    invoke-static {v0}, Lcom/helpshift/support/widget/AdminCSATBotView;->access$100(Lcom/helpshift/support/widget/AdminCSATBotView;)Landroid/widget/RatingBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/RatingBar;->getRating()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-interface {p1, v0}, Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;->sendCSATSurvey(I)V

    :cond_0
    return-void
.end method
