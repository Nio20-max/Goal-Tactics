package com.helpshift.websockets;

import java.util.Map;
import kotlin.UByte;

/* JADX INFO: loaded from: classes2.dex */
class PerMessageDeflateExtension extends PerMessageCompressionExtension {
    private static final String CLIENT_MAX_WINDOW_BITS = "client_max_window_bits";
    private static final String CLIENT_NO_CONTEXT_TAKEOVER = "client_no_context_takeover";
    private static final byte[] COMPRESSION_TERMINATOR = {0, 0, -1, -1};
    private static final int INCOMING_SLIDING_WINDOW_MARGIN = 1024;
    private static final int MAX_BITS = 15;
    private static final int MAX_WINDOW_SIZE = 32768;
    private static final int MIN_BITS = 8;
    private static final int MIN_WINDOW_SIZE = 256;
    private static final String SERVER_MAX_WINDOW_BITS = "server_max_window_bits";
    private static final String SERVER_NO_CONTEXT_TAKEOVER = "server_no_context_takeover";
    private boolean mClientNoContextTakeover;
    private int mClientWindowSize;
    private ByteArray mIncomingSlidingWindow;
    private int mIncomingSlidingWindowBufferSize;
    private boolean mServerNoContextTakeover;
    private int mServerWindowSize;

    public PerMessageDeflateExtension() {
        super(WebSocketExtension.PERMESSAGE_DEFLATE);
        this.mServerWindowSize = 32768;
        this.mClientWindowSize = 32768;
    }

    public PerMessageDeflateExtension(String str) {
        super(str);
        this.mServerWindowSize = 32768;
        this.mClientWindowSize = 32768;
    }

    private static byte[] adjustCompressedData(byte[] bArr) throws FormatException {
        ByteArray byteArray = new ByteArray(bArr.length + 1);
        byteArray.put(bArr);
        int[] iArr = new int[1];
        boolean[] zArr = new boolean[1];
        while (skipBlock(byteArray, iArr, zArr)) {
        }
        if (zArr[0]) {
            return byteArray.toBytes(0, (((iArr[0] - 1) / 8) + 1) - 4);
        }
        appendEmptyBlock(byteArray, iArr);
        return byteArray.toBytes(0, ((iArr[0] - 1) / 8) + 1);
    }

    private static void appendEmptyBlock(ByteArray byteArray, int[] iArr) {
        int i = iArr[0] % 8;
        if (i == 0 || i == 6 || i == 7) {
            byteArray.put(0);
        }
        iArr[0] = iArr[0] + 3;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0051  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static boolean skipBlock(com.helpshift.websockets.ByteArray r5, int[] r6, boolean[] r7) throws com.helpshift.websockets.FormatException {
        /*
            boolean r0 = r5.readBit(r6)
            r1 = 1
            r2 = 0
            if (r0 == 0) goto Le
            r3 = r6[r2]
            int r3 = r3 - r1
            r5.clearBit(r3)
        Le:
            r3 = 2
            int r4 = r5.readBits(r6, r3)
            if (r4 == 0) goto L40
            if (r4 == r1) goto L3b
            if (r4 != r3) goto L1d
            skipDynamicBlock(r5, r6)
            goto L3e
        L1d:
            java.lang.Object[] r5 = new java.lang.Object[r3]
            java.lang.Class<com.helpshift.websockets.PerMessageDeflateExtension> r7 = com.helpshift.websockets.PerMessageDeflateExtension.class
            java.lang.String r7 = r7.getSimpleName()
            r5[r2] = r7
            r6 = r6[r2]
            java.lang.Integer r6 = java.lang.Integer.valueOf(r6)
            r5[r1] = r6
            java.lang.String r6 = "[%s] Bad compression type '11' at the bit index '%d'."
            java.lang.String r5 = java.lang.String.format(r6, r5)
            com.helpshift.websockets.FormatException r6 = new com.helpshift.websockets.FormatException
            r6.<init>(r5)
            throw r6
        L3b:
            skipFixedBlock(r5, r6)
        L3e:
            r3 = 0
            goto L47
        L40:
            int r3 = skipPlainBlock(r5, r6)
            if (r3 != 0) goto L3e
            r3 = 1
        L47:
            int r5 = r5.length()
            r6 = r6[r2]
            int r6 = r6 / 8
            if (r5 > r6) goto L52
            r0 = 1
        L52:
            if (r0 == 0) goto L58
            if (r3 == 0) goto L58
            r7[r2] = r1
        L58:
            r5 = r0 ^ 1
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.websockets.PerMessageDeflateExtension.skipBlock(com.helpshift.websockets.ByteArray, int[], boolean[]):boolean");
    }

    private static int skipPlainBlock(ByteArray byteArray, int[] iArr) {
        int i = ((iArr[0] + 7) & (-8)) / 8;
        int i2 = (byteArray.get(i) & UByte.MAX_VALUE) + ((byteArray.get(i + 1) & UByte.MAX_VALUE) * 256);
        iArr[0] = (i + 4 + i2) * 8;
        return i2;
    }

    private static void skipFixedBlock(ByteArray byteArray, int[] iArr) throws FormatException {
        skipData(byteArray, iArr, FixedLiteralLengthHuffman.getInstance(), FixedDistanceHuffman.getInstance());
    }

    private static void skipDynamicBlock(ByteArray byteArray, int[] iArr) throws FormatException {
        Huffman[] huffmanArr = new Huffman[2];
        DeflateUtil.readDynamicTables(byteArray, iArr, huffmanArr);
        skipData(byteArray, iArr, huffmanArr[0], huffmanArr[1]);
    }

    private static void skipData(ByteArray byteArray, int[] iArr, Huffman huffman, Huffman huffman2) throws FormatException {
        while (true) {
            int sym = huffman.readSym(byteArray, iArr);
            if (sym == 256) {
                return;
            }
            if (sym < 0 || sym > 255) {
                DeflateUtil.readLength(byteArray, iArr, sym);
                DeflateUtil.readDistance(byteArray, iArr, huffman2);
            }
        }
    }

    @Override // com.helpshift.websockets.WebSocketExtension
    void validate() throws WebSocketException {
        for (Map.Entry<String, String> entry : getParameters().entrySet()) {
            validateParameter(entry.getKey(), entry.getValue());
        }
        this.mIncomingSlidingWindowBufferSize = this.mServerWindowSize + 1024;
    }

    public boolean isServerNoContextTakeover() {
        return this.mServerNoContextTakeover;
    }

    public boolean isClientNoContextTakeover() {
        return this.mClientNoContextTakeover;
    }

    public int getServerWindowSize() {
        return this.mServerWindowSize;
    }

    public int getClientWindowSize() {
        return this.mClientWindowSize;
    }

    private void validateParameter(String str, String str2) throws WebSocketException {
        if (SERVER_NO_CONTEXT_TAKEOVER.equals(str)) {
            this.mServerNoContextTakeover = true;
            return;
        }
        if (CLIENT_NO_CONTEXT_TAKEOVER.equals(str)) {
            this.mClientNoContextTakeover = true;
            return;
        }
        if (SERVER_MAX_WINDOW_BITS.equals(str)) {
            this.mServerWindowSize = computeWindowSize(str, str2);
            return;
        }
        if (CLIENT_MAX_WINDOW_BITS.equals(str)) {
            this.mClientWindowSize = computeWindowSize(str, str2);
            return;
        }
        throw new WebSocketException(WebSocketError.PERMESSAGE_DEFLATE_UNSUPPORTED_PARAMETER, "permessage-deflate extension contains an unsupported parameter: " + str);
    }

    private int computeWindowSize(String str, String str2) throws WebSocketException {
        int iExtractMaxWindowBits = extractMaxWindowBits(str, str2);
        int i = 256;
        for (int i2 = 8; i2 < iExtractMaxWindowBits; i2++) {
            i *= 2;
        }
        return i;
    }

    private int extractMaxWindowBits(String str, String str2) throws WebSocketException {
        int maxWindowBits = parseMaxWindowBits(str2);
        if (maxWindowBits >= 0) {
            return maxWindowBits;
        }
        throw new WebSocketException(WebSocketError.PERMESSAGE_DEFLATE_INVALID_MAX_WINDOW_BITS, String.format("The value of %s parameter of permessage-deflate extension is invalid: %s", str, str2));
    }

    private int parseMaxWindowBits(String str) {
        int i;
        if (str == null) {
            return -1;
        }
        try {
            i = Integer.parseInt(str);
        } catch (NumberFormatException unused) {
        }
        if (i < 8 || 15 < i) {
            return -1;
        }
        return i;
    }

    @Override // com.helpshift.websockets.PerMessageCompressionExtension
    protected byte[] decompress(byte[] bArr) throws WebSocketException {
        int length = bArr.length;
        byte[] bArr2 = COMPRESSION_TERMINATOR;
        ByteArray byteArray = new ByteArray(length + bArr2.length);
        byteArray.put(bArr);
        byteArray.put(bArr2);
        if (this.mIncomingSlidingWindow == null) {
            this.mIncomingSlidingWindow = new ByteArray(this.mIncomingSlidingWindowBufferSize);
        }
        int length2 = this.mIncomingSlidingWindow.length();
        try {
            DeflateDecompressor.decompress(byteArray, this.mIncomingSlidingWindow);
            byte[] bytes = this.mIncomingSlidingWindow.toBytes(length2);
            this.mIncomingSlidingWindow.shrink(this.mIncomingSlidingWindowBufferSize);
            if (this.mServerNoContextTakeover) {
                this.mIncomingSlidingWindow.clear();
            }
            return bytes;
        } catch (Exception e) {
            throw new WebSocketException(WebSocketError.DECOMPRESSION_ERROR, String.format("Failed to decompress the message: %s", e.getMessage()), e);
        }
    }

    @Override // com.helpshift.websockets.PerMessageCompressionExtension
    protected byte[] compress(byte[] bArr) throws WebSocketException {
        if (!canCompress(bArr)) {
            return bArr;
        }
        try {
            return adjustCompressedData(DeflateCompressor.compress(bArr));
        } catch (Exception e) {
            throw new WebSocketException(WebSocketError.COMPRESSION_ERROR, String.format("Failed to compress the message: %s", e.getMessage()), e);
        }
    }

    private boolean canCompress(byte[] bArr) {
        int i = this.mClientWindowSize;
        return i == 32768 || bArr.length < i;
    }
}
