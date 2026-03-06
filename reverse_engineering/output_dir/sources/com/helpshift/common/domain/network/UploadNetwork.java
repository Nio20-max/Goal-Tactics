package com.helpshift.common.domain.network;

import com.helpshift.common.domain.Domain;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.KeyValuePair;
import com.helpshift.common.platform.network.Method;
import com.helpshift.common.platform.network.Request;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.common.platform.network.Response;
import com.helpshift.common.platform.network.UploadRequest;
import java.io.File;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class UploadNetwork extends BaseNetwork {
    Platform platform;

    @Override // com.helpshift.common.domain.network.BaseNetwork, com.helpshift.common.domain.network.Network
    public /* bridge */ /* synthetic */ Response makeRequest(RequestData requestData) {
        return super.makeRequest(requestData);
    }

    public UploadNetwork(String str, Domain domain, Platform platform) {
        super(str, domain, platform);
        this.platform = platform;
    }

    @Override // com.helpshift.common.domain.network.BaseNetwork
    Request getRequest(RequestData requestData) {
        return new UploadRequest(Method.POST, getURL(), getAuthData(Method.POST, NetworkDataRequestUtil.cleanData(requestData.body)), this.platform.getMimeTypeForFile(new File(requestData.body.get("filePath")).getPath()), getHeaders(requestData.getRequestId(), requestData), NetworkConstants.UPLOAD_CONNECT_TIMEOUT);
    }

    @Override // com.helpshift.common.domain.network.BaseNetwork
    List<KeyValuePair> getHeaders(String str, RequestData requestData) {
        List<KeyValuePair> headers = super.getHeaders(str, requestData);
        headers.add(new KeyValuePair("Connection", "Keep-Alive"));
        headers.add(new KeyValuePair("Content-Type", "multipart/form-data;boundary=*****"));
        return headers;
    }
}
