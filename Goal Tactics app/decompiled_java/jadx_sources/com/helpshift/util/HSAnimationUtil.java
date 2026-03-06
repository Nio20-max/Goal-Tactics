package com.helpshift.util;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import android.view.animation.LinearInterpolator;

/* JADX INFO: loaded from: classes2.dex */
public class HSAnimationUtil {
    public static void fadeVisibilityGone(final View view, int i) {
        view.animate().alpha(0.0f).setDuration(i).setInterpolator(new LinearInterpolator()).setListener(new AnimatorListenerAdapter() { // from class: com.helpshift.util.HSAnimationUtil.1
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
                view.setVisibility(8);
            }
        }).start();
    }

    public static void fadeVisibilityIn(final View view, int i) {
        view.animate().alpha(1.0f).setDuration(i).setInterpolator(new LinearInterpolator()).setListener(new AnimatorListenerAdapter() { // from class: com.helpshift.util.HSAnimationUtil.2
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
                view.setVisibility(0);
            }
        }).start();
    }

    public static void rotate(View view, int i, float f) {
        view.animate().rotation(f).setDuration(i).setInterpolator(new LinearInterpolator());
    }
}
