package com.appsflyer.internal;

import android.content.Context;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public final class cy extends cz {
    public cy(Runnable runnable) {
        super("huawei", runnable);
    }

    @Override // com.appsflyer.internal.dd
    public final void AFInAppEventParameterName(Context context) {
        values(context, new aw<Map<String, Object>>(context, "com.huawei.appmarket.commondata", "FFE391E0EA186D0734ED601E4E70E3224B7309D48E2075BAC46D8C667EAE7212", "3BAF59A2E5331C30675FAB35FF5FFF0D116142D3D4664F1C3CB804068B40614F") { // from class: com.appsflyer.internal.cy.5
            /* JADX INFO: Access modifiers changed from: private */
            /* JADX WARN: Removed duplicated region for block: B:22:0x010f A[PHI: r2
              0x010f: PHI (r2v6 android.database.Cursor) = (r2v5 android.database.Cursor), (r2v7 android.database.Cursor) binds: [B:21:0x010d, B:15:0x00f9] A[DONT_GENERATE, DONT_INLINE]] */
            @Override // com.appsflyer.internal.aw
            /* JADX INFO: renamed from: valueOf, reason: merged with bridge method [inline-methods] */
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public java.util.Map<java.lang.String, java.lang.Object> AFInAppEventType() {
                /*
                    Method dump skipped, instruction units count: 290
                    To view this dump add '--comments-level debug' option
                */
                throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.cy.AnonymousClass5.AFInAppEventType():java.util.Map");
            }
        });
    }
}
