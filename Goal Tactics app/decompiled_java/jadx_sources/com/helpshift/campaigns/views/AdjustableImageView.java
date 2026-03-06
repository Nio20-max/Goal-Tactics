package com.helpshift.campaigns.views;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;

/* JADX INFO: loaded from: classes.dex */
public class AdjustableImageView extends ImageView {
    boolean mAdjustViewBounds;

    public AdjustableImageView(Context context) {
        super(context);
    }

    public AdjustableImageView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public AdjustableImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    @Override // android.widget.ImageView
    public void setAdjustViewBounds(boolean z) {
        this.mAdjustViewBounds = z;
        super.setAdjustViewBounds(z);
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onMeasure(int i, int i2) {
        Drawable drawable = getDrawable();
        if (drawable == null) {
            super.onMeasure(i, i2);
            return;
        }
        if (this.mAdjustViewBounds) {
            int intrinsicWidth = drawable.getIntrinsicWidth();
            int intrinsicHeight = drawable.getIntrinsicHeight();
            int size = View.MeasureSpec.getSize(i2);
            int size2 = View.MeasureSpec.getSize(i);
            int mode = View.MeasureSpec.getMode(i2);
            int mode2 = View.MeasureSpec.getMode(i);
            if (mode == 1073741824 && mode2 != 1073741824) {
                int i3 = (intrinsicWidth * size) / intrinsicHeight;
                if (isInScrollingContainer()) {
                    setMeasuredDimension(i3, size);
                    return;
                } else {
                    setMeasuredDimension(Math.min(i3, size2), Math.min(size, size));
                    return;
                }
            }
            if (mode2 == 1073741824 && mode != 1073741824) {
                int i4 = (intrinsicHeight * size2) / intrinsicWidth;
                if (isInScrollingContainer()) {
                    setMeasuredDimension(size2, i4);
                    return;
                } else {
                    setMeasuredDimension(Math.min(size2, size2), Math.min(i4, size));
                    return;
                }
            }
            super.onMeasure(i, i2);
            return;
        }
        super.onMeasure(i, i2);
    }

    private boolean isInScrollingContainer() {
        for (ViewParent parent = getParent(); parent instanceof ViewGroup; parent = parent.getParent()) {
            if (((ViewGroup) parent).shouldDelayChildPressedState()) {
                return true;
            }
        }
        return false;
    }
}
