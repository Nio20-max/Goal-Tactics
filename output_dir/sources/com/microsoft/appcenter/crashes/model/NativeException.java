package com.microsoft.appcenter.crashes.model;

/* JADX INFO: loaded from: classes2.dex */
public class NativeException extends RuntimeException {
    private static final String CRASH_MESSAGE = "Native exception read from a minidump file";

    public NativeException() {
        super(CRASH_MESSAGE);
    }
}
