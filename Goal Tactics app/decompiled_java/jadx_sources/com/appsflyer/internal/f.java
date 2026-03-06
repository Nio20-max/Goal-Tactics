package com.appsflyer.internal;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.appsflyer.AFLogger;
import com.appsflyer.deeplink.DeepLinkListener;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class f {
    static volatile boolean AFInAppEventParameterName;
    static final int AFInAppEventType = (int) TimeUnit.SECONDS.toMillis(2);
    static String[] AFKeystoreWrapper;
    static String[] AFLogger$LogLevel;
    private static f AppsFlyer2dXConversionCallback;
    public static Intent valueOf;
    public String AFVersionDeclaration;
    public Map<String, String> getLevel;
    public List<List<String>> init = new ArrayList();
    public DeepLinkListener values;

    public static f valueOf() {
        if (AppsFlyer2dXConversionCallback == null) {
            AppsFlyer2dXConversionCallback = new f();
        }
        return AppsFlyer2dXConversionCallback;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x009c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    final void valueOf(java.util.Map<java.lang.String, java.lang.Object> r4, com.appsflyer.internal.cl r5, android.content.Intent r6, com.appsflyer.internal.bv r7, android.content.Context r8) {
        /*
            r3 = this;
            android.content.SharedPreferences r0 = com.appsflyer.internal.ac.AFInAppEventType(r8)
            boolean r4 = r3.values(r6, r8, r4)
            java.lang.String r6 = "ddl_sent"
            if (r4 != 0) goto Lab
            com.appsflyer.deeplink.DeepLinkListener r4 = r3.values
            if (r4 == 0) goto Lab
            com.appsflyer.internal.ac r4 = com.appsflyer.internal.ac.AFInAppEventParameterName()
            r1 = 0
            int r4 = r4.valueOf(r0, r1)
            if (r4 != 0) goto Lab
            boolean r4 = r0.getBoolean(r6, r1)
            if (r4 != 0) goto Lab
            com.appsflyer.internal.ar r4 = new com.appsflyer.internal.ar
            r4.<init>(r8, r5)
            java.lang.String r5 = "[DDL] start"
            com.appsflyer.AFLogger.AFInAppEventParameterName(r5)
            java.util.concurrent.FutureTask r5 = new java.util.concurrent.FutureTask
            com.appsflyer.internal.ar$4 r8 = new com.appsflyer.internal.ar$4
            r8.<init>()
            r5.<init>(r8)
            java.lang.Thread r8 = new java.lang.Thread
            r8.<init>(r5)
            r8.start()
            r8 = 0
            long r0 = com.appsflyer.internal.ar.onInstallConversionDataLoadedNative     // Catch: java.util.concurrent.TimeoutException -> L53 java.lang.InterruptedException -> L87 java.util.concurrent.ExecutionException -> L89
            java.util.concurrent.TimeUnit r2 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch: java.util.concurrent.TimeoutException -> L53 java.lang.InterruptedException -> L87 java.util.concurrent.ExecutionException -> L89
            java.lang.Object r5 = r5.get(r0, r2)     // Catch: java.util.concurrent.TimeoutException -> L53 java.lang.InterruptedException -> L87 java.util.concurrent.ExecutionException -> L89
            com.appsflyer.deeplink.DeepLinkResult r5 = (com.appsflyer.deeplink.DeepLinkResult) r5     // Catch: java.util.concurrent.TimeoutException -> L53 java.lang.InterruptedException -> L87 java.util.concurrent.ExecutionException -> L89
            com.appsflyer.internal.cl r0 = r4.onAppOpenAttributionNative     // Catch: java.util.concurrent.TimeoutException -> L53 java.lang.InterruptedException -> L87 java.util.concurrent.ExecutionException -> L89
            long r1 = com.appsflyer.internal.ar.onInstallConversionDataLoadedNative     // Catch: java.util.concurrent.TimeoutException -> L53 java.lang.InterruptedException -> L87 java.util.concurrent.ExecutionException -> L89
            r0.AFInAppEventType(r5, r1)     // Catch: java.util.concurrent.TimeoutException -> L53 java.lang.InterruptedException -> L87 java.util.concurrent.ExecutionException -> L89
            com.appsflyer.internal.ao.AFInAppEventType(r5)     // Catch: java.util.concurrent.TimeoutException -> L53 java.lang.InterruptedException -> L87 java.util.concurrent.ExecutionException -> L89
            goto Lab
        L53:
            java.lang.StringBuilder r5 = new java.lang.StringBuilder
            java.lang.String r0 = "[DDL] Timeout, didn't manage to find deferred deep link after "
            r5.<init>(r0)
            int r0 = r4.onAttributionFailureNative
            r5.append(r0)
            java.lang.String r0 = " attempt(s) within "
            r5.append(r0)
            long r0 = com.appsflyer.internal.ar.onInstallConversionDataLoadedNative
            r5.append(r0)
            java.lang.String r0 = " milliseconds"
            r5.append(r0)
            java.lang.String r5 = r5.toString()
            com.appsflyer.AFLogger.AFInAppEventParameterName(r5)
            com.appsflyer.deeplink.DeepLinkResult r5 = new com.appsflyer.deeplink.DeepLinkResult
            com.appsflyer.deeplink.DeepLinkResult$Error r0 = com.appsflyer.deeplink.DeepLinkResult.Error.TIMEOUT
            r5.<init>(r8, r0)
            com.appsflyer.internal.cl r4 = r4.onAppOpenAttributionNative
            long r0 = com.appsflyer.internal.ar.onInstallConversionDataLoadedNative
            r4.AFInAppEventType(r5, r0)
            com.appsflyer.internal.ao.AFInAppEventType(r5)
            goto Lab
        L87:
            r5 = move-exception
            goto L8a
        L89:
            r5 = move-exception
        L8a:
            java.lang.String r0 = "[DDL] Error occurred"
            com.appsflyer.AFLogger.AFInAppEventParameterName(r0, r5)
            com.appsflyer.deeplink.DeepLinkResult r0 = new com.appsflyer.deeplink.DeepLinkResult
            java.lang.Throwable r5 = r5.getCause()
            boolean r5 = r5 instanceof java.io.IOException
            if (r5 == 0) goto L9c
            com.appsflyer.deeplink.DeepLinkResult$Error r5 = com.appsflyer.deeplink.DeepLinkResult.Error.NETWORK
            goto L9e
        L9c:
            com.appsflyer.deeplink.DeepLinkResult$Error r5 = com.appsflyer.deeplink.DeepLinkResult.Error.UNEXPECTED
        L9e:
            r0.<init>(r8, r5)
            com.appsflyer.internal.cl r4 = r4.onAppOpenAttributionNative
            long r1 = com.appsflyer.internal.ar.onInstallConversionDataLoadedNative
            r4.AFInAppEventType(r0, r1)
            com.appsflyer.internal.ao.AFInAppEventType(r0)
        Lab:
            r4 = 1
            r7.AFInAppEventType(r6, r4)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.f.valueOf(java.util.Map, com.appsflyer.internal.cl, android.content.Intent, com.appsflyer.internal.bv, android.content.Context):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean values(String str) {
        if (AFKeystoreWrapper == null || str.contains("af_tranid=")) {
            return false;
        }
        StringBuilder sb = new StringBuilder("Validate if link ");
        sb.append(str);
        sb.append(" belongs to ESP domains: ");
        sb.append(Arrays.asList(AFKeystoreWrapper));
        AFLogger.AFKeystoreWrapper(sb.toString());
        try {
            return Arrays.asList(AFKeystoreWrapper).contains(new URL(str).getHost());
        } catch (MalformedURLException unused) {
            return false;
        }
    }

    final void AFInAppEventType(final Context context, final Map<String, Object> map, final Uri uri) {
        if (values(uri.toString())) {
            AFInAppEventParameterName = true;
            if (k.values == null) {
                k.values = new k();
            }
            k kVar = k.values;
            if (kVar.valueOf == null) {
                kVar.valueOf = Executors.newSingleThreadScheduledExecutor(kVar.AFInAppEventType);
            }
            kVar.valueOf.execute(new Runnable() { // from class: com.appsflyer.internal.f.4
                @Override // java.lang.Runnable
                public final void run() {
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    String string = uri.toString();
                    ArrayList arrayList = new ArrayList();
                    Integer num = null;
                    String str = null;
                    int i = 0;
                    while (i < 5) {
                        Map<String, Object> mapAFInAppEventType = AFInAppEventType(Uri.parse(string));
                        String str2 = (String) mapAFInAppEventType.get("res");
                        Integer num2 = (Integer) mapAFInAppEventType.get("status");
                        String str3 = (String) mapAFInAppEventType.get("error");
                        if (str2 == null || !f.values(str2)) {
                            str = str3;
                            string = str2;
                            num = num2;
                            break;
                        } else {
                            if (i < 4) {
                                arrayList.add(str2);
                            }
                            i++;
                            str = str3;
                            string = str2;
                            num = num2;
                        }
                    }
                    HashMap map2 = new HashMap();
                    map2.put("res", string != null ? string : "");
                    map2.put("status", Integer.valueOf(num != null ? num.intValue() : -1));
                    if (str != null) {
                        map2.put("error", str);
                    }
                    if (!arrayList.isEmpty()) {
                        map2.put("redirects", arrayList);
                    }
                    map2.put("latency", Long.valueOf(System.currentTimeMillis() - jCurrentTimeMillis));
                    synchronized (map) {
                        map.put("af_deeplink_r", map2);
                        map.put("af_deeplink", uri.toString());
                    }
                    ac.AFInAppEventParameterName().AFInAppEventType(context, map, string != null ? Uri.parse(string) : uri);
                    f.AFInAppEventParameterName = false;
                }

                private static Map<String, Object> AFInAppEventType(Uri uri2) {
                    HashMap map2 = new HashMap();
                    try {
                        StringBuilder sb = new StringBuilder("ESP deeplink resolving is started: ");
                        sb.append(uri2.toString());
                        AFLogger.AFInAppEventParameterName(sb.toString());
                        HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(uri2.toString()).openConnection();
                        httpURLConnection.setInstanceFollowRedirects(false);
                        httpURLConnection.setReadTimeout(f.AFInAppEventType);
                        httpURLConnection.setConnectTimeout(f.AFInAppEventType);
                        httpURLConnection.setRequestProperty("User-agent", "Dalvik/2.1.0 (Linux; U; Android 6.0.1; Nexus 5 Build/M4B30Z)");
                        httpURLConnection.setRequestProperty("af-esp", "6.5.4");
                        int responseCode = httpURLConnection.getResponseCode();
                        map2.put("status", Integer.valueOf(responseCode));
                        if (300 <= responseCode && responseCode <= 305) {
                            map2.put("res", httpURLConnection.getHeaderField("Location"));
                        }
                        httpURLConnection.disconnect();
                        AFLogger.AFInAppEventParameterName("ESP deeplink resolving is finished");
                    } catch (Throwable th) {
                        map2.put("error", th.getLocalizedMessage());
                        AFLogger.valueOf(th.getMessage(), th);
                    }
                    return map2;
                }
            });
        } else {
            ac.AFInAppEventParameterName().AFInAppEventType(context, map, uri);
        }
        valueOf = null;
    }

    private Uri AFInAppEventParameterName(Object obj, Iterator<String> it) {
        while (obj != JSONObject.NULL) {
            if (!it.hasNext()) {
                Uri uri = Uri.parse(obj.toString());
                if (uri == null || uri.getScheme() == null || uri.getHost() == null) {
                    return null;
                }
                return uri;
            }
            try {
                obj = new JSONObject(obj.toString()).get(it.next());
            } catch (JSONException unused) {
                return null;
            }
        }
        return null;
    }

    static Uri AFKeystoreWrapper(Intent intent) {
        if (intent == null || !"android.intent.action.VIEW".equals(intent.getAction())) {
            return null;
        }
        return intent.getData();
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x004e  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x006e A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:63:? A[LOOP:0: B:21:0x0040->B:63:?, LOOP_END, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private boolean values(android.content.Intent r9, android.content.Context r10, java.util.Map<java.lang.String, java.lang.Object> r11) {
        /*
            Method dump skipped, instruction units count: 291
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.f.values(android.content.Intent, android.content.Context, java.util.Map):boolean");
    }
}
