package com.microsoft.appcenter.ingestion;

import com.microsoft.appcenter.Constants;
import com.microsoft.appcenter.http.AbstractAppCallTemplate;
import com.microsoft.appcenter.http.HttpClient;
import com.microsoft.appcenter.http.ServiceCall;
import com.microsoft.appcenter.http.ServiceCallback;
import com.microsoft.appcenter.ingestion.models.LogContainer;
import com.microsoft.appcenter.ingestion.models.json.LogSerializer;
import java.util.HashMap;
import java.util.UUID;
import org.json.JSONException;

/* JADX INFO: loaded from: classes2.dex */
public class AppCenterIngestion extends AbstractAppCenterIngestion {
    static final String API_PATH = "/logs?api-version=1.0.0";
    public static final String DEFAULT_LOG_URL = "https://in.appcenter.ms";
    static final String INSTALL_ID = "Install-ID";
    private final LogSerializer mLogSerializer;

    public AppCenterIngestion(HttpClient httpClient, LogSerializer logSerializer) {
        super(httpClient, DEFAULT_LOG_URL);
        this.mLogSerializer = logSerializer;
    }

    @Override // com.microsoft.appcenter.ingestion.AbstractAppCenterIngestion, com.microsoft.appcenter.ingestion.Ingestion
    public ServiceCall sendAsync(String appSecret, UUID installId, LogContainer logContainer, final ServiceCallback serviceCallback) throws IllegalArgumentException {
        super.sendAsync(appSecret, installId, logContainer, serviceCallback);
        HashMap map = new HashMap();
        map.put(INSTALL_ID, installId.toString());
        map.put(Constants.APP_SECRET, appSecret);
        return getServiceCall(getLogUrl() + API_PATH, "POST", map, new IngestionCallTemplate(this.mLogSerializer, logContainer), serviceCallback);
    }

    private static class IngestionCallTemplate extends AbstractAppCallTemplate {
        private final LogContainer mLogContainer;
        private final LogSerializer mLogSerializer;

        IngestionCallTemplate(LogSerializer logSerializer, LogContainer logContainer) {
            this.mLogSerializer = logSerializer;
            this.mLogContainer = logContainer;
        }

        @Override // com.microsoft.appcenter.http.HttpClient.CallTemplate
        public String buildRequestBody() throws JSONException {
            return this.mLogSerializer.serializeContainer(this.mLogContainer);
        }
    }
}
