package com.helpshift.network.request;

import android.net.Uri;
import android.text.TextUtils;
import com.facebook.share.internal.ShareConstants;
import com.helpshift.common.domain.network.NetworkConstants;
import com.helpshift.exceptions.InstallException;
import com.helpshift.model.InfoModelFactory;
import com.helpshift.network.NameValuePair;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.network.response.NetworkResponse;
import com.helpshift.network.response.Response;
import com.helpshift.network.response.ResponseParser;
import com.helpshift.network.util.HeaderUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.SchemaUtil;
import com.helpshift.util.StringUtil;
import com.helpshift.util.TimeUtil;
import com.ironsource.eventsmodule.DataBaseEventsStorage;
import com.ironsource.sdk.constants.Constants;
import com.ironsource.sdk.precache.DownloadManager;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: loaded from: classes2.dex */
public class Request {
    private static final String TAG = "HS_Request";
    private static AtomicInteger sequenceGenerator = new AtomicInteger();
    private final Response.ErrorListener errorListener;
    private Response.Listener listener;
    public final int method;
    private Map<String, String> requestData;
    private ResponseParser responseParser;
    public final String url;
    private boolean responseDelivered = false;
    private Integer sequence = Integer.valueOf(sequenceGenerator.incrementAndGet());

    public interface Method {
        public static final int GET = 0;
        public static final int POST = 1;
    }

    protected NetworkError parseNetworkError(NetworkError networkError) {
        return networkError;
    }

    public <T> Request(int i, String str, Map<String, String> map, Response.Listener<T> listener, Response.ErrorListener errorListener, ResponseParser<T> responseParser) {
        this.method = i;
        this.url = sanitiseUrl(str);
        this.listener = listener;
        this.errorListener = errorListener;
        this.requestData = map;
        this.responseParser = responseParser;
    }

    public Map<String, String> getRequestData() {
        return this.requestData;
    }

    private String sanitiseUrl(String str) {
        if (str.startsWith("/")) {
            return str;
        }
        return "/" + str;
    }

    public String getMethodString() {
        int i = this.method;
        return i != 0 ? i != 1 ? "" : "POST" : "GET";
    }

    public int getSequence() {
        Integer num = this.sequence;
        if (num == null) {
            throw new IllegalStateException("getSequence called before setSequence");
        }
        return num.intValue();
    }

    public Map<String, String> getHeaders() {
        Map<String, String> commonHeaders = HeaderUtil.getCommonHeaders();
        int i = this.method;
        if (i == 0) {
            String etag = InfoModelFactory.getInstance().sdkInfoModel.getEtag(this.url);
            if (!TextUtils.isEmpty(etag)) {
                commonHeaders.put("If-None-Match", etag);
            }
        } else if (i == 1) {
            commonHeaders.put("Content-type", "application/x-www-form-urlencoded");
        }
        return commonHeaders;
    }

    private String getApiUri() {
        return "/api/lib/3" + this.url;
    }

    public String getFullUri() throws InstallException {
        if (!InfoModelFactory.getInstance().appInfoModel.isInstalled()) {
            throw new InstallException("Install information missing");
        }
        return NetworkConstants.scheme + InfoModelFactory.getInstance().appInfoModel.domainName + getApiUri();
    }

    public URL getParsedURL() throws InstallException, MalformedURLException {
        String fullUri = getFullUri();
        if (this.method == 0) {
            fullUri = fullUri + "?" + encodeGetParameters(addAuth());
        }
        return new URL(fullUri);
    }

    private Map<String, String> addAuth() throws InstallException {
        HashMap map;
        String str;
        String string;
        String apiUri = getApiUri();
        if (this.requestData != null) {
            map = new HashMap(this.requestData);
        } else {
            map = new HashMap();
        }
        if (!InfoModelFactory.getInstance().appInfoModel.isInstalled()) {
            throw new InstallException("appId Missing");
        }
        map.put("platform-id", InfoModelFactory.getInstance().appInfoModel.platformId);
        map.put("method", getMethodString());
        map.put(ShareConstants.MEDIA_URI, apiUri);
        String currentTimestamp = TimeUtil.getCurrentTimestamp();
        if (SchemaUtil.validateTimestamp(currentTimestamp)) {
            map.put(DataBaseEventsStorage.EventEntry.COLUMN_NAME_TIMESTAMP, currentTimestamp);
        }
        ArrayList<String> arrayList = new ArrayList(map.keySet());
        ArrayList arrayList2 = new ArrayList();
        Collections.sort(arrayList);
        for (String str2 : arrayList) {
            if (!str2.equals("screenshot") && !str2.equals("meta") && (string = StringUtil.toString(map.get(str2))) != null) {
                arrayList2.add(str2 + Constants.RequestParameters.EQUAL + string);
            }
        }
        try {
            str = InfoModelFactory.getInstance().appInfoModel.apiKey;
        } catch (GeneralSecurityException unused) {
        }
        if (!InfoModelFactory.getInstance().appInfoModel.isInstalled()) {
            throw new InstallException("Install information missing");
        }
        map.put("signature", HelpshiftContext.getCoreApi().getCryptoDM().getSignature(TextUtils.join(Constants.RequestParameters.AMPERSAND, arrayList2), str));
        map.remove("method");
        map.remove(ShareConstants.MEDIA_URI);
        return map;
    }

    private String encodeGetParameters(Map<String, String> map) {
        ArrayList arrayList = new ArrayList();
        for (String str : new ArrayList(map.keySet())) {
            arrayList.add(str + Constants.RequestParameters.EQUAL + Uri.encode(map.get(str)));
        }
        return TextUtils.join(Constants.RequestParameters.AMPERSAND, arrayList);
    }

    private List<NameValuePair> encodePostParameters(Map<String, String> map) {
        ArrayList<String> arrayList = new ArrayList(map.keySet());
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        for (String str : arrayList) {
            String string = StringUtil.toString(map.get(str));
            if (string != null) {
                arrayList2.add(new NameValuePair(str, string));
            }
        }
        return arrayList2;
    }

    public String getPOSTParametersQuery() throws InstallException {
        StringBuilder sb = new StringBuilder();
        boolean z = true;
        for (NameValuePair nameValuePair : encodePostParameters(addAuth())) {
            if (z) {
                z = false;
            } else {
                sb.append(Constants.RequestParameters.AMPERSAND);
            }
            try {
                sb.append(URLEncoder.encode(nameValuePair.name, DownloadManager.UTF8_CHARSET));
                sb.append(Constants.RequestParameters.EQUAL);
                sb.append(URLEncoder.encode(nameValuePair.value, DownloadManager.UTF8_CHARSET));
            } catch (UnsupportedEncodingException e) {
                HSLogger.w(TAG, "Exception Unsupported Encoding", e);
            }
        }
        return sb.toString();
    }

    public void markDelivered() {
        this.responseDelivered = true;
    }

    public boolean hasHadResponseDelivered() {
        return this.responseDelivered;
    }

    protected <T> Response<T> parseNetworkResponse(NetworkResponse networkResponse) {
        return this.responseParser.parseResponse(networkResponse);
    }

    public <T> void deliverResponse(T t) {
        this.listener.onResponse(t, Integer.valueOf(getSequence()));
    }

    public void deliverError(NetworkError networkError) {
        Response.ErrorListener errorListener = this.errorListener;
        if (errorListener != null) {
            errorListener.onErrorResponse(networkError, Integer.valueOf(getSequence()));
        }
    }

    public boolean isDoOutput() {
        return this.method == 1;
    }

    public String toString() {
        return this.url + " " + TAG + "  " + this.sequence;
    }
}
