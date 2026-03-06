package com.helpshift.network.request;

import com.helpshift.network.Network;
import java.util.concurrent.ExecutorService;

/* JADX INFO: loaded from: classes2.dex */
public class RequestManager {
    public static RequestQueue newRequestQueue(Network network, Integer num, ExecutorService executorService) {
        return RequestQueue.getRequestQueue(network, num, executorService);
    }
}
