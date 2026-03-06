package com.appsflyer.internal;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import com.facebook.internal.AttributionIdentifiers;

/* JADX INFO: loaded from: classes.dex */
final class ae extends aw<String> {
    ae(Context context) {
        super(context, AttributionIdentifiers.ATTRIBUTION_ID_CONTENT_PROVIDER, "E3F9E1E0CF99D0E56A055BA65E241B3399F7CEA524326B0CDD6EC1327ED0FDC1");
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.appsflyer.internal.aw
    /* JADX INFO: renamed from: valueOf, reason: merged with bridge method [inline-methods] */
    public String AFInAppEventType() throws Throwable {
        Cursor cursorQuery;
        Throwable th;
        try {
            ContentResolver contentResolver = this.AFInAppEventParameterName.getContentResolver();
            StringBuilder sb = new StringBuilder("content://");
            sb.append(this.AFKeystoreWrapper);
            cursorQuery = contentResolver.query(Uri.parse(sb.toString()), new String[]{"aid"}, null, null, null);
            if (cursorQuery != null) {
                try {
                    if (cursorQuery.moveToFirst()) {
                        String string = cursorQuery.getString(cursorQuery.getColumnIndex("aid"));
                        if (cursorQuery != null) {
                            cursorQuery.close();
                        }
                        return string;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (cursorQuery != null) {
                        cursorQuery.close();
                    }
                    throw th;
                }
            }
            if (cursorQuery != null) {
                cursorQuery.close();
            }
            return null;
        } catch (Throwable th3) {
            cursorQuery = null;
            th = th3;
        }
    }

    public final String AFInAppEventParameterName() {
        new Thread(this.AFInAppEventType).start();
        return (String) super.AFKeystoreWrapper();
    }

    @Override // com.appsflyer.internal.aw
    public final /* synthetic */ String AFKeystoreWrapper() {
        new Thread(this.AFInAppEventType).start();
        return (String) super.AFKeystoreWrapper();
    }
}
