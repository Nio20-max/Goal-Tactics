package com.microsoft.appcenter.http;

import com.microsoft.appcenter.http.HttpClient;
import com.microsoft.appcenter.utils.AppCenterLog;
import com.microsoft.appcenter.utils.NetworkStateHelper;
import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class HttpClientNetworkStateHandler extends HttpClientDecorator implements NetworkStateHelper.Listener {
    private final Set<Call> mCalls;
    private final NetworkStateHelper mNetworkStateHelper;

    public HttpClientNetworkStateHandler(HttpClient decoratedApi, NetworkStateHelper networkStateHelper) {
        super(decoratedApi);
        this.mCalls = new HashSet();
        this.mNetworkStateHelper = networkStateHelper;
        networkStateHelper.addListener(this);
    }

    @Override // com.microsoft.appcenter.http.HttpClient
    public synchronized ServiceCall callAsync(String url, String method, Map<String, String> headers, HttpClient.CallTemplate callTemplate, ServiceCallback serviceCallback) {
        Call call;
        call = new Call(this.mDecoratedApi, url, method, headers, callTemplate, serviceCallback);
        if (this.mNetworkStateHelper.isNetworkConnected()) {
            call.run();
        } else {
            this.mCalls.add(call);
            AppCenterLog.debug("AppCenter", "Call triggered with no network connectivity, waiting network to become available...");
        }
        return call;
    }

    @Override // com.microsoft.appcenter.http.HttpClientDecorator, java.io.Closeable, java.lang.AutoCloseable
    public synchronized void close() throws IOException {
        this.mNetworkStateHelper.removeListener(this);
        this.mCalls.clear();
        super.close();
    }

    @Override // com.microsoft.appcenter.http.HttpClientDecorator, com.microsoft.appcenter.http.HttpClient
    public void reopen() {
        this.mNetworkStateHelper.addListener(this);
        super.reopen();
    }

    @Override // com.microsoft.appcenter.utils.NetworkStateHelper.Listener
    public synchronized void onNetworkStateUpdated(boolean connected) {
        if (connected) {
            if (this.mCalls.size() > 0) {
                AppCenterLog.debug("AppCenter", "Network is available. " + this.mCalls.size() + " pending call(s) to submit now.");
                Iterator<Call> it = this.mCalls.iterator();
                while (it.hasNext()) {
                    it.next().run();
                }
                this.mCalls.clear();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void cancelCall(Call call) {
        if (call.mServiceCall != null) {
            call.mServiceCall.cancel();
        }
        this.mCalls.remove(call);
    }

    private class Call extends HttpClientCallDecorator {
        Call(HttpClient decoratedApi, String url, String method, Map<String, String> headers, HttpClient.CallTemplate callTemplate, ServiceCallback serviceCallback) {
            super(decoratedApi, url, method, headers, callTemplate, serviceCallback);
        }

        @Override // com.microsoft.appcenter.http.HttpClientCallDecorator, com.microsoft.appcenter.http.ServiceCall
        public void cancel() {
            HttpClientNetworkStateHandler.this.cancelCall(this);
        }
    }
}
