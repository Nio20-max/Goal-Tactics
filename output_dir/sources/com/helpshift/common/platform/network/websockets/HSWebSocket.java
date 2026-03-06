package com.helpshift.common.platform.network.websockets;

import com.helpshift.util.StringUtils;
import com.helpshift.websockets.WebSocket;
import com.helpshift.websockets.WebSocketException;
import com.helpshift.websockets.WebSocketFactory;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class HSWebSocket {
    private final IHSWebSocketListener listener;
    private final WebSocket mWebSocket;

    HSWebSocket(WebSocket webSocket, IHSWebSocketListener iHSWebSocketListener) {
        this.mWebSocket = webSocket;
        this.listener = iHSWebSocketListener;
        webSocket.addListener(new NVWebSocketListenerImpl(this, iHSWebSocketListener));
    }

    public void connect() {
        try {
            this.mWebSocket.connect();
        } catch (WebSocketException e) {
            this.listener.onError(this, e.getMessage());
        }
    }

    public void disconnect() {
        this.mWebSocket.disconnect();
    }

    public void sendMessage(String str) {
        try {
            this.mWebSocket.sendText(str);
        } catch (Exception e) {
            this.listener.onError(this, e.getMessage());
        }
    }

    public static class Builder {
        private int connectionTimeout;
        private IHSWebSocketListener listener;
        private int socketTimeout;
        private String url;
        private List<String> extensions = new ArrayList();
        private List<String> protocols = new ArrayList();
        private Map<String, String> headers = new HashMap();

        public Builder(String str) {
            this.url = str;
        }

        public Builder setConnectionTimeout(int i) {
            this.connectionTimeout = i;
            return this;
        }

        public Builder setSocketTimeout(int i) {
            this.socketTimeout = i;
            return this;
        }

        public Builder addExtension(String str) {
            this.extensions.add(str);
            return this;
        }

        public Builder addProtocol(String str) {
            this.protocols.add(str);
            return this;
        }

        public Builder addHeader(String str, String str2) {
            if (str2 != null && !StringUtils.isEmpty(str)) {
                this.headers.put(str, str2);
            }
            return this;
        }

        public Builder setWebSocketListener(IHSWebSocketListener iHSWebSocketListener) {
            this.listener = iHSWebSocketListener;
            return this;
        }

        public HSWebSocket build() throws IOException {
            WebSocket webSocketCreateSocket = new WebSocketFactory().setConnectionTimeout(this.connectionTimeout).createSocket(this.url);
            webSocketCreateSocket.getSocket().setSoTimeout(this.socketTimeout);
            Iterator<String> it = this.extensions.iterator();
            while (it.hasNext()) {
                webSocketCreateSocket.addExtension(it.next());
            }
            Iterator<String> it2 = this.protocols.iterator();
            while (it2.hasNext()) {
                webSocketCreateSocket.addProtocol(it2.next());
            }
            for (String str : this.headers.keySet()) {
                webSocketCreateSocket.addHeader(str, this.headers.get(str));
            }
            return new HSWebSocket(webSocketCreateSocket, this.listener);
        }
    }
}
