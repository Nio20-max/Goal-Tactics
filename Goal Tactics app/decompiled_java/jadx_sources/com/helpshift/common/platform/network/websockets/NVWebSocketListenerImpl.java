package com.helpshift.common.platform.network.websockets;

import com.helpshift.websockets.ThreadType;
import com.helpshift.websockets.WebSocket;
import com.helpshift.websockets.WebSocketException;
import com.helpshift.websockets.WebSocketFrame;
import com.helpshift.websockets.WebSocketListener;
import com.helpshift.websockets.WebSocketState;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
class NVWebSocketListenerImpl implements WebSocketListener {
    private final IHSWebSocketListener delegateWebSocketListener;
    private final HSWebSocket hsWebSocket;

    @Override // com.helpshift.websockets.WebSocketListener
    public void handleCallbackError(WebSocket webSocket, Throwable th) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onBinaryFrame(WebSocket webSocket, WebSocketFrame webSocketFrame) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onBinaryMessage(WebSocket webSocket, byte[] bArr) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onCloseFrame(WebSocket webSocket, WebSocketFrame webSocketFrame) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onConnectError(WebSocket webSocket, WebSocketException webSocketException) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onContinuationFrame(WebSocket webSocket, WebSocketFrame webSocketFrame) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onFrame(WebSocket webSocket, WebSocketFrame webSocketFrame) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onFrameError(WebSocket webSocket, WebSocketException webSocketException, WebSocketFrame webSocketFrame) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onFrameSent(WebSocket webSocket, WebSocketFrame webSocketFrame) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onFrameUnsent(WebSocket webSocket, WebSocketFrame webSocketFrame) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onMessageError(WebSocket webSocket, WebSocketException webSocketException, List<WebSocketFrame> list) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onPingFrame(WebSocket webSocket, WebSocketFrame webSocketFrame) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onPongFrame(WebSocket webSocket, WebSocketFrame webSocketFrame) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onSendingFrame(WebSocket webSocket, WebSocketFrame webSocketFrame) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onSendingHandshake(WebSocket webSocket, String str, List<String[]> list) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onStateChanged(WebSocket webSocket, WebSocketState webSocketState) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onTextFrame(WebSocket webSocket, WebSocketFrame webSocketFrame) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onThreadCreated(WebSocket webSocket, ThreadType threadType, Thread thread) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onThreadStarted(WebSocket webSocket, ThreadType threadType, Thread thread) throws Exception {
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onThreadStopping(WebSocket webSocket, ThreadType threadType, Thread thread) throws Exception {
    }

    NVWebSocketListenerImpl(HSWebSocket hSWebSocket, IHSWebSocketListener iHSWebSocketListener) {
        this.delegateWebSocketListener = iHSWebSocketListener;
        this.hsWebSocket = hSWebSocket;
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onConnected(WebSocket webSocket, Map<String, List<String>> map) throws Exception {
        this.delegateWebSocketListener.onConnected(this.hsWebSocket);
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onDisconnected(WebSocket webSocket, WebSocketFrame webSocketFrame, WebSocketFrame webSocketFrame2, boolean z) throws Exception {
        this.delegateWebSocketListener.onDisconnected();
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onTextMessage(WebSocket webSocket, String str) throws Exception {
        this.delegateWebSocketListener.onMessage(this.hsWebSocket, str);
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onError(WebSocket webSocket, WebSocketException webSocketException) throws Exception {
        this.delegateWebSocketListener.onError(this.hsWebSocket, webSocketException.getMessage());
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onMessageDecompressionError(WebSocket webSocket, WebSocketException webSocketException, byte[] bArr) throws Exception {
        this.delegateWebSocketListener.onError(this.hsWebSocket, webSocketException.getMessage());
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onTextMessageError(WebSocket webSocket, WebSocketException webSocketException, byte[] bArr) throws Exception {
        this.delegateWebSocketListener.onError(this.hsWebSocket, webSocketException.getMessage());
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onSendError(WebSocket webSocket, WebSocketException webSocketException, WebSocketFrame webSocketFrame) throws Exception {
        this.delegateWebSocketListener.onError(this.hsWebSocket, webSocketException.getMessage());
    }

    @Override // com.helpshift.websockets.WebSocketListener
    public void onUnexpectedError(WebSocket webSocket, WebSocketException webSocketException) throws Exception {
        this.delegateWebSocketListener.onError(this.hsWebSocket, webSocketException.getMessage());
    }
}
