package com.helpshift.animation;

import android.view.animation.Animation;
import android.view.animation.Transformation;
import android.widget.LinearLayout;

/* JADX INFO: loaded from: classes.dex */
public class CollapseViewAnimation extends Animation {
    private LinearLayout view;
    private int viewHeight;

    @Override // android.view.animation.Animation
    public boolean willChangeBounds() {
        return true;
    }

    public CollapseViewAnimation(LinearLayout linearLayout) {
        this.view = linearLayout;
        this.viewHeight = linearLayout.getHeight();
    }

    @Override // android.view.animation.Animation
    protected void applyTransformation(float f, Transformation transformation) {
        this.view.getLayoutParams().height = (int) (this.viewHeight * (1.0f - f));
        this.view.requestLayout();
    }
}
