package com.helpshift.views;

import android.R;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Typeface;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;
import com.helpshift.util.HSLogger;
import com.helpshift.util.StringUtils;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes2.dex */
public final class FontApplier {
    public static final String TAG = "HS_FontApplier";
    private static String fontPathInternal = null;
    private static Typeface typeface = null;
    private static boolean typefaceInitialisationTried = false;
    private static HSTypefaceSpan typefaceSpan;

    private FontApplier() {
    }

    public static void setFontPath(String str) {
        fontPathInternal = str;
    }

    public static void apply(TextView textView) {
        initTypeface(textView.getContext());
        Typeface typeface2 = typeface;
        if (typeface2 == null) {
            return;
        }
        textView.setTypeface(typeface2);
    }

    public static void apply(Dialog dialog) {
        apply(dialog.findViewById(R.id.content));
    }

    public static void apply(View view) {
        initTypeface(view.getContext());
        if (typeface == null) {
            return;
        }
        view.getViewTreeObserver().addOnGlobalLayoutListener(new FontLayoutListener(view));
    }

    static void applyInternal(View view) {
        if (view instanceof TextView) {
            apply((TextView) view);
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i = 0; i < viewGroup.getChildCount(); i++) {
                applyInternal(viewGroup.getChildAt(i));
            }
        }
    }

    public static HSTypefaceSpan getTypefaceSpan() {
        if (typeface != null && typefaceSpan == null) {
            typefaceSpan = new HSTypefaceSpan(typeface);
        }
        return typefaceSpan;
    }

    public static String getFontPath() {
        return fontPathInternal;
    }

    private static void initTypeface(Context context) {
        String fontPath = getFontPath();
        if (StringUtils.isNotEmpty(fontPath) && typeface == null && !typefaceInitialisationTried) {
            try {
                try {
                    typeface = Typeface.createFromAsset(context.getAssets(), fontPath);
                } catch (Exception e) {
                    HSLogger.e(TAG, "Typeface initialisation failed. Using default typeface. " + e.getMessage());
                }
            } finally {
                typefaceInitialisationTried = true;
            }
        }
    }

    private static class FontLayoutListener implements ViewTreeObserver.OnGlobalLayoutListener {
        private final WeakReference<View> viewRef;

        public FontLayoutListener(View view) {
            this.viewRef = new WeakReference<>(view);
        }

        @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
        public void onGlobalLayout() {
            View view = this.viewRef.get();
            if (view == null) {
                return;
            }
            FontApplier.applyInternal(view);
        }
    }
}
