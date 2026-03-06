package com.helpshift.common.exception;

/* JADX INFO: loaded from: classes2.dex */
public class RootAPIException extends RuntimeException {
    public final Exception exception;
    public final ExceptionType exceptionType;
    public final String message;

    private RootAPIException(Exception exc, ExceptionType exceptionType, String str) {
        super(str, exc);
        this.exception = exc;
        this.exceptionType = exceptionType;
        this.message = str;
    }

    public static RootAPIException wrap(Exception exc) {
        return wrap(exc, null);
    }

    public static RootAPIException wrap(Exception exc, ExceptionType exceptionType) {
        return wrap(exc, exceptionType, null);
    }

    public static RootAPIException wrap(Exception exc, ExceptionType exceptionType, String str) {
        if (exc instanceof RootAPIException) {
            RootAPIException rootAPIException = (RootAPIException) exc;
            Exception exc2 = rootAPIException.exception;
            if (exceptionType == null) {
                exceptionType = rootAPIException.exceptionType;
            }
            if (str == null) {
                str = rootAPIException.message;
            }
            exc = exc2;
        } else if (exceptionType == null) {
            exceptionType = UnexpectedException.GENERIC;
        }
        return new RootAPIException(exc, exceptionType, str);
    }

    public int getServerStatusCode() {
        ExceptionType exceptionType = this.exceptionType;
        if (exceptionType instanceof NetworkException) {
            return ((NetworkException) exceptionType).serverStatusCode;
        }
        return 0;
    }

    public boolean shouldLog() {
        return this.exception != null;
    }
}
