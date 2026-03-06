package com.helpshift.common.platform;

import android.os.Build;
import com.helpshift.android.commons.downloader.HelpshiftSSLSocketFactory;
import com.helpshift.common.platform.network.HTTPTransport;
import com.helpshift.common.platform.network.Request;
import com.helpshift.common.platform.network.Response;
import com.helpshift.common.platform.network.UploadRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSocketFactory;

/* JADX INFO: loaded from: classes2.dex */
public class AndroidHTTPTransport implements HTTPTransport {
    private static final String TAG = "Helpshift_HTTPTrnsport";

    @Override // com.helpshift.common.platform.network.HTTPTransport
    public Response makeRequest(Request request) {
        if (request instanceof UploadRequest) {
            return upload((UploadRequest) request);
        }
        return makeNetworkRequest(request);
    }

    /* JADX WARN: Not initialized variable reg: 6, insn: 0x02c8: MOVE (r7 I:??[OBJECT, ARRAY]) = (r6 I:??[OBJECT, ARRAY]), block:B:211:0x02c7 */
    /* JADX WARN: Removed duplicated region for block: B:216:0x02d4 A[Catch: Exception -> 0x02e0, TryCatch #11 {Exception -> 0x02e0, blocks: (B:214:0x02d0, B:216:0x02d4, B:218:0x02dc), top: B:223:0x02d0 }] */
    /* JADX WARN: Removed duplicated region for block: B:218:0x02dc A[Catch: Exception -> 0x02e0, TRY_LEAVE, TryCatch #11 {Exception -> 0x02e0, blocks: (B:214:0x02d0, B:216:0x02d4, B:218:0x02dc), top: B:223:0x02d0 }] */
    /* JADX WARN: Removed duplicated region for block: B:251:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private com.helpshift.common.platform.network.Response makeNetworkRequest(com.helpshift.common.platform.network.Request r18) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 742
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.common.platform.AndroidHTTPTransport.makeNetworkRequest(com.helpshift.common.platform.network.Request):com.helpshift.common.platform.network.Response");
    }

    private String readInputStream(InputStream inputStream) throws IOException {
        if (inputStream == null) {
            return null;
        }
        InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
        BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
        StringBuilder sb = new StringBuilder();
        while (true) {
            String line = bufferedReader.readLine();
            if (line != null) {
                sb.append(line);
            } else {
                inputStreamReader.close();
                return sb.toString();
            }
        }
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

    private void closeHelpshiftSSLSocketFactorySockets(HttpsURLConnection httpsURLConnection) {
        if (Build.VERSION.SDK_INT < 16 || Build.VERSION.SDK_INT > 19 || httpsURLConnection == null) {
            return;
        }
        SSLSocketFactory sSLSocketFactory = httpsURLConnection.getSSLSocketFactory();
        if (sSLSocketFactory instanceof HelpshiftSSLSocketFactory) {
            ((HelpshiftSSLSocketFactory) sSLSocketFactory).closeSockets();
        }
    }

    private boolean isInvalidKeyForHeader(String str) {
        return "filePath".equals(str) || "originalFileName".equals(str);
    }

    /* JADX WARN: Not initialized variable reg: 10, insn: 0x0610: MOVE (r16 I:??[OBJECT, ARRAY]) = (r10 I:??[OBJECT, ARRAY]), block:B:416:0x060d */
    /* JADX WARN: Not initialized variable reg: 16, insn: 0x060e: MOVE (r19 I:??[OBJECT, ARRAY]) = (r16 I:??[OBJECT, ARRAY]), block:B:416:0x060d */
    /* JADX WARN: Removed duplicated region for block: B:430:0x0622 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:475:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private com.helpshift.common.platform.network.Response upload(com.helpshift.common.platform.network.UploadRequest r21) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1580
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.common.platform.AndroidHTTPTransport.upload(com.helpshift.common.platform.network.UploadRequest):com.helpshift.common.platform.network.Response");
    }
}
