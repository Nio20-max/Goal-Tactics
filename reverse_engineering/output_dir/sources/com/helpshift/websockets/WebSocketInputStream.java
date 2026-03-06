package com.helpshift.websockets;

import com.ironsource.sdk.precache.DownloadManager;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: loaded from: classes2.dex */
class WebSocketInputStream extends FilterInputStream {
    public WebSocketInputStream(InputStream inputStream) {
        super(inputStream);
    }

    public String readLine() throws IOException {
        return Misc.readLine(this, DownloadManager.UTF8_CHARSET);
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00e0  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.helpshift.websockets.WebSocketFrame readFrame() throws java.io.IOException, com.helpshift.websockets.WebSocketException {
        /*
            Method dump skipped, instruction units count: 252
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.websockets.WebSocketInputStream.readFrame():com.helpshift.websockets.WebSocketFrame");
    }

    void readBytes(byte[] bArr, int i) throws IOException, WebSocketException {
        int i2 = 0;
        while (i2 < i) {
            int i3 = read(bArr, i2, i - i2);
            if (i3 <= 0) {
                throw new InsufficientDataException(i, i2);
            }
            i2 += i3;
        }
    }

    private void skipQuietly(long j) {
        try {
            skip(j);
        } catch (IOException unused) {
        }
    }

    private byte[] readPayload(long j, boolean z, byte[] bArr) throws IOException, WebSocketException {
        if (j == 0) {
            return null;
        }
        int i = (int) j;
        try {
            byte[] bArr2 = new byte[i];
            readBytes(bArr2, i);
            if (z) {
                WebSocketFrame.mask(bArr, bArr2);
            }
            return bArr2;
        } catch (OutOfMemoryError e) {
            skipQuietly(j);
            throw new WebSocketException(WebSocketError.INSUFFICIENT_MEMORY_FOR_PAYLOAD, "OutOfMemoryError occurred during a trial to allocate a memory area for a frame's payload: " + e.getMessage(), e);
        }
    }
}
