package com.microsoft.appcenter.utils.async;

/* JADX INFO: loaded from: classes2.dex */
public interface AppCenterFuture<T> {
    T get();

    boolean isDone();

    void thenAccept(AppCenterConsumer<T> function);
}
