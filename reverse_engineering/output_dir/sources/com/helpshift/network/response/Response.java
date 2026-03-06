package com.helpshift.network.response;

import com.helpshift.network.errors.NetworkError;

/* JADX INFO: loaded from: classes2.dex */
public class Response<T> {
    public final NetworkError error;
    public final T result;

    public interface ErrorListener {
        void onErrorResponse(NetworkError networkError, Integer num);
    }

    public interface Listener<T> {
        void onResponse(T t, Integer num);
    }

    private Response(T t, Integer num) {
        this.result = t;
        this.error = null;
    }

    private Response(NetworkError networkError, Integer num) {
        this.result = null;
        this.error = networkError;
    }

    public static <T> Response<T> success(T t, Integer num) {
        return new Response<>(t, num);
    }

    public static <T> Response<T> error(NetworkError networkError, Integer num) {
        return new Response<>(networkError, num);
    }

    public boolean isSuccess() {
        return this.error == null;
    }
}
