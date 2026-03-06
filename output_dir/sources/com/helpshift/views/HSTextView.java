package com.helpshift.views;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.text.SpannableString;
import android.util.AttributeSet;
import android.widget.TextView;
import androidx.appcompat.widget.AppCompatTextView;

/* JADX INFO: loaded from: classes2.dex */
public class HSTextView extends AppCompatTextView {
    public HSTextView(Context context) {
        super(context);
        init();
    }

    public HSTextView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public HSTextView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        FontApplier.apply((TextView) this);
    }

    @Override // android.widget.TextView
    public void setError(CharSequence charSequence, Drawable drawable) {
        if (charSequence == null) {
            super.setError(charSequence, drawable);
            return;
        }
        HSTypefaceSpan typefaceSpan = FontApplier.getTypefaceSpan();
        if (typefaceSpan == null) {
            super.setError(charSequence, drawable);
            return;
        }
        SpannableString spannableString = new SpannableString(charSequence);
        spannableString.setSpan(typefaceSpan, 0, charSequence.length(), 17);
        super.setError(spannableString, drawable);
    }
}
