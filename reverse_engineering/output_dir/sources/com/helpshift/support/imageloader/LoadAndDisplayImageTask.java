package com.helpshift.support.imageloader;

import android.graphics.Bitmap;
import android.os.Handler;
import android.widget.ImageView;
import com.helpshift.util.Callback;
import com.helpshift.util.HSLogger;
import java.lang.ref.WeakReference;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;

/* JADX INFO: loaded from: classes2.dex */
class LoadAndDisplayImageTask implements Callable<Void>, Callback<Bitmap, String> {
    private static final String TAG = "Helpshift_DisplyImgTsk";
    private WeakReference<ImageLoaderCallback> callback;
    private Future<?> future;
    private final boolean isHardwareAccelerated;
    private BitmapLruCache lruCache;
    private Handler mainThreadHandler;
    private final BitmapProvider provider;
    private WeakReference<ImageView> target;
    private final int width;

    LoadAndDisplayImageTask(BitmapProvider bitmapProvider, int i, boolean z, ImageView imageView, ImageLoaderCallback imageLoaderCallback, BitmapLruCache bitmapLruCache, Handler handler) {
        this.provider = bitmapProvider;
        this.width = i;
        this.isHardwareAccelerated = z;
        this.target = new WeakReference<>(imageView);
        this.callback = new WeakReference<>(imageLoaderCallback);
        this.lruCache = bitmapLruCache;
        this.mainThreadHandler = handler;
    }

    public ImageView getTarget() {
        return this.target.get();
    }

    @Override // java.util.concurrent.Callable
    public final Void call() {
        this.provider.getBitmap(this.width, this.isHardwareAccelerated, this);
        return null;
    }

    public void submit(ExecutorService executorService) {
        try {
            this.future = executorService.submit(this);
        } catch (RejectedExecutionException e) {
            HSLogger.e(TAG, "Rejected execution of image loader task", e);
        }
    }

    public boolean cancel() {
        Future<?> future = this.future;
        return future != null && future.cancel(true);
    }

    boolean isCancelled() {
        Future<?> future = this.future;
        return future != null && future.isCancelled();
    }

    @Override // com.helpshift.util.Callback
    public void onSuccess(Bitmap bitmap) {
        this.lruCache.set(this.provider.getSource(), bitmap);
        this.mainThreadHandler.post(new DisplayImageTask(bitmap, this.target, this.callback));
    }

    @Override // com.helpshift.util.Callback
    public void onFailure(String str) {
        HSLogger.e(TAG, str);
        cancel();
    }
}
