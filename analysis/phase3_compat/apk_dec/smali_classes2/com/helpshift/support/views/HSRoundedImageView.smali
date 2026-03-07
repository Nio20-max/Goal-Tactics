.class public Lcom/helpshift/support/views/HSRoundedImageView;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "HSRoundedImageView.java"


# instance fields
.field private SCALE_TYPE:Landroid/widget/ImageView$ScaleType;

.field private backgroundPaint:Landroid/graphics/Paint;

.field private bitmapPaint:Landroid/graphics/Paint;

.field private bitmapShader:Landroid/graphics/BitmapShader;

.field private borderPaint:Landroid/graphics/Paint;

.field private borderRect:Landroid/graphics/RectF;

.field private borderWidth:F

.field private cornerRadius:F

.field private drawableRect:Landroid/graphics/RectF;

.field private imageBitmap:Landroid/graphics/Bitmap;

.field private final shaderMatrix:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 69
    invoke-direct {p0, p1, p2, v0}, Lcom/helpshift/support/views/HSRoundedImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 73
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 55
    new-instance p3, Landroid/graphics/Matrix;

    invoke-direct {p3}, Landroid/graphics/Matrix;-><init>()V

    iput-object p3, p0, Lcom/helpshift/support/views/HSRoundedImageView;->shaderMatrix:Landroid/graphics/Matrix;

    .line 56
    sget-object p3, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    iput-object p3, p0, Lcom/helpshift/support/views/HSRoundedImageView;->SCALE_TYPE:Landroid/widget/ImageView$ScaleType;

    .line 58
    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Lcom/helpshift/support/views/HSRoundedImageView;->drawableRect:Landroid/graphics/RectF;

    .line 59
    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderRect:Landroid/graphics/RectF;

    .line 76
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    sget-object p3, Lcom/helpshift/R$styleable;->HSRoundedImageView:[I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, p3, v0, v0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 79
    sget p2, Lcom/helpshift/R$styleable;->HSRoundedImageView_hs__borderColor:I

    const/4 p3, -0x1

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    .line 80
    sget v0, Lcom/helpshift/R$styleable;->HSRoundedImageView_hs__backgroundColor:I

    invoke-virtual {p1, v0, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    .line 81
    sget v1, Lcom/helpshift/R$styleable;->HSRoundedImageView_hs__borderWidth:I

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    iput v1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderWidth:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    .line 83
    iput v2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderWidth:F

    .line 87
    :cond_0
    sget v1, Lcom/helpshift/R$styleable;->HSRoundedImageView_hs__cornerRadius:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    iput v1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->cornerRadius:F

    .line 89
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 92
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->bitmapPaint:Landroid/graphics/Paint;

    .line 93
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 94
    iget-object p1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->bitmapPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 97
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderPaint:Landroid/graphics/Paint;

    .line 98
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 99
    iget-object p1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 100
    iget-object p1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 101
    iget-object p1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderPaint:Landroid/graphics/Paint;

    iget p2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderWidth:F

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    if-eq v0, p3, :cond_1

    .line 106
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->backgroundPaint:Landroid/graphics/Paint;

    .line 107
    sget-object p2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 108
    iget-object p1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->backgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 109
    iget-object p1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->backgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    :cond_1
    return-void
.end method

.method private setup()V
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/helpshift/support/views/HSRoundedImageView;->imageBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 136
    invoke-direct {p0, v0}, Lcom/helpshift/support/views/HSRoundedImageView;->updateGlobalParamsAndBitmapShader(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 139
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/views/HSRoundedImageView;->invalidate()V

    :goto_0
    return-void
.end method

.method private updateGlobalParamsAndBitmapShader(Landroid/graphics/Bitmap;)V
    .locals 6

    if-eqz p1, :cond_0

    .line 144
    invoke-virtual {p0}, Lcom/helpshift/support/views/HSRoundedImageView;->getWidth()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/helpshift/support/views/HSRoundedImageView;->getHeight()I

    move-result v0

    if-lez v0, :cond_0

    .line 145
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    .line 146
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 149
    iget-object v2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderRect:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/helpshift/support/views/HSRoundedImageView;->getWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p0}, Lcom/helpshift/support/views/HSRoundedImageView;->getHeight()I

    move-result v4

    int-to-float v4, v4

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 150
    iget-object v2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->drawableRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderRect:Landroid/graphics/RectF;

    invoke-virtual {v2, v3}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 153
    iget-object v2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderRect:Landroid/graphics/RectF;

    iget v3, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderWidth:F

    const/high16 v4, 0x40000000    # 2.0f

    div-float v5, v3, v4

    div-float/2addr v3, v4

    invoke-virtual {v2, v5, v3}, Landroid/graphics/RectF;->inset(FF)V

    .line 154
    iget-object v2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->drawableRect:Landroid/graphics/RectF;

    iget v3, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderWidth:F

    invoke-virtual {v2, v3, v3}, Landroid/graphics/RectF;->inset(FF)V

    .line 155
    new-instance v2, Landroid/graphics/BitmapShader;

    sget-object v3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v4, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v2, p1, v3, v4}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->bitmapShader:Landroid/graphics/BitmapShader;

    .line 159
    invoke-direct {p0, v2, v0, v1}, Lcom/helpshift/support/views/HSRoundedImageView;->updateShaderMatrix(Landroid/graphics/BitmapShader;II)V

    .line 160
    invoke-virtual {p0}, Lcom/helpshift/support/views/HSRoundedImageView;->invalidate()V

    :cond_0
    return-void
.end method

.method private updateShaderMatrix(Landroid/graphics/BitmapShader;II)V
    .locals 3

    .line 191
    invoke-virtual {p0}, Lcom/helpshift/support/views/HSRoundedImageView;->getWidth()I

    move-result v0

    if-lez v0, :cond_1

    invoke-virtual {p0}, Lcom/helpshift/support/views/HSRoundedImageView;->getHeight()I

    move-result v0

    if-lez v0, :cond_1

    const/4 v0, 0x0

    const/high16 v1, 0x3f000000    # 0.5f

    if-le p2, p3, :cond_0

    .line 198
    iget-object v2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->drawableRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    int-to-float p3, p3

    div-float/2addr v2, p3

    .line 199
    iget-object p3, p0, Lcom/helpshift/support/views/HSRoundedImageView;->drawableRect:Landroid/graphics/RectF;

    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    move-result p3

    int-to-float p2, p2

    mul-float p2, p2, v2

    sub-float/2addr p3, p2

    mul-float p3, p3, v1

    move v0, p3

    const/4 p2, 0x0

    goto :goto_0

    .line 202
    :cond_0
    iget-object v2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->drawableRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    int-to-float p2, p2

    div-float/2addr v2, p2

    .line 203
    iget-object p2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->drawableRect:Landroid/graphics/RectF;

    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result p2

    int-to-float p3, p3

    mul-float p3, p3, v2

    sub-float/2addr p2, p3

    mul-float p2, p2, v1

    .line 206
    :goto_0
    iget-object p3, p0, Lcom/helpshift/support/views/HSRoundedImageView;->shaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p3, v2, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 207
    iget-object p3, p0, Lcom/helpshift/support/views/HSRoundedImageView;->shaderMatrix:Landroid/graphics/Matrix;

    add-float/2addr v0, v1

    float-to-int v0, v0

    int-to-float v0, v0

    iget v2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderWidth:F

    add-float/2addr v0, v2

    add-float/2addr p2, v1

    float-to-int p2, p2

    int-to-float p2, p2

    add-float/2addr p2, v2

    invoke-virtual {p3, v0, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 209
    iget-object p2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->shaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, p2}, Landroid/graphics/BitmapShader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 1

    .line 166
    iget-object v0, p0, Lcom/helpshift/support/views/HSRoundedImageView;->SCALE_TYPE:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 171
    iget-object v0, p0, Lcom/helpshift/support/views/HSRoundedImageView;->bitmapPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->bitmapShader:Landroid/graphics/BitmapShader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 173
    iget v0, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderWidth:F

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-lez v1, :cond_1

    .line 174
    iget-object v1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->backgroundPaint:Landroid/graphics/Paint;

    if-eqz v1, :cond_0

    .line 175
    iget-object v2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->drawableRect:Landroid/graphics/RectF;

    iget v3, p0, Lcom/helpshift/support/views/HSRoundedImageView;->cornerRadius:F

    sub-float v4, v3, v0

    sub-float/2addr v3, v0

    invoke-virtual {p1, v2, v4, v3, v1}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 178
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/views/HSRoundedImageView;->drawableRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->cornerRadius:F

    iget v2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderWidth:F

    sub-float v3, v1, v2

    sub-float/2addr v1, v2

    iget-object v2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v3, v1, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 180
    iget-object v0, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->cornerRadius:F

    iget-object v2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->borderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v1, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 183
    :cond_1
    iget-object v0, p0, Lcom/helpshift/support/views/HSRoundedImageView;->backgroundPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_2

    .line 184
    iget-object v1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->drawableRect:Landroid/graphics/RectF;

    iget v2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->cornerRadius:F

    invoke-virtual {p1, v1, v2, v2, v0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 186
    :cond_2
    iget-object v0, p0, Lcom/helpshift/support/views/HSRoundedImageView;->drawableRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->cornerRadius:F

    iget-object v2, p0, Lcom/helpshift/support/views/HSRoundedImageView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v1, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    :goto_0
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 115
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/appcompat/widget/AppCompatImageView;->onSizeChanged(IIII)V

    .line 116
    invoke-direct {p0}, Lcom/helpshift/support/views/HSRoundedImageView;->setup()V

    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 121
    iput-object p1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->imageBitmap:Landroid/graphics/Bitmap;

    .line 122
    invoke-direct {p0}, Lcom/helpshift/support/views/HSRoundedImageView;->setup()V

    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 127
    invoke-super {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 128
    instance-of v0, p1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v0, :cond_0

    .line 129
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/views/HSRoundedImageView;->imageBitmap:Landroid/graphics/Bitmap;

    .line 130
    invoke-direct {p0}, Lcom/helpshift/support/views/HSRoundedImageView;->setup()V

    :cond_0
    return-void
.end method
