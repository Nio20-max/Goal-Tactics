package com.helpshift.common.domain.network;

import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.KeyValuePair;
import com.helpshift.common.platform.network.NetworkRequestDAO;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.common.platform.network.Response;
import com.helpshift.common.util.HSDateFormatSpec;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class TSCorrectedNetwork implements Network {
    private final Network network;
    private final NetworkRequestDAO networkRequestDAO;

    public TSCorrectedNetwork(Network network, Platform platform) {
        this.network = network;
        this.networkRequestDAO = platform.getNetworkRequestDAO();
    }

    @Override // com.helpshift.common.domain.network.Network
    public Response makeRequest(RequestData requestData) {
        return makeRequest(requestData, 3);
    }

    private Response makeRequest(RequestData requestData, int i) {
        Response responseMakeRequest = this.network.makeRequest(requestData);
        if (responseMakeRequest.status != 422) {
            return responseMakeRequest;
        }
        if (i != 0) {
            int i2 = i - 1;
            String headerValue = getHeaderValue(responseMakeRequest.headers, "HS-UEpoch");
            if (headerValue != null) {
                this.networkRequestDAO.storeServerTimeDelta(HSDateFormatSpec.calculateTimeDelta(headerValue));
            }
            return makeRequest(new RequestData(requestData), i2);
        }
        throw RootAPIException.wrap(null, NetworkException.TIMESTAMP_CORRECTION_RETRIES_EXHAUSTED);
    }

    private String getHeaderValue(List<KeyValuePair> list, String str) {
        for (KeyValuePair keyValuePair : list) {
            if (keyValuePair.key != null && keyValuePair.key.equals(str)) {
                return keyValuePair.value;
            }
        }
        return null;
    }
}
