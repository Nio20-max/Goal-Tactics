package com.helpshift.util;

import android.content.Context;
import android.view.View;
import android.view.inputmethod.InputMethodManager;

/* JADX INFO: loaded from: classes2.dex */
public class KeyboardUtil {
    public static void hideKeyboard(Context context, View view) {
        ((InputMethodManager) context.getSystemService("input_method")).hideSoftInputFromWindow(view.getWindowToken(), 0);
    }

    public static void showKeyboard(Context context, View view) {
        ((InputMethodManager) context.getSystemService("input_method")).showSoftInput(view, 1);
    }
}
