package com.helpshift.android.commons.downloader.runnable;

import android.os.Build;
import android.os.Process;
import com.helpshift.android.commons.downloader.HelpshiftSSLSocketFactory;
import com.helpshift.android.commons.downloader.contracts.DownloadRequestedFileInfo;
import com.helpshift.android.commons.downloader.contracts.NetworkAuthDataFetcher;
import com.helpshift.android.commons.downloader.contracts.OnDownloadFinishListener;
import com.helpshift.android.commons.downloader.contracts.OnProgressChangedListener;
import com.helpshift.android.commons.downloader.util.AttachmentNetworkUtil;
import com.helpshift.logger.logmodels.LogExtrasModelProvider;
import com.helpshift.util.HSLogger;
import java.io.Closeable;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.GZIPInputStream;
import javax.net.ssl.HttpsURLConnection;

/* JADX INFO: loaded from: classes.dex */
public abstract class BaseDownloadRunnable implements Runnable {
    protected static final String DOWNLOAD_MANAGER_DB_KEY = "kDownloadManagerCachedFiles";
    private static final String TAG = "Helpshift_DownloadRun";
    private NetworkAuthDataFetcher networkAuthDataFetcher;
    private OnDownloadFinishListener onDownloadFinishListener;
    private OnProgressChangedListener onProgressChangedListener;
    protected DownloadRequestedFileInfo requestInfo;

    protected abstract void clearCache();

    protected abstract long getAlreadyDownloadedBytes() throws FileNotFoundException;

    protected abstract boolean isGzipSupported();

    protected abstract void processHttpResponse(InputStream inputStream, int i, int i2, String str) throws IOException;

    BaseDownloadRunnable(DownloadRequestedFileInfo downloadRequestedFileInfo, NetworkAuthDataFetcher networkAuthDataFetcher, OnProgressChangedListener onProgressChangedListener, OnDownloadFinishListener onDownloadFinishListener) {
        this.requestInfo = downloadRequestedFileInfo;
        this.networkAuthDataFetcher = networkAuthDataFetcher;
        this.onProgressChangedListener = onProgressChangedListener;
        this.onDownloadFinishListener = onDownloadFinishListener;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r13v0, types: [com.helpshift.android.commons.downloader.runnable.BaseDownloadRunnable] */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v11 */
    /* JADX WARN: Type inference failed for: r8v12, types: [int] */
    /* JADX WARN: Type inference failed for: r8v13 */
    /* JADX WARN: Type inference failed for: r8v2 */
    /* JADX WARN: Type inference failed for: r8v22 */
    /* JADX WARN: Type inference failed for: r8v23 */
    /* JADX WARN: Type inference failed for: r8v24 */
    /* JADX WARN: Type inference failed for: r8v3 */
    /* JADX WARN: Type inference failed for: r8v4 */
    /* JADX WARN: Type inference failed for: r8v5, types: [int] */
    /* JADX WARN: Type inference failed for: r8v6, types: [int] */
    /* JADX WARN: Type inference failed for: r8v7, types: [int] */
    /* JADX WARN: Type inference failed for: r8v8, types: [int] */
    /* JADX WARN: Type inference failed for: r8v9, types: [int] */
    @Override // java.lang.Runnable
    public void run() throws Throwable {
        ?? r8;
        HttpURLConnection httpURLConnection;
        int responseCode;
        List<String> list;
        HSLogger.d(TAG, "Starting download : " + this.requestInfo.url);
        Process.setThreadPriority(10);
        try {
            if (Thread.interrupted()) {
                throw new InterruptedException();
            }
            URL urlBuildUrl = buildUrl();
            String protocol = urlBuildUrl.getProtocol();
            if ("https".equals(protocol)) {
                HttpsURLConnection httpsURLConnection = (HttpsURLConnection) urlBuildUrl.openConnection();
                fixSSLSocketProtocols(httpsURLConnection);
                httpURLConnection = httpsURLConnection;
            } else {
                httpURLConnection = (HttpURLConnection) urlBuildUrl.openConnection();
            }
            r8 = protocol;
            if (this.requestInfo.etag != null) {
                r8 = protocol;
                if (!this.requestInfo.etag.isEmpty()) {
                    String str = this.requestInfo.etag;
                    httpURLConnection.setRequestProperty("If-None-Match", str);
                    r8 = str;
                }
            }
            httpURLConnection.setInstanceFollowRedirects(true);
            InputStream inputStream = null;
            try {
                try {
                    try {
                        try {
                            httpURLConnection.setRequestProperty("Range", "bytes=" + getAlreadyDownloadedBytes() + "-");
                            responseCode = httpURLConnection.getResponseCode();
                            try {
                            } catch (IOException e) {
                                e = e;
                                notifyDownloadFinish(false, e, responseCode, "");
                                HSLogger.e(TAG, "Exception in download", e, LogExtrasModelProvider.fromString("route", this.requestInfo.url));
                                if (0 != 0) {
                                    try {
                                        inputStream.close();
                                    } catch (IOException e2) {
                                        notifyDownloadFinish(false, e2, responseCode, "");
                                        HSLogger.e(TAG, "Exception in closing download response", e2, LogExtrasModelProvider.fromString("route", this.requestInfo.url));
                                    }
                                }
                            }
                        } catch (IOException e3) {
                            e = e3;
                            notifyDownloadFinish(false, e, r8, "");
                            HSLogger.e(TAG, "Exception IO", e, LogExtrasModelProvider.fromString("route", this.requestInfo.url));
                            return;
                        }
                    } catch (IOException e4) {
                        e = e4;
                        responseCode = 0;
                    } catch (Throwable th) {
                        th = th;
                        r8 = 0;
                        if (0 != 0) {
                            try {
                                inputStream.close();
                            } catch (IOException e5) {
                                notifyDownloadFinish(false, e5, r8, "");
                                HSLogger.e(TAG, "Exception in closing download response", e5, LogExtrasModelProvider.fromString("route", this.requestInfo.url));
                            }
                        }
                        httpURLConnection.disconnect();
                        throw th;
                    }
                    if (responseCode == 416) {
                        clearCache();
                        throw new IOException("Requested Range Not Satisfiable, failed with 416 status");
                    }
                    if (responseCode == 304) {
                        notifyDownloadFinish(false, null, responseCode, "");
                        httpURLConnection.disconnect();
                        return;
                    }
                    InputStream inputStream2 = httpURLConnection.getInputStream();
                    if (isGzipSupported() && (list = httpURLConnection.getHeaderFields().get("Content-Encoding")) != null && list.size() > 0 && list.get(0).equalsIgnoreCase("gzip")) {
                        inputStream2 = new GZIPInputStream(inputStream2);
                    }
                    int contentLength = httpURLConnection.getContentLength();
                    String headerField = httpURLConnection.getHeaderField("Etag");
                    processHttpResponse(inputStream2, contentLength, responseCode, headerField);
                    Thread.interrupted();
                    if (inputStream2 != null) {
                        try {
                            inputStream2.close();
                        } catch (IOException e6) {
                            notifyDownloadFinish(false, e6, responseCode, headerField);
                            HSLogger.e(TAG, "Exception in closing download response", e6, LogExtrasModelProvider.fromString("route", this.requestInfo.url));
                        }
                    }
                    httpURLConnection.disconnect();
                } catch (InterruptedException e7) {
                    e = e7;
                    notifyDownloadFinish(false, e, r8, "");
                    HSLogger.e(TAG, "Exception Interrupted", e, LogExtrasModelProvider.fromString("route", this.requestInfo.url));
                    Thread.currentThread().interrupt();
                } catch (MalformedURLException e8) {
                    e = e8;
                    notifyDownloadFinish(false, e, r8, "");
                    HSLogger.e(TAG, "MalformedURLException", e, LogExtrasModelProvider.fromString("route", this.requestInfo.url));
                } catch (GeneralSecurityException e9) {
                    e = e9;
                    notifyDownloadFinish(false, e, r8, "");
                    HSLogger.e(TAG, "GeneralSecurityException", e, LogExtrasModelProvider.fromString("route", this.requestInfo.url));
                } catch (Exception e10) {
                    e = e10;
                    notifyDownloadFinish(false, e, r8, "");
                    HSLogger.e(TAG, "Unknown Exception", e, LogExtrasModelProvider.fromString("route", this.requestInfo.url));
                }
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (InterruptedException e11) {
            e = e11;
            r8 = 0;
        } catch (MalformedURLException e12) {
            e = e12;
            r8 = 0;
        } catch (IOException e13) {
            e = e13;
            r8 = 0;
        } catch (GeneralSecurityException e14) {
            e = e14;
            r8 = 0;
        } catch (Exception e15) {
            e = e15;
            r8 = 0;
        }
    }

    private URL buildUrl() throws GeneralSecurityException, MalformedURLException, URISyntaxException {
        if (this.requestInfo.isSecured) {
            return AttachmentNetworkUtil.buildSecureURL(this.requestInfo.url, this.networkAuthDataFetcher);
        }
        return new URL(new URI(this.requestInfo.url).toASCIIString());
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

    void closeFileStream(Closeable closeable) throws IOException {
        if (closeable != null) {
            closeable.close();
        }
    }

    void notifyProgressChange(int i) {
        OnProgressChangedListener onProgressChangedListener = this.onProgressChangedListener;
        if (onProgressChangedListener != null) {
            onProgressChangedListener.onProgressChanged(this.requestInfo.url, i);
        }
    }

    void notifyDownloadFinish(boolean z, Object obj, int i, String str) {
        OnDownloadFinishListener onDownloadFinishListener = this.onDownloadFinishListener;
        if (onDownloadFinishListener != null) {
            onDownloadFinishListener.onDownloadFinish(z, this.requestInfo.url, obj, i, str);
        }
    }
}
