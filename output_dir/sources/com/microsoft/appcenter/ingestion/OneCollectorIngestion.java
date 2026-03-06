package com.microsoft.appcenter.ingestion;

import com.microsoft.appcenter.Constants;
import com.microsoft.appcenter.http.HttpClient;
import com.microsoft.appcenter.http.HttpUtils;
import com.microsoft.appcenter.http.ServiceCall;
import com.microsoft.appcenter.http.ServiceCallback;
import com.microsoft.appcenter.ingestion.models.Log;
import com.microsoft.appcenter.ingestion.models.LogContainer;
import com.microsoft.appcenter.ingestion.models.json.LogSerializer;
import com.microsoft.appcenter.ingestion.models.one.CommonSchemaLog;
import com.microsoft.appcenter.utils.AppCenterLog;
import com.microsoft.appcenter.utils.TicketCache;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class OneCollectorIngestion extends AbstractAppCenterIngestion {
    static final String API_KEY = "apikey";
    private static final String CLIENT_VERSION_FORMAT = "ACS-Android-Java-no-%s-no";
    static final String CLIENT_VERSION_KEY = "Client-Version";
    private static final String CONTENT_TYPE_VALUE = "application/x-json-stream; charset=utf-8";
    private static final String DEFAULT_LOG_URL = "https://mobile.events.data.microsoft.com/OneCollector/1.0";
    static final String STRICT = "Strict";
    static final String TICKETS = "Tickets";
    static final String UPLOAD_TIME_KEY = "Upload-Time";
    private final LogSerializer mLogSerializer;

    public OneCollectorIngestion(HttpClient httpClient, LogSerializer logSerializer) {
        super(httpClient, DEFAULT_LOG_URL);
        this.mLogSerializer = logSerializer;
    }

    @Override // com.microsoft.appcenter.ingestion.AbstractAppCenterIngestion, com.microsoft.appcenter.ingestion.Ingestion
    public ServiceCall sendAsync(String appSecret, UUID installId, LogContainer logContainer, ServiceCallback serviceCallback) throws IllegalArgumentException {
        super.sendAsync(appSecret, installId, logContainer, serviceCallback);
        HashMap map = new HashMap();
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        Iterator<Log> it = logContainer.getLogs().iterator();
        while (it.hasNext()) {
            linkedHashSet.addAll(it.next().getTransmissionTargetTokens());
        }
        StringBuilder sb = new StringBuilder();
        Iterator it2 = linkedHashSet.iterator();
        while (it2.hasNext()) {
            sb.append((String) it2.next());
            sb.append(",");
        }
        if (!linkedHashSet.isEmpty()) {
            sb.deleteCharAt(sb.length() - 1);
        }
        map.put(API_KEY, sb.toString());
        JSONObject jSONObject = new JSONObject();
        Iterator<Log> it3 = logContainer.getLogs().iterator();
        while (it3.hasNext()) {
            List<String> ticketKeys = ((CommonSchemaLog) it3.next()).getExt().getProtocol().getTicketKeys();
            if (ticketKeys != null) {
                for (String str : ticketKeys) {
                    String ticket = TicketCache.getTicket(str);
                    if (ticket != null) {
                        try {
                            jSONObject.put(str, ticket);
                        } catch (JSONException e) {
                            AppCenterLog.error("AppCenter", "Cannot serialize tickets, sending log anonymously", e);
                        }
                    }
                }
            }
        }
        if (jSONObject.length() > 0) {
            map.put(TICKETS, jSONObject.toString());
            if (Constants.APPLICATION_DEBUGGABLE) {
                map.put(STRICT, Boolean.TRUE.toString());
            }
        }
        map.put("Content-Type", CONTENT_TYPE_VALUE);
        map.put(CLIENT_VERSION_KEY, String.format(CLIENT_VERSION_FORMAT, "4.4.5"));
        map.put(UPLOAD_TIME_KEY, String.valueOf(System.currentTimeMillis()));
        return getServiceCall(getLogUrl(), "POST", map, new IngestionCallTemplate(this.mLogSerializer, logContainer), serviceCallback);
    }

    private static class IngestionCallTemplate implements HttpClient.CallTemplate {
        private final LogContainer mLogContainer;
        private final LogSerializer mLogSerializer;

        IngestionCallTemplate(LogSerializer logSerializer, LogContainer logContainer) {
            this.mLogSerializer = logSerializer;
            this.mLogContainer = logContainer;
        }

        @Override // com.microsoft.appcenter.http.HttpClient.CallTemplate
        public String buildRequestBody() throws JSONException {
            StringBuilder sb = new StringBuilder();
            Iterator<Log> it = this.mLogContainer.getLogs().iterator();
            while (it.hasNext()) {
                sb.append(this.mLogSerializer.serializeLog(it.next()));
                sb.append('\n');
            }
            return sb.toString();
        }

        @Override // com.microsoft.appcenter.http.HttpClient.CallTemplate
        public void onBeforeCalling(URL url, Map<String, String> headers) {
            if (AppCenterLog.getLogLevel() <= 2) {
                AppCenterLog.verbose("AppCenter", "Calling " + url + "...");
                HashMap map = new HashMap(headers);
                String str = (String) map.get(OneCollectorIngestion.API_KEY);
                if (str != null) {
                    map.put(OneCollectorIngestion.API_KEY, HttpUtils.hideApiKeys(str));
                }
                String str2 = (String) map.get(OneCollectorIngestion.TICKETS);
                if (str2 != null) {
                    map.put(OneCollectorIngestion.TICKETS, HttpUtils.hideTickets(str2));
                }
                AppCenterLog.verbose("AppCenter", "Headers: " + map);
            }
        }
    }
}
