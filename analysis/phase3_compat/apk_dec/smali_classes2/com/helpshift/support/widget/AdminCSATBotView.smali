.class public Lcom/helpshift/support/widget/AdminCSATBotView;
.super Landroid/widget/RelativeLayout;
.source "AdminCSATBotView.java"

# interfaces
.implements Landroid/widget/RatingBar$OnRatingBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;
    }
.end annotation


# instance fields
.field private adminCSATBotListener:Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;

.field private ratingBar:Landroid/widget/RatingBar;

.field private sendFeedbackButton:Lcom/helpshift/views/HSButton;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 21
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lcom/helpshift/support/widget/AdminCSATBotView;->adminCSATBotListener:Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;

    .line 22
    invoke-direct {p0, p1}, Lcom/helpshift/support/widget/AdminCSATBotView;->initView(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 18
    iput-object p2, p0, Lcom/helpshift/support/widget/AdminCSATBotView;->adminCSATBotListener:Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;

    .line 27
    invoke-direct {p0, p1}, Lcom/helpshift/support/widget/AdminCSATBotView;->initView(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 18
    iput-object p2, p0, Lcom/helpshift/support/widget/AdminCSATBotView;->adminCSATBotListener:Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;

    .line 32
    invoke-direct {p0, p1}, Lcom/helpshift/support/widget/AdminCSATBotView;->initView(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/support/widget/AdminCSATBotView;)Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;
    .locals 0

    .line 13
    iget-object p0, p0, Lcom/helpshift/support/widget/AdminCSATBotView;->adminCSATBotListener:Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/helpshift/support/widget/AdminCSATBotView;)Landroid/widget/RatingBar;
    .locals 0

    .line 13
    iget-object p0, p0, Lcom/helpshift/support/widget/AdminCSATBotView;->ratingBar:Landroid/widget/RatingBar;

    return-object p0
.end method

.method private initView(Landroid/content/Context;)V
    .locals 1

    .line 36
    sget v0, Lcom/helpshift/R$layout;->hs__csat_bot_view:I

    invoke-static {p1, v0, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    return-void
.end method


# virtual methods
.method protected onFinishInflate()V
    .locals 2

    .line 41
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    .line 42
    sget v0, Lcom/helpshift/R$id;->ratingBar:I

    invoke-virtual {p0, v0}, Lcom/helpshift/support/widget/AdminCSATBotView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RatingBar;

    iput-object v0, p0, Lcom/helpshift/support/widget/AdminCSATBotView;->ratingBar:Landroid/widget/RatingBar;

    .line 43
    sget v0, Lcom/helpshift/R$id;->csat_sendfeedback_btn:I

    invoke-virtual {p0, v0}, Lcom/helpshift/support/widget/AdminCSATBotView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/helpshift/views/HSButton;

    iput-object v0, p0, Lcom/helpshift/support/widget/AdminCSATBotView;->sendFeedbackButton:Lcom/helpshift/views/HSButton;

    .line 44
    invoke-virtual {p0}, Lcom/helpshift/support/widget/AdminCSATBotView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/support/widget/AdminCSATBotView;->ratingBar:Landroid/widget/RatingBar;

    invoke-virtual {v1}, Landroid/widget/RatingBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/helpshift/support/util/Styles;->setAccentColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V

    .line 45
    iget-object v0, p0, Lcom/helpshift/support/widget/AdminCSATBotView;->ratingBar:Landroid/widget/RatingBar;

    invoke-virtual {v0, p0}, Landroid/widget/RatingBar;->setOnRatingBarChangeListener(Landroid/widget/RatingBar$OnRatingBarChangeListener;)V

    .line 47
    iget-object v0, p0, Lcom/helpshift/support/widget/AdminCSATBotView;->sendFeedbackButton:Lcom/helpshift/views/HSButton;

    new-instance v1, Lcom/helpshift/support/widget/AdminCSATBotView$1;

    invoke-direct {v1, p0}, Lcom/helpshift/support/widget/AdminCSATBotView$1;-><init>(Lcom/helpshift/support/widget/AdminCSATBotView;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/views/HSButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onRatingChanged(Landroid/widget/RatingBar;FZ)V
    .locals 0

    if-eqz p3, :cond_1

    .line 59
    iget-object p3, p0, Lcom/helpshift/support/widget/AdminCSATBotView;->adminCSATBotListener:Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;

    if-eqz p3, :cond_1

    .line 60
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    const/4 p3, 0x1

    if-ge p2, p3, :cond_0

    const/high16 p2, 0x3f800000    # 1.0f

    .line 63
    invoke-virtual {p1, p2}, Landroid/widget/RatingBar;->setRating(F)V

    const/4 p2, 0x1

    .line 66
    :cond_0
    iget-object p1, p0, Lcom/helpshift/support/widget/AdminCSATBotView;->adminCSATBotListener:Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;

    invoke-interface {p1, p2}, Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;->onRatingChanged(I)V

    :cond_1
    return-void
.end method

.method public reset()V
    .locals 2

    .line 80
    iget-object v0, p0, Lcom/helpshift/support/widget/AdminCSATBotView;->sendFeedbackButton:Lcom/helpshift/views/HSButton;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/helpshift/views/HSButton;->setVisibility(I)V

    .line 81
    iget-object v0, p0, Lcom/helpshift/support/widget/AdminCSATBotView;->ratingBar:Landroid/widget/RatingBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RatingBar;->setRating(F)V

    return-void
.end method

.method public setAdminCSATBotListener(Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;)V
    .locals 0

    .line 71
    iput-object p1, p0, Lcom/helpshift/support/widget/AdminCSATBotView;->adminCSATBotListener:Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;

    .line 76
    invoke-interface {p1}, Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;->onCSATSurveyRequested()V

    return-void
.end method
