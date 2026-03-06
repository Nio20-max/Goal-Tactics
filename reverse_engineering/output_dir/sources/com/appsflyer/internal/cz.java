package com.appsflyer.internal;

import android.content.Context;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public abstract class cz extends dd {
    cz(String str, Runnable runnable) {
        super(str, runnable);
    }

    final void values(Context context, aw<Map<String, Object>> awVar) {
        if (ac.AFInAppEventParameterName().valueOf(ac.AFInAppEventType(context), false) > 0 || !awVar.values()) {
            return;
        }
        new Thread(awVar.AFInAppEventType).start();
        values();
    }
}
