package com.helpshift.views;

import android.content.Context;
import android.content.res.Resources;
import android.widget.Toast;

/* JADX INFO: loaded from: classes2.dex */
public class HSToast {
    public static Toast makeText(Context context, CharSequence charSequence, int i) {
        return Toast.makeText(context, charSequence, i);
    }

    public static Toast makeText(Context context, int i, int i2) throws Resources.NotFoundException {
        return makeText(context, context.getResources().getText(i), i2);
    }
}
