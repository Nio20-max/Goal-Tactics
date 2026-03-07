.class public Lcom/helpshift/views/CircleImageView;
.super Landroid/widget/ImageView;
.source "CircleImageView.java"


# static fields
.field private static final BITMAP_CONFIG:Landroid/graphics/Bitmap$Config;

.field private static final COLOR_DRAWABLE_DIMENSION:I = 0x2

.field private static final SCALE_TYPE:Landroid/widget/ImageView$ScaleType;


# instance fields
.field private bitmap:Landroid/graphics/Bitmap;

.field private bitmapHeight:I

.field private final bitmapPaint:Landroid/graphics/Paint;

.field private bitmapShader:Landroid/graphics/BitmapShader;

.field private bitmapWidth:I

.field private final borderRect:Landroid/graphics/RectF;

.field private colorFilter:Landroid/graphics/ColorFilter;

.field private drawableRadius:F

.field private final drawableRect:Landroid/graphics/RectF;

.field private isReady:Z

.field private isSetupPending:Z

.field private final shaderMatrix:Landroid/graphics/Matrix;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 50
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    sput-object v0, Lcom/helpshift/views/CircleImageView;->SCALE_TYPE:Landroid/widget/ImageView$ScaleType;

    .line 52
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    sput-object v0, Lcom/helpshift/views/CircleImageView;->BITMAP_CONFIG:Landroid/graphics/Bitmap$Config;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 68
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 54
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/helpshift/views/CircleImageView;->drawableRect:Landroid/graphics/RectF;

    .line 55
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/helpshift/views/CircleImageView;->borderRect:Landroid/graphics/RectF;

    .line 56
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/helpshift/views/CircleImageView;->shaderMatrix:Landroid/graphics/Matrix;

    .line 57
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/helpshift/views/CircleImageView;->bitmapPaint:Landroid/graphics/Paint;

    .line 69
    invoke-direct {p0}, Lcom/helpshift/views/CircleImageView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 73
    invoke-direct {p0, p1, p2, v0}, Lcom/helpshift/views/CircleImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 77
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 54
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/helpshift/views/CircleImageView;->drawableRect:Landroid/graphics/RectF;

    .line 55
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/helpshift/views/CircleImageView;->borderRect:Landroid/graphics/RectF;

    .line 56
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/helpshift/views/CircleImageView;->shaderMatrix:Landroid/graphics/Matrix;

    .line 57
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/helpshift/views/CircleImageView;->bitmapPaint:Landroid/graphics/Paint;

    .line 78
    invoke-direct {p0}, Lcom/helpshift/views/CircleImageView;->init()V

    return-void
.end method

.method private getBitmapFromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;
    .locals 6

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 156
    :cond_0
    instance-of v1, p1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v1, :cond_1

    .line 157
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    .line 162
    :cond_1
    :try_start_0
    instance-of v1, p1, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v1, :cond_2

    .line 163
    sget-object v1, Lcom/helpshift/views/CircleImageView;->BITMAP_CONFIG:Landroid/graphics/Bitmap$Config;

    const/4 v2, 0x2

    invoke-static {v2, v2, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    .line 166
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    sget-object v3, Lcom/helpshift/views/CircleImageView;->BITMAP_CONFIG:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 169
    :goto_0
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 170
    invoke-virtual {v2}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/Canvas;->getHeight()I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {p1, v5, v5, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 171
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception p1

    .line 175
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-object v0
.end method

.method private init()V
    .locals 1

    .line 82
    sget-object v0, Lcom/helpshift/views/CircleImageView;->SCALE_TYPE:Landroid/widget/ImageView$ScaleType;

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/4 v0, 0x1

    .line 83
    iput-boolean v0, p0, Lcom/helpshift/views/CircleImageView;->isReady:Z

    .line 84
    iget-boolean v0, p0, Lcom/helpshift/views/CircleImageView;->isSetupPending:Z

    if-eqz v0, :cond_0

    .line 85
    invoke-direct {p0}, Lcom/helpshift/views/CircleImageView;->setup()V

    const/4 v0, 0x0

    .line 86
    iput-boolean v0, p0, Lcom/helpshift/views/CircleImageView;->isSetupPending:Z

    :cond_0
    return-void
.end method

.method private setup()V
    .locals 5

    .line 181
    iget-boolean v0, p0, Lcom/helpshift/views/CircleImageView;->isReady:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 182
    iput-boolean v1, p0, Lcom/helpshift/views/CircleImageView;->isSetupPending:Z

    return-void

    .line 186
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/views/CircleImageView;->getWidth()I

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/helpshift/views/CircleImageView;->getHeight()I

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 190
    :cond_1
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_2

    .line 191
    invoke-virtual {p0}, Lcom/helpshift/views/CircleImageView;->invalidate()V

    return-void

    .line 195
    :cond_2
    new-instance v0, Landroid/graphics/BitmapShader;

    iget-object v2, p0, Lcom/helpshift/views/CircleImageView;->bitmap:Landroid/graphics/Bitmap;

    sget-object v3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v4, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v0, v2, v3, v4}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lcom/helpshift/views/CircleImageView;->bitmapShader:Landroid/graphics/BitmapShader;

    .line 197
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 198
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->bitmapPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/helpshift/views/CircleImageView;->bitmapShader:Landroid/graphics/BitmapShader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 200
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/helpshift/views/CircleImageView;->bitmapHeight:I

    .line 201
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/helpshift/views/CircleImageView;->bitmapWidth:I

    .line 203
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->borderRect:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/helpshift/views/CircleImageView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/helpshift/views/CircleImageView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 205
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->drawableRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/helpshift/views/CircleImageView;->borderRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 206
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->drawableRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget-object v2, p0, Lcom/helpshift/views/CircleImageView;->drawableRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v2, v1

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/helpshift/views/CircleImageView;->drawableRadius:F

    .line 208
    invoke-direct {p0}, Lcom/helpshift/views/CircleImageView;->updateShaderMatrix()V

    .line 209
    invoke-virtual {p0}, Lcom/helpshift/views/CircleImageView;->invalidate()V

    return-void
.end method

.method private updateShaderMatrix()V
    .locals 5

    .line 216
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->shaderMatrix:Landroid/graphics/Matrix;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 218
    iget v0, p0, Lcom/helpshift/views/CircleImageView;->bitmapWidth:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/helpshift/views/CircleImageView;->drawableRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    mul-float v0, v0, v1

    iget-object v1, p0, Lcom/helpshift/views/CircleImageView;->drawableRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    iget v2, p0, Lcom/helpshift/views/CircleImageView;->bitmapHeight:I

    int-to-float v2, v2

    mul-float v1, v1, v2

    const/4 v2, 0x0

    const/high16 v3, 0x3f000000    # 0.5f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 219
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->drawableRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    iget v1, p0, Lcom/helpshift/views/CircleImageView;->bitmapHeight:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    .line 220
    iget-object v1, p0, Lcom/helpshift/views/CircleImageView;->drawableRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    iget v4, p0, Lcom/helpshift/views/CircleImageView;->bitmapWidth:I

    int-to-float v4, v4

    mul-float v4, v4, v0

    sub-float/2addr v1, v4

    mul-float v1, v1, v3

    move v2, v1

    const/4 v1, 0x0

    goto :goto_0

    .line 223
    :cond_0
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->drawableRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget v1, p0, Lcom/helpshift/views/CircleImageView;->bitmapWidth:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    .line 224
    iget-object v1, p0, Lcom/helpshift/views/CircleImageView;->drawableRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    iget v4, p0, Lcom/helpshift/views/CircleImageView;->bitmapHeight:I

    int-to-float v4, v4

    mul-float v4, v4, v0

    sub-float/2addr v1, v4

    mul-float v1, v1, v3

    .line 227
    :goto_0
    iget-object v4, p0, Lcom/helpshift/views/CircleImageView;->shaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v4, v0, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 228
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->shaderMatrix:Landroid/graphics/Matrix;

    add-float/2addr v2, v3

    float-to-int v2, v2

    int-to-float v2, v2

    iget-object v4, p0, Lcom/helpshift/views/CircleImageView;->drawableRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    add-float/2addr v2, v4

    add-float/2addr v1, v3

    float-to-int v1, v1

    int-to-float v1, v1

    iget-object v3, p0, Lcom/helpshift/views/CircleImageView;->drawableRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    add-float/2addr v1, v3

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 229
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->bitmapShader:Landroid/graphics/BitmapShader;

    iget-object v1, p0, Lcom/helpshift/views/CircleImageView;->shaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/BitmapShader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    return-void
.end method


# virtual methods
.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 1

    .line 99
    sget-object v0, Lcom/helpshift/views/CircleImageView;->SCALE_TYPE:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 132
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    return-void

    .line 135
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/views/CircleImageView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p0}, Lcom/helpshift/views/CircleImageView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v1

    iget v1, p0, Lcom/helpshift/views/CircleImageView;->drawableRadius:F

    iget-object v3, p0, Lcom/helpshift/views/CircleImageView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 147
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/ImageView;->onSizeChanged(IIII)V

    .line 148
    invoke-direct {p0}, Lcom/helpshift/views/CircleImageView;->setup()V

    return-void
.end method

.method public setAdjustViewBounds(Z)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    .line 93
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "adjustViewBounds not supported."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 234
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->colorFilter:Landroid/graphics/ColorFilter;

    if-ne p1, v0, :cond_0

    return-void

    .line 237
    :cond_0
    iput-object p1, p0, Lcom/helpshift/views/CircleImageView;->colorFilter:Landroid/graphics/ColorFilter;

    .line 238
    iget-object v0, p0, Lcom/helpshift/views/CircleImageView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 239
    invoke-virtual {p0}, Lcom/helpshift/views/CircleImageView;->invalidate()V

    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 140
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 141
    iput-object p1, p0, Lcom/helpshift/views/CircleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 142
    invoke-direct {p0}, Lcom/helpshift/views/CircleImageView;->setup()V

    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 125
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 126
    invoke-direct {p0, p1}, Lcom/helpshift/views/CircleImageView;->getBitmapFromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/views/CircleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 127
    invoke-direct {p0}, Lcom/helpshift/views/CircleImageView;->setup()V

    return-void
.end method

.method public setImageResource(I)V
    .locals 0

    .line 104
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 105
    invoke-virtual {p0}, Lcom/helpshift/views/CircleImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/helpshift/views/CircleImageView;->getBitmapFromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/views/CircleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 106
    invoke-direct {p0}, Lcom/helpshift/views/CircleImageView;->setup()V

    return-void
.end method

.method public setImageURI(Landroid/net/Uri;)V
    .locals 0

    .line 118
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    if-eqz p1, :cond_0

    .line 119
    invoke-virtual {p0}, Lcom/helpshift/views/CircleImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/helpshift/views/CircleImageView;->getBitmapFromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lcom/helpshift/views/CircleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 120
    invoke-direct {p0}, Lcom/helpshift/views/CircleImageView;->setup()V

    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .locals 3

    .line 111
    sget-object v0, Lcom/helpshift/views/CircleImageView;->SCALE_TYPE:Landroid/widget/ImageView$ScaleType;

    if-ne p1, v0, :cond_0

    return-void

    .line 112
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "ScaleType %s not supported."

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
