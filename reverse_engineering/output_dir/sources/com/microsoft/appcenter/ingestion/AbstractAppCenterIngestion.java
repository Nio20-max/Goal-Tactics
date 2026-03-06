package com.microsoft.appcenter.ingestion;

import com.microsoft.appcenter.http.HttpClient;
import com.microsoft.appcenter.http.ServiceCall;
import com.microsoft.appcenter.http.ServiceCallback;
import com.microsoft.appcenter.ingestion.models.LogContainer;
import com.microsoft.appcenter.utils.PrefStorageConstants;
import com.microsoft.appcenter.utils.storage.SharedPreferencesManager;
import java.io.IOException;
import java.net.ConnectException;
import java.util.Map;
import java.util.UUID;

/* JADX INFO: loaded from: classes2.dex */
public abstract class AbstractAppCenterIngestion implements Ingestion {
    private HttpClient mHttpClient;
    private String mLogUrl;

    @Override // com.microsoft.appcenter.ingestion.Ingestion
    public ServiceCall sendAsync(String appSecret, UUID installId, LogContainer logContainer, ServiceCallback serviceCallback) throws IllegalArgumentException {
        return null;
    }

    public AbstractAppCenterIngestion() {
    }

    public AbstractAppCenterIngestion(HttpClient httpClient, String logUrl) {
        this.mLogUrl = logUrl;
        this.mHttpClient = httpClient;
    }

    @Override // com.microsoft.appcenter.ingestion.Ingestion
    public void setLogUrl(String logUrl) {
        this.mLogUrl = logUrl;
    }

    public String getLogUrl() {
        return this.mLogUrl;
    }

    @Override // com.microsoft.appcenter.ingestion.Ingestion
    public boolean isEnabled() {
        return SharedPreferencesManager.getBoolean(PrefStorageConstants.ALLOWED_NETWORK_REQUEST, true);
    }

    @Override // com.microsoft.appcenter.ingestion.Ingestion
    public void reopen() {
        this.mHttpClient.reopen();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.mHttpClient.close();
    }

    public void setHttpClient(HttpClient httpClient) {
        this.mHttpClient = httpClient;
    }

    public ServiceCall getServiceCall(String url, String method, Map<String, String> headers, HttpClient.CallTemplate callTemplate, ServiceCallback serviceCallback) {
        if (!isEnabled()) {
            serviceCallback.onCallFailed(new ConnectException("SDK is in offline mode."));
            return null;
        }
        return this.mHttpClient.callAsync(url, method, headers, callTemplate, serviceCallback);
    }
}
