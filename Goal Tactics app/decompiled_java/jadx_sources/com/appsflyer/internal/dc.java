package com.appsflyer.internal;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import com.appsflyer.AFLogger;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;

/* JADX INFO: loaded from: classes.dex */
public final class dc {
    public final FutureTask<List<String>> AFInAppEventParameterName;

    public dc(final Context context) {
        this.AFInAppEventParameterName = new FutureTask<>(new Callable<List<String>>() { // from class: com.appsflyer.internal.dc.1
            /* JADX INFO: Access modifiers changed from: private */
            @Override // java.util.concurrent.Callable
            /* JADX INFO: renamed from: AFInAppEventType, reason: merged with bridge method [inline-methods] */
            public List<String> call() {
                ArrayList arrayList = new ArrayList();
                try {
                    if (Build.VERSION.SDK_INT < 19) {
                        return null;
                    }
                    List<ResolveInfo> listQueryIntentContentProviders = context.getPackageManager().queryIntentContentProviders(new Intent("com.appsflyer.oem.PRELOAD_PROVIDER"), 0);
                    if (listQueryIntentContentProviders != null && !listQueryIntentContentProviders.isEmpty()) {
                        Iterator<ResolveInfo> it = listQueryIntentContentProviders.iterator();
                        while (it.hasNext()) {
                            String str = it.next().providerInfo.authority;
                            StringBuilder sb = new StringBuilder("content://");
                            sb.append(str);
                            sb.append("/preload_id");
                            Cursor cursorQuery = context.getContentResolver().query(Uri.parse(sb.toString()), null, null, null, null);
                            if (cursorQuery != null) {
                                cursorQuery.moveToFirst();
                                arrayList.add(cursorQuery.getString(cursorQuery.getColumnIndex("preload_id")));
                                cursorQuery.close();
                            }
                        }
                    }
                    return null;
                } catch (Exception e) {
                    AFLogger.valueOf(e.getMessage(), e);
                }
                return arrayList;
            }
        });
    }

    public final List<String> values() {
        try {
            if (AFKeystoreWrapper()) {
                return this.AFInAppEventParameterName.get();
            }
        } catch (InterruptedException | ExecutionException unused) {
        }
        return null;
    }

    public final boolean AFKeystoreWrapper() {
        return this.AFInAppEventParameterName.isDone();
    }
}
