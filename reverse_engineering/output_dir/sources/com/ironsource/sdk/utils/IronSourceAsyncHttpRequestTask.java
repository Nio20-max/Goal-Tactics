package com.ironsource.sdk.utils;

import android.os.AsyncTask;

/* JADX INFO: loaded from: classes2.dex */
public class IronSourceAsyncHttpRequestTask extends AsyncTask<String, Integer, Integer> {
    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:16:0x002a A[PHI: r5
      0x002a: PHI (r5v8 java.net.HttpURLConnection) = (r5v7 java.net.HttpURLConnection), (r5v13 java.net.HttpURLConnection) binds: [B:15:0x0028, B:6:0x0017] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0036  */
    /* JADX WARN: Type inference failed for: r5v10, types: [java.lang.Integer] */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v5, types: [java.net.HttpURLConnection] */
    /* JADX WARN: Type inference failed for: r5v6 */
    @Override // android.os.AsyncTask
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Integer doInBackground(java.lang.String... r5) throws java.lang.Throwable {
        /*
            r4 = this;
            r0 = 0
            java.net.URL r1 = new java.net.URL     // Catch: java.lang.Throwable -> L1c java.lang.Exception -> L21
            r2 = 0
            r5 = r5[r2]     // Catch: java.lang.Throwable -> L1c java.lang.Exception -> L21
            r1.<init>(r5)     // Catch: java.lang.Throwable -> L1c java.lang.Exception -> L21
            java.net.URLConnection r5 = r1.openConnection()     // Catch: java.lang.Throwable -> L1c java.lang.Exception -> L21
            java.net.HttpURLConnection r5 = (java.net.HttpURLConnection) r5     // Catch: java.lang.Throwable -> L1c java.lang.Exception -> L21
            r0 = 3000(0xbb8, float:4.204E-42)
            r5.setConnectTimeout(r0)     // Catch: java.lang.Exception -> L1a java.lang.Throwable -> L33
            r5.getInputStream()     // Catch: java.lang.Exception -> L1a java.lang.Throwable -> L33
            if (r5 == 0) goto L2d
            goto L2a
        L1a:
            r0 = move-exception
            goto L25
        L1c:
            r5 = move-exception
            r3 = r0
            r0 = r5
            r5 = r3
            goto L34
        L21:
            r5 = move-exception
            r3 = r0
            r0 = r5
            r5 = r3
        L25:
            r0.printStackTrace()     // Catch: java.lang.Throwable -> L33
            if (r5 == 0) goto L2d
        L2a:
            r5.disconnect()
        L2d:
            r5 = 1
            java.lang.Integer r5 = java.lang.Integer.valueOf(r5)
            return r5
        L33:
            r0 = move-exception
        L34:
            if (r5 == 0) goto L39
            r5.disconnect()
        L39:
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ironsource.sdk.utils.IronSourceAsyncHttpRequestTask.doInBackground(java.lang.String[]):java.lang.Integer");
    }
}
