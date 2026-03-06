package com.helpshift.websockets;

/* JADX INFO: loaded from: classes2.dex */
public class StatusLine {
    private final String mHttpVersion;
    private final String mReasonPhrase;
    private final int mStatusCode;
    private final String mString;

    StatusLine(String str) {
        String[] strArrSplit = str.split(" +", 3);
        if (strArrSplit.length < 2) {
            throw new IllegalArgumentException();
        }
        this.mHttpVersion = strArrSplit[0];
        this.mStatusCode = Integer.parseInt(strArrSplit[1]);
        this.mReasonPhrase = strArrSplit.length == 3 ? strArrSplit[2] : null;
        this.mString = str;
    }

    public String getHttpVersion() {
        return this.mHttpVersion;
    }

    public int getStatusCode() {
        return this.mStatusCode;
    }

    public String getReasonPhrase() {
        return this.mReasonPhrase;
    }

    public String toString() {
        return this.mString;
    }
}
