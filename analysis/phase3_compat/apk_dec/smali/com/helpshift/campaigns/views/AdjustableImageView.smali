.class public Lcom/helpshift/campaigns/views/AdjustableImageView;
.super Landroid/widget/ImageView;
.source "AdjustableImageView.java"


# instance fields
.field mAdjustViewBounds:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 46
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private isInScrollingContainer()Z
    .locals 2

    .line 103
    invoke-virtual {p0}, Lcom/helpshift/campaigns/views/AdjustableImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 104
    :goto_0
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_1

    .line 105
    move-object v1, v0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->shouldDelayChildPressedState()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    return v0

    .line 108
    :cond_0
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 7

    .line 57
    invoke-virtual {p0}, Lcom/helpshift/campaigns/views/AdjustableImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_0

    .line 59
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    return-void

    .line 63
    :cond_0
    iget-boolean v1, p0, Lcom/helpshift/campaigns/views/AdjustableImageView;->mAdjustViewBounds:Z

    if-eqz v1, :cond_5

    .line 64
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    .line 65
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .line 66
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 67
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 68
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v4

    .line 69
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v5

    const/high16 v6, 0x40000000    # 2.0f

    if-ne v4, v6, :cond_2

    if-eq v5, v6, :cond_2

    mul-int v1, v1, v2

    .line 74
    div-int/2addr v1, v0

    .line 75
    invoke-direct {p0}, Lcom/helpshift/campaigns/views/AdjustableImageView;->isInScrollingContainer()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 76
    invoke-virtual {p0, v1, v2}, Lcom/helpshift/campaigns/views/AdjustableImageView;->setMeasuredDimension(II)V

    goto :goto_0

    .line 79
    :cond_1
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v2, v2}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/campaigns/views/AdjustableImageView;->setMeasuredDimension(II)V

    goto :goto_0

    :cond_2
    if-ne v5, v6, :cond_4

    if-eq v4, v6, :cond_4

    mul-int v0, v0, v3

    .line 85
    div-int/2addr v0, v1

    .line 86
    invoke-direct {p0}, Lcom/helpshift/campaigns/views/AdjustableImageView;->isInScrollingContainer()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 87
    invoke-virtual {p0, v3, v0}, Lcom/helpshift/campaigns/views/AdjustableImageView;->setMeasuredDimension(II)V

    goto :goto_0

    .line 90
    :cond_3
    invoke-static {v3, v3}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/campaigns/views/AdjustableImageView;->setMeasuredDimension(II)V

    goto :goto_0

    .line 94
    :cond_4
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    goto :goto_0

    .line 98
    :cond_5
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    :goto_0
    return-void
.end method

.method public setAdjustViewBounds(Z)V
    .locals 0

    .line 51
    iput-boolean p1, p0, Lcom/helpshift/campaigns/views/AdjustableImageView;->mAdjustViewBounds:Z

    .line 52
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V

    return-void
.end method
