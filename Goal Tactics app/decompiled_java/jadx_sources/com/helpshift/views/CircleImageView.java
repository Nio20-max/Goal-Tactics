package com.helpshift.views;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.AttributeSet;
import android.widget.ImageView;

/* JADX INFO: loaded from: classes2.dex */
public class CircleImageView extends ImageView {
    private static final int COLOR_DRAWABLE_DIMENSION = 2;
    private Bitmap bitmap;
    private int bitmapHeight;
    private final Paint bitmapPaint;
    private BitmapShader bitmapShader;
    private int bitmapWidth;
    private final RectF borderRect;
    private ColorFilter colorFilter;
    private float drawableRadius;
    private final RectF drawableRect;
    private boolean isReady;
    private boolean isSetupPending;
    private final Matrix shaderMatrix;
    private static final ImageView.ScaleType SCALE_TYPE = ImageView.ScaleType.CENTER_CROP;
    private static final Bitmap.Config BITMAP_CONFIG = Bitmap.Config.ARGB_8888;

    public CircleImageView(Context context) {
        super(context);
        this.drawableRect = new RectF();
        this.borderRect = new RectF();
        this.shaderMatrix = new Matrix();
        this.bitmapPaint = new Paint();
        init();
    }

    public CircleImageView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public CircleImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.drawableRect = new RectF();
        this.borderRect = new RectF();
        this.shaderMatrix = new Matrix();
        this.bitmapPaint = new Paint();
        init();
    }

    private void init() {
        super.setScaleType(SCALE_TYPE);
        this.isReady = true;
        if (this.isSetupPending) {
            setup();
            this.isSetupPending = false;
        }
    }

    @Override // android.widget.ImageView
    public void setAdjustViewBounds(boolean z) {
        if (z) {
            throw new IllegalArgumentException("adjustViewBounds not supported.");
        }
    }

    @Override // android.widget.ImageView
    public ImageView.ScaleType getScaleType() {
        return SCALE_TYPE;
    }

    @Override // android.widget.ImageView
    public void setImageResource(int i) {
        super.setImageResource(i);
        this.bitmap = getBitmapFromDrawable(getDrawable());
        setup();
    }

    @Override // android.widget.ImageView
    public void setScaleType(ImageView.ScaleType scaleType) {
        if (scaleType != SCALE_TYPE) {
            throw new IllegalArgumentException(String.format("ScaleType %s not supported.", scaleType));
        }
    }

    @Override // android.widget.ImageView
    public void setImageURI(Uri uri) {
        super.setImageURI(uri);
        this.bitmap = uri != null ? getBitmapFromDrawable(getDrawable()) : null;
        setup();
    }

    @Override // android.widget.ImageView
    public void setImageDrawable(Drawable drawable) {
        super.setImageDrawable(drawable);
        this.bitmap = getBitmapFromDrawable(drawable);
        setup();
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onDraw(Canvas canvas) {
        if (this.bitmap == null) {
            return;
        }
        canvas.drawCircle(getWidth() / 2.0f, getHeight() / 2.0f, this.drawableRadius, this.bitmapPaint);
    }

    @Override // android.widget.ImageView
    public void setImageBitmap(Bitmap bitmap) {
        super.setImageBitmap(bitmap);
        this.bitmap = bitmap;
        setup();
    }

    @Override // android.view.View
    protected void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        setup();
    }

    private Bitmap getBitmapFromDrawable(Drawable drawable) {
        Bitmap bitmapCreateBitmap;
        if (drawable == null) {
            return null;
        }
        if (drawable instanceof BitmapDrawable) {
            return ((BitmapDrawable) drawable).getBitmap();
        }
        try {
            if (drawable instanceof ColorDrawable) {
                bitmapCreateBitmap = Bitmap.createBitmap(2, 2, BITMAP_CONFIG);
            } else {
                bitmapCreateBitmap = Bitmap.createBitmap(drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight(), BITMAP_CONFIG);
            }
            Canvas canvas = new Canvas(bitmapCreateBitmap);
            drawable.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
            drawable.draw(canvas);
            return bitmapCreateBitmap;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private void setup() {
        if (!this.isReady) {
            this.isSetupPending = true;
            return;
        }
        if (getWidth() == 0 && getHeight() == 0) {
            return;
        }
        if (this.bitmap == null) {
            invalidate();
            return;
        }
        this.bitmapShader = new BitmapShader(this.bitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
        this.bitmapPaint.setAntiAlias(true);
        this.bitmapPaint.setShader(this.bitmapShader);
        this.bitmapHeight = this.bitmap.getHeight();
        this.bitmapWidth = this.bitmap.getWidth();
        this.borderRect.set(0.0f, 0.0f, getWidth(), getHeight());
        this.drawableRect.set(this.borderRect);
        this.drawableRadius = Math.min(this.drawableRect.height() / 2.0f, this.drawableRect.width() / 2.0f);
        updateShaderMatrix();
        invalidate();
    }

    private void updateShaderMatrix() {
        float fWidth;
        float fHeight;
        this.shaderMatrix.set(null);
        float fWidth2 = 0.0f;
        if (this.bitmapWidth * this.drawableRect.height() > this.drawableRect.width() * this.bitmapHeight) {
            fWidth = this.drawableRect.height() / this.bitmapHeight;
            fWidth2 = (this.drawableRect.width() - (this.bitmapWidth * fWidth)) * 0.5f;
            fHeight = 0.0f;
        } else {
            fWidth = this.drawableRect.width() / this.bitmapWidth;
            fHeight = (this.drawableRect.height() - (this.bitmapHeight * fWidth)) * 0.5f;
        }
        this.shaderMatrix.setScale(fWidth, fWidth);
        this.shaderMatrix.postTranslate(((int) (fWidth2 + 0.5f)) + this.drawableRect.left, ((int) (fHeight + 0.5f)) + this.drawableRect.top);
        this.bitmapShader.setLocalMatrix(this.shaderMatrix);
    }

    @Override // android.widget.ImageView
    public void setColorFilter(ColorFilter colorFilter) {
        if (colorFilter == this.colorFilter) {
            return;
        }
        this.colorFilter = colorFilter;
        this.bitmapPaint.setColorFilter(colorFilter);
        invalidate();
    }
}
