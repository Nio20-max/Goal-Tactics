package com.microsoft.appcenter.http;

import android.net.TrafficStats;
import android.os.AsyncTask;
import com.ironsource.sdk.constants.Events;
import com.ironsource.sdk.precache.DownloadManager;
import com.microsoft.appcenter.http.HttpClient;
import com.microsoft.appcenter.utils.AppCenterLog;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import java.util.zip.GZIPOutputStream;
import javax.net.ssl.HttpsURLConnection;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
class DefaultHttpClientCallTask extends AsyncTask<Void, Void, Object> {
    private static final int DEFAULT_STRING_BUILDER_CAPACITY = 16;
    private static final int MAX_PRETTIFY_LOG_LENGTH = 4096;
    private static final int MIN_GZIP_LENGTH = 1400;
    private final HttpClient.CallTemplate mCallTemplate;
    private final boolean mCompressionEnabled;
    private final Map<String, String> mHeaders;
    private final String mMethod;
    private final ServiceCallback mServiceCallback;
    private final Tracker mTracker;
    private final String mUrl;
    private static final Pattern TOKEN_REGEX_URL_ENCODED = Pattern.compile("token=[^&]+");
    private static final Pattern TOKEN_REGEX_JSON = Pattern.compile("token\":\"[^\"]+\"");
    private static final Pattern REDIRECT_URI_REGEX_JSON = Pattern.compile("redirect_uri\":\"[^\"]+\"");

    interface Tracker {
        void onFinish(DefaultHttpClientCallTask task);

        void onStart(DefaultHttpClientCallTask task);
    }

    DefaultHttpClientCallTask(String url, String method, Map<String, String> headers, HttpClient.CallTemplate callTemplate, ServiceCallback serviceCallback, Tracker tracker, boolean compressionEnabled) {
        this.mUrl = url;
        this.mMethod = method;
        this.mHeaders = headers;
        this.mCallTemplate = callTemplate;
        this.mServiceCallback = serviceCallback;
        this.mTracker = tracker;
        this.mCompressionEnabled = compressionEnabled;
    }

    private static InputStream getInputStream(HttpsURLConnection httpsURLConnection) throws IOException {
        int responseCode = httpsURLConnection.getResponseCode();
        if (responseCode >= 200 && responseCode < 400) {
            return httpsURLConnection.getInputStream();
        }
        return httpsURLConnection.getErrorStream();
    }

    private void writePayload(OutputStream out, byte[] payload) throws IOException {
        for (int i = 0; i < payload.length; i += 1024) {
            out.write(payload, i, Math.min(payload.length - i, 1024));
            if (isCancelled()) {
                return;
            }
        }
    }

    private String readResponse(HttpsURLConnection httpsURLConnection) throws IOException {
        StringBuilder sb = new StringBuilder(Math.max(httpsURLConnection.getContentLength(), 16));
        InputStream inputStream = getInputStream(httpsURLConnection);
        try {
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, DownloadManager.UTF8_CHARSET);
            char[] cArr = new char[1024];
            do {
                int i = inputStreamReader.read(cArr);
                if (i <= 0) {
                    break;
                }
                sb.append(cArr, 0, i);
            } while (!isCancelled());
            return sb.toString();
        } finally {
            inputStream.close();
        }
    }

    private HttpResponse doHttpCall() throws Exception {
        String strReplaceAll;
        byte[] byteArray;
        HttpClient.CallTemplate callTemplate;
        URL url = new URL(this.mUrl);
        HttpsURLConnection httpsURLConnectionCreateHttpsConnection = HttpUtils.createHttpsConnection(url);
        try {
            httpsURLConnectionCreateHttpsConnection.setRequestMethod(this.mMethod);
            boolean z = false;
            if (!this.mMethod.equals("POST") || (callTemplate = this.mCallTemplate) == null) {
                strReplaceAll = null;
                byteArray = null;
            } else {
                strReplaceAll = callTemplate.buildRequestBody();
                byteArray = strReplaceAll.getBytes(DownloadManager.UTF8_CHARSET);
                if (this.mCompressionEnabled && byteArray.length >= 1400) {
                    z = true;
                }
                if (!this.mHeaders.containsKey("Content-Type")) {
                    this.mHeaders.put("Content-Type", Events.APP_JSON);
                }
            }
            if (z) {
                this.mHeaders.put("Content-Encoding", "gzip");
            }
            for (Map.Entry<String, String> entry : this.mHeaders.entrySet()) {
                httpsURLConnectionCreateHttpsConnection.setRequestProperty(entry.getKey(), entry.getValue());
            }
            if (isCancelled()) {
                return null;
            }
            HttpClient.CallTemplate callTemplate2 = this.mCallTemplate;
            if (callTemplate2 != null) {
                callTemplate2.onBeforeCalling(url, this.mHeaders);
            }
            if (byteArray != null) {
                if (AppCenterLog.getLogLevel() <= 2) {
                    if (strReplaceAll.length() < 4096) {
                        strReplaceAll = TOKEN_REGEX_URL_ENCODED.matcher(strReplaceAll).replaceAll("token=***");
                        if (Events.APP_JSON.equals(this.mHeaders.get("Content-Type"))) {
                            strReplaceAll = new JSONObject(strReplaceAll).toString(2);
                        }
                    }
                    AppCenterLog.verbose("AppCenter", strReplaceAll);
                }
                if (z) {
                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(byteArray.length);
                    GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(byteArrayOutputStream);
                    gZIPOutputStream.write(byteArray);
                    gZIPOutputStream.close();
                    byteArray = byteArrayOutputStream.toByteArray();
                }
                httpsURLConnectionCreateHttpsConnection.setDoOutput(true);
                httpsURLConnectionCreateHttpsConnection.setFixedLengthStreamingMode(byteArray.length);
                OutputStream outputStream = httpsURLConnectionCreateHttpsConnection.getOutputStream();
                try {
                    writePayload(outputStream, byteArray);
                    outputStream.close();
                } catch (Throwable th) {
                    outputStream.close();
                    throw th;
                }
            }
            if (isCancelled()) {
                return null;
            }
            int responseCode = httpsURLConnectionCreateHttpsConnection.getResponseCode();
            String response = readResponse(httpsURLConnectionCreateHttpsConnection);
            if (AppCenterLog.getLogLevel() <= 2) {
                String headerField = httpsURLConnectionCreateHttpsConnection.getHeaderField("Content-Type");
                AppCenterLog.verbose("AppCenter", "HTTP response status=" + responseCode + " payload=" + ((headerField == null || headerField.startsWith("text/") || headerField.startsWith("application/")) ? REDIRECT_URI_REGEX_JSON.matcher(TOKEN_REGEX_JSON.matcher(response).replaceAll("token\":\"***\"")).replaceAll("redirect_uri\":\"***\"") : "<binary>"));
            }
            HashMap map = new HashMap();
            for (Map.Entry entry2 : httpsURLConnectionCreateHttpsConnection.getHeaderFields().entrySet()) {
                map.put((String) entry2.getKey(), (String) ((List) entry2.getValue()).iterator().next());
            }
            HttpResponse httpResponse = new HttpResponse(responseCode, response, map);
            if (responseCode < 200 || responseCode >= 300) {
                throw new HttpException(httpResponse);
            }
            return httpResponse;
        } finally {
            httpsURLConnectionCreateHttpsConnection.disconnect();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public Object doInBackground(Void... params) {
        TrafficStats.setThreadStatsTag(HttpUtils.THREAD_STATS_TAG);
        try {
            return doHttpCall();
        } catch (Exception e) {
            return e;
        } finally {
            TrafficStats.clearThreadStatsTag();
        }
    }

    @Override // android.os.AsyncTask
    protected void onPreExecute() {
        this.mTracker.onStart(this);
    }

    @Override // android.os.AsyncTask
    protected void onPostExecute(Object result) {
        this.mTracker.onFinish(this);
        if (result instanceof Exception) {
            this.mServiceCallback.onCallFailed((Exception) result);
        } else {
            this.mServiceCallback.onCallSucceeded((HttpResponse) result);
        }
    }

    @Override // android.os.AsyncTask
    protected void onCancelled(Object result) {
        if ((result instanceof HttpResponse) || (result instanceof HttpException)) {
            onPostExecute(result);
        } else {
            this.mTracker.onFinish(this);
        }
    }
}
