package com.helpshift.websockets;

/* JADX INFO: loaded from: classes2.dex */
abstract class PerMessageCompressionExtension extends WebSocketExtension {
    protected abstract byte[] compress(byte[] bArr) throws WebSocketException;

    protected abstract byte[] decompress(byte[] bArr) throws WebSocketException;

    public PerMessageCompressionExtension(String str) {
        super(str);
    }
}
