package com.helpshift.network.response;

import android.os.Handler;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.network.request.Request;
import java.util.concurrent.Executor;

/* JADX INFO: loaded from: classes2.dex */
public class ExecutorDelivery implements ResponseDelivery {
    private final Executor responsePoster;

    public ExecutorDelivery(final Handler handler) {
        this.responsePoster = new Executor() { // from class: com.helpshift.network.response.ExecutorDelivery.1
            @Override // java.util.concurrent.Executor
            public void execute(Runnable runnable) {
                handler.post(runnable);
            }
        };
    }

    @Override // com.helpshift.network.response.ResponseDelivery
    public void postResponse(Request request, Response<?> response) {
        this.responsePoster.execute(new ResponseDeliveryRunnable(request, response, null));
    }

    @Override // com.helpshift.network.response.ResponseDelivery
    public void postError(Request request, NetworkError networkError) {
        this.responsePoster.execute(new ResponseDeliveryRunnable(request, Response.error(networkError, Integer.valueOf(request.getSequence())), null));
    }

    private class ResponseDeliveryRunnable implements Runnable {
        private final Request request;
        private final Response response;
        private final Runnable runnable;

        public ResponseDeliveryRunnable(Request request, Response response, Runnable runnable) {
            this.request = request;
            this.response = response;
            this.runnable = runnable;
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                if (this.response.isSuccess()) {
                    this.request.deliverResponse(this.response.result);
                } else {
                    this.request.deliverError(this.response.error);
                }
            } catch (Throwable unused) {
            }
            this.request.markDelivered();
            Runnable runnable = this.runnable;
            if (runnable != null) {
                runnable.run();
            }
        }
    }
}
