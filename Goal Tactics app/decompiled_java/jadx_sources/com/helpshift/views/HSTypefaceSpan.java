package com.helpshift.views;

import android.graphics.Typeface;
import android.text.TextPaint;
import android.text.style.MetricAffectingSpan;

/* JADX INFO: loaded from: classes2.dex */
public class HSTypefaceSpan extends MetricAffectingSpan {
    private final Typeface typeface;

    HSTypefaceSpan(Typeface typeface) {
        this.typeface = typeface;
    }

    @Override // android.text.style.MetricAffectingSpan
    public void updateMeasureState(TextPaint textPaint) {
        textPaint.setTypeface(this.typeface);
    }

    @Override // android.text.style.CharacterStyle
    public void updateDrawState(TextPaint textPaint) {
        textPaint.setTypeface(this.typeface);
    }
}
