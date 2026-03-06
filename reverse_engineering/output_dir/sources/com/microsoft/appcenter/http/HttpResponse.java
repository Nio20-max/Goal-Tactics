package com.microsoft.appcenter.http;

import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class HttpResponse {
    private final Map<String, String> headers;
    private final String payload;
    private final int statusCode;

    public HttpResponse(int status) {
        this(status, "");
    }

    public HttpResponse(int status, String payload) {
        this(status, payload, new HashMap());
    }

    public HttpResponse(int status, String payload, Map<String, String> headers) {
        this.payload = payload;
        this.statusCode = status;
        this.headers = headers;
    }

    public int getStatusCode() {
        return this.statusCode;
    }

    public String getPayload() {
        return this.payload;
    }

    public Map<String, String> getHeaders() {
        return this.headers;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        HttpResponse httpResponse = (HttpResponse) o;
        return this.statusCode == httpResponse.statusCode && this.payload.equals(httpResponse.payload) && this.headers.equals(httpResponse.headers);
    }

    public int hashCode() {
        return (((this.statusCode * 31) + this.payload.hashCode()) * 31) + this.headers.hashCode();
    }
}
