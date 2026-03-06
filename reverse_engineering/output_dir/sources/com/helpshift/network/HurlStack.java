package com.helpshift.network;

import android.os.Build;
import com.helpshift.android.commons.downloader.HelpshiftSSLSocketFactory;
import com.helpshift.common.domain.network.NetworkConstants;
import com.helpshift.exceptions.InstallException;
import com.helpshift.network.request.Request;
import com.helpshift.util.HelpshiftContext;
import com.ironsource.sdk.precache.DownloadManager;
import java.io.BufferedInputStream;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.zip.GZIPInputStream;
import javax.net.ssl.HttpsURLConnection;

/* JADX INFO: loaded from: classes2.dex */
public class HurlStack implements HttpStack {
    private static HttpEntity entityFromConnection(HttpURLConnection httpURLConnection, boolean z) {
        InputStream errorStream;
        HttpEntity httpEntity = new HttpEntity();
        try {
            if (z) {
                errorStream = new GZIPInputStream(new BufferedInputStream(httpURLConnection.getInputStream()));
            } else {
                errorStream = new BufferedInputStream(httpURLConnection.getInputStream());
            }
        } catch (IOException unused) {
            errorStream = httpURLConnection.getErrorStream();
        }
        httpEntity.content = errorStream;
        httpEntity.contentLength = httpURLConnection.getContentLength();
        return httpEntity;
    }

    @Override // com.helpshift.network.HttpStack
    public HttpResponse performRequest(Request request) throws Throwable {
        HttpURLConnection httpURLConnection;
        HelpshiftSSLSocketFactory helpshiftSSLSocketFactory;
        URL parsedURL = request.getParsedURL();
        if ("https://".equals(NetworkConstants.scheme)) {
            httpURLConnection = (HttpsURLConnection) parsedURL.openConnection();
            fixSSLSocketProtocols((HttpsURLConnection) httpURLConnection);
        } else {
            httpURLConnection = (HttpURLConnection) parsedURL.openConnection();
        }
        HttpResponse httpResponse = null;
        try {
            configureConnectionForRequest(httpURLConnection, request);
            if (httpURLConnection.getResponseCode() == -1) {
                throw new IOException("Could not retrieve response code from HttpUrlConnection.");
            }
            HttpResponse httpResponse2 = new HttpResponse(new StatusLine(httpURLConnection.getResponseCode(), httpURLConnection.getResponseMessage()));
            try {
                List<String> list = httpURLConnection.getHeaderFields().get("Content-Encoding");
                boolean z = list != null && list.size() > 0 && list.get(0).equalsIgnoreCase("gzip");
                for (Map.Entry<String, List<String>> entry : httpURLConnection.getHeaderFields().entrySet()) {
                    if (entry.getKey() != null) {
                        httpResponse2.addHeader(new Header(entry.getKey(), entry.getValue().get(0)));
                    }
                }
                httpResponse2.setEntity(entityFromConnection(httpURLConnection, z));
                httpResponse2.setHelpshiftSSLSocketFactory(getHelpshiftSSLSocketFactory(httpURLConnection));
                return httpResponse2;
            } catch (Throwable th) {
                th = th;
                httpResponse = httpResponse2;
                if (httpResponse == null && (helpshiftSSLSocketFactory = getHelpshiftSSLSocketFactory(httpURLConnection)) != null) {
                    helpshiftSSLSocketFactory.closeSockets();
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    private HelpshiftSSLSocketFactory getHelpshiftSSLSocketFactory(HttpURLConnection httpURLConnection) {
        if (Build.VERSION.SDK_INT < 16 || Build.VERSION.SDK_INT > 19 || !(httpURLConnection instanceof HttpsURLConnection)) {
            return null;
        }
        HttpsURLConnection httpsURLConnection = (HttpsURLConnection) httpURLConnection;
        if (httpsURLConnection.getSSLSocketFactory() instanceof HelpshiftSSLSocketFactory) {
            return (HelpshiftSSLSocketFactory) httpsURLConnection.getSSLSocketFactory();
        }
        return null;
    }

    private void fixSSLSocketProtocols(HttpsURLConnection httpsURLConnection) {
        if (Build.VERSION.SDK_INT < 16 || Build.VERSION.SDK_INT > 19) {
            return;
        }
        ArrayList arrayList = new ArrayList();
        arrayList.add("TLSv1.2");
        ArrayList arrayList2 = new ArrayList();
        arrayList2.add("SSLv3");
        httpsURLConnection.setSSLSocketFactory(new HelpshiftSSLSocketFactory(httpsURLConnection.getSSLSocketFactory(), arrayList, arrayList2));
    }

    private void configureConnectionForRequest(HttpURLConnection httpURLConnection, Request request) throws InstallException, IOException {
        Map<String, String> headers = request.getHeaders();
        for (String str : headers.keySet()) {
            httpURLConnection.addRequestProperty(str, headers.get(str));
        }
        httpURLConnection.setConnectTimeout(5000);
        httpURLConnection.setReadTimeout(5000);
        httpURLConnection.setUseCaches(false);
        httpURLConnection.setDoInput(true);
        httpURLConnection.setRequestProperty("User-Agent", String.format(Locale.ENGLISH, "Helpshift-%s/%s/%s", HelpshiftContext.getPlatform().getDevice().getPlatformName(), HelpshiftContext.getPlatform().getDevice().getSDKVersion(), HelpshiftContext.getPlatform().getDevice().getOSVersion()));
        httpURLConnection.setRequestMethod(request.getMethodString());
        if (request.method == 1) {
            httpURLConnection.setDoOutput(request.isDoOutput());
            httpURLConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
            OutputStream outputStream = httpURLConnection.getOutputStream();
            BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(outputStream, DownloadManager.UTF8_CHARSET));
            bufferedWriter.write(request.getPOSTParametersQuery());
            bufferedWriter.flush();
            bufferedWriter.close();
            outputStream.close();
        }
    }
}
