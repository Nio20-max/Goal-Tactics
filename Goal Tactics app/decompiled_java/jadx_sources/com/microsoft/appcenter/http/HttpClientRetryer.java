package com.microsoft.appcenter.http;

import android.os.Handler;
import android.os.Looper;
import com.microsoft.appcenter.http.HttpClient;
import com.microsoft.appcenter.utils.AppCenterLog;
import java.net.UnknownHostException;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes2.dex */
public class HttpClientRetryer extends HttpClientDecorator {
    static final long[] RETRY_INTERVALS = {TimeUnit.SECONDS.toMillis(10), TimeUnit.MINUTES.toMillis(5), TimeUnit.MINUTES.toMillis(20)};
    private final Handler mHandler;
    private final Random mRandom;

    HttpClientRetryer(HttpClient decoratedApi) {
        this(decoratedApi, new Handler(Looper.getMainLooper()));
    }

    HttpClientRetryer(HttpClient decoratedApi, Handler handler) {
        super(decoratedApi);
        this.mRandom = new Random();
        this.mHandler = handler;
    }

    @Override // com.microsoft.appcenter.http.HttpClient
    public ServiceCall callAsync(String url, String method, Map<String, String> headers, HttpClient.CallTemplate callTemplate, ServiceCallback serviceCallback) {
        RetryableCall retryableCall = new RetryableCall(this.mDecoratedApi, url, method, headers, callTemplate, serviceCallback);
        retryableCall.run();
        return retryableCall;
    }

    private class RetryableCall extends HttpClientCallDecorator {
        private int mRetryCount;

        RetryableCall(HttpClient decoratedApi, String url, String method, Map<String, String> headers, HttpClient.CallTemplate callTemplate, ServiceCallback serviceCallback) {
            super(decoratedApi, url, method, headers, callTemplate, serviceCallback);
        }

        @Override // com.microsoft.appcenter.http.HttpClientCallDecorator, com.microsoft.appcenter.http.ServiceCall
        public synchronized void cancel() {
            HttpClientRetryer.this.mHandler.removeCallbacks(this);
            super.cancel();
        }

        @Override // com.microsoft.appcenter.http.HttpClientCallDecorator, com.microsoft.appcenter.http.ServiceCallback
        public void onCallFailed(Exception e) {
            String str;
            if (this.mRetryCount < HttpClientRetryer.RETRY_INTERVALS.length && HttpUtils.isRecoverableError(e)) {
                long jNextInt = (!(e instanceof HttpException) || (str = ((HttpException) e).getHttpResponse().getHeaders().get("x-ms-retry-after-ms")) == null) ? 0L : Long.parseLong(str);
                if (jNextInt == 0) {
                    long[] jArr = HttpClientRetryer.RETRY_INTERVALS;
                    int i = this.mRetryCount;
                    this.mRetryCount = i + 1;
                    long j = jArr[i] / 2;
                    jNextInt = ((long) HttpClientRetryer.this.mRandom.nextInt((int) j)) + j;
                }
                String str2 = "Try #" + this.mRetryCount + " failed and will be retried in " + jNextInt + " ms";
                if (e instanceof UnknownHostException) {
                    str2 = str2 + " (UnknownHostException)";
                }
                AppCenterLog.warn("AppCenter", str2, e);
                HttpClientRetryer.this.mHandler.postDelayed(this, jNextInt);
                return;
            }
            this.mServiceCallback.onCallFailed(e);
        }
    }
}
