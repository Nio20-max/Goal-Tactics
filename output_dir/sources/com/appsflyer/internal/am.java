package com.appsflyer.internal;

import com.appsflyer.AFLogger;
import com.ironsource.sdk.constants.Events;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public final class am {
    public final String AFInAppEventType;
    public final long AFKeystoreWrapper;
    private final boolean values;

    public am() {
    }

    public static Map<String, String> AFKeystoreWrapper(Map<String, String> map) {
        HashMap map2 = new HashMap();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            try {
                map2.put(URLEncoder.encode(entry.getKey(), Events.CHARSET_FORMAT), URLEncoder.encode(entry.getValue(), Events.CHARSET_FORMAT));
            } catch (UnsupportedEncodingException e) {
                AFLogger.values(e);
            }
        }
        return map2;
    }

    public am(String str, long j, boolean z) {
        this.AFInAppEventType = str;
        this.AFKeystoreWrapper = j;
        this.values = z;
    }

    public final boolean values() {
        return this.values;
    }
}
