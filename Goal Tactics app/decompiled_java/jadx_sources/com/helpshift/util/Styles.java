package com.helpshift.util;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.view.View;
import androidx.core.content.ContextCompat;
import androidx.core.view.ViewCompat;
import com.helpshift.R;

/* JADX INFO: loaded from: classes2.dex */
public class Styles {
    public static int getColor(Context context, int i) {
        TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(new int[]{i});
        int color = typedArrayObtainStyledAttributes.getColor(0, -1);
        typedArrayObtainStyledAttributes.recycle();
        return color;
    }

    public static String getHexColor(Context context, int i) {
        return getHexColor(getColor(context, i));
    }

    public static String getHexColor(int i) {
        return String.format("#%06X", Integer.valueOf(i & ViewCompat.MEASURED_SIZE_MASK));
    }

    public static void setActionButtonIconColor(Context context, Drawable drawable) {
        setColorFilter(context, drawable, R.attr.hs__actionButtonIconColor);
    }

    public static void setColorFilter(Context context, Drawable drawable, int i) {
        if (drawable != null) {
            drawable.setColorFilter(getColor(context, i), PorterDuff.Mode.SRC_ATOP);
        }
    }

    public static void setColorFilter(Drawable drawable, int i) {
        if (drawable != null) {
            drawable.setColorFilter(i, PorterDuff.Mode.SRC_ATOP);
        }
    }

    public static float dpToPx(Context context, float f) {
        return f * context.getResources().getDisplayMetrics().density;
    }

    public static void setDrawable(Context context, View view, int i, int i2) {
        Drawable drawable = ContextCompat.getDrawable(context, i);
        setColorFilter(context, drawable, i2);
        if (Build.VERSION.SDK_INT >= 16) {
            view.setBackground(drawable);
        } else {
            view.setBackgroundDrawable(drawable);
        }
    }

    public static void setGradientBackground(View view, int i, int i2, GradientDrawable.Orientation orientation) {
        ViewCompat.setBackground(view, new GradientDrawable(orientation, new int[]{i, i2}));
    }
}
