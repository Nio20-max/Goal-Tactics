package com.helpshift.support.conversations.smartintent;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.helpshift.R;
import com.helpshift.views.bottomsheet.HSBottomSheetBehaviour;

/* JADX INFO: loaded from: classes2.dex */
public class SmartIntentBottomSheetBehavior<V extends View> extends HSBottomSheetBehaviour<V> {
    public SmartIntentBottomSheetBehavior() {
    }

    public SmartIntentBottomSheetBehavior(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public boolean onDependentViewChanged(CoordinatorLayout coordinatorLayout, V v, View view) {
        if (v.getId() == R.id.hs__si_scrollable_view_container && view.getId() == R.id.reply_footer_container) {
            v.setPadding(v.getPaddingLeft(), v.getPaddingTop(), v.getPaddingRight(), view.getHeight());
            return true;
        }
        return super.onDependentViewChanged(coordinatorLayout, v, view);
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public boolean layoutDependsOn(CoordinatorLayout coordinatorLayout, V v, View view) {
        if (v.getId() == R.id.hs__si_scrollable_view_container && view.getId() == R.id.reply_footer_container) {
            return true;
        }
        return super.layoutDependsOn(coordinatorLayout, v, view);
    }
}
