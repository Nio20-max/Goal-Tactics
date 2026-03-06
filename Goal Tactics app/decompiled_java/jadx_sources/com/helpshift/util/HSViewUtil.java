package com.helpshift.util;

import android.os.Build;
import android.view.View;

/* JADX INFO: loaded from: classes2.dex */
public class HSViewUtil {
    public static boolean isViewDirectionRtl(View view) {
        return view != null && Build.VERSION.SDK_INT >= 17 && view.getLayoutDirection() == 1;
    }

    public static boolean isVisible(View view) {
        return isVisibilityStateEquals(view, 0);
    }

    public static boolean isGone(View view) {
        return isVisibilityStateEquals(view, 8);
    }

    public static boolean isVisibilityStateEquals(View view, int i) {
        return view != null && view.getVisibility() == i;
    }
}
