package com.helpshift.websockets;

import androidx.core.view.InputDeviceCompat;
import androidx.fragment.app.FragmentTransaction;

/* JADX INFO: loaded from: classes2.dex */
class DeflateUtil {
    private static int[] INDICES_FROM_CODE_LENGTH_ORDER = {16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15};

    DeflateUtil() {
    }

    public static void readDynamicTables(ByteArray byteArray, int[] iArr, Huffman[] huffmanArr) throws FormatException {
        int bits = byteArray.readBits(iArr, 5) + 257;
        int bits2 = byteArray.readBits(iArr, 5) + 1;
        int bits3 = byteArray.readBits(iArr, 4) + 4;
        int[] iArr2 = new int[19];
        for (int i = 0; i < bits3; i++) {
            iArr2[INDICES_FROM_CODE_LENGTH_ORDER[i]] = (byte) byteArray.readBits(iArr, 3);
        }
        Huffman huffman = new Huffman(iArr2);
        int[] iArr3 = new int[bits];
        readCodeLengths(byteArray, iArr, iArr3, huffman);
        Huffman huffman2 = new Huffman(iArr3);
        int[] iArr4 = new int[bits2];
        readCodeLengths(byteArray, iArr, iArr4, huffman);
        Huffman huffman3 = new Huffman(iArr4);
        huffmanArr[0] = huffman2;
        huffmanArr[1] = huffman3;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0052 A[LOOP:1: B:19:0x0050->B:20:0x0052, LOOP_END] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void readCodeLengths(com.helpshift.websockets.ByteArray r7, int[] r8, int[] r9, com.helpshift.websockets.Huffman r10) throws com.helpshift.websockets.FormatException {
        /*
            r0 = 0
            r1 = 0
        L2:
            int r2 = r9.length
            if (r1 >= r2) goto L5e
            int r2 = r10.readSym(r7, r8)
            r3 = 1
            if (r2 < 0) goto L13
            r4 = 15
            if (r2 > r4) goto L13
            r9[r1] = r2
            goto L5c
        L13:
            r4 = 2
            r5 = 3
            switch(r2) {
                case 16: goto L46;
                case 17: goto L3e;
                case 18: goto L36;
                default: goto L18;
            }
        L18:
            java.lang.Object[] r7 = new java.lang.Object[r5]
            java.lang.Class<com.helpshift.websockets.DeflateUtil> r9 = com.helpshift.websockets.DeflateUtil.class
            java.lang.String r9 = r9.getSimpleName()
            r7[r0] = r9
            java.lang.Integer r9 = java.lang.Integer.valueOf(r2)
            r7[r3] = r9
            r7[r4] = r8
            java.lang.String r8 = "[%s] Bad code length '%d' at the bit index '%d'."
            java.lang.String r7 = java.lang.String.format(r8, r7)
            com.helpshift.websockets.FormatException r8 = new com.helpshift.websockets.FormatException
            r8.<init>(r7)
            throw r8
        L36:
            r2 = 7
            int r2 = r7.readBits(r8, r2)
            int r2 = r2 + 11
            goto L43
        L3e:
            int r2 = r7.readBits(r8, r5)
            int r2 = r2 + r5
        L43:
            r4 = r2
            r2 = 0
            goto L4f
        L46:
            int r2 = r1 + (-1)
            r2 = r9[r2]
            int r4 = r7.readBits(r8, r4)
            int r4 = r4 + r5
        L4f:
            r5 = 0
        L50:
            if (r5 >= r4) goto L59
            int r6 = r1 + r5
            r9[r6] = r2
            int r5 = r5 + 1
            goto L50
        L59:
            int r4 = r4 + (-1)
            int r1 = r1 + r4
        L5c:
            int r1 = r1 + r3
            goto L2
        L5e:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.websockets.DeflateUtil.readCodeLengths(com.helpshift.websockets.ByteArray, int[], int[], com.helpshift.websockets.Huffman):void");
    }

    public static int readLength(ByteArray byteArray, int[] iArr, int i) throws FormatException {
        int i2;
        int i3 = 5;
        switch (i) {
            case 257:
            case 258:
            case 259:
            case 260:
            case 261:
            case 262:
            case 263:
            case 264:
                return i - 254;
            case 265:
                i2 = 11;
                i3 = 1;
                return i2 + byteArray.readBits(iArr, i3);
            case 266:
                i2 = 13;
                i3 = 1;
                return i2 + byteArray.readBits(iArr, i3);
            case 267:
                i2 = 15;
                i3 = 1;
                return i2 + byteArray.readBits(iArr, i3);
            case 268:
                i2 = 17;
                i3 = 1;
                return i2 + byteArray.readBits(iArr, i3);
            case 269:
                i2 = 19;
                i3 = 2;
                return i2 + byteArray.readBits(iArr, i3);
            case 270:
                i2 = 23;
                i3 = 2;
                return i2 + byteArray.readBits(iArr, i3);
            case 271:
                i2 = 27;
                i3 = 2;
                return i2 + byteArray.readBits(iArr, i3);
            case 272:
                i2 = 31;
                i3 = 2;
                return i2 + byteArray.readBits(iArr, i3);
            case 273:
                i2 = 35;
                i3 = 3;
                return i2 + byteArray.readBits(iArr, i3);
            case 274:
                i2 = 43;
                i3 = 3;
                return i2 + byteArray.readBits(iArr, i3);
            case 275:
                i2 = 51;
                i3 = 3;
                return i2 + byteArray.readBits(iArr, i3);
            case 276:
                i2 = 59;
                i3 = 3;
                return i2 + byteArray.readBits(iArr, i3);
            case 277:
                i2 = 67;
                i3 = 4;
                return i2 + byteArray.readBits(iArr, i3);
            case 278:
                i2 = 83;
                i3 = 4;
                return i2 + byteArray.readBits(iArr, i3);
            case 279:
                i2 = 99;
                i3 = 4;
                return i2 + byteArray.readBits(iArr, i3);
            case 280:
                i2 = 115;
                i3 = 4;
                return i2 + byteArray.readBits(iArr, i3);
            case 281:
                i2 = 131;
                return i2 + byteArray.readBits(iArr, i3);
            case 282:
                i2 = 163;
                return i2 + byteArray.readBits(iArr, i3);
            case 283:
                i2 = 195;
                return i2 + byteArray.readBits(iArr, i3);
            case 284:
                i2 = 227;
                return i2 + byteArray.readBits(iArr, i3);
            case 285:
                return 258;
            default:
                throw new FormatException(String.format("[%s] Bad literal/length code '%d' at the bit index '%d'.", DeflateUtil.class.getSimpleName(), Integer.valueOf(i), Integer.valueOf(iArr[0])));
        }
    }

    public static int readDistance(ByteArray byteArray, int[] iArr, Huffman huffman) throws FormatException {
        int sym = huffman.readSym(byteArray, iArr);
        int i = 12;
        int i2 = 13;
        switch (sym) {
            case 0:
            case 1:
            case 2:
            case 3:
                return sym + 1;
            case 4:
                i = 1;
                i2 = 5;
                return i2 + byteArray.readBits(iArr, i);
            case 5:
                i = 1;
                i2 = 7;
                return i2 + byteArray.readBits(iArr, i);
            case 6:
                i = 2;
                i2 = 9;
                return i2 + byteArray.readBits(iArr, i);
            case 7:
                i = 2;
                return i2 + byteArray.readBits(iArr, i);
            case 8:
                i2 = 17;
                i = 3;
                return i2 + byteArray.readBits(iArr, i);
            case 9:
                i2 = 25;
                i = 3;
                return i2 + byteArray.readBits(iArr, i);
            case 10:
                i2 = 33;
                i = 4;
                return i2 + byteArray.readBits(iArr, i);
            case 11:
                i2 = 49;
                i = 4;
                return i2 + byteArray.readBits(iArr, i);
            case 12:
                i2 = 65;
                i = 5;
                return i2 + byteArray.readBits(iArr, i);
            case 13:
                i2 = 97;
                i = 5;
                return i2 + byteArray.readBits(iArr, i);
            case 14:
                i2 = 129;
                i = 6;
                return i2 + byteArray.readBits(iArr, i);
            case 15:
                i2 = 193;
                i = 6;
                return i2 + byteArray.readBits(iArr, i);
            case 16:
                i2 = 257;
                i = 7;
                return i2 + byteArray.readBits(iArr, i);
            case 17:
                i2 = 385;
                i = 7;
                return i2 + byteArray.readBits(iArr, i);
            case 18:
                i2 = InputDeviceCompat.SOURCE_DPAD;
                i = 8;
                return i2 + byteArray.readBits(iArr, i);
            case 19:
                i2 = 769;
                i = 8;
                return i2 + byteArray.readBits(iArr, i);
            case 20:
                i2 = 1025;
                i = 9;
                return i2 + byteArray.readBits(iArr, i);
            case 21:
                i2 = 1537;
                i = 9;
                return i2 + byteArray.readBits(iArr, i);
            case 22:
                i2 = 2049;
                i = 10;
                return i2 + byteArray.readBits(iArr, i);
            case 23:
                i2 = 3073;
                i = 10;
                return i2 + byteArray.readBits(iArr, i);
            case 24:
                i2 = FragmentTransaction.TRANSIT_FRAGMENT_OPEN;
                i = 11;
                return i2 + byteArray.readBits(iArr, i);
            case 25:
                i2 = 6145;
                i = 11;
                return i2 + byteArray.readBits(iArr, i);
            case 26:
                i2 = 8193;
                return i2 + byteArray.readBits(iArr, i);
            case 27:
                i2 = 12289;
                return i2 + byteArray.readBits(iArr, i);
            case 28:
                i = 13;
                i2 = 16385;
                return i2 + byteArray.readBits(iArr, i);
            case 29:
                i = 13;
                i2 = 24577;
                return i2 + byteArray.readBits(iArr, i);
            default:
                throw new FormatException(String.format("[%s] Bad distance code '%d' at the bit index '%d'.", DeflateUtil.class.getSimpleName(), Integer.valueOf(sym), Integer.valueOf(iArr[0])));
        }
    }
}
