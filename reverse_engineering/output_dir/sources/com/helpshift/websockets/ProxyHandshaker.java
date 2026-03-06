package com.helpshift.websockets;

import com.ironsource.sdk.precache.DownloadManager;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
class ProxyHandshaker {
    private static final String RN = "\r\n";
    private final String mHost;
    private final int mPort;
    private final ProxySettings mSettings;
    private final Socket mSocket;

    public ProxyHandshaker(Socket socket, String str, int i, ProxySettings proxySettings) {
        this.mSocket = socket;
        this.mHost = str;
        this.mPort = i;
        this.mSettings = proxySettings;
    }

    public void perform() throws IOException {
        sendRequest();
        receiveResponse();
    }

    private void sendRequest() throws IOException {
        byte[] bytesUTF8 = Misc.getBytesUTF8(buildRequest());
        OutputStream outputStream = this.mSocket.getOutputStream();
        outputStream.write(bytesUTF8);
        outputStream.flush();
    }

    private String buildRequest() {
        String str = String.format("%s:%d", this.mHost, Integer.valueOf(this.mPort));
        StringBuilder sb = new StringBuilder();
        sb.append("CONNECT ");
        sb.append(str);
        sb.append(" HTTP/1.1");
        sb.append(RN);
        sb.append("Host: ");
        sb.append(str);
        sb.append(RN);
        addHeaders(sb);
        addProxyAuthorization(sb);
        sb.append(RN);
        return sb.toString();
    }

    private void addHeaders(StringBuilder sb) {
        for (Map.Entry<String, List<String>> entry : this.mSettings.getHeaders().entrySet()) {
            String key = entry.getKey();
            for (String str : entry.getValue()) {
                if (str == null) {
                    str = "";
                }
                sb.append(key);
                sb.append(": ");
                sb.append(str);
                sb.append(RN);
            }
        }
    }

    private void addProxyAuthorization(StringBuilder sb) {
        String id = this.mSettings.getId();
        if (id == null || id.length() == 0) {
            return;
        }
        String password = this.mSettings.getPassword();
        if (password == null) {
            password = "";
        }
        String str = String.format("%s:%s", id, password);
        sb.append("Proxy-Authorization: Basic ");
        sb.append(Base64.encode(str));
        sb.append(RN);
    }

    private void receiveResponse() throws IOException {
        InputStream inputStream = this.mSocket.getInputStream();
        readStatusLine(inputStream);
        skipHeaders(inputStream);
    }

    private void readStatusLine(InputStream inputStream) throws IOException {
        String line = Misc.readLine(inputStream, DownloadManager.UTF8_CHARSET);
        if (line == null || line.length() == 0) {
            throw new IOException("The response from the proxy server does not contain a status line.");
        }
        String[] strArrSplit = line.split(" +", 3);
        if (strArrSplit.length < 2) {
            throw new IOException("The status line in the response from the proxy server is badly formatted. The status line is: " + line);
        }
        if ("200".equals(strArrSplit[1])) {
            return;
        }
        throw new IOException("The status code in the response from the proxy server is not '200 Connection established'. The status line is: " + line);
    }

    private void skipHeaders(InputStream inputStream) throws IOException {
        while (true) {
            int i = 0;
            while (true) {
                int i2 = inputStream.read();
                if (i2 == -1) {
                    throw new EOFException("The end of the stream from the proxy server was reached unexpectedly.");
                }
                if (i2 == 10) {
                    if (i == 0) {
                        return;
                    }
                } else if (i2 != 13) {
                    i++;
                } else {
                    int i3 = inputStream.read();
                    if (i3 == -1) {
                        throw new EOFException("The end of the stream from the proxy server was reached unexpectedly after a carriage return.");
                    }
                    if (i3 != 10) {
                        i += 2;
                    } else if (i == 0) {
                        return;
                    }
                }
            }
        }
    }

    String getProxiedHostname() {
        return this.mHost;
    }
}
