package com.helpshift.common.domain.network;

import com.helpshift.common.domain.idempotent.IdempotentPolicy;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.NetworkRequestDAO;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.common.platform.network.Response;
import com.helpshift.util.StringUtils;

/* JADX INFO: loaded from: classes2.dex */
public class IdempotentNetwork implements Network {
    private IdempotentPolicy idempotentPolicy;
    private Network network;
    private NetworkRequestDAO networkRequestDAO;
    private String route;
    private String uniqueMappingKey;

    public IdempotentNetwork(Network network, Platform platform, IdempotentPolicy idempotentPolicy, String str, String str2) {
        this.network = network;
        this.idempotentPolicy = idempotentPolicy;
        this.networkRequestDAO = platform.getNetworkRequestDAO();
        this.route = str;
        this.uniqueMappingKey = str2;
    }

    @Override // com.helpshift.common.domain.network.Network
    public Response makeRequest(RequestData requestData) {
        String pendingRequestId = this.networkRequestDAO.getPendingRequestId(this.route, this.uniqueMappingKey);
        if (StringUtils.isEmpty(pendingRequestId)) {
            this.networkRequestDAO.storePendingRequestId(this.route, this.uniqueMappingKey, requestData.getRequestId());
        } else {
            requestData.overrideRequestId(pendingRequestId);
        }
        Response responseMakeRequest = this.network.makeRequest(requestData);
        if (responseMakeRequest == null || this.idempotentPolicy.isRequestCompleted(responseMakeRequest.status)) {
            this.networkRequestDAO.deletePendingRequestId(this.route, this.uniqueMappingKey);
            this.networkRequestDAO.storeSuccessfulRequestId(requestData.getRequestId());
        }
        return responseMakeRequest;
    }
}
