package com.helpshift.websockets;

/* JADX INFO: loaded from: classes2.dex */
class PongSender extends PeriodicalFrameSender {
    private static final String TIMER_NAME = "PongSender";

    public PongSender(WebSocket webSocket, PayloadGenerator payloadGenerator) {
        super(webSocket, TIMER_NAME, payloadGenerator);
    }

    @Override // com.helpshift.websockets.PeriodicalFrameSender
    protected WebSocketFrame createFrame(byte[] bArr) {
        return WebSocketFrame.createPongFrame(bArr);
    }
}
