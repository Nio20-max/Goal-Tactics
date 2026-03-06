package com.helpshift.util;

/* JADX INFO: loaded from: classes2.dex */
public interface Callback<T, V> {
    void onFailure(V v);

    void onSuccess(T t);
}
