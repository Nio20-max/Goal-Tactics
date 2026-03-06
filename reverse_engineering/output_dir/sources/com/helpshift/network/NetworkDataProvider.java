package com.helpshift.network;

import com.helpshift.network.request.Request;

/* JADX INFO: loaded from: classes2.dex */
public interface NetworkDataProvider {
    Request getRequest();

    Request getRequestWithFullData();

    void setBatchSize(Integer num);
}
