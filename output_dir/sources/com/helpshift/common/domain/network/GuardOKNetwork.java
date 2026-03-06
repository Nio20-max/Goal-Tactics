package com.helpshift.common.domain.network;

import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.common.platform.network.Response;

/* JADX INFO: loaded from: classes2.dex */
public class GuardOKNetwork implements Network {
    private final Network network;

    public GuardOKNetwork(Network network) {
        this.network = network;
    }

    @Override // com.helpshift.common.domain.network.Network
    public Response makeRequest(RequestData requestData) {
        Response responseMakeRequest = this.network.makeRequest(requestData);
        int i = responseMakeRequest.status;
        if (i >= 200 && i < 300) {
            return responseMakeRequest;
        }
        NetworkException networkException = NetworkException.UNHANDLED_STATUS_CODE;
        networkException.serverStatusCode = responseMakeRequest.status;
        throw RootAPIException.wrap(null, networkException);
    }
}
