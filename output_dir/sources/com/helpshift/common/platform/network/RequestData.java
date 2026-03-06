package com.helpshift.common.platform.network;

import java.util.Map;
import java.util.UUID;

/* JADX INFO: loaded from: classes2.dex */
public class RequestData {
    public final Map<String, String> body;
    private Map<String, String> customHeaders;
    private String requestId = UUID.randomUUID().toString();

    public RequestData(Map<String, String> map) {
        this.body = map;
    }

    public RequestData(RequestData requestData) {
        this.body = requestData.body;
        this.customHeaders = requestData.customHeaders;
    }

    public void overrideRequestId(String str) {
        this.requestId = str;
    }

    public String getRequestId() {
        return this.requestId;
    }

    public Map<String, String> getCustomHeaders() {
        return this.customHeaders;
    }

    public void setCustomHeaders(Map<String, String> map) {
        this.customHeaders = map;
    }
}
