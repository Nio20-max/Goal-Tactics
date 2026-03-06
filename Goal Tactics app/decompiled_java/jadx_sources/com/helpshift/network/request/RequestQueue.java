package com.helpshift.network.request;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.logger.logmodels.LogExtrasModelProvider;
import com.helpshift.network.Network;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.network.response.ExecutorDelivery;
import com.helpshift.network.response.NetworkResponse;
import com.helpshift.network.response.Response;
import com.helpshift.network.response.ResponseDelivery;
import com.helpshift.util.HSLogger;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;

/* JADX INFO: loaded from: classes2.dex */
public class RequestQueue {
    private static final String TAG = "HS_RequestQueue";
    final ResponseDelivery delivery;
    private ExecutorService dispatcherPool;
    final Network network;

    public static class DeliveryType {
        public static final Integer ON_NEW_THREAD = 1;
    }

    protected RequestQueue(Network network, ResponseDelivery responseDelivery, ExecutorService executorService) {
        this.network = network;
        this.dispatcherPool = executorService;
        this.delivery = responseDelivery;
    }

    public static RequestQueue getRequestQueue(Network network, Integer num, ExecutorService executorService) {
        ExecutorDelivery executorDelivery;
        if (DeliveryType.ON_NEW_THREAD.equals(num)) {
            HandlerThread handlerThread = new HandlerThread("HS-cmnet-rspns");
            handlerThread.start();
            executorDelivery = new ExecutorDelivery(new Handler(handlerThread.getLooper()));
        } else {
            executorDelivery = new ExecutorDelivery(new Handler(Looper.getMainLooper()));
        }
        return new RequestQueue(network, executorDelivery, executorService);
    }

    public Future add(final Request request) {
        return this.dispatcherPool.submit(new Callable() { // from class: com.helpshift.network.request.RequestQueue.1
            @Override // java.util.concurrent.Callable
            public Object call() throws Exception {
                try {
                    NetworkResponse networkResponsePerformRequest = RequestQueue.this.network.performRequest(request);
                    if (networkResponsePerformRequest.statusCode >= 300) {
                        HSLogger.d(RequestQueue.TAG, "Api result : " + request.url + ", Status : " + networkResponsePerformRequest.statusCode);
                    }
                    if (networkResponsePerformRequest.notModified) {
                        if (request.hasHadResponseDelivered()) {
                            return null;
                        }
                        throw new NetworkError(NetworkErrorCodes.CONTENT_UNCHANGED);
                    }
                    Response<?> networkResponse = request.parseNetworkResponse(networkResponsePerformRequest);
                    RequestQueue.this.delivery.postResponse(request, networkResponse);
                    return networkResponse;
                } catch (NetworkError e) {
                    HSLogger.e(RequestQueue.TAG, "Network error", new Throwable[]{e}, LogExtrasModelProvider.fromString("route", request.url), LogExtrasModelProvider.fromString(IronSourceConstants.EVENTS_ERROR_REASON, e.getReason() + ""));
                    RequestQueue.this.parseAndDeliverNetworkError(request, e);
                    return e;
                }
            }
        });
    }

    protected void parseAndDeliverNetworkError(Request request, NetworkError networkError) {
        this.delivery.postError(request, request.parseNetworkError(networkError));
    }
}
