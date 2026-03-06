package com.appsflyer.internal;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public final class ap {
    private long AFInAppEventParameterName;
    private int AFInAppEventType;
    private String AFKeystoreWrapper;
    private cw AFLogger$LogLevel;
    private Throwable AppsFlyer2dXConversionCallback;
    private long valueOf;
    private String values;

    public ap() {
    }

    public static Uri AFKeystoreWrapper(Activity activity) {
        if (Build.VERSION.SDK_INT >= 22) {
            return activity.getReferrer();
        }
        Intent intent = activity.getIntent();
        Uri uri = (Uri) intent.getParcelableExtra("android.intent.extra.REFERRER");
        if (uri != null) {
            return uri;
        }
        String stringExtra = intent.getStringExtra("android.intent.extra.REFERRER_NAME");
        if (stringExtra != null) {
            return Uri.parse(stringExtra);
        }
        return null;
    }

    public ap(String str, String str2, long j, long j2, int i, cw cwVar, Throwable th) {
        this.values = str;
        this.AFKeystoreWrapper = str2;
        this.valueOf = j;
        this.AFInAppEventParameterName = j2;
        this.AFInAppEventType = i;
        this.AFLogger$LogLevel = cwVar;
        this.AppsFlyer2dXConversionCallback = th;
    }

    public final Map<String, Object> AFKeystoreWrapper() {
        HashMap map = new HashMap();
        map.put("cdn_token", this.AFKeystoreWrapper);
        String str = this.values;
        if (str != null) {
            map.put("c_ver", str);
        }
        long j = this.valueOf;
        if (j > 0) {
            map.put("latency", Long.valueOf(j));
        }
        long j2 = this.AFInAppEventParameterName;
        if (j2 > 0) {
            map.put("delay", Long.valueOf(j2));
        }
        int i = this.AFInAppEventType;
        if (i > 0) {
            map.put("res_code", Integer.valueOf(i));
        }
        if (this.AppsFlyer2dXConversionCallback != null) {
            StringBuilder sb = new StringBuilder();
            sb.append(this.AppsFlyer2dXConversionCallback.getClass().getSimpleName());
            sb.append(": ");
            sb.append(this.AppsFlyer2dXConversionCallback.getMessage());
            map.put("error", sb.toString());
        }
        cw cwVar = this.AFLogger$LogLevel;
        if (cwVar != null) {
            map.put("sig", cwVar.toString());
        }
        return map;
    }
}
