package com.helpshift.websockets;

/* JADX INFO: loaded from: classes2.dex */
class CounterPayloadGenerator implements PayloadGenerator {
    private long mCount;

    CounterPayloadGenerator() {
    }

    @Override // com.helpshift.websockets.PayloadGenerator
    public byte[] generate() {
        long jMax = Math.max(this.mCount + 1, 1L);
        this.mCount = jMax;
        return Misc.getBytesUTF8(String.valueOf(jMax));
    }
}
