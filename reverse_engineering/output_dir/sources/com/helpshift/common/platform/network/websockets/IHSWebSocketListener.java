package com.helpshift.common.platform.network.websockets;

/* JADX INFO: loaded from: classes2.dex */
public interface IHSWebSocketListener {
    void onConnected(HSWebSocket hSWebSocket);

    void onDisconnected();

    void onError(HSWebSocket hSWebSocket, String str);

    void onMessage(HSWebSocket hSWebSocket, String str);
}
