package com.helpshift.support.views;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.ImageView;
import androidx.appcompat.widget.AppCompatImageView;
import com.helpshift.R;

/* JADX INFO: loaded from: classes2.dex */
public class HSRoundedImageView extends AppCompatImageView {
    private ImageView.ScaleType SCALE_TYPE;
    private Paint backgroundPaint;
    private Paint bitmapPaint;
    private BitmapShader bitmapShader;
    private Paint borderPaint;
    private RectF borderRect;
    private float borderWidth;
    private float cornerRadius;
    private RectF drawableRect;
    private Bitmap imageBitmap;
    private final Matrix shaderMatrix;

    public HSRoundedImageView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public HSRoundedImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.shaderMatrix = new Matrix();
        this.SCALE_TYPE = ImageView.ScaleType.CENTER_CROP;
        this.drawableRect = new RectF();
        this.borderRect = new RectF();
        TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(attributeSet, R.styleable.HSRoundedImageView, 0, 0);
        int color = typedArrayObtainStyledAttributes.getColor(R.styleable.HSRoundedImageView_hs__borderColor, -1);
        int color2 = typedArrayObtainStyledAttributes.getColor(R.styleable.HSRoundedImageView_hs__backgroundColor, -1);
        float dimension = typedArrayObtainStyledAttributes.getDimension(R.styleable.HSRoundedImageView_hs__borderWidth, 0.0f);
        this.borderWidth = dimension;
        if (dimension < 0.0f) {
            this.borderWidth = 0.0f;
        }
        this.cornerRadius = typedArrayObtainStyledAttributes.getDimension(R.styleable.HSRoundedImageView_hs__cornerRadius, 0.0f);
        typedArrayObtainStyledAttributes.recycle();
        Paint paint = new Paint();
        this.bitmapPaint = paint;
        paint.setStyle(Paint.Style.FILL);
        this.bitmapPaint.setAntiAlias(true);
        Paint paint2 = new Paint();
        this.borderPaint = paint2;
        paint2.setStyle(Paint.Style.STROKE);
        this.borderPaint.setAntiAlias(true);
        this.borderPaint.setColor(color);
        this.borderPaint.setStrokeWidth(this.borderWidth);
        if (color2 != -1) {
            Paint paint3 = new Paint();
            this.backgroundPaint = paint3;
            paint3.setStyle(Paint.Style.FILL);
            this.backgroundPaint.setColor(color2);
            this.backgroundPaint.setAntiAlias(true);
        }
    }

    @Override // android.view.View
    protected void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        setup();
    }

    @Override // androidx.appcompat.widget.AppCompatImageView, android.widget.ImageView
    public void setImageBitmap(Bitmap bitmap) {
        this.imageBitmap = bitmap;
        setup();
    }

    @Override // androidx.appcompat.widget.AppCompatImageView, android.widget.ImageView
    public void setImageDrawable(Drawable drawable) {
        super.setImageDrawable(drawable);
        if (drawable instanceof BitmapDrawable) {
            this.imageBitmap = ((BitmapDrawable) drawable).getBitmap();
            setup();
        }
    }

    private void setup() {
        Bitmap bitmap = this.imageBitmap;
        if (bitmap != null) {
            updateGlobalParamsAndBitmapShader(bitmap);
        } else {
            invalidate();
        }
    }

    private void updateGlobalParamsAndBitmapShader(Bitmap bitmap) {
        if (bitmap == null || getWidth() <= 0 || getHeight() <= 0) {
            return;
        }
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        this.borderRect.set(0.0f, 0.0f, getWidth(), getHeight());
        this.drawableRect.set(this.borderRect);
        RectF rectF = this.borderRect;
        float f = this.borderWidth;
        rectF.inset(f / 2.0f, f / 2.0f);
        RectF rectF2 = this.drawableRect;
        float f2 = this.borderWidth;
        rectF2.inset(f2, f2);
        BitmapShader bitmapShader = new BitmapShader(bitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
        this.bitmapShader = bitmapShader;
        updateShaderMatrix(bitmapShader, width, height);
        invalidate();
    }

    @Override // android.widget.ImageView
    public ImageView.ScaleType getScaleType() {
        return this.SCALE_TYPE;
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onDraw(Canvas canvas) {
        this.bitmapPaint.setShader(this.bitmapShader);
        float f = this.borderWidth;
        if (f > 0.0f) {
            Paint paint = this.backgroundPaint;
            if (paint != null) {
                RectF rectF = this.drawableRect;
                float f2 = this.cornerRadius;
                canvas.drawRoundRect(rectF, f2 - f, f2 - f, paint);
            }
            RectF rectF2 = this.drawableRect;
            float f3 = this.cornerRadius;
            float f4 = this.borderWidth;
            canvas.drawRoundRect(rectF2, f3 - f4, f3 - f4, this.bitmapPaint);
            RectF rectF3 = this.borderRect;
            float f5 = this.cornerRadius;
            canvas.drawRoundRect(rectF3, f5, f5, this.borderPaint);
            return;
        }
        Paint paint2 = this.backgroundPaint;
        if (paint2 != null) {
            RectF rectF4 = this.drawableRect;
            float f6 = this.cornerRadius;
            canvas.drawRoundRect(rectF4, f6, f6, paint2);
        }
        RectF rectF5 = this.drawableRect;
        float f7 = this.cornerRadius;
        canvas.drawRoundRect(rectF5, f7, f7, this.bitmapPaint);
    }

    private void updateShaderMatrix(BitmapShader bitmapShader, int i, int i2) {
        float fWidth;
        float fHeight;
        if (getWidth() <= 0 || getHeight() <= 0) {
            return;
        }
        float fWidth2 = 0.0f;
        if (i > i2) {
            fWidth = this.drawableRect.height() / i2;
            fWidth2 = (this.drawableRect.width() - (i * fWidth)) * 0.5f;
            fHeight = 0.0f;
        } else {
            fWidth = this.drawableRect.width() / i;
            fHeight = (this.drawableRect.height() - (i2 * fWidth)) * 0.5f;
        }
        this.shaderMatrix.setScale(fWidth, fWidth);
        Matrix matrix = this.shaderMatrix;
        float f = this.borderWidth;
        matrix.postTranslate(((int) (fWidth2 + 0.5f)) + f, ((int) (fHeight + 0.5f)) + f);
        bitmapShader.setLocalMatrix(this.shaderMatrix);
    }
}
