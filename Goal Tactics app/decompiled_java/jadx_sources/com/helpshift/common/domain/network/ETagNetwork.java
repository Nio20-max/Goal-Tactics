package com.helpshift.common.domain.network;

import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.KeyValuePair;
import com.helpshift.common.platform.network.NetworkRequestDAO;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.common.platform.network.Response;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class ETagNetwork implements Network {
    private final String key;
    private final Network network;
    private final NetworkRequestDAO networkRequestDAO;

    public ETagNetwork(Network network, Platform platform, String str) {
        this.network = network;
        this.networkRequestDAO = platform.getNetworkRequestDAO();
        this.key = str;
    }

    @Override // com.helpshift.common.domain.network.Network
    public Response makeRequest(RequestData requestData) {
        String headerValue;
        String eTag = this.networkRequestDAO.getETag(this.key);
        if (eTag != null) {
            Map<String, String> customHeaders = requestData.getCustomHeaders();
            if (customHeaders == null) {
                customHeaders = new HashMap<>();
            }
            customHeaders.put("If-None-Match", eTag);
            requestData.setCustomHeaders(customHeaders);
        }
        Response responseMakeRequest = this.network.makeRequest(requestData);
        int i = responseMakeRequest.status;
        if (i >= 200 && i < 300 && (headerValue = getHeaderValue(responseMakeRequest.headers, "ETag")) != null) {
            this.networkRequestDAO.storeETag(this.key, headerValue);
        }
        return responseMakeRequest;
    }

    private String getHeaderValue(List<KeyValuePair> list, String str) {
        for (KeyValuePair keyValuePair : list) {
            if (keyValuePair.key != null && keyValuePair.key.equalsIgnoreCase(str)) {
                return keyValuePair.value;
            }
        }
        return null;
    }
}
