package com.helpshift.common.domain.network;

import com.helpshift.common.platform.network.RequestData;
import com.helpshift.common.platform.network.Response;

/* JADX INFO: loaded from: classes2.dex */
public interface Network {
    Response makeRequest(RequestData requestData);
}
