package com.microsoft.appcenter;

/* JADX INFO: loaded from: classes2.dex */
public class CancellationException extends Exception {
    public CancellationException() {
        super("Request cancelled because Channel is disabled.");
    }
}
