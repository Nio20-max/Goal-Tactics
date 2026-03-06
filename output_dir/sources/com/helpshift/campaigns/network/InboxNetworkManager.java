package com.helpshift.campaigns.network;

import com.helpshift.campaigns.controllers.InboxSyncController;
import com.helpshift.network.NetworkDataProvider;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.network.request.Request;
import com.helpshift.network.request.RequestQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;

/* JADX INFO: loaded from: classes.dex */
public class InboxNetworkManager implements Callable {
    private NetworkDataProvider dataProvider;
    private RequestQueue requestQueue;

    public InboxNetworkManager(InboxSyncController inboxSyncController, RequestQueue requestQueue) {
        this.dataProvider = inboxSyncController;
        this.requestQueue = requestQueue;
    }

    @Override // java.util.concurrent.Callable
    public Object call() throws Exception {
        Future futureFetchCampaigns = fetchCampaigns();
        if (futureFetchCampaigns == null) {
            return null;
        }
        Object obj = futureFetchCampaigns.get();
        if (obj instanceof NetworkError) {
            throw ((NetworkError) obj);
        }
        return obj;
    }

    public Future fetchCampaigns() {
        Request request = this.dataProvider.getRequest();
        if (request != null) {
            return this.requestQueue.add(request);
        }
        return null;
    }
}
