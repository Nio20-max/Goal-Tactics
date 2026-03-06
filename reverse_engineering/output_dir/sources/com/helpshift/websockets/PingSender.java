package com.helpshift.websockets;

/* JADX INFO: loaded from: classes2.dex */
class PingSender extends PeriodicalFrameSender {
    private static final String TIMER_NAME = "PingSender";

    public PingSender(WebSocket webSocket, PayloadGenerator payloadGenerator) {
        super(webSocket, TIMER_NAME, payloadGenerator);
    }

    @Override // com.helpshift.websockets.PeriodicalFrameSender
    protected WebSocketFrame createFrame(byte[] bArr) {
        return WebSocketFrame.createPingFrame(bArr);
    }
}
