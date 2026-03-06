package com.helpshift.websockets;

import java.net.InetSocketAddress;

/* JADX INFO: loaded from: classes2.dex */
class Address {
    private final String mHost;
    private final int mPort;
    private transient String mString;

    Address(String str, int i) {
        this.mHost = str;
        this.mPort = i;
    }

    InetSocketAddress toInetSocketAddress() {
        return new InetSocketAddress(this.mHost, this.mPort);
    }

    String getHostname() {
        return this.mHost;
    }

    public String toString() {
        if (this.mString == null) {
            this.mString = String.format("%s:%d", this.mHost, Integer.valueOf(this.mPort));
        }
        return this.mString;
    }
}
