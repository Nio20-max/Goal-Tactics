package com.helpshift.support.imageloader;

import android.graphics.Bitmap;
import com.helpshift.util.Callback;

/* JADX INFO: loaded from: classes2.dex */
interface BitmapProvider {
    void getBitmap(int i, boolean z, Callback<Bitmap, String> callback);

    String getSource();
}
