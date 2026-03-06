package com.helpshift.websockets;

/* JADX INFO: loaded from: classes2.dex */
class FinishThread extends WebSocketThread {
    public FinishThread(WebSocket webSocket) {
        super("FinishThread", webSocket, ThreadType.FINISH_THREAD);
    }

    @Override // com.helpshift.websockets.WebSocketThread
    public void runMain() {
        this.mWebSocket.finish();
    }
}
