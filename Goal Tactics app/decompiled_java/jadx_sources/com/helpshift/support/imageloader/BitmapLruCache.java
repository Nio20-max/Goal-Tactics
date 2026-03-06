package com.helpshift.support.imageloader;

import android.graphics.Bitmap;
import androidx.collection.LruCache;
import androidx.core.graphics.BitmapCompat;
import com.helpshift.util.HSLogger;

/* JADX INFO: loaded from: classes2.dex */
class BitmapLruCache {
    private static final int CACHE_SIZE = 8388608;
    private static final float MEMORY_FRACTION = 0.15f;
    private static final String TAG = "Helpshift_BtmpLruCache";
    private final LruCache<String, Bitmap> cache;

    BitmapLruCache() {
        int iRound = Math.round(Runtime.getRuntime().maxMemory() * MEMORY_FRACTION);
        this.cache = new LruCache<String, Bitmap>(iRound >= 8388608 ? 8388608 : iRound) { // from class: com.helpshift.support.imageloader.BitmapLruCache.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // androidx.collection.LruCache
            public int sizeOf(String str, Bitmap bitmap) {
                return BitmapCompat.getAllocationByteCount(bitmap);
            }
        };
    }

    public Bitmap get(String str) {
        if (str == null) {
            return null;
        }
        HSLogger.d(TAG, "Bitmap loaded from cache with key: " + str);
        return this.cache.get(str);
    }

    void set(String str, Bitmap bitmap) {
        if (BitmapCompat.getAllocationByteCount(bitmap) > maxSize()) {
            this.cache.remove(str);
        } else {
            this.cache.put(str, bitmap);
        }
    }

    private int maxSize() {
        return this.cache.maxSize();
    }

    void clear() {
        this.cache.evictAll();
    }
}
