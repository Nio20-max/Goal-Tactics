package com.helpshift.common.dao;

/* JADX INFO: loaded from: classes2.dex */
public class DAOResult<T> {
    private final T data;
    private final boolean isSuccess;

    public DAOResult(boolean z, T t) {
        this.isSuccess = z;
        this.data = t;
    }

    public T getData() {
        return this.data;
    }

    public boolean isSuccess() {
        return this.isSuccess;
    }
}
