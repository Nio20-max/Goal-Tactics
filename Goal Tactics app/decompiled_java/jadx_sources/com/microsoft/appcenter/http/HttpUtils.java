package com.microsoft.appcenter.http;

import android.content.Context;
import android.os.Build;
import com.microsoft.appcenter.utils.NetworkStateHelper;
import java.io.EOFException;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.SocketException;
import java.net.URL;
import java.net.URLConnection;
import java.net.UnknownHostException;
import java.util.Arrays;
import java.util.Locale;
import java.util.concurrent.RejectedExecutionException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLException;

/* JADX INFO: loaded from: classes2.dex */
public class HttpUtils {
    public static final int CONNECT_TIMEOUT = 10000;
    static final int MAX_CHARACTERS_DISPLAYED_FOR_SECRET = 8;
    public static final int READ_BUFFER_SIZE = 1024;
    public static final int READ_TIMEOUT = 10000;
    public static final int THREAD_STATS_TAG = -667034599;
    public static final int WRITE_BUFFER_SIZE = 1024;
    private static final Class[] RECOVERABLE_EXCEPTIONS = {EOFException.class, InterruptedIOException.class, SocketException.class, UnknownHostException.class, RejectedExecutionException.class};
    private static final Pattern CONNECTION_ISSUE_PATTERN = Pattern.compile("connection (time|reset|abort)|failure in ssl library, usually a protocol error|anchor for certification path not found");
    private static final Pattern TOKEN_VALUE_PATTERN = Pattern.compile(":[^\"]+");
    private static final Pattern API_KEY_PATTERN = Pattern.compile("-[^,]+(,|$)");

    HttpUtils() {
    }

    public static boolean isRecoverableError(Throwable t) {
        String message;
        if (t instanceof HttpException) {
            int statusCode = ((HttpException) t).getHttpResponse().getStatusCode();
            return statusCode >= 500 || statusCode == 408 || statusCode == 429;
        }
        for (Class cls : RECOVERABLE_EXCEPTIONS) {
            if (cls.isAssignableFrom(t.getClass())) {
                return true;
            }
        }
        Throwable cause = t.getCause();
        if (cause != null) {
            for (Class cls2 : RECOVERABLE_EXCEPTIONS) {
                if (cls2.isAssignableFrom(cause.getClass())) {
                    return true;
                }
            }
        }
        return (t instanceof SSLException) && (message = t.getMessage()) != null && CONNECTION_ISSUE_PATTERN.matcher(message.toLowerCase(Locale.US)).find();
    }

    public static String hideSecret(String secret) {
        int length = secret.length() - (secret.length() < 8 ? 0 : 8);
        char[] cArr = new char[length];
        Arrays.fill(cArr, '*');
        return new String(cArr) + secret.substring(length);
    }

    public static String hideApiKeys(String apiKeys) {
        StringBuilder sb = new StringBuilder();
        Matcher matcher = API_KEY_PATTERN.matcher(apiKeys);
        int iEnd = 0;
        while (matcher.find()) {
            sb.append(apiKeys.substring(iEnd, matcher.start()));
            sb.append("-***");
            sb.append(matcher.group(1));
            iEnd = matcher.end();
        }
        if (iEnd < apiKeys.length()) {
            sb.append(apiKeys.substring(iEnd));
        }
        return sb.toString();
    }

    public static String hideTickets(String tickets) {
        return TOKEN_VALUE_PATTERN.matcher(tickets).replaceAll(":***");
    }

    public static HttpClient createHttpClient(Context context) {
        return createHttpClient(context, true);
    }

    public static HttpClient createHttpClient(Context context, boolean compressionEnabled) {
        return new HttpClientRetryer(createHttpClientWithoutRetryer(context, compressionEnabled));
    }

    public static HttpClient createHttpClientWithoutRetryer(Context context, boolean compressionEnabled) {
        return new HttpClientNetworkStateHandler(new DefaultHttpClient(compressionEnabled), NetworkStateHelper.getSharedInstance(context));
    }

    public static HttpsURLConnection createHttpsConnection(URL url) throws IOException {
        if (!"https".equals(url.getProtocol())) {
            throw new IOException("App Center support only HTTPS connection.");
        }
        URLConnection uRLConnectionOpenConnection = url.openConnection();
        if (uRLConnectionOpenConnection instanceof HttpsURLConnection) {
            HttpsURLConnection httpsURLConnection = (HttpsURLConnection) uRLConnectionOpenConnection;
            if (Build.VERSION.SDK_INT <= 21) {
                httpsURLConnection.setSSLSocketFactory(new TLS1_2SocketFactory());
            }
            httpsURLConnection.setConnectTimeout(10000);
            httpsURLConnection.setReadTimeout(10000);
            return httpsURLConnection;
        }
        throw new IOException("App Center supports only HTTPS connection.");
    }
}
