package com.helpshift.views;

import android.view.View;
import com.google.android.material.snackbar.Snackbar;

/* JADX INFO: loaded from: classes2.dex */
public class HSSnackbar {
    public static Snackbar make(View view, CharSequence charSequence, int i) {
        Snackbar snackbarMake = Snackbar.make(view, charSequence, i);
        FontApplier.apply(snackbarMake.getView());
        return snackbarMake;
    }

    public static Snackbar make(View view, int i, int i2) {
        return make(view, view.getResources().getText(i), i2);
    }
}
