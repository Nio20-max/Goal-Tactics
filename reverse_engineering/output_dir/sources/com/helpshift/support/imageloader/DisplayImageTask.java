package com.helpshift.support.imageloader;

import android.graphics.Bitmap;
import android.widget.ImageView;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes2.dex */
class DisplayImageTask implements Runnable {
    private Bitmap bitmap;
    private WeakReference<ImageLoaderCallback> callback;
    private WeakReference<ImageView> target;

    DisplayImageTask(Bitmap bitmap, WeakReference<ImageView> weakReference, WeakReference<ImageLoaderCallback> weakReference2) {
        this.bitmap = bitmap;
        this.target = weakReference;
        this.callback = weakReference2;
    }

    @Override // java.lang.Runnable
    public void run() {
        if (this.target.get() != null && this.bitmap != null) {
            this.target.get().setImageBitmap(this.bitmap);
        }
        if (this.callback.get() != null) {
            this.callback.get().onSuccess();
        }
    }
}
