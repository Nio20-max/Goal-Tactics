package androidx.browser.trusted;

import androidx.concurrent.futures.ResolvableFuture;
import com.google.common.util.concurrent.ListenableFuture;

/* JADX INFO: loaded from: classes.dex */
class FutureUtils {
    static <T> ListenableFuture<T> immediateFailedFuture(Throwable cause) {
        ResolvableFuture resolvableFutureCreate = ResolvableFuture.create();
        resolvableFutureCreate.setException(cause);
        return resolvableFutureCreate;
    }

    private FutureUtils() {
    }
}
