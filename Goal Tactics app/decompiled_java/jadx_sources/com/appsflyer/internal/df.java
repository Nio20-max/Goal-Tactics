package com.appsflyer.internal;

import android.content.Context;
import android.database.Cursor;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public final class df extends cz {
    public df(Runnable runnable) {
        super("samsung", runnable);
    }

    @Override // com.appsflyer.internal.dd
    public final void AFInAppEventParameterName(Context context) {
        values(context, new aw<Map<String, Object>>(context, "com.sec.android.app.samsungapps.referrer", "FBA3AF4E7757D9016E953FB3EE4671CA2BD9AF725F9A53D52ED4A38EAAA08901") { // from class: com.appsflyer.internal.df.4
            /* JADX INFO: Access modifiers changed from: private */
            /* JADX WARN: Removed duplicated region for block: B:24:0x00d3 A[PHI: r2
              0x00d3: PHI (r2v1 android.database.Cursor) = (r2v0 android.database.Cursor), (r2v8 android.database.Cursor) binds: [B:23:0x00d1, B:17:0x00bd] A[DONT_GENERATE, DONT_INLINE]] */
            @Override // com.appsflyer.internal.aw
            /* JADX INFO: renamed from: valueOf, reason: merged with bridge method [inline-methods] */
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public java.util.Map<java.lang.String, java.lang.Object> AFInAppEventType() {
                /*
                    Method dump skipped, instruction units count: 280
                    To view this dump add '--comments-level debug' option
                */
                throw new UnsupportedOperationException("Method not decompiled: com.appsflyer.internal.df.AnonymousClass4.AFInAppEventType():java.util.Map");
            }

            private static void AFInAppEventType(String str, Map<String, Object> map, Cursor cursor) {
                int columnIndex = cursor.getColumnIndex(str);
                if (columnIndex == -1) {
                    return;
                }
                long j = cursor.getLong(columnIndex);
                if (j == 0) {
                    return;
                }
                map.put(str, Long.valueOf(j));
            }

            private static void valueOf(String str, Map<String, Object> map, Cursor cursor) {
                String string;
                int columnIndex = cursor.getColumnIndex(str);
                if (columnIndex == -1 || (string = cursor.getString(columnIndex)) == null) {
                    return;
                }
                map.put(str, string);
            }
        });
    }
}
