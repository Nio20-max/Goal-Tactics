package com.appsflyer.internal;

import android.content.Context;
import com.appsflyer.AFLogger;
import com.appsflyer.internal.dd;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public final class ar extends cm {
    public static long onInstallConversionDataLoadedNative = 0;
    private static String onResponseErrorNative = "https://%sdlsdk.%s/v1.0/android/";
    private final List<dd> onAppOpenAttribution;
    public final cl onAppOpenAttributionNative;
    private boolean onAttributionFailure;
    public int onAttributionFailureNative;
    private int onConversionDataFail;
    private int onDeepLinking;
    private final CountDownLatch onResponseNative;

    public ar(Context context, cl clVar) {
        super(null, onResponseErrorNative, Boolean.FALSE, Boolean.TRUE, null, context);
        this.onAppOpenAttribution = new ArrayList();
        this.onResponseNative = new CountDownLatch(1);
        this.onAppOpenAttributionNative = clVar;
    }

    private boolean AFKeystoreWrapper() {
        List list = (List) this.AFInAppEventType.get("referrers");
        return (list != null ? list.size() : 0) < this.onDeepLinking && !this.AFInAppEventType.containsKey("referrers");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0126  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void AFInAppEventParameterName(android.content.Context r10) {
        /*
            Method dump skipped, instruction units count: 465
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ar.AFInAppEventParameterName(android.content.Context):void");
    }

    /* JADX INFO: renamed from: com.appsflyer.internal.ar$2, reason: invalid class name */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] AFInAppEventParameterName;

        static {
            int[] iArr = new int[dd.d.values().length];
            AFInAppEventParameterName = iArr;
            try {
                iArr[dd.d.FINISHED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                AFInAppEventParameterName[dd.d.STARTED.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void values(dd ddVar) {
        if (AFInAppEventType(ddVar)) {
            this.onAppOpenAttribution.add(ddVar);
            this.onResponseNative.countDown();
            StringBuilder sb = new StringBuilder("[DDL] Added non-organic ");
            sb.append(ddVar.getClass().getSimpleName());
            AFLogger.AFInAppEventParameterName(sb.toString());
            return;
        }
        int i = this.onConversionDataFail + 1;
        this.onConversionDataFail = i;
        if (i == this.onDeepLinking) {
            this.onResponseNative.countDown();
        }
    }

    private static boolean AFInAppEventType(dd ddVar) {
        Long l = (Long) ddVar.AFInAppEventType.get("click_ts");
        return l != null && System.currentTimeMillis() - TimeUnit.SECONDS.toMillis(l.longValue()) < TimeUnit.DAYS.toMillis(1L);
    }

    private Map<String, Object> valueOf(final g gVar) {
        Boolean bool;
        boolean z = false;
        if (gVar != null && gVar.values != null && ((bool = gVar.AFKeystoreWrapper) == null || !bool.booleanValue())) {
            z = true;
        }
        if (z) {
            return new HashMap<String, Object>() { // from class: com.appsflyer.internal.ar.1
                {
                    put("type", "unhashed");
                    put("value", gVar.values);
                }
            };
        }
        return null;
    }

    static /* synthetic */ void valueOf(ar arVar) {
        ArrayList<dd> arrayList = new ArrayList();
        for (dd ddVar : ac.AFInAppEventParameterName().valueOf()) {
            if (ddVar != null && ddVar.AFInAppEventParameterName != dd.d.NOT_STARTED) {
                arrayList.add(ddVar);
            }
        }
        arVar.onDeepLinking = arrayList.size();
        for (final dd ddVar2 : arrayList) {
            int i = AnonymousClass2.AFInAppEventParameterName[ddVar2.AFInAppEventParameterName.ordinal()];
            if (i == 1) {
                StringBuilder sb = new StringBuilder("[DDL] ");
                sb.append(ddVar2.AFInAppEventType.get("source"));
                sb.append(" referrer collected earlier");
                AFLogger.AFInAppEventParameterName(sb.toString());
                arVar.values(ddVar2);
            } else if (i == 2) {
                ddVar2.addObserver(new Observer() { // from class: com.appsflyer.internal.ar.5
                    @Override // java.util.Observer
                    public final void update(Observable observable, Object obj) {
                        StringBuilder sb2 = new StringBuilder("[DDL] ");
                        sb2.append(ddVar2.AFInAppEventType.get("source"));
                        sb2.append(" referrer collected via observer");
                        AFLogger.AFInAppEventParameterName(sb2.toString());
                        ar.this.values((dd) observable);
                    }
                });
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:47:0x0171, code lost:
    
        return new com.appsflyer.deeplink.DeepLinkResult(null, null);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static /* synthetic */ com.appsflyer.deeplink.DeepLinkResult AFInAppEventType(com.appsflyer.internal.ar r13, android.content.Context r14) throws org.json.JSONException, java.lang.InterruptedException, java.io.IOException {
        /*
            Method dump skipped, instruction units count: 399
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.ar.AFInAppEventType(com.appsflyer.internal.ar, android.content.Context):com.appsflyer.deeplink.DeepLinkResult");
    }
}
