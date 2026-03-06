package com.helpshift.network;

import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.util.HSLogger;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.TreeMap;

/* JADX INFO: loaded from: classes2.dex */
public class BasicNetwork implements Network {
    private static final String TAG = "Helpshift_BasicNetwork";
    protected final HttpStack httpStack;

    public BasicNetwork(HttpStack httpStack) {
        this.httpStack = httpStack;
    }

    protected static Map<String, String> convertHeaders(Header[] headerArr) {
        TreeMap treeMap = new TreeMap(String.CASE_INSENSITIVE_ORDER);
        for (Header header : headerArr) {
            treeMap.put(header.name, header.value);
        }
        return treeMap;
    }

    /* JADX WARN: Code restructure failed: missing block: B:66:0x0120, code lost:
    
        throw new com.helpshift.network.errors.NetworkError(com.helpshift.common.domain.network.NetworkErrorCodes.UNAUTHORIZED_ACCESS);
     */
    @Override // com.helpshift.network.Network
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.helpshift.network.response.NetworkResponse performRequest(com.helpshift.network.request.Request r12) throws com.helpshift.network.errors.NetworkError {
        /*
            Method dump skipped, instruction units count: 393
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.network.BasicNetwork.performRequest(com.helpshift.network.request.Request):com.helpshift.network.response.NetworkResponse");
    }

    protected byte[] entityToBytes(HttpEntity httpEntity) throws IOException, NetworkError {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            InputStream inputStream = httpEntity.content;
            if (inputStream == null) {
                throw new NetworkError(NetworkErrorCodes.SERVER_ERROR);
            }
            byte[] bArr = new byte[8192];
            while (true) {
                int i = inputStream.read(bArr);
                if (i == -1) {
                    break;
                }
                byteArrayOutputStream.write(bArr, 0, i);
            }
            return byteArrayOutputStream.toByteArray();
        } finally {
            try {
                httpEntity.consumeContent();
            } catch (IOException e) {
                HSLogger.w(TAG, "Error occurred when calling consumingContent", e);
            }
            byteArrayOutputStream.close();
        }
    }
}
