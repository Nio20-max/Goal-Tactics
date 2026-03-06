package com.ironsource.sdk.utils;

import com.facebook.appevents.AppEventsConstants;
import java.io.UnsupportedEncodingException;
import kotlin.UByte;
import kotlin.jvm.internal.ByteCompanionObject;

/* JADX INFO: loaded from: classes2.dex */
public final class MD5Hashing {
    private static final byte[] padding = {ByteCompanionObject.MIN_VALUE, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    private int[] decodeBuffer = new int[16];
    private MD5State finalState;
    private MD5State workingState;

    private static int FF(int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        int i8 = i + ((i3 & i2) | (i4 & (~i2))) + i5 + i7;
        return ((i8 >>> (32 - i6)) | (i8 << i6)) + i2;
    }

    private static int GG(int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        int i8 = i + ((i3 & (~i4)) | (i2 & i4)) + i5 + i7;
        return ((i8 >>> (32 - i6)) | (i8 << i6)) + i2;
    }

    private static int HH(int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        int i8 = i + ((i3 ^ i2) ^ i4) + i5 + i7;
        return ((i8 >>> (32 - i6)) | (i8 << i6)) + i2;
    }

    private static int II(int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        int i8 = i + (i3 ^ ((~i4) | i2)) + i5 + i7;
        return ((i8 >>> (32 - i6)) | (i8 << i6)) + i2;
    }

    private static byte[] encode(long j) {
        return new byte[]{(byte) (j & 255), (byte) ((j >>> 8) & 255), (byte) ((j >>> 16) & 255), (byte) ((j >>> 24) & 255), (byte) ((j >>> 32) & 255), (byte) ((j >>> 40) & 255), (byte) ((j >>> 48) & 255), (byte) ((j >>> 56) & 255)};
    }

    MD5Hashing() {
        this.workingState = new MD5State();
        this.finalState = new MD5State();
        reset();
    }

    public byte[] getHash() {
        if (!this.finalState.valid) {
            this.finalState.copy(this.workingState);
            long j = this.finalState.bitCount;
            int i = (int) ((j >>> 3) & 63);
            update(this.finalState, padding, 0, i < 56 ? 56 - i : 120 - i);
            update(this.finalState, encode(j), 0, 8);
            this.finalState.valid = true;
        }
        return encode(this.finalState.state, 16);
    }

    public String getHashString() {
        return toHex(getHash());
    }

    public static String getHashString(String str) {
        MD5Hashing mD5Hashing = new MD5Hashing();
        mD5Hashing.update(str);
        return mD5Hashing.getHashString();
    }

    public void reset() {
        this.workingState.reset();
        this.finalState.valid = false;
    }

    public String toString() {
        return getHashString();
    }

    private void update(MD5State mD5State, byte[] bArr, int i, int i2) {
        int i3 = 0;
        this.finalState.valid = false;
        if (i2 + i > bArr.length) {
            i2 = bArr.length - i;
        }
        int i4 = ((int) (mD5State.bitCount >>> 3)) & 63;
        mD5State.bitCount += (long) (i2 << 3);
        int i5 = 64 - i4;
        if (i2 >= i5) {
            System.arraycopy(bArr, i, mD5State.buffer, i4, i5);
            transform(mD5State, decode(mD5State.buffer, 64, 0));
            while (i5 + 63 < i2) {
                transform(mD5State, decode(bArr, 64, i5));
                i5 += 64;
            }
            i3 = i5;
            i4 = 0;
        }
        if (i3 < i2) {
            for (int i6 = i3; i6 < i2; i6++) {
                mD5State.buffer[(i4 + i6) - i3] = bArr[i6 + i];
            }
        }
    }

    public void update(byte[] bArr, int i, int i2) {
        update(this.workingState, bArr, i, i2);
    }

    public void update(byte[] bArr, int i) {
        update(bArr, 0, i);
    }

    public void update(byte[] bArr) {
        update(bArr, 0, bArr.length);
    }

    public void update(byte b) {
        update(new byte[]{b}, 1);
    }

    public void update(String str) {
        update(str.getBytes());
    }

    public void update(String str, String str2) throws UnsupportedEncodingException {
        update(str.getBytes(str2));
    }

    private class MD5State {
        private long bitCount;
        private byte[] buffer;
        private int[] state;
        private boolean valid;

        /* JADX INFO: Access modifiers changed from: private */
        public void reset() {
            int[] iArr = this.state;
            iArr[0] = 1732584193;
            iArr[1] = -271733879;
            iArr[2] = -1732584194;
            iArr[3] = 271733878;
            this.bitCount = 0L;
        }

        private MD5State() {
            this.valid = true;
            this.state = new int[4];
            this.buffer = new byte[64];
            reset();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void copy(MD5State mD5State) {
            byte[] bArr = mD5State.buffer;
            byte[] bArr2 = this.buffer;
            System.arraycopy(bArr, 0, bArr2, 0, bArr2.length);
            int[] iArr = mD5State.state;
            int[] iArr2 = this.state;
            System.arraycopy(iArr, 0, iArr2, 0, iArr2.length);
            this.valid = mD5State.valid;
            this.bitCount = mD5State.bitCount;
        }
    }

    private static String toHex(byte[] bArr) {
        StringBuffer stringBuffer = new StringBuffer(bArr.length * 2);
        for (byte b : bArr) {
            int i = b & UByte.MAX_VALUE;
            if (i < 16) {
                stringBuffer.append(AppEventsConstants.EVENT_PARAM_VALUE_NO);
            }
            stringBuffer.append(Integer.toHexString(i));
        }
        return stringBuffer.toString();
    }

    private static byte[] encode(int[] iArr, int i) {
        byte[] bArr = new byte[i];
        int i2 = 0;
        for (int i3 = 0; i3 < i; i3 += 4) {
            bArr[i3] = (byte) (iArr[i2] & 255);
            bArr[i3 + 1] = (byte) ((iArr[i2] >>> 8) & 255);
            bArr[i3 + 2] = (byte) ((iArr[i2] >>> 16) & 255);
            bArr[i3 + 3] = (byte) ((iArr[i2] >>> 24) & 255);
            i2++;
        }
        return bArr;
    }

    private int[] decode(byte[] bArr, int i, int i2) {
        int i3 = 0;
        for (int i4 = 0; i4 < i; i4 += 4) {
            this.decodeBuffer[i3] = (bArr[i4 + i2] & UByte.MAX_VALUE) | ((bArr[(i4 + 1) + i2] & UByte.MAX_VALUE) << 8) | ((bArr[(i4 + 2) + i2] & UByte.MAX_VALUE) << 16) | ((bArr[(i4 + 3) + i2] & UByte.MAX_VALUE) << 24);
            i3++;
        }
        return this.decodeBuffer;
    }

    private static void transform(MD5State mD5State, int[] iArr) {
        int i = mD5State.state[0];
        int i2 = mD5State.state[1];
        int i3 = mD5State.state[2];
        int i4 = mD5State.state[3];
        int iFF = FF(i, i2, i3, i4, iArr[0], 7, -680876936);
        int iFF2 = FF(i4, iFF, i2, i3, iArr[1], 12, -389564586);
        int iFF3 = FF(i3, iFF2, iFF, i2, iArr[2], 17, 606105819);
        int iFF4 = FF(i2, iFF3, iFF2, iFF, iArr[3], 22, -1044525330);
        int iFF5 = FF(iFF, iFF4, iFF3, iFF2, iArr[4], 7, -176418897);
        int iFF6 = FF(iFF2, iFF5, iFF4, iFF3, iArr[5], 12, 1200080426);
        int iFF7 = FF(iFF3, iFF6, iFF5, iFF4, iArr[6], 17, -1473231341);
        int iFF8 = FF(iFF4, iFF7, iFF6, iFF5, iArr[7], 22, -45705983);
        int iFF9 = FF(iFF5, iFF8, iFF7, iFF6, iArr[8], 7, 1770035416);
        int iFF10 = FF(iFF6, iFF9, iFF8, iFF7, iArr[9], 12, -1958414417);
        int iFF11 = FF(iFF7, iFF10, iFF9, iFF8, iArr[10], 17, -42063);
        int iFF12 = FF(iFF8, iFF11, iFF10, iFF9, iArr[11], 22, -1990404162);
        int iFF13 = FF(iFF9, iFF12, iFF11, iFF10, iArr[12], 7, 1804603682);
        int iFF14 = FF(iFF10, iFF13, iFF12, iFF11, iArr[13], 12, -40341101);
        int iFF15 = FF(iFF11, iFF14, iFF13, iFF12, iArr[14], 17, -1502002290);
        int iFF16 = FF(iFF12, iFF15, iFF14, iFF13, iArr[15], 22, 1236535329);
        int iGG = GG(iFF13, iFF16, iFF15, iFF14, iArr[1], 5, -165796510);
        int iGG2 = GG(iFF14, iGG, iFF16, iFF15, iArr[6], 9, -1069501632);
        int iGG3 = GG(iFF15, iGG2, iGG, iFF16, iArr[11], 14, 643717713);
        int iGG4 = GG(iFF16, iGG3, iGG2, iGG, iArr[0], 20, -373897302);
        int iGG5 = GG(iGG, iGG4, iGG3, iGG2, iArr[5], 5, -701558691);
        int iGG6 = GG(iGG2, iGG5, iGG4, iGG3, iArr[10], 9, 38016083);
        int iGG7 = GG(iGG3, iGG6, iGG5, iGG4, iArr[15], 14, -660478335);
        int iGG8 = GG(iGG4, iGG7, iGG6, iGG5, iArr[4], 20, -405537848);
        int iGG9 = GG(iGG5, iGG8, iGG7, iGG6, iArr[9], 5, 568446438);
        int iGG10 = GG(iGG6, iGG9, iGG8, iGG7, iArr[14], 9, -1019803690);
        int iGG11 = GG(iGG7, iGG10, iGG9, iGG8, iArr[3], 14, -187363961);
        int iGG12 = GG(iGG8, iGG11, iGG10, iGG9, iArr[8], 20, 1163531501);
        int iGG13 = GG(iGG9, iGG12, iGG11, iGG10, iArr[13], 5, -1444681467);
        int iGG14 = GG(iGG10, iGG13, iGG12, iGG11, iArr[2], 9, -51403784);
        int iGG15 = GG(iGG11, iGG14, iGG13, iGG12, iArr[7], 14, 1735328473);
        int iGG16 = GG(iGG12, iGG15, iGG14, iGG13, iArr[12], 20, -1926607734);
        int iHH = HH(iGG13, iGG16, iGG15, iGG14, iArr[5], 4, -378558);
        int iHH2 = HH(iGG14, iHH, iGG16, iGG15, iArr[8], 11, -2022574463);
        int iHH3 = HH(iGG15, iHH2, iHH, iGG16, iArr[11], 16, 1839030562);
        int iHH4 = HH(iGG16, iHH3, iHH2, iHH, iArr[14], 23, -35309556);
        int iHH5 = HH(iHH, iHH4, iHH3, iHH2, iArr[1], 4, -1530992060);
        int iHH6 = HH(iHH2, iHH5, iHH4, iHH3, iArr[4], 11, 1272893353);
        int iHH7 = HH(iHH3, iHH6, iHH5, iHH4, iArr[7], 16, -155497632);
        int iHH8 = HH(iHH4, iHH7, iHH6, iHH5, iArr[10], 23, -1094730640);
        int iHH9 = HH(iHH5, iHH8, iHH7, iHH6, iArr[13], 4, 681279174);
        int iHH10 = HH(iHH6, iHH9, iHH8, iHH7, iArr[0], 11, -358537222);
        int iHH11 = HH(iHH7, iHH10, iHH9, iHH8, iArr[3], 16, -722521979);
        int iHH12 = HH(iHH8, iHH11, iHH10, iHH9, iArr[6], 23, 76029189);
        int iHH13 = HH(iHH9, iHH12, iHH11, iHH10, iArr[9], 4, -640364487);
        int iHH14 = HH(iHH10, iHH13, iHH12, iHH11, iArr[12], 11, -421815835);
        int iHH15 = HH(iHH11, iHH14, iHH13, iHH12, iArr[15], 16, 530742520);
        int iHH16 = HH(iHH12, iHH15, iHH14, iHH13, iArr[2], 23, -995338651);
        int iII = II(iHH13, iHH16, iHH15, iHH14, iArr[0], 6, -198630844);
        int iII2 = II(iHH14, iII, iHH16, iHH15, iArr[7], 10, 1126891415);
        int iII3 = II(iHH15, iII2, iII, iHH16, iArr[14], 15, -1416354905);
        int iII4 = II(iHH16, iII3, iII2, iII, iArr[5], 21, -57434055);
        int iII5 = II(iII, iII4, iII3, iII2, iArr[12], 6, 1700485571);
        int iII6 = II(iII2, iII5, iII4, iII3, iArr[3], 10, -1894986606);
        int iII7 = II(iII3, iII6, iII5, iII4, iArr[10], 15, -1051523);
        int iII8 = II(iII4, iII7, iII6, iII5, iArr[1], 21, -2054922799);
        int iII9 = II(iII5, iII8, iII7, iII6, iArr[8], 6, 1873313359);
        int iII10 = II(iII6, iII9, iII8, iII7, iArr[15], 10, -30611744);
        int iII11 = II(iII7, iII10, iII9, iII8, iArr[6], 15, -1560198380);
        int iII12 = II(iII8, iII11, iII10, iII9, iArr[13], 21, 1309151649);
        int iII13 = II(iII9, iII12, iII11, iII10, iArr[4], 6, -145523070);
        int iII14 = II(iII10, iII13, iII12, iII11, iArr[11], 10, -1120210379);
        int iII15 = II(iII11, iII14, iII13, iII12, iArr[2], 15, 718787259);
        int iII16 = II(iII12, iII15, iII14, iII13, iArr[9], 21, -343485551);
        int[] iArr2 = mD5State.state;
        iArr2[0] = iArr2[0] + iII13;
        int[] iArr3 = mD5State.state;
        iArr3[1] = iArr3[1] + iII16;
        int[] iArr4 = mD5State.state;
        iArr4[2] = iArr4[2] + iII15;
        int[] iArr5 = mD5State.state;
        iArr5[3] = iArr5[3] + iII14;
    }
}
