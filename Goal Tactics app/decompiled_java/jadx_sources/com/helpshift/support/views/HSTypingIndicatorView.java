package com.helpshift.support.views;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.util.AttributeSet;
import android.view.animation.LinearInterpolator;
import android.widget.LinearLayout;
import com.helpshift.R;
import java.util.Iterator;

/* JADX INFO: loaded from: classes2.dex */
public class HSTypingIndicatorView extends LinearLayout {
    private static final int ALPHA_DARK = 179;
    private static final int ALPHA_LIGHT = 76;
    private final long ANIMATION_DURATION;
    private final long LOOP_START_DELAY;
    private int LightDotColor;
    AnimatorSet dotAnimatorSet;
    Animator[] dotAnimators;
    private float dotDiameter;
    private DotView[] dots;
    private float interDotPadding;

    public HSTypingIndicatorView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public HSTypingIndicatorView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.ANIMATION_DURATION = 900L;
        this.LOOP_START_DELAY = 450L;
        this.dotAnimators = new Animator[3];
        initAttributes(context, attributeSet);
        setup();
    }

    private void initAttributes(Context context, AttributeSet attributeSet) {
        TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(attributeSet, R.styleable.HSTypingIndicatorView, 0, 0);
        int color = typedArrayObtainStyledAttributes.getColor(R.styleable.HSTypingIndicatorView_hs__dotColor, 0);
        this.LightDotColor = Color.argb(76, Color.red(color), Color.green(color), Color.blue(color));
        this.interDotPadding = typedArrayObtainStyledAttributes.getDimension(R.styleable.HSTypingIndicatorView_hs__interDotPadding, 0.0f);
        this.dotDiameter = typedArrayObtainStyledAttributes.getDimension(R.styleable.HSTypingIndicatorView_hs__dotDiameter, 0.0f);
        typedArrayObtainStyledAttributes.recycle();
    }

    @Override // android.view.View
    protected void onWindowVisibilityChanged(int i) {
        super.onWindowVisibilityChanged(i);
        if (i == 0) {
            startTypingAnimation();
        } else {
            stopTypingAnimation();
        }
    }

    private void startTypingAnimation() {
        if (this.dotAnimatorSet == null) {
            AnimatorSet animatorSet = new AnimatorSet();
            this.dotAnimatorSet = animatorSet;
            animatorSet.playTogether(this.dotAnimators);
            this.dotAnimatorSet.addListener(new Animator.AnimatorListener() { // from class: com.helpshift.support.views.HSTypingIndicatorView.1
                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationCancel(Animator animator) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationRepeat(Animator animator) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationStart(Animator animator) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animator) {
                    animator.setStartDelay(450L);
                    animator.start();
                }
            });
            this.dotAnimatorSet.start();
        }
    }

    private void stopTypingAnimation() {
        AnimatorSet animatorSet = this.dotAnimatorSet;
        if (animatorSet != null) {
            Iterator<Animator> it = animatorSet.getChildAnimations().iterator();
            while (it.hasNext()) {
                it.next().cancel();
            }
            this.dotAnimatorSet.cancel();
            this.dotAnimatorSet.removeAllListeners();
            this.dotAnimatorSet = null;
            for (DotView dotView : this.dots) {
                dotView.setDotColor(this.LightDotColor);
            }
        }
    }

    private void setup() {
        this.dots = new DotView[3];
        for (int i = 0; i < 3; i++) {
            this.dots[i] = new DotView(getContext(), this.LightDotColor);
            float f = this.interDotPadding;
            float f2 = f / 2.0f;
            float f3 = f / 2.0f;
            long j = 0;
            if (i == 0) {
                f2 = 0.0f;
            } else if (i == 1) {
                j = 225;
            } else if (i == 2) {
                j = 450;
                f3 = 0.0f;
            }
            float f4 = this.dotDiameter;
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams((int) f4, (int) f4);
            layoutParams.setMargins((int) f2, 0, (int) f3, 0);
            addView(this.dots[i], layoutParams);
            this.dotAnimators[i] = getAnimator(j, this.dots[i]);
        }
    }

    public ValueAnimator getAnimator(long j, ValueAnimator.AnimatorUpdateListener animatorUpdateListener) {
        ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(76, ALPHA_DARK, 76);
        valueAnimatorOfInt.setStartDelay(j);
        valueAnimatorOfInt.setDuration(900L);
        valueAnimatorOfInt.setInterpolator(new LinearInterpolator());
        valueAnimatorOfInt.addUpdateListener(animatorUpdateListener);
        return valueAnimatorOfInt;
    }
}
