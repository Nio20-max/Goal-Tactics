package com.helpshift.views.bottomsheet;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.google.android.material.bottomsheet.BottomSheetBehavior;

/* JADX INFO: loaded from: classes2.dex */
public class HSBottomSheetBehaviour<V extends View> extends BottomSheetBehavior<V> {
    private boolean isDraggable;

    public HSBottomSheetBehaviour() {
        this.isDraggable = true;
    }

    public HSBottomSheetBehaviour(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.isDraggable = true;
    }

    @Override // com.google.android.material.bottomsheet.BottomSheetBehavior
    public void setDraggable(boolean z) {
        this.isDraggable = z;
    }

    @Override // com.google.android.material.bottomsheet.BottomSheetBehavior, androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public boolean onInterceptTouchEvent(CoordinatorLayout coordinatorLayout, V v, MotionEvent motionEvent) {
        if (this.isDraggable) {
            return super.onInterceptTouchEvent(coordinatorLayout, v, motionEvent);
        }
        return false;
    }

    @Override // com.google.android.material.bottomsheet.BottomSheetBehavior, androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public boolean onStartNestedScroll(CoordinatorLayout coordinatorLayout, V v, View view, View view2, int i, int i2) {
        if (this.isDraggable) {
            return super.onStartNestedScroll(coordinatorLayout, v, view, view2, i, i2);
        }
        return false;
    }

    @Override // com.google.android.material.bottomsheet.BottomSheetBehavior, androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public void onStopNestedScroll(CoordinatorLayout coordinatorLayout, V v, View view, int i) {
        if (this.isDraggable) {
            super.onStopNestedScroll(coordinatorLayout, v, view, i);
        }
    }

    @Override // com.google.android.material.bottomsheet.BottomSheetBehavior, androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public boolean onNestedPreFling(CoordinatorLayout coordinatorLayout, V v, View view, float f, float f2) {
        if (this.isDraggable) {
            return super.onNestedPreFling(coordinatorLayout, v, view, f, f2);
        }
        return false;
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public void onNestedScroll(CoordinatorLayout coordinatorLayout, V v, View view, int i, int i2, int i3, int i4, int i5) {
        if (this.isDraggable) {
            super.onNestedScroll(coordinatorLayout, v, view, i, i2, i3, i4, i5);
        }
    }

    @Override // com.google.android.material.bottomsheet.BottomSheetBehavior, androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public boolean onTouchEvent(CoordinatorLayout coordinatorLayout, V v, MotionEvent motionEvent) {
        if (this.isDraggable) {
            return super.onTouchEvent(coordinatorLayout, v, motionEvent);
        }
        return false;
    }
}
