package com.ironsource.mediationsdk.server;

import android.text.TextUtils;
import com.ironsource.mediationsdk.IronSourceObject;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import com.microsoft.appcenter.Constants;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

/* JADX INFO: loaded from: classes2.dex */
public class HttpFunctions {
    public static final String ERROR_PREFIX = "ERROR:";
    private static final String SERVER_BAD_REQUEST_ERROR = "Bad Request - 400";
    private static final String SERVER_REQUEST_ENCODING = "UTF-8";
    private static final String SERVER_REQUEST_GET_METHOD = "GET";
    private static final String SERVER_REQUEST_POST_METHOD = "POST";
    private static final int SERVER_REQUEST_TIMEOUT = 15000;

    public static String getStringFromURL(String str) throws Exception {
        return getStringFromURL(str, null);
    }

    public static String getStringFromURL(String str, IronSourceObject.IResponseListener iResponseListener) throws Exception {
        BufferedReader bufferedReader;
        HttpURLConnection httpURLConnection;
        BufferedReader bufferedReader2;
        HttpURLConnection httpURLConnection2 = null;
        try {
            httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
            try {
                httpURLConnection.setReadTimeout(SERVER_REQUEST_TIMEOUT);
                httpURLConnection.setConnectTimeout(SERVER_REQUEST_TIMEOUT);
                httpURLConnection.setRequestMethod("GET");
                httpURLConnection.setDoInput(true);
                httpURLConnection.connect();
                if (httpURLConnection.getResponseCode() == 400) {
                    if (iResponseListener != null) {
                        iResponseListener.onUnrecoverableError(SERVER_BAD_REQUEST_ERROR);
                    }
                    if (httpURLConnection != null) {
                        httpURLConnection.disconnect();
                    }
                    return null;
                }
                bufferedReader2 = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
                try {
                    StringBuilder sb = new StringBuilder();
                    while (true) {
                        String line = bufferedReader2.readLine();
                        if (line == null) {
                            break;
                        }
                        sb.append(line);
                    }
                    String string = sb.toString();
                    if (TextUtils.isEmpty(string)) {
                        if (httpURLConnection != null) {
                            httpURLConnection.disconnect();
                        }
                        bufferedReader2.close();
                        return null;
                    }
                    if (httpURLConnection != null) {
                        httpURLConnection.disconnect();
                    }
                    bufferedReader2.close();
                    return string;
                } catch (Exception unused) {
                    if (httpURLConnection != null) {
                        httpURLConnection.disconnect();
                    }
                    if (bufferedReader2 != null) {
                        bufferedReader2.close();
                    }
                    return null;
                } catch (Throwable th) {
                    httpURLConnection2 = httpURLConnection;
                    bufferedReader = bufferedReader2;
                    th = th;
                    if (httpURLConnection2 != null) {
                        httpURLConnection2.disconnect();
                    }
                    if (bufferedReader != null) {
                        bufferedReader.close();
                    }
                    throw th;
                }
            } catch (Exception unused2) {
                bufferedReader2 = null;
            } catch (Throwable th2) {
                th = th2;
                httpURLConnection2 = httpURLConnection;
                bufferedReader = null;
            }
        } catch (Exception unused3) {
            httpURLConnection = null;
            bufferedReader2 = null;
        } catch (Throwable th3) {
            th = th3;
            bufferedReader = null;
        }
    }

    public static boolean getStringFromPostWithAutho(String str, String str2, String str3, String str4) throws Throwable {
        HttpURLConnection httpURLConnection;
        String base64Auth;
        OutputStream outputStream = null;
        try {
            URL url = new URL(str);
            base64Auth = IronSourceUtils.getBase64Auth(str3, str4);
            httpURLConnection = (HttpURLConnection) url.openConnection();
        } catch (Exception unused) {
            httpURLConnection = null;
        } catch (Throwable th) {
            th = th;
            httpURLConnection = null;
        }
        try {
            httpURLConnection.setReadTimeout(SERVER_REQUEST_TIMEOUT);
            httpURLConnection.setConnectTimeout(SERVER_REQUEST_TIMEOUT);
            httpURLConnection.setRequestMethod("POST");
            httpURLConnection.setRequestProperty(Constants.AUTHORIZATION_HEADER, base64Auth);
            httpURLConnection.setDoInput(true);
            httpURLConnection.setDoOutput(true);
            outputStream = httpURLConnection.getOutputStream();
            BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(outputStream, "UTF-8"));
            bufferedWriter.write(str2);
            bufferedWriter.flush();
            bufferedWriter.close();
            boolean z = httpURLConnection.getResponseCode() == 200;
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (httpURLConnection != null) {
                httpURLConnection.disconnect();
            }
            return z;
        } catch (Exception unused2) {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e2) {
                    e2.printStackTrace();
                }
            }
            if (httpURLConnection != null) {
                httpURLConnection.disconnect();
            }
            return false;
        } catch (Throwable th2) {
            th = th2;
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e3) {
                    e3.printStackTrace();
                }
            }
            if (httpURLConnection != null) {
                httpURLConnection.disconnect();
                throw th;
            }
            throw th;
        }
    }
}
