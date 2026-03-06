package com.ironsource.network;

import android.net.Uri;
import android.util.Pair;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class ISHttpService {
    private static final String HTTP_METHOD_GET = "GET";
    private static final String HTTP_METHOD_POST = "POST";
    private static final String TAG = "ISHttpService";

    public static Response sendGETRequest(String str, String str2, List<Pair<String, String>> list) throws Exception {
        Uri uriBuild = Uri.parse(str).buildUpon().encodedQuery(str2).build();
        Request.Builder builder = new Request.Builder();
        builder.setEndpoint(uriBuild.toString()).setData(str2).setMethod("GET").addHeaders(list);
        return sendRequest(builder.build());
    }

    public static Response sendPOSTRequest(String str, String str2, List<Pair<String, String>> list) throws Exception {
        Request.Builder builder = new Request.Builder();
        builder.setEndpoint(str).setData(str2).setMethod("POST").addHeaders(list);
        return sendRequest(builder.build());
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0090  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.ironsource.network.Response sendRequest(com.ironsource.network.ISHttpService.Request r7) throws java.lang.Exception {
        /*
            java.lang.String r0 = r7.endpoint
            java.lang.String r1 = r7.data
            boolean r0 = areRequestParametersValid(r0, r1)
            if (r0 == 0) goto L94
            com.ironsource.network.Response r0 = new com.ironsource.network.Response
            r0.<init>()
            r1 = 0
            java.net.HttpURLConnection r2 = createConnection(r7)     // Catch: java.lang.Throwable -> L46 java.io.IOException -> L49
            java.util.ArrayList<android.util.Pair<java.lang.String, java.lang.String>> r3 = r7.headers     // Catch: java.lang.Throwable -> L3f java.io.IOException -> L41
            setHeaders(r2, r3)     // Catch: java.lang.Throwable -> L3f java.io.IOException -> L41
            boolean r3 = r7.allowRequestBody()     // Catch: java.lang.Throwable -> L3f java.io.IOException -> L41
            if (r3 == 0) goto L22
            writeRequestBody(r2, r7)     // Catch: java.lang.Throwable -> L3f java.io.IOException -> L41
        L22:
            java.io.InputStream r1 = r2.getInputStream()     // Catch: java.lang.Throwable -> L3f java.io.IOException -> L41
            int r3 = r2.getResponseCode()     // Catch: java.lang.Throwable -> L3f java.io.IOException -> L41
            r0.responseCode = r3     // Catch: java.lang.Throwable -> L3f java.io.IOException -> L41
            if (r1 == 0) goto L34
            byte[] r3 = com.ironsource.network.Utils.getBytes(r1)     // Catch: java.lang.Throwable -> L3f java.io.IOException -> L41
            r0.data = r3     // Catch: java.lang.Throwable -> L3f java.io.IOException -> L41
        L34:
            if (r1 == 0) goto L39
            r1.close()
        L39:
            if (r2 == 0) goto L83
            r2.disconnect()
            goto L83
        L3f:
            r7 = move-exception
            goto L89
        L41:
            r3 = move-exception
            r6 = r2
            r2 = r1
            r1 = r6
            goto L4b
        L46:
            r7 = move-exception
            r2 = r1
            goto L89
        L49:
            r3 = move-exception
            r2 = r1
        L4b:
            if (r1 == 0) goto L84
            int r4 = r1.getResponseCode()     // Catch: java.lang.Throwable -> L85
            r0.responseCode = r4     // Catch: java.lang.Throwable -> L85
            r5 = 400(0x190, float:5.6E-43)
            if (r4 < r5) goto L84
            java.lang.String r3 = "ISHttpService"
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L85
            r4.<init>()     // Catch: java.lang.Throwable -> L85
            java.lang.String r5 = "Failed post to "
            r4.append(r5)     // Catch: java.lang.Throwable -> L85
            java.lang.String r7 = r7.endpoint     // Catch: java.lang.Throwable -> L85
            r4.append(r7)     // Catch: java.lang.Throwable -> L85
            java.lang.String r7 = " StatusCode: "
            r4.append(r7)     // Catch: java.lang.Throwable -> L85
            int r7 = r0.responseCode     // Catch: java.lang.Throwable -> L85
            r4.append(r7)     // Catch: java.lang.Throwable -> L85
            java.lang.String r7 = r4.toString()     // Catch: java.lang.Throwable -> L85
            android.util.Log.d(r3, r7)     // Catch: java.lang.Throwable -> L85
            if (r2 == 0) goto L7e
            r2.close()
        L7e:
            if (r1 == 0) goto L83
            r1.disconnect()
        L83:
            return r0
        L84:
            throw r3     // Catch: java.lang.Throwable -> L85
        L85:
            r7 = move-exception
            r6 = r2
            r2 = r1
            r1 = r6
        L89:
            if (r1 == 0) goto L8e
            r1.close()
        L8e:
            if (r2 == 0) goto L93
            r2.disconnect()
        L93:
            throw r7
        L94:
            java.security.InvalidParameterException r7 = new java.security.InvalidParameterException
            java.lang.String r0 = "not valid params"
            r7.<init>(r0)
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ironsource.network.ISHttpService.sendRequest(com.ironsource.network.ISHttpService$Request):com.ironsource.network.Response");
    }

    private static void setHeaders(HttpURLConnection httpURLConnection, List<Pair<String, String>> list) throws ProtocolException {
        for (Pair<String, String> pair : list) {
            httpURLConnection.setRequestProperty((String) pair.first, (String) pair.second);
        }
    }

    private static void writeRequestBody(HttpURLConnection httpURLConnection, Request request) throws Exception {
        httpURLConnection.setDoOutput(true);
        DataOutputStream dataOutputStream = new DataOutputStream(httpURLConnection.getOutputStream());
        try {
            dataOutputStream.write(request.data.getBytes(request.encoding));
            dataOutputStream.flush();
        } finally {
            dataOutputStream.close();
        }
    }

    private static boolean areRequestParametersValid(String str, String str2) {
        return (str == null || str.isEmpty() || str2 == null || str2.isEmpty()) ? false : true;
    }

    private static HttpURLConnection createConnection(Request request) throws IOException {
        HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(request.endpoint).openConnection();
        httpURLConnection.setConnectTimeout(request.connectTimeOut);
        httpURLConnection.setReadTimeout(request.readTimeOut);
        httpURLConnection.setRequestMethod(request.method);
        return httpURLConnection;
    }

    public static class Request {
        private static final int DEFAULT_CONNECT_TIMEOUT_MILLIS = 15000;
        private static final String DEFAULT_ENCODING = "UTF-8";
        private static final int DEFAULT_READ_TIMEOUT_MILLIS = 15000;
        final int connectTimeOut;
        final String data;
        final String encoding;
        final String endpoint;
        ArrayList<Pair<String, String>> headers;
        final String method;
        final int readTimeOut;

        public Request(Builder builder) {
            this.endpoint = builder.endpoint;
            this.method = builder.method;
            this.data = builder.data;
            this.headers = new ArrayList<>(builder.headers);
            this.connectTimeOut = builder.connectTimeOut;
            this.readTimeOut = builder.readTimeOut;
            this.encoding = builder.encoding;
        }

        boolean allowRequestBody() {
            return "POST".equals(this.method);
        }

        static class Builder {
            String data;
            String endpoint;
            List<Pair<String, String>> headers = new ArrayList();
            String method = "POST";
            int connectTimeOut = 15000;
            int readTimeOut = 15000;
            String encoding = "UTF-8";

            Builder() {
            }

            Builder setData(String str) {
                this.data = str;
                return this;
            }

            Builder setEncoding(String str) {
                this.encoding = str;
                return this;
            }

            Builder setReadTimeOut(int i) {
                this.readTimeOut = i;
                return this;
            }

            Builder setConnectTimeOut(int i) {
                this.connectTimeOut = i;
                return this;
            }

            Builder setEndpoint(String str) {
                this.endpoint = str;
                return this;
            }

            Builder addHeader(Pair<String, String> pair) {
                this.headers.add(pair);
                return this;
            }

            Builder addHeaders(List<Pair<String, String>> list) {
                this.headers.addAll(list);
                return this;
            }

            Builder setMethod(String str) {
                this.method = str;
                return this;
            }

            Request build() {
                return new Request(this);
            }
        }
    }
}
